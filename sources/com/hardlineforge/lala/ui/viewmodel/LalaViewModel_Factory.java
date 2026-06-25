package com.hardlineforge.lala.ui.viewmodel;

import com.hardlineforge.lala.data.LogRepository;
import com.hardlineforge.lala.location.LocationManager;
import com.hardlineforge.lala.media.VideoFrameExtractor;
import com.hardlineforge.lala.pdf.PdfGenerator;
import dagger.internal.Factory;
import dagger.internal.Provider;
/* loaded from: classes4.dex */
public final class LalaViewModel_Factory implements Factory<LalaViewModel> {
    private final Provider<LocationManager> locationManagerProvider;
    private final Provider<PdfGenerator> pdfGeneratorProvider;
    private final Provider<LogRepository> repoProvider;
    private final Provider<VideoFrameExtractor> videoFrameExtractorProvider;

    private LalaViewModel_Factory(Provider<LogRepository> repoProvider, Provider<LocationManager> locationManagerProvider, Provider<VideoFrameExtractor> videoFrameExtractorProvider, Provider<PdfGenerator> pdfGeneratorProvider) {
        this.repoProvider = repoProvider;
        this.locationManagerProvider = locationManagerProvider;
        this.videoFrameExtractorProvider = videoFrameExtractorProvider;
        this.pdfGeneratorProvider = pdfGeneratorProvider;
    }

    @Override // javax.inject.Provider, jakarta.inject.Provider
    public LalaViewModel get() {
        return newInstance(this.repoProvider.get(), this.locationManagerProvider.get(), this.videoFrameExtractorProvider.get(), this.pdfGeneratorProvider.get());
    }

    public static LalaViewModel_Factory create(Provider<LogRepository> repoProvider, Provider<LocationManager> locationManagerProvider, Provider<VideoFrameExtractor> videoFrameExtractorProvider, Provider<PdfGenerator> pdfGeneratorProvider) {
        return new LalaViewModel_Factory(repoProvider, locationManagerProvider, videoFrameExtractorProvider, pdfGeneratorProvider);
    }

    public static LalaViewModel newInstance(LogRepository repo, LocationManager locationManager, VideoFrameExtractor videoFrameExtractor, PdfGenerator pdfGenerator) {
        return new LalaViewModel(repo, locationManager, videoFrameExtractor, pdfGenerator);
    }
}
