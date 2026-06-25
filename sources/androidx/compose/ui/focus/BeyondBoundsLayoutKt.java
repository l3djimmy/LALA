package androidx.compose.ui.focus;

import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.layout.BeyondBoundsLayout;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.NodeChain;
import androidx.compose.ui.node.NodeKind;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: BeyondBoundsLayout.kt */
@Metadata(d1 = {"\u0000 \n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u001aA\u0010\u0000\u001a\u0004\u0018\u0001H\u0001\"\u0004\b\u0000\u0010\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00042\u0019\u0010\u0005\u001a\u0015\u0012\u0004\u0012\u00020\u0007\u0012\u0006\u0012\u0004\u0018\u0001H\u00010\u0006¢\u0006\u0002\b\bH\u0000ø\u0001\u0000¢\u0006\u0004\b\t\u0010\n\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u000b"}, d2 = {"searchBeyondBounds", ExifInterface.GPS_DIRECTION_TRUE, "Landroidx/compose/ui/focus/FocusTargetNode;", "direction", "Landroidx/compose/ui/focus/FocusDirection;", "block", "Lkotlin/Function1;", "Landroidx/compose/ui/layout/BeyondBoundsLayout$BeyondBoundsScope;", "Lkotlin/ExtensionFunctionType;", "searchBeyondBounds--OM-vw8", "(Landroidx/compose/ui/focus/FocusTargetNode;ILkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class BeyondBoundsLayoutKt {
    /* renamed from: searchBeyondBounds--OM-vw8  reason: not valid java name */
    public static final <T> T m3927searchBeyondBoundsOMvw8(FocusTargetNode $this$searchBeyondBounds_u2d_u2dOM_u2dvw8, int direction, Function1<? super BeyondBoundsLayout.BeyondBoundsScope, ? extends T> function1) {
        T t;
        FocusTargetNode focusTargetNode;
        int m5625getBeforehoxUOeE;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv;
        int type$iv;
        boolean z;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv;
        Modifier.Node node;
        NodeChain nodes$ui_release;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv2;
        int type$iv2;
        boolean z2;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv2;
        int type$iv3;
        boolean z3;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv3;
        int type$iv4;
        boolean z4;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4;
        int count$iv$iv$iv;
        MutableVector mutableVector;
        FocusTargetNode $this$nearestAncestor_u2d64DMado$iv3 = $this$searchBeyondBounds_u2d_u2dOM_u2dvw8;
        int type$iv5 = NodeKind.m5898constructorimpl(1024);
        boolean z5 = false;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5 = $this$nearestAncestor_u2d64DMado$iv3;
        boolean value$iv$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5.getNode().isAttached();
        if (!value$iv$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5.getNode().getParent$ui_release();
        LayoutNode layout$iv$iv$iv = DelegatableNodeKt.requireLayoutNode($this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5);
        loop0: while (true) {
            if (layout$iv$iv$iv != null) {
                Modifier.Node head$iv$iv$iv = layout$iv$iv$iv.getNodes$ui_release().getHead$ui_release();
                if ((head$iv$iv$iv.getAggregateChildKindSet$ui_release() & type$iv5) == 0) {
                    $this$nearestAncestor_u2d64DMado$iv = $this$nearestAncestor_u2d64DMado$iv3;
                    type$iv = type$iv5;
                    z = z5;
                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5;
                    node = null;
                } else {
                    while (node$iv$iv$iv != null) {
                        if ((node$iv$iv$iv.getKindSet$ui_release() & type$iv5) == 0) {
                            $this$nearestAncestor_u2d64DMado$iv2 = $this$nearestAncestor_u2d64DMado$iv3;
                            type$iv2 = type$iv5;
                            z2 = z5;
                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5;
                        } else {
                            Modifier.Node it$iv$iv = node$iv$iv$iv;
                            MutableVector mutableVector2 = null;
                            Modifier.Node node2 = it$iv$iv;
                            t = null;
                            while (node2 != null) {
                                DelegatableNode $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv3;
                                if (node2 instanceof FocusTargetNode) {
                                    focusTargetNode = node2;
                                    break loop0;
                                }
                                Modifier.Node this_$iv$iv$iv$iv = node2;
                                if (((this_$iv$iv$iv$iv.getKindSet$ui_release() & type$iv5) != 0 ? 1 : 0) == 0 || !(node2 instanceof DelegatingNode)) {
                                    type$iv3 = type$iv5;
                                    z3 = z5;
                                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5;
                                } else {
                                    int count$iv$iv$iv2 = 0;
                                    DelegatingNode this_$iv$iv$iv$iv2 = (DelegatingNode) node2;
                                    Modifier.Node node$iv$iv$iv$iv = this_$iv$iv$iv$iv2.getDelegate$ui_release();
                                    while (node$iv$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv$iv = node$iv$iv$iv$iv;
                                        if (!((next$iv$iv$iv.getKindSet$ui_release() & type$iv5) != 0)) {
                                            type$iv4 = type$iv5;
                                            z4 = z5;
                                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5;
                                        } else {
                                            count$iv$iv$iv2++;
                                            type$iv4 = type$iv5;
                                            if (count$iv$iv$iv2 == 1) {
                                                node2 = next$iv$iv$iv;
                                                z4 = z5;
                                                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5;
                                            } else {
                                                if (mutableVector2 != null) {
                                                    count$iv$iv$iv = count$iv$iv$iv2;
                                                    z4 = z5;
                                                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5;
                                                    mutableVector = mutableVector2;
                                                } else {
                                                    count$iv$iv$iv = count$iv$iv$iv2;
                                                    z4 = z5;
                                                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5;
                                                    mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                }
                                                Modifier.Node theNode$iv$iv$iv = node2;
                                                if (theNode$iv$iv$iv != null) {
                                                    if (mutableVector != null) {
                                                        mutableVector.add(theNode$iv$iv$iv);
                                                    }
                                                    node2 = null;
                                                }
                                                if (mutableVector != null) {
                                                    mutableVector.add(next$iv$iv$iv);
                                                }
                                                mutableVector2 = mutableVector;
                                                count$iv$iv$iv2 = count$iv$iv$iv;
                                            }
                                        }
                                        node$iv$iv$iv$iv = node$iv$iv$iv$iv.getChild$ui_release();
                                        type$iv5 = type$iv4;
                                        z5 = z4;
                                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4;
                                    }
                                    type$iv3 = type$iv5;
                                    z3 = z5;
                                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5;
                                    if (count$iv$iv$iv2 == 1) {
                                        $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv4;
                                        type$iv5 = type$iv3;
                                        z5 = z3;
                                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv3;
                                    }
                                }
                                node2 = DelegatableNodeKt.pop(mutableVector2);
                                $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv4;
                                type$iv5 = type$iv3;
                                z5 = z3;
                                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv3;
                            }
                            $this$nearestAncestor_u2d64DMado$iv2 = $this$nearestAncestor_u2d64DMado$iv3;
                            type$iv2 = type$iv5;
                            z2 = z5;
                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5;
                        }
                        node$iv$iv$iv = node$iv$iv$iv.getParent$ui_release();
                        $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv2;
                        type$iv5 = type$iv2;
                        z5 = z2;
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv2;
                    }
                    $this$nearestAncestor_u2d64DMado$iv = $this$nearestAncestor_u2d64DMado$iv3;
                    type$iv = type$iv5;
                    z = z5;
                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5;
                    node = null;
                }
                layout$iv$iv$iv = layout$iv$iv$iv.getParent$ui_release();
                node$iv$iv$iv = (layout$iv$iv$iv == null || (nodes$ui_release = layout$iv$iv$iv.getNodes$ui_release()) == null) ? node : nodes$ui_release.getTail$ui_release();
                $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv;
                type$iv5 = type$iv;
                z5 = z;
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv5 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv;
            } else {
                t = null;
                focusTargetNode = null;
                break;
            }
        }
        FocusTargetNode it = focusTargetNode;
        if (it != null && Intrinsics.areEqual(it.getBeyondBoundsLayoutParent(), $this$searchBeyondBounds_u2d_u2dOM_u2dvw8.getBeyondBoundsLayoutParent())) {
            return t;
        }
        BeyondBoundsLayout beyondBoundsLayoutParent = $this$searchBeyondBounds_u2d_u2dOM_u2dvw8.getBeyondBoundsLayoutParent();
        if (beyondBoundsLayoutParent != null) {
            if (FocusDirection.m3932equalsimpl0(direction, FocusDirection.Companion.m3943getUpdhqQ8s())) {
                m5625getBeforehoxUOeE = BeyondBoundsLayout.LayoutDirection.Companion.m5623getAbovehoxUOeE();
            } else if (FocusDirection.m3932equalsimpl0(direction, FocusDirection.Companion.m3936getDowndhqQ8s())) {
                m5625getBeforehoxUOeE = BeyondBoundsLayout.LayoutDirection.Companion.m5626getBelowhoxUOeE();
            } else if (FocusDirection.m3932equalsimpl0(direction, FocusDirection.Companion.m3939getLeftdhqQ8s())) {
                m5625getBeforehoxUOeE = BeyondBoundsLayout.LayoutDirection.Companion.m5627getLefthoxUOeE();
            } else if (FocusDirection.m3932equalsimpl0(direction, FocusDirection.Companion.m3942getRightdhqQ8s())) {
                m5625getBeforehoxUOeE = BeyondBoundsLayout.LayoutDirection.Companion.m5628getRighthoxUOeE();
            } else if (FocusDirection.m3932equalsimpl0(direction, FocusDirection.Companion.m3940getNextdhqQ8s())) {
                m5625getBeforehoxUOeE = BeyondBoundsLayout.LayoutDirection.Companion.m5624getAfterhoxUOeE();
            } else if (!FocusDirection.m3932equalsimpl0(direction, FocusDirection.Companion.m3941getPreviousdhqQ8s())) {
                throw new IllegalStateException("Unsupported direction for beyond bounds layout".toString());
            } else {
                m5625getBeforehoxUOeE = BeyondBoundsLayout.LayoutDirection.Companion.m5625getBeforehoxUOeE();
            }
            return (T) beyondBoundsLayoutParent.mo1149layouto7g1Pn8(m5625getBeforehoxUOeE, function1);
        }
        return t;
    }
}
