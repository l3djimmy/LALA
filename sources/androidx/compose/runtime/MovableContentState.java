package androidx.compose.runtime;

import androidx.collection.MutableObjectList;
import androidx.collection.MutableScatterMap;
import androidx.collection.ObjectList;
import androidx.collection.ScatterMap;
import androidx.collection.ScatterMapKt;
import androidx.compose.runtime.collection.ExtensionsKt;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
/* compiled from: Composer.kt */
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001B\u000f\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J3\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u00000\b2\n\u0010\n\u001a\u0006\u0012\u0002\b\u00030\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\t0\rH\u0000¢\u0006\u0002\b\u000eR\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u000f"}, d2 = {"Landroidx/compose/runtime/MovableContentState;", "", "slotTable", "Landroidx/compose/runtime/SlotTable;", "(Landroidx/compose/runtime/SlotTable;)V", "getSlotTable$runtime_release", "()Landroidx/compose/runtime/SlotTable;", "extractNestedStates", "Landroidx/collection/ScatterMap;", "Landroidx/compose/runtime/MovableContentStateReference;", "applier", "Landroidx/compose/runtime/Applier;", "references", "Landroidx/collection/ObjectList;", "extractNestedStates$runtime_release", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class MovableContentState {
    public static final int $stable = 8;
    private final SlotTable slotTable;

    public MovableContentState(SlotTable slotTable) {
        this.slotTable = slotTable;
    }

    public final SlotTable getSlotTable$runtime_release() {
        return this.slotTable;
    }

    public final ScatterMap<MovableContentStateReference, MovableContentState> extractNestedStates$runtime_release(Applier<?> applier, ObjectList<MovableContentStateReference> objectList) {
        boolean z;
        ObjectList $this$fastFilter$iv = objectList;
        Object[] content$iv$iv$iv = $this$fastFilter$iv.content;
        int i$iv$iv$iv = 0;
        int i = $this$fastFilter$iv._size;
        while (true) {
            if (i$iv$iv$iv >= i) {
                z = true;
                break;
            }
            Object it$iv$iv = content$iv$iv$iv[i$iv$iv$iv];
            MovableContentStateReference it = (MovableContentStateReference) it$iv$iv;
            if (!this.slotTable.ownsAnchor(it.getAnchor$runtime_release())) {
                z = false;
                break;
            }
            i$iv$iv$iv++;
        }
        if (!z) {
            MutableObjectList target$iv = new MutableObjectList(0, 1, null);
            Object[] content$iv$iv = $this$fastFilter$iv.content;
            int i2 = $this$fastFilter$iv._size;
            for (int i$iv$iv = 0; i$iv$iv < i2; i$iv$iv++) {
                Object it$iv = content$iv$iv[i$iv$iv];
                MovableContentStateReference it2 = (MovableContentStateReference) it$iv;
                if (this.slotTable.ownsAnchor(it2.getAnchor$runtime_release())) {
                    target$iv.add(it$iv);
                }
            }
            $this$fastFilter$iv = target$iv;
        }
        ObjectList referencesToExtract = ExtensionsKt.sortedBy($this$fastFilter$iv, new Function1<MovableContentStateReference, Integer>() { // from class: androidx.compose.runtime.MovableContentState$extractNestedStates$referencesToExtract$2
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Integer invoke(MovableContentStateReference it3) {
                return Integer.valueOf(MovableContentState.this.getSlotTable$runtime_release().anchorIndex(it3.getAnchor$runtime_release()));
            }
        });
        if (referencesToExtract.isEmpty()) {
            return ScatterMapKt.emptyScatterMap();
        }
        MutableScatterMap result = ScatterMapKt.mutableScatterMapOf();
        SlotTable this_$iv = this.slotTable;
        SlotWriter writer$iv = this_$iv.openWriter();
        try {
            Object[] content$iv = referencesToExtract.content;
            int i$iv = 0;
            int i3 = referencesToExtract._size;
            while (i$iv < i3) {
                MovableContentStateReference reference = (MovableContentStateReference) content$iv[i$iv];
                int newGroup = writer$iv.anchorIndex(reference.getAnchor$runtime_release());
                int newParent = writer$iv.parent(newGroup);
                extractNestedStates$lambda$3$closeToGroupContaining(writer$iv, newParent);
                extractNestedStates$lambda$3$openParent(writer$iv, newParent);
                writer$iv.advanceBy(newGroup - writer$iv.getCurrentGroup());
                ObjectList referencesToExtract2 = referencesToExtract;
                try {
                    MovableContentState content = ComposerKt.extractMovableContentAtCurrent(reference.getComposition$runtime_release(), reference, writer$iv, applier);
                    result.set(reference, content);
                    i$iv++;
                    referencesToExtract = referencesToExtract2;
                } catch (Throwable th) {
                    th = th;
                    writer$iv.close(false);
                    throw th;
                }
            }
            extractNestedStates$lambda$3$closeToGroupContaining(writer$iv, Integer.MAX_VALUE);
            Unit unit = Unit.INSTANCE;
            writer$iv.close(true);
            return result;
        } catch (Throwable th2) {
            th = th2;
        }
    }

    private static final void extractNestedStates$lambda$3$closeToGroupContaining(SlotWriter $writer, int group) {
        while ($writer.getParent() >= 0 && $writer.getCurrentGroupEnd() <= group) {
            $writer.skipToGroupEnd();
            $writer.endGroup();
        }
    }

    private static final void extractNestedStates$lambda$3$openParent(SlotWriter $writer, int parent) {
        int nextGroup;
        extractNestedStates$lambda$3$closeToGroupContaining($writer, parent);
        while ($writer.getCurrentGroup() != parent && !$writer.isGroupEnd()) {
            nextGroup = ComposerKt.getNextGroup($writer);
            if (parent < nextGroup) {
                $writer.startGroup();
            } else {
                $writer.skipGroup();
            }
        }
        boolean value$iv = $writer.getCurrentGroup() == parent;
        if (!value$iv) {
            ComposerKt.composeImmediateRuntimeError("Unexpected slot table structure");
        }
        $writer.startGroup();
    }
}
