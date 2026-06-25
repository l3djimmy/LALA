package androidx.compose.ui.modifier;

import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.node.BackwardsCompatNode;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.NodeKind;
import androidx.compose.ui.node.Owner;
import java.util.HashSet;
import java.util.Set;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
/* compiled from: ModifierLocalManager.kt */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010#\n\u0002\b\u0004\b\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u001a\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00072\n\u0010\u0014\u001a\u0006\u0012\u0002\b\u00030\tJ\u0006\u0010\u0015\u001a\u00020\u0012J*\u0010\u0016\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00172\n\u0010\u0014\u001a\u0006\u0012\u0002\b\u00030\t2\f\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00070\u0019H\u0002J\u001a\u0010\u001a\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00072\n\u0010\u0014\u001a\u0006\u0012\u0002\b\u00030\tJ\u0006\u0010\u001b\u001a\u00020\u0012J\u001a\u0010\u001c\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00072\n\u0010\u0014\u001a\u0006\u0012\u0002\b\u00030\tR\u0014\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u0018\u0010\b\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\t0\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0014\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u000f0\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u0018\u0010\u0010\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\t0\u0006X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u001d"}, d2 = {"Landroidx/compose/ui/modifier/ModifierLocalManager;", "", "owner", "Landroidx/compose/ui/node/Owner;", "(Landroidx/compose/ui/node/Owner;)V", "inserted", "Landroidx/compose/runtime/collection/MutableVector;", "Landroidx/compose/ui/node/BackwardsCompatNode;", "insertedLocal", "Landroidx/compose/ui/modifier/ModifierLocal;", "invalidated", "", "getOwner", "()Landroidx/compose/ui/node/Owner;", "removed", "Landroidx/compose/ui/node/LayoutNode;", "removedLocal", "insertedProvider", "", "node", "key", "invalidate", "invalidateConsumersOfNodeForKey", "Landroidx/compose/ui/Modifier$Node;", "set", "", "removedProvider", "triggerUpdates", "updatedProvider", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class ModifierLocalManager {
    public static final int $stable = 8;
    private boolean invalidated;
    private final Owner owner;
    private final MutableVector<BackwardsCompatNode> inserted = new MutableVector<>(new BackwardsCompatNode[16], 0);
    private final MutableVector<ModifierLocal<?>> insertedLocal = new MutableVector<>(new ModifierLocal[16], 0);
    private final MutableVector<LayoutNode> removed = new MutableVector<>(new LayoutNode[16], 0);
    private final MutableVector<ModifierLocal<?>> removedLocal = new MutableVector<>(new ModifierLocal[16], 0);

    public ModifierLocalManager(Owner owner) {
        this.owner = owner;
    }

    public final Owner getOwner() {
        return this.owner;
    }

    public final void invalidate() {
        if (!this.invalidated) {
            this.invalidated = true;
            this.owner.registerOnEndApplyChangesListener(new Function0<Unit>() { // from class: androidx.compose.ui.modifier.ModifierLocalManager$invalidate$1
                /* JADX INFO: Access modifiers changed from: package-private */
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
                    ModifierLocalManager.this.triggerUpdates();
                }
            });
        }
    }

    public final void triggerUpdates() {
        this.invalidated = false;
        Iterable toUpdate = new HashSet();
        MutableVector this_$iv = this.removed;
        Object[] content$iv = this_$iv.content;
        int size$iv = this_$iv.getSize();
        for (int i$iv = 0; i$iv < size$iv; i$iv++) {
            LayoutNode layout = (LayoutNode) content$iv[i$iv];
            int i = i$iv;
            ModifierLocal<?> key = this.removedLocal.content[i];
            if (layout.getNodes$ui_release().getHead$ui_release().isAttached()) {
                invalidateConsumersOfNodeForKey(layout.getNodes$ui_release().getHead$ui_release(), key, (Set) toUpdate);
            }
        }
        this.removed.clear();
        this.removedLocal.clear();
        MutableVector this_$iv2 = this.inserted;
        Object[] content$iv2 = this_$iv2.content;
        int size$iv2 = this_$iv2.getSize();
        for (int i$iv2 = 0; i$iv2 < size$iv2; i$iv2++) {
            BackwardsCompatNode node = (BackwardsCompatNode) content$iv2[i$iv2];
            int i2 = i$iv2;
            ModifierLocal<?> key2 = this.insertedLocal.content[i2];
            if (node.isAttached()) {
                invalidateConsumersOfNodeForKey(node, key2, (Set) toUpdate);
            }
        }
        this.inserted.clear();
        this.insertedLocal.clear();
        Iterable $this$forEach$iv = toUpdate;
        for (Object element$iv : $this$forEach$iv) {
            BackwardsCompatNode it = (BackwardsCompatNode) element$iv;
            it.updateModifierLocalConsumer();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private final void invalidateConsumersOfNodeForKey(Modifier.Node node, ModifierLocal<?> modifierLocal, Set<BackwardsCompatNode> set) {
        DelegatableNode $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
        int type$iv;
        boolean z;
        boolean diveDeeper$iv$iv;
        boolean z2;
        int count$iv$iv;
        MutableVector mutableVector;
        ModifierLocal<?> modifierLocal2 = modifierLocal;
        Modifier.Node $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = node;
        int type$iv2 = NodeKind.m5898constructorimpl(32);
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
            MutableVector this_$iv$iv$iv = branches$iv$iv.getSize() != 0 ? 1 : mutableVector2;
            if (this_$iv$iv$iv == null) {
                return;
            }
            Modifier.Node branch$iv$iv = (Modifier.Node) branches$iv$iv.removeAt(branches$iv$iv.getSize() - 1);
            if ((branch$iv$iv.getAggregateChildKindSet$ui_release() & type$iv2) != 0) {
                Modifier.Node node$iv$iv = branch$iv$iv;
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & type$iv2) == 0) {
                        $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
                        type$iv = type$iv2;
                        z = z3;
                    } else {
                        Object node$iv = node$iv$iv;
                        MutableVector mutableVector3 = null;
                        Object obj = node$iv;
                        while (true) {
                            if (obj != null) {
                                if (obj instanceof ModifierLocalModifierNode) {
                                    Object it$iv = obj;
                                    $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
                                    ModifierLocalModifierNode it = (ModifierLocalModifierNode) it$iv;
                                    type$iv = type$iv2;
                                    if ((it instanceof BackwardsCompatNode) && (((BackwardsCompatNode) it).getElement() instanceof ModifierLocalConsumer)) {
                                        if (((BackwardsCompatNode) it).getReadValues().contains(modifierLocal2)) {
                                            set.add(it);
                                        }
                                    }
                                    if (it.getProvidedValues().contains$ui_release(modifierLocal2)) {
                                        z = true;
                                        diveDeeper$iv$iv = false;
                                        break;
                                    }
                                    z2 = true;
                                } else {
                                    $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
                                    type$iv = type$iv2;
                                    Modifier.Node this_$iv$iv$iv2 = obj;
                                    if (!((this_$iv$iv$iv2.getKindSet$ui_release() & type$iv) != 0) || !(obj instanceof DelegatingNode)) {
                                        z2 = true;
                                    } else {
                                        int count$iv$iv2 = 0;
                                        DelegatingNode this_$iv$iv$iv3 = (DelegatingNode) obj;
                                        for (Modifier.Node node$iv$iv$iv = this_$iv$iv$iv3.getDelegate$ui_release(); node$iv$iv$iv != null; node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release()) {
                                            Modifier.Node next$iv$iv = node$iv$iv$iv;
                                            if ((next$iv$iv.getKindSet$ui_release() & type$iv) != 0) {
                                                count$iv$iv2++;
                                                if (count$iv$iv2 == 1) {
                                                    obj = next$iv$iv;
                                                } else {
                                                    if (mutableVector3 == null) {
                                                        count$iv$iv = count$iv$iv2;
                                                        mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                    } else {
                                                        count$iv$iv = count$iv$iv2;
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
                                                    count$iv$iv2 = count$iv$iv;
                                                }
                                            }
                                        }
                                        z2 = true;
                                        if (count$iv$iv2 == 1) {
                                            z3 = true;
                                            $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
                                            type$iv2 = type$iv;
                                            modifierLocal2 = modifierLocal;
                                        }
                                    }
                                }
                                obj = DelegatableNodeKt.pop(mutableVector3);
                                z3 = z2;
                                $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
                                type$iv2 = type$iv;
                                modifierLocal2 = modifierLocal;
                            } else {
                                $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
                                type$iv = type$iv2;
                                z = z3;
                                diveDeeper$iv$iv = z;
                                break;
                            }
                        }
                        if (!diveDeeper$iv$iv) {
                            modifierLocal2 = modifierLocal;
                            $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
                            type$iv2 = type$iv;
                            mutableVector2 = null;
                            break;
                        }
                    }
                    node$iv$iv = node$iv$iv.getChild$ui_release();
                    z3 = z;
                    $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
                    type$iv2 = type$iv;
                    modifierLocal2 = modifierLocal;
                }
            }
            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, branch$iv$iv, false);
            modifierLocal2 = modifierLocal;
            $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
            type$iv2 = type$iv2;
            mutableVector2 = null;
        }
    }

    public final void updatedProvider(BackwardsCompatNode node, ModifierLocal<?> modifierLocal) {
        MutableVector this_$iv = this.inserted;
        this_$iv.add(node);
        MutableVector this_$iv2 = this.insertedLocal;
        this_$iv2.add(modifierLocal);
        invalidate();
    }

    public final void insertedProvider(BackwardsCompatNode node, ModifierLocal<?> modifierLocal) {
        MutableVector this_$iv = this.inserted;
        this_$iv.add(node);
        MutableVector this_$iv2 = this.insertedLocal;
        this_$iv2.add(modifierLocal);
        invalidate();
    }

    public final void removedProvider(BackwardsCompatNode node, ModifierLocal<?> modifierLocal) {
        MutableVector this_$iv = this.removed;
        this_$iv.add(DelegatableNodeKt.requireLayoutNode(node));
        MutableVector this_$iv2 = this.removedLocal;
        this_$iv2.add(modifierLocal);
        invalidate();
    }
}
