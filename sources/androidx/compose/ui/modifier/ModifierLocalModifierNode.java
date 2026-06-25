package androidx.compose.ui.modifier;

import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.NodeChain;
import androidx.compose.ui.node.NodeKind;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
/* compiled from: ModifierLocalModifierNode.kt */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0004\bf\u0018\u00002\u00020\u00012\u00020\u0002J)\u0010\f\u001a\u00020\r\"\u0004\b\u0000\u0010\b2\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u0002H\b0\t2\u0006\u0010\u000f\u001a\u0002H\bH\u0016¢\u0006\u0002\u0010\u0010R\u0014\u0010\u0003\u001a\u00020\u00048VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0005\u0010\u0006R$\u0010\u0007\u001a\u0002H\b\"\u0004\b\u0000\u0010\b*\b\u0012\u0004\u0012\u0002H\b0\t8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\n\u0010\u000bø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u0011À\u0006\u0001"}, d2 = {"Landroidx/compose/ui/modifier/ModifierLocalModifierNode;", "Landroidx/compose/ui/modifier/ModifierLocalReadScope;", "Landroidx/compose/ui/node/DelegatableNode;", "providedValues", "Landroidx/compose/ui/modifier/ModifierLocalMap;", "getProvidedValues", "()Landroidx/compose/ui/modifier/ModifierLocalMap;", "current", ExifInterface.GPS_DIRECTION_TRUE, "Landroidx/compose/ui/modifier/ModifierLocal;", "getCurrent", "(Landroidx/compose/ui/modifier/ModifierLocal;)Ljava/lang/Object;", "provide", "", "key", "value", "(Landroidx/compose/ui/modifier/ModifierLocal;Ljava/lang/Object;)V", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public interface ModifierLocalModifierNode extends ModifierLocalReadScope, DelegatableNode {
    default ModifierLocalMap getProvidedValues() {
        return EmptyMap.INSTANCE;
    }

    default <T> void provide(ModifierLocal<T> modifierLocal, T t) {
        boolean value$iv = getProvidedValues() != EmptyMap.INSTANCE;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("In order to provide locals you must override providedValues: ModifierLocalMap");
        }
        boolean value$iv2 = getProvidedValues().contains$ui_release(modifierLocal);
        if (!value$iv2) {
            InlineClassHelperKt.throwIllegalArgumentException("Any provided key must be initially provided in the overridden providedValues: ModifierLocalMap property. Key " + modifierLocal + " was not found.");
        }
        getProvidedValues().mo5743set$ui_release(modifierLocal, t);
    }

    @Override // androidx.compose.ui.modifier.ModifierLocalReadScope
    default <T> T getCurrent(ModifierLocal<T> modifierLocal) {
        ModifierLocal key;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
        int type$iv;
        NodeChain nodes$ui_release;
        ModifierLocal key2;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
        ModifierLocal key3;
        Modifier.Node node;
        int count$iv$iv;
        MutableVector mutableVector;
        Modifier.Node node2;
        boolean value$iv = getNode().isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("ModifierLocal accessed from an unattached node");
        }
        ModifierLocal key4 = modifierLocal;
        ModifierLocalModifierNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = this;
        int count$iv$iv2 = NodeKind.m5898constructorimpl(32);
        boolean value$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3.getNode().getParent$ui_release();
        LayoutNode layout$iv$iv = DelegatableNodeKt.requireLayoutNode($this$visitAncestors_u2dY_u2dYKmho_u24default$iv3);
        while (layout$iv$iv != null) {
            Modifier.Node head$iv$iv = layout$iv$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv$iv.getAggregateChildKindSet$ui_release() & count$iv$iv2) == 0) {
                key = key4;
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                type$iv = count$iv$iv2;
            } else {
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & count$iv$iv2) == 0) {
                        key2 = key4;
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                    } else {
                        Modifier.Node it$iv = node$iv$iv;
                        MutableVector mutableVector2 = null;
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                        Modifier.Node theNode$iv$iv = it$iv;
                        while (theNode$iv$iv != null) {
                            int type$iv2 = count$iv$iv2;
                            if (theNode$iv$iv instanceof ModifierLocalModifierNode) {
                                ModifierLocalModifierNode it = (ModifierLocalModifierNode) theNode$iv$iv;
                                if (it.getProvidedValues().contains$ui_release(key4)) {
                                    return (T) it.getProvidedValues().get$ui_release(key4);
                                }
                                key3 = key4;
                            } else {
                                Modifier.Node this_$iv$iv$iv = theNode$iv$iv;
                                key3 = key4;
                                int i = 1;
                                Modifier.Node this_$iv$iv$iv2 = (this_$iv$iv$iv.getKindSet$ui_release() & type$iv2) != 0 ? 1 : null;
                                if (this_$iv$iv$iv2 != null && (theNode$iv$iv instanceof DelegatingNode)) {
                                    int count$iv$iv3 = 0;
                                    DelegatingNode this_$iv$iv$iv3 = (DelegatingNode) theNode$iv$iv;
                                    Modifier.Node node$iv$iv$iv = this_$iv$iv$iv3.getDelegate$ui_release();
                                    while (node$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv = node$iv$iv$iv;
                                        if (((next$iv$iv.getKindSet$ui_release() & type$iv2) != 0 ? i : 0) != 0) {
                                            count$iv$iv3++;
                                            if (count$iv$iv3 == i) {
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
                                        node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                        i = 1;
                                    }
                                    Modifier.Node node3 = theNode$iv$iv;
                                    if (count$iv$iv3 == 1) {
                                        count$iv$iv2 = type$iv2;
                                        key4 = key3;
                                        theNode$iv$iv = node3;
                                    }
                                }
                            }
                            theNode$iv$iv = DelegatableNodeKt.pop(mutableVector2);
                            count$iv$iv2 = type$iv2;
                            key4 = key3;
                        }
                        key2 = key4;
                    }
                    int type$iv3 = count$iv$iv2;
                    node$iv$iv = node$iv$iv.getParent$ui_release();
                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                    count$iv$iv2 = type$iv3;
                    key4 = key2;
                }
                key = key4;
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                type$iv = count$iv$iv2;
            }
            layout$iv$iv = layout$iv$iv.getParent$ui_release();
            node$iv$iv = (layout$iv$iv == null || (nodes$ui_release = layout$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
            count$iv$iv2 = type$iv;
            key4 = key;
        }
        return key4.getDefaultFactory$ui_release().invoke();
    }
}
