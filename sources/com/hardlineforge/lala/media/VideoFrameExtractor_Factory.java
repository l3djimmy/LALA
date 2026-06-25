package com.hardlineforge.lala.media;

import android.content.Context;
import dagger.internal.Factory;
import dagger.internal.Provider;
/* loaded from: classes6.dex */
public final class VideoFrameExtractor_Factory implements Factory<VideoFrameExtractor> {
    private final Provider<Context> contextProvider;

    private VideoFrameExtractor_Factory(Provider<Context> contextProvider) {
        this.contextProvider = contextProvider;
    }

    @Override // javax.inject.Provider, jakarta.inject.Provider
    public VideoFrameExtractor get() {
        return newInstance(this.contextProvider.get());
    }

    public static VideoFrameExtractor_Factory create(Provider<Context> contextProvider) {
        return new VideoFrameExtractor_Factory(contextProvider);
    }

    public static VideoFrameExtractor newInstance(Context context) {
        return new VideoFrameExtractor(context);
    }
}
