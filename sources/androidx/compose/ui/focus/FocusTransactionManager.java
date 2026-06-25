package androidx.compose.ui.focus;

import androidx.collection.MutableScatterMap;
import androidx.collection.ScatterMap;
import androidx.collection.ScatterMapKt;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.ComposeUiFlags;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.exifinterface.media.ExifInterface;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
/* compiled from: FocusTransactionManager.kt */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0010\b\u0000\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\b\u0010\u001a\u001a\u00020\u0006H\u0002J\b\u0010\u001b\u001a\u00020\u0006H\u0002J\b\u0010\u001c\u001a\u00020\u0006H\u0002J4\u0010\u001d\u001a\u0002H\u001e\"\u0004\b\u0000\u0010\u001e2\u0010\b\n\u0010\u001f\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00052\f\u0010 \u001a\b\u0012\u0004\u0012\u0002H\u001e0\u0005H\u0086\b¢\u0006\u0002\u0010!J4\u0010\"\u001a\u0002H\u001e\"\u0004\b\u0000\u0010\u001e2\u0010\b\n\u0010\u001f\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00052\f\u0010 \u001a\b\u0012\u0004\u0012\u0002H\u001e0\u0005H\u0086\b¢\u0006\u0002\u0010!R\u001a\u0010\u0003\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00060\u00050\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u001e\u0010\t\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\b@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u001e\u0010\r\u001a\u00020\f2\u0006\u0010\u0007\u001a\u00020\f@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u001a\u0010\u0010\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00130\u0011X\u0082\u0004¢\u0006\u0002\n\u0000R,\u0010\u0015\u001a\u0004\u0018\u00010\u0013*\u00020\u00122\b\u0010\u0014\u001a\u0004\u0018\u00010\u00138F@FX\u0086\u000e¢\u0006\f\u001a\u0004\b\u0016\u0010\u0017\"\u0004\b\u0018\u0010\u0019¨\u0006#"}, d2 = {"Landroidx/compose/ui/focus/FocusTransactionManager;", "", "()V", "cancellationListener", "Landroidx/compose/runtime/collection/MutableVector;", "Lkotlin/Function0;", "", "<set-?>", "", "generation", "getGeneration", "()I", "", "ongoingTransaction", "getOngoingTransaction", "()Z", "states", "Landroidx/collection/MutableScatterMap;", "Landroidx/compose/ui/focus/FocusTargetNode;", "Landroidx/compose/ui/focus/FocusStateImpl;", "value", "uncommittedFocusState", "getUncommittedFocusState", "(Landroidx/compose/ui/focus/FocusTargetNode;)Landroidx/compose/ui/focus/FocusStateImpl;", "setUncommittedFocusState", "(Landroidx/compose/ui/focus/FocusTargetNode;Landroidx/compose/ui/focus/FocusStateImpl;)V", "beginTransaction", "cancelTransaction", "commitTransaction", "withExistingTransaction", ExifInterface.GPS_DIRECTION_TRUE, "onCancelled", "block", "(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "withNewTransaction", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class FocusTransactionManager {
    public static final int $stable = 8;
    private int generation;
    private boolean ongoingTransaction;
    private final MutableScatterMap<FocusTargetNode, FocusStateImpl> states = ScatterMapKt.mutableScatterMapOf();
    private final MutableVector<Function0<Unit>> cancellationListener = new MutableVector<>(new Function0[16], 0);

    public static final /* synthetic */ void access$beginTransaction(FocusTransactionManager $this) {
        $this.beginTransaction();
    }

    public static final /* synthetic */ void access$cancelTransaction(FocusTransactionManager $this) {
        $this.cancelTransaction();
    }

    public static final /* synthetic */ void access$commitTransaction(FocusTransactionManager $this) {
        $this.commitTransaction();
    }

    public static final /* synthetic */ MutableVector access$getCancellationListener$p(FocusTransactionManager $this) {
        return $this.cancellationListener;
    }

    public final boolean getOngoingTransaction() {
        return this.ongoingTransaction;
    }

    public final int getGeneration() {
        return this.generation;
    }

    public static /* synthetic */ Object withNewTransaction$default(FocusTransactionManager $this, Function0 onCancelled, Function0 block, int i, Object obj) {
        if ((i & 1) != 0) {
            onCancelled = null;
        }
        try {
            if ($this.getOngoingTransaction()) {
                $this.cancelTransaction();
            }
            $this.beginTransaction();
            if (onCancelled != null) {
                Function0 it = onCancelled;
                MutableVector this_$iv = $this.cancellationListener;
                this_$iv.add(it);
            }
            return block.invoke();
        } finally {
            $this.commitTransaction();
        }
    }

    public final <T> T withNewTransaction(Function0<Unit> function0, Function0<? extends T> function02) {
        try {
            if (getOngoingTransaction()) {
                cancelTransaction();
            }
            beginTransaction();
            if (function0 != null) {
                MutableVector this_$iv = this.cancellationListener;
                this_$iv.add(function0);
            }
            return function02.invoke();
        } finally {
            commitTransaction();
        }
    }

    public static /* synthetic */ Object withExistingTransaction$default(FocusTransactionManager $this, Function0 onCancelled, Function0 block, int i, Object obj) {
        if ((i & 1) != 0) {
            onCancelled = null;
        }
        if (onCancelled != null) {
            Function0 it = onCancelled;
            MutableVector this_$iv = $this.cancellationListener;
            this_$iv.add(it);
        }
        if ($this.getOngoingTransaction()) {
            return block.invoke();
        }
        try {
            $this.beginTransaction();
            return block.invoke();
        } finally {
            $this.commitTransaction();
        }
    }

    public final <T> T withExistingTransaction(Function0<Unit> function0, Function0<? extends T> function02) {
        if (function0 != null) {
            MutableVector this_$iv = this.cancellationListener;
            this_$iv.add(function0);
        }
        if (getOngoingTransaction()) {
            return function02.invoke();
        }
        try {
            beginTransaction();
            return function02.invoke();
        } finally {
            commitTransaction();
        }
    }

    public final FocusStateImpl getUncommittedFocusState(FocusTargetNode $this$uncommittedFocusState) {
        if (ComposeUiFlags.isTrackFocusEnabled) {
            throw new IllegalStateException("uncommittedFocusState must not be accessed when isTrackFocusEnabled is on".toString());
        }
        return this.states.get($this$uncommittedFocusState);
    }

    public final void setUncommittedFocusState(FocusTargetNode $this$uncommittedFocusState, FocusStateImpl value) {
        if (!ComposeUiFlags.isTrackFocusEnabled) {
            FocusStateImpl currentFocusState = this.states.get($this$uncommittedFocusState);
            if (currentFocusState == null) {
                currentFocusState = FocusStateImpl.Inactive;
            }
            if (currentFocusState != value) {
                this.generation++;
            }
            MutableScatterMap<FocusTargetNode, FocusStateImpl> mutableScatterMap = this.states;
            if (value != null) {
                mutableScatterMap.set($this$uncommittedFocusState, value);
            } else {
                InlineClassHelperKt.throwIllegalStateExceptionForNullCheck("requires a non-null focus state");
                throw new KotlinNothingValueException();
            }
        }
    }

    public final void beginTransaction() {
        this.ongoingTransaction = true;
    }

    public final void commitTransaction() {
        ScatterMap this_$iv = this.states;
        Object[] k$iv = this_$iv.keys;
        long[] m$iv$iv = this_$iv.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 <= lastIndex$iv$iv) {
            while (true) {
                long slot$iv$iv = m$iv$iv[i$iv$iv];
                long slot$iv$iv2 = slot$iv$iv;
                if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) != -9187201950435737472L) {
                    int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                    for (int j$iv$iv = 0; j$iv$iv < bitCount$iv$iv; j$iv$iv++) {
                        long value$iv$iv$iv = slot$iv$iv2 & 255;
                        if (value$iv$iv$iv < 128) {
                            int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                            FocusTargetNode focusTargetNode = (FocusTargetNode) k$iv[index$iv$iv];
                            focusTargetNode.commitFocusState$ui_release();
                        }
                        slot$iv$iv2 >>= 8;
                    }
                    if (bitCount$iv$iv != 8) {
                        break;
                    }
                }
                if (i$iv$iv == lastIndex$iv$iv) {
                    break;
                }
                i$iv$iv++;
            }
        }
        this.states.clear();
        this.ongoingTransaction = false;
        this.cancellationListener.clear();
    }

    public final void cancelTransaction() {
        this.states.clear();
        this.ongoingTransaction = false;
        MutableVector this_$iv = this.cancellationListener;
        Object[] content$iv = this_$iv.content;
        int size$iv = this_$iv.getSize();
        for (int i$iv = 0; i$iv < size$iv; i$iv++) {
            Function0 it = (Function0) content$iv[i$iv];
            it.invoke();
        }
        this.cancellationListener.clear();
    }
}
