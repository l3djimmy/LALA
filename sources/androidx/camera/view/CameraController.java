package androidx.camera.view;

import android.content.Context;
import android.graphics.Matrix;
import android.os.Build;
import android.util.Size;
import androidx.arch.core.util.Function;
import androidx.camera.core.Camera;
import androidx.camera.core.CameraControl;
import androidx.camera.core.CameraEffect;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.CameraInfoUnavailableException;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.FocusMeteringAction;
import androidx.camera.core.FocusMeteringResult;
import androidx.camera.core.ImageAnalysis;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.Logger;
import androidx.camera.core.MeteringPoint;
import androidx.camera.core.MeteringPointFactory;
import androidx.camera.core.Preview;
import androidx.camera.core.UseCaseGroup;
import androidx.camera.core.ViewPort;
import androidx.camera.core.ZoomState;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.lifecycle.ProcessCameraProvider;
import androidx.camera.video.FileDescriptorOutputOptions;
import androidx.camera.video.FileOutputOptions;
import androidx.camera.video.MediaStoreOutputOptions;
import androidx.camera.video.OutputOptions;
import androidx.camera.video.PendingRecording;
import androidx.camera.video.QualitySelector;
import androidx.camera.video.Recorder;
import androidx.camera.video.Recording;
import androidx.camera.video.VideoCapture;
import androidx.camera.video.VideoRecordEvent;
import androidx.camera.view.CameraController;
import androidx.camera.view.RotationProvider;
import androidx.camera.view.video.AudioConfig;
import androidx.core.content.ContextCompat;
import androidx.core.content.PermissionChecker;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import com.google.common.util.concurrent.ListenableFuture;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public abstract class CameraController {
    private static final float AE_SIZE = 0.25f;
    private static final float AF_SIZE = 0.16666667f;
    private static final String CAMERA_NOT_ATTACHED = "Use cases not attached to camera.";
    private static final String CAMERA_NOT_INITIALIZED = "Camera not initialized.";
    public static final int COORDINATE_SYSTEM_VIEW_REFERENCED = 1;
    public static final int IMAGE_ANALYSIS = 2;
    public static final int IMAGE_CAPTURE = 1;
    private static final String IMAGE_CAPTURE_DISABLED = "ImageCapture disabled.";
    private static final String PREVIEW_VIEW_NOT_ATTACHED = "PreviewView not attached to CameraController.";
    private static final String TAG = "CameraController";
    public static final int TAP_TO_FOCUS_FAILED = 4;
    public static final int TAP_TO_FOCUS_FOCUSED = 2;
    public static final int TAP_TO_FOCUS_NOT_FOCUSED = 3;
    public static final int TAP_TO_FOCUS_NOT_STARTED = 0;
    public static final int TAP_TO_FOCUS_STARTED = 1;
    public static final int VIDEO_CAPTURE = 4;
    private static final String VIDEO_CAPTURE_DISABLED = "VideoCapture disabled.";
    private static final String VIDEO_RECORDING_UNFINISHED = "Recording video. Only one recording can be active at a time.";
    Recording mActiveRecording;
    private ImageAnalysis.Analyzer mAnalysisAnalyzer;
    private Executor mAnalysisBackgroundExecutor;
    private Executor mAnalysisExecutor;
    private final Context mAppContext;
    Camera mCamera;
    ProcessCameraProviderWrapper mCameraProvider;
    CameraSelector mCameraSelector;
    final RotationProvider.Listener mDeviceRotationListener;
    private final Set<CameraEffect> mEffects;
    private int mEnabledUseCases;
    ImageAnalysis mImageAnalysis;
    OutputSize mImageAnalysisTargetSize;
    ImageCapture mImageCapture;
    Executor mImageCaptureIoExecutor;
    OutputSize mImageCaptureTargetSize;
    private final ListenableFuture<Void> mInitializationFuture;
    private final PendingValue<Boolean> mPendingEnableTorch;
    private final PendingValue<Float> mPendingLinearZoom;
    private final PendingValue<Float> mPendingZoomRatio;
    private boolean mPinchToZoomEnabled;
    Preview mPreview;
    OutputSize mPreviewTargetSize;
    Map<Consumer<VideoRecordEvent>, Recording> mRecordingMap;
    private final RotationProvider mRotationProvider;
    Preview.SurfaceProvider mSurfaceProvider;
    private boolean mTapToFocusEnabled;
    final MutableLiveData<Integer> mTapToFocusState;
    private final ForwardingLiveData<Integer> mTorchState;
    VideoCapture<Recorder> mVideoCapture;
    QualitySelector mVideoCaptureQualitySelector;
    ViewPort mViewPort;
    private final ForwardingLiveData<ZoomState> mZoomState;

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface UseCases {
    }

    abstract Camera startCamera();

    /* JADX INFO: Access modifiers changed from: package-private */
    public CameraController(Context context) {
        this(context, Futures.transform(ProcessCameraProvider.getInstance(context), new Function() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda5
            @Override // androidx.arch.core.util.Function
            public final Object apply(Object obj) {
                return new ProcessCameraProviderWrapperImpl((ProcessCameraProvider) obj);
            }
        }, CameraXExecutors.directExecutor()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CameraController(Context context, ListenableFuture<ProcessCameraProviderWrapper> cameraProviderFuture) {
        this.mCameraSelector = CameraSelector.DEFAULT_BACK_CAMERA;
        this.mEnabledUseCases = 3;
        this.mActiveRecording = null;
        this.mRecordingMap = new HashMap();
        this.mVideoCaptureQualitySelector = Recorder.DEFAULT_QUALITY_SELECTOR;
        this.mPinchToZoomEnabled = true;
        this.mTapToFocusEnabled = true;
        this.mZoomState = new ForwardingLiveData<>();
        this.mTorchState = new ForwardingLiveData<>();
        this.mTapToFocusState = new MutableLiveData<>(0);
        this.mPendingEnableTorch = new PendingValue<>();
        this.mPendingLinearZoom = new PendingValue<>();
        this.mPendingZoomRatio = new PendingValue<>();
        this.mEffects = new HashSet();
        this.mAppContext = getApplicationContext(context);
        this.mPreview = new Preview.Builder().build();
        this.mImageCapture = new ImageCapture.Builder().build();
        this.mImageAnalysis = new ImageAnalysis.Builder().build();
        this.mVideoCapture = createNewVideoCapture();
        this.mInitializationFuture = Futures.transform(cameraProviderFuture, new Function() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda3
            @Override // androidx.arch.core.util.Function
            public final Object apply(Object obj) {
                return CameraController.this.m250lambda$new$0$androidxcameraviewCameraController((ProcessCameraProviderWrapper) obj);
            }
        }, CameraXExecutors.mainThreadExecutor());
        this.mRotationProvider = new RotationProvider(this.mAppContext);
        this.mDeviceRotationListener = new RotationProvider.Listener() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda4
            @Override // androidx.camera.view.RotationProvider.Listener
            public final void onRotationChanged(int i) {
                CameraController.this.m251lambda$new$1$androidxcameraviewCameraController(i);
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$new$0$androidx-camera-view-CameraController  reason: not valid java name */
    public /* synthetic */ Void m250lambda$new$0$androidxcameraviewCameraController(ProcessCameraProviderWrapper provider) {
        this.mCameraProvider = provider;
        startCameraAndTrackStates();
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$new$1$androidx-camera-view-CameraController  reason: not valid java name */
    public /* synthetic */ void m251lambda$new$1$androidxcameraviewCameraController(int rotation) {
        this.mImageAnalysis.setTargetRotation(rotation);
        this.mImageCapture.setTargetRotation(rotation);
        this.mVideoCapture.setTargetRotation(rotation);
    }

    private static Recorder generateVideoCaptureRecorder(QualitySelector qualitySelector) {
        return new Recorder.Builder().setQualitySelector(qualitySelector).build();
    }

    private static Context getApplicationContext(Context context) {
        String attributeTag;
        Context applicationContext = context.getApplicationContext();
        if (Build.VERSION.SDK_INT >= 30 && (attributeTag = Api30Impl.getAttributionTag(context)) != null) {
            return Api30Impl.createAttributionContext(applicationContext, attributeTag);
        }
        return applicationContext;
    }

    public ListenableFuture<Void> getInitializationFuture() {
        return this.mInitializationFuture;
    }

    private boolean isCameraInitialized() {
        return this.mCameraProvider != null;
    }

    private boolean isPreviewViewAttached() {
        return (this.mSurfaceProvider == null || this.mViewPort == null) ? false : true;
    }

    private boolean isCameraAttached() {
        return this.mCamera != null;
    }

    public void setEnabledUseCases(int enabledUseCases) {
        Threads.checkMainThread();
        if (enabledUseCases == this.mEnabledUseCases) {
            return;
        }
        final int oldEnabledUseCases = this.mEnabledUseCases;
        this.mEnabledUseCases = enabledUseCases;
        if (!isVideoCaptureEnabled() && isRecording()) {
            stopRecording();
        }
        startCameraAndTrackStates(new Runnable() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda6
            @Override // java.lang.Runnable
            public final void run() {
                CameraController.this.m253x2318c9a7(oldEnabledUseCases);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setEnabledUseCases$2$androidx-camera-view-CameraController  reason: not valid java name */
    public /* synthetic */ void m253x2318c9a7(int oldEnabledUseCases) {
        this.mEnabledUseCases = oldEnabledUseCases;
    }

    private boolean isUseCaseEnabled(int useCaseMask) {
        return (this.mEnabledUseCases & useCaseMask) != 0;
    }

    private void setTargetOutputSize(ImageOutputConfig.Builder<?> builder, OutputSize outputSize) {
        if (outputSize == null) {
            return;
        }
        if (outputSize.getResolution() != null) {
            builder.setTargetResolution(outputSize.getResolution());
        } else if (outputSize.getAspectRatio() != -1) {
            builder.setTargetAspectRatio(outputSize.getAspectRatio());
        } else {
            Logger.e(TAG, "Invalid target surface size. " + outputSize);
        }
    }

    private boolean isOutputSizeEqual(OutputSize currentSize, OutputSize newSize) {
        if (currentSize == newSize) {
            return true;
        }
        return currentSize != null && currentSize.equals(newSize);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void attachPreviewSurface(Preview.SurfaceProvider surfaceProvider, ViewPort viewPort) {
        Threads.checkMainThread();
        if (this.mSurfaceProvider != surfaceProvider) {
            this.mSurfaceProvider = surfaceProvider;
            this.mPreview.setSurfaceProvider(surfaceProvider);
        }
        this.mViewPort = viewPort;
        startListeningToRotationEvents();
        startCameraAndTrackStates();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void clearPreviewSurface() {
        Threads.checkMainThread();
        if (this.mCameraProvider != null) {
            this.mCameraProvider.unbind(this.mPreview, this.mImageCapture, this.mImageAnalysis, this.mVideoCapture);
        }
        this.mPreview.setSurfaceProvider(null);
        this.mCamera = null;
        this.mSurfaceProvider = null;
        this.mViewPort = null;
        stopListeningToRotationEvents();
    }

    private void startListeningToRotationEvents() {
        this.mRotationProvider.addListener(CameraXExecutors.mainThreadExecutor(), this.mDeviceRotationListener);
    }

    private void stopListeningToRotationEvents() {
        this.mRotationProvider.removeListener(this.mDeviceRotationListener);
    }

    public void setPreviewTargetSize(OutputSize targetSize) {
        Threads.checkMainThread();
        if (isOutputSizeEqual(this.mPreviewTargetSize, targetSize)) {
            return;
        }
        this.mPreviewTargetSize = targetSize;
        unbindPreviewAndRecreate();
        startCameraAndTrackStates();
    }

    public OutputSize getPreviewTargetSize() {
        Threads.checkMainThread();
        return this.mPreviewTargetSize;
    }

    private void unbindPreviewAndRecreate() {
        if (isCameraInitialized()) {
            this.mCameraProvider.unbind(this.mPreview);
        }
        Preview.Builder builder = new Preview.Builder();
        setTargetOutputSize(builder, this.mPreviewTargetSize);
        this.mPreview = builder.build();
    }

    public boolean isImageCaptureEnabled() {
        Threads.checkMainThread();
        return isUseCaseEnabled(1);
    }

    public int getImageCaptureFlashMode() {
        Threads.checkMainThread();
        return this.mImageCapture.getFlashMode();
    }

    public void setImageCaptureFlashMode(int flashMode) {
        Threads.checkMainThread();
        this.mImageCapture.setFlashMode(flashMode);
    }

    public void takePicture(ImageCapture.OutputFileOptions outputFileOptions, Executor executor, ImageCapture.OnImageSavedCallback imageSavedCallback) {
        Threads.checkMainThread();
        Preconditions.checkState(isCameraInitialized(), CAMERA_NOT_INITIALIZED);
        Preconditions.checkState(isImageCaptureEnabled(), IMAGE_CAPTURE_DISABLED);
        updateMirroringFlagInOutputFileOptions(outputFileOptions);
        this.mImageCapture.m117lambda$takePicture$2$androidxcameracoreImageCapture(outputFileOptions, executor, imageSavedCallback);
    }

    void updateMirroringFlagInOutputFileOptions(ImageCapture.OutputFileOptions outputFileOptions) {
        if (this.mCameraSelector.getLensFacing() != null && !outputFileOptions.getMetadata().isReversedHorizontalSet()) {
            outputFileOptions.getMetadata().setReversedHorizontal(this.mCameraSelector.getLensFacing().intValue() == 0);
        }
    }

    public void takePicture(Executor executor, ImageCapture.OnImageCapturedCallback callback) {
        Threads.checkMainThread();
        Preconditions.checkState(isCameraInitialized(), CAMERA_NOT_INITIALIZED);
        Preconditions.checkState(isImageCaptureEnabled(), IMAGE_CAPTURE_DISABLED);
        this.mImageCapture.m116lambda$takePicture$1$androidxcameracoreImageCapture(executor, callback);
    }

    public void setImageCaptureMode(int captureMode) {
        Threads.checkMainThread();
        if (this.mImageCapture.getCaptureMode() == captureMode) {
            return;
        }
        unbindImageCaptureAndRecreate(captureMode);
        startCameraAndTrackStates();
    }

    public int getImageCaptureMode() {
        Threads.checkMainThread();
        return this.mImageCapture.getCaptureMode();
    }

    public void setImageCaptureTargetSize(OutputSize targetSize) {
        Threads.checkMainThread();
        if (isOutputSizeEqual(this.mImageCaptureTargetSize, targetSize)) {
            return;
        }
        this.mImageCaptureTargetSize = targetSize;
        unbindImageCaptureAndRecreate(getImageCaptureMode());
        startCameraAndTrackStates();
    }

    public OutputSize getImageCaptureTargetSize() {
        Threads.checkMainThread();
        return this.mImageCaptureTargetSize;
    }

    public void setImageCaptureIoExecutor(Executor executor) {
        Threads.checkMainThread();
        if (this.mImageCaptureIoExecutor == executor) {
            return;
        }
        this.mImageCaptureIoExecutor = executor;
        unbindImageCaptureAndRecreate(this.mImageCapture.getCaptureMode());
        startCameraAndTrackStates();
    }

    public Executor getImageCaptureIoExecutor() {
        Threads.checkMainThread();
        return this.mImageCaptureIoExecutor;
    }

    private void unbindImageCaptureAndRecreate(int imageCaptureMode) {
        if (isCameraInitialized()) {
            this.mCameraProvider.unbind(this.mImageCapture);
        }
        ImageCapture.Builder builder = new ImageCapture.Builder().setCaptureMode(imageCaptureMode);
        setTargetOutputSize(builder, this.mImageCaptureTargetSize);
        if (this.mImageCaptureIoExecutor != null) {
            builder.setIoExecutor(this.mImageCaptureIoExecutor);
        }
        this.mImageCapture = builder.build();
    }

    public boolean isImageAnalysisEnabled() {
        Threads.checkMainThread();
        return isUseCaseEnabled(2);
    }

    public void setImageAnalysisAnalyzer(Executor executor, ImageAnalysis.Analyzer analyzer) {
        Threads.checkMainThread();
        if (this.mAnalysisAnalyzer == analyzer && this.mAnalysisExecutor == executor) {
            return;
        }
        ImageAnalysis.Analyzer oldAnalyzer = this.mAnalysisAnalyzer;
        this.mAnalysisExecutor = executor;
        this.mAnalysisAnalyzer = analyzer;
        this.mImageAnalysis.setAnalyzer(executor, analyzer);
        restartCameraIfAnalyzerResolutionChanged(oldAnalyzer, analyzer);
    }

    public void clearImageAnalysisAnalyzer() {
        Threads.checkMainThread();
        ImageAnalysis.Analyzer oldAnalyzer = this.mAnalysisAnalyzer;
        this.mAnalysisExecutor = null;
        this.mAnalysisAnalyzer = null;
        this.mImageAnalysis.clearAnalyzer();
        restartCameraIfAnalyzerResolutionChanged(oldAnalyzer, null);
    }

    private void restartCameraIfAnalyzerResolutionChanged(ImageAnalysis.Analyzer oldAnalyzer, ImageAnalysis.Analyzer newAnalyzer) {
        Size oldResolution;
        Size newResolution = null;
        if (oldAnalyzer == null) {
            oldResolution = null;
        } else {
            oldResolution = oldAnalyzer.getDefaultTargetResolution();
        }
        if (newAnalyzer != null) {
            newResolution = newAnalyzer.getDefaultTargetResolution();
        }
        if (!Objects.equals(oldResolution, newResolution)) {
            unbindImageAnalysisAndRecreate(this.mImageAnalysis.getBackpressureStrategy(), this.mImageAnalysis.getImageQueueDepth());
            startCameraAndTrackStates();
        }
    }

    public int getImageAnalysisBackpressureStrategy() {
        Threads.checkMainThread();
        return this.mImageAnalysis.getBackpressureStrategy();
    }

    public void setImageAnalysisBackpressureStrategy(int strategy) {
        Threads.checkMainThread();
        if (this.mImageAnalysis.getBackpressureStrategy() == strategy) {
            return;
        }
        unbindImageAnalysisAndRecreate(strategy, this.mImageAnalysis.getImageQueueDepth());
        startCameraAndTrackStates();
    }

    public void setImageAnalysisImageQueueDepth(int depth) {
        Threads.checkMainThread();
        if (this.mImageAnalysis.getImageQueueDepth() == depth) {
            return;
        }
        unbindImageAnalysisAndRecreate(this.mImageAnalysis.getBackpressureStrategy(), depth);
        startCameraAndTrackStates();
    }

    public int getImageAnalysisImageQueueDepth() {
        Threads.checkMainThread();
        return this.mImageAnalysis.getImageQueueDepth();
    }

    public void setImageAnalysisTargetSize(OutputSize targetSize) {
        Threads.checkMainThread();
        if (isOutputSizeEqual(this.mImageAnalysisTargetSize, targetSize)) {
            return;
        }
        this.mImageAnalysisTargetSize = targetSize;
        unbindImageAnalysisAndRecreate(this.mImageAnalysis.getBackpressureStrategy(), this.mImageAnalysis.getImageQueueDepth());
        startCameraAndTrackStates();
    }

    public OutputSize getImageAnalysisTargetSize() {
        Threads.checkMainThread();
        return this.mImageAnalysisTargetSize;
    }

    public void setImageAnalysisBackgroundExecutor(Executor executor) {
        Threads.checkMainThread();
        if (this.mAnalysisBackgroundExecutor == executor) {
            return;
        }
        this.mAnalysisBackgroundExecutor = executor;
        unbindImageAnalysisAndRecreate(this.mImageAnalysis.getBackpressureStrategy(), this.mImageAnalysis.getImageQueueDepth());
        startCameraAndTrackStates();
    }

    public Executor getImageAnalysisBackgroundExecutor() {
        Threads.checkMainThread();
        return this.mAnalysisBackgroundExecutor;
    }

    private void unbindImageAnalysisAndRecreate(int strategy, int imageQueueDepth) {
        Threads.checkMainThread();
        if (isCameraInitialized()) {
            this.mCameraProvider.unbind(this.mImageAnalysis);
        }
        ImageAnalysis.Builder builder = new ImageAnalysis.Builder().setBackpressureStrategy(strategy).setImageQueueDepth(imageQueueDepth);
        setTargetOutputSize(builder, this.mImageAnalysisTargetSize);
        if (this.mAnalysisBackgroundExecutor != null) {
            builder.setBackgroundExecutor(this.mAnalysisBackgroundExecutor);
        }
        this.mImageAnalysis = builder.build();
        if (this.mAnalysisExecutor != null && this.mAnalysisAnalyzer != null) {
            this.mImageAnalysis.setAnalyzer(this.mAnalysisExecutor, this.mAnalysisAnalyzer);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void updatePreviewViewTransform(Matrix matrix) {
        Threads.checkMainThread();
        if (this.mAnalysisAnalyzer != null && this.mAnalysisAnalyzer.getTargetCoordinateSystem() == 1) {
            this.mAnalysisAnalyzer.updateTransform(matrix);
        }
    }

    public boolean isVideoCaptureEnabled() {
        Threads.checkMainThread();
        return isUseCaseEnabled(4);
    }

    public Recording startRecording(FileOutputOptions outputOptions, AudioConfig audioConfig, Executor executor, Consumer<VideoRecordEvent> listener) {
        return startRecordingInternal(outputOptions, audioConfig, executor, listener);
    }

    public Recording startRecording(FileDescriptorOutputOptions outputOptions, AudioConfig audioConfig, Executor executor, Consumer<VideoRecordEvent> listener) {
        return startRecordingInternal(outputOptions, audioConfig, executor, listener);
    }

    public Recording startRecording(MediaStoreOutputOptions outputOptions, AudioConfig audioConfig, Executor executor, Consumer<VideoRecordEvent> listener) {
        return startRecordingInternal(outputOptions, audioConfig, executor, listener);
    }

    private Recording startRecordingInternal(OutputOptions outputOptions, AudioConfig audioConfig, Executor executor, Consumer<VideoRecordEvent> listener) {
        Threads.checkMainThread();
        Preconditions.checkState(isCameraInitialized(), CAMERA_NOT_INITIALIZED);
        Preconditions.checkState(isVideoCaptureEnabled(), VIDEO_CAPTURE_DISABLED);
        Preconditions.checkState(!isRecording(), VIDEO_RECORDING_UNFINISHED);
        Consumer<VideoRecordEvent> wrappedListener = wrapListenerToDeactivateRecordingOnFinalized(listener);
        PendingRecording pendingRecording = prepareRecording(outputOptions);
        boolean isAudioEnabled = audioConfig.getAudioEnabled();
        if (isAudioEnabled) {
            checkAudioPermissionGranted();
            pendingRecording.withAudioEnabled();
        }
        Recording recording = pendingRecording.start(executor, wrappedListener);
        setActiveRecording(recording, wrappedListener);
        return recording;
    }

    private void checkAudioPermissionGranted() {
        int permissionState = PermissionChecker.checkSelfPermission(this.mAppContext, "android.permission.RECORD_AUDIO");
        if (permissionState == -1) {
            throw new SecurityException("Attempted to start recording with audio, but application does not have RECORD_AUDIO permission granted.");
        }
    }

    private PendingRecording prepareRecording(OutputOptions options) {
        Recorder recorder = this.mVideoCapture.getOutput();
        if (options instanceof FileOutputOptions) {
            return recorder.prepareRecording(this.mAppContext, (FileOutputOptions) options);
        }
        if (options instanceof FileDescriptorOutputOptions) {
            return recorder.prepareRecording(this.mAppContext, (FileDescriptorOutputOptions) options);
        }
        if (options instanceof MediaStoreOutputOptions) {
            return recorder.prepareRecording(this.mAppContext, (MediaStoreOutputOptions) options);
        }
        throw new IllegalArgumentException("Unsupported OutputOptions type.");
    }

    private Consumer<VideoRecordEvent> wrapListenerToDeactivateRecordingOnFinalized(Consumer<VideoRecordEvent> listener) {
        Executor mainExecutor = ContextCompat.getMainExecutor(this.mAppContext);
        return new AnonymousClass1(mainExecutor, listener);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: androidx.camera.view.CameraController$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 implements Consumer<VideoRecordEvent> {
        final /* synthetic */ Consumer val$listener;
        final /* synthetic */ Executor val$mainExecutor;

        AnonymousClass1(Executor executor, Consumer consumer) {
            this.val$mainExecutor = executor;
            this.val$listener = consumer;
        }

        @Override // androidx.core.util.Consumer
        public void accept(VideoRecordEvent videoRecordEvent) {
            if (videoRecordEvent instanceof VideoRecordEvent.Finalize) {
                if (!Threads.isMainThread()) {
                    this.val$mainExecutor.execute(new Runnable() { // from class: androidx.camera.view.CameraController$1$$ExternalSyntheticLambda0
                        @Override // java.lang.Runnable
                        public final void run() {
                            CameraController.AnonymousClass1.this.m254lambda$accept$0$androidxcameraviewCameraController$1();
                        }
                    });
                } else {
                    CameraController.this.deactivateRecordingByListener(this);
                }
            }
            this.val$listener.accept(videoRecordEvent);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$accept$0$androidx-camera-view-CameraController$1  reason: not valid java name */
        public /* synthetic */ void m254lambda$accept$0$androidxcameraviewCameraController$1() {
            CameraController.this.deactivateRecordingByListener(this);
        }
    }

    void deactivateRecordingByListener(Consumer<VideoRecordEvent> listener) {
        Recording recording = this.mRecordingMap.remove(listener);
        if (recording != null) {
            deactivateRecording(recording);
        }
    }

    private void deactivateRecording(Recording recording) {
        if (this.mActiveRecording == recording) {
            this.mActiveRecording = null;
        }
    }

    private void setActiveRecording(Recording recording, Consumer<VideoRecordEvent> listener) {
        this.mRecordingMap.put(listener, recording);
        this.mActiveRecording = recording;
    }

    private void stopRecording() {
        Threads.checkMainThread();
        if (this.mActiveRecording != null) {
            this.mActiveRecording.stop();
            deactivateRecording(this.mActiveRecording);
        }
    }

    public boolean isRecording() {
        Threads.checkMainThread();
        return (this.mActiveRecording == null || this.mActiveRecording.isClosed()) ? false : true;
    }

    public void setVideoCaptureQualitySelector(QualitySelector qualitySelector) {
        Threads.checkMainThread();
        this.mVideoCaptureQualitySelector = qualitySelector;
        unbindVideoAndRecreate();
        startCameraAndTrackStates();
    }

    public QualitySelector getVideoCaptureQualitySelector() {
        Threads.checkMainThread();
        return this.mVideoCaptureQualitySelector;
    }

    private void unbindVideoAndRecreate() {
        if (isCameraInitialized()) {
            this.mCameraProvider.unbind(this.mVideoCapture);
        }
        this.mVideoCapture = createNewVideoCapture();
    }

    private VideoCapture<Recorder> createNewVideoCapture() {
        return VideoCapture.withOutput(generateVideoCaptureRecorder(this.mVideoCaptureQualitySelector));
    }

    public void setCameraSelector(CameraSelector cameraSelector) {
        Threads.checkMainThread();
        if (this.mCameraSelector == cameraSelector) {
            return;
        }
        final CameraSelector oldCameraSelector = this.mCameraSelector;
        this.mCameraSelector = cameraSelector;
        if (this.mCameraProvider == null) {
            return;
        }
        this.mCameraProvider.unbind(this.mPreview, this.mImageCapture, this.mImageAnalysis, this.mVideoCapture);
        startCameraAndTrackStates(new Runnable() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda7
            @Override // java.lang.Runnable
            public final void run() {
                CameraController.this.m252lambda$setCameraSelector$3$androidxcameraviewCameraController(oldCameraSelector);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setCameraSelector$3$androidx-camera-view-CameraController  reason: not valid java name */
    public /* synthetic */ void m252lambda$setCameraSelector$3$androidxcameraviewCameraController(CameraSelector oldCameraSelector) {
        this.mCameraSelector = oldCameraSelector;
    }

    public boolean hasCamera(CameraSelector cameraSelector) {
        Threads.checkMainThread();
        Preconditions.checkNotNull(cameraSelector);
        if (this.mCameraProvider == null) {
            throw new IllegalStateException("Camera not initialized. Please wait for the initialization future to finish. See #getInitializationFuture().");
        }
        try {
            return this.mCameraProvider.hasCamera(cameraSelector);
        } catch (CameraInfoUnavailableException e) {
            Logger.w(TAG, "Failed to check camera availability", e);
            return false;
        }
    }

    public CameraSelector getCameraSelector() {
        Threads.checkMainThread();
        return this.mCameraSelector;
    }

    public boolean isPinchToZoomEnabled() {
        Threads.checkMainThread();
        return this.mPinchToZoomEnabled;
    }

    public void setPinchToZoomEnabled(boolean enabled) {
        Threads.checkMainThread();
        this.mPinchToZoomEnabled = enabled;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onPinchToZoom(float pinchToZoomScale) {
        if (!isCameraAttached()) {
            Logger.w(TAG, CAMERA_NOT_ATTACHED);
        } else if (!this.mPinchToZoomEnabled) {
            Logger.d(TAG, "Pinch to zoom disabled.");
        } else {
            Logger.d(TAG, "Pinch to zoom with scale: " + pinchToZoomScale);
            ZoomState zoomState = getZoomState().getValue();
            if (zoomState == null) {
                return;
            }
            float clampedRatio = zoomState.getZoomRatio() * speedUpZoomBy2X(pinchToZoomScale);
            setZoomRatio(Math.min(Math.max(clampedRatio, zoomState.getMinZoomRatio()), zoomState.getMaxZoomRatio()));
        }
    }

    private float speedUpZoomBy2X(float scaleFactor) {
        return scaleFactor > 1.0f ? ((scaleFactor - 1.0f) * 2.0f) + 1.0f : 1.0f - ((1.0f - scaleFactor) * 2.0f);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onTapToFocus(MeteringPointFactory meteringPointFactory, float x, float y) {
        if (!isCameraAttached()) {
            Logger.w(TAG, CAMERA_NOT_ATTACHED);
        } else if (!this.mTapToFocusEnabled) {
            Logger.d(TAG, "Tap to focus disabled. ");
        } else {
            Logger.d(TAG, "Tap to focus started: " + x + ", " + y);
            this.mTapToFocusState.postValue(1);
            MeteringPoint afPoint = meteringPointFactory.createPoint(x, y, AF_SIZE);
            MeteringPoint aePoint = meteringPointFactory.createPoint(x, y, AE_SIZE);
            FocusMeteringAction focusMeteringAction = new FocusMeteringAction.Builder(afPoint, 1).addPoint(aePoint, 2).build();
            Futures.addCallback(this.mCamera.getCameraControl().startFocusAndMetering(focusMeteringAction), new FutureCallback<FocusMeteringResult>() { // from class: androidx.camera.view.CameraController.2
                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onSuccess(FocusMeteringResult result) {
                    if (result == null) {
                        return;
                    }
                    Logger.d(CameraController.TAG, "Tap to focus onSuccess: " + result.isFocusSuccessful());
                    CameraController.this.mTapToFocusState.postValue(Integer.valueOf(result.isFocusSuccessful() ? 2 : 3));
                }

                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onFailure(Throwable t) {
                    if (t instanceof CameraControl.OperationCanceledException) {
                        Logger.d(CameraController.TAG, "Tap-to-focus is canceled by new action.");
                        return;
                    }
                    Logger.d(CameraController.TAG, "Tap to focus failed.", t);
                    CameraController.this.mTapToFocusState.postValue(4);
                }
            }, CameraXExecutors.directExecutor());
        }
    }

    public boolean isTapToFocusEnabled() {
        Threads.checkMainThread();
        return this.mTapToFocusEnabled;
    }

    public void setTapToFocusEnabled(boolean enabled) {
        Threads.checkMainThread();
        this.mTapToFocusEnabled = enabled;
    }

    public LiveData<Integer> getTapToFocusState() {
        Threads.checkMainThread();
        return this.mTapToFocusState;
    }

    public LiveData<ZoomState> getZoomState() {
        Threads.checkMainThread();
        return this.mZoomState;
    }

    public CameraInfo getCameraInfo() {
        Threads.checkMainThread();
        if (this.mCamera == null) {
            return null;
        }
        return this.mCamera.getCameraInfo();
    }

    public CameraControl getCameraControl() {
        Threads.checkMainThread();
        if (this.mCamera == null) {
            return null;
        }
        return this.mCamera.getCameraControl();
    }

    public ListenableFuture<Void> setZoomRatio(float zoomRatio) {
        Threads.checkMainThread();
        if (!isCameraAttached()) {
            return this.mPendingZoomRatio.setValue(Float.valueOf(zoomRatio));
        }
        return this.mCamera.getCameraControl().setZoomRatio(zoomRatio);
    }

    public ListenableFuture<Void> setLinearZoom(float linearZoom) {
        Threads.checkMainThread();
        if (!isCameraAttached()) {
            return this.mPendingLinearZoom.setValue(Float.valueOf(linearZoom));
        }
        return this.mCamera.getCameraControl().setLinearZoom(linearZoom);
    }

    public LiveData<Integer> getTorchState() {
        Threads.checkMainThread();
        return this.mTorchState;
    }

    public ListenableFuture<Void> enableTorch(boolean torchEnabled) {
        Threads.checkMainThread();
        if (!isCameraAttached()) {
            return this.mPendingEnableTorch.setValue(Boolean.valueOf(torchEnabled));
        }
        return this.mCamera.getCameraControl().enableTorch(torchEnabled);
    }

    public void setEffects(Set<CameraEffect> effects) {
        Threads.checkMainThread();
        if (Objects.equals(this.mEffects, effects)) {
            return;
        }
        if (this.mCameraProvider != null) {
            this.mCameraProvider.unbindAll();
        }
        this.mEffects.clear();
        this.mEffects.addAll(effects);
        startCameraAndTrackStates();
    }

    public void clearEffects() {
        Threads.checkMainThread();
        if (this.mCameraProvider != null) {
            this.mCameraProvider.unbindAll();
        }
        this.mEffects.clear();
        startCameraAndTrackStates();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void startCameraAndTrackStates() {
        startCameraAndTrackStates(null);
    }

    void startCameraAndTrackStates(Runnable restoreStateRunnable) {
        try {
            this.mCamera = startCamera();
            if (!isCameraAttached()) {
                Logger.d(TAG, CAMERA_NOT_ATTACHED);
                return;
            }
            this.mZoomState.setSource(this.mCamera.getCameraInfo().getZoomState());
            this.mTorchState.setSource(this.mCamera.getCameraInfo().getTorchState());
            this.mPendingEnableTorch.propagateIfHasValue(new Function() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda0
                @Override // androidx.arch.core.util.Function
                public final Object apply(Object obj) {
                    return CameraController.this.enableTorch(((Boolean) obj).booleanValue());
                }
            });
            this.mPendingLinearZoom.propagateIfHasValue(new Function() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda1
                @Override // androidx.arch.core.util.Function
                public final Object apply(Object obj) {
                    return CameraController.this.setLinearZoom(((Float) obj).floatValue());
                }
            });
            this.mPendingZoomRatio.propagateIfHasValue(new Function() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda2
                @Override // androidx.arch.core.util.Function
                public final Object apply(Object obj) {
                    return CameraController.this.setZoomRatio(((Float) obj).floatValue());
                }
            });
        } catch (RuntimeException exception) {
            if (restoreStateRunnable != null) {
                restoreStateRunnable.run();
            }
            throw exception;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public UseCaseGroup createUseCaseGroup() {
        if (!isCameraInitialized()) {
            Logger.d(TAG, CAMERA_NOT_INITIALIZED);
            return null;
        } else if (!isPreviewViewAttached()) {
            Logger.d(TAG, PREVIEW_VIEW_NOT_ATTACHED);
            return null;
        } else {
            UseCaseGroup.Builder builder = new UseCaseGroup.Builder().addUseCase(this.mPreview);
            if (isImageCaptureEnabled()) {
                builder.addUseCase(this.mImageCapture);
            } else {
                this.mCameraProvider.unbind(this.mImageCapture);
            }
            if (isImageAnalysisEnabled()) {
                builder.addUseCase(this.mImageAnalysis);
            } else {
                this.mCameraProvider.unbind(this.mImageAnalysis);
            }
            if (isVideoCaptureEnabled()) {
                builder.addUseCase(this.mVideoCapture);
            } else {
                this.mCameraProvider.unbind(this.mVideoCapture);
            }
            builder.setViewPort(this.mViewPort);
            for (CameraEffect effect : this.mEffects) {
                builder.addEffect(effect);
            }
            return builder.build();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class Api30Impl {
        private Api30Impl() {
        }

        static Context createAttributionContext(Context context, String attributeTag) {
            return context.createAttributionContext(attributeTag);
        }

        static String getAttributionTag(Context context) {
            return context.getAttributionTag();
        }
    }

    /* loaded from: classes.dex */
    public static final class OutputSize {
        public static final int UNASSIGNED_ASPECT_RATIO = -1;
        private final int mAspectRatio;
        private final Size mResolution;

        @Retention(RetentionPolicy.SOURCE)
        /* loaded from: classes.dex */
        public @interface OutputAspectRatio {
        }

        public OutputSize(int aspectRatio) {
            Preconditions.checkArgument(aspectRatio != -1);
            this.mAspectRatio = aspectRatio;
            this.mResolution = null;
        }

        public OutputSize(Size resolution) {
            Preconditions.checkNotNull(resolution);
            this.mAspectRatio = -1;
            this.mResolution = resolution;
        }

        public int getAspectRatio() {
            return this.mAspectRatio;
        }

        public Size getResolution() {
            return this.mResolution;
        }

        public String toString() {
            return "aspect ratio: " + this.mAspectRatio + " resolution: " + this.mResolution;
        }
    }
}
