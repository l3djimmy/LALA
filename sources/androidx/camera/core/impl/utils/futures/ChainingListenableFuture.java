package androidx.camera.core.impl.utils.futures;

import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.lang.reflect.UndeclaredThrowableException;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class ChainingListenableFuture<I, O> extends FutureChain<O> implements Runnable {
    private AsyncFunction<? super I, ? extends O> mFunction;
    private ListenableFuture<? extends I> mInputFuture;
    private final BlockingQueue<Boolean> mMayInterruptIfRunningChannel = new LinkedBlockingQueue(1);
    private final CountDownLatch mOutputCreated = new CountDownLatch(1);
    volatile ListenableFuture<? extends O> mOutputFuture;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ChainingListenableFuture(AsyncFunction<? super I, ? extends O> function, ListenableFuture<? extends I> inputFuture) {
        this.mFunction = (AsyncFunction) Preconditions.checkNotNull(function);
        this.mInputFuture = (ListenableFuture) Preconditions.checkNotNull(inputFuture);
    }

    @Override // androidx.camera.core.impl.utils.futures.FutureChain, java.util.concurrent.Future
    public O get() throws InterruptedException, ExecutionException {
        if (!isDone()) {
            ListenableFuture<? extends I> inputFuture = this.mInputFuture;
            if (inputFuture != null) {
                inputFuture.get();
            }
            this.mOutputCreated.await();
            ListenableFuture<? extends O> outputFuture = this.mOutputFuture;
            if (outputFuture != null) {
                outputFuture.get();
            }
        }
        return (O) super.get();
    }

    @Override // androidx.camera.core.impl.utils.futures.FutureChain, java.util.concurrent.Future
    public O get(long timeout, TimeUnit unit) throws TimeoutException, ExecutionException, InterruptedException {
        if (!isDone()) {
            if (unit != TimeUnit.NANOSECONDS) {
                timeout = TimeUnit.NANOSECONDS.convert(timeout, unit);
                unit = TimeUnit.NANOSECONDS;
            }
            ListenableFuture<? extends I> inputFuture = this.mInputFuture;
            if (inputFuture != null) {
                long start = System.nanoTime();
                inputFuture.get(timeout, unit);
                timeout -= Math.max(0L, System.nanoTime() - start);
            }
            long start2 = System.nanoTime();
            if (this.mOutputCreated.await(timeout, unit)) {
                timeout -= Math.max(0L, System.nanoTime() - start2);
                ListenableFuture<? extends O> outputFuture = this.mOutputFuture;
                if (outputFuture != null) {
                    outputFuture.get(timeout, unit);
                }
            } else {
                throw new TimeoutException();
            }
        }
        return (O) super.get(timeout, unit);
    }

    @Override // androidx.camera.core.impl.utils.futures.FutureChain, java.util.concurrent.Future
    public boolean cancel(boolean mayInterruptIfRunning) {
        if (super.cancel(mayInterruptIfRunning)) {
            putUninterruptibly(this.mMayInterruptIfRunningChannel, Boolean.valueOf(mayInterruptIfRunning));
            cancel(this.mInputFuture, mayInterruptIfRunning);
            cancel(this.mOutputFuture, mayInterruptIfRunning);
            return true;
        }
        return false;
    }

    private void cancel(Future<?> future, boolean mayInterruptIfRunning) {
        if (future != null) {
            future.cancel(mayInterruptIfRunning);
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        final ListenableFuture<? extends O> outputFuture;
        try {
            try {
                try {
                    outputFuture = this.mFunction.apply(Futures.getUninterruptibly(this.mInputFuture));
                    this.mOutputFuture = outputFuture;
                } catch (Throwable th) {
                    this.mFunction = null;
                    this.mInputFuture = null;
                    this.mOutputCreated.countDown();
                    throw th;
                }
            } catch (CancellationException e) {
                cancel(false);
                this.mFunction = null;
                this.mInputFuture = null;
                this.mOutputCreated.countDown();
                return;
            } catch (ExecutionException e2) {
                setException(e2.getCause());
                this.mFunction = null;
                this.mInputFuture = null;
                this.mOutputCreated.countDown();
                return;
            }
        } catch (Error e3) {
            setException(e3);
        } catch (UndeclaredThrowableException e4) {
            setException(e4.getCause());
        } catch (Exception e5) {
            setException(e5);
        }
        if (!isCancelled()) {
            outputFuture.addListener(new Runnable() { // from class: androidx.camera.core.impl.utils.futures.ChainingListenableFuture.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        try {
                            ChainingListenableFuture.this.set(Futures.getUninterruptibly(outputFuture));
                        } catch (CancellationException e6) {
                            ChainingListenableFuture.this.cancel(false);
                            ChainingListenableFuture.this.mOutputFuture = null;
                            return;
                        } catch (ExecutionException e7) {
                            ChainingListenableFuture.this.setException(e7.getCause());
                        }
                        ChainingListenableFuture.this.mOutputFuture = null;
                    } catch (Throwable th2) {
                        ChainingListenableFuture.this.mOutputFuture = null;
                        throw th2;
                    }
                }
            }, CameraXExecutors.directExecutor());
            this.mFunction = null;
            this.mInputFuture = null;
            this.mOutputCreated.countDown();
            return;
        }
        outputFuture.cancel(((Boolean) takeUninterruptibly(this.mMayInterruptIfRunningChannel)).booleanValue());
        this.mOutputFuture = null;
        this.mFunction = null;
        this.mInputFuture = null;
        this.mOutputCreated.countDown();
    }

    private <E> E takeUninterruptibly(BlockingQueue<E> queue) {
        E take;
        boolean interrupted = false;
        while (true) {
            try {
                take = queue.take();
                break;
            } catch (InterruptedException e) {
                interrupted = true;
            } catch (Throwable th) {
                if (interrupted) {
                    Thread.currentThread().interrupt();
                }
                throw th;
            }
        }
        if (interrupted) {
            Thread.currentThread().interrupt();
        }
        return take;
    }

    private <E> void putUninterruptibly(BlockingQueue<E> queue, E element) {
        boolean interrupted = false;
        while (true) {
            try {
                queue.put(element);
                break;
            } catch (InterruptedException e) {
                interrupted = true;
            } catch (Throwable th) {
                if (interrupted) {
                    Thread.currentThread().interrupt();
                }
                throw th;
            }
        }
        if (!interrupted) {
            return;
        }
        Thread.currentThread().interrupt();
    }
}
