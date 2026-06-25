package androidx.compose.ui.graphics;

import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.exifinterface.media.ExifInterface;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.ClosedFloatingPointRange;
/* compiled from: IntervalTree.kt */
@Metadata(d1 = {"\u0000Z\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010(\n\u0002\b\t\b\u0007\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u0002:\u0001)B\u0005¢\u0006\u0002\u0010\u0003J%\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\r2\b\u0010\u000f\u001a\u0004\u0018\u00018\u0000¢\u0006\u0002\u0010\u0010J\u0006\u0010\u0011\u001a\u00020\u000bJ\u0011\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\rH\u0086\u0002J\u0017\u0010\u0012\u001a\u00020\u00132\f\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\r0\u0016H\u0086\u0002J\u001e\u0010\u0017\u001a\b\u0012\u0004\u0012\u00028\u00000\u00182\u0006\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\rJ\u001a\u0010\u0017\u001a\b\u0012\u0004\u0012\u00028\u00000\u00182\f\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\r0\u0016J:\u0010\u0019\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u00180\u001a2\u0006\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\r2\u0014\b\u0002\u0010\u001b\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u00180\u001aJ6\u0010\u0019\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u00180\u001a2\f\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\r0\u00162\u0014\b\u0002\u0010\u001b\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u00180\u001aJ:\u0010\u001c\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\r2\u0018\u0010\u001d\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u0018\u0012\u0004\u0012\u00020\u000b0\u001eH\u0080\b¢\u0006\u0002\b\u001fJ6\u0010\u001c\u001a\u00020\u000b2\f\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\r0\u00162\u0018\u0010\u001d\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u0018\u0012\u0004\u0012\u00020\u000b0\u001eH\u0080\b¢\u0006\u0002\b\u001fJ\u0015\u0010 \u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u00180!H\u0086\u0002J\u0017\u0010\"\u001a\u00020\u000b2\f\u0010\u0015\u001a\b\u0012\u0004\u0012\u00028\u00000\u0018H\u0086\u0002J\u001a\u0010#\u001a\u00020\u000b2\u0010\u0010$\u001a\f0\u0005R\b\u0012\u0004\u0012\u00028\u00000\u0000H\u0002J\u001a\u0010%\u001a\u00020\u000b2\u0010\u0010&\u001a\f0\u0005R\b\u0012\u0004\u0012\u00028\u00000\u0000H\u0002J\u001a\u0010'\u001a\u00020\u000b2\u0010\u0010&\u001a\f0\u0005R\b\u0012\u0004\u0012\u00028\u00000\u0000H\u0002J\u001a\u0010(\u001a\u00020\u000b2\u0010\u0010&\u001a\f0\u0005R\b\u0012\u0004\u0012\u00028\u00000\u0000H\u0002R\u001c\u0010\u0004\u001a\f0\u0005R\b\u0012\u0004\u0012\u00028\u00000\u00008\u0000@\u0000X\u0081\u000e¢\u0006\u0002\n\u0000R4\u0010\u0006\u001a&\u0012\u000e\u0012\f0\u0005R\b\u0012\u0004\u0012\u00028\u00000\u00000\u0007j\u0012\u0012\u000e\u0012\f0\u0005R\b\u0012\u0004\u0012\u00028\u00000\u0000`\b8\u0000X\u0081\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\t\u001a\f0\u0005R\b\u0012\u0004\u0012\u00028\u00000\u00008\u0000X\u0081\u0004¢\u0006\u0002\n\u0000¨\u0006*"}, d2 = {"Landroidx/compose/ui/graphics/IntervalTree;", ExifInterface.GPS_DIRECTION_TRUE, "", "()V", "root", "Landroidx/compose/ui/graphics/IntervalTree$Node;", "stack", "Ljava/util/ArrayList;", "Lkotlin/collections/ArrayList;", "terminator", "addInterval", "", "start", "", "end", "data", "(FFLjava/lang/Object;)V", "clear", "contains", "", "value", "interval", "Lkotlin/ranges/ClosedFloatingPointRange;", "findFirstOverlap", "Landroidx/compose/ui/graphics/Interval;", "findOverlaps", "", "results", "forEach", "block", "Lkotlin/Function1;", "forEach$ui_graphics_release", "iterator", "", "plusAssign", "rebalance", TypedValues.AttributesType.S_TARGET, "rotateLeft", "node", "rotateRight", "updateNodeData", "Node", "ui-graphics_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class IntervalTree<T> {
    public final IntervalTree<T>.Node terminator = new Node(Float.MAX_VALUE, Float.MIN_VALUE, null, 1);
    public IntervalTree<T>.Node root = this.terminator;
    public final ArrayList<IntervalTree<T>.Node> stack = new ArrayList<>();

    public final void clear() {
        this.root = this.terminator;
    }

    public final Interval<T> findFirstOverlap(ClosedFloatingPointRange<Float> closedFloatingPointRange) {
        return findFirstOverlap(closedFloatingPointRange.getStart().floatValue(), closedFloatingPointRange.getEndInclusive().floatValue());
    }

    public static /* synthetic */ Interval findFirstOverlap$default(IntervalTree intervalTree, float f, float f2, int i, Object obj) {
        if ((i & 2) != 0) {
            f2 = f;
        }
        return intervalTree.findFirstOverlap(f, f2);
    }

    public final Interval<T> findFirstOverlap(float start, float end) {
        if (this.root != this.terminator && this.root != this.terminator) {
            ArrayList s$iv = this.stack;
            s$iv.add(this.root);
            while (s$iv.size() > 0) {
                IntervalTree<T>.Node node$iv = s$iv.remove(s$iv.size() - 1);
                if (node$iv.overlaps(start, end)) {
                    IntervalTree<T>.Node interval = node$iv;
                    return interval;
                }
                Interval interval2 = node$iv.getLeft();
                if (interval2 != this.terminator && node$iv.getLeft().getMax() >= start) {
                    s$iv.add(node$iv.getLeft());
                }
                if (node$iv.getRight() != this.terminator && node$iv.getRight().getMin() <= end) {
                    s$iv.add(node$iv.getRight());
                }
            }
            s$iv.clear();
        }
        Interval<T> interval3 = (Interval<T>) IntervalTreeKt.getEmptyInterval();
        Intrinsics.checkNotNull(interval3, "null cannot be cast to non-null type androidx.compose.ui.graphics.Interval<T of androidx.compose.ui.graphics.IntervalTree>");
        return interval3;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ List findOverlaps$default(IntervalTree intervalTree, ClosedFloatingPointRange closedFloatingPointRange, List list, int i, Object obj) {
        if ((i & 2) != 0) {
            list = new ArrayList();
        }
        return intervalTree.findOverlaps(closedFloatingPointRange, list);
    }

    public final List<Interval<T>> findOverlaps(ClosedFloatingPointRange<Float> closedFloatingPointRange, List<Interval<T>> list) {
        return findOverlaps(closedFloatingPointRange.getStart().floatValue(), closedFloatingPointRange.getEndInclusive().floatValue(), list);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ List findOverlaps$default(IntervalTree intervalTree, float f, float f2, List list, int i, Object obj) {
        if ((i & 2) != 0) {
            f2 = f;
        }
        if ((i & 4) != 0) {
            list = new ArrayList();
        }
        return intervalTree.findOverlaps(f, f2, list);
    }

    public final List<Interval<T>> findOverlaps(float start, float end, List<Interval<T>> list) {
        if (this.root != this.terminator) {
            ArrayList s$iv = this.stack;
            s$iv.add(this.root);
            while (s$iv.size() > 0) {
                IntervalTree<T>.Node node$iv = s$iv.remove(s$iv.size() - 1);
                if (node$iv.overlaps(start, end)) {
                    IntervalTree<T>.Node interval = node$iv;
                    list.add(interval);
                }
                if (node$iv.getLeft() != this.terminator && node$iv.getLeft().getMax() >= start) {
                    s$iv.add(node$iv.getLeft());
                }
                if (node$iv.getRight() != this.terminator && node$iv.getRight().getMin() <= end) {
                    s$iv.add(node$iv.getRight());
                }
            }
            s$iv.clear();
        }
        return list;
    }

    public final void forEach$ui_graphics_release(ClosedFloatingPointRange<Float> closedFloatingPointRange, Function1<? super Interval<T>, Unit> function1) {
        float start$iv = closedFloatingPointRange.getStart().floatValue();
        float end$iv = closedFloatingPointRange.getEndInclusive().floatValue();
        if (this.root == this.terminator) {
            return;
        }
        ArrayList s$iv = this.stack;
        s$iv.add(this.root);
        while (s$iv.size() > 0) {
            IntervalTree<T>.Node node$iv = s$iv.remove(s$iv.size() - 1);
            if (node$iv.overlaps(start$iv, end$iv)) {
                function1.invoke(node$iv);
            }
            if (node$iv.getLeft() != this.terminator && node$iv.getLeft().getMax() >= start$iv) {
                s$iv.add(node$iv.getLeft());
            }
            if (node$iv.getRight() != this.terminator && node$iv.getRight().getMin() <= end$iv) {
                s$iv.add(node$iv.getRight());
            }
        }
        s$iv.clear();
    }

    public static /* synthetic */ void forEach$ui_graphics_release$default(IntervalTree $this, float start, float end, Function1 block, int i, Object obj) {
        if ((i & 2) != 0) {
            end = start;
        }
        if ($this.root != $this.terminator) {
            ArrayList s = $this.stack;
            s.add($this.root);
            while (s.size() > 0) {
                IntervalTree<T>.Node node = s.remove(s.size() - 1);
                if (node.overlaps(start, end)) {
                    block.invoke(node);
                }
                if (node.getLeft() != $this.terminator && node.getLeft().getMax() >= start) {
                    s.add(node.getLeft());
                }
                if (node.getRight() != $this.terminator && node.getRight().getMin() <= end) {
                    s.add(node.getRight());
                }
            }
            s.clear();
        }
    }

    public final void forEach$ui_graphics_release(float start, float end, Function1<? super Interval<T>, Unit> function1) {
        if (this.root != this.terminator) {
            ArrayList s = this.stack;
            s.add(this.root);
            while (s.size() > 0) {
                IntervalTree<T>.Node node = s.remove(s.size() - 1);
                if (node.overlaps(start, end)) {
                    function1.invoke(node);
                }
                if (node.getLeft() != this.terminator && node.getLeft().getMax() >= start) {
                    s.add(node.getLeft());
                }
                if (node.getRight() != this.terminator && node.getRight().getMin() <= end) {
                    s.add(node.getRight());
                }
            }
            s.clear();
        }
    }

    public final boolean contains(float value) {
        return findFirstOverlap(value, value) != IntervalTreeKt.getEmptyInterval();
    }

    public final boolean contains(ClosedFloatingPointRange<Float> closedFloatingPointRange) {
        return findFirstOverlap(closedFloatingPointRange.getStart().floatValue(), closedFloatingPointRange.getEndInclusive().floatValue()) != IntervalTreeKt.getEmptyInterval();
    }

    public final Iterator<Interval<T>> iterator() {
        return new IntervalTree$iterator$1(this);
    }

    public final void plusAssign(Interval<T> interval) {
        addInterval(interval.getStart(), interval.getEnd(), interval.getData());
    }

    public final void addInterval(float start, float end, T t) {
        Node right;
        IntervalTree<T>.Node node = new Node(start, end, t, 0);
        Node current = this.root;
        Node parent = this.terminator;
        while (current != this.terminator) {
            parent = current;
            if (node.getStart() <= current.getStart()) {
                right = current.getLeft();
            } else {
                right = current.getRight();
            }
            current = right;
        }
        node.setParent(parent);
        if (parent == this.terminator) {
            this.root = node;
        } else if (node.getStart() <= parent.getStart()) {
            parent.setLeft(node);
        } else {
            parent.setRight(node);
        }
        updateNodeData(node);
        rebalance(node);
    }

    private final void rebalance(IntervalTree<T>.Node node) {
        Node node2 = node;
        while (node2 != this.root && node2.getParent().getColor() == 0) {
            Node ancestor = node2.getParent().getParent();
            if (node2.getParent() == ancestor.getLeft()) {
                Node right = ancestor.getRight();
                if (right.getColor() == 0) {
                    right.setColor(1);
                    node2.getParent().setColor(1);
                    ancestor.setColor(0);
                    node2 = ancestor;
                } else {
                    if (node2 == node2.getParent().getRight()) {
                        node2 = node2.getParent();
                        rotateLeft(node2);
                    }
                    node2.getParent().setColor(1);
                    ancestor.setColor(0);
                    rotateRight(ancestor);
                }
            } else {
                Node left = ancestor.getLeft();
                if (left.getColor() == 0) {
                    left.setColor(1);
                    node2.getParent().setColor(1);
                    ancestor.setColor(0);
                    node2 = ancestor;
                } else {
                    if (node2 == node2.getParent().getLeft()) {
                        node2 = node2.getParent();
                        rotateRight(node2);
                    }
                    node2.getParent().setColor(1);
                    ancestor.setColor(0);
                    rotateLeft(ancestor);
                }
            }
        }
        this.root.setColor(1);
    }

    private final void rotateLeft(IntervalTree<T>.Node node) {
        Node right = node.getRight();
        node.setRight(right.getLeft());
        if (right.getLeft() != this.terminator) {
            right.getLeft().setParent(node);
        }
        right.setParent(node.getParent());
        if (node.getParent() == this.terminator) {
            this.root = right;
        } else if (node.getParent().getLeft() == node) {
            node.getParent().setLeft(right);
        } else {
            node.getParent().setRight(right);
        }
        right.setLeft(node);
        node.setParent(right);
        updateNodeData(node);
    }

    private final void rotateRight(IntervalTree<T>.Node node) {
        Node left = node.getLeft();
        node.setLeft(left.getRight());
        if (left.getRight() != this.terminator) {
            left.getRight().setParent(node);
        }
        left.setParent(node.getParent());
        if (node.getParent() == this.terminator) {
            this.root = left;
        } else if (node.getParent().getRight() == node) {
            node.getParent().setRight(left);
        } else {
            node.getParent().setLeft(left);
        }
        left.setRight(node);
        node.setParent(left);
        updateNodeData(node);
    }

    private final void updateNodeData(IntervalTree<T>.Node node) {
        for (Node current = node; current != this.terminator; current = current.getParent()) {
            current.setMin(Math.min(current.getStart(), Math.min(current.getLeft().getMin(), current.getRight().getMin())));
            current.setMax(Math.max(current.getEnd(), Math.max(current.getLeft().getMax(), current.getRight().getMax())));
        }
    }

    /* compiled from: IntervalTree.kt */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0015\b\u0080\u0004\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00018\u0000\u0012\n\u0010\u0006\u001a\u00060\u0007j\u0002`\b¢\u0006\u0002\u0010\tJ\u0010\u0010\"\u001a\f0\u0000R\b\u0012\u0004\u0012\u00028\u00000\u000fJ\u0010\u0010#\u001a\f0\u0000R\b\u0012\u0004\u0012\u00028\u00000\u000fR\u001e\u0010\u0006\u001a\u00060\u0007j\u0002`\bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\n\u0010\u000b\"\u0004\b\f\u0010\rR$\u0010\u000e\u001a\f0\u0000R\b\u0012\u0004\u0012\u00028\u00000\u000fX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0010\u0010\u0011\"\u0004\b\u0012\u0010\u0013R\u001a\u0010\u0014\u001a\u00020\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0015\u0010\u0016\"\u0004\b\u0017\u0010\u0018R\u001a\u0010\u0019\u001a\u00020\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001a\u0010\u0016\"\u0004\b\u001b\u0010\u0018R$\u0010\u001c\u001a\f0\u0000R\b\u0012\u0004\u0012\u00028\u00000\u000fX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001d\u0010\u0011\"\u0004\b\u001e\u0010\u0013R$\u0010\u001f\u001a\f0\u0000R\b\u0012\u0004\u0012\u00028\u00000\u000fX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b \u0010\u0011\"\u0004\b!\u0010\u0013¨\u0006$"}, d2 = {"Landroidx/compose/ui/graphics/IntervalTree$Node;", "Landroidx/compose/ui/graphics/Interval;", "start", "", "end", "data", TypedValues.Custom.S_COLOR, "", "Landroidx/compose/ui/graphics/TreeColor;", "(Landroidx/compose/ui/graphics/IntervalTree;FFLjava/lang/Object;I)V", "getColor", "()I", "setColor", "(I)V", "left", "Landroidx/compose/ui/graphics/IntervalTree;", "getLeft", "()Landroidx/compose/ui/graphics/IntervalTree$Node;", "setLeft", "(Landroidx/compose/ui/graphics/IntervalTree$Node;)V", "max", "getMax", "()F", "setMax", "(F)V", "min", "getMin", "setMin", "parent", "getParent", "setParent", "right", "getRight", "setRight", "lowestNode", "next", "ui-graphics_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public final class Node extends Interval<T> {
        private int color;
        private IntervalTree<T>.Node left;
        private float max;
        private float min;
        private IntervalTree<T>.Node parent;
        private IntervalTree<T>.Node right;

        public Node(float start, float end, T t, int color) {
            super(start, end, t);
            this.color = color;
            this.min = start;
            this.max = end;
            this.left = IntervalTree.this.terminator;
            this.right = IntervalTree.this.terminator;
            this.parent = IntervalTree.this.terminator;
        }

        public final int getColor() {
            return this.color;
        }

        public final void setColor(int i) {
            this.color = i;
        }

        public final float getMin() {
            return this.min;
        }

        public final void setMin(float f) {
            this.min = f;
        }

        public final float getMax() {
            return this.max;
        }

        public final void setMax(float f) {
            this.max = f;
        }

        public final IntervalTree<T>.Node getLeft() {
            return this.left;
        }

        public final void setLeft(IntervalTree<T>.Node node) {
            this.left = node;
        }

        public final IntervalTree<T>.Node getRight() {
            return this.right;
        }

        public final void setRight(IntervalTree<T>.Node node) {
            this.right = node;
        }

        public final IntervalTree<T>.Node getParent() {
            return this.parent;
        }

        public final void setParent(IntervalTree<T>.Node node) {
            this.parent = node;
        }

        public final IntervalTree<T>.Node lowestNode() {
            Node node = this;
            while (node.left != IntervalTree.this.terminator) {
                node = node.left;
            }
            return node;
        }

        public final IntervalTree<T>.Node next() {
            if (this.right != IntervalTree.this.terminator) {
                return this.right.lowestNode();
            }
            Node a = this;
            Node b = this.parent;
            while (b != IntervalTree.this.terminator && a == b.right) {
                a = b;
                b = b.parent;
            }
            return b;
        }
    }
}
