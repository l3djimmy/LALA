package androidx.compose.ui.semantics;

import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.NodeChain;
import androidx.compose.ui.node.NodeKind;
import androidx.compose.ui.node.SemanticsModifierNode;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: SemanticsNode.kt */
@Metadata(d1 = {"\u00002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a\u0018\u0010\n\u001a\u00020\u00072\u0006\u0010\u000b\u001a\u00020\u00022\u0006\u0010\f\u001a\u00020\rH\u0000\u001a\"\u0010\n\u001a\u00020\u00072\u0006\u0010\u000e\u001a\u00020\u00012\u0006\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000b\u001a\u00020\u0002H\u0000\u001a\f\u0010\u000f\u001a\u00020\u0010*\u00020\u0007H\u0002\u001a#\u0010\u0011\u001a\u0004\u0018\u00010\u0002*\u00020\u00022\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\r0\u0013H\u0080\b\u001a\f\u0010\u0014\u001a\u00020\u0010*\u00020\u0007H\u0002\"\u001a\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u00028@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0003\u0010\u0004\"\u001a\u0010\u0005\u001a\u0004\u0018\u00010\u0006*\u00020\u00078BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\b\u0010\t¨\u0006\u0015"}, d2 = {"outerMergingSemantics", "Landroidx/compose/ui/node/SemanticsModifierNode;", "Landroidx/compose/ui/node/LayoutNode;", "getOuterMergingSemantics", "(Landroidx/compose/ui/node/LayoutNode;)Landroidx/compose/ui/node/SemanticsModifierNode;", "role", "Landroidx/compose/ui/semantics/Role;", "Landroidx/compose/ui/semantics/SemanticsNode;", "getRole", "(Landroidx/compose/ui/semantics/SemanticsNode;)Landroidx/compose/ui/semantics/Role;", "SemanticsNode", "layoutNode", "mergingEnabled", "", "outerSemanticsNode", "contentDescriptionFakeNodeId", "", "findClosestParentNode", "selector", "Lkotlin/Function1;", "roleFakeNodeId", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class SemanticsNodeKt {
    public static final SemanticsNode SemanticsNode(LayoutNode layoutNode, boolean mergingEnabled) {
        SemanticsModifierNode semanticsModifierNode;
        NodeChain this_$iv;
        int type$iv;
        boolean z;
        boolean z2;
        boolean z3;
        MutableVector mutableVector;
        Modifier.Node node;
        int count$iv$iv$iv;
        MutableVector mutableVector2;
        NodeChain this_$iv2 = layoutNode.getNodes$ui_release();
        int count$iv$iv$iv2 = NodeKind.m5898constructorimpl(8);
        boolean z4 = false;
        if ((this_$iv2.getAggregateChildKindSet() & count$iv$iv$iv2) != 0) {
            Modifier.Node node$iv$iv$iv$iv = this_$iv2.getHead$ui_release();
            loop0: while (node$iv$iv$iv$iv != null) {
                Modifier.Node it$iv$iv$iv = node$iv$iv$iv$iv;
                if ((it$iv$iv$iv.getKindSet$ui_release() & count$iv$iv$iv2) == 0) {
                    this_$iv = this_$iv2;
                    type$iv = count$iv$iv$iv2;
                    z = z4;
                } else {
                    MutableVector mutableVector3 = null;
                    this_$iv = this_$iv2;
                    Modifier.Node node2 = it$iv$iv$iv;
                    while (node2 != null) {
                        int type$iv2 = count$iv$iv$iv2;
                        if (node2 instanceof SemanticsModifierNode) {
                            semanticsModifierNode = node2;
                            break loop0;
                        }
                        Modifier.Node this_$iv$iv$iv$iv = node2;
                        if (((this_$iv$iv$iv$iv.getKindSet$ui_release() & type$iv2) != 0 ? 1 : 0) == 0 || !(node2 instanceof DelegatingNode)) {
                            z2 = z4;
                        } else {
                            int count$iv$iv$iv3 = 0;
                            DelegatingNode this_$iv$iv$iv$iv2 = (DelegatingNode) node2;
                            Modifier.Node node$iv$iv$iv$iv2 = this_$iv$iv$iv$iv2.getDelegate$ui_release();
                            while (node$iv$iv$iv$iv2 != null) {
                                Modifier.Node next$iv$iv$iv = node$iv$iv$iv$iv2;
                                if (!((next$iv$iv$iv.getKindSet$ui_release() & type$iv2) != 0)) {
                                    z3 = z4;
                                    mutableVector = mutableVector3;
                                    node = node2;
                                } else {
                                    count$iv$iv$iv3++;
                                    Modifier.Node node3 = node2;
                                    if (count$iv$iv$iv3 == 1) {
                                        z3 = z4;
                                        mutableVector = mutableVector3;
                                        node = next$iv$iv$iv;
                                    } else {
                                        if (mutableVector3 != null) {
                                            count$iv$iv$iv = count$iv$iv$iv3;
                                            z3 = z4;
                                            mutableVector2 = mutableVector3;
                                        } else {
                                            count$iv$iv$iv = count$iv$iv$iv3;
                                            z3 = z4;
                                            mutableVector2 = new MutableVector(new Modifier.Node[16], 0);
                                        }
                                        if (node3 == null) {
                                            node = node3;
                                        } else {
                                            if (mutableVector2 != null) {
                                                mutableVector2.add(node3);
                                            }
                                            node = null;
                                        }
                                        if (mutableVector2 != null) {
                                            mutableVector2.add(next$iv$iv$iv);
                                        }
                                        mutableVector = mutableVector2;
                                        count$iv$iv$iv3 = count$iv$iv$iv;
                                    }
                                }
                                node$iv$iv$iv$iv2 = node$iv$iv$iv$iv2.getChild$ui_release();
                                node2 = node;
                                mutableVector3 = mutableVector;
                                z4 = z3;
                            }
                            Modifier.Node node4 = node2;
                            z2 = z4;
                            if (count$iv$iv$iv3 == 1) {
                                count$iv$iv$iv2 = type$iv2;
                                node2 = node4;
                                z4 = z2;
                            }
                        }
                        node2 = DelegatableNodeKt.pop(mutableVector3);
                        count$iv$iv$iv2 = type$iv2;
                        z4 = z2;
                    }
                    type$iv = count$iv$iv$iv2;
                    z = z4;
                }
                if ((it$iv$iv$iv.getAggregateChildKindSet$ui_release() & count$iv$iv$iv2) == 0) {
                    break;
                }
                node$iv$iv$iv$iv = node$iv$iv$iv$iv.getChild$ui_release();
                this_$iv2 = this_$iv;
                count$iv$iv$iv2 = type$iv;
                z4 = z;
            }
        }
        semanticsModifierNode = null;
        Intrinsics.checkNotNull(semanticsModifierNode);
        Modifier.Node node5 = semanticsModifierNode.getNode();
        SemanticsConfiguration semanticsConfiguration = layoutNode.getSemanticsConfiguration();
        if (semanticsConfiguration == null) {
            semanticsConfiguration = new SemanticsConfiguration();
        }
        return new SemanticsNode(node5, mergingEnabled, layoutNode, semanticsConfiguration);
    }

    public static /* synthetic */ SemanticsNode SemanticsNode$default(SemanticsModifierNode semanticsModifierNode, boolean z, LayoutNode layoutNode, int i, Object obj) {
        if ((i & 4) != 0) {
            layoutNode = DelegatableNodeKt.requireLayoutNode(semanticsModifierNode);
        }
        return SemanticsNode(semanticsModifierNode, z, layoutNode);
    }

    public static final SemanticsNode SemanticsNode(SemanticsModifierNode outerSemanticsNode, boolean mergingEnabled, LayoutNode layoutNode) {
        Modifier.Node node = outerSemanticsNode.getNode();
        SemanticsConfiguration semanticsConfiguration = layoutNode.getSemanticsConfiguration();
        if (semanticsConfiguration == null) {
            semanticsConfiguration = new SemanticsConfiguration();
        }
        return new SemanticsNode(node, mergingEnabled, layoutNode, semanticsConfiguration);
    }

    public static final SemanticsModifierNode getOuterMergingSemantics(LayoutNode $this$outerMergingSemantics) {
        Object it$iv;
        NodeChain this_$iv;
        int type$iv;
        boolean z;
        boolean z2;
        boolean z3;
        MutableVector mutableVector;
        Object stack$iv$iv$iv;
        int count$iv$iv$iv;
        MutableVector mutableVector2;
        NodeChain this_$iv2 = $this$outerMergingSemantics.getNodes$ui_release();
        int count$iv$iv$iv2 = NodeKind.m5898constructorimpl(8);
        boolean z4 = false;
        if ((this_$iv2.getAggregateChildKindSet() & count$iv$iv$iv2) != 0) {
            Modifier.Node node$iv$iv$iv$iv = this_$iv2.getHead$ui_release();
            loop0: while (node$iv$iv$iv$iv != null) {
                Modifier.Node it$iv$iv$iv = node$iv$iv$iv$iv;
                if ((it$iv$iv$iv.getKindSet$ui_release() & count$iv$iv$iv2) == 0) {
                    this_$iv = this_$iv2;
                    type$iv = count$iv$iv$iv2;
                    z = z4;
                } else {
                    MutableVector mutableVector3 = null;
                    this_$iv = this_$iv2;
                    Object node$iv$iv$iv = it$iv$iv$iv;
                    while (node$iv$iv$iv != null) {
                        int type$iv2 = count$iv$iv$iv2;
                        if (node$iv$iv$iv instanceof SemanticsModifierNode) {
                            it$iv = node$iv$iv$iv;
                            SemanticsModifierNode it = (SemanticsModifierNode) it$iv;
                            if (it.getShouldMergeDescendantSemantics()) {
                                break loop0;
                            }
                            z2 = z4;
                        } else {
                            Modifier.Node this_$iv$iv$iv$iv = node$iv$iv$iv;
                            if (((this_$iv$iv$iv$iv.getKindSet$ui_release() & type$iv2) != 0 ? 1 : 0) == 0 || !(node$iv$iv$iv instanceof DelegatingNode)) {
                                z2 = z4;
                            } else {
                                int count$iv$iv$iv3 = 0;
                                DelegatingNode this_$iv$iv$iv$iv2 = (DelegatingNode) node$iv$iv$iv;
                                Modifier.Node node$iv$iv$iv$iv2 = this_$iv$iv$iv$iv2.getDelegate$ui_release();
                                while (node$iv$iv$iv$iv2 != null) {
                                    Modifier.Node next$iv$iv$iv = node$iv$iv$iv$iv2;
                                    if (!((next$iv$iv$iv.getKindSet$ui_release() & type$iv2) != 0)) {
                                        z3 = z4;
                                        mutableVector = mutableVector3;
                                        stack$iv$iv$iv = node$iv$iv$iv;
                                    } else {
                                        count$iv$iv$iv3++;
                                        Modifier.Node node = node$iv$iv$iv;
                                        if (count$iv$iv$iv3 == 1) {
                                            z3 = z4;
                                            mutableVector = mutableVector3;
                                            stack$iv$iv$iv = next$iv$iv$iv;
                                        } else {
                                            if (mutableVector3 != null) {
                                                count$iv$iv$iv = count$iv$iv$iv3;
                                                z3 = z4;
                                                mutableVector2 = mutableVector3;
                                            } else {
                                                count$iv$iv$iv = count$iv$iv$iv3;
                                                z3 = z4;
                                                mutableVector2 = new MutableVector(new Modifier.Node[16], 0);
                                            }
                                            if (node == null) {
                                                stack$iv$iv$iv = node;
                                            } else {
                                                if (mutableVector2 != null) {
                                                    mutableVector2.add(node);
                                                }
                                                stack$iv$iv$iv = null;
                                            }
                                            if (mutableVector2 != null) {
                                                mutableVector2.add(next$iv$iv$iv);
                                            }
                                            mutableVector = mutableVector2;
                                            count$iv$iv$iv3 = count$iv$iv$iv;
                                        }
                                    }
                                    node$iv$iv$iv$iv2 = node$iv$iv$iv$iv2.getChild$ui_release();
                                    node$iv$iv$iv = stack$iv$iv$iv;
                                    mutableVector3 = mutableVector;
                                    z4 = z3;
                                }
                                Object node$iv$iv$iv2 = node$iv$iv$iv;
                                z2 = z4;
                                if (count$iv$iv$iv3 == 1) {
                                    count$iv$iv$iv2 = type$iv2;
                                    node$iv$iv$iv = node$iv$iv$iv2;
                                    z4 = z2;
                                }
                            }
                        }
                        node$iv$iv$iv = DelegatableNodeKt.pop(mutableVector3);
                        count$iv$iv$iv2 = type$iv2;
                        z4 = z2;
                    }
                    type$iv = count$iv$iv$iv2;
                    z = z4;
                }
                if ((it$iv$iv$iv.getAggregateChildKindSet$ui_release() & count$iv$iv$iv2) == 0) {
                    break;
                }
                node$iv$iv$iv$iv = node$iv$iv$iv$iv.getChild$ui_release();
                this_$iv2 = this_$iv;
                count$iv$iv$iv2 = type$iv;
                z4 = z;
            }
        }
        it$iv = null;
        return (SemanticsModifierNode) it$iv;
    }

    public static final LayoutNode findClosestParentNode(LayoutNode $this$findClosestParentNode, Function1<? super LayoutNode, Boolean> function1) {
        for (LayoutNode currentParent = $this$findClosestParentNode.getParent$ui_release(); currentParent != null; currentParent = currentParent.getParent$ui_release()) {
            if (function1.invoke(currentParent).booleanValue()) {
                return currentParent;
            }
        }
        return null;
    }

    public static final Role getRole(SemanticsNode $this$role) {
        return (Role) SemanticsConfigurationKt.getOrNull($this$role.getUnmergedConfig$ui_release(), SemanticsProperties.INSTANCE.getRole());
    }

    public static final int contentDescriptionFakeNodeId(SemanticsNode $this$contentDescriptionFakeNodeId) {
        return $this$contentDescriptionFakeNodeId.getId() + 2000000000;
    }

    public static final int roleFakeNodeId(SemanticsNode $this$roleFakeNodeId) {
        return $this$roleFakeNodeId.getId() + 1000000000;
    }
}
