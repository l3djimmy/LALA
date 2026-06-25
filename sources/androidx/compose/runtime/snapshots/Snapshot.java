package androidx.compose.runtime.snapshots;

import androidx.collection.MutableScatterSet;
import androidx.compose.runtime.PreconditionsKt;
import androidx.compose.runtime.internal.Thread_jvmKt;
import androidx.compose.runtime.snapshots.Snapshot;
import androidx.exifinterface.media.ExifInterface;
import java.util.Collection;
import java.util.Set;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.Metadata;
import kotlin.ReplaceWith;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: Snapshot.kt */
@Metadata(d1 = {"\u0000^\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u001c\n\u0002\u0018\u0002\n\u0002\b\u001b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u0000 \\2\u00020\u0001:\u0001\\B\u0017\b\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006B\u001b\b\u0004\u0012\n\u0010\u0007\u001a\u00060\bj\u0002`\t\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\nJ\r\u00109\u001a\u00020$H\u0000¢\u0006\u0002\b:J\r\u0010;\u001a\u00020$H\u0010¢\u0006\u0002\b<J\b\u0010=\u001a\u00020$H\u0016J\"\u0010>\u001a\u0002H?\"\u0004\b\u0000\u0010?2\f\u0010@\u001a\b\u0012\u0004\u0012\u0002H?0AH\u0086\b¢\u0006\u0002\u0010BJ\b\u0010C\u001a\u00020\fH&J\n\u0010D\u001a\u0004\u0018\u00010\u0000H\u0011J\u0015\u0010E\u001a\u00020$2\u0006\u0010F\u001a\u00020\u0000H ¢\u0006\u0002\bGJ\u0015\u0010H\u001a\u00020$2\u0006\u0010F\u001a\u00020\u0000H ¢\u0006\u0002\bIJ\r\u0010J\u001a\u00020$H ¢\u0006\u0002\bKJ\u0015\u0010L\u001a\u00020$2\u0006\u0010M\u001a\u00020\u001dH ¢\u0006\u0002\bNJ\r\u0010O\u001a\u00020$H\u0000¢\u0006\u0002\bPJ\r\u0010Q\u001a\u00020$H\u0010¢\u0006\u0002\bRJ\u0012\u0010S\u001a\u00020$2\b\u0010F\u001a\u0004\u0018\u00010\u0000H\u0011J \u0010T\u001a\u00020\u00002\u0016\b\u0002\u0010\"\u001a\u0010\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020$\u0018\u00010#H&J\r\u0010U\u001a\u00020\u0003H\u0000¢\u0006\u0002\bVJ\b\u0010W\u001a\u0004\u0018\u00010\u0000J\u0010\u0010X\u001a\u00020$2\b\u0010Y\u001a\u0004\u0018\u00010\u0000J\r\u0010Z\u001a\u00020$H\u0000¢\u0006\u0002\b[R\u001a\u0010\u000b\u001a\u00020\fX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010R\u001a\u0010\u0002\u001a\u00020\u00038VX\u0097\u0004¢\u0006\f\u0012\u0004\b\u0011\u0010\u0012\u001a\u0004\b\u0013\u0010\u0014R\u001a\u0010\u0004\u001a\u00020\u0005X\u0090\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0015\u0010\u0016\"\u0004\b\u0017\u0010\u0018R\u0015\u0010\u0019\u001a\u00020\f8À\u0002X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u001a\u0010\u000eR\u001a\u0010\u001b\u001a\n\u0012\u0004\u0012\u00020\u001d\u0018\u00010\u001cX \u0004¢\u0006\u0006\u001a\u0004\b\u001e\u0010\u001fR\u0014\u0010 \u001a\u00020\u0003X\u0082\u000e¢\u0006\b\n\u0000\u0012\u0004\b!\u0010\u0012R(\u0010\"\u001a\u0010\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020$\u0018\u00010#8 X¡\u0004¢\u0006\f\u0012\u0004\b%\u0010\u0012\u001a\u0004\b&\u0010'R\u0012\u0010(\u001a\u00020\fX¦\u0004¢\u0006\u0006\u001a\u0004\b)\u0010\u000eR\u0012\u0010*\u001a\u00020\u0000X¦\u0004¢\u0006\u0006\u001a\u0004\b+\u0010,R,\u0010\u0007\u001a\u00060\bj\u0002`\t2\n\u0010-\u001a\u00060\bj\u0002`\t@PX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b.\u0010/\"\u0004\b0\u00101R$\u00103\u001a\u00020\u00032\u0006\u00102\u001a\u00020\u00038P@PX\u0090\u000e¢\u0006\f\u001a\u0004\b4\u0010\u0014\"\u0004\b5\u00106R \u00107\u001a\u0010\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020$\u0018\u00010#X \u0004¢\u0006\u0006\u001a\u0004\b8\u0010'\u0082\u0001\u0004]^_`¨\u0006a"}, d2 = {"Landroidx/compose/runtime/snapshots/Snapshot;", "", "id", "", "invalid", "Landroidx/compose/runtime/snapshots/SnapshotIdSet;", "(ILandroidx/compose/runtime/snapshots/SnapshotIdSet;)V", "snapshotId", "", "Landroidx/compose/runtime/snapshots/SnapshotId;", "(JLandroidx/compose/runtime/snapshots/SnapshotIdSet;)V", "disposed", "", "getDisposed$runtime_release", "()Z", "setDisposed$runtime_release", "(Z)V", "getId$annotations", "()V", "getId", "()I", "getInvalid$runtime_release", "()Landroidx/compose/runtime/snapshots/SnapshotIdSet;", "setInvalid$runtime_release", "(Landroidx/compose/runtime/snapshots/SnapshotIdSet;)V", "isPinned", "isPinned$runtime_release", "modified", "Landroidx/collection/MutableScatterSet;", "Landroidx/compose/runtime/snapshots/StateObject;", "getModified$runtime_release", "()Landroidx/collection/MutableScatterSet;", "pinningTrackingHandle", "getPinningTrackingHandle$annotations", "readObserver", "Lkotlin/Function1;", "", "getReadObserver$annotations", "getReadObserver", "()Lkotlin/jvm/functions/Function1;", "readOnly", "getReadOnly", "root", "getRoot", "()Landroidx/compose/runtime/snapshots/Snapshot;", "<set-?>", "getSnapshotId", "()J", "setSnapshotId$runtime_release", "(J)V", "value", "writeCount", "getWriteCount$runtime_release", "setWriteCount$runtime_release", "(I)V", "writeObserver", "getWriteObserver$runtime_release", "closeAndReleasePinning", "closeAndReleasePinning$runtime_release", "closeLocked", "closeLocked$runtime_release", "dispose", "enter", ExifInterface.GPS_DIRECTION_TRUE, "block", "Lkotlin/Function0;", "(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "hasPendingChanges", "makeCurrent", "nestedActivated", "snapshot", "nestedActivated$runtime_release", "nestedDeactivated", "nestedDeactivated$runtime_release", "notifyObjectsInitialized", "notifyObjectsInitialized$runtime_release", "recordModified", "state", "recordModified$runtime_release", "releasePinnedSnapshotLocked", "releasePinnedSnapshotLocked$runtime_release", "releasePinnedSnapshotsForCloseLocked", "releasePinnedSnapshotsForCloseLocked$runtime_release", "restoreCurrent", "takeNestedSnapshot", "takeoverPinnedSnapshot", "takeoverPinnedSnapshot$runtime_release", "unsafeEnter", "unsafeLeave", "oldSnapshot", "validateNotDisposed", "validateNotDisposed$runtime_release", "Companion", "Landroidx/compose/runtime/snapshots/MutableSnapshot;", "Landroidx/compose/runtime/snapshots/NestedReadonlySnapshot;", "Landroidx/compose/runtime/snapshots/ReadonlySnapshot;", "Landroidx/compose/runtime/snapshots/TransparentObserverSnapshot;", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public abstract class Snapshot {
    public static final int PreexistingSnapshotId = 1;
    private boolean disposed;
    private SnapshotIdSet invalid;
    private int pinningTrackingHandle;
    private long snapshotId;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    public /* synthetic */ Snapshot(int i, SnapshotIdSet snapshotIdSet, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, snapshotIdSet);
    }

    public /* synthetic */ Snapshot(long j, SnapshotIdSet snapshotIdSet, DefaultConstructorMarker defaultConstructorMarker) {
        this(j, snapshotIdSet);
    }

    @Deprecated(message = "Use snapshotId instead", replaceWith = @ReplaceWith(expression = "snapshotId", imports = {}))
    public static /* synthetic */ void getId$annotations() {
    }

    private static /* synthetic */ void getPinningTrackingHandle$annotations() {
    }

    public static /* synthetic */ void getReadObserver$annotations() {
    }

    public abstract MutableScatterSet<StateObject> getModified$runtime_release();

    public abstract Function1<Object, Unit> getReadObserver();

    public abstract boolean getReadOnly();

    public abstract Snapshot getRoot();

    public abstract Function1<Object, Unit> getWriteObserver$runtime_release();

    public abstract boolean hasPendingChanges();

    /* renamed from: nestedActivated$runtime_release */
    public abstract void mo3847nestedActivated$runtime_release(Snapshot snapshot);

    /* renamed from: nestedDeactivated$runtime_release */
    public abstract void mo3848nestedDeactivated$runtime_release(Snapshot snapshot);

    public abstract void notifyObjectsInitialized$runtime_release();

    /* renamed from: recordModified$runtime_release */
    public abstract void mo3849recordModified$runtime_release(StateObject stateObject);

    public abstract Snapshot takeNestedSnapshot(Function1<Object, Unit> function1);

    private Snapshot(long snapshotId, SnapshotIdSet invalid) {
        this.invalid = invalid;
        this.snapshotId = snapshotId;
        this.pinningTrackingHandle = snapshotId != SnapshotKt.access$getINVALID_SNAPSHOT$p() ? SnapshotKt.trackPinning(snapshotId, getInvalid$runtime_release()) : -1;
    }

    public SnapshotIdSet getInvalid$runtime_release() {
        return this.invalid;
    }

    public void setInvalid$runtime_release(SnapshotIdSet snapshotIdSet) {
        this.invalid = snapshotIdSet;
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Use id: Long constructor instead")
    private /* synthetic */ Snapshot(int id, SnapshotIdSet invalid) {
        this(SnapshotId_jvmKt.toSnapshotId(id), invalid, (DefaultConstructorMarker) null);
    }

    public int getId() {
        return (int) getSnapshotId();
    }

    public long getSnapshotId() {
        return this.snapshotId;
    }

    public void setSnapshotId$runtime_release(long j) {
        this.snapshotId = j;
    }

    public int getWriteCount$runtime_release() {
        return 0;
    }

    public void setWriteCount$runtime_release(int value) {
        throw new IllegalStateException("Updating write count is not supported for this snapshot".toString());
    }

    public void dispose() {
        this.disposed = true;
        Object lock$iv$iv = SnapshotKt.getLock();
        synchronized (lock$iv$iv) {
            releasePinnedSnapshotLocked$runtime_release();
            Unit unit = Unit.INSTANCE;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ Snapshot takeNestedSnapshot$default(Snapshot snapshot, Function1 function1, int i, Object obj) {
        if (obj == null) {
            if ((i & 1) != 0) {
                function1 = null;
            }
            return snapshot.takeNestedSnapshot(function1);
        }
        throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: takeNestedSnapshot");
    }

    public final <T> T enter(Function0<? extends T> function0) {
        Snapshot previous = makeCurrent();
        try {
            return function0.invoke();
        } finally {
            restoreCurrent(previous);
        }
    }

    public Snapshot makeCurrent() {
        Snapshot previous = (Snapshot) SnapshotKt.access$getThreadSnapshot$p().get();
        SnapshotKt.access$getThreadSnapshot$p().set(this);
        return previous;
    }

    public void restoreCurrent(Snapshot snapshot) {
        SnapshotKt.access$getThreadSnapshot$p().set(snapshot);
    }

    public final Snapshot unsafeEnter() {
        return makeCurrent();
    }

    public final void unsafeLeave(Snapshot oldSnapshot) {
        boolean value$iv = SnapshotKt.access$getThreadSnapshot$p().get() == this;
        if (!value$iv) {
            PreconditionsKt.throwIllegalStateException("Cannot leave snapshot; " + this + " is not the current snapshot");
        }
        restoreCurrent(oldSnapshot);
    }

    public final boolean getDisposed$runtime_release() {
        return this.disposed;
    }

    public final void setDisposed$runtime_release(boolean z) {
        this.disposed = z;
    }

    public final boolean isPinned$runtime_release() {
        return this.pinningTrackingHandle >= 0;
    }

    public final void closeAndReleasePinning$runtime_release() {
        Object lock$iv$iv = SnapshotKt.getLock();
        synchronized (lock$iv$iv) {
            closeLocked$runtime_release();
            releasePinnedSnapshotsForCloseLocked$runtime_release();
            Unit unit = Unit.INSTANCE;
        }
    }

    public void closeLocked$runtime_release() {
        SnapshotKt.access$setOpenSnapshots$p(SnapshotKt.access$getOpenSnapshots$p().clear(getSnapshotId()));
    }

    public void releasePinnedSnapshotsForCloseLocked$runtime_release() {
        releasePinnedSnapshotLocked$runtime_release();
    }

    public final void validateNotDisposed$runtime_release() {
        boolean value$iv = !this.disposed;
        if (value$iv) {
            return;
        }
        PreconditionsKt.throwIllegalArgumentException("Cannot use a disposed snapshot");
    }

    public final void releasePinnedSnapshotLocked$runtime_release() {
        if (this.pinningTrackingHandle >= 0) {
            SnapshotKt.releasePinningLocked(this.pinningTrackingHandle);
            this.pinningTrackingHandle = -1;
        }
    }

    public final int takeoverPinnedSnapshot$runtime_release() {
        int i = this.pinningTrackingHandle;
        this.pinningTrackingHandle = -1;
        return i;
    }

    /* compiled from: Snapshot.kt */
    @Metadata(d1 = {"\u0000l\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\"\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\b\u0010\u0017\u001a\u00020\u0007H\u0001J\"\u0010\u0018\u001a\u0002H\u0019\"\u0004\b\u0000\u0010\u00192\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u0002H\u00190\u001bH\u0086\b¢\u0006\u0002\u0010\u001cJ\u0012\u0010\u001d\u001a\u00020\u00072\b\u0010\u001e\u001a\u0004\u0018\u00010\u0007H\u0001J\u0006\u0010\u001f\u001a\u00020 JO\u0010!\u001a\u0002H\u0019\"\u0004\b\u0000\u0010\u00192\u0016\b\u0002\u0010\"\u001a\u0010\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020 \u0018\u00010#2\u0016\b\u0002\u0010$\u001a\u0010\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020 \u0018\u00010#2\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u0002H\u00190\u001b¢\u0006\u0002\u0010%J\b\u0010&\u001a\u00020\u0004H\u0007J&\u0010'\u001a\u00020(2\u001e\u0010)\u001a\u001a\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00010+\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020 0*J\u001a\u0010,\u001a\u00020(2\u0012\u0010)\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020 0#J\n\u0010-\u001a\u0004\u0018\u00010\u0007H\u0001J\u0012\u0010.\u001a\u00020 2\b\u0010\u001e\u001a\u0004\u0018\u00010\u0007H\u0001J0\u0010/\u001a\u00020 2\b\u0010\u001e\u001a\u0004\u0018\u00010\u00072\u0006\u00100\u001a\u00020\u00072\u0014\u0010)\u001a\u0010\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020 \u0018\u00010#H\u0001J\u0006\u00101\u001a\u00020 J6\u00102\u001a\u0002032\u0016\b\u0002\u0010\"\u001a\u0010\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020 \u0018\u00010#2\u0016\b\u0002\u0010$\u001a\u0010\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020 \u0018\u00010#J\u001e\u00104\u001a\u00020\u00072\u0016\b\u0002\u0010\"\u001a\u0010\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020 \u0018\u00010#J\"\u00105\u001a\u0002H6\"\u0004\b\u0000\u001062\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u0002H60\u001bH\u0086\b¢\u0006\u0002\u0010\u001cJ4\u00107\u001a\u0002H\u0019\"\u0004\b\u0000\u0010\u00192\u0011\u0010\u001a\u001a\r\u0012\u0004\u0012\u0002H\u00190\u001b¢\u0006\u0002\b8H\u0086\b\u0082\u0002\n\n\b\b\u0001\u0012\u0002\u0010\u0001 \u0001¢\u0006\u0002\u0010\u001cR\u0014\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\b\n\u0000\u0012\u0004\b\u0005\u0010\u0002R\u0011\u0010\u0006\u001a\u00020\u00078F¢\u0006\u0006\u001a\u0004\b\b\u0010\tR\u001c\u0010\n\u001a\u0004\u0018\u00010\u00078@X\u0081\u0004¢\u0006\f\u0012\u0004\b\u000b\u0010\u0002\u001a\u0004\b\f\u0010\tR\u0011\u0010\r\u001a\u00020\u000e8F¢\u0006\u0006\u001a\u0004\b\r\u0010\u000fR\u0011\u0010\u0010\u001a\u00020\u000e8F¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u000fR\u0019\u0010\u0011\u001a\u00020\u000e*\u00020\u00128Â\u0002X\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0011\u001a\u00020\u000e*\u00020\u00158Â\u0002X\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0013\u0010\u0016¨\u00069"}, d2 = {"Landroidx/compose/runtime/snapshots/Snapshot$Companion;", "", "()V", "PreexistingSnapshotId", "", "getPreexistingSnapshotId$annotations", "current", "Landroidx/compose/runtime/snapshots/Snapshot;", "getCurrent", "()Landroidx/compose/runtime/snapshots/Snapshot;", "currentThreadSnapshot", "getCurrentThreadSnapshot$annotations", "getCurrentThreadSnapshot", "isApplyObserverNotificationPending", "", "()Z", "isInSnapshot", "canBeReused", "Landroidx/compose/runtime/snapshots/TransparentObserverMutableSnapshot;", "getCanBeReused", "(Landroidx/compose/runtime/snapshots/TransparentObserverMutableSnapshot;)Z", "Landroidx/compose/runtime/snapshots/TransparentObserverSnapshot;", "(Landroidx/compose/runtime/snapshots/TransparentObserverSnapshot;)Z", "createNonObservableSnapshot", "global", ExifInterface.GPS_DIRECTION_TRUE, "block", "Lkotlin/Function0;", "(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "makeCurrentNonObservable", "previous", "notifyObjectsInitialized", "", "observe", "readObserver", "Lkotlin/Function1;", "writeObserver", "(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "openSnapshotCount", "registerApplyObserver", "Landroidx/compose/runtime/snapshots/ObserverHandle;", "observer", "Lkotlin/Function2;", "", "registerGlobalWriteObserver", "removeCurrent", "restoreCurrent", "restoreNonObservable", "nonObservable", "sendApplyNotifications", "takeMutableSnapshot", "Landroidx/compose/runtime/snapshots/MutableSnapshot;", "takeSnapshot", "withMutableSnapshot", "R", "withoutReadObservation", "Landroidx/compose/runtime/DisallowComposableCalls;", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public static /* synthetic */ void getCurrentThreadSnapshot$annotations() {
        }

        public static /* synthetic */ void getPreexistingSnapshotId$annotations() {
        }

        private Companion() {
        }

        public final Snapshot getCurrent() {
            return SnapshotKt.currentSnapshot();
        }

        public final boolean isInSnapshot() {
            return SnapshotKt.access$getThreadSnapshot$p().get() != null;
        }

        public final boolean isApplyObserverNotificationPending() {
            return SnapshotKt.access$getPendingApplyObserverCount$p().get() > 0;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Snapshot takeSnapshot$default(Companion companion, Function1 function1, int i, Object obj) {
            if ((i & 1) != 0) {
                function1 = null;
            }
            return companion.takeSnapshot(function1);
        }

        public final Snapshot takeSnapshot(Function1<Object, Unit> function1) {
            return SnapshotKt.currentSnapshot().takeNestedSnapshot(function1);
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ MutableSnapshot takeMutableSnapshot$default(Companion companion, Function1 function1, Function1 function12, int i, Object obj) {
            if ((i & 1) != 0) {
                function1 = null;
            }
            if ((i & 2) != 0) {
                function12 = null;
            }
            return companion.takeMutableSnapshot(function1, function12);
        }

        public final MutableSnapshot takeMutableSnapshot(Function1<Object, Unit> function1, Function1<Object, Unit> function12) {
            MutableSnapshot takeNestedMutableSnapshot;
            Snapshot currentSnapshot = SnapshotKt.currentSnapshot();
            MutableSnapshot mutableSnapshot = currentSnapshot instanceof MutableSnapshot ? (MutableSnapshot) currentSnapshot : null;
            if (mutableSnapshot == null || (takeNestedMutableSnapshot = mutableSnapshot.takeNestedMutableSnapshot(function1, function12)) == null) {
                throw new IllegalStateException("Cannot create a mutable snapshot of an read-only snapshot".toString());
            }
            return takeNestedMutableSnapshot;
        }

        public final <T> T global(Function0<? extends T> function0) {
            Snapshot previous = removeCurrent();
            try {
                return function0.invoke();
            } finally {
                restoreCurrent(previous);
            }
        }

        public final <R> R withMutableSnapshot(Function0<? extends R> function0) {
            MutableSnapshot $this$withMutableSnapshot_u24lambda_u240 = takeMutableSnapshot$default(this, null, null, 3, null);
            try {
                MutableSnapshot this_$iv = $this$withMutableSnapshot_u24lambda_u240;
                Snapshot previous$iv = this_$iv.makeCurrent();
                R invoke = function0.invoke();
                this_$iv.restoreCurrent(previous$iv);
                $this$withMutableSnapshot_u24lambda_u240.apply().check();
                $this$withMutableSnapshot_u24lambda_u240.dispose();
                return invoke;
            } catch (Throwable e) {
                try {
                    throw e;
                } catch (Throwable e2) {
                    if (1 == 0) {
                        $this$withMutableSnapshot_u24lambda_u240.apply().check();
                    }
                    $this$withMutableSnapshot_u24lambda_u240.dispose();
                    throw e2;
                }
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Object observe$default(Companion companion, Function1 function1, Function1 function12, Function0 function0, int i, Object obj) {
            if ((i & 1) != 0) {
                function1 = null;
            }
            if ((i & 2) != 0) {
                function12 = null;
            }
            return companion.observe(function1, function12, function0);
        }

        public final <T> T observe(Function1<Object, Unit> function1, Function1<Object, Unit> function12, Function0<? extends T> function0) {
            TransparentObserverMutableSnapshot transparentObserverMutableSnapshot;
            if (function1 == null && function12 == null) {
                return function0.invoke();
            }
            Snapshot previous = (Snapshot) SnapshotKt.access$getThreadSnapshot$p().get();
            if (previous instanceof TransparentObserverMutableSnapshot) {
                TransparentObserverMutableSnapshot $this$canBeReused$iv = (TransparentObserverMutableSnapshot) previous;
                if ($this$canBeReused$iv.getThreadId$runtime_release() == Thread_jvmKt.currentThreadId()) {
                    Function1 previousReadObserver = ((TransparentObserverMutableSnapshot) previous).getReadObserver();
                    Function1 previousWriteObserver = ((TransparentObserverMutableSnapshot) previous).getWriteObserver$runtime_release();
                    try {
                        ((TransparentObserverMutableSnapshot) previous).setReadObserver(SnapshotKt.mergedReadObserver$default(function1, previousReadObserver, false, 4, null));
                        ((TransparentObserverMutableSnapshot) previous).setWriteObserver(SnapshotKt.access$mergedWriteObserver(function12, previousWriteObserver));
                        return function0.invoke();
                    } finally {
                        ((TransparentObserverMutableSnapshot) previous).setReadObserver(previousReadObserver);
                        ((TransparentObserverMutableSnapshot) previous).setWriteObserver(previousWriteObserver);
                    }
                }
            }
            if (previous == null || (previous instanceof MutableSnapshot)) {
                MutableSnapshot mutableSnapshot = null;
                if (previous instanceof MutableSnapshot) {
                    mutableSnapshot = (MutableSnapshot) previous;
                }
                transparentObserverMutableSnapshot = new TransparentObserverMutableSnapshot(mutableSnapshot, function1, function12, true, false);
            } else if (function1 == null) {
                return function0.invoke();
            } else {
                transparentObserverMutableSnapshot = previous.takeNestedSnapshot(function1);
            }
            Snapshot snapshot = transparentObserverMutableSnapshot;
            try {
                Snapshot previous$iv = snapshot.makeCurrent();
                T invoke = function0.invoke();
                snapshot.restoreCurrent(previous$iv);
                return invoke;
            } finally {
                snapshot.dispose();
            }
        }

        public final Snapshot createNonObservableSnapshot() {
            return SnapshotKt.createTransparentSnapshotWithNoParentReadObserver$default((Snapshot) SnapshotKt.access$getThreadSnapshot$p().get(), null, false, 6, null);
        }

        public final Snapshot getCurrentThreadSnapshot() {
            return (Snapshot) SnapshotKt.access$getThreadSnapshot$p().get();
        }

        private final boolean getCanBeReused(TransparentObserverMutableSnapshot $this$canBeReused) {
            return $this$canBeReused.getThreadId$runtime_release() == Thread_jvmKt.currentThreadId();
        }

        private final boolean getCanBeReused(TransparentObserverSnapshot $this$canBeReused) {
            return $this$canBeReused.getThreadId$runtime_release() == Thread_jvmKt.currentThreadId();
        }

        public final Snapshot makeCurrentNonObservable(Snapshot previous) {
            if (previous instanceof TransparentObserverMutableSnapshot) {
                TransparentObserverMutableSnapshot $this$canBeReused$iv = (TransparentObserverMutableSnapshot) previous;
                TransparentObserverMutableSnapshot $this$canBeReused$iv2 = $this$canBeReused$iv.getThreadId$runtime_release() == Thread_jvmKt.currentThreadId() ? 1 : null;
                if ($this$canBeReused$iv2 != null) {
                    ((TransparentObserverMutableSnapshot) previous).setReadObserver(null);
                    return previous;
                }
            }
            if (previous instanceof TransparentObserverSnapshot) {
                TransparentObserverSnapshot $this$canBeReused$iv3 = (TransparentObserverSnapshot) previous;
                if ($this$canBeReused$iv3.getThreadId$runtime_release() == Thread_jvmKt.currentThreadId()) {
                    ((TransparentObserverSnapshot) previous).setReadObserver(null);
                    return previous;
                }
            }
            Snapshot snapshot = SnapshotKt.createTransparentSnapshotWithNoParentReadObserver$default(previous, null, false, 6, null);
            snapshot.makeCurrent();
            return snapshot;
        }

        public final void restoreNonObservable(Snapshot previous, Snapshot nonObservable, Function1<Object, Unit> function1) {
            if (previous == nonObservable) {
                if (previous instanceof TransparentObserverMutableSnapshot) {
                    ((TransparentObserverMutableSnapshot) previous).setReadObserver(function1);
                    return;
                } else if (previous instanceof TransparentObserverSnapshot) {
                    ((TransparentObserverSnapshot) previous).setReadObserver(function1);
                    return;
                } else {
                    throw new IllegalStateException(("Non-transparent snapshot was reused: " + previous).toString());
                }
            }
            nonObservable.restoreCurrent(previous);
            nonObservable.dispose();
        }

        public final <T> T withoutReadObservation(Function0<? extends T> function0) {
            Snapshot previousSnapshot = getCurrentThreadSnapshot();
            Function1 observer = previousSnapshot != null ? previousSnapshot.getReadObserver() : null;
            Snapshot newSnapshot = makeCurrentNonObservable(previousSnapshot);
            try {
                return function0.invoke();
            } finally {
                restoreNonObservable(previousSnapshot, newSnapshot, observer);
            }
        }

        public final ObserverHandle registerApplyObserver(final Function2<? super Set<? extends Object>, ? super Snapshot, Unit> function2) {
            SnapshotKt.access$advanceGlobalSnapshot(SnapshotKt.access$getEmptyLambda$p());
            Object lock$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv) {
                SnapshotKt.access$setApplyObservers$p(CollectionsKt.plus((Collection<? extends Function2<? super Set<? extends Object>, ? super Snapshot, Unit>>) SnapshotKt.access$getApplyObservers$p(), function2));
                Unit unit = Unit.INSTANCE;
            }
            return new ObserverHandle() { // from class: androidx.compose.runtime.snapshots.Snapshot$Companion$$ExternalSyntheticLambda0
                @Override // androidx.compose.runtime.snapshots.ObserverHandle
                public final void dispose() {
                    Snapshot.Companion.registerApplyObserver$lambda$4(Function2.this);
                }
            };
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static final void registerApplyObserver$lambda$4(Function2 $observer) {
            Object lock$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv) {
                SnapshotKt.access$setApplyObservers$p(CollectionsKt.minus(SnapshotKt.access$getApplyObservers$p(), $observer));
                Unit unit = Unit.INSTANCE;
            }
        }

        public final ObserverHandle registerGlobalWriteObserver(final Function1<Object, Unit> function1) {
            Object lock$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv) {
                SnapshotKt.access$setGlobalWriteObservers$p(CollectionsKt.plus((Collection<? extends Function1<Object, Unit>>) SnapshotKt.access$getGlobalWriteObservers$p(), function1));
                Unit unit = Unit.INSTANCE;
            }
            SnapshotKt.access$advanceGlobalSnapshot();
            return new ObserverHandle() { // from class: androidx.compose.runtime.snapshots.Snapshot$Companion$$ExternalSyntheticLambda1
                @Override // androidx.compose.runtime.snapshots.ObserverHandle
                public final void dispose() {
                    Snapshot.Companion.registerGlobalWriteObserver$lambda$7(Function1.this);
                }
            };
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static final void registerGlobalWriteObserver$lambda$7(Function1 $observer) {
            Object lock$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv) {
                SnapshotKt.access$setGlobalWriteObservers$p(CollectionsKt.minus(SnapshotKt.access$getGlobalWriteObservers$p(), $observer));
                Unit unit = Unit.INSTANCE;
            }
            SnapshotKt.access$advanceGlobalSnapshot();
        }

        public final void notifyObjectsInitialized() {
            SnapshotKt.currentSnapshot().notifyObjectsInitialized$runtime_release();
        }

        public final void sendApplyNotifications() {
            boolean changes;
            Object lock$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv) {
                changes = SnapshotKt.access$getGlobalSnapshot$p().hasPendingChanges();
            }
            if (changes) {
                SnapshotKt.access$advanceGlobalSnapshot();
            }
        }

        public final int openSnapshotCount() {
            return CollectionsKt.toList(SnapshotKt.access$getOpenSnapshots$p()).size();
        }

        public final Snapshot removeCurrent() {
            Snapshot previous = (Snapshot) SnapshotKt.access$getThreadSnapshot$p().get();
            if (previous != null) {
                SnapshotKt.access$getThreadSnapshot$p().set(null);
            }
            return previous;
        }

        public final void restoreCurrent(Snapshot previous) {
            if (previous != null) {
                SnapshotKt.access$getThreadSnapshot$p().set(previous);
            }
        }
    }
}
