package androidx.camera.core.impl.utils.executor;

import android.os.Process;
import androidx.camera.core.impl.utils.executor.AudioExecutor;
import java.util.Locale;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes.dex */
public class AudioExecutor implements Executor {
    private static volatile Executor sExecutor;
    private final ExecutorService mAudioService = Executors.newFixedThreadPool(2, new AnonymousClass1());

    /* renamed from: androidx.camera.core.impl.utils.executor.AudioExecutor$1  reason: invalid class name */
    /* loaded from: classes.dex */
    class AnonymousClass1 implements ThreadFactory {
        private static final String THREAD_NAME_STEM = "CameraX-camerax_audio_%d";
        private final AtomicInteger mThreadId = new AtomicInteger(0);

        AnonymousClass1() {
        }

        @Override // java.util.concurrent.ThreadFactory
        public Thread newThread(final Runnable r) {
            Runnable wrapper = new Runnable() { // from class: androidx.camera.core.impl.utils.executor.AudioExecutor$1$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    AudioExecutor.AnonymousClass1.lambda$newThread$0(r);
                }
            };
            Thread t = new Thread(wrapper);
            t.setName(String.format(Locale.US, THREAD_NAME_STEM, Integer.valueOf(this.mThreadId.getAndIncrement())));
            return t;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ void lambda$newThread$0(Runnable r) {
            Process.setThreadPriority(-16);
            r.run();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Executor getInstance() {
        if (sExecutor != null) {
            return sExecutor;
        }
        synchronized (AudioExecutor.class) {
            if (sExecutor == null) {
                sExecutor = new AudioExecutor();
            }
        }
        return sExecutor;
    }

    @Override // java.util.concurrent.Executor
    public void execute(Runnable command) {
        this.mAudioService.execute(command);
    }
}
