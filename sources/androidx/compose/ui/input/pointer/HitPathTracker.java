package androidx.compose.ui.input.pointer;

import androidx.collection.LongObjectMap;
import androidx.collection.MutableLongObjectMap;
import androidx.collection.MutableObjectList;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.layout.LayoutCoordinates;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: HitPathTracker.kt */
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0004\b\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J0\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00130\u00122\b\b\u0002\u0010\u0014\u001a\u00020\u0015ø\u0001\u0000¢\u0006\u0004\b\u0016\u0010\u0017J\u0006\u0010\u0018\u001a\u00020\u000eJ\u0018\u0010\u0019\u001a\u00020\u00152\u0006\u0010\u001a\u001a\u00020\u001b2\b\b\u0002\u0010\u001c\u001a\u00020\u0015J\u0006\u0010\u001d\u001a\u00020\u000eJ\u001e\u0010\u001e\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u001f2\f\u0010 \u001a\b\u0012\u0004\u0012\u00020\b0\u0007H\u0002J\u0010\u0010!\u001a\u00020\u000e2\u0006\u0010\"\u001a\u00020\u0013H\u0002R\u001a\u0010\u0005\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\b0\u00070\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\t\u001a\u00020\nX\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006#"}, d2 = {"Landroidx/compose/ui/input/pointer/HitPathTracker;", "", "rootCoordinates", "Landroidx/compose/ui/layout/LayoutCoordinates;", "(Landroidx/compose/ui/layout/LayoutCoordinates;)V", "hitPointerIdsAndNodes", "Landroidx/collection/MutableLongObjectMap;", "Landroidx/collection/MutableObjectList;", "Landroidx/compose/ui/input/pointer/Node;", "root", "Landroidx/compose/ui/input/pointer/NodeParent;", "getRoot$ui_release", "()Landroidx/compose/ui/input/pointer/NodeParent;", "addHitPath", "", "pointerId", "Landroidx/compose/ui/input/pointer/PointerId;", "pointerInputNodes", "", "Landroidx/compose/ui/Modifier$Node;", "prunePointerIdsAndChangesNotInNodesList", "", "addHitPath-QJqDSyo", "(JLjava/util/List;Z)V", "clearPreviouslyHitModifierNodeCache", "dispatchChanges", "internalPointerEvent", "Landroidx/compose/ui/input/pointer/InternalPointerEvent;", "isInBounds", "processCancel", "removeInvalidPointerIdsAndChanges", "", "hitNodes", "removePointerInputModifierNode", "pointerInputNode", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class HitPathTracker {
    public static final int $stable = 8;
    private final LayoutCoordinates rootCoordinates;
    private final NodeParent root = new NodeParent();
    private final MutableLongObjectMap<MutableObjectList<Node>> hitPointerIdsAndNodes = new MutableLongObjectMap<>(10);

    public HitPathTracker(LayoutCoordinates rootCoordinates) {
        this.rootCoordinates = rootCoordinates;
    }

    public final NodeParent getRoot$ui_release() {
        return this.root;
    }

    /* renamed from: addHitPath-QJqDSyo$default  reason: not valid java name */
    public static /* synthetic */ void m5437addHitPathQJqDSyo$default(HitPathTracker hitPathTracker, long j, List list, boolean z, int i, Object obj) {
        if ((i & 4) != 0) {
            z = false;
        }
        hitPathTracker.m5438addHitPathQJqDSyo(j, list, z);
    }

    /* renamed from: addHitPath-QJqDSyo  reason: not valid java name */
    public final void m5438addHitPathQJqDSyo(long pointerId, List<? extends Modifier.Node> list, boolean prunePointerIdsAndChangesNotInNodesList) {
        LongObjectMap this_$iv;
        int $i$f$forEach;
        int i;
        LongObjectMap this_$iv2;
        int $i$f$forEach2;
        NodeParent parent;
        Object item$iv;
        boolean merging;
        long j = pointerId;
        List<? extends Modifier.Node> list2 = list;
        NodeParent parent2 = this.root;
        this.hitPointerIdsAndNodes.clear();
        boolean merging2 = true;
        int i2 = 0;
        int size = list2.size();
        while (i2 < size) {
            final Modifier.Node pointerInputNode = list2.get(i2);
            if (pointerInputNode.isAttached()) {
                pointerInputNode.setDetachedListener$ui_release(new Function0<Unit>() { // from class: androidx.compose.ui.input.pointer.HitPathTracker$addHitPath$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Unit invoke() {
                        invoke2();
                        return Unit.INSTANCE;
                    }

                    /* renamed from: invoke  reason: avoid collision after fix types in other method */
                    public final void invoke2() {
                        HitPathTracker.this.removePointerInputModifierNode(pointerInputNode);
                    }
                });
                if (!merging2) {
                    parent = parent2;
                } else {
                    MutableVector this_$iv3 = parent2.getChildren();
                    Object[] content$iv = this_$iv3.content;
                    int size$iv = this_$iv3.getSize();
                    int i$iv = 0;
                    while (true) {
                        if (i$iv < size$iv) {
                            item$iv = content$iv[i$iv];
                            Node it = (Node) item$iv;
                            if (Intrinsics.areEqual(it.getModifierNode(), pointerInputNode)) {
                                break;
                            }
                            i$iv++;
                        } else {
                            item$iv = null;
                            break;
                        }
                    }
                    Node node = (Node) item$iv;
                    if (node != null) {
                        node.markIsIn();
                        node.getPointerIds().add(j);
                        MutableLongObjectMap this_$iv4 = this.hitPointerIdsAndNodes;
                        MutableObjectList<Node> mutableObjectList = this_$iv4.get(pointerId);
                        if (mutableObjectList == null) {
                            merging = merging2;
                            MutableObjectList<Node> mutableObjectList2 = new MutableObjectList<>(0, 1, null);
                            this_$iv4.set(pointerId, mutableObjectList2);
                            mutableObjectList = mutableObjectList2;
                        } else {
                            merging = merging2;
                        }
                        MutableObjectList<Node> mutableObjectList3 = mutableObjectList;
                        mutableObjectList3.add(node);
                        Node parent3 = node;
                        parent2 = parent3;
                        merging2 = merging;
                    } else {
                        parent = parent2;
                        merging2 = false;
                    }
                }
                Node node2 = new Node(pointerInputNode);
                node2.getPointerIds().add(j);
                MutableLongObjectMap this_$iv5 = this.hitPointerIdsAndNodes;
                MutableObjectList<Node> mutableObjectList4 = this_$iv5.get(pointerId);
                if (mutableObjectList4 == null) {
                    MutableObjectList<Node> mutableObjectList5 = new MutableObjectList<>(0, 1, null);
                    this_$iv5.set(pointerId, mutableObjectList5);
                    mutableObjectList4 = mutableObjectList5;
                }
                MutableObjectList<Node> mutableObjectList6 = mutableObjectList4;
                mutableObjectList6.add(node2);
                parent.getChildren().add(node2);
                parent2 = node2;
            }
            i2++;
            j = pointerId;
            list2 = list;
        }
        if (prunePointerIdsAndChangesNotInNodesList) {
            LongObjectMap this_$iv6 = this.hitPointerIdsAndNodes;
            int $i$f$forEach3 = 0;
            long[] k$iv = this_$iv6.keys;
            Object[] v$iv = this_$iv6.values;
            long[] m$iv$iv = this_$iv6.metadata;
            int lastIndex$iv$iv = m$iv$iv.length - 2;
            int i$iv$iv = 0;
            if (0 > lastIndex$iv$iv) {
                return;
            }
            while (true) {
                long slot$iv$iv = m$iv$iv[i$iv$iv];
                if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                    this_$iv = this_$iv6;
                    $i$f$forEach = $i$f$forEach3;
                } else {
                    int i3 = 8;
                    int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                    int j$iv$iv = 0;
                    while (j$iv$iv < bitCount$iv$iv) {
                        long value$iv$iv$iv = 255 & slot$iv$iv;
                        if (!(value$iv$iv$iv < 128)) {
                            i = i3;
                            this_$iv2 = this_$iv6;
                            $i$f$forEach2 = $i$f$forEach3;
                        } else {
                            int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                            i = i3;
                            this_$iv2 = this_$iv6;
                            long key = k$iv[index$iv$iv];
                            $i$f$forEach2 = $i$f$forEach3;
                            MutableObjectList value = (MutableObjectList) v$iv[index$iv$iv];
                            removeInvalidPointerIdsAndChanges(key, value);
                        }
                        slot$iv$iv >>= i;
                        j$iv$iv++;
                        this_$iv6 = this_$iv2;
                        i3 = i;
                        $i$f$forEach3 = $i$f$forEach2;
                    }
                    this_$iv = this_$iv6;
                    $i$f$forEach = $i$f$forEach3;
                    if (bitCount$iv$iv != i3) {
                        return;
                    }
                }
                if (i$iv$iv == lastIndex$iv$iv) {
                    return;
                }
                i$iv$iv++;
                this_$iv6 = this_$iv;
                $i$f$forEach3 = $i$f$forEach;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void removePointerInputModifierNode(Modifier.Node pointerInputNode) {
        this.root.removePointerInputModifierNode(pointerInputNode);
    }

    private final void removeInvalidPointerIdsAndChanges(long pointerId, MutableObjectList<Node> mutableObjectList) {
        this.root.removeInvalidPointerIdsAndChanges(pointerId, mutableObjectList);
    }

    public static /* synthetic */ boolean dispatchChanges$default(HitPathTracker hitPathTracker, InternalPointerEvent internalPointerEvent, boolean z, int i, Object obj) {
        if ((i & 2) != 0) {
            z = true;
        }
        return hitPathTracker.dispatchChanges(internalPointerEvent, z);
    }

    public final boolean dispatchChanges(InternalPointerEvent internalPointerEvent, boolean isInBounds) {
        boolean changed = this.root.buildCache(internalPointerEvent.getChanges(), this.rootCoordinates, internalPointerEvent, isInBounds);
        if (!changed) {
            return false;
        }
        boolean dispatchHit = this.root.dispatchMainEventPass(internalPointerEvent.getChanges(), this.rootCoordinates, internalPointerEvent, isInBounds);
        return this.root.dispatchFinalEventPass(internalPointerEvent) || dispatchHit;
    }

    public final void clearPreviouslyHitModifierNodeCache() {
        this.root.clear();
    }

    public final void processCancel() {
        this.root.dispatchCancel();
        clearPreviouslyHitModifierNodeCache();
    }
}
