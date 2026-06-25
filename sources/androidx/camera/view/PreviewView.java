package androidx.camera.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.hardware.display.DisplayManager;
import android.os.Handler;
import android.os.Looper;
import android.util.AttributeSet;
import android.util.Rational;
import android.util.Size;
import android.view.Display;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.FrameLayout;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.Logger;
import androidx.camera.core.MeteringPointFactory;
import androidx.camera.core.Preview;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.ViewPort;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.view.PreviewView;
import androidx.camera.view.PreviewViewImplementation;
import androidx.camera.view.internal.compat.quirk.DeviceQuirks;
import androidx.camera.view.internal.compat.quirk.SurfaceViewNotCroppedByParentQuirk;
import androidx.camera.view.internal.compat.quirk.SurfaceViewStretchedQuirk;
import androidx.camera.view.transform.OutputTransform;
import androidx.core.content.ContextCompat;
import androidx.core.view.ViewCompat;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public final class PreviewView extends FrameLayout {
    static final int DEFAULT_BACKGROUND_COLOR = 17170444;
    private static final ImplementationMode DEFAULT_IMPL_MODE = ImplementationMode.PERFORMANCE;
    private static final String TAG = "PreviewView";
    final AtomicReference<PreviewStreamStateObserver> mActiveStreamStateObserver;
    CameraController mCameraController;
    CameraInfoInternal mCameraInfoInternal;
    private final DisplayRotationListener mDisplayRotationListener;
    PreviewViewImplementation mImplementation;
    ImplementationMode mImplementationMode;
    OnFrameUpdateListener mOnFrameUpdateListener;
    Executor mOnFrameUpdateListenerExecutor;
    private final View.OnLayoutChangeListener mOnLayoutChangeListener;
    final MutableLiveData<StreamState> mPreviewStreamStateLiveData;
    final PreviewTransformation mPreviewTransform;
    PreviewViewMeteringPointFactory mPreviewViewMeteringPointFactory;
    private final ScaleGestureDetector mScaleGestureDetector;
    final Preview.SurfaceProvider mSurfaceProvider;
    private MotionEvent mTouchUpEvent;
    boolean mUseDisplayRotation;

    /* loaded from: classes.dex */
    public interface OnFrameUpdateListener {
        void onFrameUpdate(long j);
    }

    /* loaded from: classes.dex */
    public enum StreamState {
        IDLE,
        STREAMING
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$new$0$androidx-camera-view-PreviewView  reason: not valid java name */
    public /* synthetic */ void m259lambda$new$0$androidxcameraviewPreviewView(View v, int left, int top, int right, int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
        boolean isSizeChanged = (right - left == oldRight - oldLeft && bottom - top == oldBottom - oldTop) ? false : true;
        if (isSizeChanged) {
            redrawPreview();
            attachToControllerIfReady(true);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: androidx.camera.view.PreviewView$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 implements Preview.SurfaceProvider {
        AnonymousClass1() {
        }

        @Override // androidx.camera.core.Preview.SurfaceProvider
        public void onSurfaceRequested(final SurfaceRequest surfaceRequest) {
            PreviewViewImplementation surfaceViewImplementation;
            if (!Threads.isMainThread()) {
                ContextCompat.getMainExecutor(PreviewView.this.getContext()).execute(new Runnable() { // from class: androidx.camera.view.PreviewView$1$$ExternalSyntheticLambda1
                    @Override // java.lang.Runnable
                    public final void run() {
                        PreviewView.AnonymousClass1.this.m260lambda$onSurfaceRequested$0$androidxcameraviewPreviewView$1(surfaceRequest);
                    }
                });
                return;
            }
            Logger.d(PreviewView.TAG, "Surface requested by Preview.");
            final CameraInternal camera = surfaceRequest.getCamera();
            PreviewView.this.mCameraInfoInternal = camera.getCameraInfoInternal();
            surfaceRequest.setTransformationInfoListener(ContextCompat.getMainExecutor(PreviewView.this.getContext()), new SurfaceRequest.TransformationInfoListener() { // from class: androidx.camera.view.PreviewView$1$$ExternalSyntheticLambda2
                @Override // androidx.camera.core.SurfaceRequest.TransformationInfoListener
                public final void onTransformationInfoUpdate(SurfaceRequest.TransformationInfo transformationInfo) {
                    PreviewView.AnonymousClass1.this.m261lambda$onSurfaceRequested$1$androidxcameraviewPreviewView$1(camera, surfaceRequest, transformationInfo);
                }
            });
            if (!PreviewView.shouldReuseImplementation(PreviewView.this.mImplementation, surfaceRequest, PreviewView.this.mImplementationMode)) {
                PreviewView previewView = PreviewView.this;
                if (PreviewView.shouldUseTextureView(surfaceRequest, PreviewView.this.mImplementationMode)) {
                    surfaceViewImplementation = new TextureViewImplementation(PreviewView.this, PreviewView.this.mPreviewTransform);
                } else {
                    surfaceViewImplementation = new SurfaceViewImplementation(PreviewView.this, PreviewView.this.mPreviewTransform);
                }
                previewView.mImplementation = surfaceViewImplementation;
            }
            final PreviewStreamStateObserver streamStateObserver = new PreviewStreamStateObserver(camera.getCameraInfoInternal(), PreviewView.this.mPreviewStreamStateLiveData, PreviewView.this.mImplementation);
            PreviewView.this.mActiveStreamStateObserver.set(streamStateObserver);
            camera.getCameraState().addObserver(ContextCompat.getMainExecutor(PreviewView.this.getContext()), streamStateObserver);
            PreviewView.this.mImplementation.onSurfaceRequested(surfaceRequest, new PreviewViewImplementation.OnSurfaceNotInUseListener() { // from class: androidx.camera.view.PreviewView$1$$ExternalSyntheticLambda3
                @Override // androidx.camera.view.PreviewViewImplementation.OnSurfaceNotInUseListener
                public final void onSurfaceNotInUse() {
                    PreviewView.AnonymousClass1.this.m262lambda$onSurfaceRequested$2$androidxcameraviewPreviewView$1(streamStateObserver, camera);
                }
            });
            if (PreviewView.this.mOnFrameUpdateListener != null && PreviewView.this.mOnFrameUpdateListenerExecutor != null) {
                PreviewView.this.mImplementation.setFrameUpdateListener(PreviewView.this.mOnFrameUpdateListenerExecutor, PreviewView.this.mOnFrameUpdateListener);
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$onSurfaceRequested$0$androidx-camera-view-PreviewView$1  reason: not valid java name */
        public /* synthetic */ void m260lambda$onSurfaceRequested$0$androidxcameraviewPreviewView$1(SurfaceRequest surfaceRequest) {
            PreviewView.this.mSurfaceProvider.onSurfaceRequested(surfaceRequest);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$onSurfaceRequested$1$androidx-camera-view-PreviewView$1  reason: not valid java name */
        public /* synthetic */ void m261lambda$onSurfaceRequested$1$androidxcameraviewPreviewView$1(CameraInternal camera, SurfaceRequest surfaceRequest, SurfaceRequest.TransformationInfo transformationInfo) {
            boolean isFrontCamera;
            Logger.d(PreviewView.TAG, "Preview transformation info updated. " + transformationInfo);
            Integer lensFacing = Integer.valueOf(camera.getCameraInfoInternal().getLensFacing());
            if (lensFacing == null) {
                Logger.w(PreviewView.TAG, "The lens facing is null, probably an external.");
                isFrontCamera = true;
            } else {
                isFrontCamera = lensFacing.intValue() == 0;
            }
            PreviewView.this.mPreviewTransform.setTransformationInfo(transformationInfo, surfaceRequest.getResolution(), isFrontCamera);
            if (transformationInfo.getTargetRotation() == -1 || (PreviewView.this.mImplementation != null && (PreviewView.this.mImplementation instanceof SurfaceViewImplementation))) {
                PreviewView.this.mUseDisplayRotation = true;
            } else {
                PreviewView.this.mUseDisplayRotation = false;
            }
            PreviewView.this.redrawPreview();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$onSurfaceRequested$2$androidx-camera-view-PreviewView$1  reason: not valid java name */
        public /* synthetic */ void m262lambda$onSurfaceRequested$2$androidxcameraviewPreviewView$1(PreviewStreamStateObserver streamStateObserver, CameraInternal camera) {
            if (PreviewView$1$$ExternalSyntheticBackportWithForwarding0.m(PreviewView.this.mActiveStreamStateObserver, streamStateObserver, null)) {
                streamStateObserver.updatePreviewStreamState(StreamState.IDLE);
            }
            streamStateObserver.clear();
            camera.getCameraState().removeObserver(streamStateObserver);
        }
    }

    public PreviewView(Context context) {
        this(context, null);
    }

    public PreviewView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public PreviewView(Context context, AttributeSet attrs, int defStyleAttr) {
        this(context, attrs, defStyleAttr, 0);
    }

    public PreviewView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mImplementationMode = DEFAULT_IMPL_MODE;
        this.mPreviewTransform = new PreviewTransformation();
        this.mUseDisplayRotation = true;
        this.mPreviewStreamStateLiveData = new MutableLiveData<>(StreamState.IDLE);
        this.mActiveStreamStateObserver = new AtomicReference<>();
        this.mPreviewViewMeteringPointFactory = new PreviewViewMeteringPointFactory(this.mPreviewTransform);
        this.mDisplayRotationListener = new DisplayRotationListener();
        this.mOnLayoutChangeListener = new View.OnLayoutChangeListener() { // from class: androidx.camera.view.PreviewView$$ExternalSyntheticLambda0
            @Override // android.view.View.OnLayoutChangeListener
            public final void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
                PreviewView.this.m259lambda$new$0$androidxcameraviewPreviewView(view, i, i2, i3, i4, i5, i6, i7, i8);
            }
        };
        this.mSurfaceProvider = new AnonymousClass1();
        Threads.checkMainThread();
        TypedArray attributes = context.getTheme().obtainStyledAttributes(attrs, R.styleable.PreviewView, defStyleAttr, defStyleRes);
        ViewCompat.saveAttributeDataForStyleable(this, context, R.styleable.PreviewView, attrs, attributes, defStyleAttr, defStyleRes);
        try {
            int scaleTypeId = attributes.getInteger(R.styleable.PreviewView_scaleType, this.mPreviewTransform.getScaleType().getId());
            setScaleType(ScaleType.fromId(scaleTypeId));
            int implementationModeId = attributes.getInteger(R.styleable.PreviewView_implementationMode, DEFAULT_IMPL_MODE.getId());
            setImplementationMode(ImplementationMode.fromId(implementationModeId));
            attributes.recycle();
            this.mScaleGestureDetector = new ScaleGestureDetector(context, new PinchToZoomOnScaleGestureListener());
            if (getBackground() == null) {
                setBackgroundColor(ContextCompat.getColor(getContext(), DEFAULT_BACKGROUND_COLOR));
            }
        } catch (Throwable th) {
            attributes.recycle();
            throw th;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        startListeningToDisplayChange();
        addOnLayoutChangeListener(this.mOnLayoutChangeListener);
        if (this.mImplementation != null) {
            this.mImplementation.onAttachedToWindow();
        }
        attachToControllerIfReady(true);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        removeOnLayoutChangeListener(this.mOnLayoutChangeListener);
        if (this.mImplementation != null) {
            this.mImplementation.onDetachedFromWindow();
        }
        if (this.mCameraController != null) {
            this.mCameraController.clearPreviewSurface();
        }
        stopListeningToDisplayChange();
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (this.mCameraController == null) {
            return super.onTouchEvent(event);
        }
        boolean isSingleTouch = event.getPointerCount() == 1;
        boolean isUpEvent = event.getAction() == 1;
        boolean notALongPress = event.getEventTime() - event.getDownTime() < ((long) ViewConfiguration.getLongPressTimeout());
        if (!isSingleTouch || !isUpEvent || !notALongPress) {
            return this.mScaleGestureDetector.onTouchEvent(event) || super.onTouchEvent(event);
        }
        this.mTouchUpEvent = event;
        performClick();
        return true;
    }

    @Override // android.view.View
    public boolean performClick() {
        if (this.mCameraController != null) {
            float x = this.mTouchUpEvent != null ? this.mTouchUpEvent.getX() : getWidth() / 2.0f;
            float y = this.mTouchUpEvent != null ? this.mTouchUpEvent.getY() : getHeight() / 2.0f;
            this.mCameraController.onTapToFocus(this.mPreviewViewMeteringPointFactory, x, y);
        }
        this.mTouchUpEvent = null;
        return super.performClick();
    }

    public void setImplementationMode(ImplementationMode implementationMode) {
        Threads.checkMainThread();
        this.mImplementationMode = implementationMode;
        if (this.mImplementationMode == ImplementationMode.PERFORMANCE && this.mOnFrameUpdateListener != null) {
            throw new IllegalArgumentException("PERFORMANCE mode doesn't support frame update listener");
        }
    }

    public ImplementationMode getImplementationMode() {
        Threads.checkMainThread();
        return this.mImplementationMode;
    }

    public Preview.SurfaceProvider getSurfaceProvider() {
        Threads.checkMainThread();
        return this.mSurfaceProvider;
    }

    public void setScaleType(ScaleType scaleType) {
        Threads.checkMainThread();
        this.mPreviewTransform.setScaleType(scaleType);
        redrawPreview();
        attachToControllerIfReady(false);
    }

    public ScaleType getScaleType() {
        Threads.checkMainThread();
        return this.mPreviewTransform.getScaleType();
    }

    public MeteringPointFactory getMeteringPointFactory() {
        Threads.checkMainThread();
        return this.mPreviewViewMeteringPointFactory;
    }

    public LiveData<StreamState> getPreviewStreamState() {
        return this.mPreviewStreamStateLiveData;
    }

    public Bitmap getBitmap() {
        Threads.checkMainThread();
        if (this.mImplementation == null) {
            return null;
        }
        return this.mImplementation.getBitmap();
    }

    public ViewPort getViewPort() {
        Threads.checkMainThread();
        if (getDisplay() == null) {
            return null;
        }
        return getViewPort(getDisplay().getRotation());
    }

    public ViewPort getViewPort(int targetRotation) {
        Threads.checkMainThread();
        if (getWidth() == 0 || getHeight() == 0) {
            return null;
        }
        return new ViewPort.Builder(new Rational(getWidth(), getHeight()), targetRotation).setScaleType(getViewPortScaleType()).setLayoutDirection(getLayoutDirection()).build();
    }

    private int getViewPortScaleType() {
        switch (getScaleType()) {
            case FILL_END:
                return 2;
            case FILL_CENTER:
                return 1;
            case FILL_START:
                return 0;
            case FIT_END:
            case FIT_CENTER:
            case FIT_START:
                return 3;
            default:
                throw new IllegalStateException("Unexpected scale type: " + getScaleType());
        }
    }

    void redrawPreview() {
        Threads.checkMainThread();
        if (this.mImplementation != null) {
            updateDisplayRotationIfNeeded();
            this.mImplementation.redrawPreview();
        }
        this.mPreviewViewMeteringPointFactory.recalculate(new Size(getWidth(), getHeight()), getLayoutDirection());
        if (this.mCameraController != null) {
            this.mCameraController.updatePreviewViewTransform(getSensorToViewTransform());
        }
    }

    static boolean shouldReuseImplementation(PreviewViewImplementation implementation, SurfaceRequest surfaceRequest, ImplementationMode mode) {
        return (implementation instanceof SurfaceViewImplementation) && !shouldUseTextureView(surfaceRequest, mode);
    }

    static boolean shouldUseTextureView(SurfaceRequest surfaceRequest, ImplementationMode implementationMode) {
        boolean isLegacyDevice = surfaceRequest.getCamera().getCameraInfoInternal().getImplementationType().equals(CameraInfo.IMPLEMENTATION_TYPE_CAMERA2_LEGACY);
        boolean hasSurfaceViewQuirk = (DeviceQuirks.get(SurfaceViewStretchedQuirk.class) == null && DeviceQuirks.get(SurfaceViewNotCroppedByParentQuirk.class) == null) ? false : true;
        if (isLegacyDevice || hasSurfaceViewQuirk) {
            return true;
        }
        switch (implementationMode) {
            case COMPATIBLE:
                return true;
            case PERFORMANCE:
                return false;
            default:
                throw new IllegalArgumentException("Invalid implementation mode: " + implementationMode);
        }
    }

    void updateDisplayRotationIfNeeded() {
        Display display;
        if (this.mUseDisplayRotation && (display = getDisplay()) != null && this.mCameraInfoInternal != null) {
            this.mPreviewTransform.overrideWithDisplayRotation(this.mCameraInfoInternal.getSensorRotationDegrees(display.getRotation()), display.getRotation());
        }
    }

    public void setFrameUpdateListener(Executor executor, OnFrameUpdateListener listener) {
        if (this.mImplementationMode == ImplementationMode.PERFORMANCE) {
            throw new IllegalArgumentException("PERFORMANCE mode doesn't support frame update listener");
        }
        this.mOnFrameUpdateListener = listener;
        this.mOnFrameUpdateListenerExecutor = executor;
        if (this.mImplementation != null) {
            this.mImplementation.setFrameUpdateListener(executor, listener);
        }
    }

    /* loaded from: classes.dex */
    public enum ImplementationMode {
        PERFORMANCE(0),
        COMPATIBLE(1);
        
        private final int mId;

        ImplementationMode(int id) {
            this.mId = id;
        }

        int getId() {
            return this.mId;
        }

        static ImplementationMode fromId(int id) {
            ImplementationMode[] values;
            for (ImplementationMode implementationMode : values()) {
                if (implementationMode.mId == id) {
                    return implementationMode;
                }
            }
            throw new IllegalArgumentException("Unknown implementation mode id " + id);
        }
    }

    /* loaded from: classes.dex */
    public enum ScaleType {
        FILL_START(0),
        FILL_CENTER(1),
        FILL_END(2),
        FIT_START(3),
        FIT_CENTER(4),
        FIT_END(5);
        
        private final int mId;

        ScaleType(int id) {
            this.mId = id;
        }

        int getId() {
            return this.mId;
        }

        static ScaleType fromId(int id) {
            ScaleType[] values;
            for (ScaleType scaleType : values()) {
                if (scaleType.mId == id) {
                    return scaleType;
                }
            }
            throw new IllegalArgumentException("Unknown scale type id " + id);
        }
    }

    /* loaded from: classes.dex */
    class PinchToZoomOnScaleGestureListener extends ScaleGestureDetector.SimpleOnScaleGestureListener {
        PinchToZoomOnScaleGestureListener() {
        }

        @Override // android.view.ScaleGestureDetector.SimpleOnScaleGestureListener, android.view.ScaleGestureDetector.OnScaleGestureListener
        public boolean onScale(ScaleGestureDetector detector) {
            if (PreviewView.this.mCameraController != null) {
                PreviewView.this.mCameraController.onPinchToZoom(detector.getScaleFactor());
                return true;
            }
            return true;
        }
    }

    public void setController(CameraController cameraController) {
        Threads.checkMainThread();
        if (this.mCameraController != null && this.mCameraController != cameraController) {
            this.mCameraController.clearPreviewSurface();
        }
        this.mCameraController = cameraController;
        attachToControllerIfReady(false);
    }

    public CameraController getController() {
        Threads.checkMainThread();
        return this.mCameraController;
    }

    public OutputTransform getOutputTransform() {
        Threads.checkMainThread();
        Matrix matrix = null;
        try {
            matrix = this.mPreviewTransform.getSurfaceToPreviewViewMatrix(new Size(getWidth(), getHeight()), getLayoutDirection());
        } catch (IllegalStateException e) {
        }
        Rect surfaceCropRect = this.mPreviewTransform.getSurfaceCropRect();
        if (matrix == null || surfaceCropRect == null) {
            Logger.d(TAG, "Transform info is not ready");
            return null;
        }
        matrix.preConcat(TransformUtils.getNormalizedToBuffer(surfaceCropRect));
        if (this.mImplementation instanceof TextureViewImplementation) {
            matrix.postConcat(getMatrix());
        } else if (!getMatrix().isIdentity()) {
            Logger.w(TAG, "PreviewView needs to be in COMPATIBLE mode for the transform to work correctly.");
        }
        return new OutputTransform(matrix, new Size(surfaceCropRect.width(), surfaceCropRect.height()));
    }

    public Matrix getSensorToViewTransform() {
        Threads.checkMainThread();
        return this.mPreviewTransform.getSensorToViewTransform(new Size(getWidth(), getHeight()), getLayoutDirection());
    }

    private void attachToControllerIfReady(boolean shouldFailSilently) {
        Threads.checkMainThread();
        ViewPort viewPort = getViewPort();
        if (this.mCameraController != null && viewPort != null && isAttachedToWindow()) {
            try {
                this.mCameraController.attachPreviewSurface(getSurfaceProvider(), viewPort);
            } catch (IllegalStateException ex) {
                if (shouldFailSilently) {
                    Logger.e(TAG, ex.toString(), ex);
                    return;
                }
                throw ex;
            }
        }
    }

    private void startListeningToDisplayChange() {
        DisplayManager displayManager = getDisplayManager();
        if (displayManager == null) {
            return;
        }
        displayManager.registerDisplayListener(this.mDisplayRotationListener, new Handler(Looper.getMainLooper()));
    }

    private void stopListeningToDisplayChange() {
        DisplayManager displayManager = getDisplayManager();
        if (displayManager == null) {
            return;
        }
        displayManager.unregisterDisplayListener(this.mDisplayRotationListener);
    }

    private DisplayManager getDisplayManager() {
        Context context = getContext();
        if (context == null) {
            return null;
        }
        return (DisplayManager) context.getApplicationContext().getSystemService("display");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public class DisplayRotationListener implements DisplayManager.DisplayListener {
        DisplayRotationListener() {
        }

        @Override // android.hardware.display.DisplayManager.DisplayListener
        public void onDisplayAdded(int displayId) {
        }

        @Override // android.hardware.display.DisplayManager.DisplayListener
        public void onDisplayRemoved(int displayId) {
        }

        @Override // android.hardware.display.DisplayManager.DisplayListener
        public void onDisplayChanged(int displayId) {
            Display display = PreviewView.this.getDisplay();
            if (display != null && display.getDisplayId() == displayId) {
                PreviewView.this.redrawPreview();
            }
        }
    }
}
