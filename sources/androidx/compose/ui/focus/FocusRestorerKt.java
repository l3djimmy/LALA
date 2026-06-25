package androidx.compose.ui.focus;

import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.runtime.saveable.SaveableStateRegistry;
import androidx.compose.runtime.saveable.SaveableStateRegistryKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.layout.PinnableContainer;
import androidx.compose.ui.layout.PinnableContainerKt;
import androidx.compose.ui.node.CompositionLocalConsumerModifierNodeKt;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.NodeKind;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.Metadata;
import kotlin.ReplaceWith;
import kotlin.jvm.functions.Function0;
/* compiled from: FocusRestorer.kt */
@Metadata(d1 = {"\u0000,\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\u001a\u001c\u0010\u0002\u001a\u00020\u0003*\u00020\u00032\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005H\u0007\u001a\u0014\u0010\u0002\u001a\u00020\u0003*\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u0006\u001a\u000e\u0010\b\u001a\u0004\u0018\u00010\t*\u00020\nH\u0000\u001a\f\u0010\u000b\u001a\u00020\f*\u00020\nH\u0000\u001a\f\u0010\r\u001a\u00020\f*\u00020\nH\u0000\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u000e"}, d2 = {"PrevFocusedChild", "", "focusRestorer", "Landroidx/compose/ui/Modifier;", "onRestoreFailed", "Lkotlin/Function0;", "Landroidx/compose/ui/focus/FocusRequester;", "fallback", "pinFocusedChild", "Landroidx/compose/ui/layout/PinnableContainer$PinnedHandle;", "Landroidx/compose/ui/focus/FocusTargetNode;", "restoreFocusedChild", "", "saveFocusedChild", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class FocusRestorerKt {
    private static final String PrevFocusedChild = "previouslyFocusedChildHash";

    public static final boolean saveFocusedChild(FocusTargetNode $this$saveFocusedChild) {
        DelegatableNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
        int type$iv;
        boolean z;
        DelegatingNode this_$iv$iv$iv;
        MutableVector mutableVector;
        Modifier.Node node;
        int count$iv$iv;
        Modifier.Node node2;
        Modifier.Node node3;
        final FocusTargetNode focusTargetNode = $this$saveFocusedChild;
        MutableVector mutableVector2 = null;
        if (!focusTargetNode.getFocusState().getHasFocus()) {
            return false;
        }
        FocusTargetNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = focusTargetNode;
        int type$iv2 = NodeKind.m5898constructorimpl(1024);
        boolean value$iv$iv$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitChildren called on an unattached node");
        }
        MutableVector branches$iv$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2.getNode().getChild$ui_release();
        if (child$iv$iv == null) {
            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, $this$visitChildren_u2dY_u2dYKmho_u24default$iv2.getNode(), false);
        } else {
            branches$iv$iv.add(child$iv$iv);
        }
        while (true) {
            boolean z2 = true;
            MutableVector this_$iv$iv$iv2 = branches$iv$iv.getSize() != 0 ? 1 : mutableVector2;
            if (this_$iv$iv$iv2 == null) {
                return false;
            }
            Modifier.Node branch$iv$iv = (Modifier.Node) branches$iv$iv.removeAt(branches$iv$iv.getSize() - 1);
            if ((branch$iv$iv.getAggregateChildKindSet$ui_release() & type$iv2) == 0) {
                DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, branch$iv$iv, false);
            } else {
                Modifier.Node node$iv$iv = branch$iv$iv;
                while (true) {
                    if (node$iv$iv == null) {
                        focusTargetNode = $this$saveFocusedChild;
                        mutableVector2 = null;
                        break;
                    } else if ((node$iv$iv.getKindSet$ui_release() & type$iv2) != 0) {
                        Modifier.Node it$iv = node$iv$iv;
                        MutableVector mutableVector3 = null;
                        Modifier.Node node4 = it$iv;
                        while (node4 != null) {
                            boolean z3 = z2;
                            if (node4 instanceof FocusTargetNode) {
                                FocusTargetNode it = (FocusTargetNode) node4;
                                if (it.getFocusState().getHasFocus()) {
                                    focusTargetNode.setPreviouslyFocusedChildHash(DelegatableNodeKt.requireLayoutNode(it).getCompositeKeyHash());
                                    SaveableStateRegistry saveableStateRegistry = (SaveableStateRegistry) CompositionLocalConsumerModifierNodeKt.currentValueOf(focusTargetNode, SaveableStateRegistryKt.getLocalSaveableStateRegistry());
                                    if (saveableStateRegistry != null) {
                                        saveableStateRegistry.registerProvider(PrevFocusedChild, new Function0<Object>() { // from class: androidx.compose.ui.focus.FocusRestorerKt$saveFocusedChild$1$1
                                            /* JADX INFO: Access modifiers changed from: package-private */
                                            {
                                                super(0);
                                            }

                                            @Override // kotlin.jvm.functions.Function0
                                            public final Object invoke() {
                                                return Integer.valueOf(FocusTargetNode.this.getPreviouslyFocusedChildHash());
                                            }
                                        });
                                    }
                                    return z3;
                                }
                                $this$visitChildren_u2dY_u2dYKmho_u24default$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2;
                                type$iv = type$iv2;
                                z = z3;
                            } else {
                                $this$visitChildren_u2dY_u2dYKmho_u24default$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2;
                                type$iv = type$iv2;
                                Modifier.Node this_$iv$iv$iv3 = node4;
                                if (!((this_$iv$iv$iv3.getKindSet$ui_release() & type$iv) != 0 ? z3 : false) || !(node4 instanceof DelegatingNode)) {
                                    z = z3;
                                } else {
                                    int count$iv$iv2 = 0;
                                    DelegatingNode this_$iv$iv$iv4 = (DelegatingNode) node4;
                                    Modifier.Node node$iv$iv$iv = this_$iv$iv$iv4.getDelegate$ui_release();
                                    while (node$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv = node$iv$iv$iv;
                                        if (!((next$iv$iv.getKindSet$ui_release() & type$iv) != 0 ? z3 : false)) {
                                            this_$iv$iv$iv = this_$iv$iv$iv4;
                                            mutableVector = mutableVector3;
                                            node = node4;
                                        } else {
                                            count$iv$iv2++;
                                            this_$iv$iv$iv = this_$iv$iv$iv4;
                                            if (count$iv$iv2 == z3) {
                                                mutableVector = mutableVector3;
                                                node = next$iv$iv;
                                            } else {
                                                if (mutableVector3 == null) {
                                                    count$iv$iv = count$iv$iv2;
                                                    node2 = node4;
                                                    mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                } else {
                                                    count$iv$iv = count$iv$iv2;
                                                    node2 = node4;
                                                    mutableVector = mutableVector3;
                                                }
                                                Modifier.Node theNode$iv$iv = node2;
                                                if (theNode$iv$iv == null) {
                                                    node3 = node2;
                                                } else {
                                                    if (mutableVector != null) {
                                                        mutableVector.add(theNode$iv$iv);
                                                    }
                                                    node3 = null;
                                                }
                                                if (mutableVector != null) {
                                                    node = node3;
                                                    mutableVector.add(next$iv$iv);
                                                } else {
                                                    node = node3;
                                                }
                                                count$iv$iv2 = count$iv$iv;
                                            }
                                        }
                                        node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                        node4 = node;
                                        z3 = true;
                                        mutableVector3 = mutableVector;
                                        this_$iv$iv$iv4 = this_$iv$iv$iv;
                                    }
                                    Modifier.Node node5 = node4;
                                    z = true;
                                    if (count$iv$iv2 == 1) {
                                        focusTargetNode = $this$saveFocusedChild;
                                        z2 = true;
                                        $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
                                        type$iv2 = type$iv;
                                        node4 = node5;
                                    }
                                }
                            }
                            node4 = DelegatableNodeKt.pop(mutableVector3);
                            focusTargetNode = $this$saveFocusedChild;
                            z2 = z;
                            $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
                            type$iv2 = type$iv;
                        }
                        focusTargetNode = $this$saveFocusedChild;
                        mutableVector2 = null;
                    } else {
                        node$iv$iv = node$iv$iv.getChild$ui_release();
                        focusTargetNode = $this$saveFocusedChild;
                        $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2;
                    }
                }
            }
        }
    }

    public static final boolean restoreFocusedChild(FocusTargetNode $this$restoreFocusedChild) {
        DelegatableNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
        int type$iv;
        boolean zOrder$iv;
        boolean z;
        DelegatingNode this_$iv$iv$iv;
        int count$iv$iv;
        Modifier.Node node;
        MutableVector mutableVector;
        SaveableStateRegistry savableStateRegistry;
        Object it;
        if ($this$restoreFocusedChild.getPreviouslyFocusedChildHash() == 0 && (savableStateRegistry = (SaveableStateRegistry) CompositionLocalConsumerModifierNodeKt.currentValueOf($this$restoreFocusedChild, SaveableStateRegistryKt.getLocalSaveableStateRegistry())) != null && (it = savableStateRegistry.consumeRestored(PrevFocusedChild)) != null) {
            $this$restoreFocusedChild.setPreviouslyFocusedChildHash(((Integer) it).intValue());
        }
        MutableVector mutableVector2 = null;
        if ($this$restoreFocusedChild.getPreviouslyFocusedChildHash() == 0) {
            return false;
        }
        FocusTargetNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$restoreFocusedChild;
        int type$iv2 = NodeKind.m5898constructorimpl(1024);
        boolean zOrder$iv2 = false;
        boolean value$iv$iv$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitChildren called on an unattached node");
        }
        MutableVector branches$iv$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2.getNode().getChild$ui_release();
        if (child$iv$iv == null) {
            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, $this$visitChildren_u2dY_u2dYKmho_u24default$iv2.getNode(), false);
        } else {
            branches$iv$iv.add(child$iv$iv);
        }
        while (true) {
            MutableVector this_$iv$iv$iv2 = branches$iv$iv.getSize() != 0 ? 1 : mutableVector2;
            if (this_$iv$iv$iv2 == null) {
                return false;
            }
            Modifier.Node branch$iv$iv = (Modifier.Node) branches$iv$iv.removeAt(branches$iv$iv.getSize() - 1);
            if ((branch$iv$iv.getAggregateChildKindSet$ui_release() & type$iv2) == 0) {
                DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, branch$iv$iv, zOrder$iv2);
            } else {
                Modifier.Node node$iv$iv = branch$iv$iv;
                while (true) {
                    if (node$iv$iv == null) {
                        mutableVector2 = null;
                        break;
                    } else if ((node$iv$iv.getKindSet$ui_release() & type$iv2) != 0) {
                        Modifier.Node it$iv = node$iv$iv;
                        MutableVector mutableVector3 = null;
                        Modifier.Node node2 = it$iv;
                        while (node2 != null) {
                            if (node2 instanceof FocusTargetNode) {
                                FocusTargetNode it2 = (FocusTargetNode) node2;
                                if (it2.isAttached()) {
                                    $this$visitChildren_u2dY_u2dYKmho_u24default$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2;
                                    if (DelegatableNodeKt.requireLayoutNode(it2).getCompositeKeyHash() == $this$restoreFocusedChild.getPreviouslyFocusedChildHash()) {
                                        return restoreFocusedChild(it2) || FocusTargetModifierNode.m3961requestFocus3ESFkO8$default(it2, 0, 1, null);
                                    }
                                    type$iv = type$iv2;
                                    zOrder$iv = zOrder$iv2;
                                } else {
                                    $this$visitChildren_u2dY_u2dYKmho_u24default$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2;
                                    type$iv = type$iv2;
                                    zOrder$iv = zOrder$iv2;
                                }
                                z = true;
                            } else {
                                $this$visitChildren_u2dY_u2dYKmho_u24default$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2;
                                type$iv = type$iv2;
                                zOrder$iv = zOrder$iv2;
                                Modifier.Node this_$iv$iv$iv3 = node2;
                                if (!((this_$iv$iv$iv3.getKindSet$ui_release() & type$iv) != 0) || !(node2 instanceof DelegatingNode)) {
                                    z = true;
                                } else {
                                    int count$iv$iv2 = 0;
                                    DelegatingNode this_$iv$iv$iv4 = (DelegatingNode) node2;
                                    Modifier.Node node$iv$iv$iv = this_$iv$iv$iv4.getDelegate$ui_release();
                                    while (node$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv = node$iv$iv$iv;
                                        if (!((next$iv$iv.getKindSet$ui_release() & type$iv) != 0)) {
                                            this_$iv$iv$iv = this_$iv$iv$iv4;
                                        } else {
                                            count$iv$iv2++;
                                            this_$iv$iv$iv = this_$iv$iv$iv4;
                                            if (count$iv$iv2 == 1) {
                                                node2 = next$iv$iv;
                                            } else {
                                                if (mutableVector3 == null) {
                                                    count$iv$iv = count$iv$iv2;
                                                    node = node2;
                                                    mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                } else {
                                                    count$iv$iv = count$iv$iv2;
                                                    node = node2;
                                                    mutableVector = mutableVector3;
                                                }
                                                Modifier.Node theNode$iv$iv = node;
                                                if (theNode$iv$iv == null) {
                                                    node2 = node;
                                                } else {
                                                    if (mutableVector != null) {
                                                        mutableVector.add(theNode$iv$iv);
                                                    }
                                                    node2 = null;
                                                }
                                                if (mutableVector != null) {
                                                    mutableVector.add(next$iv$iv);
                                                }
                                                mutableVector3 = mutableVector;
                                                count$iv$iv2 = count$iv$iv;
                                            }
                                        }
                                        node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                        this_$iv$iv$iv4 = this_$iv$iv$iv;
                                    }
                                    Modifier.Node node3 = node2;
                                    z = true;
                                    if (count$iv$iv2 == 1) {
                                        $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
                                        type$iv2 = type$iv;
                                        zOrder$iv2 = zOrder$iv;
                                        node2 = node3;
                                    }
                                }
                            }
                            node2 = DelegatableNodeKt.pop(mutableVector3);
                            $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
                            type$iv2 = type$iv;
                            zOrder$iv2 = zOrder$iv;
                        }
                        mutableVector2 = null;
                    } else {
                        node$iv$iv = node$iv$iv.getChild$ui_release();
                        $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2;
                    }
                }
            }
        }
    }

    public static final PinnableContainer.PinnedHandle pinFocusedChild(FocusTargetNode $this$pinFocusedChild) {
        PinnableContainer pinnableContainer;
        FocusTargetNode findActiveFocusNode = FocusTraversalKt.findActiveFocusNode($this$pinFocusedChild);
        if (findActiveFocusNode == null || (pinnableContainer = (PinnableContainer) CompositionLocalConsumerModifierNodeKt.currentValueOf(findActiveFocusNode, PinnableContainerKt.getLocalPinnableContainer())) == null) {
            return null;
        }
        return pinnableContainer.pin();
    }

    public static /* synthetic */ Modifier focusRestorer$default(Modifier modifier, FocusRequester focusRequester, int i, Object obj) {
        if ((i & 1) != 0) {
            focusRequester = FocusRequester.Companion.getDefault();
        }
        return focusRestorer(modifier, focusRequester);
    }

    public static final Modifier focusRestorer(Modifier $this$focusRestorer, FocusRequester fallback) {
        return $this$focusRestorer.then(new FocusRestorerElement(fallback));
    }

    @Deprecated(level = DeprecationLevel.WARNING, message = "Use focusRestorer(FocusRequester) instead", replaceWith = @ReplaceWith(expression = "this.focusRestorer(onRestoreFailed())", imports = {}))
    public static final Modifier focusRestorer(Modifier $this$focusRestorer, Function0<FocusRequester> function0) {
        FocusRequester focusRequester;
        if (function0 == null || (focusRequester = function0.invoke()) == null) {
            focusRequester = FocusRequester.Companion.getDefault();
        }
        return focusRestorer($this$focusRestorer, focusRequester);
    }
}
