package androidx.compose.ui.node;

import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.graphics.GraphicsContext;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.semantics.SemanticsInfo;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.exifinterface.media.ExifInterface;
import com.itextpdf.kernel.xmp.PdfConst;
import java.util.ArrayList;
import java.util.List;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: DelegatableNode.kt */
@Metadata(d1 = {"\u0000\u0086\u0001\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0018\u001a\"\u0010\u0004\u001a\u00020\u0005*\b\u0012\u0004\u0012\u00020\u00070\u00062\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\t\u001a\u00020\u0001H\u0002\u001a5\u0010\n\u001a\n\u0012\u0004\u0012\u0002H\f\u0018\u00010\u000b\"\u0006\b\u0000\u0010\f\u0018\u0001*\u00020\u00022\f\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\f0\u000eH\u0080\bø\u0001\u0000¢\u0006\u0004\b\u000f\u0010\u0010\u001a\u000e\u0010\u0011\u001a\u0004\u0018\u00010\u0012*\u00020\u0007H\u0000\u001aA\u0010\u0013\u001a\u00020\u0005\"\u0006\b\u0000\u0010\f\u0018\u0001*\u00020\u00072\f\u0010\u0014\u001a\b\u0012\u0004\u0012\u0002H\f0\u000e2\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u0002H\f\u0012\u0004\u0012\u00020\u00050\u0016H\u0080\bø\u0001\u0000¢\u0006\u0004\b\u0017\u0010\u0018\u001a\u001a\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u001a0\u0006*\u00020\u001a2\u0006\u0010\t\u001a\u00020\u0001H\u0002\u001a\"\u0010\u001b\u001a\u00020\u0001*\u00020\u00022\n\u0010\r\u001a\u0006\u0012\u0002\b\u00030\u000eH\u0000ø\u0001\u0000¢\u0006\u0004\b\u001c\u0010\u001d\u001a\n\u0010\u001e\u001a\u00020\u0005*\u00020\u0002\u001a3\u0010\u001f\u001a\u0004\u0018\u0001H\f\"\n\b\u0000\u0010\f\u0018\u0001*\u00020 *\u00020\u00022\f\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\f0\u000eH\u0080\bø\u0001\u0000¢\u0006\u0004\b!\u0010\"\u001a\u0016\u0010\u001f\u001a\u0004\u0018\u00010\u0007*\u00020\u00022\u0006\u0010#\u001a\u00020$H\u0000\u001a\u0016\u0010%\u001a\u0004\u0018\u00010\u0007*\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0006H\u0002\u001a\n\u0010&\u001a\u00020\u0005*\u00020\u0002\u001a\"\u0010'\u001a\u00020(*\u00020\u00022\n\u0010\u0014\u001a\u0006\u0012\u0002\b\u00030\u000eH\u0000ø\u0001\u0000¢\u0006\u0004\b)\u0010*\u001a\n\u0010+\u001a\u00020,*\u00020\u0002\u001a\n\u0010-\u001a\u00020.*\u00020\u0002\u001a\n\u0010/\u001a\u000200*\u00020\u0002\u001a\n\u00101\u001a\u000202*\u00020\u0002\u001a\f\u00103\u001a\u00020\u001a*\u00020\u0002H\u0000\u001a\f\u00104\u001a\u000205*\u00020\u0002H\u0000\u001a\f\u00106\u001a\u000207*\u00020\u0002H\u0000\u001aK\u00108\u001a\u00020\u0005\"\u0006\b\u0000\u0010\f\u0018\u0001*\u00020\u00022\f\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\f0\u000e2\b\b\u0002\u00109\u001a\u00020\u00012\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u0002H\f\u0012\u0004\u0012\u00020\u00050\u0016H\u0080\bø\u0001\u0000¢\u0006\u0004\b:\u0010;\u001a3\u00108\u001a\u00020\u0005*\u00020\u00022\u0006\u0010#\u001a\u00020$2\b\b\u0002\u00109\u001a\u00020\u00012\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00050\u0016H\u0080\b\u001aK\u0010<\u001a\u00020\u0005\"\u0006\b\u0000\u0010\f\u0018\u0001*\u00020\u00022\f\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\f0\u000e2\b\b\u0002\u0010\t\u001a\u00020\u00012\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u0002H\f\u0012\u0004\u0012\u00020\u00050\u0016H\u0080\bø\u0001\u0000¢\u0006\u0004\b=\u0010;\u001a1\u0010<\u001a\u00020\u0005*\u00020\u00022\u0006\u0010#\u001a\u00020$2\u0006\u0010\t\u001a\u00020\u00012\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00050\u0016H\u0080\b\u001aA\u0010>\u001a\u00020\u0005\"\u0006\b\u0000\u0010\f\u0018\u0001*\u00020\u00022\f\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\f0\u000e2\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u0002H\f\u0012\u0004\u0012\u00020\u00050\u0016H\u0080\bø\u0001\u0000¢\u0006\u0004\b?\u0010@\u001a)\u0010>\u001a\u00020\u0005*\u00020\u00022\u0006\u0010#\u001a\u00020$2\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00050\u0016H\u0080\b\u001aA\u0010A\u001a\u00020\u0005\"\u0006\b\u0000\u0010\f\u0018\u0001*\u00020\u00022\f\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\f0\u000e2\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u0002H\f\u0012\u0004\u0012\u00020\u00050\u0016H\u0080\bø\u0001\u0000¢\u0006\u0004\bB\u0010@\u001a)\u0010A\u001a\u00020\u0005*\u00020\u00022\u0006\u0010#\u001a\u00020$2\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00050\u0016H\u0080\b\u001a3\u0010A\u001a\u00020\u0005*\u00020\u00022\u0006\u0010#\u001a\u00020$2\b\b\u0002\u00109\u001a\u00020\u00012\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00050\u0016H\u0080\b\u001aM\u0010C\u001a\u00020\u0005\"\u0006\b\u0000\u0010\f\u0018\u0001*\u00020\u00022\f\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\f0\u000e2\n\u0010D\u001a\u0006\u0012\u0002\b\u00030\u000e2\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u0002H\f\u0012\u0004\u0012\u00020\u00050\u0016H\u0080\bø\u0001\u0000¢\u0006\u0004\bE\u0010F\u001aK\u0010G\u001a\u00020\u0005\"\u0006\b\u0000\u0010\f\u0018\u0001*\u00020\u00022\f\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\f0\u000e2\b\b\u0002\u0010\t\u001a\u00020\u00012\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u0002H\f\u0012\u0004\u0012\u00020\u00050\u0016H\u0080\bø\u0001\u0000¢\u0006\u0004\bH\u0010;\u001aA\u0010I\u001a\u00020\u0005\"\u0006\b\u0000\u0010\f\u0018\u0001*\u00020\u00022\f\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\f0\u000e2\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u0002H\f\u0012\u0004\u0012\u00020\u00050\u0016H\u0080\bø\u0001\u0000¢\u0006\u0004\bJ\u0010@\u001aK\u0010K\u001a\u00020\u0005\"\u0006\b\u0000\u0010\f\u0018\u0001*\u00020\u00022\f\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\f0\u000e2\b\b\u0002\u0010\t\u001a\u00020\u00012\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u0002H\f\u0012\u0004\u0012\u00020\u00050\u0016H\u0080\bø\u0001\u0000¢\u0006\u0004\bL\u0010;\u001aK\u0010M\u001a\u00020\u0005\"\u0006\b\u0000\u0010\f\u0018\u0001*\u00020\u00022\f\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\f0\u000e2\b\b\u0002\u0010\t\u001a\u00020\u00012\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u0002H\f\u0012\u0004\u0012\u00020\u00010\u0016H\u0080\bø\u0001\u0000¢\u0006\u0004\bN\u0010;\u001a1\u0010M\u001a\u00020\u0005*\u00020\u00022\u0006\u0010#\u001a\u00020$2\u0006\u0010\t\u001a\u00020\u00012\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00010\u0016H\u0080\b\"\u0018\u0010\u0000\u001a\u00020\u0001*\u00020\u00028@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0000\u0010\u0003\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006O"}, d2 = {"isDelegationRoot", "", "Landroidx/compose/ui/node/DelegatableNode;", "(Landroidx/compose/ui/node/DelegatableNode;)Z", "addLayoutNodeChildren", "", "Landroidx/compose/runtime/collection/MutableVector;", "Landroidx/compose/ui/Modifier$Node;", "node", "zOrder", "ancestors", "", ExifInterface.GPS_DIRECTION_TRUE, PdfConst.Type, "Landroidx/compose/ui/node/NodeKind;", "ancestors-64DMado", "(Landroidx/compose/ui/node/DelegatableNode;I)Ljava/util/List;", "asLayoutModifierNode", "Landroidx/compose/ui/node/LayoutModifierNode;", "dispatchForKind", "kind", "block", "Lkotlin/Function1;", "dispatchForKind-6rFNWt0", "(Landroidx/compose/ui/Modifier$Node;ILkotlin/jvm/functions/Function1;)V", "getChildren", "Landroidx/compose/ui/node/LayoutNode;", "has", "has-64DMado", "(Landroidx/compose/ui/node/DelegatableNode;I)Z", "invalidateSubtree", "nearestAncestor", "", "nearestAncestor-64DMado", "(Landroidx/compose/ui/node/DelegatableNode;I)Ljava/lang/Object;", "mask", "", "pop", "requestAutofill", "requireCoordinator", "Landroidx/compose/ui/node/NodeCoordinator;", "requireCoordinator-64DMado", "(Landroidx/compose/ui/node/DelegatableNode;I)Landroidx/compose/ui/node/NodeCoordinator;", "requireDensity", "Landroidx/compose/ui/unit/Density;", "requireGraphicsContext", "Landroidx/compose/ui/graphics/GraphicsContext;", "requireLayoutCoordinates", "Landroidx/compose/ui/layout/LayoutCoordinates;", "requireLayoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "requireLayoutNode", "requireOwner", "Landroidx/compose/ui/node/Owner;", "requireSemanticsInfo", "Landroidx/compose/ui/semantics/SemanticsInfo;", "visitAncestors", "includeSelf", "visitAncestors-Y-YKmho", "(Landroidx/compose/ui/node/DelegatableNode;IZLkotlin/jvm/functions/Function1;)V", "visitChildren", "visitChildren-Y-YKmho", "visitLocalAncestors", "visitLocalAncestors-6rFNWt0", "(Landroidx/compose/ui/node/DelegatableNode;ILkotlin/jvm/functions/Function1;)V", "visitLocalDescendants", "visitLocalDescendants-6rFNWt0", "visitSelfAndAncestors", "untilType", "visitSelfAndAncestors-5BbP62I", "(Landroidx/compose/ui/node/DelegatableNode;IILkotlin/jvm/functions/Function1;)V", "visitSelfAndChildren", "visitSelfAndChildren-Y-YKmho", "visitSelfAndLocalDescendants", "visitSelfAndLocalDescendants-6rFNWt0", "visitSubtree", "visitSubtree-Y-YKmho", "visitSubtreeIf", "visitSubtreeIf-Y-YKmho", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class DelegatableNodeKt {
    public static final /* synthetic */ void access$addLayoutNodeChildren(MutableVector $receiver, Modifier.Node node, boolean zOrder) {
        addLayoutNodeChildren($receiver, node, zOrder);
    }

    public static final /* synthetic */ Modifier.Node access$pop(MutableVector $receiver) {
        return pop($receiver);
    }

    public static final boolean isDelegationRoot(DelegatableNode $this$isDelegationRoot) {
        return $this$isDelegationRoot.getNode() == $this$isDelegationRoot;
    }

    public static /* synthetic */ void visitAncestors$default(DelegatableNode $this$visitAncestors_u24default, int mask, boolean includeSelf, Function1 block, int i, Object obj) {
        NodeChain nodes$ui_release;
        if ((i & 2) != 0) {
            includeSelf = false;
        }
        boolean value$iv = $this$visitAncestors_u24default.getNode().isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node = $this$visitAncestors_u24default.getNode();
        if (!includeSelf) {
            node = node.getParent$ui_release();
        }
        LayoutNode layout = requireLayoutNode($this$visitAncestors_u24default);
        while (layout != null) {
            Modifier.Node head = layout.getNodes$ui_release().getHead$ui_release();
            if ((head.getAggregateChildKindSet$ui_release() & mask) != 0) {
                while (node != null) {
                    if ((node.getKindSet$ui_release() & mask) != 0) {
                        block.invoke(node);
                    }
                    node = node.getParent$ui_release();
                }
            }
            layout = layout.getParent$ui_release();
            node = (layout == null || (nodes$ui_release = layout.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
        }
    }

    public static final void visitAncestors(DelegatableNode $this$visitAncestors, int mask, boolean includeSelf, Function1<? super Modifier.Node, Unit> function1) {
        NodeChain nodes$ui_release;
        boolean value$iv = $this$visitAncestors.getNode().isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node = $this$visitAncestors.getNode();
        if (!includeSelf) {
            node = node.getParent$ui_release();
        }
        LayoutNode layout = requireLayoutNode($this$visitAncestors);
        while (layout != null) {
            Modifier.Node head = layout.getNodes$ui_release().getHead$ui_release();
            if ((head.getAggregateChildKindSet$ui_release() & mask) != 0) {
                while (node != null) {
                    if ((node.getKindSet$ui_release() & mask) != 0) {
                        function1.invoke(node);
                    }
                    node = node.getParent$ui_release();
                }
            }
            layout = layout.getParent$ui_release();
            node = (layout == null || (nodes$ui_release = layout.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
        }
    }

    public static final Modifier.Node nearestAncestor(DelegatableNode $this$nearestAncestor, int mask) {
        NodeChain nodes$ui_release;
        boolean value$iv = $this$nearestAncestor.getNode().isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("nearestAncestor called on an unattached node");
        }
        Modifier.Node node = $this$nearestAncestor.getNode().getParent$ui_release();
        LayoutNode layout = requireLayoutNode($this$nearestAncestor);
        while (true) {
            Modifier.Node node2 = null;
            if (layout == null) {
                return null;
            }
            Modifier.Node head = layout.getNodes$ui_release().getHead$ui_release();
            if ((head.getAggregateChildKindSet$ui_release() & mask) != 0) {
                while (node != null) {
                    if ((node.getKindSet$ui_release() & mask) != 0) {
                        return node;
                    }
                    node = node.getParent$ui_release();
                }
            }
            layout = layout.getParent$ui_release();
            if (layout != null && (nodes$ui_release = layout.getNodes$ui_release()) != null) {
                node2 = nodes$ui_release.getTail$ui_release();
            }
            node = node2;
        }
    }

    private static final MutableVector<LayoutNode> getChildren(LayoutNode $this$getChildren, boolean zOrder) {
        if (zOrder) {
            return $this$getChildren.getZSortedChildren();
        }
        return $this$getChildren.get_children$ui_release();
    }

    public static final void addLayoutNodeChildren(MutableVector<Modifier.Node> mutableVector, Modifier.Node node, boolean zOrder) {
        MutableVector this_$iv = getChildren(requireLayoutNode(node), zOrder);
        int i$iv = this_$iv.getSize() - 1;
        Object[] content$iv = this_$iv.content;
        if (i$iv >= content$iv.length) {
            return;
        }
        while (i$iv >= 0) {
            LayoutNode it = (LayoutNode) content$iv[i$iv];
            mutableVector.add(it.getNodes$ui_release().getHead$ui_release());
            i$iv--;
        }
    }

    public static final void visitChildren(DelegatableNode $this$visitChildren, int mask, boolean zOrder, Function1<? super Modifier.Node, Unit> function1) {
        boolean value$iv = $this$visitChildren.getNode().isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitChildren called on an unattached node");
        }
        MutableVector branches = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child = $this$visitChildren.getNode().getChild$ui_release();
        if (child == null) {
            addLayoutNodeChildren(branches, $this$visitChildren.getNode(), zOrder);
        } else {
            branches.add(child);
        }
        while (true) {
            MutableVector this_$iv = branches.getSize() != 0 ? 1 : null;
            if (this_$iv != null) {
                Modifier.Node branch = (Modifier.Node) branches.removeAt(branches.getSize() - 1);
                if ((branch.getAggregateChildKindSet$ui_release() & mask) == 0) {
                    addLayoutNodeChildren(branches, branch, zOrder);
                } else {
                    Modifier.Node node = branch;
                    while (true) {
                        if (node == null) {
                            break;
                        } else if ((node.getKindSet$ui_release() & mask) != 0) {
                            function1.invoke(node);
                            break;
                        } else {
                            node = node.getChild$ui_release();
                        }
                    }
                }
            } else {
                return;
            }
        }
    }

    public static final void visitSubtreeIf(DelegatableNode $this$visitSubtreeIf, int mask, boolean zOrder, Function1<? super Modifier.Node, Boolean> function1) {
        boolean value$iv = $this$visitSubtreeIf.getNode().isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitSubtreeIf called on an unattached node");
        }
        MutableVector branches = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child = $this$visitSubtreeIf.getNode().getChild$ui_release();
        if (child == null) {
            addLayoutNodeChildren(branches, $this$visitSubtreeIf.getNode(), zOrder);
        } else {
            branches.add(child);
        }
        while (true) {
            MutableVector this_$iv = branches.getSize() != 0 ? 1 : null;
            if (this_$iv != null) {
                Modifier.Node branch = (Modifier.Node) branches.removeAt(branches.getSize() - 1);
                if ((branch.getAggregateChildKindSet$ui_release() & mask) != 0) {
                    for (Modifier.Node node = branch; node != null; node = node.getChild$ui_release()) {
                        if ((node.getKindSet$ui_release() & mask) != 0) {
                            boolean diveDeeper = function1.invoke(node).booleanValue();
                            if (diveDeeper) {
                            }
                        }
                    }
                }
                addLayoutNodeChildren(branches, branch, zOrder);
            } else {
                return;
            }
        }
    }

    public static final void visitLocalDescendants(DelegatableNode $this$visitLocalDescendants, int mask, Function1<? super Modifier.Node, Unit> function1) {
        boolean value$iv$iv = $this$visitLocalDescendants.getNode().isAttached();
        if (!value$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitLocalDescendants called on an unattached node");
        }
        Modifier.Node self$iv = $this$visitLocalDescendants.getNode();
        if ((self$iv.getAggregateChildKindSet$ui_release() & mask) == 0) {
            return;
        }
        for (Modifier.Node next$iv = self$iv.getChild$ui_release(); next$iv != null; next$iv = next$iv.getChild$ui_release()) {
            if ((next$iv.getKindSet$ui_release() & mask) != 0) {
                function1.invoke(next$iv);
            }
        }
    }

    public static /* synthetic */ void visitLocalDescendants$default(DelegatableNode $this$visitLocalDescendants_u24default, int mask, boolean includeSelf, Function1 block, int i, Object obj) {
        if ((i & 2) != 0) {
            includeSelf = false;
        }
        boolean value$iv = $this$visitLocalDescendants_u24default.getNode().isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitLocalDescendants called on an unattached node");
        }
        Modifier.Node self = $this$visitLocalDescendants_u24default.getNode();
        if ((self.getAggregateChildKindSet$ui_release() & mask) == 0) {
            return;
        }
        for (Modifier.Node next = includeSelf ? self : self.getChild$ui_release(); next != null; next = next.getChild$ui_release()) {
            if ((next.getKindSet$ui_release() & mask) != 0) {
                block.invoke(next);
            }
        }
    }

    public static final void visitLocalDescendants(DelegatableNode $this$visitLocalDescendants, int mask, boolean includeSelf, Function1<? super Modifier.Node, Unit> function1) {
        boolean value$iv = $this$visitLocalDescendants.getNode().isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitLocalDescendants called on an unattached node");
        }
        Modifier.Node self = $this$visitLocalDescendants.getNode();
        if ((self.getAggregateChildKindSet$ui_release() & mask) == 0) {
            return;
        }
        for (Modifier.Node next = includeSelf ? self : self.getChild$ui_release(); next != null; next = next.getChild$ui_release()) {
            if ((next.getKindSet$ui_release() & mask) != 0) {
                function1.invoke(next);
            }
        }
    }

    public static final void visitLocalAncestors(DelegatableNode $this$visitLocalAncestors, int mask, Function1<? super Modifier.Node, Unit> function1) {
        boolean value$iv = $this$visitLocalAncestors.getNode().isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitLocalAncestors called on an unattached node");
        }
        for (Modifier.Node next = $this$visitLocalAncestors.getNode().getParent$ui_release(); next != null; next = next.getParent$ui_release()) {
            if ((next.getKindSet$ui_release() & mask) != 0) {
                function1.invoke(next);
            }
        }
    }

    /* renamed from: visitSelfAndLocalDescendants-6rFNWt0 */
    public static final /* synthetic */ <T> void m5769visitSelfAndLocalDescendants6rFNWt0(DelegatableNode $this$visitSelfAndLocalDescendants_u2d6rFNWt0, int type, Function1<? super T, Unit> function1) {
        boolean z;
        boolean includeSelf$iv;
        DelegatableNode $this$visitLocalDescendants$iv;
        int mask$iv;
        boolean includeSelf$iv2;
        DelegatableNode $this$visitLocalDescendants$iv2;
        int mask$iv2;
        Object obj;
        boolean z2 = false;
        boolean includeSelf$iv3 = true;
        DelegatableNode $this$visitLocalDescendants$iv3 = $this$visitSelfAndLocalDescendants_u2d6rFNWt0;
        int mask$iv3 = type;
        boolean value$iv$iv = $this$visitLocalDescendants$iv3.getNode().isAttached();
        if (!value$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitLocalDescendants called on an unattached node");
        }
        Modifier.Node self$iv = $this$visitLocalDescendants$iv3.getNode();
        if ((self$iv.getAggregateChildKindSet$ui_release() & mask$iv3) == 0) {
            return;
        }
        Modifier.Node next$iv = self$iv;
        while (next$iv != null) {
            if ((next$iv.getKindSet$ui_release() & mask$iv3) != 0) {
                Object it = next$iv;
                Object stack$iv = null;
                Object node$iv = it;
                while (node$iv != null) {
                    Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                    if (node$iv instanceof Object) {
                        function1.invoke(node$iv);
                        z = z2;
                        includeSelf$iv = includeSelf$iv3;
                        $this$visitLocalDescendants$iv = $this$visitLocalDescendants$iv3;
                        mask$iv = mask$iv3;
                    } else {
                        Modifier.Node this_$iv$iv = (Modifier.Node) node$iv;
                        z = z2;
                        if (!((this_$iv$iv.getKindSet$ui_release() & type) != 0) || !(node$iv instanceof DelegatingNode)) {
                            includeSelf$iv = includeSelf$iv3;
                            $this$visitLocalDescendants$iv = $this$visitLocalDescendants$iv3;
                            mask$iv = mask$iv3;
                        } else {
                            int count$iv = 0;
                            DelegatingNode this_$iv$iv2 = (DelegatingNode) node$iv;
                            Modifier.Node node$iv$iv = this_$iv$iv2.getDelegate$ui_release();
                            while (node$iv$iv != null) {
                                Modifier.Node next$iv2 = node$iv$iv;
                                if (!((next$iv2.getKindSet$ui_release() & type) != 0)) {
                                    includeSelf$iv2 = includeSelf$iv3;
                                    $this$visitLocalDescendants$iv2 = $this$visitLocalDescendants$iv3;
                                    mask$iv2 = mask$iv3;
                                } else {
                                    count$iv++;
                                    includeSelf$iv2 = includeSelf$iv3;
                                    if (count$iv == 1) {
                                        node$iv = next$iv2;
                                        $this$visitLocalDescendants$iv2 = $this$visitLocalDescendants$iv3;
                                        mask$iv2 = mask$iv3;
                                    } else {
                                        Object obj2 = (MutableVector) stack$iv;
                                        if (obj2 != null) {
                                            $this$visitLocalDescendants$iv2 = $this$visitLocalDescendants$iv3;
                                            mask$iv2 = mask$iv3;
                                            obj = obj2;
                                        } else {
                                            $this$visitLocalDescendants$iv2 = $this$visitLocalDescendants$iv3;
                                            mask$iv2 = mask$iv3;
                                            obj = new MutableVector(new Modifier.Node[16], 0);
                                            MutableVector mutableVector = (MutableVector) obj;
                                        }
                                        stack$iv = obj;
                                        Modifier.Node theNode$iv = (Modifier.Node) node$iv;
                                        if (theNode$iv != null) {
                                            MutableVector mutableVector2 = (MutableVector) stack$iv;
                                            if (mutableVector2 != null) {
                                                mutableVector2.add(theNode$iv);
                                            }
                                            node$iv = null;
                                        }
                                        MutableVector mutableVector3 = (MutableVector) stack$iv;
                                        if (mutableVector3 != null) {
                                            mutableVector3.add(next$iv2);
                                        }
                                    }
                                }
                                node$iv$iv = node$iv$iv.getChild$ui_release();
                                includeSelf$iv3 = includeSelf$iv2;
                                $this$visitLocalDescendants$iv3 = $this$visitLocalDescendants$iv2;
                                mask$iv3 = mask$iv2;
                            }
                            includeSelf$iv = includeSelf$iv3;
                            $this$visitLocalDescendants$iv = $this$visitLocalDescendants$iv3;
                            mask$iv = mask$iv3;
                            if (count$iv == 1) {
                                z2 = z;
                                includeSelf$iv3 = includeSelf$iv;
                                $this$visitLocalDescendants$iv3 = $this$visitLocalDescendants$iv;
                                mask$iv3 = mask$iv;
                            }
                        }
                    }
                    node$iv = pop((MutableVector) stack$iv);
                    z2 = z;
                    includeSelf$iv3 = includeSelf$iv;
                    $this$visitLocalDescendants$iv3 = $this$visitLocalDescendants$iv;
                    mask$iv3 = mask$iv;
                }
            }
            next$iv = next$iv.getChild$ui_release();
            z2 = z2;
            includeSelf$iv3 = includeSelf$iv3;
            $this$visitLocalDescendants$iv3 = $this$visitLocalDescendants$iv3;
            mask$iv3 = mask$iv3;
        }
    }

    /* renamed from: visitLocalDescendants-6rFNWt0 */
    public static final /* synthetic */ <T> void m5765visitLocalDescendants6rFNWt0(DelegatableNode $this$visitLocalDescendants_u2d6rFNWt0, int type, Function1<? super T, Unit> function1) {
        int mask$iv;
        DelegatableNode $this$visitLocalDescendants$iv;
        boolean z;
        int mask$iv2;
        DelegatableNode $this$visitLocalDescendants$iv2;
        boolean z2;
        Object obj;
        boolean z3 = false;
        int mask$iv3 = type;
        DelegatableNode $this$visitLocalDescendants$iv3 = $this$visitLocalDescendants_u2d6rFNWt0;
        boolean z4 = false;
        boolean value$iv$iv$iv = $this$visitLocalDescendants$iv3.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitLocalDescendants called on an unattached node");
        }
        Modifier.Node self$iv$iv = $this$visitLocalDescendants$iv3.getNode();
        if ((self$iv$iv.getAggregateChildKindSet$ui_release() & mask$iv3) == 0) {
            return;
        }
        Modifier.Node next$iv$iv = self$iv$iv.getChild$ui_release();
        while (next$iv$iv != null) {
            if ((next$iv$iv.getKindSet$ui_release() & mask$iv3) != 0) {
                Object it = next$iv$iv;
                Object stack$iv = null;
                Object node$iv = it;
                while (node$iv != null) {
                    boolean z5 = z3;
                    Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                    if (node$iv instanceof Object) {
                        function1.invoke(node$iv);
                        mask$iv = mask$iv3;
                        $this$visitLocalDescendants$iv = $this$visitLocalDescendants$iv3;
                        z = z4;
                    } else {
                        Modifier.Node this_$iv$iv = (Modifier.Node) node$iv;
                        if (!((this_$iv$iv.getKindSet$ui_release() & type) != 0) || !(node$iv instanceof DelegatingNode)) {
                            mask$iv = mask$iv3;
                            $this$visitLocalDescendants$iv = $this$visitLocalDescendants$iv3;
                            z = z4;
                        } else {
                            int count$iv = 0;
                            DelegatingNode this_$iv$iv2 = (DelegatingNode) node$iv;
                            Modifier.Node node$iv$iv = this_$iv$iv2.getDelegate$ui_release();
                            while (node$iv$iv != null) {
                                Modifier.Node next$iv = node$iv$iv;
                                if (!((next$iv.getKindSet$ui_release() & type) != 0)) {
                                    mask$iv2 = mask$iv3;
                                    $this$visitLocalDescendants$iv2 = $this$visitLocalDescendants$iv3;
                                    z2 = z4;
                                } else {
                                    count$iv++;
                                    mask$iv2 = mask$iv3;
                                    if (count$iv == 1) {
                                        node$iv = next$iv;
                                        $this$visitLocalDescendants$iv2 = $this$visitLocalDescendants$iv3;
                                        z2 = z4;
                                    } else {
                                        Object obj2 = (MutableVector) stack$iv;
                                        if (obj2 != null) {
                                            $this$visitLocalDescendants$iv2 = $this$visitLocalDescendants$iv3;
                                            z2 = z4;
                                            obj = obj2;
                                        } else {
                                            $this$visitLocalDescendants$iv2 = $this$visitLocalDescendants$iv3;
                                            z2 = z4;
                                            obj = new MutableVector(new Modifier.Node[16], 0);
                                            MutableVector mutableVector = (MutableVector) obj;
                                        }
                                        stack$iv = obj;
                                        Modifier.Node theNode$iv = (Modifier.Node) node$iv;
                                        if (theNode$iv != null) {
                                            MutableVector mutableVector2 = (MutableVector) stack$iv;
                                            if (mutableVector2 != null) {
                                                mutableVector2.add(theNode$iv);
                                            }
                                            node$iv = null;
                                        }
                                        MutableVector mutableVector3 = (MutableVector) stack$iv;
                                        if (mutableVector3 != null) {
                                            mutableVector3.add(next$iv);
                                        }
                                    }
                                }
                                node$iv$iv = node$iv$iv.getChild$ui_release();
                                mask$iv3 = mask$iv2;
                                $this$visitLocalDescendants$iv3 = $this$visitLocalDescendants$iv2;
                                z4 = z2;
                            }
                            mask$iv = mask$iv3;
                            $this$visitLocalDescendants$iv = $this$visitLocalDescendants$iv3;
                            z = z4;
                            if (count$iv == 1) {
                                z3 = z5;
                                mask$iv3 = mask$iv;
                                $this$visitLocalDescendants$iv3 = $this$visitLocalDescendants$iv;
                                z4 = z;
                            }
                        }
                    }
                    node$iv = pop((MutableVector) stack$iv);
                    z3 = z5;
                    mask$iv3 = mask$iv;
                    $this$visitLocalDescendants$iv3 = $this$visitLocalDescendants$iv;
                    z4 = z;
                }
            }
            next$iv$iv = next$iv$iv.getChild$ui_release();
            z3 = z3;
            mask$iv3 = mask$iv3;
            $this$visitLocalDescendants$iv3 = $this$visitLocalDescendants$iv3;
            z4 = z4;
        }
    }

    /* renamed from: visitLocalAncestors-6rFNWt0 */
    public static final /* synthetic */ <T> void m5764visitLocalAncestors6rFNWt0(DelegatableNode $this$visitLocalAncestors_u2d6rFNWt0, int type, Function1<? super T, Unit> function1) {
        int i;
        int mask$iv;
        DelegatableNode $this$visitLocalAncestors$iv;
        int i2;
        int mask$iv2;
        DelegatableNode $this$visitLocalAncestors$iv2;
        Object obj;
        int i3 = 0;
        int mask$iv3 = type;
        DelegatableNode $this$visitLocalAncestors$iv3 = $this$visitLocalAncestors_u2d6rFNWt0;
        boolean value$iv$iv = $this$visitLocalAncestors$iv3.getNode().isAttached();
        if (!value$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitLocalAncestors called on an unattached node");
        }
        Modifier.Node next$iv = $this$visitLocalAncestors$iv3.getNode().getParent$ui_release();
        while (next$iv != null) {
            if ((next$iv.getKindSet$ui_release() & mask$iv3) != 0) {
                Object it = next$iv;
                Object stack$iv = null;
                Object node$iv = it;
                while (node$iv != null) {
                    Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                    if (node$iv instanceof Object) {
                        function1.invoke(node$iv);
                        i = i3;
                        mask$iv = mask$iv3;
                        $this$visitLocalAncestors$iv = $this$visitLocalAncestors$iv3;
                    } else {
                        Modifier.Node this_$iv$iv = (Modifier.Node) node$iv;
                        if (!((this_$iv$iv.getKindSet$ui_release() & type) != 0) || !(node$iv instanceof DelegatingNode)) {
                            i = i3;
                            mask$iv = mask$iv3;
                            $this$visitLocalAncestors$iv = $this$visitLocalAncestors$iv3;
                        } else {
                            int count$iv = 0;
                            DelegatingNode this_$iv$iv2 = (DelegatingNode) node$iv;
                            Modifier.Node node$iv$iv = this_$iv$iv2.getDelegate$ui_release();
                            while (node$iv$iv != null) {
                                Modifier.Node next$iv2 = node$iv$iv;
                                if (!((next$iv2.getKindSet$ui_release() & type) != 0)) {
                                    i2 = i3;
                                    mask$iv2 = mask$iv3;
                                    $this$visitLocalAncestors$iv2 = $this$visitLocalAncestors$iv3;
                                } else {
                                    count$iv++;
                                    i2 = i3;
                                    if (count$iv == 1) {
                                        node$iv = next$iv2;
                                        mask$iv2 = mask$iv3;
                                        $this$visitLocalAncestors$iv2 = $this$visitLocalAncestors$iv3;
                                    } else {
                                        Object obj2 = (MutableVector) stack$iv;
                                        if (obj2 != null) {
                                            mask$iv2 = mask$iv3;
                                            $this$visitLocalAncestors$iv2 = $this$visitLocalAncestors$iv3;
                                            obj = obj2;
                                        } else {
                                            mask$iv2 = mask$iv3;
                                            $this$visitLocalAncestors$iv2 = $this$visitLocalAncestors$iv3;
                                            obj = new MutableVector(new Modifier.Node[16], 0);
                                            MutableVector mutableVector = (MutableVector) obj;
                                        }
                                        stack$iv = obj;
                                        Modifier.Node theNode$iv = (Modifier.Node) node$iv;
                                        if (theNode$iv != null) {
                                            MutableVector mutableVector2 = (MutableVector) stack$iv;
                                            if (mutableVector2 != null) {
                                                mutableVector2.add(theNode$iv);
                                            }
                                            node$iv = null;
                                        }
                                        MutableVector mutableVector3 = (MutableVector) stack$iv;
                                        if (mutableVector3 != null) {
                                            mutableVector3.add(next$iv2);
                                        }
                                    }
                                }
                                node$iv$iv = node$iv$iv.getChild$ui_release();
                                i3 = i2;
                                mask$iv3 = mask$iv2;
                                $this$visitLocalAncestors$iv3 = $this$visitLocalAncestors$iv2;
                            }
                            i = i3;
                            mask$iv = mask$iv3;
                            $this$visitLocalAncestors$iv = $this$visitLocalAncestors$iv3;
                            if (count$iv == 1) {
                                i3 = i;
                                mask$iv3 = mask$iv;
                                $this$visitLocalAncestors$iv3 = $this$visitLocalAncestors$iv;
                            }
                        }
                    }
                    node$iv = pop((MutableVector) stack$iv);
                    i3 = i;
                    mask$iv3 = mask$iv;
                    $this$visitLocalAncestors$iv3 = $this$visitLocalAncestors$iv;
                }
            }
            next$iv = next$iv.getParent$ui_release();
            i3 = i3;
            mask$iv3 = mask$iv3;
            $this$visitLocalAncestors$iv3 = $this$visitLocalAncestors$iv3;
        }
    }

    /* renamed from: visitAncestors-Y-YKmho$default */
    public static /* synthetic */ void m5761visitAncestorsYYKmho$default(DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default, int type, boolean includeSelf, Function1 block, int i, Object obj) {
        boolean includeSelf2;
        boolean includeSelf3;
        int i2;
        int mask$iv;
        DelegatableNode $this$visitAncestors$iv;
        NodeChain nodes$ui_release;
        boolean includeSelf4;
        int i3;
        int mask$iv2;
        DelegatableNode $this$visitAncestors$iv2;
        int i4;
        int mask$iv3;
        DelegatableNode $this$visitAncestors$iv3;
        Object obj2;
        if ((i & 2) == 0) {
            includeSelf2 = includeSelf;
        } else {
            includeSelf2 = false;
        }
        int i5 = 0;
        int mask$iv4 = type;
        DelegatableNode $this$visitAncestors$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default;
        boolean value$iv$iv = $this$visitAncestors$iv4.getNode().isAttached();
        if (!value$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv = $this$visitAncestors$iv4.getNode();
        if (!includeSelf2) {
            node$iv = node$iv.getParent$ui_release();
        }
        LayoutNode layout$iv = requireLayoutNode($this$visitAncestors$iv4);
        while (layout$iv != null) {
            Modifier.Node head$iv = layout$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv.getAggregateChildKindSet$ui_release() & mask$iv4) != 0) {
                while (node$iv != null) {
                    if ((node$iv.getKindSet$ui_release() & mask$iv4) != 0) {
                        Modifier.Node it = node$iv;
                        Object stack$iv = null;
                        Modifier.Node node = it;
                        while (node != null) {
                            Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                            if (node instanceof Object) {
                                block.invoke(node);
                                includeSelf4 = includeSelf2;
                                i3 = i5;
                                mask$iv2 = mask$iv4;
                                $this$visitAncestors$iv2 = $this$visitAncestors$iv4;
                            } else {
                                Modifier.Node this_$iv$iv = node;
                                includeSelf4 = includeSelf2;
                                if (!((this_$iv$iv.getKindSet$ui_release() & type) != 0) || !(node instanceof DelegatingNode)) {
                                    i3 = i5;
                                    mask$iv2 = mask$iv4;
                                    $this$visitAncestors$iv2 = $this$visitAncestors$iv4;
                                } else {
                                    int count$iv = 0;
                                    DelegatingNode this_$iv$iv2 = (DelegatingNode) node;
                                    Modifier.Node node$iv$iv = this_$iv$iv2.getDelegate$ui_release();
                                    while (node$iv$iv != null) {
                                        Modifier.Node next$iv = node$iv$iv;
                                        if (!((next$iv.getKindSet$ui_release() & type) != 0)) {
                                            i4 = i5;
                                            mask$iv3 = mask$iv4;
                                            $this$visitAncestors$iv3 = $this$visitAncestors$iv4;
                                        } else {
                                            count$iv++;
                                            i4 = i5;
                                            if (count$iv == 1) {
                                                node = next$iv;
                                                mask$iv3 = mask$iv4;
                                                $this$visitAncestors$iv3 = $this$visitAncestors$iv4;
                                            } else {
                                                Object obj3 = (MutableVector) stack$iv;
                                                if (obj3 != null) {
                                                    mask$iv3 = mask$iv4;
                                                    $this$visitAncestors$iv3 = $this$visitAncestors$iv4;
                                                    obj2 = obj3;
                                                } else {
                                                    mask$iv3 = mask$iv4;
                                                    $this$visitAncestors$iv3 = $this$visitAncestors$iv4;
                                                    obj2 = new MutableVector(new Modifier.Node[16], 0);
                                                    MutableVector mutableVector = (MutableVector) obj2;
                                                }
                                                stack$iv = obj2;
                                                Modifier.Node theNode$iv = node;
                                                if (theNode$iv != null) {
                                                    MutableVector mutableVector2 = (MutableVector) stack$iv;
                                                    if (mutableVector2 != null) {
                                                        mutableVector2.add(theNode$iv);
                                                    }
                                                    node = null;
                                                }
                                                MutableVector mutableVector3 = (MutableVector) stack$iv;
                                                if (mutableVector3 != null) {
                                                    mutableVector3.add(next$iv);
                                                }
                                            }
                                        }
                                        node$iv$iv = node$iv$iv.getChild$ui_release();
                                        i5 = i4;
                                        mask$iv4 = mask$iv3;
                                        $this$visitAncestors$iv4 = $this$visitAncestors$iv3;
                                    }
                                    i3 = i5;
                                    mask$iv2 = mask$iv4;
                                    $this$visitAncestors$iv2 = $this$visitAncestors$iv4;
                                    if (count$iv == 1) {
                                        includeSelf2 = includeSelf4;
                                        i5 = i3;
                                        mask$iv4 = mask$iv2;
                                        $this$visitAncestors$iv4 = $this$visitAncestors$iv2;
                                    }
                                }
                            }
                            node = pop((MutableVector) stack$iv);
                            includeSelf2 = includeSelf4;
                            i5 = i3;
                            mask$iv4 = mask$iv2;
                            $this$visitAncestors$iv4 = $this$visitAncestors$iv2;
                        }
                    }
                    node$iv = node$iv.getParent$ui_release();
                    includeSelf2 = includeSelf2;
                    i5 = i5;
                    mask$iv4 = mask$iv4;
                    $this$visitAncestors$iv4 = $this$visitAncestors$iv4;
                }
                includeSelf3 = includeSelf2;
                i2 = i5;
                mask$iv = mask$iv4;
                $this$visitAncestors$iv = $this$visitAncestors$iv4;
            } else {
                includeSelf3 = includeSelf2;
                i2 = i5;
                mask$iv = mask$iv4;
                $this$visitAncestors$iv = $this$visitAncestors$iv4;
            }
            layout$iv = layout$iv.getParent$ui_release();
            node$iv = (layout$iv == null || (nodes$ui_release = layout$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
            includeSelf2 = includeSelf3;
            i5 = i2;
            mask$iv4 = mask$iv;
            $this$visitAncestors$iv4 = $this$visitAncestors$iv;
        }
    }

    /* renamed from: visitAncestors-Y-YKmho */
    public static final /* synthetic */ <T> void m5760visitAncestorsYYKmho(DelegatableNode $this$visitAncestors_u2dY_u2dYKmho, int type, boolean includeSelf, Function1<? super T, Unit> function1) {
        int i;
        int mask$iv;
        DelegatableNode $this$visitAncestors$iv;
        int $i$f$visitAncestors;
        NodeChain nodes$ui_release;
        int i2;
        int mask$iv2;
        DelegatableNode $this$visitAncestors$iv2;
        int $i$f$visitAncestors2;
        int mask$iv3;
        DelegatableNode $this$visitAncestors$iv3;
        int $i$f$visitAncestors3;
        Object obj;
        int i3 = 0;
        int mask$iv4 = type;
        DelegatableNode $this$visitAncestors$iv4 = $this$visitAncestors_u2dY_u2dYKmho;
        int $i$f$visitAncestors4 = 0;
        boolean value$iv$iv = $this$visitAncestors$iv4.getNode().isAttached();
        if (!value$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv = $this$visitAncestors$iv4.getNode();
        if (!includeSelf) {
            node$iv = node$iv.getParent$ui_release();
        }
        LayoutNode layout$iv = requireLayoutNode($this$visitAncestors$iv4);
        while (layout$iv != null) {
            Modifier.Node head$iv = layout$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv.getAggregateChildKindSet$ui_release() & mask$iv4) != 0) {
                while (node$iv != null) {
                    if ((node$iv.getKindSet$ui_release() & mask$iv4) != 0) {
                        Object it = node$iv;
                        Object stack$iv = null;
                        Object node$iv2 = it;
                        while (node$iv2 != null) {
                            Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                            if (node$iv2 instanceof Object) {
                                function1.invoke(node$iv2);
                                i2 = i3;
                                mask$iv2 = mask$iv4;
                                $this$visitAncestors$iv2 = $this$visitAncestors$iv4;
                                $i$f$visitAncestors2 = $i$f$visitAncestors4;
                            } else {
                                Modifier.Node this_$iv$iv = (Modifier.Node) node$iv2;
                                i2 = i3;
                                if (!((this_$iv$iv.getKindSet$ui_release() & type) != 0) || !(node$iv2 instanceof DelegatingNode)) {
                                    mask$iv2 = mask$iv4;
                                    $this$visitAncestors$iv2 = $this$visitAncestors$iv4;
                                    $i$f$visitAncestors2 = $i$f$visitAncestors4;
                                } else {
                                    int count$iv = 0;
                                    DelegatingNode this_$iv$iv2 = (DelegatingNode) node$iv2;
                                    Modifier.Node node$iv$iv = this_$iv$iv2.getDelegate$ui_release();
                                    while (node$iv$iv != null) {
                                        Modifier.Node next$iv = node$iv$iv;
                                        if (!((next$iv.getKindSet$ui_release() & type) != 0)) {
                                            mask$iv3 = mask$iv4;
                                            $this$visitAncestors$iv3 = $this$visitAncestors$iv4;
                                            $i$f$visitAncestors3 = $i$f$visitAncestors4;
                                        } else {
                                            count$iv++;
                                            mask$iv3 = mask$iv4;
                                            if (count$iv == 1) {
                                                node$iv2 = next$iv;
                                                $this$visitAncestors$iv3 = $this$visitAncestors$iv4;
                                                $i$f$visitAncestors3 = $i$f$visitAncestors4;
                                            } else {
                                                Object obj2 = (MutableVector) stack$iv;
                                                if (obj2 != null) {
                                                    $this$visitAncestors$iv3 = $this$visitAncestors$iv4;
                                                    $i$f$visitAncestors3 = $i$f$visitAncestors4;
                                                    obj = obj2;
                                                } else {
                                                    $this$visitAncestors$iv3 = $this$visitAncestors$iv4;
                                                    $i$f$visitAncestors3 = $i$f$visitAncestors4;
                                                    obj = new MutableVector(new Modifier.Node[16], 0);
                                                    MutableVector mutableVector = (MutableVector) obj;
                                                }
                                                stack$iv = obj;
                                                Modifier.Node theNode$iv = (Modifier.Node) node$iv2;
                                                if (theNode$iv != null) {
                                                    MutableVector mutableVector2 = (MutableVector) stack$iv;
                                                    if (mutableVector2 != null) {
                                                        mutableVector2.add(theNode$iv);
                                                    }
                                                    node$iv2 = null;
                                                }
                                                MutableVector mutableVector3 = (MutableVector) stack$iv;
                                                if (mutableVector3 != null) {
                                                    mutableVector3.add(next$iv);
                                                }
                                            }
                                        }
                                        node$iv$iv = node$iv$iv.getChild$ui_release();
                                        mask$iv4 = mask$iv3;
                                        $this$visitAncestors$iv4 = $this$visitAncestors$iv3;
                                        $i$f$visitAncestors4 = $i$f$visitAncestors3;
                                    }
                                    mask$iv2 = mask$iv4;
                                    $this$visitAncestors$iv2 = $this$visitAncestors$iv4;
                                    $i$f$visitAncestors2 = $i$f$visitAncestors4;
                                    if (count$iv == 1) {
                                        i3 = i2;
                                        mask$iv4 = mask$iv2;
                                        $this$visitAncestors$iv4 = $this$visitAncestors$iv2;
                                        $i$f$visitAncestors4 = $i$f$visitAncestors2;
                                    }
                                }
                            }
                            node$iv2 = pop((MutableVector) stack$iv);
                            i3 = i2;
                            mask$iv4 = mask$iv2;
                            $this$visitAncestors$iv4 = $this$visitAncestors$iv2;
                            $i$f$visitAncestors4 = $i$f$visitAncestors2;
                        }
                    }
                    node$iv = node$iv.getParent$ui_release();
                    i3 = i3;
                    mask$iv4 = mask$iv4;
                    $this$visitAncestors$iv4 = $this$visitAncestors$iv4;
                    $i$f$visitAncestors4 = $i$f$visitAncestors4;
                }
                i = i3;
                mask$iv = mask$iv4;
                $this$visitAncestors$iv = $this$visitAncestors$iv4;
                $i$f$visitAncestors = $i$f$visitAncestors4;
            } else {
                i = i3;
                mask$iv = mask$iv4;
                $this$visitAncestors$iv = $this$visitAncestors$iv4;
                $i$f$visitAncestors = $i$f$visitAncestors4;
            }
            layout$iv = layout$iv.getParent$ui_release();
            node$iv = (layout$iv == null || (nodes$ui_release = layout$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
            i3 = i;
            mask$iv4 = mask$iv;
            $this$visitAncestors$iv4 = $this$visitAncestors$iv;
            $i$f$visitAncestors4 = $i$f$visitAncestors;
        }
    }

    /* renamed from: visitSelfAndAncestors-5BbP62I */
    public static final /* synthetic */ <T> void m5766visitSelfAndAncestors5BbP62I(DelegatableNode $this$visitSelfAndAncestors_u2d5BbP62I, int type, int untilType, Function1<? super T, Unit> function1) {
        int i;
        Modifier.Node self;
        int mask$iv;
        boolean includeSelf$iv;
        NodeChain nodes$ui_release;
        Modifier.Node self2;
        int mask$iv2;
        boolean includeSelf$iv2;
        Modifier.Node self3;
        int mask$iv3;
        boolean includeSelf$iv3;
        Object obj;
        int i2 = 0;
        Modifier.Node self4 = $this$visitSelfAndAncestors_u2d5BbP62I.getNode();
        int mask$iv4 = type | untilType;
        boolean includeSelf$iv4 = true;
        boolean value$iv$iv = $this$visitSelfAndAncestors_u2d5BbP62I.getNode().isAttached();
        if (!value$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv = $this$visitSelfAndAncestors_u2d5BbP62I.getNode();
        LayoutNode layout$iv = requireLayoutNode($this$visitSelfAndAncestors_u2d5BbP62I);
        while (layout$iv != null) {
            Modifier.Node head$iv = layout$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv.getAggregateChildKindSet$ui_release() & mask$iv4) == 0) {
                i = i2;
                self = self4;
                mask$iv = mask$iv4;
                includeSelf$iv = includeSelf$iv4;
            } else {
                while (node$iv != null) {
                    if ((node$iv.getKindSet$ui_release() & mask$iv4) != 0) {
                        Modifier.Node it = node$iv;
                        if (it != self4) {
                            if ((it.getKindSet$ui_release() & untilType) != 0) {
                                return;
                            }
                        }
                        if ((it.getKindSet$ui_release() & type) != 0) {
                            Object stack$iv = null;
                            Object node$iv2 = it;
                            while (node$iv2 != null) {
                                int i3 = i2;
                                Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                                if (node$iv2 instanceof Object) {
                                    function1.invoke(node$iv2);
                                    self2 = self4;
                                    mask$iv2 = mask$iv4;
                                    includeSelf$iv2 = includeSelf$iv4;
                                } else {
                                    Modifier.Node this_$iv$iv = (Modifier.Node) node$iv2;
                                    if (!((this_$iv$iv.getKindSet$ui_release() & type) != 0) || !(node$iv2 instanceof DelegatingNode)) {
                                        self2 = self4;
                                        mask$iv2 = mask$iv4;
                                        includeSelf$iv2 = includeSelf$iv4;
                                    } else {
                                        int count$iv = 0;
                                        DelegatingNode this_$iv$iv2 = (DelegatingNode) node$iv2;
                                        Modifier.Node node$iv$iv = this_$iv$iv2.getDelegate$ui_release();
                                        while (node$iv$iv != null) {
                                            Modifier.Node next$iv = node$iv$iv;
                                            if (!((next$iv.getKindSet$ui_release() & type) != 0)) {
                                                self3 = self4;
                                                mask$iv3 = mask$iv4;
                                                includeSelf$iv3 = includeSelf$iv4;
                                            } else {
                                                count$iv++;
                                                self3 = self4;
                                                if (count$iv == 1) {
                                                    node$iv2 = next$iv;
                                                    mask$iv3 = mask$iv4;
                                                    includeSelf$iv3 = includeSelf$iv4;
                                                } else {
                                                    Object obj2 = (MutableVector) stack$iv;
                                                    if (obj2 != null) {
                                                        mask$iv3 = mask$iv4;
                                                        includeSelf$iv3 = includeSelf$iv4;
                                                        obj = obj2;
                                                    } else {
                                                        mask$iv3 = mask$iv4;
                                                        includeSelf$iv3 = includeSelf$iv4;
                                                        obj = new MutableVector(new Modifier.Node[16], 0);
                                                        MutableVector mutableVector = (MutableVector) obj;
                                                    }
                                                    stack$iv = obj;
                                                    Modifier.Node theNode$iv = (Modifier.Node) node$iv2;
                                                    if (theNode$iv != null) {
                                                        MutableVector mutableVector2 = (MutableVector) stack$iv;
                                                        if (mutableVector2 != null) {
                                                            mutableVector2.add(theNode$iv);
                                                        }
                                                        node$iv2 = null;
                                                    }
                                                    MutableVector mutableVector3 = (MutableVector) stack$iv;
                                                    if (mutableVector3 != null) {
                                                        mutableVector3.add(next$iv);
                                                    }
                                                }
                                            }
                                            node$iv$iv = node$iv$iv.getChild$ui_release();
                                            self4 = self3;
                                            mask$iv4 = mask$iv3;
                                            includeSelf$iv4 = includeSelf$iv3;
                                        }
                                        self2 = self4;
                                        mask$iv2 = mask$iv4;
                                        includeSelf$iv2 = includeSelf$iv4;
                                        if (count$iv == 1) {
                                            i2 = i3;
                                            self4 = self2;
                                            mask$iv4 = mask$iv2;
                                            includeSelf$iv4 = includeSelf$iv2;
                                        }
                                    }
                                }
                                node$iv2 = pop((MutableVector) stack$iv);
                                i2 = i3;
                                self4 = self2;
                                mask$iv4 = mask$iv2;
                                includeSelf$iv4 = includeSelf$iv2;
                            }
                        }
                    }
                    node$iv = node$iv.getParent$ui_release();
                    i2 = i2;
                    self4 = self4;
                    mask$iv4 = mask$iv4;
                    includeSelf$iv4 = includeSelf$iv4;
                }
                i = i2;
                self = self4;
                mask$iv = mask$iv4;
                includeSelf$iv = includeSelf$iv4;
            }
            layout$iv = layout$iv.getParent$ui_release();
            node$iv = (layout$iv == null || (nodes$ui_release = layout$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
            i2 = i;
            self4 = self;
            mask$iv4 = mask$iv;
            includeSelf$iv4 = includeSelf$iv;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* renamed from: ancestors-64DMado */
    public static final /* synthetic */ <T> List<T> m5755ancestors64DMado(DelegatableNode $this$ancestors_u2d64DMado, int type) {
        boolean z;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
        boolean includeSelf$iv;
        NodeChain nodes$ui_release;
        boolean z2;
        boolean includeSelf$iv2;
        boolean includeSelf$iv3;
        int count$iv$iv;
        Object obj;
        Modifier.Node node;
        boolean z3 = false;
        Object result = null;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$ancestors_u2d64DMado;
        boolean includeSelf$iv4 = false;
        boolean value$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2.getNode().getParent$ui_release();
        LayoutNode layout$iv$iv = requireLayoutNode($this$visitAncestors_u2dY_u2dYKmho_u24default$iv2);
        while (layout$iv$iv != null) {
            Modifier.Node head$iv$iv = layout$iv$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv$iv.getAggregateChildKindSet$ui_release() & type) == 0) {
                z = z3;
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                includeSelf$iv = includeSelf$iv4;
            } else {
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & type) == 0) {
                        z2 = z3;
                    } else {
                        Modifier.Node it$iv = node$iv$iv;
                        Object stack$iv$iv = null;
                        z2 = z3;
                        Modifier.Node node2 = it$iv;
                        while (node2 != null) {
                            Object result2 = result;
                            DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                            Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                            if (node2 instanceof Object) {
                                T t = node2;
                                if (result2 == null) {
                                    Object result3 = new ArrayList();
                                    result2 = (List) result3;
                                }
                                ((List) result2).add(t);
                                includeSelf$iv2 = includeSelf$iv4;
                                result = result2;
                            } else {
                                Modifier.Node this_$iv$iv$iv = node2;
                                if (((this_$iv$iv$iv.getKindSet$ui_release() & type) != 0 ? 1 : 0) == 0 || !(node2 instanceof DelegatingNode)) {
                                    includeSelf$iv2 = includeSelf$iv4;
                                    result = result2;
                                } else {
                                    int count$iv$iv2 = 0;
                                    DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node2;
                                    Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                    while (node$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv = node$iv$iv$iv;
                                        if ((next$iv$iv.getKindSet$ui_release() & type) != 0) {
                                            count$iv$iv2++;
                                            Modifier.Node node3 = node2;
                                            if (count$iv$iv2 == 1) {
                                                node2 = next$iv$iv;
                                                includeSelf$iv3 = includeSelf$iv4;
                                            } else {
                                                Object node$iv$iv2 = stack$iv$iv;
                                                Object obj2 = (MutableVector) node$iv$iv2;
                                                if (obj2 != null) {
                                                    count$iv$iv = count$iv$iv2;
                                                    includeSelf$iv3 = includeSelf$iv4;
                                                    obj = obj2;
                                                } else {
                                                    count$iv$iv = count$iv$iv2;
                                                    includeSelf$iv3 = includeSelf$iv4;
                                                    obj = new MutableVector(new Modifier.Node[16], 0);
                                                    MutableVector mutableVector = (MutableVector) obj;
                                                }
                                                stack$iv$iv = obj;
                                                Modifier.Node theNode$iv$iv = node3;
                                                if (theNode$iv$iv == null) {
                                                    node = node3;
                                                } else {
                                                    MutableVector mutableVector2 = (MutableVector) stack$iv$iv;
                                                    if (mutableVector2 != null) {
                                                        mutableVector2.add(theNode$iv$iv);
                                                    }
                                                    node = null;
                                                }
                                                MutableVector mutableVector3 = (MutableVector) stack$iv$iv;
                                                if (mutableVector3 != null) {
                                                    mutableVector3.add(next$iv$iv);
                                                }
                                                node2 = node;
                                                count$iv$iv2 = count$iv$iv;
                                            }
                                        } else {
                                            includeSelf$iv3 = includeSelf$iv4;
                                        }
                                        node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                        includeSelf$iv4 = includeSelf$iv3;
                                    }
                                    Modifier.Node node4 = node2;
                                    includeSelf$iv2 = includeSelf$iv4;
                                    if (count$iv$iv2 != 1) {
                                        result = result2;
                                    } else {
                                        result = result2;
                                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                                        node2 = node4;
                                        includeSelf$iv4 = includeSelf$iv2;
                                    }
                                }
                            }
                            node2 = pop(stack$iv$iv);
                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                            includeSelf$iv4 = includeSelf$iv2;
                        }
                    }
                    node$iv$iv = node$iv$iv.getParent$ui_release();
                    z3 = z2;
                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                    includeSelf$iv4 = includeSelf$iv4;
                }
                z = z3;
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                includeSelf$iv = includeSelf$iv4;
            }
            layout$iv$iv = layout$iv$iv.getParent$ui_release();
            node$iv$iv = (layout$iv$iv == null || (nodes$ui_release = layout$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
            z3 = z;
            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
            includeSelf$iv4 = includeSelf$iv;
        }
        return (List) result;
    }

    /* renamed from: nearestAncestor-64DMado */
    public static final /* synthetic */ <T> T m5758nearestAncestor64DMado(DelegatableNode $this$nearestAncestor_u2d64DMado, int type) {
        int i;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
        boolean includeSelf$iv;
        int i2;
        int mask$iv$iv;
        Modifier.Node node;
        NodeChain nodes$ui_release;
        int i3;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
        boolean includeSelf$iv2;
        int i4;
        int mask$iv$iv2;
        boolean includeSelf$iv3;
        int i5;
        int mask$iv$iv3;
        boolean includeSelf$iv4;
        int i6;
        int mask$iv$iv4;
        int count$iv$iv;
        int i7 = 0;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$nearestAncestor_u2d64DMado;
        boolean includeSelf$iv5 = false;
        int i8 = 0;
        int mask$iv$iv5 = type;
        boolean value$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3.getNode().getParent$ui_release();
        LayoutNode layout$iv$iv = requireLayoutNode($this$visitAncestors_u2dY_u2dYKmho_u24default$iv3);
        while (layout$iv$iv != null) {
            Modifier.Node head$iv$iv = layout$iv$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv$iv.getAggregateChildKindSet$ui_release() & mask$iv$iv5) == 0) {
                i = i7;
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                includeSelf$iv = includeSelf$iv5;
                i2 = i8;
                mask$iv$iv = mask$iv$iv5;
                node = null;
            } else {
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & mask$iv$iv5) == 0) {
                        i3 = i7;
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                        includeSelf$iv2 = includeSelf$iv5;
                        i4 = i8;
                        mask$iv$iv2 = mask$iv$iv5;
                    } else {
                        Object it$iv = node$iv$iv;
                        Object stack$iv$iv = null;
                        Object node$iv$iv2 = it$iv;
                        while (node$iv$iv2 != null) {
                            int i9 = i7;
                            DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                            Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                            if (node$iv$iv2 instanceof Object) {
                                return (T) node$iv$iv2;
                            }
                            Object it = node$iv$iv2;
                            Modifier.Node this_$iv$iv$iv = (Modifier.Node) it;
                            if (((this_$iv$iv$iv.getKindSet$ui_release() & type) != 0 ? 1 : 0) == 0 || !(node$iv$iv2 instanceof DelegatingNode)) {
                                includeSelf$iv3 = includeSelf$iv5;
                                i5 = i8;
                                mask$iv$iv3 = mask$iv$iv5;
                            } else {
                                int count$iv$iv2 = 0;
                                DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node$iv$iv2;
                                Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                while (node$iv$iv$iv != null) {
                                    Modifier.Node next$iv$iv = node$iv$iv$iv;
                                    if (!((next$iv$iv.getKindSet$ui_release() & type) != 0)) {
                                        includeSelf$iv4 = includeSelf$iv5;
                                        i6 = i8;
                                        mask$iv$iv4 = mask$iv$iv5;
                                    } else {
                                        count$iv$iv2++;
                                        includeSelf$iv4 = includeSelf$iv5;
                                        if (count$iv$iv2 == 1) {
                                            node$iv$iv2 = next$iv$iv;
                                            i6 = i8;
                                            mask$iv$iv4 = mask$iv$iv5;
                                        } else {
                                            Object obj = (MutableVector) stack$iv$iv;
                                            if (obj != null) {
                                                count$iv$iv = count$iv$iv2;
                                                i6 = i8;
                                                mask$iv$iv4 = mask$iv$iv5;
                                            } else {
                                                count$iv$iv = count$iv$iv2;
                                                i6 = i8;
                                                mask$iv$iv4 = mask$iv$iv5;
                                                obj = new MutableVector(new Modifier.Node[16], 0);
                                                MutableVector mutableVector = (MutableVector) obj;
                                            }
                                            stack$iv$iv = obj;
                                            Modifier.Node theNode$iv$iv = (Modifier.Node) node$iv$iv2;
                                            if (theNode$iv$iv != null) {
                                                MutableVector mutableVector2 = (MutableVector) stack$iv$iv;
                                                if (mutableVector2 != null) {
                                                    mutableVector2.add(theNode$iv$iv);
                                                }
                                                node$iv$iv2 = null;
                                            }
                                            MutableVector mutableVector3 = (MutableVector) stack$iv$iv;
                                            if (mutableVector3 != null) {
                                                mutableVector3.add(next$iv$iv);
                                            }
                                            count$iv$iv2 = count$iv$iv;
                                        }
                                    }
                                    node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                    includeSelf$iv5 = includeSelf$iv4;
                                    i8 = i6;
                                    mask$iv$iv5 = mask$iv$iv4;
                                }
                                includeSelf$iv3 = includeSelf$iv5;
                                i5 = i8;
                                mask$iv$iv3 = mask$iv$iv5;
                                if (count$iv$iv2 == 1) {
                                    i7 = i9;
                                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                                    includeSelf$iv5 = includeSelf$iv3;
                                    i8 = i5;
                                    mask$iv$iv5 = mask$iv$iv3;
                                }
                            }
                            node$iv$iv2 = pop((MutableVector) stack$iv$iv);
                            i7 = i9;
                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                            includeSelf$iv5 = includeSelf$iv3;
                            i8 = i5;
                            mask$iv$iv5 = mask$iv$iv3;
                        }
                        i3 = i7;
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                        includeSelf$iv2 = includeSelf$iv5;
                        i4 = i8;
                        mask$iv$iv2 = mask$iv$iv5;
                    }
                    node$iv$iv = node$iv$iv.getParent$ui_release();
                    i7 = i3;
                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                    includeSelf$iv5 = includeSelf$iv2;
                    i8 = i4;
                    mask$iv$iv5 = mask$iv$iv2;
                }
                i = i7;
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                includeSelf$iv = includeSelf$iv5;
                i2 = i8;
                mask$iv$iv = mask$iv$iv5;
                node = null;
            }
            layout$iv$iv = layout$iv$iv.getParent$ui_release();
            node$iv$iv = (layout$iv$iv == null || (nodes$ui_release = layout$iv$iv.getNodes$ui_release()) == null) ? node : nodes$ui_release.getTail$ui_release();
            i7 = i;
            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
            includeSelf$iv5 = includeSelf$iv;
            i8 = i2;
            mask$iv$iv5 = mask$iv$iv;
        }
        return null;
    }

    /* renamed from: visitChildren-Y-YKmho$default */
    public static /* synthetic */ void m5763visitChildrenYYKmho$default(DelegatableNode $this$visitChildren_u2dY_u2dYKmho_u24default, int type, boolean zOrder, Function1 block, int i, Object obj) {
        boolean zOrder2;
        int i2;
        int mask$iv;
        DelegatableNode $this$visitChildren$iv;
        boolean z;
        int i3;
        int mask$iv2;
        DelegatableNode $this$visitChildren$iv2;
        Object obj2;
        if ((i & 2) == 0) {
            zOrder2 = zOrder;
        } else {
            zOrder2 = false;
        }
        int i4 = 0;
        int mask$iv3 = type;
        DelegatableNode $this$visitChildren$iv3 = $this$visitChildren_u2dY_u2dYKmho_u24default;
        boolean value$iv$iv = $this$visitChildren$iv3.getNode().isAttached();
        if (!value$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitChildren called on an unattached node");
        }
        boolean z2 = false;
        MutableVector branches$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv = $this$visitChildren$iv3.getNode().getChild$ui_release();
        if (child$iv == null) {
            addLayoutNodeChildren(branches$iv, $this$visitChildren$iv3.getNode(), zOrder2);
        } else {
            branches$iv.add(child$iv);
        }
        while (true) {
            if (!(branches$iv.getSize() != 0 ? true : z2)) {
                return;
            }
            Modifier.Node branch$iv = (Modifier.Node) branches$iv.removeAt(branches$iv.getSize() - 1);
            if ((branch$iv.getAggregateChildKindSet$ui_release() & mask$iv3) == 0) {
                addLayoutNodeChildren(branches$iv, branch$iv, zOrder2);
            } else {
                Modifier.Node node$iv = branch$iv;
                while (true) {
                    if (node$iv == null) {
                        i4 = i4;
                        break;
                    } else if ((node$iv.getKindSet$ui_release() & mask$iv3) != 0) {
                        Modifier.Node it = node$iv;
                        Object stack$iv = null;
                        Modifier.Node node = it;
                        while (node != null) {
                            boolean zOrder3 = zOrder2;
                            Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                            if (node instanceof Object) {
                                block.invoke(node);
                                i2 = i4;
                                mask$iv = mask$iv3;
                                $this$visitChildren$iv = $this$visitChildren$iv3;
                                z = true;
                            } else {
                                Modifier.Node this_$iv$iv = node;
                                if (!((this_$iv$iv.getKindSet$ui_release() & type) != 0) || !(node instanceof DelegatingNode)) {
                                    i2 = i4;
                                    mask$iv = mask$iv3;
                                    $this$visitChildren$iv = $this$visitChildren$iv3;
                                    z = true;
                                } else {
                                    int count$iv = 0;
                                    DelegatingNode this_$iv$iv2 = (DelegatingNode) node;
                                    Modifier.Node node$iv$iv = this_$iv$iv2.getDelegate$ui_release();
                                    while (node$iv$iv != null) {
                                        Modifier.Node next$iv = node$iv$iv;
                                        if (!((next$iv.getKindSet$ui_release() & type) != 0)) {
                                            i3 = i4;
                                            mask$iv2 = mask$iv3;
                                            $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                        } else {
                                            count$iv++;
                                            i3 = i4;
                                            if (count$iv == 1) {
                                                node = next$iv;
                                                mask$iv2 = mask$iv3;
                                                $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                            } else {
                                                Object obj3 = (MutableVector) stack$iv;
                                                if (obj3 == null) {
                                                    mask$iv2 = mask$iv3;
                                                    $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                                    obj2 = new MutableVector(new Modifier.Node[16], 0);
                                                    MutableVector mutableVector = (MutableVector) obj2;
                                                } else {
                                                    mask$iv2 = mask$iv3;
                                                    $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                                    obj2 = obj3;
                                                }
                                                stack$iv = obj2;
                                                Modifier.Node theNode$iv = node;
                                                if (theNode$iv != null) {
                                                    MutableVector mutableVector2 = (MutableVector) stack$iv;
                                                    if (mutableVector2 != null) {
                                                        mutableVector2.add(theNode$iv);
                                                    }
                                                    node = null;
                                                }
                                                MutableVector mutableVector3 = (MutableVector) stack$iv;
                                                if (mutableVector3 != null) {
                                                    mutableVector3.add(next$iv);
                                                }
                                            }
                                        }
                                        node$iv$iv = node$iv$iv.getChild$ui_release();
                                        i4 = i3;
                                        mask$iv3 = mask$iv2;
                                        $this$visitChildren$iv3 = $this$visitChildren$iv2;
                                    }
                                    i2 = i4;
                                    mask$iv = mask$iv3;
                                    $this$visitChildren$iv = $this$visitChildren$iv3;
                                    z = true;
                                    if (count$iv == 1) {
                                        i4 = i2;
                                        zOrder2 = zOrder3;
                                        mask$iv3 = mask$iv;
                                        $this$visitChildren$iv3 = $this$visitChildren$iv;
                                    }
                                }
                            }
                            node = pop((MutableVector) stack$iv);
                            i4 = i2;
                            zOrder2 = zOrder3;
                            mask$iv3 = mask$iv;
                            $this$visitChildren$iv3 = $this$visitChildren$iv;
                        }
                        z2 = false;
                        i4 = i4;
                    } else {
                        node$iv = node$iv.getChild$ui_release();
                        zOrder2 = zOrder2;
                        i4 = i4;
                    }
                }
            }
        }
    }

    /* renamed from: visitChildren-Y-YKmho */
    public static final /* synthetic */ <T> void m5762visitChildrenYYKmho(DelegatableNode $this$visitChildren_u2dY_u2dYKmho, int type, boolean zOrder, Function1<? super T, Unit> function1) {
        int i;
        int mask$iv;
        DelegatableNode $this$visitChildren$iv;
        boolean z;
        int i2;
        int mask$iv2;
        DelegatableNode $this$visitChildren$iv2;
        Object obj;
        boolean z2 = zOrder;
        int i3 = 0;
        int mask$iv3 = type;
        DelegatableNode $this$visitChildren$iv3 = $this$visitChildren_u2dY_u2dYKmho;
        boolean value$iv$iv = $this$visitChildren$iv3.getNode().isAttached();
        if (!value$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitChildren called on an unattached node");
        }
        boolean z3 = false;
        MutableVector branches$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv = $this$visitChildren$iv3.getNode().getChild$ui_release();
        if (child$iv == null) {
            addLayoutNodeChildren(branches$iv, $this$visitChildren$iv3.getNode(), z2);
        } else {
            branches$iv.add(child$iv);
        }
        while (true) {
            if (!(branches$iv.getSize() != 0 ? true : z3)) {
                return;
            }
            Modifier.Node branch$iv = (Modifier.Node) branches$iv.removeAt(branches$iv.getSize() - 1);
            if ((branch$iv.getAggregateChildKindSet$ui_release() & mask$iv3) == 0) {
                addLayoutNodeChildren(branches$iv, branch$iv, z2);
            } else {
                Modifier.Node node$iv = branch$iv;
                while (true) {
                    if (node$iv == null) {
                        z2 = zOrder;
                        i3 = i3;
                        break;
                    } else if ((node$iv.getKindSet$ui_release() & mask$iv3) != 0) {
                        Object it = node$iv;
                        Object stack$iv = null;
                        Object node$iv2 = it;
                        while (node$iv2 != null) {
                            Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                            if (node$iv2 instanceof Object) {
                                function1.invoke(node$iv2);
                                i = i3;
                                mask$iv = mask$iv3;
                                $this$visitChildren$iv = $this$visitChildren$iv3;
                                z = true;
                            } else {
                                Modifier.Node this_$iv$iv = (Modifier.Node) node$iv2;
                                if (!((this_$iv$iv.getKindSet$ui_release() & type) != 0) || !(node$iv2 instanceof DelegatingNode)) {
                                    i = i3;
                                    mask$iv = mask$iv3;
                                    $this$visitChildren$iv = $this$visitChildren$iv3;
                                    z = true;
                                } else {
                                    int count$iv = 0;
                                    DelegatingNode this_$iv$iv2 = (DelegatingNode) node$iv2;
                                    Modifier.Node node$iv$iv = this_$iv$iv2.getDelegate$ui_release();
                                    while (node$iv$iv != null) {
                                        Modifier.Node next$iv = node$iv$iv;
                                        if (!((next$iv.getKindSet$ui_release() & type) != 0)) {
                                            i2 = i3;
                                            mask$iv2 = mask$iv3;
                                            $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                        } else {
                                            count$iv++;
                                            i2 = i3;
                                            if (count$iv == 1) {
                                                node$iv2 = next$iv;
                                                mask$iv2 = mask$iv3;
                                                $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                            } else {
                                                Object obj2 = (MutableVector) stack$iv;
                                                if (obj2 == null) {
                                                    mask$iv2 = mask$iv3;
                                                    $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                                    obj = new MutableVector(new Modifier.Node[16], 0);
                                                    MutableVector mutableVector = (MutableVector) obj;
                                                } else {
                                                    mask$iv2 = mask$iv3;
                                                    $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                                    obj = obj2;
                                                }
                                                stack$iv = obj;
                                                Modifier.Node theNode$iv = (Modifier.Node) node$iv2;
                                                if (theNode$iv != null) {
                                                    MutableVector mutableVector2 = (MutableVector) stack$iv;
                                                    if (mutableVector2 != null) {
                                                        mutableVector2.add(theNode$iv);
                                                    }
                                                    node$iv2 = null;
                                                }
                                                MutableVector mutableVector3 = (MutableVector) stack$iv;
                                                if (mutableVector3 != null) {
                                                    mutableVector3.add(next$iv);
                                                }
                                            }
                                        }
                                        node$iv$iv = node$iv$iv.getChild$ui_release();
                                        i3 = i2;
                                        mask$iv3 = mask$iv2;
                                        $this$visitChildren$iv3 = $this$visitChildren$iv2;
                                    }
                                    i = i3;
                                    mask$iv = mask$iv3;
                                    $this$visitChildren$iv = $this$visitChildren$iv3;
                                    z = true;
                                    if (count$iv == 1) {
                                        i3 = i;
                                        mask$iv3 = mask$iv;
                                        $this$visitChildren$iv3 = $this$visitChildren$iv;
                                    }
                                }
                            }
                            node$iv2 = pop((MutableVector) stack$iv);
                            i3 = i;
                            mask$iv3 = mask$iv;
                            $this$visitChildren$iv3 = $this$visitChildren$iv;
                        }
                        z2 = zOrder;
                        z3 = false;
                        i3 = i3;
                    } else {
                        node$iv = node$iv.getChild$ui_release();
                        i3 = i3;
                    }
                }
            }
        }
    }

    /* renamed from: visitSelfAndChildren-Y-YKmho$default */
    public static /* synthetic */ void m5768visitSelfAndChildrenYYKmho$default(DelegatableNode $this$visitSelfAndChildren_u2dY_u2dYKmho_u24default, int type, boolean zOrder, Function1 block, int i, Object obj) {
        boolean zOrder2;
        int count$iv;
        boolean z;
        boolean zOrder3;
        int mask$iv;
        DelegatableNode $this$visitChildren$iv;
        boolean zOrder4;
        int mask$iv2;
        DelegatableNode $this$visitChildren$iv2;
        Object obj2;
        boolean z2;
        Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv;
        boolean z3;
        Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv2;
        Function1 function1 = block;
        if ((i & 2) == 0) {
            zOrder2 = zOrder;
        } else {
            zOrder2 = false;
        }
        boolean z4 = false;
        Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv3 = $this$visitSelfAndChildren_u2dY_u2dYKmho_u24default.getNode();
        Object stack$iv = null;
        Modifier.Node node = $this$dispatchForKind_u2d6rFNWt0$iv3;
        while (true) {
            count$iv = 3;
            z = false;
            int i2 = 1;
            if (node == null) {
                break;
            }
            Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
            if (node instanceof Object) {
                function1.invoke(node);
                z2 = z4;
                $this$dispatchForKind_u2d6rFNWt0$iv = $this$dispatchForKind_u2d6rFNWt0$iv3;
            } else {
                Modifier.Node this_$iv$iv = node;
                Modifier.Node this_$iv$iv2 = (this_$iv$iv.getKindSet$ui_release() & type) != 0 ? 1 : null;
                if (this_$iv$iv2 == null || !(node instanceof DelegatingNode)) {
                    z2 = z4;
                    $this$dispatchForKind_u2d6rFNWt0$iv = $this$dispatchForKind_u2d6rFNWt0$iv3;
                } else {
                    int count$iv2 = 0;
                    DelegatingNode this_$iv$iv3 = (DelegatingNode) node;
                    Modifier.Node node$iv$iv = this_$iv$iv3.getDelegate$ui_release();
                    while (node$iv$iv != null) {
                        Modifier.Node next$iv = node$iv$iv;
                        if (((next$iv.getKindSet$ui_release() & type) != 0 ? i2 : 0) == 0) {
                            z3 = z4;
                            $this$dispatchForKind_u2d6rFNWt0$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv3;
                        } else {
                            count$iv2++;
                            if (count$iv2 == i2) {
                                node = next$iv;
                                z3 = z4;
                                $this$dispatchForKind_u2d6rFNWt0$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv3;
                            } else {
                                Object obj3 = (MutableVector) stack$iv;
                                if (obj3 != null) {
                                    z3 = z4;
                                    $this$dispatchForKind_u2d6rFNWt0$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv3;
                                } else {
                                    z3 = z4;
                                    $this$dispatchForKind_u2d6rFNWt0$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv3;
                                    Object mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                    MutableVector mutableVector2 = (MutableVector) mutableVector;
                                    obj3 = mutableVector;
                                }
                                stack$iv = obj3;
                                Modifier.Node theNode$iv = node;
                                if (theNode$iv != null) {
                                    MutableVector mutableVector3 = (MutableVector) stack$iv;
                                    if (mutableVector3 != null) {
                                        mutableVector3.add(theNode$iv);
                                    }
                                    node = null;
                                }
                                MutableVector mutableVector4 = (MutableVector) stack$iv;
                                if (mutableVector4 != null) {
                                    mutableVector4.add(next$iv);
                                }
                            }
                        }
                        node$iv$iv = node$iv$iv.getChild$ui_release();
                        z4 = z3;
                        $this$dispatchForKind_u2d6rFNWt0$iv3 = $this$dispatchForKind_u2d6rFNWt0$iv2;
                        i2 = 1;
                    }
                    z2 = z4;
                    $this$dispatchForKind_u2d6rFNWt0$iv = $this$dispatchForKind_u2d6rFNWt0$iv3;
                    if (count$iv2 == 1) {
                        z4 = z2;
                        $this$dispatchForKind_u2d6rFNWt0$iv3 = $this$dispatchForKind_u2d6rFNWt0$iv;
                    }
                }
            }
            node = pop((MutableVector) stack$iv);
            z4 = z2;
            $this$dispatchForKind_u2d6rFNWt0$iv3 = $this$dispatchForKind_u2d6rFNWt0$iv;
        }
        int mask$iv3 = type;
        DelegatableNode $this$visitChildren$iv3 = $this$visitSelfAndChildren_u2dY_u2dYKmho_u24default;
        boolean value$iv$iv = $this$visitChildren$iv3.getNode().isAttached();
        if (!value$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitChildren called on an unattached node");
        }
        MutableVector branches$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv = $this$visitChildren$iv3.getNode().getChild$ui_release();
        if (child$iv == null) {
            addLayoutNodeChildren(branches$iv, $this$visitChildren$iv3.getNode(), zOrder2);
        } else {
            branches$iv.add(child$iv);
        }
        while (true) {
            if (!(branches$iv.getSize() != 0 ? true : z)) {
                return;
            }
            Modifier.Node branch$iv = (Modifier.Node) branches$iv.removeAt(branches$iv.getSize() - 1);
            if ((branch$iv.getAggregateChildKindSet$ui_release() & mask$iv3) == 0) {
                addLayoutNodeChildren(branches$iv, branch$iv, zOrder2);
            } else {
                Modifier.Node node$iv = branch$iv;
                while (true) {
                    if (node$iv == null) {
                        function1 = block;
                        zOrder2 = zOrder2;
                        mask$iv3 = mask$iv3;
                        count$iv = 3;
                        break;
                    } else if ((node$iv.getKindSet$ui_release() & mask$iv3) != 0) {
                        Modifier.Node it = node$iv;
                        Object stack$iv2 = null;
                        Modifier.Node node2 = it;
                        while (node2 != null) {
                            Intrinsics.reifiedOperationMarker(count$iv, ExifInterface.GPS_DIRECTION_TRUE);
                            if (node2 instanceof Object) {
                                function1.invoke(node2);
                                zOrder3 = zOrder2;
                                mask$iv = mask$iv3;
                                $this$visitChildren$iv = $this$visitChildren$iv3;
                            } else {
                                Modifier.Node this_$iv$iv4 = node2;
                                if (!((this_$iv$iv4.getKindSet$ui_release() & type) != 0) || !(node2 instanceof DelegatingNode)) {
                                    zOrder3 = zOrder2;
                                    mask$iv = mask$iv3;
                                    $this$visitChildren$iv = $this$visitChildren$iv3;
                                } else {
                                    int count$iv3 = 0;
                                    DelegatingNode this_$iv$iv5 = (DelegatingNode) node2;
                                    Modifier.Node node$iv$iv2 = this_$iv$iv5.getDelegate$ui_release();
                                    while (node$iv$iv2 != null) {
                                        Modifier.Node next$iv2 = node$iv$iv2;
                                        if (!((next$iv2.getKindSet$ui_release() & type) != 0)) {
                                            zOrder4 = zOrder2;
                                            mask$iv2 = mask$iv3;
                                            $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                        } else {
                                            count$iv3++;
                                            zOrder4 = zOrder2;
                                            if (count$iv3 == 1) {
                                                node2 = next$iv2;
                                                mask$iv2 = mask$iv3;
                                                $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                            } else {
                                                Object obj4 = (MutableVector) stack$iv2;
                                                if (obj4 != null) {
                                                    mask$iv2 = mask$iv3;
                                                    $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                                    obj2 = obj4;
                                                } else {
                                                    mask$iv2 = mask$iv3;
                                                    $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                                    obj2 = new MutableVector(new Modifier.Node[16], 0);
                                                    MutableVector mutableVector5 = (MutableVector) obj2;
                                                }
                                                stack$iv2 = obj2;
                                                Modifier.Node theNode$iv2 = node2;
                                                if (theNode$iv2 != null) {
                                                    MutableVector mutableVector6 = (MutableVector) stack$iv2;
                                                    if (mutableVector6 != null) {
                                                        mutableVector6.add(theNode$iv2);
                                                    }
                                                    node2 = null;
                                                }
                                                MutableVector mutableVector7 = (MutableVector) stack$iv2;
                                                if (mutableVector7 != null) {
                                                    mutableVector7.add(next$iv2);
                                                }
                                            }
                                        }
                                        node$iv$iv2 = node$iv$iv2.getChild$ui_release();
                                        zOrder2 = zOrder4;
                                        mask$iv3 = mask$iv2;
                                        $this$visitChildren$iv3 = $this$visitChildren$iv2;
                                    }
                                    zOrder3 = zOrder2;
                                    mask$iv = mask$iv3;
                                    $this$visitChildren$iv = $this$visitChildren$iv3;
                                    if (count$iv3 == 1) {
                                        function1 = block;
                                        zOrder2 = zOrder3;
                                        mask$iv3 = mask$iv;
                                        $this$visitChildren$iv3 = $this$visitChildren$iv;
                                        count$iv = 3;
                                    }
                                }
                            }
                            node2 = pop((MutableVector) stack$iv2);
                            function1 = block;
                            zOrder2 = zOrder3;
                            mask$iv3 = mask$iv;
                            $this$visitChildren$iv3 = $this$visitChildren$iv;
                            count$iv = 3;
                        }
                        function1 = block;
                        z = false;
                        zOrder2 = zOrder2;
                        mask$iv3 = mask$iv3;
                        count$iv = 3;
                    } else {
                        node$iv = node$iv.getChild$ui_release();
                        function1 = block;
                        zOrder2 = zOrder2;
                        mask$iv3 = mask$iv3;
                        count$iv = 3;
                    }
                }
            }
        }
    }

    /* renamed from: visitSelfAndChildren-Y-YKmho */
    public static final /* synthetic */ <T> void m5767visitSelfAndChildrenYYKmho(DelegatableNode $this$visitSelfAndChildren_u2dY_u2dYKmho, int type, boolean zOrder, Function1<? super T, Unit> function1) {
        int count$iv;
        boolean z;
        int mask$iv;
        DelegatableNode $this$visitChildren$iv;
        int mask$iv2;
        DelegatableNode $this$visitChildren$iv2;
        Object obj;
        boolean z2;
        Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv;
        boolean z3;
        Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv2;
        boolean z4 = zOrder;
        Function1<? super T, Unit> function12 = function1;
        boolean z5 = false;
        Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv3 = $this$visitSelfAndChildren_u2dY_u2dYKmho.getNode();
        Object stack$iv = null;
        Modifier.Node node$iv = $this$dispatchForKind_u2d6rFNWt0$iv3;
        while (true) {
            count$iv = 3;
            z = false;
            int i = 1;
            if (node$iv == null) {
                break;
            }
            Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
            if (node$iv instanceof Object) {
                function12.invoke(node$iv);
                z2 = z5;
                $this$dispatchForKind_u2d6rFNWt0$iv = $this$dispatchForKind_u2d6rFNWt0$iv3;
            } else {
                Modifier.Node this_$iv$iv = node$iv;
                Modifier.Node this_$iv$iv2 = (this_$iv$iv.getKindSet$ui_release() & type) != 0 ? 1 : null;
                if (this_$iv$iv2 == null || !(node$iv instanceof DelegatingNode)) {
                    z2 = z5;
                    $this$dispatchForKind_u2d6rFNWt0$iv = $this$dispatchForKind_u2d6rFNWt0$iv3;
                } else {
                    int count$iv2 = 0;
                    DelegatingNode this_$iv$iv3 = (DelegatingNode) node$iv;
                    Modifier.Node node$iv$iv = this_$iv$iv3.getDelegate$ui_release();
                    while (node$iv$iv != null) {
                        Modifier.Node next$iv = node$iv$iv;
                        if (((next$iv.getKindSet$ui_release() & type) != 0 ? i : 0) == 0) {
                            z3 = z5;
                            $this$dispatchForKind_u2d6rFNWt0$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv3;
                        } else {
                            count$iv2++;
                            if (count$iv2 == i) {
                                node$iv = next$iv;
                                z3 = z5;
                                $this$dispatchForKind_u2d6rFNWt0$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv3;
                            } else {
                                Object obj2 = (MutableVector) stack$iv;
                                if (obj2 != null) {
                                    z3 = z5;
                                    $this$dispatchForKind_u2d6rFNWt0$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv3;
                                } else {
                                    z3 = z5;
                                    $this$dispatchForKind_u2d6rFNWt0$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv3;
                                    Object mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                    MutableVector mutableVector2 = (MutableVector) mutableVector;
                                    obj2 = mutableVector;
                                }
                                stack$iv = obj2;
                                Modifier.Node theNode$iv = node$iv;
                                if (theNode$iv != null) {
                                    MutableVector mutableVector3 = (MutableVector) stack$iv;
                                    if (mutableVector3 != null) {
                                        mutableVector3.add(theNode$iv);
                                    }
                                    node$iv = null;
                                }
                                MutableVector mutableVector4 = (MutableVector) stack$iv;
                                if (mutableVector4 != null) {
                                    mutableVector4.add(next$iv);
                                }
                            }
                        }
                        node$iv$iv = node$iv$iv.getChild$ui_release();
                        z5 = z3;
                        $this$dispatchForKind_u2d6rFNWt0$iv3 = $this$dispatchForKind_u2d6rFNWt0$iv2;
                        i = 1;
                    }
                    z2 = z5;
                    $this$dispatchForKind_u2d6rFNWt0$iv = $this$dispatchForKind_u2d6rFNWt0$iv3;
                    if (count$iv2 == 1) {
                        z5 = z2;
                        $this$dispatchForKind_u2d6rFNWt0$iv3 = $this$dispatchForKind_u2d6rFNWt0$iv;
                    }
                }
            }
            node$iv = pop((MutableVector) stack$iv);
            z5 = z2;
            $this$dispatchForKind_u2d6rFNWt0$iv3 = $this$dispatchForKind_u2d6rFNWt0$iv;
        }
        int mask$iv3 = type;
        DelegatableNode $this$visitChildren$iv3 = $this$visitSelfAndChildren_u2dY_u2dYKmho;
        boolean value$iv$iv = $this$visitChildren$iv3.getNode().isAttached();
        if (!value$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitChildren called on an unattached node");
        }
        MutableVector branches$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv = $this$visitChildren$iv3.getNode().getChild$ui_release();
        if (child$iv == null) {
            addLayoutNodeChildren(branches$iv, $this$visitChildren$iv3.getNode(), z4);
        } else {
            branches$iv.add(child$iv);
        }
        while (true) {
            if (!(branches$iv.getSize() != 0 ? true : z)) {
                return;
            }
            Modifier.Node branch$iv = (Modifier.Node) branches$iv.removeAt(branches$iv.getSize() - 1);
            if ((branch$iv.getAggregateChildKindSet$ui_release() & mask$iv3) == 0) {
                addLayoutNodeChildren(branches$iv, branch$iv, z4);
            } else {
                Modifier.Node node$iv2 = branch$iv;
                while (true) {
                    if (node$iv2 == null) {
                        z4 = zOrder;
                        mask$iv3 = mask$iv3;
                        count$iv = 3;
                        function12 = function1;
                        break;
                    } else if ((node$iv2.getKindSet$ui_release() & mask$iv3) != 0) {
                        Object it = node$iv2;
                        Object stack$iv2 = null;
                        Object node$iv3 = it;
                        while (node$iv3 != null) {
                            Intrinsics.reifiedOperationMarker(count$iv, ExifInterface.GPS_DIRECTION_TRUE);
                            if (node$iv3 instanceof Object) {
                                function12.invoke(node$iv3);
                                mask$iv = mask$iv3;
                                $this$visitChildren$iv = $this$visitChildren$iv3;
                            } else {
                                Modifier.Node this_$iv$iv4 = (Modifier.Node) node$iv3;
                                if (!((this_$iv$iv4.getKindSet$ui_release() & type) != 0) || !(node$iv3 instanceof DelegatingNode)) {
                                    mask$iv = mask$iv3;
                                    $this$visitChildren$iv = $this$visitChildren$iv3;
                                } else {
                                    int count$iv3 = 0;
                                    DelegatingNode this_$iv$iv5 = (DelegatingNode) node$iv3;
                                    Modifier.Node node$iv$iv2 = this_$iv$iv5.getDelegate$ui_release();
                                    while (node$iv$iv2 != null) {
                                        Modifier.Node next$iv2 = node$iv$iv2;
                                        if (!((next$iv2.getKindSet$ui_release() & type) != 0)) {
                                            mask$iv2 = mask$iv3;
                                            $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                        } else {
                                            count$iv3++;
                                            if (count$iv3 == 1) {
                                                node$iv3 = next$iv2;
                                                mask$iv2 = mask$iv3;
                                                $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                            } else {
                                                Object obj3 = (MutableVector) stack$iv2;
                                                if (obj3 != null) {
                                                    mask$iv2 = mask$iv3;
                                                    $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                                    obj = obj3;
                                                } else {
                                                    mask$iv2 = mask$iv3;
                                                    $this$visitChildren$iv2 = $this$visitChildren$iv3;
                                                    obj = new MutableVector(new Modifier.Node[16], 0);
                                                    MutableVector mutableVector5 = (MutableVector) obj;
                                                }
                                                stack$iv2 = obj;
                                                Modifier.Node theNode$iv2 = (Modifier.Node) node$iv3;
                                                if (theNode$iv2 != null) {
                                                    MutableVector mutableVector6 = (MutableVector) stack$iv2;
                                                    if (mutableVector6 != null) {
                                                        mutableVector6.add(theNode$iv2);
                                                    }
                                                    node$iv3 = null;
                                                }
                                                MutableVector mutableVector7 = (MutableVector) stack$iv2;
                                                if (mutableVector7 != null) {
                                                    mutableVector7.add(next$iv2);
                                                }
                                            }
                                        }
                                        node$iv$iv2 = node$iv$iv2.getChild$ui_release();
                                        mask$iv3 = mask$iv2;
                                        $this$visitChildren$iv3 = $this$visitChildren$iv2;
                                    }
                                    mask$iv = mask$iv3;
                                    $this$visitChildren$iv = $this$visitChildren$iv3;
                                    if (count$iv3 == 1) {
                                        function12 = function1;
                                        mask$iv3 = mask$iv;
                                        $this$visitChildren$iv3 = $this$visitChildren$iv;
                                        count$iv = 3;
                                    }
                                }
                            }
                            node$iv3 = pop((MutableVector) stack$iv2);
                            function12 = function1;
                            mask$iv3 = mask$iv;
                            $this$visitChildren$iv3 = $this$visitChildren$iv;
                            count$iv = 3;
                        }
                        z4 = zOrder;
                        z = false;
                        mask$iv3 = mask$iv3;
                        count$iv = 3;
                        function12 = function1;
                    } else {
                        node$iv2 = node$iv2.getChild$ui_release();
                        mask$iv3 = mask$iv3;
                        count$iv = 3;
                        function12 = function1;
                    }
                }
            }
        }
    }

    /* renamed from: visitSubtreeIf-Y-YKmho$default */
    public static /* synthetic */ void m5773visitSubtreeIfYYKmho$default(DelegatableNode $this$visitSubtreeIf_u2dY_u2dYKmho_u24default, int type, boolean zOrder, Function1 block, int i, Object obj) {
        boolean zOrder2;
        int i2;
        int mask$iv;
        DelegatableNode $this$visitSubtreeIf$iv;
        int $i$f$visitSubtreeIf;
        Modifier.Node child$iv;
        MutableVector child$iv2;
        boolean z;
        boolean diveDeeper$iv;
        DelegatableNode $this$visitSubtreeIf$iv2;
        int $i$f$visitSubtreeIf2;
        Modifier.Node child$iv3;
        boolean z2;
        DelegatableNode $this$visitSubtreeIf$iv3;
        int $i$f$visitSubtreeIf3;
        Modifier.Node child$iv4;
        int count$iv;
        if ((i & 2) == 0) {
            zOrder2 = zOrder;
        } else {
            zOrder2 = false;
        }
        int count$iv2 = 0;
        int mask$iv2 = type;
        DelegatableNode $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default;
        int $i$f$visitSubtreeIf4 = 0;
        boolean value$iv$iv = $this$visitSubtreeIf$iv4.getNode().isAttached();
        if (!value$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitSubtreeIf called on an unattached node");
        }
        MutableVector child$iv5 = null;
        MutableVector branches$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv6 = $this$visitSubtreeIf$iv4.getNode().getChild$ui_release();
        if (child$iv6 == null) {
            addLayoutNodeChildren(branches$iv, $this$visitSubtreeIf$iv4.getNode(), zOrder2);
        } else {
            branches$iv.add(child$iv6);
        }
        while (true) {
            boolean z3 = true;
            MutableVector this_$iv$iv = branches$iv.getSize() != 0 ? 1 : child$iv5;
            if (this_$iv$iv == null) {
                return;
            }
            Modifier.Node branch$iv = (Modifier.Node) branches$iv.removeAt(branches$iv.getSize() - 1);
            if ((branch$iv.getAggregateChildKindSet$ui_release() & mask$iv2) != 0) {
                Modifier.Node node$iv = branch$iv;
                while (node$iv != null) {
                    if ((node$iv.getKindSet$ui_release() & mask$iv2) == 0) {
                        i2 = count$iv2;
                        mask$iv = mask$iv2;
                        $this$visitSubtreeIf$iv = $this$visitSubtreeIf$iv4;
                        $i$f$visitSubtreeIf = $i$f$visitSubtreeIf4;
                        child$iv = child$iv6;
                        child$iv2 = child$iv5;
                        z = z3;
                    } else {
                        Modifier.Node node = node$iv;
                        Object stack$iv = null;
                        Modifier.Node node2 = node;
                        while (true) {
                            if (node2 != null) {
                                i2 = count$iv2;
                                Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                                if (node2 instanceof Object) {
                                    mask$iv = mask$iv2;
                                    if (!((Boolean) block.invoke(node2)).booleanValue()) {
                                        $this$visitSubtreeIf$iv = $this$visitSubtreeIf$iv4;
                                        $i$f$visitSubtreeIf = $i$f$visitSubtreeIf4;
                                        child$iv = child$iv6;
                                        diveDeeper$iv = false;
                                        z = true;
                                        child$iv2 = null;
                                        break;
                                    }
                                    $this$visitSubtreeIf$iv2 = $this$visitSubtreeIf$iv4;
                                    $i$f$visitSubtreeIf2 = $i$f$visitSubtreeIf4;
                                    child$iv3 = child$iv6;
                                    z2 = true;
                                } else {
                                    mask$iv = mask$iv2;
                                    Modifier.Node this_$iv$iv2 = node2;
                                    if (!((this_$iv$iv2.getKindSet$ui_release() & type) != 0) || !(node2 instanceof DelegatingNode)) {
                                        $this$visitSubtreeIf$iv2 = $this$visitSubtreeIf$iv4;
                                        $i$f$visitSubtreeIf2 = $i$f$visitSubtreeIf4;
                                        child$iv3 = child$iv6;
                                        z2 = true;
                                    } else {
                                        int count$iv3 = 0;
                                        DelegatingNode this_$iv$iv3 = (DelegatingNode) node2;
                                        Modifier.Node node$iv$iv = this_$iv$iv3.getDelegate$ui_release();
                                        while (node$iv$iv != null) {
                                            Modifier.Node next$iv = node$iv$iv;
                                            if (!((next$iv.getKindSet$ui_release() & type) != 0)) {
                                                $this$visitSubtreeIf$iv3 = $this$visitSubtreeIf$iv4;
                                                $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                                child$iv4 = child$iv6;
                                            } else {
                                                count$iv3++;
                                                $this$visitSubtreeIf$iv3 = $this$visitSubtreeIf$iv4;
                                                if (count$iv3 == 1) {
                                                    node2 = next$iv;
                                                    $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                                    child$iv4 = child$iv6;
                                                } else {
                                                    Object obj2 = (MutableVector) stack$iv;
                                                    if (obj2 != null) {
                                                        count$iv = count$iv3;
                                                        $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                                        child$iv4 = child$iv6;
                                                    } else {
                                                        count$iv = count$iv3;
                                                        $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                                        child$iv4 = child$iv6;
                                                        obj2 = new MutableVector(new Modifier.Node[16], 0);
                                                        MutableVector mutableVector = (MutableVector) obj2;
                                                    }
                                                    stack$iv = obj2;
                                                    Modifier.Node theNode$iv = node2;
                                                    if (theNode$iv != null) {
                                                        MutableVector mutableVector2 = (MutableVector) stack$iv;
                                                        if (mutableVector2 != null) {
                                                            mutableVector2.add(theNode$iv);
                                                        }
                                                        node2 = null;
                                                    }
                                                    MutableVector mutableVector3 = (MutableVector) stack$iv;
                                                    if (mutableVector3 != null) {
                                                        mutableVector3.add(next$iv);
                                                    }
                                                    count$iv3 = count$iv;
                                                }
                                            }
                                            node$iv$iv = node$iv$iv.getChild$ui_release();
                                            $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv3;
                                            $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf3;
                                            child$iv6 = child$iv4;
                                        }
                                        $this$visitSubtreeIf$iv2 = $this$visitSubtreeIf$iv4;
                                        $i$f$visitSubtreeIf2 = $i$f$visitSubtreeIf4;
                                        child$iv3 = child$iv6;
                                        z2 = true;
                                        if (count$iv3 == 1) {
                                            count$iv2 = i2;
                                            z3 = true;
                                            mask$iv2 = mask$iv;
                                            $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv2;
                                            $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf2;
                                            child$iv6 = child$iv3;
                                        }
                                    }
                                }
                                node2 = pop((MutableVector) stack$iv);
                                count$iv2 = i2;
                                z3 = z2;
                                mask$iv2 = mask$iv;
                                $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv2;
                                $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf2;
                                child$iv6 = child$iv3;
                            } else {
                                i2 = count$iv2;
                                mask$iv = mask$iv2;
                                $this$visitSubtreeIf$iv = $this$visitSubtreeIf$iv4;
                                $i$f$visitSubtreeIf = $i$f$visitSubtreeIf4;
                                child$iv = child$iv6;
                                z = z3;
                                child$iv2 = null;
                                diveDeeper$iv = z;
                                break;
                            }
                        }
                        if (!diveDeeper$iv) {
                            count$iv2 = i2;
                            child$iv5 = child$iv2;
                            mask$iv2 = mask$iv;
                            $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv;
                            $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf;
                            child$iv6 = child$iv;
                            break;
                        }
                    }
                    node$iv = node$iv.getChild$ui_release();
                    count$iv2 = i2;
                    z3 = z;
                    child$iv5 = child$iv2;
                    mask$iv2 = mask$iv;
                    $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv;
                    $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf;
                    child$iv6 = child$iv;
                }
            }
            addLayoutNodeChildren(branches$iv, branch$iv, zOrder2);
            count$iv2 = count$iv2;
            child$iv5 = child$iv5;
            mask$iv2 = mask$iv2;
            $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv4;
            $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf4;
            child$iv6 = child$iv6;
        }
    }

    /* renamed from: visitSubtreeIf-Y-YKmho */
    public static final /* synthetic */ <T> void m5772visitSubtreeIfYYKmho(DelegatableNode $this$visitSubtreeIf_u2dY_u2dYKmho, int type, boolean zOrder, Function1<? super T, Boolean> function1) {
        int i;
        int mask$iv;
        DelegatableNode $this$visitSubtreeIf$iv;
        int $i$f$visitSubtreeIf;
        Modifier.Node child$iv;
        MutableVector child$iv2;
        boolean z;
        boolean diveDeeper$iv;
        DelegatableNode $this$visitSubtreeIf$iv2;
        int $i$f$visitSubtreeIf2;
        Modifier.Node child$iv3;
        boolean z2;
        DelegatableNode $this$visitSubtreeIf$iv3;
        int $i$f$visitSubtreeIf3;
        Modifier.Node child$iv4;
        int count$iv;
        int count$iv2 = 0;
        int mask$iv2 = type;
        DelegatableNode $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf_u2dY_u2dYKmho;
        int $i$f$visitSubtreeIf4 = 0;
        boolean value$iv$iv = $this$visitSubtreeIf$iv4.getNode().isAttached();
        if (!value$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitSubtreeIf called on an unattached node");
        }
        MutableVector child$iv5 = null;
        MutableVector branches$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv6 = $this$visitSubtreeIf$iv4.getNode().getChild$ui_release();
        if (child$iv6 == null) {
            addLayoutNodeChildren(branches$iv, $this$visitSubtreeIf$iv4.getNode(), zOrder);
        } else {
            branches$iv.add(child$iv6);
        }
        while (true) {
            boolean z3 = true;
            MutableVector this_$iv$iv = branches$iv.getSize() != 0 ? 1 : child$iv5;
            if (this_$iv$iv == null) {
                return;
            }
            Modifier.Node branch$iv = (Modifier.Node) branches$iv.removeAt(branches$iv.getSize() - 1);
            if ((branch$iv.getAggregateChildKindSet$ui_release() & mask$iv2) != 0) {
                Modifier.Node node$iv = branch$iv;
                while (node$iv != null) {
                    if ((node$iv.getKindSet$ui_release() & mask$iv2) == 0) {
                        i = count$iv2;
                        mask$iv = mask$iv2;
                        $this$visitSubtreeIf$iv = $this$visitSubtreeIf$iv4;
                        $i$f$visitSubtreeIf = $i$f$visitSubtreeIf4;
                        child$iv = child$iv6;
                        child$iv2 = child$iv5;
                        z = z3;
                    } else {
                        Object node = node$iv;
                        Object stack$iv = null;
                        Object node$iv2 = node;
                        while (true) {
                            if (node$iv2 != null) {
                                i = count$iv2;
                                Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                                if (node$iv2 instanceof Object) {
                                    Object it = node$iv2;
                                    mask$iv = mask$iv2;
                                    if (!function1.invoke(it).booleanValue()) {
                                        $this$visitSubtreeIf$iv = $this$visitSubtreeIf$iv4;
                                        $i$f$visitSubtreeIf = $i$f$visitSubtreeIf4;
                                        child$iv = child$iv6;
                                        z = true;
                                        child$iv2 = null;
                                        diveDeeper$iv = false;
                                        break;
                                    }
                                    $this$visitSubtreeIf$iv2 = $this$visitSubtreeIf$iv4;
                                    $i$f$visitSubtreeIf2 = $i$f$visitSubtreeIf4;
                                    child$iv3 = child$iv6;
                                    z2 = true;
                                } else {
                                    mask$iv = mask$iv2;
                                    Modifier.Node this_$iv$iv2 = (Modifier.Node) node$iv2;
                                    if (!((this_$iv$iv2.getKindSet$ui_release() & type) != 0) || !(node$iv2 instanceof DelegatingNode)) {
                                        $this$visitSubtreeIf$iv2 = $this$visitSubtreeIf$iv4;
                                        $i$f$visitSubtreeIf2 = $i$f$visitSubtreeIf4;
                                        child$iv3 = child$iv6;
                                        z2 = true;
                                    } else {
                                        int count$iv3 = 0;
                                        DelegatingNode this_$iv$iv3 = (DelegatingNode) node$iv2;
                                        Modifier.Node node$iv$iv = this_$iv$iv3.getDelegate$ui_release();
                                        while (node$iv$iv != null) {
                                            Modifier.Node next$iv = node$iv$iv;
                                            if (!((next$iv.getKindSet$ui_release() & type) != 0)) {
                                                $this$visitSubtreeIf$iv3 = $this$visitSubtreeIf$iv4;
                                                $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                                child$iv4 = child$iv6;
                                            } else {
                                                count$iv3++;
                                                $this$visitSubtreeIf$iv3 = $this$visitSubtreeIf$iv4;
                                                if (count$iv3 == 1) {
                                                    node$iv2 = next$iv;
                                                    $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                                    child$iv4 = child$iv6;
                                                } else {
                                                    Object obj = (MutableVector) stack$iv;
                                                    if (obj != null) {
                                                        count$iv = count$iv3;
                                                        $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                                        child$iv4 = child$iv6;
                                                    } else {
                                                        count$iv = count$iv3;
                                                        $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                                        child$iv4 = child$iv6;
                                                        obj = new MutableVector(new Modifier.Node[16], 0);
                                                        MutableVector mutableVector = (MutableVector) obj;
                                                    }
                                                    stack$iv = obj;
                                                    Modifier.Node theNode$iv = (Modifier.Node) node$iv2;
                                                    if (theNode$iv != null) {
                                                        MutableVector mutableVector2 = (MutableVector) stack$iv;
                                                        if (mutableVector2 != null) {
                                                            mutableVector2.add(theNode$iv);
                                                        }
                                                        node$iv2 = null;
                                                    }
                                                    MutableVector mutableVector3 = (MutableVector) stack$iv;
                                                    if (mutableVector3 != null) {
                                                        mutableVector3.add(next$iv);
                                                    }
                                                    count$iv3 = count$iv;
                                                }
                                            }
                                            node$iv$iv = node$iv$iv.getChild$ui_release();
                                            $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv3;
                                            $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf3;
                                            child$iv6 = child$iv4;
                                        }
                                        $this$visitSubtreeIf$iv2 = $this$visitSubtreeIf$iv4;
                                        $i$f$visitSubtreeIf2 = $i$f$visitSubtreeIf4;
                                        child$iv3 = child$iv6;
                                        z2 = true;
                                        if (count$iv3 == 1) {
                                            z3 = true;
                                            count$iv2 = i;
                                            mask$iv2 = mask$iv;
                                            $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv2;
                                            $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf2;
                                            child$iv6 = child$iv3;
                                        }
                                    }
                                }
                                node$iv2 = pop((MutableVector) stack$iv);
                                z3 = z2;
                                count$iv2 = i;
                                mask$iv2 = mask$iv;
                                $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv2;
                                $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf2;
                                child$iv6 = child$iv3;
                            } else {
                                i = count$iv2;
                                mask$iv = mask$iv2;
                                $this$visitSubtreeIf$iv = $this$visitSubtreeIf$iv4;
                                $i$f$visitSubtreeIf = $i$f$visitSubtreeIf4;
                                child$iv = child$iv6;
                                z = z3;
                                child$iv2 = null;
                                diveDeeper$iv = z;
                                break;
                            }
                        }
                        if (!diveDeeper$iv) {
                            child$iv5 = child$iv2;
                            count$iv2 = i;
                            mask$iv2 = mask$iv;
                            $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv;
                            $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf;
                            child$iv6 = child$iv;
                            break;
                        }
                    }
                    node$iv = node$iv.getChild$ui_release();
                    z3 = z;
                    child$iv5 = child$iv2;
                    count$iv2 = i;
                    mask$iv2 = mask$iv;
                    $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv;
                    $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf;
                    child$iv6 = child$iv;
                }
            }
            addLayoutNodeChildren(branches$iv, branch$iv, zOrder);
            child$iv5 = child$iv5;
            count$iv2 = count$iv2;
            mask$iv2 = mask$iv2;
            $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv4;
            $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf4;
            child$iv6 = child$iv6;
        }
    }

    /* renamed from: visitSubtree-Y-YKmho$default */
    public static /* synthetic */ void m5771visitSubtreeYYKmho$default(DelegatableNode $this$visitSubtree_u2dY_u2dYKmho_u24default, int type, boolean zOrder, Function1 block, int i, Object obj) {
        boolean zOrder2;
        int i2;
        int mask$iv;
        DelegatableNode $this$visitSubtreeIf$iv;
        int $i$f$visitSubtreeIf;
        MutableVector mask$iv2;
        int i3;
        int mask$iv3;
        DelegatableNode $this$visitSubtreeIf$iv2;
        int $i$f$visitSubtreeIf2;
        int mask$iv4;
        DelegatableNode $this$visitSubtreeIf$iv3;
        int $i$f$visitSubtreeIf3;
        Object obj2;
        if ((i & 2) == 0) {
            zOrder2 = zOrder;
        } else {
            zOrder2 = false;
        }
        int i4 = 0;
        int mask$iv5 = type;
        DelegatableNode $this$visitSubtreeIf$iv4 = $this$visitSubtree_u2dY_u2dYKmho_u24default;
        int $i$f$visitSubtreeIf4 = 0;
        boolean value$iv$iv = $this$visitSubtreeIf$iv4.getNode().isAttached();
        if (!value$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitSubtreeIf called on an unattached node");
        }
        MutableVector mutableVector = null;
        MutableVector branches$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv = $this$visitSubtreeIf$iv4.getNode().getChild$ui_release();
        if (child$iv == null) {
            addLayoutNodeChildren(branches$iv, $this$visitSubtreeIf$iv4.getNode(), zOrder2);
        } else {
            branches$iv.add(child$iv);
        }
        while (true) {
            int i5 = 1;
            MutableVector this_$iv$iv = branches$iv.getSize() != 0 ? 1 : mutableVector;
            if (this_$iv$iv == null) {
                return;
            }
            Modifier.Node branch$iv = (Modifier.Node) branches$iv.removeAt(branches$iv.getSize() - 1);
            if ((branch$iv.getAggregateChildKindSet$ui_release() & mask$iv5) != 0) {
                Modifier.Node node$iv = branch$iv;
                while (node$iv != null) {
                    if ((node$iv.getKindSet$ui_release() & mask$iv5) == 0) {
                        i2 = i4;
                        mask$iv = mask$iv5;
                        $this$visitSubtreeIf$iv = $this$visitSubtreeIf$iv4;
                        $i$f$visitSubtreeIf = $i$f$visitSubtreeIf4;
                        mask$iv2 = mutableVector;
                        i3 = i5;
                    } else {
                        Modifier.Node it = node$iv;
                        Object stack$iv = null;
                        Modifier.Node node = it;
                        while (node != null) {
                            int i6 = i4;
                            Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                            if (node instanceof Object) {
                                block.invoke(node);
                                mask$iv3 = mask$iv5;
                                $this$visitSubtreeIf$iv2 = $this$visitSubtreeIf$iv4;
                                $i$f$visitSubtreeIf2 = $i$f$visitSubtreeIf4;
                            } else {
                                Modifier.Node this_$iv$iv2 = node;
                                if (!((this_$iv$iv2.getKindSet$ui_release() & type) != 0) || !(node instanceof DelegatingNode)) {
                                    mask$iv3 = mask$iv5;
                                    $this$visitSubtreeIf$iv2 = $this$visitSubtreeIf$iv4;
                                    $i$f$visitSubtreeIf2 = $i$f$visitSubtreeIf4;
                                } else {
                                    int count$iv = 0;
                                    DelegatingNode this_$iv$iv3 = (DelegatingNode) node;
                                    Modifier.Node node$iv$iv = this_$iv$iv3.getDelegate$ui_release();
                                    while (node$iv$iv != null) {
                                        Modifier.Node next$iv = node$iv$iv;
                                        if (!((next$iv.getKindSet$ui_release() & type) != 0)) {
                                            mask$iv4 = mask$iv5;
                                            $this$visitSubtreeIf$iv3 = $this$visitSubtreeIf$iv4;
                                            $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                        } else {
                                            count$iv++;
                                            mask$iv4 = mask$iv5;
                                            if (count$iv == 1) {
                                                node = next$iv;
                                                $this$visitSubtreeIf$iv3 = $this$visitSubtreeIf$iv4;
                                                $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                            } else {
                                                Object obj3 = (MutableVector) stack$iv;
                                                if (obj3 != null) {
                                                    $this$visitSubtreeIf$iv3 = $this$visitSubtreeIf$iv4;
                                                    $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                                    obj2 = obj3;
                                                } else {
                                                    $this$visitSubtreeIf$iv3 = $this$visitSubtreeIf$iv4;
                                                    $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                                    obj2 = new MutableVector(new Modifier.Node[16], 0);
                                                    MutableVector mutableVector2 = (MutableVector) obj2;
                                                }
                                                stack$iv = obj2;
                                                Modifier.Node theNode$iv = node;
                                                if (theNode$iv != null) {
                                                    MutableVector mutableVector3 = (MutableVector) stack$iv;
                                                    if (mutableVector3 != null) {
                                                        mutableVector3.add(theNode$iv);
                                                    }
                                                    node = null;
                                                }
                                                MutableVector mutableVector4 = (MutableVector) stack$iv;
                                                if (mutableVector4 != null) {
                                                    mutableVector4.add(next$iv);
                                                }
                                            }
                                        }
                                        node$iv$iv = node$iv$iv.getChild$ui_release();
                                        mask$iv5 = mask$iv4;
                                        $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv3;
                                        $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf3;
                                    }
                                    mask$iv3 = mask$iv5;
                                    $this$visitSubtreeIf$iv2 = $this$visitSubtreeIf$iv4;
                                    $i$f$visitSubtreeIf2 = $i$f$visitSubtreeIf4;
                                    if (count$iv == 1) {
                                        i4 = i6;
                                        mask$iv5 = mask$iv3;
                                        $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv2;
                                        $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf2;
                                    }
                                }
                            }
                            node = pop((MutableVector) stack$iv);
                            i4 = i6;
                            mask$iv5 = mask$iv3;
                            $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv2;
                            $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf2;
                        }
                        i2 = i4;
                        mask$iv = mask$iv5;
                        $this$visitSubtreeIf$iv = $this$visitSubtreeIf$iv4;
                        $i$f$visitSubtreeIf = $i$f$visitSubtreeIf4;
                        mask$iv2 = null;
                        i3 = 1;
                        if (1 == 0) {
                            i4 = i2;
                            mutableVector = null;
                            mask$iv5 = mask$iv;
                            $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv;
                            $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf;
                            break;
                        }
                    }
                    node$iv = node$iv.getChild$ui_release();
                    i5 = i3;
                    mutableVector = mask$iv2;
                    mask$iv5 = mask$iv;
                    $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv;
                    $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf;
                    i4 = i2;
                }
            }
            int mask$iv6 = mask$iv5;
            MutableVector mask$iv7 = mutableVector;
            addLayoutNodeChildren(branches$iv, branch$iv, zOrder2);
            i4 = i4;
            mutableVector = mask$iv7;
            mask$iv5 = mask$iv6;
            $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv4;
            $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf4;
        }
    }

    /* renamed from: visitSubtree-Y-YKmho */
    public static final /* synthetic */ <T> void m5770visitSubtreeYYKmho(DelegatableNode $this$visitSubtree_u2dY_u2dYKmho, int type, boolean zOrder, Function1<? super T, Unit> function1) {
        int i;
        int mask$iv;
        DelegatableNode $this$visitSubtreeIf$iv;
        int $i$f$visitSubtreeIf;
        MutableVector mask$iv2;
        boolean z;
        int mask$iv3;
        DelegatableNode $this$visitSubtreeIf$iv2;
        int $i$f$visitSubtreeIf2;
        int mask$iv4;
        DelegatableNode $this$visitSubtreeIf$iv3;
        int $i$f$visitSubtreeIf3;
        Object obj;
        int diveDeeper$iv = 0;
        int mask$iv5 = type;
        DelegatableNode $this$visitSubtreeIf$iv4 = $this$visitSubtree_u2dY_u2dYKmho;
        int $i$f$visitSubtreeIf4 = 0;
        boolean value$iv$iv = $this$visitSubtreeIf$iv4.getNode().isAttached();
        if (!value$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitSubtreeIf called on an unattached node");
        }
        MutableVector mutableVector = null;
        MutableVector branches$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv = $this$visitSubtreeIf$iv4.getNode().getChild$ui_release();
        if (child$iv == null) {
            addLayoutNodeChildren(branches$iv, $this$visitSubtreeIf$iv4.getNode(), zOrder);
        } else {
            branches$iv.add(child$iv);
        }
        while (true) {
            boolean z2 = true;
            MutableVector this_$iv$iv = branches$iv.getSize() != 0 ? 1 : mutableVector;
            if (this_$iv$iv == null) {
                return;
            }
            Modifier.Node branch$iv = (Modifier.Node) branches$iv.removeAt(branches$iv.getSize() - 1);
            if ((branch$iv.getAggregateChildKindSet$ui_release() & mask$iv5) != 0) {
                Modifier.Node node$iv = branch$iv;
                while (node$iv != null) {
                    if ((node$iv.getKindSet$ui_release() & mask$iv5) == 0) {
                        i = diveDeeper$iv;
                        mask$iv = mask$iv5;
                        $this$visitSubtreeIf$iv = $this$visitSubtreeIf$iv4;
                        $i$f$visitSubtreeIf = $i$f$visitSubtreeIf4;
                        mask$iv2 = mutableVector;
                        z = z2;
                    } else {
                        Object it = node$iv;
                        Object stack$iv = null;
                        Object node$iv2 = it;
                        while (node$iv2 != null) {
                            int i2 = diveDeeper$iv;
                            Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                            if (node$iv2 instanceof Object) {
                                function1.invoke(node$iv2);
                                mask$iv3 = mask$iv5;
                                $this$visitSubtreeIf$iv2 = $this$visitSubtreeIf$iv4;
                                $i$f$visitSubtreeIf2 = $i$f$visitSubtreeIf4;
                            } else {
                                Modifier.Node this_$iv$iv2 = (Modifier.Node) node$iv2;
                                if (!((this_$iv$iv2.getKindSet$ui_release() & type) != 0) || !(node$iv2 instanceof DelegatingNode)) {
                                    mask$iv3 = mask$iv5;
                                    $this$visitSubtreeIf$iv2 = $this$visitSubtreeIf$iv4;
                                    $i$f$visitSubtreeIf2 = $i$f$visitSubtreeIf4;
                                } else {
                                    int count$iv = 0;
                                    DelegatingNode this_$iv$iv3 = (DelegatingNode) node$iv2;
                                    Modifier.Node node$iv$iv = this_$iv$iv3.getDelegate$ui_release();
                                    while (node$iv$iv != null) {
                                        Modifier.Node next$iv = node$iv$iv;
                                        if (!((next$iv.getKindSet$ui_release() & type) != 0)) {
                                            mask$iv4 = mask$iv5;
                                            $this$visitSubtreeIf$iv3 = $this$visitSubtreeIf$iv4;
                                            $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                        } else {
                                            count$iv++;
                                            mask$iv4 = mask$iv5;
                                            if (count$iv == 1) {
                                                node$iv2 = next$iv;
                                                $this$visitSubtreeIf$iv3 = $this$visitSubtreeIf$iv4;
                                                $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                            } else {
                                                Object obj2 = (MutableVector) stack$iv;
                                                if (obj2 != null) {
                                                    $this$visitSubtreeIf$iv3 = $this$visitSubtreeIf$iv4;
                                                    $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                                    obj = obj2;
                                                } else {
                                                    $this$visitSubtreeIf$iv3 = $this$visitSubtreeIf$iv4;
                                                    $i$f$visitSubtreeIf3 = $i$f$visitSubtreeIf4;
                                                    obj = new MutableVector(new Modifier.Node[16], 0);
                                                    MutableVector mutableVector2 = (MutableVector) obj;
                                                }
                                                stack$iv = obj;
                                                Modifier.Node theNode$iv = (Modifier.Node) node$iv2;
                                                if (theNode$iv != null) {
                                                    MutableVector mutableVector3 = (MutableVector) stack$iv;
                                                    if (mutableVector3 != null) {
                                                        mutableVector3.add(theNode$iv);
                                                    }
                                                    node$iv2 = null;
                                                }
                                                MutableVector mutableVector4 = (MutableVector) stack$iv;
                                                if (mutableVector4 != null) {
                                                    mutableVector4.add(next$iv);
                                                }
                                            }
                                        }
                                        node$iv$iv = node$iv$iv.getChild$ui_release();
                                        mask$iv5 = mask$iv4;
                                        $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv3;
                                        $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf3;
                                    }
                                    mask$iv3 = mask$iv5;
                                    $this$visitSubtreeIf$iv2 = $this$visitSubtreeIf$iv4;
                                    $i$f$visitSubtreeIf2 = $i$f$visitSubtreeIf4;
                                    if (count$iv == 1) {
                                        diveDeeper$iv = i2;
                                        mask$iv5 = mask$iv3;
                                        $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv2;
                                        $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf2;
                                    }
                                }
                            }
                            node$iv2 = pop((MutableVector) stack$iv);
                            diveDeeper$iv = i2;
                            mask$iv5 = mask$iv3;
                            $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv2;
                            $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf2;
                        }
                        i = diveDeeper$iv;
                        mask$iv = mask$iv5;
                        $this$visitSubtreeIf$iv = $this$visitSubtreeIf$iv4;
                        $i$f$visitSubtreeIf = $i$f$visitSubtreeIf4;
                        mask$iv2 = null;
                        z = true;
                        if (1 == 0) {
                            mutableVector = null;
                            diveDeeper$iv = i;
                            mask$iv5 = mask$iv;
                            $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv;
                            $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf;
                            break;
                        }
                    }
                    node$iv = node$iv.getChild$ui_release();
                    mutableVector = mask$iv2;
                    z2 = z;
                    diveDeeper$iv = i;
                    mask$iv5 = mask$iv;
                    $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv;
                    $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf;
                }
            }
            int mask$iv6 = mask$iv5;
            MutableVector mask$iv7 = mutableVector;
            addLayoutNodeChildren(branches$iv, branch$iv, zOrder);
            mutableVector = mask$iv7;
            diveDeeper$iv = diveDeeper$iv;
            mask$iv5 = mask$iv6;
            $this$visitSubtreeIf$iv4 = $this$visitSubtreeIf$iv4;
            $i$f$visitSubtreeIf4 = $i$f$visitSubtreeIf4;
        }
    }

    /* renamed from: has-64DMado */
    public static final boolean m5757has64DMado(DelegatableNode $this$has_u2d64DMado, int type) {
        return ($this$has_u2d64DMado.getNode().getAggregateChildKindSet$ui_release() & type) != 0;
    }

    /* renamed from: requireCoordinator-64DMado */
    public static final NodeCoordinator m5759requireCoordinator64DMado(DelegatableNode $this$requireCoordinator_u2d64DMado, int kind) {
        NodeCoordinator coordinator = $this$requireCoordinator_u2d64DMado.getNode().getCoordinator$ui_release();
        Intrinsics.checkNotNull(coordinator);
        if (coordinator.getTail() == $this$requireCoordinator_u2d64DMado && NodeKindKt.m5907getIncludeSelfInTraversalH91voCI(kind)) {
            NodeCoordinator wrapped$ui_release = coordinator.getWrapped$ui_release();
            Intrinsics.checkNotNull(wrapped$ui_release);
            return wrapped$ui_release;
        }
        return coordinator;
    }

    public static final LayoutNode requireLayoutNode(DelegatableNode $this$requireLayoutNode) {
        NodeCoordinator coordinator$ui_release = $this$requireLayoutNode.getNode().getCoordinator$ui_release();
        if (coordinator$ui_release != null) {
            return coordinator$ui_release.getLayoutNode();
        }
        InlineClassHelperKt.throwIllegalStateExceptionForNullCheck("Cannot obtain node coordinator. Is the Modifier.Node attached?");
        throw new KotlinNothingValueException();
    }

    public static final SemanticsInfo requireSemanticsInfo(DelegatableNode $this$requireSemanticsInfo) {
        return requireLayoutNode($this$requireSemanticsInfo);
    }

    public static final Owner requireOwner(DelegatableNode $this$requireOwner) {
        Owner owner$ui_release = requireLayoutNode($this$requireOwner).getOwner$ui_release();
        if (owner$ui_release != null) {
            return owner$ui_release;
        }
        InlineClassHelperKt.throwIllegalStateExceptionForNullCheck("This node does not have an owner.");
        throw new KotlinNothingValueException();
    }

    public static final void requestAutofill(DelegatableNode $this$requestAutofill) {
        requireLayoutNode($this$requestAutofill).requestAutofill$ui_release();
    }

    public static final Density requireDensity(DelegatableNode $this$requireDensity) {
        return requireLayoutNode($this$requireDensity).getDensity();
    }

    public static final GraphicsContext requireGraphicsContext(DelegatableNode $this$requireGraphicsContext) {
        return requireOwner($this$requireGraphicsContext).getGraphicsContext();
    }

    public static final LayoutDirection requireLayoutDirection(DelegatableNode $this$requireLayoutDirection) {
        return requireLayoutNode($this$requireLayoutDirection).getLayoutDirection();
    }

    public static final LayoutCoordinates requireLayoutCoordinates(DelegatableNode $this$requireLayoutCoordinates) {
        boolean value$iv = $this$requireLayoutCoordinates.getNode().isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("Cannot get LayoutCoordinates, Modifier.Node is not attached.");
        }
        LayoutCoordinates coordinates = m5759requireCoordinator64DMado($this$requireLayoutCoordinates, NodeKind.m5898constructorimpl(2)).getCoordinates();
        boolean value$iv2 = coordinates.isAttached();
        if (!value$iv2) {
            InlineClassHelperKt.throwIllegalStateException("LayoutCoordinates is not attached.");
        }
        return coordinates;
    }

    public static final void invalidateSubtree(DelegatableNode $this$invalidateSubtree) {
        if ($this$invalidateSubtree.getNode().isAttached()) {
            LayoutNode.invalidateSubtree$default(requireLayoutNode($this$invalidateSubtree), false, 1, null);
        }
    }

    public static final LayoutModifierNode asLayoutModifierNode(Modifier.Node $this$asLayoutModifierNode) {
        Modifier.Node child$ui_release;
        int kind$iv = ($this$asLayoutModifierNode.getKindSet$ui_release() & NodeKind.m5898constructorimpl(2)) != 0 ? 1 : 0;
        if (kind$iv == 0) {
            return null;
        }
        if ($this$asLayoutModifierNode instanceof LayoutModifierNode) {
            return (LayoutModifierNode) $this$asLayoutModifierNode;
        }
        if ($this$asLayoutModifierNode instanceof DelegatingNode) {
            Modifier.Node node = ((DelegatingNode) $this$asLayoutModifierNode).getDelegate$ui_release();
            while (node != null) {
                if (node instanceof LayoutModifierNode) {
                    return (LayoutModifierNode) node;
                }
                if (node instanceof DelegatingNode) {
                    Modifier.Node this_$iv = node;
                    int kind$iv2 = (this_$iv.getKindSet$ui_release() & NodeKind.m5898constructorimpl(2)) != 0 ? 1 : 0;
                    if (kind$iv2 != 0) {
                        child$ui_release = ((DelegatingNode) node).getDelegate$ui_release();
                        node = child$ui_release;
                    }
                }
                child$ui_release = node.getChild$ui_release();
                node = child$ui_release;
            }
        }
        return null;
    }

    /* renamed from: dispatchForKind-6rFNWt0 */
    public static final /* synthetic */ <T> void m5756dispatchForKind6rFNWt0(Modifier.Node $this$dispatchForKind_u2d6rFNWt0, int kind, Function1<? super T, Unit> function1) {
        Object stack = null;
        Object node = $this$dispatchForKind_u2d6rFNWt0;
        while (node != null) {
            Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
            if (node instanceof Object) {
                function1.invoke(node);
            } else {
                Modifier.Node this_$iv = (Modifier.Node) node;
                int i = 1;
                Modifier.Node this_$iv2 = (this_$iv.getKindSet$ui_release() & kind) != 0 ? 1 : null;
                if (this_$iv2 != null && (node instanceof DelegatingNode)) {
                    int count = 0;
                    DelegatingNode this_$iv3 = (DelegatingNode) node;
                    Modifier.Node node$iv = this_$iv3.getDelegate$ui_release();
                    while (node$iv != null) {
                        Modifier.Node next = node$iv;
                        if (((next.getKindSet$ui_release() & kind) != 0 ? i : 0) != 0) {
                            count++;
                            if (count == i) {
                                node = next;
                            } else {
                                Object obj = (MutableVector) stack;
                                if (obj == null) {
                                    Object mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                    MutableVector mutableVector2 = (MutableVector) mutableVector;
                                    obj = mutableVector;
                                }
                                stack = obj;
                                Modifier.Node theNode = (Modifier.Node) node;
                                if (theNode != null) {
                                    MutableVector mutableVector3 = (MutableVector) stack;
                                    if (mutableVector3 != null) {
                                        mutableVector3.add(theNode);
                                    }
                                    node = null;
                                }
                                MutableVector mutableVector4 = (MutableVector) stack;
                                if (mutableVector4 != null) {
                                    mutableVector4.add(next);
                                }
                            }
                        }
                        node$iv = node$iv.getChild$ui_release();
                        i = 1;
                    }
                    if (count == 1) {
                    }
                }
            }
            node = pop((MutableVector) stack);
        }
    }

    public static final Modifier.Node pop(MutableVector<Modifier.Node> mutableVector) {
        if (mutableVector != null) {
            if (!(mutableVector.getSize() == 0)) {
                return mutableVector.removeAt(mutableVector.getSize() - 1);
            }
        }
        return null;
    }
}
