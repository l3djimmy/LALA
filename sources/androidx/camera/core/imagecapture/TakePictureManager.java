package androidx.camera.core.imagecapture;

import android.util.Log;
import androidx.camera.core.ForwardingImageProxy;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.Logger;
import androidx.camera.core.imagecapture.TakePictureRequest;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.core.util.Pair;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public class TakePictureManager implements ForwardingImageProxy.OnImageCloseListener, TakePictureRequest.RetryControl {
    private static final String TAG = "TakePictureManager";
    private RequestWithCallback mCapturingRequest;
    final ImageCaptureControl mImageCaptureControl;
    ImagePipeline mImagePipeline;
    private final List<RequestWithCallback> mIncompleteRequests;
    final Deque<TakePictureRequest> mNewRequests = new ArrayDeque();
    boolean mPaused = false;

    public TakePictureManager(ImageCaptureControl imageCaptureControl) {
        Threads.checkMainThread();
        this.mImageCaptureControl = imageCaptureControl;
        this.mIncompleteRequests = new ArrayList();
    }

    public void setImagePipeline(ImagePipeline imagePipeline) {
        Threads.checkMainThread();
        this.mImagePipeline = imagePipeline;
        this.mImagePipeline.setOnImageCloseListener(this);
    }

    public void offerRequest(TakePictureRequest takePictureRequest) {
        Threads.checkMainThread();
        this.mNewRequests.offer(takePictureRequest);
        issueNextRequest();
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest.RetryControl
    public void retryRequest(TakePictureRequest request) {
        Threads.checkMainThread();
        Logger.d(TAG, "Add a new request for retrying.");
        this.mNewRequests.addFirst(request);
        issueNextRequest();
    }

    public void pause() {
        Threads.checkMainThread();
        this.mPaused = true;
        if (this.mCapturingRequest != null) {
            this.mCapturingRequest.abortSilentlyAndRetry();
        }
    }

    public void resume() {
        Threads.checkMainThread();
        this.mPaused = false;
        issueNextRequest();
    }

    public void abortRequests() {
        Threads.checkMainThread();
        ImageCaptureException exception = new ImageCaptureException(3, "Camera is closed.", null);
        for (TakePictureRequest request : this.mNewRequests) {
            request.onError(exception);
        }
        this.mNewRequests.clear();
        List<RequestWithCallback> requestsSnapshot = new ArrayList<>(this.mIncompleteRequests);
        for (RequestWithCallback request2 : requestsSnapshot) {
            request2.abortAndSendErrorToApp(exception);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void issueNextRequest() {
        Threads.checkMainThread();
        Log.d(TAG, "Issue the next TakePictureRequest.");
        if (hasCapturingRequest()) {
            Log.d(TAG, "There is already a request in-flight.");
        } else if (this.mPaused) {
            Log.d(TAG, "The class is paused.");
        } else if (this.mImagePipeline.getCapacity() == 0) {
            Log.d(TAG, "Too many acquire images. Close image to be able to process next.");
        } else {
            TakePictureRequest request = this.mNewRequests.poll();
            if (request == null) {
                Log.d(TAG, "No new request.");
                return;
            }
            RequestWithCallback requestWithCallback = new RequestWithCallback(request, this);
            trackCurrentRequests(requestWithCallback);
            Pair<CameraRequest, ProcessingRequest> requests = this.mImagePipeline.createRequests(request, requestWithCallback, requestWithCallback.getCaptureFuture());
            CameraRequest cameraRequest = (CameraRequest) Objects.requireNonNull(requests.first);
            ProcessingRequest processingRequest = (ProcessingRequest) Objects.requireNonNull(requests.second);
            this.mImagePipeline.submitProcessingRequest(processingRequest);
            ListenableFuture<Void> captureRequestFuture = submitCameraRequest(cameraRequest);
            requestWithCallback.setCaptureRequestFuture(captureRequestFuture);
        }
    }

    private void trackCurrentRequests(final RequestWithCallback requestWithCallback) {
        Preconditions.checkState(!hasCapturingRequest());
        this.mCapturingRequest = requestWithCallback;
        this.mCapturingRequest.getCaptureFuture().addListener(new Runnable() { // from class: androidx.camera.core.imagecapture.TakePictureManager$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                TakePictureManager.this.m139x4e535857();
            }
        }, CameraXExecutors.directExecutor());
        this.mIncompleteRequests.add(requestWithCallback);
        requestWithCallback.getCompleteFuture().addListener(new Runnable() { // from class: androidx.camera.core.imagecapture.TakePictureManager$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                TakePictureManager.this.m140x686ed6f6(requestWithCallback);
            }
        }, CameraXExecutors.directExecutor());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$trackCurrentRequests$0$androidx-camera-core-imagecapture-TakePictureManager  reason: not valid java name */
    public /* synthetic */ void m139x4e535857() {
        this.mCapturingRequest = null;
        issueNextRequest();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$trackCurrentRequests$1$androidx-camera-core-imagecapture-TakePictureManager  reason: not valid java name */
    public /* synthetic */ void m140x686ed6f6(RequestWithCallback requestWithCallback) {
        this.mIncompleteRequests.remove(requestWithCallback);
    }

    private ListenableFuture<Void> submitCameraRequest(final CameraRequest cameraRequest) {
        Threads.checkMainThread();
        this.mImageCaptureControl.lockFlashMode();
        ListenableFuture<Void> captureRequestFuture = this.mImageCaptureControl.submitStillCaptureRequests(cameraRequest.getCaptureConfigs());
        Futures.addCallback(captureRequestFuture, new FutureCallback<Void>() { // from class: androidx.camera.core.imagecapture.TakePictureManager.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void result) {
                TakePictureManager.this.mImageCaptureControl.unlockFlashMode();
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable throwable) {
                if (cameraRequest.isAborted()) {
                    return;
                }
                boolean z = throwable instanceof ImageCaptureException;
                TakePictureManager takePictureManager = TakePictureManager.this;
                if (z) {
                    takePictureManager.mImagePipeline.notifyCaptureError((ImageCaptureException) throwable);
                } else {
                    takePictureManager.mImagePipeline.notifyCaptureError(new ImageCaptureException(2, "Failed to submit capture request", throwable));
                }
                TakePictureManager.this.mImageCaptureControl.unlockFlashMode();
            }
        }, CameraXExecutors.mainThreadExecutor());
        return captureRequestFuture;
    }

    boolean hasCapturingRequest() {
        return this.mCapturingRequest != null;
    }

    List<RequestWithCallback> getIncompleteRequests() {
        return this.mIncompleteRequests;
    }

    public ImagePipeline getImagePipeline() {
        return this.mImagePipeline;
    }

    @Override // androidx.camera.core.ForwardingImageProxy.OnImageCloseListener
    public void onImageClose(ImageProxy image) {
        CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.imagecapture.TakePictureManager$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                TakePictureManager.this.issueNextRequest();
            }
        });
    }
}
