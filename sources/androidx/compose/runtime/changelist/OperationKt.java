package androidx.compose.runtime.changelist;

import androidx.compose.runtime.Anchor;
import androidx.compose.runtime.Applier;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.SlotWriter;
import kotlin.Metadata;
/* compiled from: Operation.kt */
@Metadata(d1 = {"\u0000(\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\u001a\u0010\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0002\u001a(\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0005\u001a\u00020\u00062\u000e\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\bH\u0002\u001a(\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0002\u001a\u00020\u00032\u000e\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\b2\u0006\u0010\f\u001a\u00020\u0001H\u0002*\f\b\u0000\u0010\r\"\u00020\u00012\u00020\u0001¨\u0006\u000e"}, d2 = {"currentNodeIndex", "", "slots", "Landroidx/compose/runtime/SlotWriter;", "positionToInsert", "anchor", "Landroidx/compose/runtime/Anchor;", "applier", "Landroidx/compose/runtime/Applier;", "", "positionToParentOf", "", "index", "IntParameter", "runtime_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class OperationKt {
    /* JADX INFO: Access modifiers changed from: private */
    public static final void positionToParentOf(SlotWriter slots, Applier<Object> applier, int index) {
        while (!slots.indexInParent(index)) {
            slots.skipToGroupEnd();
            if (slots.isNode(slots.getParent())) {
                applier.up();
            }
            slots.endGroup();
        }
    }

    private static final int currentNodeIndex(SlotWriter slots) {
        int original = slots.getCurrentGroup();
        int current = slots.getParent();
        while (current >= 0 && !slots.isNode(current)) {
            current = slots.parent(current);
        }
        int index = 0;
        int current2 = current + 1;
        while (current2 < original) {
            if (slots.indexInGroup(original, current2)) {
                if (slots.isNode(current2)) {
                    index = 0;
                }
                current2++;
            } else {
                index += slots.isNode(current2) ? 1 : slots.nodeCount(current2);
                current2 += slots.groupSize(current2);
            }
        }
        return index;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int positionToInsert(SlotWriter slots, Anchor anchor, Applier<Object> applier) {
        int destination = slots.anchorIndex(anchor);
        boolean value$iv = slots.getCurrentGroup() < destination;
        if (!value$iv) {
            ComposerKt.composeImmediateRuntimeError("Check failed");
        }
        positionToParentOf(slots, applier, destination);
        int nodeIndex = currentNodeIndex(slots);
        while (slots.getCurrentGroup() < destination) {
            if (slots.indexInCurrentGroup(destination)) {
                if (slots.isNode()) {
                    applier.down(slots.node(slots.getCurrentGroup()));
                    nodeIndex = 0;
                }
                slots.startGroup();
            } else {
                nodeIndex += slots.skipGroup();
            }
        }
        boolean value$iv2 = slots.getCurrentGroup() == destination;
        if (!value$iv2) {
            ComposerKt.composeImmediateRuntimeError("Check failed");
        }
        return nodeIndex;
    }
}
