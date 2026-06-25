package com.hardlineforge.lala.data;

import com.google.android.gms.actions.SearchIntents;
import java.time.Instant;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlinx.coroutines.flow.Flow;
/* compiled from: DAOs.kt */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0003\bg\u0018\u00002\u00020\u0001J\u0014\u0010\u0002\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00050\u00040\u0003H'J\u0018\u0010\u0006\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0007\u001a\u00020\bH§@¢\u0006\u0002\u0010\tJ\u001c\u0010\n\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00050\u00040\u00032\u0006\u0010\u000b\u001a\u00020\bH'J\u001c\u0010\f\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00050\u00040\u00032\u0006\u0010\r\u001a\u00020\bH'J$\u0010\u000e\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00050\u00040\u00032\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0010H'J\u0016\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0005H§@¢\u0006\u0002\u0010\u0015J\u0016\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0014\u001a\u00020\u0005H§@¢\u0006\u0002\u0010\u0015J\u0016\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0014\u001a\u00020\u0005H§@¢\u0006\u0002\u0010\u0015J\u0016\u0010\u0019\u001a\u00020\u00172\u0006\u0010\u0007\u001a\u00020\bH§@¢\u0006\u0002\u0010\t¨\u0006\u001aÀ\u0006\u0003"}, d2 = {"Lcom/hardlineforge/lala/data/LogEntryDao;", "", "getAll", "Lkotlinx/coroutines/flow/Flow;", "", "Lcom/hardlineforge/lala/data/LogEntry;", "getById", "id", "", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getByCategory", "category", "search", SearchIntents.EXTRA_QUERY, "getByDateRange", "start", "Ljava/time/Instant;", "end", "insert", "", "entry", "(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "update", "", "delete", "deleteById", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public interface LogEntryDao {
    Object delete(LogEntry logEntry, Continuation<? super Unit> continuation);

    Object deleteById(String str, Continuation<? super Unit> continuation);

    Flow<List<LogEntry>> getAll();

    Flow<List<LogEntry>> getByCategory(String str);

    Flow<List<LogEntry>> getByDateRange(Instant instant, Instant instant2);

    Object getById(String str, Continuation<? super LogEntry> continuation);

    Object insert(LogEntry logEntry, Continuation<? super Long> continuation);

    Flow<List<LogEntry>> search(String str);

    Object update(LogEntry logEntry, Continuation<? super Unit> continuation);
}
