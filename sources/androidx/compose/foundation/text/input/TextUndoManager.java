package androidx.compose.foundation.text.input;

import androidx.compose.foundation.text.input.internal.undo.TextUndoOperation;
import androidx.compose.foundation.text.input.internal.undo.TextUndoOperationKt;
import androidx.compose.foundation.text.input.internal.undo.UndoManager;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.saveable.Saver;
import androidx.compose.runtime.saveable.SaverScope;
import androidx.compose.runtime.snapshots.Snapshot;
import androidx.compose.runtime.snapshots.SnapshotStateList;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: TextUndoManager.kt */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\r\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u0000 \u001e2\u00020\u0001:\u0001\u001eB!\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005¢\u0006\u0002\u0010\u0006J\u0006\u0010\u0015\u001a\u00020\u0016J\b\u0010\u0017\u001a\u00020\u0016H\u0002J\u000e\u0010\u0018\u001a\u00020\u00162\u0006\u0010\u0019\u001a\u00020\u0003J\u000e\u0010\u001a\u001a\u00020\u00162\u0006\u0010\u001b\u001a\u00020\u001cJ\u000e\u0010\u001d\u001a\u00020\u00162\u0006\u0010\u001b\u001a\u00020\u001cR\u0011\u0010\u0007\u001a\u00020\b8F¢\u0006\u0006\u001a\u0004\b\t\u0010\nR\u0011\u0010\u000b\u001a\u00020\b8F¢\u0006\u0006\u001a\u0004\b\f\u0010\nR/\u0010\u000e\u001a\u0004\u0018\u00010\u00032\b\u0010\r\u001a\u0004\u0018\u00010\u00038B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u000f\u0010\u0010\"\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u001f"}, d2 = {"Landroidx/compose/foundation/text/input/TextUndoManager;", "", "initialStagingUndo", "Landroidx/compose/foundation/text/input/internal/undo/TextUndoOperation;", "undoManager", "Landroidx/compose/foundation/text/input/internal/undo/UndoManager;", "(Landroidx/compose/foundation/text/input/internal/undo/TextUndoOperation;Landroidx/compose/foundation/text/input/internal/undo/UndoManager;)V", "canRedo", "", "getCanRedo", "()Z", "canUndo", "getCanUndo", "<set-?>", "stagingUndo", "getStagingUndo", "()Landroidx/compose/foundation/text/input/internal/undo/TextUndoOperation;", "setStagingUndo", "(Landroidx/compose/foundation/text/input/internal/undo/TextUndoOperation;)V", "stagingUndo$delegate", "Landroidx/compose/runtime/MutableState;", "clearHistory", "", "flush", "record", "op", "redo", "state", "Landroidx/compose/foundation/text/input/TextFieldState;", "undo", "Companion", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextUndoManager {
    private final MutableState stagingUndo$delegate;
    private final UndoManager<TextUndoOperation> undoManager;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    public TextUndoManager() {
        this(null, null, 3, null);
    }

    public TextUndoManager(TextUndoOperation initialStagingUndo, UndoManager<TextUndoOperation> undoManager) {
        MutableState mutableStateOf$default;
        this.undoManager = undoManager;
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(initialStagingUndo, null, 2, null);
        this.stagingUndo$delegate = mutableStateOf$default;
    }

    public /* synthetic */ TextUndoManager(TextUndoOperation textUndoOperation, UndoManager undoManager, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this((i & 1) != 0 ? null : textUndoOperation, (i & 2) != 0 ? new UndoManager(null, null, 100, 3, null) : undoManager);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final TextUndoOperation getStagingUndo() {
        State $this$getValue$iv = this.stagingUndo$delegate;
        return (TextUndoOperation) $this$getValue$iv.getValue();
    }

    private final void setStagingUndo(TextUndoOperation textUndoOperation) {
        MutableState $this$setValue$iv = this.stagingUndo$delegate;
        $this$setValue$iv.setValue(textUndoOperation);
    }

    public final boolean getCanUndo() {
        return this.undoManager.getCanUndo$foundation_release() || getStagingUndo() != null;
    }

    public final boolean getCanRedo() {
        return this.undoManager.getCanRedo$foundation_release() && getStagingUndo() == null;
    }

    public final void undo(TextFieldState state) {
        if (!getCanUndo()) {
            return;
        }
        flush();
        TextUndoOperationKt.undo(state, this.undoManager.undo());
    }

    public final void redo(TextFieldState state) {
        if (!getCanRedo()) {
            return;
        }
        TextUndoOperationKt.redo(state, this.undoManager.redo());
    }

    public final void record(TextUndoOperation op) {
        Snapshot.Companion this_$iv = Snapshot.Companion;
        Snapshot previousSnapshot$iv = this_$iv.getCurrentThreadSnapshot();
        Function1 observer$iv = previousSnapshot$iv != null ? previousSnapshot$iv.getReadObserver() : null;
        Snapshot newSnapshot$iv = this_$iv.makeCurrentNonObservable(previousSnapshot$iv);
        try {
            TextUndoOperation unobservedStagingUndo = getStagingUndo();
            if (unobservedStagingUndo == null) {
                setStagingUndo(op);
                return;
            }
            TextUndoOperation mergedOp = TextUndoManagerKt.merge(unobservedStagingUndo, op);
            if (mergedOp != null) {
                setStagingUndo(mergedOp);
                return;
            }
            flush();
            setStagingUndo(op);
        } finally {
            this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
        }
    }

    public final void clearHistory() {
        setStagingUndo(null);
        this.undoManager.clearHistory();
    }

    private final void flush() {
        Snapshot.Companion this_$iv = Snapshot.Companion;
        Snapshot previousSnapshot$iv = this_$iv.getCurrentThreadSnapshot();
        Function1 observer$iv = previousSnapshot$iv != null ? previousSnapshot$iv.getReadObserver() : null;
        Snapshot newSnapshot$iv = this_$iv.makeCurrentNonObservable(previousSnapshot$iv);
        try {
            TextUndoOperation unobservedStagingUndo = getStagingUndo();
            if (unobservedStagingUndo != null) {
                this.undoManager.record(unobservedStagingUndo);
            }
            setStagingUndo(null);
        } finally {
            this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
        }
    }

    /* compiled from: TextUndoManager.kt */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001:\u0001\u0003B\u0007\b\u0002¢\u0006\u0002\u0010\u0002¨\u0006\u0004"}, d2 = {"Landroidx/compose/foundation/text/input/TextUndoManager$Companion;", "", "()V", "Saver", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* compiled from: TextUndoManager.kt */
        @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0004J\u0012\u0010\b\u001a\u0004\u0018\u00010\u00022\u0006\u0010\t\u001a\u00020\u0003H\u0016J\u0014\u0010\n\u001a\u00020\u0003*\u00020\u000b2\u0006\u0010\t\u001a\u00020\u0002H\u0016R \u0010\u0005\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00070\u0006\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\f"}, d2 = {"Landroidx/compose/foundation/text/input/TextUndoManager$Companion$Saver;", "Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/foundation/text/input/TextUndoManager;", "", "()V", "undoManagerSaver", "Landroidx/compose/foundation/text/input/internal/undo/UndoManager;", "Landroidx/compose/foundation/text/input/internal/undo/TextUndoOperation;", "restore", "value", "save", "Landroidx/compose/runtime/saveable/SaverScope;", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
        /* loaded from: classes.dex */
        public static final class Saver implements androidx.compose.runtime.saveable.Saver<TextUndoManager, Object> {
            public static final int $stable;
            public static final Saver INSTANCE = new Saver();
            private static final androidx.compose.runtime.saveable.Saver<UndoManager<TextUndoOperation>, Object> undoManagerSaver;

            private Saver() {
            }

            static {
                UndoManager.Companion companion = UndoManager.Companion;
                final androidx.compose.runtime.saveable.Saver itemSaver$iv = TextUndoOperation.Companion.getSaver();
                undoManagerSaver = new androidx.compose.runtime.saveable.Saver<UndoManager<TextUndoOperation>, Object>() { // from class: androidx.compose.foundation.text.input.TextUndoManager$Companion$Saver$special$$inlined$createSaver$1
                    @Override // androidx.compose.runtime.saveable.Saver
                    public Object save(SaverScope $this$save, UndoManager<TextUndoOperation> undoManager) {
                        int i;
                        SnapshotStateList snapshotStateList;
                        SnapshotStateList snapshotStateList2;
                        List list;
                        List $this$fastForEach$iv;
                        Saver $this$save_u24lambda_u244_u24lambda_u241_u24lambda_u240 = Saver.this;
                        List $this$save_u24lambda_u244 = CollectionsKt.createListBuilder();
                        i = ((UndoManager) undoManager).capacity;
                        $this$save_u24lambda_u244.add(Integer.valueOf(i));
                        snapshotStateList = ((UndoManager) undoManager).undoStack;
                        $this$save_u24lambda_u244.add(Integer.valueOf(snapshotStateList.size()));
                        snapshotStateList2 = ((UndoManager) undoManager).redoStack;
                        $this$save_u24lambda_u244.add(Integer.valueOf(snapshotStateList2.size()));
                        list = ((UndoManager) undoManager).undoStack;
                        List $this$fastForEach$iv2 = list;
                        int size = $this$fastForEach$iv2.size();
                        for (int index$iv = 0; index$iv < size; index$iv++) {
                            $this$save_u24lambda_u244.add($this$save_u24lambda_u244_u24lambda_u241_u24lambda_u240.save($this$save, $this$fastForEach$iv2.get(index$iv)));
                        }
                        $this$fastForEach$iv = ((UndoManager) undoManager).redoStack;
                        List $this$fastForEach$iv3 = $this$fastForEach$iv;
                        int size2 = $this$fastForEach$iv3.size();
                        for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
                            $this$save_u24lambda_u244.add($this$save_u24lambda_u244_u24lambda_u241_u24lambda_u240.save($this$save, $this$fastForEach$iv3.get(index$iv2)));
                        }
                        return CollectionsKt.build($this$save_u24lambda_u244);
                    }

                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // androidx.compose.runtime.saveable.Saver
                    public UndoManager<TextUndoOperation> restore(Object value) {
                        Intrinsics.checkNotNull(value, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
                        List list = (List) value;
                        int capacity = ((Number) list.get(0)).intValue();
                        int undoSize = ((Number) list.get(1)).intValue();
                        int redoSize = ((Number) list.get(2)).intValue();
                        int i = 3;
                        Saver saver = Saver.this;
                        List $this$restore_u24lambda_u245 = CollectionsKt.createListBuilder();
                        while (i < undoSize + 3) {
                            Object restore = saver.restore(list.get(i));
                            Intrinsics.checkNotNull(restore);
                            $this$restore_u24lambda_u245.add(restore);
                            i++;
                        }
                        List undoStackItems = CollectionsKt.build($this$restore_u24lambda_u245);
                        Saver saver2 = Saver.this;
                        List $this$restore_u24lambda_u246 = CollectionsKt.createListBuilder();
                        while (i < undoSize + redoSize + 3) {
                            Object restore2 = saver2.restore(list.get(i));
                            Intrinsics.checkNotNull(restore2);
                            $this$restore_u24lambda_u246.add(restore2);
                            i++;
                        }
                        List redoStackItems = CollectionsKt.build($this$restore_u24lambda_u246);
                        return new UndoManager<>(undoStackItems, redoStackItems, capacity);
                    }
                };
                $stable = 8;
            }

            @Override // androidx.compose.runtime.saveable.Saver
            public Object save(SaverScope $this$save, TextUndoManager value) {
                Object obj;
                TextUndoOperation it = value.getStagingUndo();
                if (it != null) {
                    androidx.compose.runtime.saveable.Saver $this$save_u24lambda_u241_u24lambda_u240 = TextUndoOperation.Companion.getSaver();
                    obj = $this$save_u24lambda_u241_u24lambda_u240.save($this$save, it);
                } else {
                    obj = null;
                }
                androidx.compose.runtime.saveable.Saver $this$save_u24lambda_u242 = undoManagerSaver;
                return CollectionsKt.listOf(obj, $this$save_u24lambda_u242.save($this$save, value.undoManager));
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // androidx.compose.runtime.saveable.Saver
            public TextUndoManager restore(Object value) {
                TextUndoOperation textUndoOperation;
                Intrinsics.checkNotNull(value, "null cannot be cast to non-null type kotlin.collections.List<*>");
                List list = (List) value;
                Object savedStagingUndo = list.get(0);
                Object savedUndoManager = list.get(1);
                if (savedStagingUndo != null) {
                    androidx.compose.runtime.saveable.Saver $this$restore_u24lambda_u244_u24lambda_u243 = TextUndoOperation.Companion.getSaver();
                    textUndoOperation = $this$restore_u24lambda_u244_u24lambda_u243.restore(savedStagingUndo);
                } else {
                    textUndoOperation = null;
                }
                androidx.compose.runtime.saveable.Saver $this$restore_u24lambda_u245 = undoManagerSaver;
                Intrinsics.checkNotNull(savedUndoManager);
                UndoManager<TextUndoOperation> restore = $this$restore_u24lambda_u245.restore(savedUndoManager);
                Intrinsics.checkNotNull(restore);
                return new TextUndoManager(textUndoOperation, restore);
            }
        }

        private Companion() {
        }
    }
}
