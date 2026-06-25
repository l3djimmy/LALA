package androidx.camera.camera2.internal;

import android.graphics.PointF;
import android.graphics.Rect;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.params.MeteringRectangle;
import android.util.Rational;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.Camera2CameraControlImpl;
import androidx.camera.camera2.internal.compat.workaround.MeteringRegionCorrection;
import androidx.camera.core.CameraControl;
import androidx.camera.core.FocusMeteringAction;
import androidx.camera.core.FocusMeteringResult;
import androidx.camera.core.MeteringPoint;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureFailure;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Quirks;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class FocusMeteringControl {
    static final long AUTO_FOCUS_TIMEOUT_DURATION = 5000;
    private static final MeteringRectangle[] EMPTY_RECTANGLES = new MeteringRectangle[0];
    private ScheduledFuture<?> mAutoCancelHandle;
    private ScheduledFuture<?> mAutoFocusTimeoutHandle;
    private final Camera2CameraControlImpl mCameraControl;
    final Executor mExecutor;
    private final MeteringRegionCorrection mMeteringRegionCorrection;
    private final ScheduledExecutorService mScheduler;
    private volatile boolean mIsActive = false;
    private volatile Rational mPreviewAspectRatio = null;
    private boolean mIsInAfAutoMode = false;
    Integer mCurrentAfState = 0;
    long mFocusTimeoutCounter = 0;
    boolean mIsAutoFocusCompleted = false;
    boolean mIsFocusSuccessful = false;
    private int mTemplate = 1;
    private Camera2CameraControlImpl.CaptureResultListener mSessionListenerForFocus = null;
    private Camera2CameraControlImpl.CaptureResultListener mSessionListenerForCancel = null;
    private MeteringRectangle[] mAfRects = EMPTY_RECTANGLES;
    private MeteringRectangle[] mAeRects = EMPTY_RECTANGLES;
    private MeteringRectangle[] mAwbRects = EMPTY_RECTANGLES;
    CallbackToFutureAdapter.Completer<FocusMeteringResult> mRunningActionCompleter = null;
    CallbackToFutureAdapter.Completer<Void> mRunningCancelCompleter = null;

    /* JADX INFO: Access modifiers changed from: package-private */
    public FocusMeteringControl(Camera2CameraControlImpl cameraControl, ScheduledExecutorService scheduler, Executor executor, Quirks cameraQuirks) {
        this.mCameraControl = cameraControl;
        this.mExecutor = executor;
        this.mScheduler = scheduler;
        this.mMeteringRegionCorrection = new MeteringRegionCorrection(cameraQuirks);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setActive(boolean isActive) {
        if (isActive == this.mIsActive) {
            return;
        }
        this.mIsActive = isActive;
        if (!this.mIsActive) {
            cancelFocusAndMeteringWithoutAsyncResult();
        }
    }

    public void setPreviewAspectRatio(Rational previewAspectRatio) {
        this.mPreviewAspectRatio = previewAspectRatio;
    }

    private Rational getDefaultAspectRatio() {
        if (this.mPreviewAspectRatio != null) {
            return this.mPreviewAspectRatio;
        }
        Rect cropSensorRegion = this.mCameraControl.getCropSensorRegion();
        return new Rational(cropSensorRegion.width(), cropSensorRegion.height());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setTemplate(int template) {
        this.mTemplate = template;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addFocusMeteringOptions(Camera2ImplConfig.Builder configBuilder) {
        int afMode;
        if (this.mIsInAfAutoMode) {
            afMode = 1;
        } else {
            afMode = getDefaultAfMode();
        }
        configBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(this.mCameraControl.getSupportedAfMode(afMode)));
        if (this.mAfRects.length != 0) {
            configBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AF_REGIONS, this.mAfRects);
        }
        if (this.mAeRects.length != 0) {
            configBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AE_REGIONS, this.mAeRects);
        }
        if (this.mAwbRects.length != 0) {
            configBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AWB_REGIONS, this.mAwbRects);
        }
    }

    private static boolean isValid(MeteringPoint pt) {
        return pt.getX() >= 0.0f && pt.getX() <= 1.0f && pt.getY() >= 0.0f && pt.getY() <= 1.0f;
    }

    private static PointF getFovAdjustedPoint(MeteringPoint meteringPoint, Rational cropRegionAspectRatio, Rational defaultAspectRatio, int meteringMode, MeteringRegionCorrection correction) {
        Rational fovAspectRatio = defaultAspectRatio;
        if (meteringPoint.getSurfaceAspectRatio() != null) {
            fovAspectRatio = meteringPoint.getSurfaceAspectRatio();
        }
        PointF adjustedPoint = correction.getCorrectedPoint(meteringPoint, meteringMode);
        if (!fovAspectRatio.equals(cropRegionAspectRatio)) {
            if (fovAspectRatio.compareTo(cropRegionAspectRatio) > 0) {
                float heightOfCropRegion = (float) (fovAspectRatio.doubleValue() / cropRegionAspectRatio.doubleValue());
                float top_padding = (float) ((heightOfCropRegion - 1.0d) / 2.0d);
                adjustedPoint.y = (adjustedPoint.y + top_padding) * (1.0f / heightOfCropRegion);
            } else {
                float widthOfCropRegion = (float) (cropRegionAspectRatio.doubleValue() / fovAspectRatio.doubleValue());
                float left_padding = (float) ((widthOfCropRegion - 1.0d) / 2.0d);
                adjustedPoint.x = (adjustedPoint.x + left_padding) * (1.0f / widthOfCropRegion);
            }
        }
        return adjustedPoint;
    }

    private static MeteringRectangle getMeteringRect(MeteringPoint meteringPoint, PointF adjustedPoint, Rect cropRegion) {
        int centerX = (int) (cropRegion.left + (adjustedPoint.x * cropRegion.width()));
        int centerY = (int) (cropRegion.top + (adjustedPoint.y * cropRegion.height()));
        int width = (int) (meteringPoint.getSize() * cropRegion.width());
        int height = (int) (meteringPoint.getSize() * cropRegion.height());
        Rect focusRect = new Rect(centerX - (width / 2), centerY - (height / 2), (width / 2) + centerX, (height / 2) + centerY);
        focusRect.left = rangeLimit(focusRect.left, cropRegion.right, cropRegion.left);
        focusRect.right = rangeLimit(focusRect.right, cropRegion.right, cropRegion.left);
        focusRect.top = rangeLimit(focusRect.top, cropRegion.bottom, cropRegion.top);
        focusRect.bottom = rangeLimit(focusRect.bottom, cropRegion.bottom, cropRegion.top);
        return new MeteringRectangle(focusRect, 1000);
    }

    private static int rangeLimit(int val, int max, int min) {
        return Math.min(Math.max(val, min), max);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ListenableFuture<FocusMeteringResult> startFocusAndMetering(FocusMeteringAction action) {
        return startFocusAndMetering(action, 5000L);
    }

    ListenableFuture<FocusMeteringResult> startFocusAndMetering(final FocusMeteringAction action, final long timeoutDurationMs) {
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda1
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return FocusMeteringControl.this.m51xb5d4fd7e(action, timeoutDurationMs, completer);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$startFocusAndMetering$1$androidx-camera-camera2-internal-FocusMeteringControl  reason: not valid java name */
    public /* synthetic */ Object m51xb5d4fd7e(final FocusMeteringAction action, final long timeoutDurationMs, final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                FocusMeteringControl.this.m50x8c80a83d(completer, action, timeoutDurationMs);
            }
        });
        return "startFocusAndMetering";
    }

    private List<MeteringRectangle> getMeteringRectangles(List<MeteringPoint> meteringPoints, int maxRegionCount, Rational defaultAspectRatio, Rect cropSensorRegion, int meteringMode) {
        if (meteringPoints.isEmpty() || maxRegionCount == 0) {
            return Collections.emptyList();
        }
        List<MeteringRectangle> meteringRectanglesList = new ArrayList<>();
        Rational cropRegionAspectRatio = new Rational(cropSensorRegion.width(), cropSensorRegion.height());
        for (MeteringPoint meteringPoint : meteringPoints) {
            if (meteringRectanglesList.size() == maxRegionCount) {
                break;
            } else if (isValid(meteringPoint)) {
                PointF adjustedPoint = getFovAdjustedPoint(meteringPoint, cropRegionAspectRatio, defaultAspectRatio, meteringMode, this.mMeteringRegionCorrection);
                MeteringRectangle meteringRectangle = getMeteringRect(meteringPoint, adjustedPoint, cropSensorRegion);
                if (meteringRectangle.getWidth() != 0 && meteringRectangle.getHeight() != 0) {
                    meteringRectanglesList.add(meteringRectangle);
                }
            }
        }
        return Collections.unmodifiableList(meteringRectanglesList);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: startFocusAndMeteringInternal */
    public void m50x8c80a83d(CallbackToFutureAdapter.Completer<FocusMeteringResult> completer, FocusMeteringAction action, long timeoutDurationMs) {
        if (!this.mIsActive) {
            completer.setException(new CameraControl.OperationCanceledException("Camera is not active."));
            return;
        }
        Rect cropSensorRegion = this.mCameraControl.getCropSensorRegion();
        Rational defaultAspectRatio = getDefaultAspectRatio();
        List<MeteringRectangle> rectanglesAf = getMeteringRectangles(action.getMeteringPointsAf(), this.mCameraControl.getMaxAfRegionCount(), defaultAspectRatio, cropSensorRegion, 1);
        List<MeteringRectangle> rectanglesAe = getMeteringRectangles(action.getMeteringPointsAe(), this.mCameraControl.getMaxAeRegionCount(), defaultAspectRatio, cropSensorRegion, 2);
        List<MeteringRectangle> rectanglesAwb = getMeteringRectangles(action.getMeteringPointsAwb(), this.mCameraControl.getMaxAwbRegionCount(), defaultAspectRatio, cropSensorRegion, 4);
        if (rectanglesAf.isEmpty() && rectanglesAe.isEmpty() && rectanglesAwb.isEmpty()) {
            completer.setException(new IllegalArgumentException("None of the specified AF/AE/AWB MeteringPoints is supported on this camera."));
            return;
        }
        failActionFuture("Cancelled by another startFocusAndMetering()");
        failCancelFuture("Cancelled by another startFocusAndMetering()");
        disableAutoCancel();
        this.mRunningActionCompleter = completer;
        executeMeteringAction((MeteringRectangle[]) rectanglesAf.toArray(EMPTY_RECTANGLES), (MeteringRectangle[]) rectanglesAe.toArray(EMPTY_RECTANGLES), (MeteringRectangle[]) rectanglesAwb.toArray(EMPTY_RECTANGLES), action, timeoutDurationMs);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void triggerAf(final CallbackToFutureAdapter.Completer<CameraCaptureResult> completer, boolean overrideAeMode) {
        if (!this.mIsActive) {
            if (completer != null) {
                completer.setException(new CameraControl.OperationCanceledException("Camera is not active."));
                return;
            }
            return;
        }
        CaptureConfig.Builder builder = new CaptureConfig.Builder();
        builder.setTemplateType(this.mTemplate);
        builder.setUseRepeatingSurface(true);
        Camera2ImplConfig.Builder configBuilder = new Camera2ImplConfig.Builder();
        configBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AF_TRIGGER, 1);
        if (overrideAeMode) {
            configBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(this.mCameraControl.getSupportedAeMode(1)));
        }
        builder.addImplementationOptions(configBuilder.build());
        builder.addCameraCaptureCallback(new CameraCaptureCallback() { // from class: androidx.camera.camera2.internal.FocusMeteringControl.1
            @Override // androidx.camera.core.impl.CameraCaptureCallback
            public void onCaptureCompleted(CameraCaptureResult cameraCaptureResult) {
                if (completer != null) {
                    completer.set(cameraCaptureResult);
                }
            }

            @Override // androidx.camera.core.impl.CameraCaptureCallback
            public void onCaptureFailed(CameraCaptureFailure failure) {
                if (completer != null) {
                    completer.setException(new CameraControlInternal.CameraControlException(failure));
                }
            }

            @Override // androidx.camera.core.impl.CameraCaptureCallback
            public void onCaptureCancelled() {
                if (completer != null) {
                    completer.setException(new CameraControl.OperationCanceledException("Camera is closed"));
                }
            }
        });
        this.mCameraControl.submitCaptureRequestsInternal(Collections.singletonList(builder.build()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void triggerAePrecapture(final CallbackToFutureAdapter.Completer<Void> completer) {
        if (!this.mIsActive) {
            if (completer != null) {
                completer.setException(new CameraControl.OperationCanceledException("Camera is not active."));
                return;
            }
            return;
        }
        CaptureConfig.Builder builder = new CaptureConfig.Builder();
        builder.setTemplateType(this.mTemplate);
        builder.setUseRepeatingSurface(true);
        Camera2ImplConfig.Builder configBuilder = new Camera2ImplConfig.Builder();
        configBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AE_PRECAPTURE_TRIGGER, 1);
        builder.addImplementationOptions(configBuilder.build());
        builder.addCameraCaptureCallback(new CameraCaptureCallback() { // from class: androidx.camera.camera2.internal.FocusMeteringControl.2
            @Override // androidx.camera.core.impl.CameraCaptureCallback
            public void onCaptureCompleted(CameraCaptureResult cameraCaptureResult) {
                if (completer != null) {
                    completer.set(null);
                }
            }

            @Override // androidx.camera.core.impl.CameraCaptureCallback
            public void onCaptureFailed(CameraCaptureFailure failure) {
                if (completer != null) {
                    completer.setException(new CameraControlInternal.CameraControlException(failure));
                }
            }

            @Override // androidx.camera.core.impl.CameraCaptureCallback
            public void onCaptureCancelled() {
                if (completer != null) {
                    completer.setException(new CameraControl.OperationCanceledException("Camera is closed"));
                }
            }
        });
        this.mCameraControl.submitCaptureRequestsInternal(Collections.singletonList(builder.build()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void cancelAfAeTrigger(boolean cancelAfTrigger, boolean cancelAePrecaptureTrigger) {
        if (!this.mIsActive) {
            return;
        }
        CaptureConfig.Builder builder = new CaptureConfig.Builder();
        builder.setUseRepeatingSurface(true);
        builder.setTemplateType(this.mTemplate);
        Camera2ImplConfig.Builder configBuilder = new Camera2ImplConfig.Builder();
        if (cancelAfTrigger) {
            configBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AF_TRIGGER, 2);
        }
        if (cancelAePrecaptureTrigger) {
            configBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AE_PRECAPTURE_TRIGGER, 2);
        }
        builder.addImplementationOptions(configBuilder.build());
        this.mCameraControl.submitCaptureRequestsInternal(Collections.singletonList(builder.build()));
    }

    private void disableAutoCancel() {
        if (this.mAutoCancelHandle != null) {
            this.mAutoCancelHandle.cancel(true);
            this.mAutoCancelHandle = null;
        }
    }

    private void clearAutoFocusTimeoutHandle() {
        if (this.mAutoFocusTimeoutHandle != null) {
            this.mAutoFocusTimeoutHandle.cancel(true);
            this.mAutoFocusTimeoutHandle = null;
        }
    }

    int getDefaultAfMode() {
        switch (this.mTemplate) {
            case 3:
                return 3;
            default:
                return 4;
        }
    }

    private boolean isAfModeSupported() {
        return this.mCameraControl.getSupportedAfMode(1) == 1;
    }

    void completeActionFuture(boolean isFocusSuccessful) {
        clearAutoFocusTimeoutHandle();
        if (this.mRunningActionCompleter != null) {
            this.mRunningActionCompleter.set(FocusMeteringResult.create(isFocusSuccessful));
            this.mRunningActionCompleter = null;
        }
    }

    private void failActionFuture(String message) {
        this.mCameraControl.removeCaptureResultListener(this.mSessionListenerForFocus);
        if (this.mRunningActionCompleter != null) {
            this.mRunningActionCompleter.setException(new CameraControl.OperationCanceledException(message));
            this.mRunningActionCompleter = null;
        }
    }

    private void failCancelFuture(String message) {
        this.mCameraControl.removeCaptureResultListener(this.mSessionListenerForCancel);
        if (this.mRunningCancelCompleter != null) {
            this.mRunningCancelCompleter.setException(new CameraControl.OperationCanceledException(message));
            this.mRunningCancelCompleter = null;
        }
    }

    private void completeCancelFuture() {
        if (this.mRunningCancelCompleter != null) {
            this.mRunningCancelCompleter.set(null);
            this.mRunningCancelCompleter = null;
        }
    }

    private void executeMeteringAction(MeteringRectangle[] afRects, MeteringRectangle[] aeRects, MeteringRectangle[] awbRects, FocusMeteringAction focusMeteringAction, long timeoutDurationMs) {
        final long sessionUpdateId;
        this.mCameraControl.removeCaptureResultListener(this.mSessionListenerForFocus);
        disableAutoCancel();
        clearAutoFocusTimeoutHandle();
        this.mAfRects = afRects;
        this.mAeRects = aeRects;
        this.mAwbRects = awbRects;
        if (shouldTriggerAF()) {
            this.mIsInAfAutoMode = true;
            this.mIsAutoFocusCompleted = false;
            this.mIsFocusSuccessful = false;
            sessionUpdateId = this.mCameraControl.updateSessionConfigSynchronous();
            triggerAf(null, true);
        } else {
            this.mIsInAfAutoMode = false;
            this.mIsAutoFocusCompleted = true;
            this.mIsFocusSuccessful = false;
            sessionUpdateId = this.mCameraControl.updateSessionConfigSynchronous();
        }
        this.mCurrentAfState = 0;
        final boolean isAfModeSupported = isAfModeSupported();
        this.mSessionListenerForFocus = new Camera2CameraControlImpl.CaptureResultListener() { // from class: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda4
            @Override // androidx.camera.camera2.internal.Camera2CameraControlImpl.CaptureResultListener
            public final boolean onCaptureResult(TotalCaptureResult totalCaptureResult) {
                return FocusMeteringControl.this.m45xfc1c23a9(isAfModeSupported, sessionUpdateId, totalCaptureResult);
            }
        };
        this.mCameraControl.addCaptureResultListener(this.mSessionListenerForFocus);
        final long timeoutId = this.mFocusTimeoutCounter + 1;
        this.mFocusTimeoutCounter = timeoutId;
        Runnable autoFocusTimeoutRunnable = new Runnable() { // from class: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() {
                FocusMeteringControl.this.m47x4ec4ce2b(timeoutId);
            }
        };
        this.mAutoFocusTimeoutHandle = this.mScheduler.schedule(autoFocusTimeoutRunnable, timeoutDurationMs, TimeUnit.MILLISECONDS);
        if (focusMeteringAction.isAutoCancelEnabled()) {
            Runnable autoCancelRunnable = new Runnable() { // from class: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda6
                @Override // java.lang.Runnable
                public final void run() {
                    FocusMeteringControl.this.m49xa16d78ad(timeoutId);
                }
            };
            this.mAutoCancelHandle = this.mScheduler.schedule(autoCancelRunnable, focusMeteringAction.getAutoCancelDurationInMillis(), TimeUnit.MILLISECONDS);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$executeMeteringAction$2$androidx-camera-camera2-internal-FocusMeteringControl  reason: not valid java name */
    public /* synthetic */ boolean m45xfc1c23a9(boolean isAfModeSupported, long sessionUpdateId, TotalCaptureResult result) {
        Integer afState = (Integer) result.get(CaptureResult.CONTROL_AF_STATE);
        if (shouldTriggerAF()) {
            if (!isAfModeSupported || afState == null) {
                this.mIsFocusSuccessful = true;
                this.mIsAutoFocusCompleted = true;
            } else if (this.mCurrentAfState.intValue() == 3) {
                if (afState.intValue() == 4) {
                    this.mIsFocusSuccessful = true;
                    this.mIsAutoFocusCompleted = true;
                } else if (afState.intValue() == 5) {
                    this.mIsFocusSuccessful = false;
                    this.mIsAutoFocusCompleted = true;
                }
            }
        }
        if (this.mIsAutoFocusCompleted && Camera2CameraControlImpl.isSessionUpdated(result, sessionUpdateId)) {
            completeActionFuture(this.mIsFocusSuccessful);
            return true;
        }
        if (!this.mCurrentAfState.equals(afState) && afState != null) {
            this.mCurrentAfState = afState;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$executeMeteringAction$4$androidx-camera-camera2-internal-FocusMeteringControl  reason: not valid java name */
    public /* synthetic */ void m47x4ec4ce2b(final long timeoutId) {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda9
            @Override // java.lang.Runnable
            public final void run() {
                FocusMeteringControl.this.m46x257078ea(timeoutId);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$executeMeteringAction$3$androidx-camera-camera2-internal-FocusMeteringControl  reason: not valid java name */
    public /* synthetic */ void m46x257078ea(long timeoutId) {
        if (timeoutId == this.mFocusTimeoutCounter) {
            this.mIsFocusSuccessful = false;
            completeActionFuture(this.mIsFocusSuccessful);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$executeMeteringAction$6$androidx-camera-camera2-internal-FocusMeteringControl  reason: not valid java name */
    public /* synthetic */ void m49xa16d78ad(final long timeoutId) {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda7
            @Override // java.lang.Runnable
            public final void run() {
                FocusMeteringControl.this.m48x7819236c(timeoutId);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$executeMeteringAction$5$androidx-camera-camera2-internal-FocusMeteringControl  reason: not valid java name */
    public /* synthetic */ void m48x7819236c(long timeoutId) {
        if (timeoutId == this.mFocusTimeoutCounter) {
            cancelFocusAndMeteringWithoutAsyncResult();
        }
    }

    private boolean shouldTriggerAF() {
        return this.mAfRects.length > 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ListenableFuture<Void> cancelFocusAndMetering() {
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda8
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return FocusMeteringControl.this.m43x4f544f7(completer);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$cancelFocusAndMetering$8$androidx-camera-camera2-internal-FocusMeteringControl  reason: not valid java name */
    public /* synthetic */ Object m43x4f544f7(final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                FocusMeteringControl.this.m42xdba0efb6(completer);
            }
        });
        return "cancelFocusAndMetering";
    }

    void cancelFocusAndMeteringWithoutAsyncResult() {
        m42xdba0efb6(null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: cancelFocusAndMeteringInternal */
    public void m42xdba0efb6(CallbackToFutureAdapter.Completer<Void> completer) {
        failCancelFuture("Cancelled by another cancelFocusAndMetering()");
        failActionFuture("Cancelled by cancelFocusAndMetering()");
        this.mRunningCancelCompleter = completer;
        disableAutoCancel();
        clearAutoFocusTimeoutHandle();
        if (shouldTriggerAF()) {
            cancelAfAeTrigger(true, false);
        }
        this.mAfRects = EMPTY_RECTANGLES;
        this.mAeRects = EMPTY_RECTANGLES;
        this.mAwbRects = EMPTY_RECTANGLES;
        this.mIsInAfAutoMode = false;
        final long sessionUpdateId = this.mCameraControl.updateSessionConfigSynchronous();
        if (this.mRunningCancelCompleter != null) {
            final int targetAfMode = this.mCameraControl.getSupportedAfMode(getDefaultAfMode());
            this.mSessionListenerForCancel = new Camera2CameraControlImpl.CaptureResultListener() { // from class: androidx.camera.camera2.internal.FocusMeteringControl$$ExternalSyntheticLambda3
                @Override // androidx.camera.camera2.internal.Camera2CameraControlImpl.CaptureResultListener
                public final boolean onCaptureResult(TotalCaptureResult totalCaptureResult) {
                    return FocusMeteringControl.this.m44x7aba4b15(targetAfMode, sessionUpdateId, totalCaptureResult);
                }
            };
            this.mCameraControl.addCaptureResultListener(this.mSessionListenerForCancel);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$cancelFocusAndMeteringInternal$9$androidx-camera-camera2-internal-FocusMeteringControl  reason: not valid java name */
    public /* synthetic */ boolean m44x7aba4b15(int targetAfMode, long sessionUpdateId, TotalCaptureResult captureResult) {
        Integer afMode = (Integer) captureResult.get(CaptureResult.CONTROL_AF_MODE);
        if (afMode.intValue() == targetAfMode && Camera2CameraControlImpl.isSessionUpdated(captureResult, sessionUpdateId)) {
            completeCancelFuture();
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isFocusMeteringSupported(FocusMeteringAction action) {
        Rect cropSensorRegion = this.mCameraControl.getCropSensorRegion();
        Rational defaultAspectRatio = getDefaultAspectRatio();
        List<MeteringRectangle> rectanglesAf = getMeteringRectangles(action.getMeteringPointsAf(), this.mCameraControl.getMaxAfRegionCount(), defaultAspectRatio, cropSensorRegion, 1);
        List<MeteringRectangle> rectanglesAe = getMeteringRectangles(action.getMeteringPointsAe(), this.mCameraControl.getMaxAeRegionCount(), defaultAspectRatio, cropSensorRegion, 2);
        List<MeteringRectangle> rectanglesAwb = getMeteringRectangles(action.getMeteringPointsAwb(), this.mCameraControl.getMaxAwbRegionCount(), defaultAspectRatio, cropSensorRegion, 4);
        return (rectanglesAf.isEmpty() && rectanglesAe.isEmpty() && rectanglesAwb.isEmpty()) ? false : true;
    }
}
