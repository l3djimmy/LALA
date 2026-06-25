package androidx.compose.runtime.snapshots;

import androidx.autofill.HintConstants;
import androidx.collection.MutableScatterSet;
import androidx.collection.ScatterSet;
import androidx.compose.runtime.collection.ScatterSetWrapperKt;
import androidx.compose.runtime.internal.AtomicInt;
import androidx.compose.runtime.internal.SnapshotThreadLocal;
import androidx.compose.runtime.internal.WeakReference;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.exifinterface.media.ExifInterface;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Snapshot.kt */
@Metadata(d1 = {"\u0000\u009c\u0001\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0010\"\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010$\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0001\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0017\n\u0002\u0018\u0002\n\u0002\b\n\u001a\b\u0010'\u001a\u00020\tH\u0002\u001a6\u0010'\u001a\u0002H(\"\u0004\b\u0000\u0010(2!\u0010)\u001a\u001d\u0012\u0013\u0012\u00110\f¢\u0006\f\b\r\u0012\b\b\u000e\u0012\u0004\b\b(\u000f\u0012\u0004\u0012\u0002H(0\u000bH\u0002¢\u0006\u0002\u0010*\u001a\b\u0010+\u001a\u00020\tH\u0002\u001a4\u0010,\u001a\u00020\b2\b\u0010-\u001a\u0004\u0018\u00010\b2\u0016\b\u0002\u0010.\u001a\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\t\u0018\u00010\u000b2\b\b\u0002\u0010/\u001a\u000200H\u0002\u001a\u001f\u00101\u001a\u0002H(\"\b\b\u0000\u0010(*\u0002022\u0006\u00103\u001a\u0002H(H\u0001¢\u0006\u0002\u00104\u001a'\u00101\u001a\u0002H(\"\b\b\u0000\u0010(*\u0002022\u0006\u00103\u001a\u0002H(2\u0006\u00105\u001a\u00020\bH\u0001¢\u0006\u0002\u00106\u001a\b\u00107\u001a\u00020\bH\u0000\u001aL\u00108\u001a\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\t\u0018\u00010\u000b2\u0014\u0010.\u001a\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\t\u0018\u00010\u000b2\u0014\u00109\u001a\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\t\u0018\u00010\u000b2\b\b\u0002\u0010:\u001a\u000200H\u0002\u001aB\u0010;\u001a\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\t\u0018\u00010\u000b2\u0014\u0010<\u001a\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\t\u0018\u00010\u000b2\u0014\u00109\u001a\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\t\u0018\u00010\u000bH\u0002\u001a\u0018\u0010=\u001a\u00020\t2\u0006\u00105\u001a\u00020\b2\u0006\u0010>\u001a\u00020\u0012H\u0001\u001a2\u0010?\u001a\u0010\u0012\u0004\u0012\u000202\u0012\u0004\u0012\u000202\u0018\u00010@2\n\u0010A\u001a\u00060\u0001j\u0002`\u00022\u0006\u0010B\u001a\u00020C2\u0006\u0010D\u001a\u00020\fH\u0002\u001a\u0010\u0010E\u001a\u0002002\u0006\u0010>\u001a\u00020\u0012H\u0002\u001a\u0010\u0010F\u001a\u00020\t2\u0006\u0010>\u001a\u00020\u0012H\u0002\u001a\b\u0010G\u001a\u00020HH\u0002\u001a5\u0010I\u001a\u0004\u0018\u0001H(\"\b\b\u0000\u0010(*\u0002022\u0006\u00103\u001a\u0002H(2\n\u0010J\u001a\u00060\u0001j\u0002`\u00022\u0006\u0010\u000f\u001a\u00020\fH\u0002¢\u0006\u0002\u0010K\u001a\u0010\u0010L\u001a\u00020\t2\u0006\u0010M\u001a\u00020NH\u0000\u001a\b\u0010O\u001a\u00020HH\u0002\u001a>\u0010P\u001a\u0002H(\"\u0004\b\u0000\u0010(2\u0006\u0010\u0013\u001a\u00020\u00142!\u0010)\u001a\u001d\u0012\u0013\u0012\u00110\f¢\u0006\f\b\r\u0012\b\b\u000e\u0012\u0004\b\b(\u000f\u0012\u0004\u0012\u0002H(0\u000bH\u0002¢\u0006\u0002\u0010Q\u001a/\u0010R\u001a\u0002H(\"\u0004\b\u0000\u0010(2\f\u0010)\u001a\b\u0012\u0004\u0012\u0002H(0SH\u0081\b\u0082\u0002\n\n\b\b\u0001\u0012\u0002\u0010\u0001 \u0001¢\u0006\u0002\u0010T\u001a:\u0010U\u001a\u0002H(\"\b\b\u0000\u0010(*\u00020\b2!\u0010)\u001a\u001d\u0012\u0013\u0012\u00110\f¢\u0006\f\b\r\u0012\b\b\u000e\u0012\u0004\b\b(\u000f\u0012\u0004\u0012\u0002H(0\u000bH\u0002¢\u0006\u0002\u0010V\u001a\u001c\u0010W\u001a\u00020N2\n\u0010X\u001a\u00060\u0001j\u0002`\u00022\u0006\u0010\u000f\u001a\u00020\fH\u0000\u001a\u0012\u0010Y\u001a\u0004\u0018\u0001022\u0006\u0010>\u001a\u00020\u0012H\u0002\u001a(\u0010Z\u001a\u0002002\n\u00107\u001a\u00060\u0001j\u0002`\u00022\n\u0010[\u001a\u00060\u0001j\u0002`\u00022\u0006\u0010\u000f\u001a\u00020\fH\u0002\u001a$\u0010Z\u001a\u0002002\u0006\u0010\\\u001a\u0002022\n\u00105\u001a\u00060\u0001j\u0002`\u00022\u0006\u0010\u000f\u001a\u00020\fH\u0002\u001a\u0010\u0010]\u001a\u00020\t2\u0006\u00105\u001a\u00020\bH\u0002\u001a$\u0010^\u001a\u00020\f*\u00020\f2\n\u0010_\u001a\u00060\u0001j\u0002`\u00022\n\u0010`\u001a\u00060\u0001j\u0002`\u0002H\u0000\u001a!\u0010a\u001a\u000202*\u0002022\u0012\u0010b\u001a\u000e\u0012\u0004\u0012\u000202\u0012\u0004\u0012\u0002000\u000bH\u0082\b\u001a#\u0010c\u001a\u0002H(\"\b\b\u0000\u0010(*\u000202*\u0002H(2\u0006\u0010>\u001a\u00020\u0012H\u0000¢\u0006\u0002\u0010d\u001a+\u0010e\u001a\u0002H(\"\b\b\u0000\u0010(*\u000202*\u0002H(2\u0006\u0010>\u001a\u00020\u00122\u0006\u00105\u001a\u00020\bH\u0000¢\u0006\u0002\u0010f\u001a+\u0010g\u001a\u0002H(\"\b\b\u0000\u0010(*\u000202*\u0002H(2\u0006\u0010>\u001a\u00020\u00122\u0006\u00105\u001a\u00020\bH\u0002¢\u0006\u0002\u0010f\u001aK\u0010h\u001a\u0002Hi\"\b\b\u0000\u0010(*\u000202\"\u0004\b\u0001\u0010i*\u0002H(2\u0006\u0010>\u001a\u00020\u00122\u0006\u0010j\u001a\u0002H(2\u0017\u0010)\u001a\u0013\u0012\u0004\u0012\u0002H(\u0012\u0004\u0012\u0002Hi0\u000b¢\u0006\u0002\bkH\u0080\b¢\u0006\u0002\u0010l\u001a3\u0010m\u001a\u0002H(\"\b\b\u0000\u0010(*\u000202*\u0002H(2\u0006\u0010>\u001a\u00020\u00122\u0006\u00105\u001a\u00020\b2\u0006\u0010j\u001a\u0002H(H\u0000¢\u0006\u0002\u0010n\u001a!\u0010I\u001a\u0002H(\"\b\b\u0000\u0010(*\u000202*\u0002H(2\u0006\u0010>\u001a\u00020\u0012¢\u0006\u0002\u0010d\u001a)\u0010I\u001a\u0002H(\"\b\b\u0000\u0010(*\u000202*\u0002H(2\u0006\u0010>\u001a\u00020\u00122\u0006\u00105\u001a\u00020\b¢\u0006\u0002\u0010f\u001aE\u0010o\u001a\u0002Hi\"\b\b\u0000\u0010(*\u000202\"\u0004\b\u0001\u0010i*\u0002H(2!\u0010)\u001a\u001d\u0012\u0013\u0012\u0011H(¢\u0006\f\b\r\u0012\b\b\u000e\u0012\u0004\b\b(3\u0012\u0004\u0012\u0002Hi0\u000bH\u0086\b¢\u0006\u0002\u0010p\u001aC\u0010q\u001a\u0002Hi\"\b\b\u0000\u0010(*\u000202\"\u0004\b\u0001\u0010i*\u0002H(2\u0006\u0010>\u001a\u00020\u00122\u0017\u0010)\u001a\u0013\u0012\u0004\u0012\u0002H(\u0012\u0004\u0012\u0002Hi0\u000b¢\u0006\u0002\bkH\u0086\b¢\u0006\u0002\u0010r\u001aK\u0010q\u001a\u0002Hi\"\b\b\u0000\u0010(*\u000202\"\u0004\b\u0001\u0010i*\u0002H(2\u0006\u0010>\u001a\u00020\u00122\u0006\u00105\u001a\u00020\b2\u0017\u0010)\u001a\u0013\u0012\u0004\u0012\u0002H(\u0012\u0004\u0012\u0002Hi0\u000b¢\u0006\u0002\bkH\u0086\b¢\u0006\u0002\u0010s\u001a+\u0010t\u001a\u0002H(\"\b\b\u0000\u0010(*\u000202*\u0002H(2\u0006\u0010>\u001a\u00020\u00122\u0006\u00105\u001a\u00020\bH\u0001¢\u0006\u0002\u0010f\"\u0012\u0010\u0000\u001a\u00060\u0001j\u0002`\u0002X\u0082D¢\u0006\u0002\n\u0000\",\u0010\u0003\u001a \u0012\u001c\u0012\u001a\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00070\u0006\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\t0\u00050\u0004X\u0082\u000e¢\u0006\u0002\n\u0000\")\u0010\n\u001a\u001d\u0012\u0013\u0012\u00110\f¢\u0006\f\b\r\u0012\b\b\u000e\u0012\u0004\b\b(\u000f\u0012\u0004\u0012\u00020\t0\u000bX\u0082\u0004¢\u0006\u0002\n\u0000\"\u0014\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00120\u0011X\u0082\u0004¢\u0006\u0002\n\u0000\"\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u0004¢\u0006\u0002\n\u0000\" \u0010\u0015\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\t0\u000b0\u0004X\u0082\u000e¢\u0006\u0002\n\u0000\"\u001c\u0010\u0016\u001a\u00020\u00078\u0000X\u0081\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0017\u0010\u0018\u001a\u0004\b\u0019\u0010\u001a\"\u000e\u0010\u001b\u001a\u00020\u0001X\u0082\u000e¢\u0006\u0002\n\u0000\"\u000e\u0010\u001c\u001a\u00020\fX\u0082\u000e¢\u0006\u0002\n\u0000\"\u000e\u0010\u001d\u001a\u00020\u001eX\u0082\u000e¢\u0006\u0002\n\u0000\"\u000e\u0010\u001f\u001a\u00020 X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001c\u0010!\u001a\u00020\b8\u0000X\u0081\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\"\u0010\u0018\u001a\u0004\b#\u0010$\"\u0014\u0010%\u001a\b\u0012\u0004\u0012\u00020\b0&X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006u"}, d2 = {"INVALID_SNAPSHOT", "", "Landroidx/compose/runtime/snapshots/SnapshotId;", "applyObservers", "", "Lkotlin/Function2;", "", "", "Landroidx/compose/runtime/snapshots/Snapshot;", "", "emptyLambda", "Lkotlin/Function1;", "Landroidx/compose/runtime/snapshots/SnapshotIdSet;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "invalid", "extraStateObjects", "Landroidx/compose/runtime/snapshots/SnapshotWeakSet;", "Landroidx/compose/runtime/snapshots/StateObject;", "globalSnapshot", "Landroidx/compose/runtime/snapshots/GlobalSnapshot;", "globalWriteObservers", "lock", "getLock$annotations", "()V", "getLock", "()Ljava/lang/Object;", "nextSnapshotId", "openSnapshots", "pendingApplyObserverCount", "Landroidx/compose/runtime/internal/AtomicInt;", "pinningTable", "Landroidx/compose/runtime/snapshots/SnapshotDoubleIndexHeap;", "snapshotInitializer", "getSnapshotInitializer$annotations", "getSnapshotInitializer", "()Landroidx/compose/runtime/snapshots/Snapshot;", "threadSnapshot", "Landroidx/compose/runtime/internal/SnapshotThreadLocal;", "advanceGlobalSnapshot", ExifInterface.GPS_DIRECTION_TRUE, "block", "(Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "checkAndOverwriteUnusedRecordsLocked", "createTransparentSnapshotWithNoParentReadObserver", "previousSnapshot", "readObserver", "ownsPreviousSnapshot", "", "current", "Landroidx/compose/runtime/snapshots/StateRecord;", "r", "(Landroidx/compose/runtime/snapshots/StateRecord;)Landroidx/compose/runtime/snapshots/StateRecord;", "snapshot", "(Landroidx/compose/runtime/snapshots/StateRecord;Landroidx/compose/runtime/snapshots/Snapshot;)Landroidx/compose/runtime/snapshots/StateRecord;", "currentSnapshot", "mergedReadObserver", "parentObserver", "mergeReadObserver", "mergedWriteObserver", "writeObserver", "notifyWrite", "state", "optimisticMerges", "", "currentSnapshotId", "applyingSnapshot", "Landroidx/compose/runtime/snapshots/MutableSnapshot;", "invalidSnapshots", "overwriteUnusedRecordsLocked", "processForUnusedRecordsLocked", "readError", "", "readable", "id", "(Landroidx/compose/runtime/snapshots/StateRecord;JLandroidx/compose/runtime/snapshots/SnapshotIdSet;)Landroidx/compose/runtime/snapshots/StateRecord;", "releasePinningLocked", "handle", "", "reportReadonlySnapshotWrite", "resetGlobalSnapshotLocked", "(Landroidx/compose/runtime/snapshots/GlobalSnapshot;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "sync", "Lkotlin/Function0;", "(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "takeNewSnapshot", "(Lkotlin/jvm/functions/Function1;)Landroidx/compose/runtime/snapshots/Snapshot;", "trackPinning", "snapshotId", "usedLocked", "valid", "candidateSnapshot", "data", "validateOpen", "addRange", TypedValues.TransitionType.S_FROM, "until", "findYoungestOr", "predicate", "newOverwritableRecordLocked", "(Landroidx/compose/runtime/snapshots/StateRecord;Landroidx/compose/runtime/snapshots/StateObject;)Landroidx/compose/runtime/snapshots/StateRecord;", "newWritableRecord", "(Landroidx/compose/runtime/snapshots/StateRecord;Landroidx/compose/runtime/snapshots/StateObject;Landroidx/compose/runtime/snapshots/Snapshot;)Landroidx/compose/runtime/snapshots/StateRecord;", "newWritableRecordLocked", "overwritable", "R", "candidate", "Lkotlin/ExtensionFunctionType;", "(Landroidx/compose/runtime/snapshots/StateRecord;Landroidx/compose/runtime/snapshots/StateObject;Landroidx/compose/runtime/snapshots/StateRecord;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "overwritableRecord", "(Landroidx/compose/runtime/snapshots/StateRecord;Landroidx/compose/runtime/snapshots/StateObject;Landroidx/compose/runtime/snapshots/Snapshot;Landroidx/compose/runtime/snapshots/StateRecord;)Landroidx/compose/runtime/snapshots/StateRecord;", "withCurrent", "(Landroidx/compose/runtime/snapshots/StateRecord;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "writable", "(Landroidx/compose/runtime/snapshots/StateRecord;Landroidx/compose/runtime/snapshots/StateObject;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "(Landroidx/compose/runtime/snapshots/StateRecord;Landroidx/compose/runtime/snapshots/StateObject;Landroidx/compose/runtime/snapshots/Snapshot;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "writableRecord", "runtime_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class SnapshotKt {
    private static final long INVALID_SNAPSHOT = 0;
    private static final GlobalSnapshot globalSnapshot;
    private static SnapshotIdSet openSnapshots;
    private static AtomicInt pendingApplyObserverCount;
    private static final Snapshot snapshotInitializer;
    private static final Function1<SnapshotIdSet, Unit> emptyLambda = new Function1<SnapshotIdSet, Unit>() { // from class: androidx.compose.runtime.snapshots.SnapshotKt$emptyLambda$1
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ Unit invoke(SnapshotIdSet snapshotIdSet) {
            invoke2(snapshotIdSet);
            return Unit.INSTANCE;
        }

        /* renamed from: invoke  reason: avoid collision after fix types in other method */
        public final void invoke2(SnapshotIdSet it) {
        }
    };
    private static final SnapshotThreadLocal<Snapshot> threadSnapshot = new SnapshotThreadLocal<>();
    private static final Object lock = new Object();
    private static long nextSnapshotId = SnapshotId_jvmKt.toSnapshotId(1) + 1;
    private static final SnapshotDoubleIndexHeap pinningTable = new SnapshotDoubleIndexHeap();
    private static final SnapshotWeakSet<StateObject> extraStateObjects = new SnapshotWeakSet<>();
    private static List<? extends Function2<? super Set<? extends Object>, ? super Snapshot, Unit>> applyObservers = CollectionsKt.emptyList();
    private static List<? extends Function1<Object, Unit>> globalWriteObservers = CollectionsKt.emptyList();

    public static /* synthetic */ void getLock$annotations() {
    }

    public static /* synthetic */ void getSnapshotInitializer$annotations() {
    }

    public static final int trackPinning(long snapshotId, SnapshotIdSet invalid) {
        int add;
        long pinned = invalid.lowest(snapshotId);
        Object lock$iv$iv = getLock();
        synchronized (lock$iv$iv) {
            add = pinningTable.add(pinned);
        }
        return add;
    }

    public static final void releasePinningLocked(int handle) {
        pinningTable.remove(handle);
    }

    public static final Snapshot currentSnapshot() {
        Snapshot snapshot = threadSnapshot.get();
        return snapshot == null ? globalSnapshot : snapshot;
    }

    static {
        openSnapshots = SnapshotIdSet.Companion.getEMPTY();
        long j = nextSnapshotId;
        nextSnapshotId++;
        GlobalSnapshot it = new GlobalSnapshot(j, SnapshotIdSet.Companion.getEMPTY());
        openSnapshots = openSnapshots.set(it.getSnapshotId());
        globalSnapshot = it;
        snapshotInitializer = globalSnapshot;
        pendingApplyObserverCount = new AtomicInt(0);
    }

    public static /* synthetic */ Snapshot createTransparentSnapshotWithNoParentReadObserver$default(Snapshot snapshot, Function1 function1, boolean z, int i, Object obj) {
        if ((i & 2) != 0) {
            function1 = null;
        }
        if ((i & 4) != 0) {
            z = false;
        }
        return createTransparentSnapshotWithNoParentReadObserver(snapshot, function1, z);
    }

    public static final Snapshot createTransparentSnapshotWithNoParentReadObserver(Snapshot previousSnapshot, Function1<Object, Unit> function1, boolean ownsPreviousSnapshot) {
        if ((previousSnapshot instanceof MutableSnapshot) || previousSnapshot == null) {
            return new TransparentObserverMutableSnapshot(previousSnapshot instanceof MutableSnapshot ? (MutableSnapshot) previousSnapshot : null, function1, null, false, ownsPreviousSnapshot);
        }
        return new TransparentObserverSnapshot(previousSnapshot, function1, false, ownsPreviousSnapshot);
    }

    public static /* synthetic */ Function1 mergedReadObserver$default(Function1 function1, Function1 function12, boolean z, int i, Object obj) {
        if ((i & 4) != 0) {
            z = true;
        }
        return mergedReadObserver(function1, function12, z);
    }

    public static final Function1<Object, Unit> mergedReadObserver(final Function1<Object, Unit> function1, Function1<Object, Unit> function12, boolean mergeReadObserver) {
        final Function1 parentObserver = mergeReadObserver ? function12 : null;
        if (function1 == null || parentObserver == null || function1 == parentObserver) {
            return function1 == null ? parentObserver : function1;
        }
        return new Function1<Object, Unit>() { // from class: androidx.compose.runtime.snapshots.SnapshotKt$mergedReadObserver$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Object p1) {
                invoke2(p1);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(Object state) {
                function1.invoke(state);
                parentObserver.invoke(state);
            }
        };
    }

    public static final Function1<Object, Unit> mergedWriteObserver(final Function1<Object, Unit> function1, final Function1<Object, Unit> function12) {
        if (function1 == null || function12 == null || function1 == function12) {
            return function1 == null ? function12 : function1;
        }
        return new Function1<Object, Unit>() { // from class: androidx.compose.runtime.snapshots.SnapshotKt$mergedWriteObserver$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Object p1) {
                invoke2(p1);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(Object state) {
                function1.invoke(state);
                function12.invoke(state);
            }
        };
    }

    public static final Object getLock() {
        return lock;
    }

    public static final <T> T sync(Function0<? extends T> function0) {
        T invoke;
        Object lock$iv = getLock();
        synchronized (lock$iv) {
            invoke = function0.invoke();
        }
        return invoke;
    }

    public static final Snapshot getSnapshotInitializer() {
        return snapshotInitializer;
    }

    public static final <T> T resetGlobalSnapshotLocked(GlobalSnapshot globalSnapshot2, Function1<? super SnapshotIdSet, ? extends T> function1) {
        long snapshotId = globalSnapshot2.getSnapshotId();
        T invoke = function1.invoke(openSnapshots.clear(snapshotId));
        long nextGlobalSnapshotId = nextSnapshotId;
        nextSnapshotId++;
        openSnapshots = openSnapshots.clear(snapshotId);
        globalSnapshot2.setSnapshotId$runtime_release(nextGlobalSnapshotId);
        globalSnapshot2.setInvalid$runtime_release(openSnapshots);
        globalSnapshot2.setWriteCount$runtime_release(0);
        globalSnapshot2.setModified(null);
        globalSnapshot2.releasePinnedSnapshotLocked$runtime_release();
        openSnapshots = openSnapshots.set(nextGlobalSnapshotId);
        return invoke;
    }

    public static final <T> T advanceGlobalSnapshot(Function1<? super SnapshotIdSet, ? extends T> function1) {
        GlobalSnapshot globalSnapshot2 = globalSnapshot;
        Object lock$iv$iv = getLock();
        synchronized (lock$iv$iv) {
            try {
                ScatterSet modified$runtime_release = globalSnapshot2.getModified$runtime_release();
                if (modified$runtime_release != null) {
                    try {
                        pendingApplyObserverCount.add(1);
                    } catch (Throwable th) {
                        th = th;
                        throw th;
                    }
                }
                try {
                    T t = (T) resetGlobalSnapshotLocked(globalSnapshot2, function1);
                    if (modified$runtime_release != null) {
                        try {
                            List observers = applyObservers;
                            int size = observers.size();
                            for (int index$iv = 0; index$iv < size; index$iv++) {
                                Object item$iv = observers.get(index$iv);
                                Function2 observer = (Function2) item$iv;
                                observer.invoke(ScatterSetWrapperKt.wrapIntoSet(modified$runtime_release), globalSnapshot2);
                            }
                        } finally {
                            pendingApplyObserverCount.add(-1);
                        }
                    }
                    boolean z = false;
                    Object lock$iv$iv2 = getLock();
                    synchronized (lock$iv$iv2) {
                        int i = 0;
                        try {
                            checkAndOverwriteUnusedRecordsLocked();
                            if (modified$runtime_release != null) {
                                ScatterSet this_$iv = modified$runtime_release;
                                Object[] elements$iv = this_$iv.elements;
                                long[] m$iv$iv = this_$iv.metadata;
                                int lastIndex$iv$iv = m$iv$iv.length - 2;
                                int i$iv$iv = 0;
                                if (0 <= lastIndex$iv$iv) {
                                    while (true) {
                                        long slot$iv$iv = m$iv$iv[i$iv$iv];
                                        int i2 = i;
                                        GlobalSnapshot globalSnapshot3 = globalSnapshot2;
                                        ScatterSet scatterSet = modified$runtime_release;
                                        boolean z2 = z;
                                        long $this$maskEmptyOrDeleted$iv$iv$iv = ((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L);
                                        if ($this$maskEmptyOrDeleted$iv$iv$iv != -9187201950435737472L) {
                                            int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                                            for (int j$iv$iv = 0; j$iv$iv < bitCount$iv$iv; j$iv$iv++) {
                                                long value$iv$iv$iv = slot$iv$iv & 255;
                                                if (value$iv$iv$iv < 128) {
                                                    int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                                                    try {
                                                        StateObject it = (StateObject) elements$iv[index$iv$iv];
                                                        processForUnusedRecordsLocked(it);
                                                    } catch (Throwable th2) {
                                                        th = th2;
                                                        throw th;
                                                    }
                                                }
                                                slot$iv$iv >>= 8;
                                            }
                                            if (bitCount$iv$iv != 8) {
                                                break;
                                            }
                                        }
                                        if (i$iv$iv == lastIndex$iv$iv) {
                                            break;
                                        }
                                        i$iv$iv++;
                                        modified$runtime_release = scatterSet;
                                        z = z2;
                                        globalSnapshot2 = globalSnapshot3;
                                        i = i2;
                                    }
                                }
                                Unit unit = Unit.INSTANCE;
                            }
                            return t;
                        } catch (Throwable th3) {
                            th = th3;
                        }
                    }
                } catch (Throwable th4) {
                    th = th4;
                    throw th;
                }
            } catch (Throwable th5) {
                th = th5;
            }
        }
    }

    public static final void advanceGlobalSnapshot() {
        advanceGlobalSnapshot(emptyLambda);
    }

    public static final <T extends Snapshot> T takeNewSnapshot(final Function1<? super SnapshotIdSet, ? extends T> function1) {
        return (T) advanceGlobalSnapshot(new Function1<SnapshotIdSet, T>() { // from class: androidx.compose.runtime.snapshots.SnapshotKt$takeNewSnapshot$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            {
                super(1);
            }

            /* JADX WARN: Incorrect return type in method signature: (Landroidx/compose/runtime/snapshots/SnapshotIdSet;)TT; */
            @Override // kotlin.jvm.functions.Function1
            public final Snapshot invoke(SnapshotIdSet invalid) {
                SnapshotIdSet snapshotIdSet;
                Snapshot result = (Snapshot) function1.invoke(invalid);
                Object lock$iv$iv = SnapshotKt.getLock();
                synchronized (lock$iv$iv) {
                    snapshotIdSet = SnapshotKt.openSnapshots;
                    SnapshotKt.openSnapshots = snapshotIdSet.set(result.getSnapshotId());
                    Unit unit = Unit.INSTANCE;
                }
                return result;
            }
        });
    }

    public static final void validateOpen(Snapshot snapshot) {
        long lowestOrDefault;
        SnapshotIdSet openSnapshots2 = openSnapshots;
        if (openSnapshots2.get(snapshot.getSnapshotId())) {
            return;
        }
        StringBuilder append = new StringBuilder().append("Snapshot is not open: snapshotId=").append(snapshot.getSnapshotId()).append(", disposed=").append(snapshot.getDisposed$runtime_release()).append(", applied=");
        MutableSnapshot mutableSnapshot = snapshot instanceof MutableSnapshot ? (MutableSnapshot) snapshot : null;
        StringBuilder append2 = append.append(mutableSnapshot != null ? Boolean.valueOf(mutableSnapshot.getApplied$runtime_release()) : "read-only").append(", lowestPin=");
        Object lock$iv$iv = getLock();
        synchronized (lock$iv$iv) {
            lowestOrDefault = pinningTable.lowestOrDefault(-1L);
        }
        throw new IllegalStateException(append2.append(lowestOrDefault).toString().toString());
    }

    private static final boolean valid(long currentSnapshot, long candidateSnapshot, SnapshotIdSet invalid) {
        return (candidateSnapshot == INVALID_SNAPSHOT || candidateSnapshot > currentSnapshot || invalid.get(candidateSnapshot)) ? false : true;
    }

    private static final boolean valid(StateRecord data, long snapshot, SnapshotIdSet invalid) {
        return valid(snapshot, data.getSnapshotId$runtime_release(), invalid);
    }

    public static final <T extends StateRecord> T readable(T t, long id, SnapshotIdSet invalid) {
        T t2;
        StateRecord candidate = (T) null;
        for (StateRecord current = t; current != null; current = current.getNext$runtime_release()) {
            if (valid(current, id, invalid)) {
                if (candidate == null || candidate.getSnapshotId$runtime_release() < current.getSnapshotId$runtime_release()) {
                    t2 = current;
                } else {
                    t2 = candidate;
                }
                StateRecord candidate2 = t2;
                candidate = (T) candidate2;
            }
        }
        if (candidate != null) {
            return (T) candidate;
        }
        return null;
    }

    public static final <T extends StateRecord> T readable(T t, StateObject state) {
        T t2;
        Snapshot snapshot = Snapshot.Companion.getCurrent();
        Function1<Object, Unit> readObserver = snapshot.getReadObserver();
        if (readObserver != null) {
            readObserver.invoke(state);
        }
        T t3 = (T) readable(t, snapshot.getSnapshotId(), snapshot.getInvalid$runtime_release());
        if (t3 != null) {
            return t3;
        }
        Object lock$iv$iv = getLock();
        synchronized (lock$iv$iv) {
            Snapshot syncSnapshot = Snapshot.Companion.getCurrent();
            StateRecord firstStateRecord = state.getFirstStateRecord();
            Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type T of androidx.compose.runtime.snapshots.SnapshotKt.readable");
            t2 = (T) readable(firstStateRecord, syncSnapshot.getSnapshotId(), syncSnapshot.getInvalid$runtime_release());
            if (t2 == null) {
                readError();
                throw new KotlinNothingValueException();
            }
        }
        return t2;
    }

    public static final <T extends StateRecord> T readable(T t, StateObject state, Snapshot snapshot) {
        T t2;
        Function1<Object, Unit> readObserver = snapshot.getReadObserver();
        if (readObserver != null) {
            readObserver.invoke(state);
        }
        T t3 = (T) readable(t, snapshot.getSnapshotId(), snapshot.getInvalid$runtime_release());
        if (t3 != null) {
            return t3;
        }
        Object lock$iv$iv = getLock();
        synchronized (lock$iv$iv) {
            Snapshot syncSnapshot = Snapshot.Companion.getCurrent();
            StateRecord firstStateRecord = state.getFirstStateRecord();
            Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type T of androidx.compose.runtime.snapshots.SnapshotKt.readable");
            t2 = (T) readable(firstStateRecord, syncSnapshot.getSnapshotId(), syncSnapshot.getInvalid$runtime_release());
            if (t2 == null) {
                readError();
                throw new KotlinNothingValueException();
            }
        }
        return t2;
    }

    public static final Void readError() {
        throw new IllegalStateException("Reading a state that was created after the snapshot was taken or in a snapshot that has not yet been applied".toString());
    }

    private static final StateRecord usedLocked(StateObject state) {
        StateRecord validRecord = null;
        long reuseLimit = pinningTable.lowestOrDefault(nextSnapshotId) - 1;
        SnapshotIdSet invalid = SnapshotIdSet.Companion.getEMPTY();
        for (StateRecord current = state.getFirstStateRecord(); current != null; current = current.getNext$runtime_release()) {
            long currentId = current.getSnapshotId$runtime_release();
            if (currentId == INVALID_SNAPSHOT) {
                return current;
            }
            if (valid(current, reuseLimit, invalid)) {
                if (validRecord != null) {
                    return current.getSnapshotId$runtime_release() < validRecord.getSnapshotId$runtime_release() ? current : validRecord;
                }
                validRecord = current;
            }
        }
        return null;
    }

    private static final boolean overwriteUnusedRecordsLocked(StateObject state) {
        StateRecord recordToOverwrite;
        StateRecord overwriteRecord = null;
        StateRecord validRecord = null;
        long reuseLimit = pinningTable.lowestOrDefault(nextSnapshotId);
        int retainedRecords = 0;
        for (StateRecord current = state.getFirstStateRecord(); current != null; current = current.getNext$runtime_release()) {
            long currentId = current.getSnapshotId$runtime_release();
            if (currentId != INVALID_SNAPSHOT) {
                if (currentId < reuseLimit) {
                    if (validRecord == null) {
                        validRecord = current;
                        retainedRecords++;
                    } else {
                        if (current.getSnapshotId$runtime_release() < validRecord.getSnapshotId$runtime_release()) {
                            recordToOverwrite = current;
                        } else {
                            recordToOverwrite = validRecord;
                            validRecord = current;
                        }
                        if (overwriteRecord == null) {
                            StateRecord $this$findYoungestOr$iv = state.getFirstStateRecord();
                            StateRecord current$iv = $this$findYoungestOr$iv;
                            StateRecord youngest$iv = $this$findYoungestOr$iv;
                            while (true) {
                                if (current$iv != null) {
                                    StateRecord it = current$iv;
                                    StateRecord it2 = it.getSnapshotId$runtime_release() >= reuseLimit ? 1 : null;
                                    if (it2 != null) {
                                        break;
                                    }
                                    if (youngest$iv.getSnapshotId$runtime_release() < current$iv.getSnapshotId$runtime_release()) {
                                        youngest$iv = current$iv;
                                    }
                                    current$iv = current$iv.getNext$runtime_release();
                                } else {
                                    current$iv = youngest$iv;
                                    break;
                                }
                            }
                            overwriteRecord = current$iv;
                        }
                        recordToOverwrite.setSnapshotId$runtime_release(INVALID_SNAPSHOT);
                        recordToOverwrite.assign(overwriteRecord);
                    }
                } else {
                    retainedRecords++;
                }
            }
        }
        return retainedRecords > 1;
    }

    private static final StateRecord findYoungestOr(StateRecord $this$findYoungestOr, Function1<? super StateRecord, Boolean> function1) {
        StateRecord youngest = $this$findYoungestOr;
        for (StateRecord current = $this$findYoungestOr; current != null; current = current.getNext$runtime_release()) {
            if (function1.invoke(current).booleanValue()) {
                return current;
            }
            if (youngest.getSnapshotId$runtime_release() < current.getSnapshotId$runtime_release()) {
                youngest = current;
            }
        }
        return youngest;
    }

    public static final void checkAndOverwriteUnusedRecordsLocked() {
        SnapshotWeakSet this_$iv = extraStateObjects;
        int size$iv = this_$iv.getSize$runtime_release();
        int currentUsed$iv = 0;
        int i$iv = 0;
        while (true) {
            if (i$iv >= size$iv) {
                break;
            }
            WeakReference entry$iv = this_$iv.getValues$runtime_release()[i$iv];
            Object value$iv = entry$iv != null ? entry$iv.get() : null;
            if (value$iv != null) {
                StateObject it = (StateObject) value$iv;
                if (overwriteUnusedRecordsLocked(it)) {
                    if (currentUsed$iv != i$iv) {
                        this_$iv.getValues$runtime_release()[currentUsed$iv] = entry$iv;
                        this_$iv.getHashes$runtime_release()[currentUsed$iv] = this_$iv.getHashes$runtime_release()[i$iv];
                    }
                    currentUsed$iv++;
                }
            }
            i$iv++;
        }
        for (int i$iv2 = currentUsed$iv; i$iv2 < size$iv; i$iv2++) {
            this_$iv.getValues$runtime_release()[i$iv2] = null;
            this_$iv.getHashes$runtime_release()[i$iv2] = 0;
        }
        if (currentUsed$iv == size$iv) {
            return;
        }
        this_$iv.setSize$runtime_release(currentUsed$iv);
    }

    public static final void processForUnusedRecordsLocked(StateObject state) {
        if (overwriteUnusedRecordsLocked(state)) {
            extraStateObjects.add(state);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final <T extends StateRecord> T writableRecord(T t, StateObject state, Snapshot snapshot) {
        StateRecord newData;
        if (snapshot.getReadOnly()) {
            snapshot.mo3849recordModified$runtime_release(state);
        }
        long id = snapshot.getSnapshotId();
        T t2 = (T) readable(t, id, snapshot.getInvalid$runtime_release());
        if (t2 == null) {
            readError();
            throw new KotlinNothingValueException();
        } else if (t2.getSnapshotId$runtime_release() == snapshot.getSnapshotId()) {
            return t2;
        } else {
            Object lock$iv$iv = getLock();
            synchronized (lock$iv$iv) {
                newData = (T) readable(state.getFirstStateRecord(), id, snapshot.getInvalid$runtime_release());
                if (newData == null) {
                    readError();
                    throw new KotlinNothingValueException();
                } else if (newData.getSnapshotId$runtime_release() != id) {
                    StateRecord newReadData = newWritableRecordLocked(newData, state, snapshot);
                    newData = (T) newReadData;
                }
            }
            Intrinsics.checkNotNull(newData, "null cannot be cast to non-null type T of androidx.compose.runtime.snapshots.SnapshotKt.writableRecord");
            if (t2.getSnapshotId$runtime_release() != SnapshotId_jvmKt.toSnapshotId(1)) {
                snapshot.mo3849recordModified$runtime_release(state);
            }
            return (T) newData;
        }
    }

    public static final <T extends StateRecord> T overwritableRecord(T t, StateObject state, Snapshot snapshot, T t2) {
        T t3;
        if (snapshot.getReadOnly()) {
            snapshot.mo3849recordModified$runtime_release(state);
        }
        long id = snapshot.getSnapshotId();
        if (t2.getSnapshotId$runtime_release() == id) {
            return t2;
        }
        Object lock$iv$iv = getLock();
        synchronized (lock$iv$iv) {
            t3 = (T) newOverwritableRecordLocked(t, state);
        }
        t3.setSnapshotId$runtime_release(id);
        if (t2.getSnapshotId$runtime_release() != SnapshotId_jvmKt.toSnapshotId(1)) {
            snapshot.mo3849recordModified$runtime_release(state);
        }
        return t3;
    }

    public static final <T extends StateRecord> T newWritableRecord(T t, StateObject state, Snapshot snapshot) {
        T t2;
        Object lock$iv$iv = getLock();
        synchronized (lock$iv$iv) {
            t2 = (T) newWritableRecordLocked(t, state, snapshot);
        }
        return t2;
    }

    private static final <T extends StateRecord> T newWritableRecordLocked(T t, StateObject state, Snapshot snapshot) {
        T t2 = (T) newOverwritableRecordLocked(t, state);
        t2.assign(t);
        t2.setSnapshotId$runtime_release(snapshot.getSnapshotId());
        return t2;
    }

    public static final <T extends StateRecord> T newOverwritableRecordLocked(T t, StateObject state) {
        T t2 = (T) usedLocked(state);
        if (t2 != null) {
            t2.setSnapshotId$runtime_release(Long.MAX_VALUE);
            return t2;
        }
        T t3 = (T) t.create(Long.MAX_VALUE);
        t3.setNext$runtime_release(state.getFirstStateRecord());
        Intrinsics.checkNotNull(t3, "null cannot be cast to non-null type T of androidx.compose.runtime.snapshots.SnapshotKt.newOverwritableRecordLocked");
        state.prependStateRecord(t3);
        Intrinsics.checkNotNull(t3, "null cannot be cast to non-null type T of androidx.compose.runtime.snapshots.SnapshotKt.newOverwritableRecordLocked");
        return t3;
    }

    public static final void notifyWrite(Snapshot snapshot, StateObject state) {
        snapshot.setWriteCount$runtime_release(snapshot.getWriteCount$runtime_release() + 1);
        Function1<Object, Unit> writeObserver$runtime_release = snapshot.getWriteObserver$runtime_release();
        if (writeObserver$runtime_release != null) {
            writeObserver$runtime_release.invoke(state);
        }
    }

    public static final <T extends StateRecord, R> R writable(T t, StateObject state, Snapshot snapshot, Function1<? super T, ? extends R> function1) {
        R invoke;
        Object lock$iv$iv = getLock();
        synchronized (lock$iv$iv) {
            invoke = function1.invoke(writableRecord(t, state, snapshot));
        }
        notifyWrite(snapshot, state);
        return invoke;
    }

    public static final <T extends StateRecord, R> R writable(T t, StateObject state, Function1<? super T, ? extends R> function1) {
        Snapshot current;
        R invoke;
        Object lock$iv$iv = getLock();
        synchronized (lock$iv$iv) {
            current = Snapshot.Companion.getCurrent();
            invoke = function1.invoke(writableRecord(t, state, current));
        }
        notifyWrite(current, state);
        return invoke;
    }

    public static final <T extends StateRecord, R> R overwritable(T t, StateObject state, T t2, Function1<? super T, ? extends R> function1) {
        Snapshot current;
        R invoke;
        Object lock$iv$iv = getLock();
        synchronized (lock$iv$iv) {
            current = Snapshot.Companion.getCurrent();
            invoke = function1.invoke(overwritableRecord(t, state, current, t2));
        }
        notifyWrite(current, state);
        return invoke;
    }

    public static final Map<StateRecord, StateRecord> optimisticMerges(long currentSnapshotId, MutableSnapshot applyingSnapshot, SnapshotIdSet invalidSnapshots) {
        Object result;
        MutableScatterSet modified;
        int $i$f$forEach;
        SnapshotIdSet start;
        MutableScatterSet modified2;
        int i;
        int j$iv$iv;
        int $i$f$forEach2;
        SnapshotIdSet start2;
        SnapshotIdSet start3;
        long j = currentSnapshotId;
        MutableScatterSet modified3 = applyingSnapshot.getModified$runtime_release();
        Map<StateRecord, StateRecord> map = null;
        if (modified3 == null) {
            return null;
        }
        SnapshotIdSet start4 = applyingSnapshot.getInvalid$runtime_release().set(applyingSnapshot.getSnapshotId()).or(applyingSnapshot.getPreviousIds$runtime_release());
        Object result2 = null;
        MutableScatterSet this_$iv = modified3;
        int $i$f$forEach3 = 0;
        Object[] elements$iv = this_$iv.elements;
        long[] m$iv$iv = this_$iv.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 <= lastIndex$iv$iv) {
            while (true) {
                long slot$iv$iv = m$iv$iv[i$iv$iv];
                Map<StateRecord, StateRecord> map2 = map;
                SnapshotIdSet start5 = start4;
                result = result2;
                ScatterSet this_$iv2 = this_$iv;
                long $this$maskEmptyOrDeleted$iv$iv$iv = ((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L);
                if ($this$maskEmptyOrDeleted$iv$iv$iv == -9187201950435737472L) {
                    modified = modified3;
                    $i$f$forEach = $i$f$forEach3;
                    start = start5;
                    result2 = result;
                } else {
                    int i2 = 8;
                    int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                    int j$iv$iv2 = 0;
                    while (j$iv$iv2 < bitCount$iv$iv) {
                        long value$iv$iv$iv = slot$iv$iv & 255;
                        if (!(value$iv$iv$iv < 128)) {
                            modified2 = modified3;
                            i = i2;
                            j$iv$iv = j$iv$iv2;
                            $i$f$forEach2 = $i$f$forEach3;
                            start2 = start5;
                        } else {
                            int index$iv$iv = (i$iv$iv << 3) + j$iv$iv2;
                            i = i2;
                            StateObject state = (StateObject) elements$iv[index$iv$iv];
                            modified2 = modified3;
                            StateRecord first = state.getFirstStateRecord();
                            j$iv$iv = j$iv$iv2;
                            StateRecord current = readable(first, j, invalidSnapshots);
                            if (current == null) {
                                start3 = start5;
                            } else {
                                start3 = start5;
                                StateRecord previous = readable(first, j, start3);
                                if (previous != null) {
                                    if (Intrinsics.areEqual(current, previous)) {
                                        start2 = start3;
                                        $i$f$forEach2 = $i$f$forEach3;
                                    } else {
                                        start2 = start3;
                                        $i$f$forEach2 = $i$f$forEach3;
                                        StateRecord applied = readable(first, applyingSnapshot.getSnapshotId(), applyingSnapshot.getInvalid$runtime_release());
                                        if (applied == null) {
                                            readError();
                                            throw new KotlinNothingValueException();
                                        }
                                        StateRecord merged = state.mergeRecords(previous, current, applied);
                                        if (merged != null) {
                                            HashMap hashMap = (Map) result;
                                            if (hashMap == null) {
                                                Object it = new HashMap();
                                                result = it;
                                                hashMap = (Map) it;
                                            }
                                            hashMap.put(current, merged);
                                        } else {
                                            return map2;
                                        }
                                    }
                                }
                            }
                            start2 = start3;
                            $i$f$forEach2 = $i$f$forEach3;
                        }
                        slot$iv$iv >>= i;
                        j$iv$iv2 = j$iv$iv + 1;
                        j = currentSnapshotId;
                        i2 = i;
                        modified3 = modified2;
                        start5 = start2;
                        $i$f$forEach3 = $i$f$forEach2;
                    }
                    modified = modified3;
                    $i$f$forEach = $i$f$forEach3;
                    start = start5;
                    if (bitCount$iv$iv != i2) {
                        break;
                    }
                    result2 = result;
                }
                if (i$iv$iv == lastIndex$iv$iv) {
                    break;
                }
                i$iv$iv++;
                j = currentSnapshotId;
                this_$iv = this_$iv2;
                map = map2;
                modified3 = modified;
                start4 = start;
                $i$f$forEach3 = $i$f$forEach;
            }
        }
        result = result2;
        return (Map) result;
    }

    public static final Void reportReadonlySnapshotWrite() {
        throw new IllegalStateException("Cannot modify a state object in a read-only snapshot".toString());
    }

    public static final <T extends StateRecord> T current(T t, Snapshot snapshot) {
        T t2;
        T t3 = (T) readable(t, snapshot.getSnapshotId(), snapshot.getInvalid$runtime_release());
        if (t3 != null) {
            return t3;
        }
        Object lock$iv$iv = getLock();
        synchronized (lock$iv$iv) {
            t2 = (T) readable(t, snapshot.getSnapshotId(), snapshot.getInvalid$runtime_release());
        }
        if (t2 != null) {
            return t2;
        }
        readError();
        throw new KotlinNothingValueException();
    }

    public static final <T extends StateRecord> T current(T t) {
        T t2;
        Snapshot snapshot = Snapshot.Companion.getCurrent();
        T t3 = (T) readable(t, snapshot.getSnapshotId(), snapshot.getInvalid$runtime_release());
        if (t3 != null) {
            return t3;
        }
        Object lock$iv$iv = getLock();
        synchronized (lock$iv$iv) {
            Snapshot syncSnapshot = Snapshot.Companion.getCurrent();
            t2 = (T) readable(t, syncSnapshot.getSnapshotId(), syncSnapshot.getInvalid$runtime_release());
        }
        if (t2 != null) {
            return t2;
        }
        readError();
        throw new KotlinNothingValueException();
    }

    public static final <T extends StateRecord, R> R withCurrent(T t, Function1<? super T, ? extends R> function1) {
        return function1.invoke(current(t));
    }

    public static final SnapshotIdSet addRange(SnapshotIdSet $this$addRange, long from, long until) {
        SnapshotIdSet result = $this$addRange;
        for (long invalidId = from; invalidId < until; invalidId++) {
            result = result.set(invalidId);
        }
        return result;
    }
}
