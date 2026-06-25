package androidx.camera.core.impl.utils.executor;

import androidx.core.util.Preconditions;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class SequentialExecutor implements Executor {
    private static final String TAG = "SequentialExecutor";
    private final Executor mExecutor;
    final Deque<Runnable> mQueue = new ArrayDeque();
    private final QueueWorker mWorker = new QueueWorker();
    WorkerRunningState mWorkerRunningState = WorkerRunningState.IDLE;
    long mWorkerRunCount = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public enum WorkerRunningState {
        IDLE,
        QUEUING,
        QUEUED,
        RUNNING
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public SequentialExecutor(Executor executor) {
        this.mExecutor = (Executor) Preconditions.checkNotNull(executor);
    }

    @Override // java.util.concurrent.Executor
    public void execute(final Runnable task) {
        Preconditions.checkNotNull(task);
        synchronized (this.mQueue) {
            if (this.mWorkerRunningState != WorkerRunningState.RUNNING && this.mWorkerRunningState != WorkerRunningState.QUEUED) {
                long oldRunCount = this.mWorkerRunCount;
                Runnable submittedTask = new Runnable() { // from class: androidx.camera.core.impl.utils.executor.SequentialExecutor.1
                    @Override // java.lang.Runnable
                    public void run() {
                        task.run();
                    }
                };
                this.mQueue.add(submittedTask);
                this.mWorkerRunningState = WorkerRunningState.QUEUING;
                try {
                    this.mExecutor.execute(this.mWorker);
                    removed = this.mWorkerRunningState != WorkerRunningState.QUEUING;
                    boolean alreadyMarkedQueued = removed;
                    if (alreadyMarkedQueued) {
                        return;
                    }
                    synchronized (this.mQueue) {
                        if (this.mWorkerRunCount == oldRunCount && this.mWorkerRunningState == WorkerRunningState.QUEUING) {
                            this.mWorkerRunningState = WorkerRunningState.QUEUED;
                        }
                    }
                    return;
                } catch (Error | RuntimeException t) {
                    synchronized (this.mQueue) {
                        if ((this.mWorkerRunningState != WorkerRunningState.IDLE && this.mWorkerRunningState != WorkerRunningState.QUEUING) || !this.mQueue.removeLastOccurrence(submittedTask)) {
                            removed = false;
                        }
                        if (!(t instanceof RejectedExecutionException) || removed) {
                            throw t;
                        }
                    }
                    return;
                }
            }
            this.mQueue.add(task);
        }
    }

    /* loaded from: classes.dex */
    final class QueueWorker implements Runnable {
        QueueWorker() {
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                workOnQueue();
            } catch (Error e) {
                synchronized (SequentialExecutor.this.mQueue) {
                    SequentialExecutor.this.mWorkerRunningState = WorkerRunningState.IDLE;
                    throw e;
                }
            }
        }

        /* JADX WARN: Code restructure failed: missing block: B:17:0x003f, code lost:
            if (r0 == false) goto L35;
         */
        /* JADX WARN: Code restructure failed: missing block: B:18:0x0041, code lost:
            java.lang.Thread.currentThread().interrupt();
         */
        /* JADX WARN: Code restructure failed: missing block: B:19:0x0048, code lost:
            return;
         */
        /* JADX WARN: Code restructure failed: missing block: B:22:0x004e, code lost:
            r0 = r0 | java.lang.Thread.interrupted();
         */
        /* JADX WARN: Code restructure failed: missing block: B:23:0x004f, code lost:
            r3.run();
         */
        /* JADX WARN: Code restructure failed: missing block: B:25:0x0053, code lost:
            r2 = move-exception;
         */
        /* JADX WARN: Code restructure failed: missing block: B:26:0x0054, code lost:
            androidx.camera.core.Logger.e(androidx.camera.core.impl.utils.executor.SequentialExecutor.TAG, "Exception while executing runnable " + r3, r2);
         */
        /* JADX WARN: Code restructure failed: missing block: B:44:?, code lost:
            return;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        private void workOnQueue() {
            /*
                r8 = this;
                r0 = 0
                r1 = 0
            L2:
                androidx.camera.core.impl.utils.executor.SequentialExecutor r2 = androidx.camera.core.impl.utils.executor.SequentialExecutor.this     // Catch: java.lang.Throwable -> L71
                java.util.Deque<java.lang.Runnable> r2 = r2.mQueue     // Catch: java.lang.Throwable -> L71
                monitor-enter(r2)     // Catch: java.lang.Throwable -> L71
                if (r1 != 0) goto L2c
                androidx.camera.core.impl.utils.executor.SequentialExecutor r3 = androidx.camera.core.impl.utils.executor.SequentialExecutor.this     // Catch: java.lang.Throwable -> L6e
                androidx.camera.core.impl.utils.executor.SequentialExecutor$WorkerRunningState r3 = r3.mWorkerRunningState     // Catch: java.lang.Throwable -> L6e
                androidx.camera.core.impl.utils.executor.SequentialExecutor$WorkerRunningState r4 = androidx.camera.core.impl.utils.executor.SequentialExecutor.WorkerRunningState.RUNNING     // Catch: java.lang.Throwable -> L6e
                if (r3 != r4) goto L1c
                monitor-exit(r2)     // Catch: java.lang.Throwable -> L6e
                if (r0 == 0) goto L1b
                java.lang.Thread r2 = java.lang.Thread.currentThread()
                r2.interrupt()
            L1b:
                return
            L1c:
                androidx.camera.core.impl.utils.executor.SequentialExecutor r3 = androidx.camera.core.impl.utils.executor.SequentialExecutor.this     // Catch: java.lang.Throwable -> L6e
                long r4 = r3.mWorkerRunCount     // Catch: java.lang.Throwable -> L6e
                r6 = 1
                long r4 = r4 + r6
                r3.mWorkerRunCount = r4     // Catch: java.lang.Throwable -> L6e
                androidx.camera.core.impl.utils.executor.SequentialExecutor r3 = androidx.camera.core.impl.utils.executor.SequentialExecutor.this     // Catch: java.lang.Throwable -> L6e
                androidx.camera.core.impl.utils.executor.SequentialExecutor$WorkerRunningState r4 = androidx.camera.core.impl.utils.executor.SequentialExecutor.WorkerRunningState.RUNNING     // Catch: java.lang.Throwable -> L6e
                r3.mWorkerRunningState = r4     // Catch: java.lang.Throwable -> L6e
                r1 = 1
            L2c:
                androidx.camera.core.impl.utils.executor.SequentialExecutor r3 = androidx.camera.core.impl.utils.executor.SequentialExecutor.this     // Catch: java.lang.Throwable -> L6e
                java.util.Deque<java.lang.Runnable> r3 = r3.mQueue     // Catch: java.lang.Throwable -> L6e
                java.lang.Object r3 = r3.poll()     // Catch: java.lang.Throwable -> L6e
                java.lang.Runnable r3 = (java.lang.Runnable) r3     // Catch: java.lang.Throwable -> L6e
                if (r3 != 0) goto L49
                androidx.camera.core.impl.utils.executor.SequentialExecutor r4 = androidx.camera.core.impl.utils.executor.SequentialExecutor.this     // Catch: java.lang.Throwable -> L6e
                androidx.camera.core.impl.utils.executor.SequentialExecutor$WorkerRunningState r5 = androidx.camera.core.impl.utils.executor.SequentialExecutor.WorkerRunningState.IDLE     // Catch: java.lang.Throwable -> L6e
                r4.mWorkerRunningState = r5     // Catch: java.lang.Throwable -> L6e
                monitor-exit(r2)     // Catch: java.lang.Throwable -> L6e
                if (r0 == 0) goto L48
                java.lang.Thread r2 = java.lang.Thread.currentThread()
                r2.interrupt()
            L48:
                return
            L49:
                monitor-exit(r2)     // Catch: java.lang.Throwable -> L6e
                boolean r2 = java.lang.Thread.interrupted()     // Catch: java.lang.Throwable -> L71
                r0 = r0 | r2
                r3.run()     // Catch: java.lang.RuntimeException -> L53 java.lang.Throwable -> L71
                goto L6d
            L53:
                r2 = move-exception
                java.lang.String r4 = "SequentialExecutor"
                java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L71
                r5.<init>()     // Catch: java.lang.Throwable -> L71
                java.lang.String r6 = "Exception while executing runnable "
                java.lang.StringBuilder r5 = r5.append(r6)     // Catch: java.lang.Throwable -> L71
                java.lang.StringBuilder r5 = r5.append(r3)     // Catch: java.lang.Throwable -> L71
                java.lang.String r5 = r5.toString()     // Catch: java.lang.Throwable -> L71
                androidx.camera.core.Logger.e(r4, r5, r2)     // Catch: java.lang.Throwable -> L71
            L6d:
                goto L2
            L6e:
                r3 = move-exception
                monitor-exit(r2)     // Catch: java.lang.Throwable -> L6e
                throw r3     // Catch: java.lang.Throwable -> L71
            L71:
                r2 = move-exception
                if (r0 == 0) goto L7b
                java.lang.Thread r3 = java.lang.Thread.currentThread()
                r3.interrupt()
            L7b:
                throw r2
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.camera.core.impl.utils.executor.SequentialExecutor.QueueWorker.workOnQueue():void");
        }
    }
}
