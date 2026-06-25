package androidx.compose.ui.node;

import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.Actual_jvmKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.node.TraversableNode;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: TraversableNode.kt */
@Metadata(d1 = {"\u0000.\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\u001a\u001b\u0010\u0000\u001a\u0004\u0018\u0001H\u0001\"\b\b\u0000\u0010\u0001*\u00020\u0002*\u0002H\u0001¢\u0006\u0002\u0010\u0003\u001a\u0016\u0010\u0000\u001a\u0004\u0018\u00010\u0002*\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u001a-\u0010\u0007\u001a\u00020\b\"\b\b\u0000\u0010\u0001*\u00020\u0002*\u0002H\u00012\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u0002H\u0001\u0012\u0004\u0012\u00020\u000b0\n¢\u0006\u0002\u0010\f\u001a(\u0010\u0007\u001a\u00020\b*\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u000b0\n\u001a-\u0010\r\u001a\u00020\b\"\b\b\u0000\u0010\u0001*\u00020\u0002*\u0002H\u00012\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u0002H\u0001\u0012\u0004\u0012\u00020\u000b0\n¢\u0006\u0002\u0010\f\u001a(\u0010\r\u001a\u00020\b*\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u000b0\n\u001a-\u0010\u000e\u001a\u00020\b\"\b\b\u0000\u0010\u0001*\u00020\u0002*\u0002H\u00012\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u0002H\u0001\u0012\u0004\u0012\u00020\u000f0\n¢\u0006\u0002\u0010\f\u001a(\u0010\u000e\u001a\u00020\b*\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u000f0\n¨\u0006\u0010"}, d2 = {"findNearestAncestor", ExifInterface.GPS_DIRECTION_TRUE, "Landroidx/compose/ui/node/TraversableNode;", "(Landroidx/compose/ui/node/TraversableNode;)Landroidx/compose/ui/node/TraversableNode;", "Landroidx/compose/ui/node/DelegatableNode;", "key", "", "traverseAncestors", "", "block", "Lkotlin/Function1;", "", "(Landroidx/compose/ui/node/TraversableNode;Lkotlin/jvm/functions/Function1;)V", "traverseChildren", "traverseDescendants", "Landroidx/compose/ui/node/TraversableNode$Companion$TraverseDescendantsAction;", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class TraversableNodeKt {
    public static final TraversableNode findNearestAncestor(DelegatableNode $this$findNearestAncestor, Object key) {
        int type$iv;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
        boolean includeSelf$iv;
        int i;
        Modifier.Node node;
        NodeChain nodes$ui_release;
        int type$iv2;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
        boolean includeSelf$iv2;
        int i2;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
        boolean includeSelf$iv3;
        int i3;
        boolean includeSelf$iv4;
        int i4;
        int count$iv$iv;
        MutableVector mutableVector;
        int count$iv$iv2 = NodeKind.m5898constructorimpl(262144);
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4 = $this$findNearestAncestor;
        boolean includeSelf$iv5 = false;
        int i5 = 0;
        boolean value$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4.getNode().getParent$ui_release();
        LayoutNode layout$iv$iv = DelegatableNodeKt.requireLayoutNode($this$visitAncestors_u2dY_u2dYKmho_u24default$iv4);
        while (layout$iv$iv != null) {
            Modifier.Node head$iv$iv = layout$iv$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv$iv.getAggregateChildKindSet$ui_release() & count$iv$iv2) == 0) {
                type$iv = count$iv$iv2;
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                includeSelf$iv = includeSelf$iv5;
                i = i5;
                node = null;
            } else {
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & count$iv$iv2) == 0) {
                        type$iv2 = count$iv$iv2;
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                        includeSelf$iv2 = includeSelf$iv5;
                        i2 = i5;
                    } else {
                        Modifier.Node it$iv = node$iv$iv;
                        MutableVector mutableVector2 = null;
                        Modifier.Node node2 = it$iv;
                        while (node2 != null) {
                            int type$iv3 = count$iv$iv2;
                            if (node2 instanceof TraversableNode) {
                                TraversableNode it = (TraversableNode) node2;
                                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                                if (Intrinsics.areEqual(key, it.getTraverseKey())) {
                                    return it;
                                }
                                includeSelf$iv3 = includeSelf$iv5;
                                i3 = i5;
                            } else {
                                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                                Modifier.Node this_$iv$iv$iv = node2;
                                if (((this_$iv$iv$iv.getKindSet$ui_release() & type$iv3) != 0 ? 1 : 0) == 0 || !(node2 instanceof DelegatingNode)) {
                                    includeSelf$iv3 = includeSelf$iv5;
                                    i3 = i5;
                                } else {
                                    int count$iv$iv3 = 0;
                                    DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node2;
                                    Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                    while (node$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv = node$iv$iv$iv;
                                        if (!((next$iv$iv.getKindSet$ui_release() & type$iv3) != 0)) {
                                            includeSelf$iv4 = includeSelf$iv5;
                                            i4 = i5;
                                        } else {
                                            count$iv$iv3++;
                                            if (count$iv$iv3 == 1) {
                                                node2 = next$iv$iv;
                                                includeSelf$iv4 = includeSelf$iv5;
                                                i4 = i5;
                                            } else {
                                                if (mutableVector2 != null) {
                                                    count$iv$iv = count$iv$iv3;
                                                    includeSelf$iv4 = includeSelf$iv5;
                                                    i4 = i5;
                                                    mutableVector = mutableVector2;
                                                } else {
                                                    count$iv$iv = count$iv$iv3;
                                                    includeSelf$iv4 = includeSelf$iv5;
                                                    i4 = i5;
                                                    mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                }
                                                mutableVector2 = mutableVector;
                                                Modifier.Node theNode$iv$iv = node2;
                                                if (theNode$iv$iv != null) {
                                                    if (mutableVector2 != null) {
                                                        mutableVector2.add(theNode$iv$iv);
                                                    }
                                                    node2 = null;
                                                }
                                                if (mutableVector2 != null) {
                                                    mutableVector2.add(next$iv$iv);
                                                }
                                                count$iv$iv3 = count$iv$iv;
                                            }
                                        }
                                        node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                        includeSelf$iv5 = includeSelf$iv4;
                                        i5 = i4;
                                    }
                                    includeSelf$iv3 = includeSelf$iv5;
                                    i3 = i5;
                                    if (count$iv$iv3 == 1) {
                                        count$iv$iv2 = type$iv3;
                                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                                        includeSelf$iv5 = includeSelf$iv3;
                                        i5 = i3;
                                    }
                                }
                            }
                            node2 = DelegatableNodeKt.pop(mutableVector2);
                            count$iv$iv2 = type$iv3;
                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                            includeSelf$iv5 = includeSelf$iv3;
                            i5 = i3;
                        }
                        type$iv2 = count$iv$iv2;
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                        includeSelf$iv2 = includeSelf$iv5;
                        i2 = i5;
                    }
                    node$iv$iv = node$iv$iv.getParent$ui_release();
                    count$iv$iv2 = type$iv2;
                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                    includeSelf$iv5 = includeSelf$iv2;
                    i5 = i2;
                }
                type$iv = count$iv$iv2;
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                includeSelf$iv = includeSelf$iv5;
                i = i5;
                node = null;
            }
            layout$iv$iv = layout$iv$iv.getParent$ui_release();
            node$iv$iv = (layout$iv$iv == null || (nodes$ui_release = layout$iv$iv.getNodes$ui_release()) == null) ? node : nodes$ui_release.getTail$ui_release();
            count$iv$iv2 = type$iv;
            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
            includeSelf$iv5 = includeSelf$iv;
            i5 = i;
        }
        return null;
    }

    public static final <T extends TraversableNode> T findNearestAncestor(T t) {
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
        int type$iv;
        boolean includeSelf$iv;
        Modifier.Node node;
        NodeChain nodes$ui_release;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
        int type$iv2;
        boolean includeSelf$iv2;
        int type$iv3;
        boolean includeSelf$iv3;
        DelegatingNode this_$iv$iv$iv;
        int count$iv$iv;
        MutableVector mutableVector;
        DelegatableNode delegatableNode = t;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = delegatableNode;
        int type$iv4 = NodeKind.m5898constructorimpl(262144);
        boolean includeSelf$iv4 = false;
        boolean value$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3.getNode().getParent$ui_release();
        LayoutNode layout$iv$iv = DelegatableNodeKt.requireLayoutNode($this$visitAncestors_u2dY_u2dYKmho_u24default$iv3);
        while (layout$iv$iv != null) {
            Modifier.Node head$iv$iv = layout$iv$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv$iv.getAggregateChildKindSet$ui_release() & type$iv4) == 0) {
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                type$iv = type$iv4;
                includeSelf$iv = includeSelf$iv4;
                node = null;
            } else {
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & type$iv4) == 0) {
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                        type$iv2 = type$iv4;
                        includeSelf$iv2 = includeSelf$iv4;
                    } else {
                        Modifier.Node it$iv = node$iv$iv;
                        MutableVector mutableVector2 = null;
                        Modifier.Node node2 = it$iv;
                        while (node2 != null) {
                            DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                            if (node2 instanceof TraversableNode) {
                                T t2 = (T) node2;
                                type$iv3 = type$iv4;
                                includeSelf$iv3 = includeSelf$iv4;
                                if (Intrinsics.areEqual(delegatableNode.getTraverseKey(), t2.getTraverseKey()) && Actual_jvmKt.areObjectsOfSameType(delegatableNode, t2)) {
                                    return t2;
                                }
                            } else {
                                type$iv3 = type$iv4;
                                includeSelf$iv3 = includeSelf$iv4;
                                Modifier.Node this_$iv$iv$iv2 = node2;
                                int i = 1;
                                Modifier.Node this_$iv$iv$iv3 = (this_$iv$iv$iv2.getKindSet$ui_release() & type$iv3) != 0 ? 1 : null;
                                if (this_$iv$iv$iv3 != null && (node2 instanceof DelegatingNode)) {
                                    int count$iv$iv2 = 0;
                                    DelegatingNode this_$iv$iv$iv4 = (DelegatingNode) node2;
                                    Modifier.Node node$iv$iv$iv = this_$iv$iv$iv4.getDelegate$ui_release();
                                    while (node$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv = node$iv$iv$iv;
                                        if (((next$iv$iv.getKindSet$ui_release() & type$iv3) != 0 ? i : 0) == 0) {
                                            this_$iv$iv$iv = this_$iv$iv$iv4;
                                        } else {
                                            count$iv$iv2++;
                                            if (count$iv$iv2 == i) {
                                                node2 = next$iv$iv;
                                                this_$iv$iv$iv = this_$iv$iv$iv4;
                                            } else {
                                                if (mutableVector2 != null) {
                                                    count$iv$iv = count$iv$iv2;
                                                    this_$iv$iv$iv = this_$iv$iv$iv4;
                                                    mutableVector = mutableVector2;
                                                } else {
                                                    count$iv$iv = count$iv$iv2;
                                                    this_$iv$iv$iv = this_$iv$iv$iv4;
                                                    mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                }
                                                Modifier.Node theNode$iv$iv = node2;
                                                if (theNode$iv$iv != null) {
                                                    if (mutableVector != null) {
                                                        mutableVector.add(theNode$iv$iv);
                                                    }
                                                    node2 = null;
                                                }
                                                if (mutableVector != null) {
                                                    mutableVector.add(next$iv$iv);
                                                }
                                                mutableVector2 = mutableVector;
                                                count$iv$iv2 = count$iv$iv;
                                            }
                                        }
                                        node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                        this_$iv$iv$iv4 = this_$iv$iv$iv;
                                        i = 1;
                                    }
                                    if (count$iv$iv2 == 1) {
                                        delegatableNode = t;
                                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                                        type$iv4 = type$iv3;
                                        includeSelf$iv4 = includeSelf$iv3;
                                    }
                                }
                            }
                            node2 = DelegatableNodeKt.pop(mutableVector2);
                            delegatableNode = t;
                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                            type$iv4 = type$iv3;
                            includeSelf$iv4 = includeSelf$iv3;
                        }
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                        type$iv2 = type$iv4;
                        includeSelf$iv2 = includeSelf$iv4;
                    }
                    node$iv$iv = node$iv$iv.getParent$ui_release();
                    delegatableNode = t;
                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                    type$iv4 = type$iv2;
                    includeSelf$iv4 = includeSelf$iv2;
                }
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                type$iv = type$iv4;
                includeSelf$iv = includeSelf$iv4;
                node = null;
            }
            layout$iv$iv = layout$iv$iv.getParent$ui_release();
            node$iv$iv = (layout$iv$iv == null || (nodes$ui_release = layout$iv$iv.getNodes$ui_release()) == null) ? node : nodes$ui_release.getTail$ui_release();
            delegatableNode = t;
            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
            type$iv4 = type$iv;
            includeSelf$iv4 = includeSelf$iv;
        }
        return null;
    }

    public static final void traverseAncestors(DelegatableNode $this$traverseAncestors, Object key, Function1<? super TraversableNode, Boolean> function1) {
        int type$iv;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
        boolean includeSelf$iv;
        int i;
        NodeChain nodes$ui_release;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
        boolean includeSelf$iv2;
        int i2;
        int i3;
        int count$iv$iv;
        MutableVector mutableVector;
        int count$iv$iv2 = NodeKind.m5898constructorimpl(262144);
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$traverseAncestors;
        boolean includeSelf$iv3 = false;
        int i4 = 0;
        boolean value$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3.getNode().getParent$ui_release();
        LayoutNode layout$iv$iv = DelegatableNodeKt.requireLayoutNode($this$visitAncestors_u2dY_u2dYKmho_u24default$iv3);
        while (layout$iv$iv != null) {
            Modifier.Node head$iv$iv = layout$iv$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv$iv.getAggregateChildKindSet$ui_release() & count$iv$iv2) == 0) {
                type$iv = count$iv$iv2;
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                includeSelf$iv = includeSelf$iv3;
                i = i4;
            } else {
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & count$iv$iv2) != 0) {
                        Modifier.Node it$iv = node$iv$iv;
                        MutableVector mutableVector2 = null;
                        Modifier.Node node = it$iv;
                        while (node != null) {
                            int type$iv2 = count$iv$iv2;
                            if (node instanceof TraversableNode) {
                                TraversableNode it = (TraversableNode) node;
                                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                                includeSelf$iv2 = includeSelf$iv3;
                                boolean continueTraversal = Intrinsics.areEqual(key, it.getTraverseKey()) ? function1.invoke(it).booleanValue() : true;
                                if (!continueTraversal) {
                                    return;
                                }
                                i2 = i4;
                            } else {
                                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                                includeSelf$iv2 = includeSelf$iv3;
                                Modifier.Node this_$iv$iv$iv = node;
                                if (((this_$iv$iv$iv.getKindSet$ui_release() & type$iv2) != 0 ? 1 : 0) == 0 || !(node instanceof DelegatingNode)) {
                                    i2 = i4;
                                } else {
                                    int count$iv$iv3 = 0;
                                    DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node;
                                    Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                    while (node$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv = node$iv$iv$iv;
                                        if (!((next$iv$iv.getKindSet$ui_release() & type$iv2) != 0)) {
                                            i3 = i4;
                                        } else {
                                            count$iv$iv3++;
                                            if (count$iv$iv3 == 1) {
                                                node = next$iv$iv;
                                                i3 = i4;
                                            } else {
                                                if (mutableVector2 != null) {
                                                    count$iv$iv = count$iv$iv3;
                                                    i3 = i4;
                                                    mutableVector = mutableVector2;
                                                } else {
                                                    count$iv$iv = count$iv$iv3;
                                                    i3 = i4;
                                                    mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                }
                                                mutableVector2 = mutableVector;
                                                Modifier.Node theNode$iv$iv = node;
                                                if (theNode$iv$iv != null) {
                                                    if (mutableVector2 != null) {
                                                        mutableVector2.add(theNode$iv$iv);
                                                    }
                                                    node = null;
                                                }
                                                if (mutableVector2 != null) {
                                                    mutableVector2.add(next$iv$iv);
                                                }
                                                count$iv$iv3 = count$iv$iv;
                                            }
                                        }
                                        node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                        i4 = i3;
                                    }
                                    i2 = i4;
                                    if (count$iv$iv3 == 1) {
                                        count$iv$iv2 = type$iv2;
                                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                                        includeSelf$iv3 = includeSelf$iv2;
                                        i4 = i2;
                                    }
                                }
                            }
                            node = DelegatableNodeKt.pop(mutableVector2);
                            count$iv$iv2 = type$iv2;
                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                            includeSelf$iv3 = includeSelf$iv2;
                            i4 = i2;
                        }
                        continue;
                    }
                    int type$iv3 = count$iv$iv2;
                    node$iv$iv = node$iv$iv.getParent$ui_release();
                    count$iv$iv2 = type$iv3;
                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                    includeSelf$iv3 = includeSelf$iv3;
                    i4 = i4;
                }
                type$iv = count$iv$iv2;
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                includeSelf$iv = includeSelf$iv3;
                i = i4;
            }
            layout$iv$iv = layout$iv$iv.getParent$ui_release();
            node$iv$iv = (layout$iv$iv == null || (nodes$ui_release = layout$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
            count$iv$iv2 = type$iv;
            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
            includeSelf$iv3 = includeSelf$iv;
            i4 = i;
        }
    }

    public static final <T extends TraversableNode> void traverseAncestors(T t, Function1<? super T, Boolean> function1) {
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
        int type$iv;
        boolean includeSelf$iv;
        int i;
        NodeChain nodes$ui_release;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
        boolean includeSelf$iv2;
        int i2;
        boolean continueTraversal;
        Modifier.Node node;
        int count$iv$iv;
        MutableVector mutableVector;
        Modifier.Node node2;
        DelegatableNode delegatableNode = t;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = delegatableNode;
        int count$iv$iv2 = NodeKind.m5898constructorimpl(262144);
        boolean includeSelf$iv3 = false;
        int i3 = 0;
        boolean value$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3.getNode().getParent$ui_release();
        LayoutNode layout$iv$iv = DelegatableNodeKt.requireLayoutNode($this$visitAncestors_u2dY_u2dYKmho_u24default$iv3);
        while (layout$iv$iv != null) {
            Modifier.Node head$iv$iv = layout$iv$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv$iv.getAggregateChildKindSet$ui_release() & count$iv$iv2) == 0) {
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                type$iv = count$iv$iv2;
                includeSelf$iv = includeSelf$iv3;
                i = i3;
            } else {
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & count$iv$iv2) == 0) {
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                    } else {
                        Modifier.Node it$iv = node$iv$iv;
                        MutableVector mutableVector2 = null;
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                        Modifier.Node theNode$iv$iv = it$iv;
                        while (theNode$iv$iv != null) {
                            int type$iv2 = count$iv$iv2;
                            if (theNode$iv$iv instanceof TraversableNode) {
                                TraversableNode it = (TraversableNode) theNode$iv$iv;
                                includeSelf$iv2 = includeSelf$iv3;
                                i2 = i3;
                                if (Intrinsics.areEqual(delegatableNode.getTraverseKey(), it.getTraverseKey()) && Actual_jvmKt.areObjectsOfSameType(delegatableNode, it)) {
                                    continueTraversal = function1.invoke(it).booleanValue();
                                } else {
                                    continueTraversal = true;
                                }
                                if (!continueTraversal) {
                                    return;
                                }
                            } else {
                                includeSelf$iv2 = includeSelf$iv3;
                                i2 = i3;
                                Modifier.Node this_$iv$iv$iv = theNode$iv$iv;
                                if (((this_$iv$iv$iv.getKindSet$ui_release() & type$iv2) != 0) && (theNode$iv$iv instanceof DelegatingNode)) {
                                    int count$iv$iv3 = 0;
                                    DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) theNode$iv$iv;
                                    for (Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release(); node$iv$iv$iv != null; node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release()) {
                                        Modifier.Node next$iv$iv = node$iv$iv$iv;
                                        if ((next$iv$iv.getKindSet$ui_release() & type$iv2) != 0) {
                                            count$iv$iv3++;
                                            if (count$iv$iv3 == 1) {
                                                theNode$iv$iv = next$iv$iv;
                                            } else {
                                                if (mutableVector2 != null) {
                                                    node = theNode$iv$iv;
                                                    count$iv$iv = count$iv$iv3;
                                                    mutableVector = mutableVector2;
                                                } else {
                                                    node = theNode$iv$iv;
                                                    count$iv$iv = count$iv$iv3;
                                                    mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                }
                                                mutableVector2 = mutableVector;
                                                Modifier.Node theNode$iv$iv2 = node;
                                                if (theNode$iv$iv2 == null) {
                                                    node2 = node;
                                                } else {
                                                    if (mutableVector2 != null) {
                                                        mutableVector2.add(theNode$iv$iv2);
                                                    }
                                                    node2 = null;
                                                }
                                                if (mutableVector2 != null) {
                                                    mutableVector2.add(next$iv$iv);
                                                }
                                                theNode$iv$iv = node2;
                                                count$iv$iv3 = count$iv$iv;
                                            }
                                        }
                                    }
                                    Modifier.Node node3 = theNode$iv$iv;
                                    if (count$iv$iv3 == 1) {
                                        delegatableNode = t;
                                        count$iv$iv2 = type$iv2;
                                        includeSelf$iv3 = includeSelf$iv2;
                                        i3 = i2;
                                        theNode$iv$iv = node3;
                                    }
                                }
                            }
                            theNode$iv$iv = DelegatableNodeKt.pop(mutableVector2);
                            delegatableNode = t;
                            count$iv$iv2 = type$iv2;
                            includeSelf$iv3 = includeSelf$iv2;
                            i3 = i2;
                        }
                        continue;
                    }
                    int type$iv3 = count$iv$iv2;
                    node$iv$iv = node$iv$iv.getParent$ui_release();
                    delegatableNode = t;
                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                    count$iv$iv2 = type$iv3;
                    includeSelf$iv3 = includeSelf$iv3;
                    i3 = i3;
                }
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                type$iv = count$iv$iv2;
                includeSelf$iv = includeSelf$iv3;
                i = i3;
            }
            layout$iv$iv = layout$iv$iv.getParent$ui_release();
            node$iv$iv = (layout$iv$iv == null || (nodes$ui_release = layout$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
            delegatableNode = t;
            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
            count$iv$iv2 = type$iv;
            includeSelf$iv3 = includeSelf$iv;
            i3 = i;
        }
    }

    public static final void traverseChildren(DelegatableNode $this$traverseChildren, Object key, Function1<? super TraversableNode, Boolean> function1) {
        int type$iv;
        DelegatableNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
        boolean zOrder$iv;
        boolean z;
        boolean zOrder$iv2;
        MutableVector mutableVector;
        int type$iv2 = NodeKind.m5898constructorimpl(262144);
        DelegatableNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$traverseChildren;
        boolean zOrder$iv3 = false;
        boolean value$iv$iv$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitChildren called on an unattached node");
        }
        MutableVector mutableVector2 = null;
        MutableVector branches$iv$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2.getNode().getChild$ui_release();
        if (child$iv$iv == null) {
            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, $this$visitChildren_u2dY_u2dYKmho_u24default$iv2.getNode(), false);
        } else {
            branches$iv$iv.add(child$iv$iv);
        }
        while (true) {
            MutableVector this_$iv$iv$iv = branches$iv$iv.getSize() != 0 ? 1 : mutableVector2;
            if (this_$iv$iv$iv == null) {
                return;
            }
            Modifier.Node branch$iv$iv = (Modifier.Node) branches$iv$iv.removeAt(branches$iv$iv.getSize() - 1);
            if ((branch$iv$iv.getAggregateChildKindSet$ui_release() & type$iv2) == 0) {
                DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, branch$iv$iv, zOrder$iv3);
            } else {
                Modifier.Node node$iv$iv = branch$iv$iv;
                while (true) {
                    if (node$iv$iv == null) {
                        mutableVector2 = null;
                        break;
                    } else if ((node$iv$iv.getKindSet$ui_release() & type$iv2) != 0) {
                        Modifier.Node it$iv = node$iv$iv;
                        MutableVector mutableVector3 = null;
                        Modifier.Node node = it$iv;
                        while (node != null) {
                            if (node instanceof TraversableNode) {
                                TraversableNode it = (TraversableNode) node;
                                type$iv = type$iv2;
                                $this$visitChildren_u2dY_u2dYKmho_u24default$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2;
                                boolean continueTraversal = Intrinsics.areEqual(key, it.getTraverseKey()) ? function1.invoke(it).booleanValue() : true;
                                if (!continueTraversal) {
                                    return;
                                }
                                zOrder$iv = zOrder$iv3;
                                z = true;
                            } else {
                                type$iv = type$iv2;
                                $this$visitChildren_u2dY_u2dYKmho_u24default$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2;
                                Modifier.Node this_$iv$iv$iv2 = node;
                                if (!((this_$iv$iv$iv2.getKindSet$ui_release() & type$iv) != 0) || !(node instanceof DelegatingNode)) {
                                    zOrder$iv = zOrder$iv3;
                                    z = true;
                                } else {
                                    int count$iv$iv = 0;
                                    DelegatingNode this_$iv$iv$iv3 = (DelegatingNode) node;
                                    Modifier.Node node$iv$iv$iv = this_$iv$iv$iv3.getDelegate$ui_release();
                                    while (node$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv = node$iv$iv$iv;
                                        if (!((next$iv$iv.getKindSet$ui_release() & type$iv) != 0)) {
                                            zOrder$iv2 = zOrder$iv3;
                                        } else {
                                            count$iv$iv++;
                                            if (count$iv$iv == 1) {
                                                node = next$iv$iv;
                                                zOrder$iv2 = zOrder$iv3;
                                            } else {
                                                if (mutableVector3 == null) {
                                                    zOrder$iv2 = zOrder$iv3;
                                                    mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                } else {
                                                    zOrder$iv2 = zOrder$iv3;
                                                    mutableVector = mutableVector3;
                                                }
                                                Modifier.Node theNode$iv$iv = node;
                                                if (theNode$iv$iv != null) {
                                                    if (mutableVector != null) {
                                                        mutableVector.add(theNode$iv$iv);
                                                    }
                                                    node = null;
                                                }
                                                if (mutableVector != null) {
                                                    mutableVector.add(next$iv$iv);
                                                }
                                                mutableVector3 = mutableVector;
                                            }
                                        }
                                        node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                        zOrder$iv3 = zOrder$iv2;
                                    }
                                    zOrder$iv = zOrder$iv3;
                                    z = true;
                                    if (count$iv$iv == 1) {
                                        type$iv2 = type$iv;
                                        $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
                                        zOrder$iv3 = zOrder$iv;
                                    }
                                }
                            }
                            node = DelegatableNodeKt.pop(mutableVector3);
                            type$iv2 = type$iv;
                            $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
                            zOrder$iv3 = zOrder$iv;
                        }
                        mutableVector2 = null;
                    } else {
                        node$iv$iv = node$iv$iv.getChild$ui_release();
                        type$iv2 = type$iv2;
                    }
                }
            }
        }
    }

    public static final <T extends TraversableNode> void traverseChildren(T t, Function1<? super T, Boolean> function1) {
        DelegatableNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
        int type$iv;
        boolean continueTraversal;
        boolean z;
        int count$iv$iv;
        MutableVector mutableVector;
        DelegatableNode delegatableNode = t;
        DelegatableNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = delegatableNode;
        int count$iv$iv2 = NodeKind.m5898constructorimpl(262144);
        boolean value$iv$iv$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitChildren called on an unattached node");
        }
        MutableVector mutableVector2 = null;
        MutableVector branches$iv$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2.getNode().getChild$ui_release();
        if (child$iv$iv == null) {
            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, $this$visitChildren_u2dY_u2dYKmho_u24default$iv2.getNode(), false);
        } else {
            branches$iv$iv.add(child$iv$iv);
        }
        while (true) {
            MutableVector this_$iv$iv$iv = branches$iv$iv.getSize() != 0 ? 1 : mutableVector2;
            if (this_$iv$iv$iv == null) {
                return;
            }
            Modifier.Node branch$iv$iv = (Modifier.Node) branches$iv$iv.removeAt(branches$iv$iv.getSize() - 1);
            if ((branch$iv$iv.getAggregateChildKindSet$ui_release() & count$iv$iv2) == 0) {
                DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, branch$iv$iv, false);
            } else {
                Modifier.Node node$iv$iv = branch$iv$iv;
                while (true) {
                    if (node$iv$iv == null) {
                        delegatableNode = t;
                        mutableVector2 = null;
                        break;
                    } else if ((node$iv$iv.getKindSet$ui_release() & count$iv$iv2) != 0) {
                        Modifier.Node it$iv = node$iv$iv;
                        MutableVector mutableVector3 = null;
                        Modifier.Node node = it$iv;
                        while (node != null) {
                            if (node instanceof TraversableNode) {
                                TraversableNode it = (TraversableNode) node;
                                $this$visitChildren_u2dY_u2dYKmho_u24default$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2;
                                type$iv = count$iv$iv2;
                                if (Intrinsics.areEqual(delegatableNode.getTraverseKey(), it.getTraverseKey()) && Actual_jvmKt.areObjectsOfSameType(delegatableNode, it)) {
                                    continueTraversal = function1.invoke(it).booleanValue();
                                } else {
                                    continueTraversal = true;
                                }
                                if (!continueTraversal) {
                                    return;
                                }
                                z = true;
                            } else {
                                $this$visitChildren_u2dY_u2dYKmho_u24default$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2;
                                type$iv = count$iv$iv2;
                                Modifier.Node this_$iv$iv$iv2 = node;
                                if (!((this_$iv$iv$iv2.getKindSet$ui_release() & type$iv) != 0) || !(node instanceof DelegatingNode)) {
                                    z = true;
                                } else {
                                    int count$iv$iv3 = 0;
                                    DelegatingNode this_$iv$iv$iv3 = (DelegatingNode) node;
                                    for (Modifier.Node node$iv$iv$iv = this_$iv$iv$iv3.getDelegate$ui_release(); node$iv$iv$iv != null; node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release()) {
                                        Modifier.Node next$iv$iv = node$iv$iv$iv;
                                        if ((next$iv$iv.getKindSet$ui_release() & type$iv) != 0) {
                                            count$iv$iv3++;
                                            if (count$iv$iv3 == 1) {
                                                node = next$iv$iv;
                                            } else {
                                                if (mutableVector3 == null) {
                                                    count$iv$iv = count$iv$iv3;
                                                    mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                } else {
                                                    count$iv$iv = count$iv$iv3;
                                                    mutableVector = mutableVector3;
                                                }
                                                Modifier.Node theNode$iv$iv = node;
                                                if (theNode$iv$iv != null) {
                                                    if (mutableVector != null) {
                                                        mutableVector.add(theNode$iv$iv);
                                                    }
                                                    node = null;
                                                }
                                                if (mutableVector != null) {
                                                    mutableVector.add(next$iv$iv);
                                                }
                                                mutableVector3 = mutableVector;
                                                count$iv$iv3 = count$iv$iv;
                                            }
                                        }
                                    }
                                    z = true;
                                    if (count$iv$iv3 == 1) {
                                        $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
                                        count$iv$iv2 = type$iv;
                                        delegatableNode = t;
                                    }
                                }
                            }
                            node = DelegatableNodeKt.pop(mutableVector3);
                            $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
                            count$iv$iv2 = type$iv;
                            delegatableNode = t;
                        }
                        delegatableNode = t;
                        mutableVector2 = null;
                    } else {
                        node$iv$iv = node$iv$iv.getChild$ui_release();
                        delegatableNode = t;
                    }
                }
            }
        }
    }

    public static final void traverseDescendants(DelegatableNode $this$traverseDescendants, Object key, Function1<? super TraversableNode, ? extends TraversableNode.Companion.TraverseDescendantsAction> function1) {
        int type$iv;
        DelegatableNode $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
        int i;
        int mask$iv$iv;
        MutableVector mask$iv$iv2;
        boolean z;
        boolean diveDeeper$iv$iv;
        int mask$iv$iv3;
        boolean z2;
        DelegatingNode this_$iv$iv$iv;
        int mask$iv$iv4;
        int count$iv$iv;
        MutableVector mutableVector;
        int count$iv$iv2 = NodeKind.m5898constructorimpl(262144);
        DelegatableNode $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$traverseDescendants;
        int i2 = 0;
        int mask$iv$iv5 = count$iv$iv2;
        boolean value$iv$iv$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitSubtreeIf called on an unattached node");
        }
        MutableVector mutableVector2 = null;
        MutableVector branches$iv$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2.getNode().getChild$ui_release();
        if (child$iv$iv == null) {
            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2.getNode(), false);
        } else {
            branches$iv$iv.add(child$iv$iv);
        }
        while (true) {
            boolean z3 = true;
            MutableVector this_$iv$iv$iv2 = branches$iv$iv.getSize() != 0 ? 1 : mutableVector2;
            if (this_$iv$iv$iv2 == null) {
                return;
            }
            Modifier.Node branch$iv$iv = (Modifier.Node) branches$iv$iv.removeAt(branches$iv$iv.getSize() - 1);
            if ((branch$iv$iv.getAggregateChildKindSet$ui_release() & mask$iv$iv5) != 0) {
                Modifier.Node node$iv$iv = branch$iv$iv;
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & mask$iv$iv5) == 0) {
                        type$iv = count$iv$iv2;
                        $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
                        i = i2;
                        mask$iv$iv = mask$iv$iv5;
                        mask$iv$iv2 = mutableVector2;
                        z = z3;
                    } else {
                        Object node$iv = node$iv$iv;
                        MutableVector mutableVector3 = null;
                        Object obj = node$iv;
                        while (true) {
                            if (obj != null) {
                                if (obj instanceof TraversableNode) {
                                    Object it$iv = obj;
                                    type$iv = count$iv$iv2;
                                    TraversableNode it = (TraversableNode) it$iv;
                                    $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
                                    i = i2;
                                    TraversableNode.Companion.TraverseDescendantsAction action = Intrinsics.areEqual(key, it.getTraverseKey()) ? function1.invoke(it) : TraversableNode.Companion.TraverseDescendantsAction.ContinueTraversal;
                                    if (action == TraversableNode.Companion.TraverseDescendantsAction.CancelTraversal) {
                                        return;
                                    }
                                    if (!(action != TraversableNode.Companion.TraverseDescendantsAction.SkipSubtreeAndContinueTraversal)) {
                                        mask$iv$iv = mask$iv$iv5;
                                        z = true;
                                        mask$iv$iv2 = null;
                                        diveDeeper$iv$iv = false;
                                        break;
                                    }
                                    mask$iv$iv3 = mask$iv$iv5;
                                    z2 = true;
                                } else {
                                    type$iv = count$iv$iv2;
                                    $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
                                    i = i2;
                                    Modifier.Node this_$iv$iv$iv3 = obj;
                                    if (!((this_$iv$iv$iv3.getKindSet$ui_release() & type$iv) != 0) || !(obj instanceof DelegatingNode)) {
                                        mask$iv$iv3 = mask$iv$iv5;
                                        z2 = true;
                                    } else {
                                        int count$iv$iv3 = 0;
                                        DelegatingNode this_$iv$iv$iv4 = (DelegatingNode) obj;
                                        Modifier.Node node$iv$iv$iv = this_$iv$iv$iv4.getDelegate$ui_release();
                                        while (node$iv$iv$iv != null) {
                                            Modifier.Node next$iv$iv = node$iv$iv$iv;
                                            if (!((next$iv$iv.getKindSet$ui_release() & type$iv) != 0)) {
                                                this_$iv$iv$iv = this_$iv$iv$iv4;
                                                mask$iv$iv4 = mask$iv$iv5;
                                            } else {
                                                count$iv$iv3++;
                                                this_$iv$iv$iv = this_$iv$iv$iv4;
                                                if (count$iv$iv3 == 1) {
                                                    obj = next$iv$iv;
                                                    mask$iv$iv4 = mask$iv$iv5;
                                                } else {
                                                    if (mutableVector3 == null) {
                                                        count$iv$iv = count$iv$iv3;
                                                        mask$iv$iv4 = mask$iv$iv5;
                                                        mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                    } else {
                                                        count$iv$iv = count$iv$iv3;
                                                        mask$iv$iv4 = mask$iv$iv5;
                                                        mutableVector = mutableVector3;
                                                    }
                                                    Modifier.Node theNode$iv$iv = obj;
                                                    if (theNode$iv$iv != null) {
                                                        if (mutableVector != null) {
                                                            mutableVector.add(theNode$iv$iv);
                                                        }
                                                        obj = null;
                                                    }
                                                    if (mutableVector != null) {
                                                        mutableVector.add(next$iv$iv);
                                                    }
                                                    mutableVector3 = mutableVector;
                                                    count$iv$iv3 = count$iv$iv;
                                                }
                                            }
                                            node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                            this_$iv$iv$iv4 = this_$iv$iv$iv;
                                            mask$iv$iv5 = mask$iv$iv4;
                                        }
                                        mask$iv$iv3 = mask$iv$iv5;
                                        z2 = true;
                                        if (count$iv$iv3 == 1) {
                                            z3 = true;
                                            count$iv$iv2 = type$iv;
                                            $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
                                            i2 = i;
                                            mask$iv$iv5 = mask$iv$iv3;
                                        }
                                    }
                                }
                                obj = DelegatableNodeKt.pop(mutableVector3);
                                z3 = z2;
                                count$iv$iv2 = type$iv;
                                $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
                                i2 = i;
                                mask$iv$iv5 = mask$iv$iv3;
                            } else {
                                type$iv = count$iv$iv2;
                                $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
                                i = i2;
                                mask$iv$iv = mask$iv$iv5;
                                z = z3;
                                mask$iv$iv2 = null;
                                diveDeeper$iv$iv = z;
                                break;
                            }
                        }
                        if (!diveDeeper$iv$iv) {
                            mutableVector2 = mask$iv$iv2;
                            count$iv$iv2 = type$iv;
                            $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
                            i2 = i;
                            mask$iv$iv5 = mask$iv$iv;
                            break;
                        }
                    }
                    node$iv$iv = node$iv$iv.getChild$ui_release();
                    z3 = z;
                    mutableVector2 = mask$iv$iv2;
                    count$iv$iv2 = type$iv;
                    $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
                    i2 = i;
                    mask$iv$iv5 = mask$iv$iv;
                }
            }
            int type$iv2 = count$iv$iv2;
            int mask$iv$iv6 = mask$iv$iv5;
            MutableVector mask$iv$iv7 = mutableVector2;
            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, branch$iv$iv, false);
            mutableVector2 = mask$iv$iv7;
            count$iv$iv2 = type$iv2;
            $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
            i2 = i2;
            mask$iv$iv5 = mask$iv$iv6;
        }
    }

    public static final <T extends TraversableNode> void traverseDescendants(T t, Function1<? super T, ? extends TraversableNode.Companion.TraverseDescendantsAction> function1) {
        DelegatableNode $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
        int type$iv;
        int i;
        MutableVector mutableVector;
        boolean z;
        boolean diveDeeper$iv$iv;
        TraversableNode.Companion.TraverseDescendantsAction action;
        boolean z2;
        DelegatingNode this_$iv$iv$iv;
        boolean z3;
        int count$iv$iv;
        MutableVector mutableVector2;
        DelegatableNode delegatableNode = t;
        DelegatableNode $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = delegatableNode;
        int type$iv2 = NodeKind.m5898constructorimpl(262144);
        int i2 = 0;
        boolean value$iv$iv$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitSubtreeIf called on an unattached node");
        }
        MutableVector mutableVector3 = null;
        MutableVector branches$iv$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2.getNode().getChild$ui_release();
        if (child$iv$iv == null) {
            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2.getNode(), false);
        } else {
            branches$iv$iv.add(child$iv$iv);
        }
        while (true) {
            boolean z4 = true;
            MutableVector this_$iv$iv$iv2 = branches$iv$iv.getSize() != 0 ? 1 : mutableVector3;
            if (this_$iv$iv$iv2 == null) {
                return;
            }
            Modifier.Node branch$iv$iv = (Modifier.Node) branches$iv$iv.removeAt(branches$iv$iv.getSize() - 1);
            if ((branch$iv$iv.getAggregateChildKindSet$ui_release() & type$iv2) != 0) {
                Modifier.Node node$iv$iv = branch$iv$iv;
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & type$iv2) == 0) {
                        $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
                        type$iv = type$iv2;
                        i = i2;
                        mutableVector = mutableVector3;
                        z = z4;
                    } else {
                        Object node$iv = node$iv$iv;
                        MutableVector mutableVector4 = null;
                        Object obj = node$iv;
                        while (true) {
                            if (obj != null) {
                                if (obj instanceof TraversableNode) {
                                    Object it$iv = obj;
                                    $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
                                    TraversableNode it = (TraversableNode) it$iv;
                                    type$iv = type$iv2;
                                    i = i2;
                                    if (Intrinsics.areEqual(delegatableNode.getTraverseKey(), it.getTraverseKey()) && Actual_jvmKt.areObjectsOfSameType(delegatableNode, it)) {
                                        action = function1.invoke(it);
                                    } else {
                                        action = TraversableNode.Companion.TraverseDescendantsAction.ContinueTraversal;
                                    }
                                    if (action == TraversableNode.Companion.TraverseDescendantsAction.CancelTraversal) {
                                        return;
                                    }
                                    if (!(action != TraversableNode.Companion.TraverseDescendantsAction.SkipSubtreeAndContinueTraversal)) {
                                        z = true;
                                        mutableVector = null;
                                        diveDeeper$iv$iv = false;
                                        break;
                                    }
                                    z2 = true;
                                } else {
                                    $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
                                    type$iv = type$iv2;
                                    i = i2;
                                    Modifier.Node this_$iv$iv$iv3 = obj;
                                    if (!((this_$iv$iv$iv3.getKindSet$ui_release() & type$iv) != 0) || !(obj instanceof DelegatingNode)) {
                                        z2 = true;
                                    } else {
                                        int count$iv$iv2 = 0;
                                        DelegatingNode this_$iv$iv$iv4 = (DelegatingNode) obj;
                                        boolean z5 = false;
                                        Modifier.Node node$iv$iv$iv = this_$iv$iv$iv4.getDelegate$ui_release();
                                        while (node$iv$iv$iv != null) {
                                            Modifier.Node next$iv$iv = node$iv$iv$iv;
                                            if (!((next$iv$iv.getKindSet$ui_release() & type$iv) != 0)) {
                                                this_$iv$iv$iv = this_$iv$iv$iv4;
                                                z3 = z5;
                                            } else {
                                                count$iv$iv2++;
                                                this_$iv$iv$iv = this_$iv$iv$iv4;
                                                if (count$iv$iv2 == 1) {
                                                    obj = next$iv$iv;
                                                    z3 = z5;
                                                } else {
                                                    if (mutableVector4 == null) {
                                                        count$iv$iv = count$iv$iv2;
                                                        z3 = z5;
                                                        mutableVector2 = new MutableVector(new Modifier.Node[16], 0);
                                                    } else {
                                                        count$iv$iv = count$iv$iv2;
                                                        z3 = z5;
                                                        mutableVector2 = mutableVector4;
                                                    }
                                                    Modifier.Node theNode$iv$iv = obj;
                                                    if (theNode$iv$iv != null) {
                                                        if (mutableVector2 != null) {
                                                            mutableVector2.add(theNode$iv$iv);
                                                        }
                                                        obj = null;
                                                    }
                                                    if (mutableVector2 != null) {
                                                        mutableVector2.add(next$iv$iv);
                                                    }
                                                    mutableVector4 = mutableVector2;
                                                    count$iv$iv2 = count$iv$iv;
                                                }
                                            }
                                            node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                            this_$iv$iv$iv4 = this_$iv$iv$iv;
                                            z5 = z3;
                                        }
                                        z2 = true;
                                        if (count$iv$iv2 == 1) {
                                            delegatableNode = t;
                                            z4 = true;
                                            $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
                                            type$iv2 = type$iv;
                                            i2 = i;
                                        }
                                    }
                                }
                                obj = DelegatableNodeKt.pop(mutableVector4);
                                delegatableNode = t;
                                z4 = z2;
                                $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
                                type$iv2 = type$iv;
                                i2 = i;
                            } else {
                                $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
                                type$iv = type$iv2;
                                i = i2;
                                z = z4;
                                mutableVector = null;
                                diveDeeper$iv$iv = z;
                                break;
                            }
                        }
                        if (!diveDeeper$iv$iv) {
                            delegatableNode = t;
                            mutableVector3 = mutableVector;
                            $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
                            type$iv2 = type$iv;
                            i2 = i;
                            break;
                        }
                    }
                    node$iv$iv = node$iv$iv.getChild$ui_release();
                    delegatableNode = t;
                    z4 = z;
                    mutableVector3 = mutableVector;
                    $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
                    type$iv2 = type$iv;
                    i2 = i;
                }
            }
            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, branch$iv$iv, false);
            delegatableNode = t;
            mutableVector3 = mutableVector3;
            $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
            type$iv2 = type$iv2;
            i2 = i2;
        }
    }
}
