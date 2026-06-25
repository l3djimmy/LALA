package androidx.compose.ui.focus;

import androidx.collection.MutableScatterSet;
import androidx.collection.ScatterSet;
import androidx.collection.ScatterSetKt;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.ComposeUiFlags;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.NodeChain;
import androidx.compose.ui.node.NodeKind;
import androidx.exifinterface.media.ExifInterface;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
/* compiled from: FocusInvalidationManager.kt */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\r\b\u0000\u0018\u00002\u00020\u0001BK\u0012\u0018\u0010\u0002\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00050\u0004\u0012\u0004\u0012\u00020\u00050\u0003\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\b0\u0004\u0012\u000e\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\u0004¢\u0006\u0002\u0010\u000bJ\u0006\u0010\u0018\u001a\u00020\u0017J\b\u0010\u0019\u001a\u00020\u0005H\u0002J\b\u0010\u001a\u001a\u00020\u0005H\u0002J\b\u0010\u001b\u001a\u00020\u0005H\u0002J\u000e\u0010\u001c\u001a\u00020\u00052\u0006\u0010\u001d\u001a\u00020\u000eJ\u000e\u0010\u001c\u001a\u00020\u00052\u0006\u0010\u001d\u001a\u00020\u0012J\u000e\u0010\u001c\u001a\u00020\u00052\u0006\u0010\u001d\u001a\u00020\nJ\u0006\u0010\u001e\u001a\u00020\u0005J\b\u0010\u001f\u001a\u00020\u0005H\u0002J%\u0010\u001c\u001a\u00020\u0005\"\u0004\b\u0000\u0010 *\b\u0012\u0004\u0012\u0002H 0\r2\u0006\u0010\u001d\u001a\u0002H H\u0002¢\u0006\u0002\u0010!J%\u0010\"\u001a\u00020\u0005\"\u0004\b\u0000\u0010 *\b\u0012\u0004\u0012\u0002H 0\u00102\u0006\u0010\u001d\u001a\u0002H H\u0002¢\u0006\u0002\u0010#R\u0016\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0010X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00120\u0010X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\n0\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\n0\u0010X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\n0\u0010X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082\u000e¢\u0006\u0002\n\u0000R \u0010\u0002\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00050\u0004\u0012\u0004\u0012\u00020\u00050\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\b0\u0004X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006$"}, d2 = {"Landroidx/compose/ui/focus/FocusInvalidationManager;", "", "onRequestApplyChangesListener", "Lkotlin/Function1;", "Lkotlin/Function0;", "", "invalidateOwnerFocusState", "rootFocusStateFetcher", "Landroidx/compose/ui/focus/FocusState;", "activeFocusTargetNodeFetcher", "Landroidx/compose/ui/focus/FocusTargetNode;", "(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V", "focusEventNodes", "Landroidx/collection/MutableScatterSet;", "Landroidx/compose/ui/focus/FocusEventModifierNode;", "focusEventNodesLegacy", "", "focusPropertiesNodesLegacy", "Landroidx/compose/ui/focus/FocusPropertiesModifierNode;", "focusTargetNodes", "focusTargetNodesLegacy", "focusTargetsWithInvalidatedFocusEventsLegacy", "isInvalidationScheduled", "", "hasPendingInvalidation", "invalidateNodes", "invalidateNodesLegacy", "invalidateNodesOptimized", "scheduleInvalidation", "node", "scheduleInvalidationForOwner", "setUpOnRequestApplyChangesListener", ExifInterface.GPS_DIRECTION_TRUE, "(Landroidx/collection/MutableScatterSet;Ljava/lang/Object;)V", "scheduleInvalidationLegacy", "(Ljava/util/List;Ljava/lang/Object;)V", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class FocusInvalidationManager {
    public static final int $stable = 8;
    private final Function0<FocusTargetNode> activeFocusTargetNodeFetcher;
    private final Function0<Unit> invalidateOwnerFocusState;
    private boolean isInvalidationScheduled;
    private final Function1<Function0<Unit>, Unit> onRequestApplyChangesListener;
    private final Function0<FocusState> rootFocusStateFetcher;
    private final MutableScatterSet<FocusTargetNode> focusTargetNodes = ScatterSetKt.mutableScatterSetOf();
    private final MutableScatterSet<FocusEventModifierNode> focusEventNodes = ScatterSetKt.mutableScatterSetOf();
    private final List<FocusTargetNode> focusTargetNodesLegacy = new ArrayList();
    private final List<FocusEventModifierNode> focusEventNodesLegacy = new ArrayList();
    private final List<FocusPropertiesModifierNode> focusPropertiesNodesLegacy = new ArrayList();
    private final List<FocusTargetNode> focusTargetsWithInvalidatedFocusEventsLegacy = new ArrayList();

    /* JADX WARN: Multi-variable type inference failed */
    public FocusInvalidationManager(Function1<? super Function0<Unit>, Unit> function1, Function0<Unit> function0, Function0<? extends FocusState> function02, Function0<FocusTargetNode> function03) {
        this.onRequestApplyChangesListener = function1;
        this.invalidateOwnerFocusState = function0;
        this.rootFocusStateFetcher = function02;
        this.activeFocusTargetNodeFetcher = function03;
    }

    public final void scheduleInvalidation(FocusTargetNode node) {
        if (ComposeUiFlags.isTrackFocusEnabled) {
            scheduleInvalidation(this.focusTargetNodes, node);
        } else {
            scheduleInvalidationLegacy(this.focusTargetNodesLegacy, node);
        }
    }

    public final void scheduleInvalidation(FocusEventModifierNode node) {
        if (ComposeUiFlags.isTrackFocusEnabled) {
            scheduleInvalidation(this.focusEventNodes, node);
        } else {
            scheduleInvalidationLegacy(this.focusEventNodesLegacy, node);
        }
    }

    public final void scheduleInvalidation(FocusPropertiesModifierNode node) {
        scheduleInvalidationLegacy(this.focusPropertiesNodesLegacy, node);
    }

    public final void scheduleInvalidationForOwner() {
        setUpOnRequestApplyChangesListener();
    }

    public final boolean hasPendingInvalidation() {
        if (ComposeUiFlags.isTrackFocusEnabled) {
            return this.isInvalidationScheduled;
        }
        return (this.focusTargetNodesLegacy.isEmpty() && this.focusPropertiesNodesLegacy.isEmpty() && this.focusEventNodesLegacy.isEmpty()) ? false : true;
    }

    private final <T> void scheduleInvalidation(MutableScatterSet<T> mutableScatterSet, T t) {
        if (mutableScatterSet.add(t)) {
            setUpOnRequestApplyChangesListener();
        }
    }

    private final void setUpOnRequestApplyChangesListener() {
        if (!this.isInvalidationScheduled) {
            this.onRequestApplyChangesListener.invoke(new FocusInvalidationManager$setUpOnRequestApplyChangesListener$1(this));
            this.isInvalidationScheduled = true;
        }
    }

    private final <T> void scheduleInvalidationLegacy(List<T> list, T t) {
        if (list.add(t) && this.focusTargetNodesLegacy.size() + this.focusEventNodesLegacy.size() + this.focusPropertiesNodesLegacy.size() == 1) {
            this.onRequestApplyChangesListener.invoke(new FocusInvalidationManager$scheduleInvalidationLegacy$1(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void invalidateNodes() {
        if (ComposeUiFlags.isTrackFocusEnabled) {
            invalidateNodesOptimized();
        } else {
            invalidateNodesLegacy();
        }
    }

    private final void invalidateNodesOptimized() {
        int j$iv$iv;
        int j$iv$iv2;
        NodeChain nodes$ui_release;
        boolean z;
        FocusTargetNode activeFocusTargetNode = this.activeFocusTargetNodeFetcher.invoke();
        int i = 8;
        if (activeFocusTargetNode == null) {
            ScatterSet this_$iv = this.focusEventNodes;
            Object[] elements$iv = this_$iv.elements;
            long[] m$iv$iv = this_$iv.metadata;
            int lastIndex$iv$iv = m$iv$iv.length - 2;
            int i$iv$iv = 0;
            if (0 <= lastIndex$iv$iv) {
                while (true) {
                    long slot$iv$iv = m$iv$iv[i$iv$iv];
                    boolean z2 = true;
                    ScatterSet this_$iv2 = this_$iv;
                    int $i$f$maskEmptyOrDeleted = ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) > (-9187201950435737472L) ? 1 : ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) == (-9187201950435737472L) ? 0 : -1));
                    if ($i$f$maskEmptyOrDeleted != 0) {
                        int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                        int j$iv$iv3 = 0;
                        while (j$iv$iv3 < bitCount$iv$iv) {
                            long value$iv$iv$iv = slot$iv$iv & 255;
                            if (!(value$iv$iv$iv < 128 ? z2 : false)) {
                                z = z2;
                            } else {
                                int index$iv$iv = (i$iv$iv << 3) + j$iv$iv3;
                                z = z2;
                                ((FocusEventModifierNode) elements$iv[index$iv$iv]).onFocusEvent(FocusStateImpl.Inactive);
                            }
                            slot$iv$iv >>= 8;
                            j$iv$iv3++;
                            z2 = z;
                        }
                        if (bitCount$iv$iv != 8) {
                            break;
                        }
                    }
                    if (i$iv$iv == lastIndex$iv$iv) {
                        break;
                    }
                    i$iv$iv++;
                    this_$iv = this_$iv2;
                }
            }
        } else {
            int i2 = 1;
            if (activeFocusTargetNode.isAttached()) {
                if (this.focusTargetNodes.contains(activeFocusTargetNode)) {
                    activeFocusTargetNode.invalidateFocus$ui_release();
                }
                FocusStateImpl activeFocusTargetNodeState = activeFocusTargetNode.getFocusState();
                int traversedFocusTargetCount = 0;
                FocusTargetNode $this$visitAncestors$iv = activeFocusTargetNode;
                int i3 = 1024;
                int mask$iv = NodeKind.m5898constructorimpl(1024) | NodeKind.m5898constructorimpl(4096);
                boolean value$iv$iv = $this$visitAncestors$iv.getNode().isAttached();
                if (!value$iv$iv) {
                    InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
                }
                Modifier.Node node$iv = $this$visitAncestors$iv.getNode();
                LayoutNode layout$iv = DelegatableNodeKt.requireLayoutNode($this$visitAncestors$iv);
                while (layout$iv != null) {
                    Modifier.Node head$iv = layout$iv.getNodes$ui_release().getHead$ui_release();
                    if ((head$iv.getAggregateChildKindSet$ui_release() & mask$iv) != 0) {
                        while (node$iv != null) {
                            if ((node$iv.getKindSet$ui_release() & mask$iv) != 0) {
                                Modifier.Node it = node$iv;
                                int kind$iv = (it.getKindSet$ui_release() & NodeKind.m5898constructorimpl(i3)) != 0 ? i2 : 0;
                                if (kind$iv != 0) {
                                    traversedFocusTargetCount++;
                                }
                                if ((it instanceof FocusEventModifierNode) && this.focusEventNodes.contains(it)) {
                                    if (traversedFocusTargetCount <= i2) {
                                        ((FocusEventModifierNode) it).onFocusEvent(activeFocusTargetNodeState);
                                    } else {
                                        ((FocusEventModifierNode) it).onFocusEvent(FocusStateImpl.ActiveParent);
                                    }
                                    this.focusEventNodes.remove(it);
                                }
                            }
                            node$iv = node$iv.getParent$ui_release();
                            i3 = 1024;
                            i2 = 1;
                        }
                    }
                    layout$iv = layout$iv.getParent$ui_release();
                    node$iv = (layout$iv == null || (nodes$ui_release = layout$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
                    i3 = 1024;
                    i2 = 1;
                }
                ScatterSet this_$iv3 = this.focusEventNodes;
                Object[] elements$iv2 = this_$iv3.elements;
                long[] m$iv$iv2 = this_$iv3.metadata;
                int lastIndex$iv$iv2 = m$iv$iv2.length - 2;
                int i$iv$iv2 = 0;
                if (0 <= lastIndex$iv$iv2) {
                    while (true) {
                        long slot$iv$iv2 = m$iv$iv2[i$iv$iv2];
                        int i4 = i;
                        int lastIndex$iv$iv3 = lastIndex$iv$iv2;
                        FocusTargetNode activeFocusTargetNode2 = activeFocusTargetNode;
                        FocusStateImpl activeFocusTargetNodeState2 = activeFocusTargetNodeState;
                        if ((((~slot$iv$iv2) << 7) & slot$iv$iv2 & (-9187201950435737472L)) == -9187201950435737472L) {
                            j$iv$iv = i4;
                        } else {
                            int bitCount$iv$iv2 = 8 - ((~(i$iv$iv2 - lastIndex$iv$iv3)) >>> 31);
                            int j$iv$iv4 = 0;
                            while (j$iv$iv4 < bitCount$iv$iv2) {
                                long value$iv$iv$iv2 = slot$iv$iv2 & 255;
                                int $i$f$isFull = value$iv$iv$iv2 < 128 ? 1 : 0;
                                if ($i$f$isFull == 0) {
                                    j$iv$iv2 = j$iv$iv4;
                                } else {
                                    int index$iv$iv2 = (i$iv$iv2 << 3) + j$iv$iv4;
                                    j$iv$iv2 = j$iv$iv4;
                                    ((FocusEventModifierNode) elements$iv2[index$iv$iv2]).onFocusEvent(FocusStateImpl.Inactive);
                                }
                                slot$iv$iv2 >>= i4;
                                j$iv$iv4 = j$iv$iv2 + 1;
                            }
                            j$iv$iv = i4;
                            if (bitCount$iv$iv2 != j$iv$iv) {
                                break;
                            }
                        }
                        lastIndex$iv$iv2 = lastIndex$iv$iv3;
                        if (i$iv$iv2 == lastIndex$iv$iv2) {
                            break;
                        }
                        i$iv$iv2++;
                        i = j$iv$iv;
                        activeFocusTargetNode = activeFocusTargetNode2;
                        activeFocusTargetNodeState = activeFocusTargetNodeState2;
                    }
                }
            }
        }
        this.invalidateOwnerFocusState.invoke();
        this.focusTargetNodes.clear();
        this.focusEventNodes.clear();
        this.isInvalidationScheduled = false;
    }

    private final void invalidateNodesLegacy() {
        int i;
        List $this$fastForEach$iv;
        boolean z;
        int index$iv;
        FocusStateImpl focusStateImpl;
        FocusStateImpl focusStateImpl2;
        Modifier.Node child$iv$iv;
        MutableVector mutableVector;
        Modifier.Node branch$iv$iv;
        DelegatingNode this_$iv$iv$iv;
        Object node$iv$iv;
        int count$iv$iv;
        MutableVector mutableVector2;
        boolean z2;
        int index$iv2;
        DelegatingNode this_$iv$iv$iv2;
        int index$iv3;
        int count$iv$iv2;
        MutableVector mutableVector3;
        List $this$fastForEach$iv2;
        boolean z3;
        int index$iv4;
        boolean z4;
        DelegatingNode this_$iv$iv$iv3;
        int count$iv$iv3;
        MutableVector mutableVector4;
        List $this$fastForEach$iv3;
        boolean z5;
        int index$iv5;
        boolean z6;
        int index$iv6;
        int count$iv$iv4;
        MutableVector mutableVector5;
        if (!this.rootFocusStateFetcher.invoke().getHasFocus()) {
            List $this$fastForEach$iv4 = this.focusEventNodesLegacy;
            int size = $this$fastForEach$iv4.size();
            for (int index$iv7 = 0; index$iv7 < size; index$iv7++) {
                Object item$iv = $this$fastForEach$iv4.get(index$iv7);
                ((FocusEventModifierNode) item$iv).onFocusEvent(FocusStateImpl.Inactive);
            }
            List $this$fastForEach$iv5 = this.focusTargetNodesLegacy;
            int size2 = $this$fastForEach$iv5.size();
            for (int index$iv8 = 0; index$iv8 < size2; index$iv8++) {
                Object item$iv2 = $this$fastForEach$iv5.get(index$iv8);
                FocusTargetNode node = (FocusTargetNode) item$iv2;
                if (node.isAttached() && !node.isInitialized$ui_release()) {
                    node.initializeFocusState$ui_release(FocusStateImpl.Inactive);
                }
            }
            this.focusTargetNodesLegacy.clear();
            this.focusEventNodesLegacy.clear();
            this.focusPropertiesNodesLegacy.clear();
            this.focusTargetsWithInvalidatedFocusEventsLegacy.clear();
            this.invalidateOwnerFocusState.invoke();
            return;
        }
        List $this$fastForEach$iv6 = this.focusPropertiesNodesLegacy;
        boolean z7 = false;
        int index$iv9 = 0;
        int size3 = $this$fastForEach$iv6.size();
        while (true) {
            i = 1024;
            if (index$iv9 >= size3) {
                break;
            }
            Object item$iv3 = $this$fastForEach$iv6.get(index$iv9);
            DelegatableNode it = (FocusPropertiesModifierNode) item$iv3;
            if (it.getNode().isAttached()) {
                DelegatableNode $this$visitSelfAndChildren_u2dY_u2dYKmho_u24default$iv = it;
                int type$iv = NodeKind.m5898constructorimpl(1024);
                Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv$iv = $this$visitSelfAndChildren_u2dY_u2dYKmho_u24default$iv.getNode();
                MutableVector mutableVector6 = null;
                Modifier.Node node2 = $this$dispatchForKind_u2d6rFNWt0$iv$iv;
                while (node2 != null) {
                    if (node2 instanceof FocusTargetNode) {
                        FocusTargetNode focusTarget = (FocusTargetNode) node2;
                        $this$fastForEach$iv3 = $this$fastForEach$iv6;
                        this.focusTargetNodesLegacy.add(focusTarget);
                        z5 = z7;
                        index$iv5 = index$iv9;
                    } else {
                        $this$fastForEach$iv3 = $this$fastForEach$iv6;
                        Modifier.Node this_$iv$iv$iv4 = node2;
                        if (((this_$iv$iv$iv4.getKindSet$ui_release() & type$iv) != 0) && (node2 instanceof DelegatingNode)) {
                            int count$iv$iv5 = 0;
                            DelegatingNode this_$iv$iv$iv5 = (DelegatingNode) node2;
                            Modifier.Node node$iv$iv$iv = this_$iv$iv$iv5.getDelegate$ui_release();
                            while (node$iv$iv$iv != null) {
                                Modifier.Node next$iv$iv = node$iv$iv$iv;
                                if ((next$iv$iv.getKindSet$ui_release() & type$iv) != 0) {
                                    count$iv$iv5++;
                                    z6 = z7;
                                    if (count$iv$iv5 == 1) {
                                        node2 = next$iv$iv;
                                        index$iv6 = index$iv9;
                                    } else {
                                        if (mutableVector6 == null) {
                                            count$iv$iv4 = count$iv$iv5;
                                            index$iv6 = index$iv9;
                                            mutableVector5 = new MutableVector(new Modifier.Node[16], 0);
                                        } else {
                                            count$iv$iv4 = count$iv$iv5;
                                            index$iv6 = index$iv9;
                                            mutableVector5 = mutableVector6;
                                        }
                                        Modifier.Node theNode$iv$iv = node2;
                                        if (theNode$iv$iv != null) {
                                            if (mutableVector5 != null) {
                                                Boolean.valueOf(mutableVector5.add(theNode$iv$iv));
                                            }
                                            node2 = null;
                                        }
                                        if (mutableVector5 != null) {
                                            Boolean.valueOf(mutableVector5.add(next$iv$iv));
                                        }
                                        mutableVector6 = mutableVector5;
                                        count$iv$iv5 = count$iv$iv4;
                                    }
                                } else {
                                    z6 = z7;
                                    index$iv6 = index$iv9;
                                }
                                node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                z7 = z6;
                                index$iv9 = index$iv6;
                            }
                            z5 = z7;
                            index$iv5 = index$iv9;
                            if (count$iv$iv5 == 1) {
                                $this$fastForEach$iv6 = $this$fastForEach$iv3;
                                z7 = z5;
                                index$iv9 = index$iv5;
                            }
                        } else {
                            z5 = z7;
                            index$iv5 = index$iv9;
                        }
                    }
                    node2 = DelegatableNodeKt.pop(mutableVector6);
                    $this$fastForEach$iv6 = $this$fastForEach$iv3;
                    z7 = z5;
                    index$iv9 = index$iv5;
                }
                $this$fastForEach$iv2 = $this$fastForEach$iv6;
                z3 = z7;
                index$iv4 = index$iv9;
                boolean z8 = false;
                boolean value$iv$iv$iv = $this$visitSelfAndChildren_u2dY_u2dYKmho_u24default$iv.getNode().isAttached();
                if (!value$iv$iv$iv) {
                    InlineClassHelperKt.throwIllegalStateException("visitChildren called on an unattached node");
                }
                MutableVector branches$iv$iv = new MutableVector(new Modifier.Node[16], 0);
                Modifier.Node child$iv$iv2 = $this$visitSelfAndChildren_u2dY_u2dYKmho_u24default$iv.getNode().getChild$ui_release();
                if (child$iv$iv2 == null) {
                    DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, $this$visitSelfAndChildren_u2dY_u2dYKmho_u24default$iv.getNode(), false);
                } else {
                    branches$iv$iv.add(child$iv$iv2);
                }
                while (true) {
                    if (branches$iv$iv.getSize() != 0) {
                        Modifier.Node branch$iv$iv2 = (Modifier.Node) branches$iv$iv.removeAt(branches$iv$iv.getSize() - 1);
                        if ((branch$iv$iv2.getAggregateChildKindSet$ui_release() & type$iv) == 0) {
                            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, branch$iv$iv2, false);
                        } else {
                            Modifier.Node node$iv$iv2 = branch$iv$iv2;
                            while (true) {
                                if (node$iv$iv2 == null) {
                                    break;
                                } else if ((node$iv$iv2.getKindSet$ui_release() & type$iv) != 0) {
                                    Object it$iv = node$iv$iv2;
                                    MutableVector mutableVector7 = null;
                                    Modifier.Node child$iv$iv3 = child$iv$iv2;
                                    Object theNode$iv$iv2 = it$iv;
                                    while (theNode$iv$iv2 != null) {
                                        Modifier.Node branch$iv$iv3 = branch$iv$iv2;
                                        if (theNode$iv$iv2 instanceof FocusTargetNode) {
                                            FocusTargetNode focusTarget2 = (FocusTargetNode) theNode$iv$iv2;
                                            z4 = z8;
                                            this.focusTargetNodesLegacy.add(focusTarget2);
                                        } else {
                                            z4 = z8;
                                            Modifier.Node this_$iv$iv$iv6 = theNode$iv$iv2;
                                            if (((this_$iv$iv$iv6.getKindSet$ui_release() & type$iv) != 0) && (theNode$iv$iv2 instanceof DelegatingNode)) {
                                                int count$iv$iv6 = 0;
                                                DelegatingNode this_$iv$iv$iv7 = (DelegatingNode) theNode$iv$iv2;
                                                Modifier.Node node$iv$iv$iv2 = this_$iv$iv$iv7.getDelegate$ui_release();
                                                while (node$iv$iv$iv2 != null) {
                                                    Modifier.Node next$iv$iv2 = node$iv$iv$iv2;
                                                    if ((next$iv$iv2.getKindSet$ui_release() & type$iv) != 0) {
                                                        count$iv$iv6++;
                                                        Modifier.Node node3 = theNode$iv$iv2;
                                                        if (count$iv$iv6 == 1) {
                                                            theNode$iv$iv2 = next$iv$iv2;
                                                            this_$iv$iv$iv3 = this_$iv$iv$iv7;
                                                        } else {
                                                            if (mutableVector7 == null) {
                                                                count$iv$iv3 = count$iv$iv6;
                                                                this_$iv$iv$iv3 = this_$iv$iv$iv7;
                                                                mutableVector4 = new MutableVector(new Modifier.Node[16], 0);
                                                            } else {
                                                                count$iv$iv3 = count$iv$iv6;
                                                                this_$iv$iv$iv3 = this_$iv$iv$iv7;
                                                                mutableVector4 = mutableVector7;
                                                            }
                                                            if (node3 != null) {
                                                                if (mutableVector4 != null) {
                                                                    Boolean.valueOf(mutableVector4.add(node3));
                                                                }
                                                                node3 = null;
                                                            }
                                                            if (mutableVector4 != null) {
                                                                Boolean.valueOf(mutableVector4.add(next$iv$iv2));
                                                            }
                                                            mutableVector7 = mutableVector4;
                                                            theNode$iv$iv2 = node3;
                                                            count$iv$iv6 = count$iv$iv3;
                                                        }
                                                    } else {
                                                        this_$iv$iv$iv3 = this_$iv$iv$iv7;
                                                    }
                                                    node$iv$iv$iv2 = node$iv$iv$iv2.getChild$ui_release();
                                                    this_$iv$iv$iv7 = this_$iv$iv$iv3;
                                                }
                                                Modifier.Node node4 = theNode$iv$iv2;
                                                if (count$iv$iv6 == 1) {
                                                    branch$iv$iv2 = branch$iv$iv3;
                                                    z8 = z4;
                                                    theNode$iv$iv2 = node4;
                                                }
                                            }
                                        }
                                        theNode$iv$iv2 = DelegatableNodeKt.pop(mutableVector7);
                                        branch$iv$iv2 = branch$iv$iv3;
                                        z8 = z4;
                                    }
                                    child$iv$iv2 = child$iv$iv3;
                                } else {
                                    node$iv$iv2 = node$iv$iv2.getChild$ui_release();
                                }
                            }
                        }
                    }
                }
            } else {
                $this$fastForEach$iv2 = $this$fastForEach$iv6;
                z3 = z7;
                index$iv4 = index$iv9;
            }
            index$iv9 = index$iv4 + 1;
            $this$fastForEach$iv6 = $this$fastForEach$iv2;
            z7 = z3;
        }
        this.focusPropertiesNodesLegacy.clear();
        List $this$fastForEach$iv7 = this.focusEventNodesLegacy;
        boolean z9 = false;
        int index$iv10 = 0;
        int size4 = $this$fastForEach$iv7.size();
        while (index$iv10 < size4) {
            Object item$iv4 = $this$fastForEach$iv7.get(index$iv10);
            FocusEventModifierNode focusEventNode = (FocusEventModifierNode) item$iv4;
            if (focusEventNode.getNode().isAttached()) {
                boolean requiresUpdate = true;
                boolean aggregatedNode = false;
                FocusTargetNode focusTargetNode = null;
                FocusEventModifierNode $this$visitSelfAndChildren_u2dY_u2dYKmho_u24default$iv2 = focusEventNode;
                int m5898constructorimpl = NodeKind.m5898constructorimpl(i);
                Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv$iv2 = $this$visitSelfAndChildren_u2dY_u2dYKmho_u24default$iv2.getNode();
                MutableVector mutableVector8 = null;
                Modifier.Node node5 = $this$dispatchForKind_u2d6rFNWt0$iv$iv2;
                while (node5 != null) {
                    List $this$fastForEach$iv8 = $this$fastForEach$iv7;
                    if (node5 instanceof FocusTargetNode) {
                        FocusTargetNode it2 = (FocusTargetNode) node5;
                        if (focusTargetNode != null) {
                            aggregatedNode = true;
                        }
                        focusTargetNode = it2;
                        z2 = z9;
                        if (this.focusTargetNodesLegacy.contains(it2)) {
                            requiresUpdate = false;
                            this.focusTargetsWithInvalidatedFocusEventsLegacy.add(it2);
                        }
                        index$iv2 = index$iv10;
                    } else {
                        z2 = z9;
                        Modifier.Node this_$iv$iv$iv8 = node5;
                        if (((this_$iv$iv$iv8.getKindSet$ui_release() & m5898constructorimpl) != 0) && (node5 instanceof DelegatingNode)) {
                            int count$iv$iv7 = 0;
                            DelegatingNode this_$iv$iv$iv9 = (DelegatingNode) node5;
                            Modifier.Node node$iv$iv$iv3 = this_$iv$iv$iv9.getDelegate$ui_release();
                            while (node$iv$iv$iv3 != null) {
                                Modifier.Node next$iv$iv3 = node$iv$iv$iv3;
                                if ((next$iv$iv3.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                                    count$iv$iv7++;
                                    this_$iv$iv$iv2 = this_$iv$iv$iv9;
                                    if (count$iv$iv7 == 1) {
                                        node5 = next$iv$iv3;
                                        index$iv3 = index$iv10;
                                    } else {
                                        if (mutableVector8 == null) {
                                            count$iv$iv2 = count$iv$iv7;
                                            index$iv3 = index$iv10;
                                            mutableVector3 = new MutableVector(new Modifier.Node[16], 0);
                                        } else {
                                            count$iv$iv2 = count$iv$iv7;
                                            index$iv3 = index$iv10;
                                            mutableVector3 = mutableVector8;
                                        }
                                        Modifier.Node theNode$iv$iv3 = node5;
                                        if (theNode$iv$iv3 != null) {
                                            if (mutableVector3 != null) {
                                                Boolean.valueOf(mutableVector3.add(theNode$iv$iv3));
                                            }
                                            node5 = null;
                                        }
                                        if (mutableVector3 != null) {
                                            Boolean.valueOf(mutableVector3.add(next$iv$iv3));
                                        }
                                        mutableVector8 = mutableVector3;
                                        count$iv$iv7 = count$iv$iv2;
                                    }
                                } else {
                                    this_$iv$iv$iv2 = this_$iv$iv$iv9;
                                    index$iv3 = index$iv10;
                                }
                                node$iv$iv$iv3 = node$iv$iv$iv3.getChild$ui_release();
                                this_$iv$iv$iv9 = this_$iv$iv$iv2;
                                index$iv10 = index$iv3;
                            }
                            index$iv2 = index$iv10;
                            if (count$iv$iv7 == 1) {
                                $this$fastForEach$iv7 = $this$fastForEach$iv8;
                                z9 = z2;
                                index$iv10 = index$iv2;
                            }
                        } else {
                            index$iv2 = index$iv10;
                        }
                    }
                    node5 = DelegatableNodeKt.pop(mutableVector8);
                    $this$fastForEach$iv7 = $this$fastForEach$iv8;
                    z9 = z2;
                    index$iv10 = index$iv2;
                }
                $this$fastForEach$iv = $this$fastForEach$iv7;
                z = z9;
                index$iv = index$iv10;
                boolean value$iv$iv$iv2 = $this$visitSelfAndChildren_u2dY_u2dYKmho_u24default$iv2.getNode().isAttached();
                if (!value$iv$iv$iv2) {
                    InlineClassHelperKt.throwIllegalStateException("visitChildren called on an unattached node");
                }
                MutableVector branches$iv$iv2 = new MutableVector(new Modifier.Node[16], 0);
                Modifier.Node child$iv$iv4 = $this$visitSelfAndChildren_u2dY_u2dYKmho_u24default$iv2.getNode().getChild$ui_release();
                if (child$iv$iv4 == null) {
                    DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv2, $this$visitSelfAndChildren_u2dY_u2dYKmho_u24default$iv2.getNode(), false);
                } else {
                    branches$iv$iv2.add(child$iv$iv4);
                }
                while (true) {
                    MutableVector this_$iv$iv$iv10 = branches$iv$iv2;
                    if (!(this_$iv$iv$iv10.getSize() != 0)) {
                        break;
                    }
                    MutableVector this_$iv$iv$iv11 = branches$iv$iv2;
                    Modifier.Node branch$iv$iv4 = (Modifier.Node) branches$iv$iv2.removeAt(this_$iv$iv$iv11.getSize() - 1);
                    if ((branch$iv$iv4.getAggregateChildKindSet$ui_release() & m5898constructorimpl) == 0) {
                        DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv2, branch$iv$iv4, false);
                        child$iv$iv = child$iv$iv4;
                        mutableVector = branches$iv$iv2;
                    } else {
                        Modifier.Node node$iv$iv3 = branch$iv$iv4;
                        while (node$iv$iv3 != null) {
                            if ((node$iv$iv3.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                                Object it$iv2 = node$iv$iv3;
                                MutableVector mutableVector9 = null;
                                Modifier.Node child$iv$iv5 = child$iv$iv4;
                                Object node$iv$iv4 = it$iv2;
                                while (node$iv$iv4 != null) {
                                    MutableVector branches$iv$iv3 = branches$iv$iv2;
                                    if (node$iv$iv4 instanceof FocusTargetNode) {
                                        FocusTargetNode it3 = (FocusTargetNode) node$iv$iv4;
                                        if (focusTargetNode != null) {
                                            aggregatedNode = true;
                                        }
                                        focusTargetNode = it3;
                                        branch$iv$iv = branch$iv$iv4;
                                        if (this.focusTargetNodesLegacy.contains(it3)) {
                                            requiresUpdate = false;
                                            this.focusTargetsWithInvalidatedFocusEventsLegacy.add(it3);
                                        }
                                    } else {
                                        branch$iv$iv = branch$iv$iv4;
                                        Modifier.Node this_$iv$iv$iv12 = node$iv$iv4;
                                        if (((this_$iv$iv$iv12.getKindSet$ui_release() & m5898constructorimpl) != 0) && (node$iv$iv4 instanceof DelegatingNode)) {
                                            int count$iv$iv8 = 0;
                                            DelegatingNode this_$iv$iv$iv13 = (DelegatingNode) node$iv$iv4;
                                            Modifier.Node node$iv$iv$iv4 = this_$iv$iv$iv13.getDelegate$ui_release();
                                            while (node$iv$iv$iv4 != null) {
                                                Modifier.Node next$iv$iv4 = node$iv$iv$iv4;
                                                if ((next$iv$iv4.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                                                    count$iv$iv8++;
                                                    FocusTargetModifierNode focusTargetModifierNode = node$iv$iv4;
                                                    if (count$iv$iv8 == 1) {
                                                        node$iv$iv = next$iv$iv4;
                                                        this_$iv$iv$iv = this_$iv$iv$iv13;
                                                    } else {
                                                        if (mutableVector9 == null) {
                                                            count$iv$iv = count$iv$iv8;
                                                            this_$iv$iv$iv = this_$iv$iv$iv13;
                                                            mutableVector2 = new MutableVector(new Modifier.Node[16], 0);
                                                        } else {
                                                            count$iv$iv = count$iv$iv8;
                                                            this_$iv$iv$iv = this_$iv$iv$iv13;
                                                            mutableVector2 = mutableVector9;
                                                        }
                                                        if (focusTargetModifierNode != null) {
                                                            if (mutableVector2 != null) {
                                                                Boolean.valueOf(mutableVector2.add(focusTargetModifierNode));
                                                            }
                                                            node$iv$iv = null;
                                                        } else {
                                                            node$iv$iv = focusTargetModifierNode;
                                                        }
                                                        if (mutableVector2 != null) {
                                                            Boolean.valueOf(mutableVector2.add(next$iv$iv4));
                                                        }
                                                        mutableVector9 = mutableVector2;
                                                        count$iv$iv8 = count$iv$iv;
                                                    }
                                                } else {
                                                    this_$iv$iv$iv = this_$iv$iv$iv13;
                                                    node$iv$iv = node$iv$iv4;
                                                }
                                                node$iv$iv$iv4 = node$iv$iv$iv4.getChild$ui_release();
                                                node$iv$iv4 = node$iv$iv;
                                                this_$iv$iv$iv13 = this_$iv$iv$iv;
                                            }
                                            Object node$iv$iv5 = node$iv$iv4;
                                            if (count$iv$iv8 == 1) {
                                                branches$iv$iv2 = branches$iv$iv3;
                                                branch$iv$iv4 = branch$iv$iv;
                                                node$iv$iv4 = node$iv$iv5;
                                            }
                                        }
                                    }
                                    node$iv$iv4 = DelegatableNodeKt.pop(mutableVector9);
                                    branches$iv$iv2 = branches$iv$iv3;
                                    branch$iv$iv4 = branch$iv$iv;
                                }
                                child$iv$iv4 = child$iv$iv5;
                            } else {
                                node$iv$iv3 = node$iv$iv3.getChild$ui_release();
                                child$iv$iv4 = child$iv$iv4;
                            }
                        }
                        child$iv$iv = child$iv$iv4;
                        mutableVector = branches$iv$iv2;
                    }
                    child$iv$iv4 = child$iv$iv;
                    branches$iv$iv2 = mutableVector;
                }
                if (requiresUpdate) {
                    if (aggregatedNode) {
                        focusStateImpl2 = FocusEventModifierNodeKt.getFocusState(focusEventNode);
                    } else {
                        if (focusTargetNode == null || (focusStateImpl = focusTargetNode.getFocusState()) == null) {
                            focusStateImpl = FocusStateImpl.Inactive;
                        }
                        focusStateImpl2 = focusStateImpl;
                    }
                    focusEventNode.onFocusEvent(focusStateImpl2);
                }
            } else {
                focusEventNode.onFocusEvent(FocusStateImpl.Inactive);
                $this$fastForEach$iv = $this$fastForEach$iv7;
                z = z9;
                index$iv = index$iv10;
            }
            index$iv10 = index$iv + 1;
            $this$fastForEach$iv7 = $this$fastForEach$iv;
            z9 = z;
            i = 1024;
        }
        this.focusEventNodesLegacy.clear();
        List $this$fastForEach$iv9 = this.focusTargetNodesLegacy;
        int size5 = $this$fastForEach$iv9.size();
        for (int index$iv11 = 0; index$iv11 < size5; index$iv11++) {
            Object item$iv5 = $this$fastForEach$iv9.get(index$iv11);
            FocusTargetNode it4 = (FocusTargetNode) item$iv5;
            if (it4.isAttached()) {
                FocusStateImpl preInvalidationState = it4.getFocusState();
                it4.invalidateFocus$ui_release();
                if (preInvalidationState != it4.getFocusState() || this.focusTargetsWithInvalidatedFocusEventsLegacy.contains(it4)) {
                    it4.dispatchFocusCallbacks$ui_release();
                }
            }
        }
        this.focusTargetNodesLegacy.clear();
        this.focusTargetsWithInvalidatedFocusEventsLegacy.clear();
        this.invalidateOwnerFocusState.invoke();
        boolean value$iv = this.focusPropertiesNodesLegacy.isEmpty();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("Unprocessed FocusProperties nodes");
        }
        boolean value$iv2 = this.focusEventNodesLegacy.isEmpty();
        if (!value$iv2) {
            InlineClassHelperKt.throwIllegalStateException("Unprocessed FocusEvent nodes");
        }
        boolean value$iv3 = this.focusTargetNodesLegacy.isEmpty();
        if (value$iv3) {
            return;
        }
        InlineClassHelperKt.throwIllegalStateException("Unprocessed FocusTarget nodes");
    }
}
