package com.hardlineforge.lala.data;

import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
/* compiled from: DAOs.kt */
@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0004\bg\u0018\u00002\u00020\u0001J\u001c\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\u0006\u0010\u0005\u001a\u00020\u0006H§@¢\u0006\u0002\u0010\u0007J\u0018\u0010\b\u001a\u0004\u0018\u00010\u00042\u0006\u0010\t\u001a\u00020\u0006H§@¢\u0006\u0002\u0010\u0007J\u0016\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\u0004H§@¢\u0006\u0002\u0010\rJ\u0016\u0010\u000e\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\u0004H§@¢\u0006\u0002\u0010\r¨\u0006\u000fÀ\u0006\u0003"}, d2 = {"Lcom/hardlineforge/lala/data/VideoDao;", "", "getByEntryId", "", "Lcom/hardlineforge/lala/data/Video;", "entryId", "", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getById", "id", "insert", "", "video", "(Lcom/hardlineforge/lala/data/Video;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "delete", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public interface VideoDao {
    Object delete(Video video, Continuation<? super Unit> continuation);

    Object getByEntryId(String str, Continuation<? super List<Video>> continuation);

    Object getById(String str, Continuation<? super Video> continuation);

    Object insert(Video video, Continuation<? super Unit> continuation);
}
