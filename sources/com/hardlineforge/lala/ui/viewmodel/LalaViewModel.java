package com.hardlineforge.lala.ui.viewmodel;

import androidx.autofill.HintConstants;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.lifecycle.ViewModel;
import androidx.lifecycle.ViewModelKt;
import com.hardlineforge.lala.data.CustomCategory;
import com.hardlineforge.lala.data.EditHistory;
import com.hardlineforge.lala.data.LogEntry;
import com.hardlineforge.lala.data.LogRepository;
import com.hardlineforge.lala.data.Photo;
import com.hardlineforge.lala.data.Video;
import com.hardlineforge.lala.data.VideoFrame;
import com.hardlineforge.lala.location.LocationManager;
import com.hardlineforge.lala.media.VideoFrameExtractor;
import com.hardlineforge.lala.pdf.PdfGenerator;
import java.time.Instant;
import java.util.List;
import javax.inject.Inject;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.flow.Flow;
import kotlinx.coroutines.flow.FlowKt;
import kotlinx.coroutines.flow.MutableStateFlow;
import kotlinx.coroutines.flow.SharingStarted;
import kotlinx.coroutines.flow.StateFlow;
import kotlinx.coroutines.flow.StateFlowKt;
/* compiled from: LalaViewModel.kt */
@Metadata(d1 = {"\u0000\u009a\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001B)\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ\u000e\u00103\u001a\u0002042\u0006\u00105\u001a\u00020 J\u000e\u00106\u001a\u0002042\u0006\u00107\u001a\u00020 J\"\u00108\u001a\u0002042\u0006\u00109\u001a\u00020\u00152\u0006\u0010:\u001a\u00020;2\n\b\u0002\u0010<\u001a\u0004\u0018\u00010 J\u000e\u0010=\u001a\u0002042\u0006\u00109\u001a\u00020\u0015J\u000e\u0010>\u001a\u0002042\u0006\u0010?\u001a\u00020$J\u000e\u0010@\u001a\u0002042\u0006\u0010?\u001a\u00020$J\u000e\u0010A\u001a\u0002042\u0006\u0010B\u001a\u00020(J\u0018\u0010C\u001a\u0004\u0018\u00010(2\u0006\u0010D\u001a\u00020 H\u0086@¢\u0006\u0002\u0010EJ\u001c\u0010F\u001a\b\u0012\u0004\u0012\u00020G0\u00142\u0006\u0010H\u001a\u00020 H\u0086@¢\u0006\u0002\u0010EJ\u000e\u0010I\u001a\u0002042\u0006\u0010J\u001a\u00020GJ\u000e\u0010K\u001a\u0002042\u0006\u0010B\u001a\u00020(J\u000e\u0010L\u001a\u0002042\u0006\u0010H\u001a\u00020 J\u000e\u0010M\u001a\u0002042\u0006\u0010N\u001a\u00020 J\u000e\u0010O\u001a\u0002042\u0006\u0010P\u001a\u00020\u0019J\f\u0010Q\u001a\b\u0012\u0004\u0012\u00020 0\u0014J\u0006\u0010R\u001a\u000204J&\u0010S\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00150\u00140T2\b\u0010U\u001a\u0004\u0018\u00010V2\b\u0010W\u001a\u0004\u0018\u00010VJ\u0010\u0010X\u001a\u0004\u0018\u00010YH\u0086@¢\u0006\u0002\u0010ZR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u0011\u0010\f\u001a\u00020\u00078F¢\u0006\u0006\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u000f\u001a\u00020\t8F¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u0011R\u001d\u0010\u0012\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00150\u00140\u0013¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u001d\u0010\u0018\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00190\u00140\u0013¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0017R\u0016\u0010\u001b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00150\u001cX\u0082\u0004¢\u0006\u0002\n\u0000R\u0019\u0010\u001d\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00150\u0013¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u0017R\u0014\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020 0\u001cX\u0082\u0004¢\u0006\u0002\n\u0000R\u001d\u0010!\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00150\u00140\u0013¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010\u0017R\u001a\u0010#\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020$0\u00140\u001cX\u0082\u0004¢\u0006\u0002\n\u0000R\u001d\u0010%\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020$0\u00140\u0013¢\u0006\b\n\u0000\u001a\u0004\b&\u0010\u0017R\u001a\u0010'\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020(0\u00140\u001cX\u0082\u0004¢\u0006\u0002\n\u0000R\u001d\u0010)\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020(0\u00140\u0013¢\u0006\b\n\u0000\u001a\u0004\b*\u0010\u0017R\u001a\u0010+\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020,0\u00140\u001cX\u0082\u0004¢\u0006\u0002\n\u0000R\u001d\u0010-\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020,0\u00140\u0013¢\u0006\b\n\u0000\u001a\u0004\b.\u0010\u0017R\u001a\u0010/\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u0002000\u00140\u001cX\u0082\u0004¢\u0006\u0002\n\u0000R\u001d\u00101\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u0002000\u00140\u0013¢\u0006\b\n\u0000\u001a\u0004\b2\u0010\u0017¨\u0006["}, d2 = {"Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;", "Landroidx/lifecycle/ViewModel;", "repo", "Lcom/hardlineforge/lala/data/LogRepository;", "locationManager", "Lcom/hardlineforge/lala/location/LocationManager;", "videoFrameExtractor", "Lcom/hardlineforge/lala/media/VideoFrameExtractor;", "pdfGenerator", "Lcom/hardlineforge/lala/pdf/PdfGenerator;", "<init>", "(Lcom/hardlineforge/lala/data/LogRepository;Lcom/hardlineforge/lala/location/LocationManager;Lcom/hardlineforge/lala/media/VideoFrameExtractor;Lcom/hardlineforge/lala/pdf/PdfGenerator;)V", "frameExtractor", "getFrameExtractor", "()Lcom/hardlineforge/lala/media/VideoFrameExtractor;", "pdfGen", "getPdfGen", "()Lcom/hardlineforge/lala/pdf/PdfGenerator;", "allEntries", "Lkotlinx/coroutines/flow/StateFlow;", "", "Lcom/hardlineforge/lala/data/LogEntry;", "getAllEntries", "()Lkotlinx/coroutines/flow/StateFlow;", "customCategories", "Lcom/hardlineforge/lala/data/CustomCategory;", "getCustomCategories", "_selectedEntry", "Lkotlinx/coroutines/flow/MutableStateFlow;", "selectedEntry", "getSelectedEntry", "_searchQuery", "", "searchResults", "getSearchResults", "_photos", "Lcom/hardlineforge/lala/data/Photo;", "photos", "getPhotos", "_videos", "Lcom/hardlineforge/lala/data/Video;", "videos", "getVideos", "_editHistory", "Lcom/hardlineforge/lala/data/EditHistory;", "editHistory", "getEditHistory", "_allMedia", "", "allMedia", "getAllMedia", "setSearchQuery", "", "q", "loadEntry", "entryId", "saveEntry", "entry", "isNew", "", "editNote", "deleteEntry", "addPhoto", "photo", "deletePhoto", "addVideo", "video", "getVideoById", "id", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getVideoFrames", "Lcom/hardlineforge/lala/data/VideoFrame;", "videoId", "addVideoFrame", TypedValues.AttributesType.S_FRAME, "deleteVideo", "deleteVideoFrames", "addCustomCategory", HintConstants.AUTOFILL_HINT_NAME, "deleteCustomCategory", "category", "getDefaultCategories", "loadAllMedia", "exportEntries", "Lkotlinx/coroutines/flow/Flow;", "start", "Ljava/time/Instant;", "end", "captureLocation", "Landroid/location/Location;", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class LalaViewModel extends ViewModel {
    public static final int $stable = 8;
    private final MutableStateFlow<List<Object>> _allMedia;
    private final MutableStateFlow<List<EditHistory>> _editHistory;
    private final MutableStateFlow<List<Photo>> _photos;
    private final MutableStateFlow<String> _searchQuery;
    private final MutableStateFlow<LogEntry> _selectedEntry;
    private final MutableStateFlow<List<Video>> _videos;
    private final StateFlow<List<LogEntry>> allEntries;
    private final StateFlow<List<Object>> allMedia;
    private final StateFlow<List<CustomCategory>> customCategories;
    private final StateFlow<List<EditHistory>> editHistory;
    private final LocationManager locationManager;
    private final PdfGenerator pdfGenerator;
    private final StateFlow<List<Photo>> photos;
    private final LogRepository repo;
    private final StateFlow<List<LogEntry>> searchResults;
    private final StateFlow<LogEntry> selectedEntry;
    private final VideoFrameExtractor videoFrameExtractor;
    private final StateFlow<List<Video>> videos;

    @Inject
    public LalaViewModel(LogRepository repo, LocationManager locationManager, VideoFrameExtractor videoFrameExtractor, PdfGenerator pdfGenerator) {
        Intrinsics.checkNotNullParameter(repo, "repo");
        Intrinsics.checkNotNullParameter(locationManager, "locationManager");
        Intrinsics.checkNotNullParameter(videoFrameExtractor, "videoFrameExtractor");
        Intrinsics.checkNotNullParameter(pdfGenerator, "pdfGenerator");
        this.repo = repo;
        this.locationManager = locationManager;
        this.videoFrameExtractor = videoFrameExtractor;
        this.pdfGenerator = pdfGenerator;
        this.allEntries = FlowKt.stateIn(this.repo.getAllEntries(), ViewModelKt.getViewModelScope(this), SharingStarted.Companion.WhileSubscribed$default(SharingStarted.Companion, 5000L, 0L, 2, null), CollectionsKt.emptyList());
        this.customCategories = FlowKt.stateIn(this.repo.getCustomCategories(), ViewModelKt.getViewModelScope(this), SharingStarted.Companion.WhileSubscribed$default(SharingStarted.Companion, 5000L, 0L, 2, null), CollectionsKt.emptyList());
        this._selectedEntry = StateFlowKt.MutableStateFlow(null);
        this.selectedEntry = FlowKt.asStateFlow(this._selectedEntry);
        this._searchQuery = StateFlowKt.MutableStateFlow("");
        this.searchResults = FlowKt.stateIn(FlowKt.transformLatest(this._searchQuery, new LalaViewModel$special$$inlined$flatMapLatest$1(null, this)), ViewModelKt.getViewModelScope(this), SharingStarted.Companion.WhileSubscribed$default(SharingStarted.Companion, 5000L, 0L, 2, null), CollectionsKt.emptyList());
        this._photos = StateFlowKt.MutableStateFlow(CollectionsKt.emptyList());
        this.photos = FlowKt.asStateFlow(this._photos);
        this._videos = StateFlowKt.MutableStateFlow(CollectionsKt.emptyList());
        this.videos = FlowKt.asStateFlow(this._videos);
        this._editHistory = StateFlowKt.MutableStateFlow(CollectionsKt.emptyList());
        this.editHistory = FlowKt.asStateFlow(this._editHistory);
        this._allMedia = StateFlowKt.MutableStateFlow(CollectionsKt.emptyList());
        this.allMedia = FlowKt.asStateFlow(this._allMedia);
    }

    public final VideoFrameExtractor getFrameExtractor() {
        return this.videoFrameExtractor;
    }

    public final PdfGenerator getPdfGen() {
        return this.pdfGenerator;
    }

    public final StateFlow<List<LogEntry>> getAllEntries() {
        return this.allEntries;
    }

    public final StateFlow<List<CustomCategory>> getCustomCategories() {
        return this.customCategories;
    }

    public final StateFlow<LogEntry> getSelectedEntry() {
        return this.selectedEntry;
    }

    public final StateFlow<List<LogEntry>> getSearchResults() {
        return this.searchResults;
    }

    public final StateFlow<List<Photo>> getPhotos() {
        return this.photos;
    }

    public final StateFlow<List<Video>> getVideos() {
        return this.videos;
    }

    public final StateFlow<List<EditHistory>> getEditHistory() {
        return this.editHistory;
    }

    public final StateFlow<List<Object>> getAllMedia() {
        return this.allMedia;
    }

    public final void setSearchQuery(String q) {
        Intrinsics.checkNotNullParameter(q, "q");
        this._searchQuery.setValue(q);
    }

    public final void loadEntry(String entryId) {
        Intrinsics.checkNotNullParameter(entryId, "entryId");
        BuildersKt.launch$default(ViewModelKt.getViewModelScope(this), null, null, new LalaViewModel$loadEntry$1(this, entryId, null), 3, null);
    }

    public static /* synthetic */ void saveEntry$default(LalaViewModel lalaViewModel, LogEntry logEntry, boolean z, String str, int i, Object obj) {
        if ((i & 4) != 0) {
            str = null;
        }
        lalaViewModel.saveEntry(logEntry, z, str);
    }

    public final void saveEntry(LogEntry entry, boolean isNew, String editNote) {
        Intrinsics.checkNotNullParameter(entry, "entry");
        BuildersKt.launch$default(ViewModelKt.getViewModelScope(this), null, null, new LalaViewModel$saveEntry$1(isNew, this, entry, editNote, null), 3, null);
    }

    public final void deleteEntry(LogEntry entry) {
        Intrinsics.checkNotNullParameter(entry, "entry");
        BuildersKt.launch$default(ViewModelKt.getViewModelScope(this), null, null, new LalaViewModel$deleteEntry$1(this, entry, null), 3, null);
    }

    public final void addPhoto(Photo photo) {
        Intrinsics.checkNotNullParameter(photo, "photo");
        BuildersKt.launch$default(ViewModelKt.getViewModelScope(this), null, null, new LalaViewModel$addPhoto$1(this, photo, null), 3, null);
    }

    public final void deletePhoto(Photo photo) {
        Intrinsics.checkNotNullParameter(photo, "photo");
        BuildersKt.launch$default(ViewModelKt.getViewModelScope(this), null, null, new LalaViewModel$deletePhoto$1(this, photo, null), 3, null);
    }

    public final void addVideo(Video video) {
        Intrinsics.checkNotNullParameter(video, "video");
        BuildersKt.launch$default(ViewModelKt.getViewModelScope(this), null, null, new LalaViewModel$addVideo$1(this, video, null), 3, null);
    }

    public final Object getVideoById(String id, Continuation<? super Video> continuation) {
        return this.repo.getVideoById(id, continuation);
    }

    public final Object getVideoFrames(String videoId, Continuation<? super List<VideoFrame>> continuation) {
        return this.repo.getVideoFrames(videoId, continuation);
    }

    public final void addVideoFrame(VideoFrame frame) {
        Intrinsics.checkNotNullParameter(frame, "frame");
        BuildersKt.launch$default(ViewModelKt.getViewModelScope(this), null, null, new LalaViewModel$addVideoFrame$1(this, frame, null), 3, null);
    }

    public final void deleteVideo(Video video) {
        Intrinsics.checkNotNullParameter(video, "video");
        BuildersKt.launch$default(ViewModelKt.getViewModelScope(this), null, null, new LalaViewModel$deleteVideo$1(this, video, null), 3, null);
    }

    public final void deleteVideoFrames(String videoId) {
        Intrinsics.checkNotNullParameter(videoId, "videoId");
        BuildersKt.launch$default(ViewModelKt.getViewModelScope(this), null, null, new LalaViewModel$deleteVideoFrames$1(this, videoId, null), 3, null);
    }

    public final void addCustomCategory(String name) {
        Intrinsics.checkNotNullParameter(name, "name");
        BuildersKt.launch$default(ViewModelKt.getViewModelScope(this), null, null, new LalaViewModel$addCustomCategory$1(this, name, null), 3, null);
    }

    public final void deleteCustomCategory(CustomCategory category) {
        Intrinsics.checkNotNullParameter(category, "category");
        BuildersKt.launch$default(ViewModelKt.getViewModelScope(this), null, null, new LalaViewModel$deleteCustomCategory$1(this, category, null), 3, null);
    }

    public final List<String> getDefaultCategories() {
        return CollectionsKt.listOf((Object[]) new String[]{"Noise", "Suspicious Activity", "Property Damage", "Animal Issue", "Parking", "Trash / Yard", "HOA / Code Violation", "Safety Hazard", "Poaching / Wildlife", "Other"});
    }

    public final void loadAllMedia() {
        BuildersKt.launch$default(ViewModelKt.getViewModelScope(this), null, null, new LalaViewModel$loadAllMedia$1(this, null), 3, null);
    }

    public final Flow<List<LogEntry>> exportEntries(Instant start, Instant end) {
        if (start != null && end != null) {
            return this.repo.getEntriesByDateRange(start, end);
        }
        return this.repo.getAllEntries();
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0025  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002d A[Catch: Exception -> 0x0032, TRY_ENTER, TRY_LEAVE, TryCatch #0 {Exception -> 0x0032, blocks: (B:12:0x002d, B:23:0x0051, B:20:0x0041), top: B:27:0x0022 }] */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0034  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object captureLocation(kotlin.coroutines.Continuation<? super android.location.Location> r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof com.hardlineforge.lala.ui.viewmodel.LalaViewModel$captureLocation$1
            if (r0 == 0) goto L14
            r0 = r7
            com.hardlineforge.lala.ui.viewmodel.LalaViewModel$captureLocation$1 r0 = (com.hardlineforge.lala.ui.viewmodel.LalaViewModel$captureLocation$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            com.hardlineforge.lala.ui.viewmodel.LalaViewModel$captureLocation$1 r0 = new com.hardlineforge.lala.ui.viewmodel.LalaViewModel$captureLocation$1
            r0.<init>(r6, r7)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            r4 = 0
            switch(r3) {
                case 0: goto L34;
                case 1: goto L2d;
                default: goto L25;
            }
        L25:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException
            java.lang.String r1 = "call to 'resume' before 'invoke' with coroutine"
            r0.<init>(r1)
            throw r0
        L2d:
            kotlin.ResultKt.throwOnFailure(r1)     // Catch: java.lang.Exception -> L32
            r3 = r1
            goto L51
        L32:
            r2 = move-exception
            goto L55
        L34:
            kotlin.ResultKt.throwOnFailure(r1)
            com.hardlineforge.lala.location.LocationManager r3 = r6.locationManager
            boolean r3 = r3.hasPermission()
            if (r3 != 0) goto L40
            return r4
        L40:
            com.hardlineforge.lala.location.LocationManager r3 = r6.locationManager     // Catch: java.lang.Exception -> L32
            kotlinx.coroutines.flow.Flow r3 = r3.currentLocation()     // Catch: java.lang.Exception -> L32
            r5 = 1
            r0.label = r5     // Catch: java.lang.Exception -> L32
            java.lang.Object r3 = kotlinx.coroutines.flow.FlowKt.firstOrNull(r3, r0)     // Catch: java.lang.Exception -> L32
            if (r3 != r2) goto L51
            return r2
        L51:
            android.location.Location r3 = (android.location.Location) r3     // Catch: java.lang.Exception -> L32
            r4 = r3
            goto L56
        L55:
        L56:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.viewmodel.LalaViewModel.captureLocation(kotlin.coroutines.Continuation):java.lang.Object");
    }
}
