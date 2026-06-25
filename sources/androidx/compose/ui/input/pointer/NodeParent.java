package androidx.compose.ui.input.pointer;

import androidx.collection.LongSparseArray;
import androidx.collection.MutableObjectList;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.layout.LayoutCoordinates;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: HitPathTracker.kt */
@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0006\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\b\u0010\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J.\u0010\n\u001a\u00020\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\r2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u000bH\u0016J\u0010\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0011\u001a\u00020\u0012H\u0016J\u0006\u0010\u0016\u001a\u00020\u0015J\b\u0010\u0017\u001a\u00020\u0015H\u0016J\u0010\u0010\u0018\u001a\u00020\u000b2\u0006\u0010\u0011\u001a\u00020\u0012H\u0016J.\u0010\u0019\u001a\u00020\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\r2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u000bH\u0016J\u001e\u0010\u001a\u001a\u00020\u00152\u0006\u0010\u001b\u001a\u00020\u001c2\f\u0010\u001d\u001a\b\u0012\u0004\u0012\u00020\u00050\tH\u0016J\u0010\u0010\u001e\u001a\u00020\u00152\u0006\u0010\u001f\u001a\u00020 H\u0016R\u0017\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00000\tX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006!"}, d2 = {"Landroidx/compose/ui/input/pointer/NodeParent;", "", "()V", "children", "Landroidx/compose/runtime/collection/MutableVector;", "Landroidx/compose/ui/input/pointer/Node;", "getChildren", "()Landroidx/compose/runtime/collection/MutableVector;", "removeMatchingPointerInputModifierNodeList", "Landroidx/collection/MutableObjectList;", "buildCache", "", "changes", "Landroidx/collection/LongSparseArray;", "Landroidx/compose/ui/input/pointer/PointerInputChange;", "parentCoordinates", "Landroidx/compose/ui/layout/LayoutCoordinates;", "internalPointerEvent", "Landroidx/compose/ui/input/pointer/InternalPointerEvent;", "isInBounds", "cleanUpHits", "", "clear", "dispatchCancel", "dispatchFinalEventPass", "dispatchMainEventPass", "removeInvalidPointerIdsAndChanges", "pointerIdValue", "", "hitNodes", "removePointerInputModifierNode", "pointerInputModifierNode", "Landroidx/compose/ui/Modifier$Node;", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public class NodeParent {
    public static final int $stable = 8;
    private final MutableVector<Node> children = new MutableVector<>(new Node[16], 0);
    private final MutableObjectList<NodeParent> removeMatchingPointerInputModifierNodeList = new MutableObjectList<>(10);

    public final MutableVector<Node> getChildren() {
        return this.children;
    }

    public boolean buildCache(LongSparseArray<PointerInputChange> longSparseArray, LayoutCoordinates parentCoordinates, InternalPointerEvent internalPointerEvent, boolean isInBounds) {
        boolean changed = false;
        MutableVector this_$iv = this.children;
        Object[] content$iv = this_$iv.content;
        int size$iv = this_$iv.getSize();
        for (int i$iv = 0; i$iv < size$iv; i$iv++) {
            Node it = (Node) content$iv[i$iv];
            changed = it.buildCache(longSparseArray, parentCoordinates, internalPointerEvent, isInBounds) || changed;
        }
        return changed;
    }

    public boolean dispatchMainEventPass(LongSparseArray<PointerInputChange> longSparseArray, LayoutCoordinates parentCoordinates, InternalPointerEvent internalPointerEvent, boolean isInBounds) {
        boolean dispatched = false;
        MutableVector this_$iv = this.children;
        Object[] content$iv = this_$iv.content;
        int size$iv = this_$iv.getSize();
        for (int i$iv = 0; i$iv < size$iv; i$iv++) {
            Node it = (Node) content$iv[i$iv];
            dispatched = it.dispatchMainEventPass(longSparseArray, parentCoordinates, internalPointerEvent, isInBounds) || dispatched;
        }
        return dispatched;
    }

    public boolean dispatchFinalEventPass(InternalPointerEvent internalPointerEvent) {
        boolean dispatched = false;
        MutableVector this_$iv = this.children;
        Object[] content$iv = this_$iv.content;
        int size$iv = this_$iv.getSize();
        for (int i$iv = 0; i$iv < size$iv; i$iv++) {
            Node it = (Node) content$iv[i$iv];
            dispatched = it.dispatchFinalEventPass(internalPointerEvent) || dispatched;
        }
        cleanUpHits(internalPointerEvent);
        return dispatched;
    }

    public void dispatchCancel() {
        MutableVector this_$iv = this.children;
        Object[] content$iv = this_$iv.content;
        int size$iv = this_$iv.getSize();
        for (int i$iv = 0; i$iv < size$iv; i$iv++) {
            Node it = (Node) content$iv[i$iv];
            it.dispatchCancel();
        }
    }

    public void removePointerInputModifierNode(Modifier.Node pointerInputModifierNode) {
        this.removeMatchingPointerInputModifierNodeList.clear();
        this.removeMatchingPointerInputModifierNodeList.add(this);
        while (this.removeMatchingPointerInputModifierNodeList.isNotEmpty()) {
            NodeParent parent = this.removeMatchingPointerInputModifierNodeList.removeAt(this.removeMatchingPointerInputModifierNodeList.getSize() - 1);
            int index = 0;
            while (index < parent.children.getSize()) {
                MutableVector this_$iv = parent.children;
                Node child = this_$iv.content[index];
                if (Intrinsics.areEqual(child.getModifierNode(), pointerInputModifierNode)) {
                    parent.children.remove(child);
                    child.dispatchCancel();
                } else {
                    this.removeMatchingPointerInputModifierNodeList.add(child);
                    index++;
                }
            }
        }
    }

    public final void clear() {
        this.children.clear();
    }

    public void removeInvalidPointerIdsAndChanges(long pointerIdValue, MutableObjectList<Node> mutableObjectList) {
        MutableVector this_$iv = this.children;
        Object[] content$iv = this_$iv.content;
        int size$iv = this_$iv.getSize();
        for (int i$iv = 0; i$iv < size$iv; i$iv++) {
            Node it = (Node) content$iv[i$iv];
            it.removeInvalidPointerIdsAndChanges(pointerIdValue, mutableObjectList);
        }
    }

    public void cleanUpHits(InternalPointerEvent internalPointerEvent) {
        MutableVector this_$iv = this.children;
        int i = this_$iv.getSize();
        while (true) {
            i--;
            if (-1 < i) {
                MutableVector this_$iv2 = this.children;
                Node child = this_$iv2.content[i];
                if (child.getPointerIds().isEmpty()) {
                    this.children.removeAt(i);
                }
            } else {
                return;
            }
        }
    }
}
