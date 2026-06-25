package androidx.camera.core.imagecapture;

import androidx.camera.core.ImageProxy;
import androidx.camera.core.imagecapture.CaptureNode;
import androidx.camera.core.imagecapture.ProcessingNode;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import java.util.Objects;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class SingleBundlingNode implements BundlingNode {
    private ProcessingNode.In mOutputEdge;
    ProcessingRequest mPendingRequest;

    @Override // androidx.camera.core.processing.Node
    public ProcessingNode.In transform(CaptureNode.Out captureNodeOut) {
        captureNodeOut.getImageEdge().setListener(new Consumer() { // from class: androidx.camera.core.imagecapture.SingleBundlingNode$$ExternalSyntheticLambda0
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                SingleBundlingNode.this.matchImageWithRequest((ImageProxy) obj);
            }
        });
        captureNodeOut.getRequestEdge().setListener(new Consumer() { // from class: androidx.camera.core.imagecapture.SingleBundlingNode$$ExternalSyntheticLambda1
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                SingleBundlingNode.this.trackIncomingRequest((ProcessingRequest) obj);
            }
        });
        this.mOutputEdge = ProcessingNode.In.of(captureNodeOut.getInputFormat(), captureNodeOut.getOutputFormat());
        return this.mOutputEdge;
    }

    @Override // androidx.camera.core.processing.Node
    public void release() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void trackIncomingRequest(final ProcessingRequest request) {
        Threads.checkMainThread();
        Preconditions.checkState(request.getStageIds().size() == 1, "Cannot handle multi-image capture.");
        Preconditions.checkState(this.mPendingRequest == null, "Already has an existing request.");
        this.mPendingRequest = request;
        Futures.addCallback(request.getCaptureFuture(), new FutureCallback<Void>() { // from class: androidx.camera.core.imagecapture.SingleBundlingNode.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void result) {
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                Threads.checkMainThread();
                if (request == SingleBundlingNode.this.mPendingRequest) {
                    SingleBundlingNode.this.mPendingRequest = null;
                }
            }
        }, CameraXExecutors.directExecutor());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void matchImageWithRequest(ImageProxy imageProxy) {
        Threads.checkMainThread();
        Preconditions.checkState(this.mPendingRequest != null);
        int stageId = ((Integer) Objects.requireNonNull(imageProxy.getImageInfo().getTagBundle().getTag(this.mPendingRequest.getTagBundleKey()))).intValue();
        Preconditions.checkState(stageId == this.mPendingRequest.getStageIds().get(0).intValue());
        this.mOutputEdge.getEdge().accept(ProcessingNode.InputPacket.of(this.mPendingRequest, imageProxy));
        this.mPendingRequest = null;
    }
}
