package androidx.camera.core;

import androidx.camera.core.ForwardingImageProxy;
import androidx.camera.core.ImageAnalysisNonBlockingAnalyzer;
import androidx.camera.core.impl.ImageReaderProxy;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import java.lang.ref.WeakReference;
import java.util.concurrent.Executor;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class ImageAnalysisNonBlockingAnalyzer extends ImageAnalysisAbstractAnalyzer {
    final Executor mBackgroundExecutor;
    ImageProxy mCachedImage;
    private final Object mLock = new Object();
    private CacheAnalyzingImageProxy mPostedImage;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ImageAnalysisNonBlockingAnalyzer(Executor executor) {
        this.mBackgroundExecutor = executor;
    }

    @Override // androidx.camera.core.ImageAnalysisAbstractAnalyzer
    ImageProxy acquireImage(ImageReaderProxy imageReaderProxy) {
        return imageReaderProxy.acquireLatestImage();
    }

    @Override // androidx.camera.core.ImageAnalysisAbstractAnalyzer
    void onValidImageAvailable(ImageProxy imageProxy) {
        synchronized (this.mLock) {
            if (!this.mIsAttached) {
                imageProxy.close();
            } else if (this.mPostedImage != null) {
                if (imageProxy.getImageInfo().getTimestamp() <= this.mPostedImage.getImageInfo().getTimestamp()) {
                    imageProxy.close();
                } else {
                    if (this.mCachedImage != null) {
                        this.mCachedImage.close();
                    }
                    this.mCachedImage = imageProxy;
                }
            } else {
                final CacheAnalyzingImageProxy newPostedImage = new CacheAnalyzingImageProxy(imageProxy, this);
                this.mPostedImage = newPostedImage;
                Futures.addCallback(analyzeImage(newPostedImage), new FutureCallback<Void>() { // from class: androidx.camera.core.ImageAnalysisNonBlockingAnalyzer.1
                    @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                    public void onSuccess(Void result) {
                    }

                    @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                    public void onFailure(Throwable t) {
                        newPostedImage.close();
                    }
                }, CameraXExecutors.directExecutor());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.core.ImageAnalysisAbstractAnalyzer
    public void clearCache() {
        synchronized (this.mLock) {
            if (this.mCachedImage != null) {
                this.mCachedImage.close();
                this.mCachedImage = null;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void analyzeCachedImage() {
        synchronized (this.mLock) {
            this.mPostedImage = null;
            if (this.mCachedImage != null) {
                ImageProxy cachedImage = this.mCachedImage;
                this.mCachedImage = null;
                onValidImageAvailable(cachedImage);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class CacheAnalyzingImageProxy extends ForwardingImageProxy {
        final WeakReference<ImageAnalysisNonBlockingAnalyzer> mNonBlockingAnalyzerWeakReference;

        CacheAnalyzingImageProxy(ImageProxy image, ImageAnalysisNonBlockingAnalyzer nonBlockingAnalyzer) {
            super(image);
            this.mNonBlockingAnalyzerWeakReference = new WeakReference<>(nonBlockingAnalyzer);
            addOnImageCloseListener(new ForwardingImageProxy.OnImageCloseListener() { // from class: androidx.camera.core.ImageAnalysisNonBlockingAnalyzer$CacheAnalyzingImageProxy$$ExternalSyntheticLambda0
                @Override // androidx.camera.core.ForwardingImageProxy.OnImageCloseListener
                public final void onImageClose(ImageProxy imageProxy) {
                    ImageAnalysisNonBlockingAnalyzer.CacheAnalyzingImageProxy.this.m114x18076637(imageProxy);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$new$1$androidx-camera-core-ImageAnalysisNonBlockingAnalyzer$CacheAnalyzingImageProxy  reason: not valid java name */
        public /* synthetic */ void m114x18076637(ImageProxy imageProxy) {
            final ImageAnalysisNonBlockingAnalyzer analyzer = this.mNonBlockingAnalyzerWeakReference.get();
            if (analyzer != null) {
                analyzer.mBackgroundExecutor.execute(new Runnable() { // from class: androidx.camera.core.ImageAnalysisNonBlockingAnalyzer$CacheAnalyzingImageProxy$$ExternalSyntheticLambda1
                    @Override // java.lang.Runnable
                    public final void run() {
                        ImageAnalysisNonBlockingAnalyzer.this.analyzeCachedImage();
                    }
                });
            }
        }
    }
}
