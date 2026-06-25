package androidx.compose.ui.relocation;

import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.geometry.SizeKt;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.NodeChain;
import androidx.compose.ui.node.NodeKind;
import androidx.compose.ui.unit.IntSizeKt;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.jvm.functions.Function0;
/* compiled from: BringIntoViewModifierNode.kt */
@Metadata(d1 = {"\u0000\u0018\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a&\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0012\b\u0002\u0010\u0003\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0005\u0018\u00010\u0004H\u0086@¢\u0006\u0002\u0010\u0006¨\u0006\u0007"}, d2 = {"bringIntoView", "", "Landroidx/compose/ui/node/DelegatableNode;", "bounds", "Lkotlin/Function0;", "Landroidx/compose/ui/geometry/Rect;", "(Landroidx/compose/ui/node/DelegatableNode;Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class BringIntoViewModifierNodeKt {
    public static /* synthetic */ Object bringIntoView$default(DelegatableNode delegatableNode, Function0 function0, Continuation continuation, int i, Object obj) {
        if ((i & 1) != 0) {
            function0 = null;
        }
        return bringIntoView(delegatableNode, function0, continuation);
    }

    public static final Object bringIntoView(DelegatableNode $this$bringIntoView, final Function0<Rect> function0, Continuation<? super Unit> continuation) {
        BringIntoViewModifierNode bringIntoViewModifierNode;
        final LayoutCoordinates layoutCoordinates;
        Object bringIntoView;
        int type$iv;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv;
        boolean z;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv;
        NodeChain nodes$ui_release;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv2;
        boolean z2;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv2;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv3;
        boolean z3;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv3;
        int count$iv$iv$iv;
        MutableVector mutableVector;
        if ($this$bringIntoView.getNode().isAttached()) {
            int count$iv$iv$iv2 = NodeKind.m5898constructorimpl(524288);
            DelegatableNode $this$nearestAncestor_u2d64DMado$iv4 = $this$bringIntoView;
            boolean z4 = false;
            DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4 = $this$nearestAncestor_u2d64DMado$iv4;
            boolean value$iv$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4.getNode().isAttached();
            if (!value$iv$iv$iv$iv) {
                InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
            }
            Modifier.Node node$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4.getNode().getParent$ui_release();
            LayoutNode layout$iv$iv$iv = DelegatableNodeKt.requireLayoutNode($this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4);
            loop0: while (true) {
                if (layout$iv$iv$iv != null) {
                    Modifier.Node head$iv$iv$iv = layout$iv$iv$iv.getNodes$ui_release().getHead$ui_release();
                    if ((head$iv$iv$iv.getAggregateChildKindSet$ui_release() & count$iv$iv$iv2) == 0) {
                        type$iv = count$iv$iv$iv2;
                        $this$nearestAncestor_u2d64DMado$iv = $this$nearestAncestor_u2d64DMado$iv4;
                        z = z4;
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4;
                    } else {
                        while (node$iv$iv$iv != null) {
                            if ((node$iv$iv$iv.getKindSet$ui_release() & count$iv$iv$iv2) != 0) {
                                Modifier.Node it$iv$iv = node$iv$iv$iv;
                                MutableVector mutableVector2 = null;
                                bringIntoViewModifierNode = it$iv$iv;
                                while (bringIntoViewModifierNode != null) {
                                    int type$iv2 = count$iv$iv$iv2;
                                    if (bringIntoViewModifierNode instanceof BringIntoViewModifierNode) {
                                        break loop0;
                                    }
                                    Modifier.Node this_$iv$iv$iv$iv = bringIntoViewModifierNode;
                                    if (((this_$iv$iv$iv$iv.getKindSet$ui_release() & type$iv2) != 0 ? 1 : 0) == 0 || !(bringIntoViewModifierNode instanceof DelegatingNode)) {
                                        $this$nearestAncestor_u2d64DMado$iv2 = $this$nearestAncestor_u2d64DMado$iv4;
                                        z2 = z4;
                                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4;
                                    } else {
                                        int count$iv$iv$iv3 = 0;
                                        DelegatingNode this_$iv$iv$iv$iv2 = (DelegatingNode) bringIntoViewModifierNode;
                                        Modifier.Node node$iv$iv$iv$iv = this_$iv$iv$iv$iv2.getDelegate$ui_release();
                                        while (node$iv$iv$iv$iv != null) {
                                            Modifier.Node next$iv$iv$iv = node$iv$iv$iv$iv;
                                            if (!((next$iv$iv$iv.getKindSet$ui_release() & type$iv2) != 0)) {
                                                $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv4;
                                                z3 = z4;
                                                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4;
                                            } else {
                                                count$iv$iv$iv3++;
                                                $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv4;
                                                if (count$iv$iv$iv3 == 1) {
                                                    bringIntoViewModifierNode = next$iv$iv$iv;
                                                    z3 = z4;
                                                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4;
                                                } else {
                                                    if (mutableVector2 != null) {
                                                        count$iv$iv$iv = count$iv$iv$iv3;
                                                        z3 = z4;
                                                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4;
                                                        mutableVector = mutableVector2;
                                                    } else {
                                                        count$iv$iv$iv = count$iv$iv$iv3;
                                                        z3 = z4;
                                                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4;
                                                        mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                    }
                                                    Modifier.Node theNode$iv$iv$iv = bringIntoViewModifierNode;
                                                    if (theNode$iv$iv$iv != null) {
                                                        if (mutableVector != null) {
                                                            Boxing.boxBoolean(mutableVector.add(theNode$iv$iv$iv));
                                                        }
                                                        bringIntoViewModifierNode = null;
                                                    }
                                                    if (mutableVector != null) {
                                                        Boxing.boxBoolean(mutableVector.add(next$iv$iv$iv));
                                                    }
                                                    mutableVector2 = mutableVector;
                                                    count$iv$iv$iv3 = count$iv$iv$iv;
                                                }
                                            }
                                            node$iv$iv$iv$iv = node$iv$iv$iv$iv.getChild$ui_release();
                                            $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv3;
                                            z4 = z3;
                                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv3;
                                        }
                                        $this$nearestAncestor_u2d64DMado$iv2 = $this$nearestAncestor_u2d64DMado$iv4;
                                        z2 = z4;
                                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4;
                                        if (count$iv$iv$iv3 == 1) {
                                            count$iv$iv$iv2 = type$iv2;
                                            $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv2;
                                            z4 = z2;
                                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv2;
                                        }
                                    }
                                    bringIntoViewModifierNode = DelegatableNodeKt.pop(mutableVector2);
                                    count$iv$iv$iv2 = type$iv2;
                                    $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv2;
                                    z4 = z2;
                                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv2;
                                }
                                continue;
                            }
                            int type$iv3 = count$iv$iv$iv2;
                            node$iv$iv$iv = node$iv$iv$iv.getParent$ui_release();
                            count$iv$iv$iv2 = type$iv3;
                            $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv4;
                            z4 = z4;
                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4;
                        }
                        type$iv = count$iv$iv$iv2;
                        $this$nearestAncestor_u2d64DMado$iv = $this$nearestAncestor_u2d64DMado$iv4;
                        z = z4;
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4;
                    }
                    layout$iv$iv$iv = layout$iv$iv$iv.getParent$ui_release();
                    node$iv$iv$iv = (layout$iv$iv$iv == null || (nodes$ui_release = layout$iv$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
                    count$iv$iv$iv2 = type$iv;
                    $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv;
                    z4 = z;
                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv$iv;
                } else {
                    bringIntoViewModifierNode = null;
                    break;
                }
            }
            BringIntoViewModifierNode parent = bringIntoViewModifierNode;
            return (parent != null && (bringIntoView = parent.bringIntoView((layoutCoordinates = DelegatableNodeKt.requireLayoutCoordinates($this$bringIntoView)), new Function0<Rect>() { // from class: androidx.compose.ui.relocation.BringIntoViewModifierNodeKt$bringIntoView$2
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // kotlin.jvm.functions.Function0
                public final Rect invoke() {
                    Rect invoke;
                    Function0<Rect> function02 = function0;
                    if (function02 == null || (invoke = function02.invoke()) == null) {
                        LayoutCoordinates it = layoutCoordinates;
                        if (!it.isAttached()) {
                            it = null;
                        }
                        if (it != null) {
                            return SizeKt.m4138toRectuvyYCjk(IntSizeKt.m7056toSizeozmzZPI(it.mo5645getSizeYbymL2g()));
                        }
                        return null;
                    }
                    return invoke;
                }
            }, continuation)) == IntrinsicsKt.getCOROUTINE_SUSPENDED()) ? bringIntoView : Unit.INSTANCE;
        }
        return Unit.INSTANCE;
    }
}
