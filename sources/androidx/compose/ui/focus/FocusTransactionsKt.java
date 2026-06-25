package androidx.compose.ui.focus;

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
import androidx.compose.ui.node.ObserverModifierNodeKt;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: FocusTransactions.kt */
@Metadata(d1 = {"\u0000\u001c\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\u001a\f\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0000\u001a \u0010\u0003\u001a\u00020\u0001*\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00012\b\b\u0002\u0010\u0005\u001a\u00020\u0001H\u0002\u001a\u001e\u0010\u0006\u001a\u00020\u0001*\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0000\u001a\f\u0010\u0007\u001a\u00020\u0001*\u00020\u0002H\u0000\u001a\f\u0010\b\u001a\u00020\u0001*\u00020\u0002H\u0002\u001a\u001e\u0010\t\u001a\u00020\n*\u00020\u00022\u0006\u0010\u000b\u001a\u00020\fH\u0000ø\u0001\u0000¢\u0006\u0004\b\r\u0010\u000e\u001a\u001e\u0010\u000f\u001a\u00020\n*\u00020\u00022\u0006\u0010\u000b\u001a\u00020\fH\u0002ø\u0001\u0000¢\u0006\u0004\b\u0010\u0010\u000e\u001a\u001e\u0010\u0011\u001a\u00020\n*\u00020\u00022\u0006\u0010\u000b\u001a\u00020\fH\u0002ø\u0001\u0000¢\u0006\u0004\b\u0012\u0010\u000e\u001a\u001e\u0010\u0013\u001a\u00020\n*\u00020\u00022\u0006\u0010\u000b\u001a\u00020\fH\u0000ø\u0001\u0000¢\u0006\u0004\b\u0014\u0010\u000e\u001a\f\u0010\u0015\u001a\u00020\u0001*\u00020\u0002H\u0000\u001a\f\u0010\u0016\u001a\u00020\u0001*\u00020\u0002H\u0002\u001a\f\u0010\u0017\u001a\u00020\u0001*\u00020\u0002H\u0002\u001a\u0014\u0010\u0018\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0019\u001a\u00020\u0002H\u0002\u001a\f\u0010\u001a\u001a\u00020\u0001*\u00020\u0002H\u0002\u001a\f\u0010\u001b\u001a\u00020\u0002*\u00020\u0002H\u0002\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u001c"}, d2 = {"captureFocus", "", "Landroidx/compose/ui/focus/FocusTargetNode;", "clearChildFocus", "forced", "refreshFocusEvents", "clearFocus", "freeFocus", "grantFocus", "performCustomClearFocus", "Landroidx/compose/ui/focus/CustomDestinationResult;", "focusDirection", "Landroidx/compose/ui/focus/FocusDirection;", "performCustomClearFocus-Mxy_nc0", "(Landroidx/compose/ui/focus/FocusTargetNode;I)Landroidx/compose/ui/focus/CustomDestinationResult;", "performCustomEnter", "performCustomEnter-Mxy_nc0", "performCustomExit", "performCustomExit-Mxy_nc0", "performCustomRequestFocus", "performCustomRequestFocus-Mxy_nc0", "performRequestFocus", "performRequestFocusLegacy", "performRequestFocusOptimized", "requestFocusForChild", "childNode", "requestFocusForOwner", "requireActiveChild", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class FocusTransactionsKt {

    /* compiled from: FocusTransactions.kt */
    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[FocusStateImpl.values().length];
            try {
                iArr[FocusStateImpl.Active.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[FocusStateImpl.Captured.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[FocusStateImpl.ActiveParent.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[FocusStateImpl.Inactive.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    public static final boolean performRequestFocus(FocusTargetNode $this$performRequestFocus) {
        if (ComposeUiFlags.isTrackFocusEnabled) {
            return performRequestFocusOptimized($this$performRequestFocus);
        }
        return performRequestFocusLegacy($this$performRequestFocus);
    }

    /* JADX WARN: Removed duplicated region for block: B:161:0x034d A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static final boolean performRequestFocusOptimized(androidx.compose.ui.focus.FocusTargetNode r38) {
        /*
            Method dump skipped, instructions count: 1029
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.focus.FocusTransactionsKt.performRequestFocusOptimized(androidx.compose.ui.focus.FocusTargetNode):boolean");
    }

    private static final boolean performRequestFocusLegacy(FocusTargetNode $this$performRequestFocusLegacy) {
        boolean success;
        int i;
        FocusTargetNode focusTargetNode;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv;
        boolean z;
        NodeChain nodes$ui_release;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv2;
        int i2;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv3;
        Modifier.Node node;
        int count$iv$iv$iv;
        MutableVector mutableVector;
        int i3 = true;
        switch (WhenMappings.$EnumSwitchMapping$0[$this$performRequestFocusLegacy.getFocusState().ordinal()]) {
            case 1:
            case 2:
                success = true;
                break;
            case 3:
                if (!clearChildFocus$default($this$performRequestFocusLegacy, false, false, 3, null) || !grantFocus($this$performRequestFocusLegacy)) {
                    success = false;
                    break;
                } else {
                    success = true;
                    break;
                }
            case 4:
                FocusTargetNode $this$nearestAncestor_u2d64DMado$iv4 = $this$performRequestFocusLegacy;
                int m5898constructorimpl = NodeKind.m5898constructorimpl(1024);
                boolean value$iv$iv$iv$iv = $this$nearestAncestor_u2d64DMado$iv4.getNode().isAttached();
                if (!value$iv$iv$iv$iv) {
                    InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
                }
                Modifier.Node node$iv$iv$iv = $this$nearestAncestor_u2d64DMado$iv4.getNode().getParent$ui_release();
                LayoutNode layout$iv$iv$iv = DelegatableNodeKt.requireLayoutNode($this$nearestAncestor_u2d64DMado$iv4);
                while (true) {
                    if (layout$iv$iv$iv != null) {
                        Modifier.Node head$iv$iv$iv = layout$iv$iv$iv.getNodes$ui_release().getHead$ui_release();
                        if ((head$iv$iv$iv.getAggregateChildKindSet$ui_release() & m5898constructorimpl) == 0) {
                            $this$nearestAncestor_u2d64DMado$iv = $this$nearestAncestor_u2d64DMado$iv4;
                            z = i3;
                        } else {
                            while (node$iv$iv$iv != null) {
                                if ((node$iv$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                                    Modifier.Node it$iv$iv = node$iv$iv$iv;
                                    MutableVector mutableVector2 = null;
                                    Modifier.Node node2 = it$iv$iv;
                                    while (node2 != null) {
                                        if (node2 instanceof FocusTargetNode) {
                                            focusTargetNode = node2;
                                            i = i3;
                                        } else {
                                            Modifier.Node this_$iv$iv$iv$iv = node2;
                                            if (((this_$iv$iv$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0 ? i3 : 0) == 0 || !(node2 instanceof DelegatingNode)) {
                                                $this$nearestAncestor_u2d64DMado$iv2 = $this$nearestAncestor_u2d64DMado$iv4;
                                                i2 = i3;
                                            } else {
                                                int count$iv$iv$iv2 = 0;
                                                DelegatingNode this_$iv$iv$iv$iv2 = (DelegatingNode) node2;
                                                Modifier.Node node$iv$iv$iv$iv = this_$iv$iv$iv$iv2.getDelegate$ui_release();
                                                while (node$iv$iv$iv$iv != null) {
                                                    Modifier.Node next$iv$iv$iv = node$iv$iv$iv$iv;
                                                    if (((next$iv$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0 ? i3 : 0) == 0) {
                                                        $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv4;
                                                    } else {
                                                        count$iv$iv$iv2++;
                                                        if (count$iv$iv$iv2 == i3) {
                                                            node2 = next$iv$iv$iv;
                                                            $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv4;
                                                        } else {
                                                            if (mutableVector2 != null) {
                                                                $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv4;
                                                                node = node2;
                                                                count$iv$iv$iv = count$iv$iv$iv2;
                                                                mutableVector = mutableVector2;
                                                            } else {
                                                                $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv4;
                                                                node = node2;
                                                                count$iv$iv$iv = count$iv$iv$iv2;
                                                                mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                            }
                                                            Modifier.Node theNode$iv$iv$iv = node;
                                                            if (theNode$iv$iv$iv != null) {
                                                                if (mutableVector != null) {
                                                                    mutableVector.add(theNode$iv$iv$iv);
                                                                }
                                                                node = null;
                                                            }
                                                            if (mutableVector != null) {
                                                                mutableVector.add(next$iv$iv$iv);
                                                            }
                                                            mutableVector2 = mutableVector;
                                                            node2 = node;
                                                            count$iv$iv$iv2 = count$iv$iv$iv;
                                                        }
                                                    }
                                                    node$iv$iv$iv$iv = node$iv$iv$iv$iv.getChild$ui_release();
                                                    $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv3;
                                                    i3 = true;
                                                }
                                                $this$nearestAncestor_u2d64DMado$iv2 = $this$nearestAncestor_u2d64DMado$iv4;
                                                Modifier.Node node3 = node2;
                                                i2 = 1;
                                                if (count$iv$iv$iv2 == 1) {
                                                    i3 = 1;
                                                    $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv2;
                                                    node2 = node3;
                                                }
                                            }
                                            node2 = DelegatableNodeKt.pop(mutableVector2);
                                            i3 = i2;
                                            $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv2;
                                        }
                                    }
                                    continue;
                                }
                                node$iv$iv$iv = node$iv$iv$iv.getParent$ui_release();
                                i3 = i3;
                                $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv4;
                            }
                            $this$nearestAncestor_u2d64DMado$iv = $this$nearestAncestor_u2d64DMado$iv4;
                            z = i3;
                        }
                        layout$iv$iv$iv = layout$iv$iv$iv.getParent$ui_release();
                        node$iv$iv$iv = (layout$iv$iv$iv == null || (nodes$ui_release = layout$iv$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
                        i3 = z;
                        $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv;
                    } else {
                        i = i3;
                        focusTargetNode = null;
                    }
                }
                FocusTargetNode parent = focusTargetNode;
                if (parent != null) {
                    FocusStateImpl prevState = parent.getFocusState();
                    success = requestFocusForChild(parent, $this$performRequestFocusLegacy);
                    if (success && prevState != parent.getFocusState()) {
                        parent.dispatchFocusCallbacks$ui_release();
                        break;
                    }
                } else if (!requestFocusForOwner($this$performRequestFocusLegacy) || !grantFocus($this$performRequestFocusLegacy)) {
                    success = false;
                    break;
                } else {
                    success = i;
                    break;
                }
                break;
            default:
                throw new NoWhenBranchMatchedException();
        }
        if (success) {
            if (ComposeUiFlags.isViewFocusFixEnabled && DelegatableNodeKt.requireLayoutNode($this$performRequestFocusLegacy).getInteropView() == null) {
                DelegatableNodeKt.requireOwner($this$performRequestFocusLegacy).getFocusOwner().mo3951requestFocusForOwner7o62pno(FocusDirection.m3929boximpl(FocusDirection.Companion.m3940getNextdhqQ8s()), null);
            }
            $this$performRequestFocusLegacy.dispatchFocusCallbacks$ui_release();
        }
        return success;
    }

    public static final boolean captureFocus(FocusTargetNode $this$captureFocus) {
        boolean z = false;
        if (ComposeUiFlags.isTrackFocusEnabled) {
            switch (WhenMappings.$EnumSwitchMapping$0[$this$captureFocus.getFocusState().ordinal()]) {
                case 1:
                    DelegatableNodeKt.requireOwner($this$captureFocus).getFocusOwner().setFocusCaptured(true);
                    $this$captureFocus.dispatchFocusCallbacks$ui_release(FocusStateImpl.Active, FocusStateImpl.Captured);
                    return true;
                case 2:
                    return true;
                case 3:
                case 4:
                    return false;
                default:
                    throw new NoWhenBranchMatchedException();
            }
        }
        FocusTransactionManager $this$iv = FocusTargetNodeKt.requireTransactionManager($this$captureFocus);
        try {
            if ($this$iv.getOngoingTransaction()) {
                $this$iv.cancelTransaction();
            }
            $this$iv.beginTransaction();
            switch (WhenMappings.$EnumSwitchMapping$0[$this$captureFocus.getFocusState().ordinal()]) {
                case 1:
                    $this$captureFocus.setFocusState(FocusStateImpl.Captured);
                    $this$captureFocus.dispatchFocusCallbacks$ui_release();
                    z = true;
                    break;
                case 2:
                    z = true;
                    break;
                case 3:
                case 4:
                    break;
                default:
                    throw new NoWhenBranchMatchedException();
            }
            return z;
        } finally {
            $this$iv.commitTransaction();
        }
    }

    public static final boolean freeFocus(FocusTargetNode $this$freeFocus) {
        boolean z = false;
        if (ComposeUiFlags.isTrackFocusEnabled) {
            switch (WhenMappings.$EnumSwitchMapping$0[$this$freeFocus.getFocusState().ordinal()]) {
                case 1:
                    return true;
                case 2:
                    DelegatableNodeKt.requireOwner($this$freeFocus).getFocusOwner().setFocusCaptured(false);
                    $this$freeFocus.dispatchFocusCallbacks$ui_release(FocusStateImpl.Captured, FocusStateImpl.Active);
                    return true;
                case 3:
                case 4:
                    return false;
                default:
                    throw new NoWhenBranchMatchedException();
            }
        }
        FocusTransactionManager $this$iv = FocusTargetNodeKt.requireTransactionManager($this$freeFocus);
        try {
            if ($this$iv.getOngoingTransaction()) {
                $this$iv.cancelTransaction();
            }
            $this$iv.beginTransaction();
            switch (WhenMappings.$EnumSwitchMapping$0[$this$freeFocus.getFocusState().ordinal()]) {
                case 1:
                    z = true;
                    break;
                case 2:
                    $this$freeFocus.setFocusState(FocusStateImpl.Active);
                    $this$freeFocus.dispatchFocusCallbacks$ui_release();
                    z = true;
                    break;
                case 3:
                case 4:
                    break;
                default:
                    throw new NoWhenBranchMatchedException();
            }
            return z;
        } finally {
            $this$iv.commitTransaction();
        }
    }

    public static /* synthetic */ boolean clearFocus$default(FocusTargetNode focusTargetNode, boolean z, boolean z2, int i, Object obj) {
        if ((i & 1) != 0) {
            z = false;
        }
        return clearFocus(focusTargetNode, z, z2);
    }

    public static final boolean clearFocus(FocusTargetNode $this$clearFocus, boolean forced, boolean refreshFocusEvents) {
        switch (WhenMappings.$EnumSwitchMapping$0[$this$clearFocus.getFocusState().ordinal()]) {
            case 1:
                if (ComposeUiFlags.isTrackFocusEnabled) {
                    DelegatableNodeKt.requireOwner($this$clearFocus).getFocusOwner().setActiveFocusTargetNode(null);
                    if (refreshFocusEvents) {
                        $this$clearFocus.dispatchFocusCallbacks$ui_release(FocusStateImpl.Active, FocusStateImpl.Inactive);
                        return true;
                    }
                    return true;
                }
                $this$clearFocus.setFocusState(FocusStateImpl.Inactive);
                if (refreshFocusEvents) {
                    $this$clearFocus.dispatchFocusCallbacks$ui_release();
                    return true;
                }
                return true;
            case 2:
                if (forced) {
                    if (ComposeUiFlags.isTrackFocusEnabled) {
                        DelegatableNodeKt.requireOwner($this$clearFocus).getFocusOwner().setActiveFocusTargetNode(null);
                        if (refreshFocusEvents) {
                            $this$clearFocus.dispatchFocusCallbacks$ui_release(FocusStateImpl.Captured, FocusStateImpl.Inactive);
                        }
                    } else {
                        $this$clearFocus.setFocusState(FocusStateImpl.Inactive);
                        if (refreshFocusEvents) {
                            $this$clearFocus.dispatchFocusCallbacks$ui_release();
                        }
                    }
                }
                return forced;
            case 3:
                if (clearChildFocus($this$clearFocus, forced, refreshFocusEvents)) {
                    if (ComposeUiFlags.isTrackFocusEnabled) {
                        if (refreshFocusEvents) {
                            $this$clearFocus.dispatchFocusCallbacks$ui_release(FocusStateImpl.ActiveParent, FocusStateImpl.Inactive);
                            return true;
                        }
                        return true;
                    }
                    $this$clearFocus.setFocusState(FocusStateImpl.Inactive);
                    if (refreshFocusEvents) {
                        $this$clearFocus.dispatchFocusCallbacks$ui_release();
                        return true;
                    }
                    return true;
                }
                return false;
            case 4:
                return true;
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    private static final boolean grantFocus(final FocusTargetNode $this$grantFocus) {
        ObserverModifierNodeKt.observeReads($this$grantFocus, new Function0<Unit>() { // from class: androidx.compose.ui.focus.FocusTransactionsKt$grantFocus$1
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
                FocusTargetNode.this.fetchFocusProperties$ui_release();
            }
        });
        switch (WhenMappings.$EnumSwitchMapping$0[$this$grantFocus.getFocusState().ordinal()]) {
            case 3:
            case 4:
                if (ComposeUiFlags.isTrackFocusEnabled) {
                    DelegatableNodeKt.requireOwner($this$grantFocus).getFocusOwner().setActiveFocusTargetNode($this$grantFocus);
                    return true;
                }
                $this$grantFocus.setFocusState(FocusStateImpl.Active);
                return true;
            default:
                return true;
        }
    }

    static /* synthetic */ boolean clearChildFocus$default(FocusTargetNode focusTargetNode, boolean z, boolean z2, int i, Object obj) {
        if ((i & 1) != 0) {
            z = false;
        }
        if ((i & 2) != 0) {
            z2 = true;
        }
        return clearChildFocus(focusTargetNode, z, z2);
    }

    private static final boolean clearChildFocus(FocusTargetNode $this$clearChildFocus, boolean forced, boolean refreshFocusEvents) {
        FocusTargetNode activeChild = FocusTraversalKt.getActiveChild($this$clearChildFocus);
        if (activeChild != null) {
            return clearFocus(activeChild, forced, refreshFocusEvents);
        }
        return true;
    }

    private static final boolean requestFocusForChild(FocusTargetNode $this$requestFocusForChild, FocusTargetNode childNode) {
        int i;
        Modifier.Node node;
        int i2;
        Object obj;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv;
        int type$iv;
        boolean z;
        NodeChain nodes$ui_release;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv2;
        boolean z2;
        boolean z3;
        Object node$iv$iv$iv;
        int count$iv$iv$iv;
        MutableVector mutableVector;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv3;
        int type$iv2;
        NodeChain nodes$ui_release2;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv4;
        int type$iv3;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv5;
        int type$iv4;
        int count$iv$iv$iv2;
        MutableVector mutableVector2;
        FocusTargetNode $this$nearestAncestor_u2d64DMado$iv6 = childNode;
        int i3 = 1024;
        int type$iv5 = NodeKind.m5898constructorimpl(1024);
        boolean value$iv$iv$iv$iv = $this$nearestAncestor_u2d64DMado$iv6.getNode().isAttached();
        if (!value$iv$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv$iv$iv2 = $this$nearestAncestor_u2d64DMado$iv6.getNode().getParent$ui_release();
        LayoutNode layout$iv$iv$iv = DelegatableNodeKt.requireLayoutNode($this$nearestAncestor_u2d64DMado$iv6);
        loop0: while (true) {
            int i4 = 1;
            i = i3;
            if (layout$iv$iv$iv != null) {
                Modifier.Node head$iv$iv$iv = layout$iv$iv$iv.getNodes$ui_release().getHead$ui_release();
                if ((head$iv$iv$iv.getAggregateChildKindSet$ui_release() & type$iv5) == 0) {
                    $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv6;
                    type$iv2 = type$iv5;
                } else {
                    while (node$iv$iv$iv2 != null) {
                        if ((node$iv$iv$iv2.getKindSet$ui_release() & type$iv5) != 0) {
                            Modifier.Node it$iv$iv = node$iv$iv$iv2;
                            MutableVector mutableVector3 = null;
                            Modifier.Node node2 = it$iv$iv;
                            while (node2 != null) {
                                if (node2 instanceof FocusTargetNode) {
                                    node = node2;
                                    break loop0;
                                }
                                Modifier.Node this_$iv$iv$iv$iv = node2;
                                if (((this_$iv$iv$iv$iv.getKindSet$ui_release() & type$iv5) != 0 ? i4 : 0) == 0 || !(node2 instanceof DelegatingNode)) {
                                    $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv6;
                                    type$iv3 = type$iv5;
                                } else {
                                    int count$iv$iv$iv3 = 0;
                                    DelegatingNode this_$iv$iv$iv$iv2 = (DelegatingNode) node2;
                                    Modifier.Node node$iv$iv$iv$iv = this_$iv$iv$iv$iv2.getDelegate$ui_release();
                                    while (node$iv$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv$iv = node$iv$iv$iv$iv;
                                        if (((next$iv$iv$iv.getKindSet$ui_release() & type$iv5) != 0 ? i4 : 0) == 0) {
                                            $this$nearestAncestor_u2d64DMado$iv5 = $this$nearestAncestor_u2d64DMado$iv6;
                                            type$iv4 = type$iv5;
                                        } else {
                                            count$iv$iv$iv3++;
                                            if (count$iv$iv$iv3 == i4) {
                                                node2 = next$iv$iv$iv;
                                                $this$nearestAncestor_u2d64DMado$iv5 = $this$nearestAncestor_u2d64DMado$iv6;
                                                type$iv4 = type$iv5;
                                            } else {
                                                if (mutableVector3 != null) {
                                                    $this$nearestAncestor_u2d64DMado$iv5 = $this$nearestAncestor_u2d64DMado$iv6;
                                                    type$iv4 = type$iv5;
                                                    count$iv$iv$iv2 = count$iv$iv$iv3;
                                                    mutableVector2 = mutableVector3;
                                                } else {
                                                    $this$nearestAncestor_u2d64DMado$iv5 = $this$nearestAncestor_u2d64DMado$iv6;
                                                    type$iv4 = type$iv5;
                                                    count$iv$iv$iv2 = count$iv$iv$iv3;
                                                    mutableVector2 = new MutableVector(new Modifier.Node[16], 0);
                                                }
                                                Modifier.Node theNode$iv$iv$iv = node2;
                                                if (theNode$iv$iv$iv != null) {
                                                    if (mutableVector2 != null) {
                                                        mutableVector2.add(theNode$iv$iv$iv);
                                                    }
                                                    node2 = null;
                                                }
                                                if (mutableVector2 != null) {
                                                    mutableVector2.add(next$iv$iv$iv);
                                                }
                                                mutableVector3 = mutableVector2;
                                                count$iv$iv$iv3 = count$iv$iv$iv2;
                                            }
                                        }
                                        node$iv$iv$iv$iv = node$iv$iv$iv$iv.getChild$ui_release();
                                        $this$nearestAncestor_u2d64DMado$iv6 = $this$nearestAncestor_u2d64DMado$iv5;
                                        type$iv5 = type$iv4;
                                        i4 = 1;
                                    }
                                    $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv6;
                                    type$iv3 = type$iv5;
                                    if (count$iv$iv$iv3 == 1) {
                                        $this$nearestAncestor_u2d64DMado$iv6 = $this$nearestAncestor_u2d64DMado$iv4;
                                        type$iv5 = type$iv3;
                                        i4 = 1;
                                    }
                                }
                                node2 = DelegatableNodeKt.pop(mutableVector3);
                                $this$nearestAncestor_u2d64DMado$iv6 = $this$nearestAncestor_u2d64DMado$iv4;
                                type$iv5 = type$iv3;
                                i4 = 1;
                            }
                            continue;
                        }
                        node$iv$iv$iv2 = node$iv$iv$iv2.getParent$ui_release();
                        $this$nearestAncestor_u2d64DMado$iv6 = $this$nearestAncestor_u2d64DMado$iv6;
                        type$iv5 = type$iv5;
                        i4 = 1;
                    }
                    $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv6;
                    type$iv2 = type$iv5;
                }
                layout$iv$iv$iv = layout$iv$iv$iv.getParent$ui_release();
                node$iv$iv$iv2 = (layout$iv$iv$iv == null || (nodes$ui_release2 = layout$iv$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release2.getTail$ui_release();
                i3 = i;
                $this$nearestAncestor_u2d64DMado$iv6 = $this$nearestAncestor_u2d64DMado$iv3;
                type$iv5 = type$iv2;
            } else {
                node = null;
                break;
            }
        }
        if (!Intrinsics.areEqual(node, $this$requestFocusForChild)) {
            throw new IllegalStateException("Non child node cannot request focus.".toString());
        }
        switch (WhenMappings.$EnumSwitchMapping$0[$this$requestFocusForChild.getFocusState().ordinal()]) {
            case 1:
                boolean success = grantFocus(childNode);
                if (success) {
                    $this$requestFocusForChild.setFocusState(FocusStateImpl.ActiveParent);
                    return success;
                }
                return success;
            case 2:
                return false;
            case 3:
                requireActiveChild($this$requestFocusForChild);
                return clearChildFocus$default($this$requestFocusForChild, false, false, 3, null) && grantFocus(childNode);
            case 4:
                FocusTargetNode $this$nearestAncestor_u2d64DMado$iv7 = $this$requestFocusForChild;
                int count$iv$iv$iv4 = NodeKind.m5898constructorimpl(i);
                boolean z4 = false;
                boolean value$iv$iv$iv$iv2 = $this$nearestAncestor_u2d64DMado$iv7.getNode().isAttached();
                if (!value$iv$iv$iv$iv2) {
                    InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
                }
                Modifier.Node node$iv$iv$iv3 = $this$nearestAncestor_u2d64DMado$iv7.getNode().getParent$ui_release();
                LayoutNode layout$iv$iv$iv2 = DelegatableNodeKt.requireLayoutNode($this$nearestAncestor_u2d64DMado$iv7);
                while (true) {
                    if (layout$iv$iv$iv2 != null) {
                        Modifier.Node head$iv$iv$iv2 = layout$iv$iv$iv2.getNodes$ui_release().getHead$ui_release();
                        if ((head$iv$iv$iv2.getAggregateChildKindSet$ui_release() & count$iv$iv$iv4) == 0) {
                            $this$nearestAncestor_u2d64DMado$iv = $this$nearestAncestor_u2d64DMado$iv7;
                            type$iv = count$iv$iv$iv4;
                            z = z4;
                        } else {
                            while (node$iv$iv$iv3 != null) {
                                if ((node$iv$iv$iv3.getKindSet$ui_release() & count$iv$iv$iv4) == 0) {
                                    $this$nearestAncestor_u2d64DMado$iv2 = $this$nearestAncestor_u2d64DMado$iv7;
                                } else {
                                    Object it$iv$iv2 = node$iv$iv$iv3;
                                    MutableVector mutableVector4 = null;
                                    $this$nearestAncestor_u2d64DMado$iv2 = $this$nearestAncestor_u2d64DMado$iv7;
                                    Object node$iv$iv$iv4 = it$iv$iv2;
                                    while (node$iv$iv$iv4 != null) {
                                        int type$iv6 = count$iv$iv$iv4;
                                        if (node$iv$iv$iv4 instanceof FocusTargetNode) {
                                            Object it$iv = node$iv$iv$iv4;
                                            obj = it$iv;
                                            i2 = 1;
                                        } else {
                                            Modifier.Node this_$iv$iv$iv$iv3 = node$iv$iv$iv4;
                                            if (!((this_$iv$iv$iv$iv3.getKindSet$ui_release() & type$iv6) != 0) || !(node$iv$iv$iv4 instanceof DelegatingNode)) {
                                                z2 = z4;
                                            } else {
                                                int count$iv$iv$iv5 = 0;
                                                DelegatingNode this_$iv$iv$iv$iv4 = (DelegatingNode) node$iv$iv$iv4;
                                                Modifier.Node node$iv$iv$iv$iv2 = this_$iv$iv$iv$iv4.getDelegate$ui_release();
                                                while (node$iv$iv$iv$iv2 != null) {
                                                    Modifier.Node next$iv$iv$iv2 = node$iv$iv$iv$iv2;
                                                    if (!((next$iv$iv$iv2.getKindSet$ui_release() & type$iv6) != 0)) {
                                                        z3 = z4;
                                                        node$iv$iv$iv = node$iv$iv$iv4;
                                                    } else {
                                                        count$iv$iv$iv5++;
                                                        Modifier.Node node3 = node$iv$iv$iv4;
                                                        if (count$iv$iv$iv5 == 1) {
                                                            z3 = z4;
                                                            node$iv$iv$iv = next$iv$iv$iv2;
                                                        } else {
                                                            if (mutableVector4 != null) {
                                                                count$iv$iv$iv = count$iv$iv$iv5;
                                                                z3 = z4;
                                                                mutableVector = mutableVector4;
                                                            } else {
                                                                count$iv$iv$iv = count$iv$iv$iv5;
                                                                z3 = z4;
                                                                mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                            }
                                                            if (node3 == null) {
                                                                node$iv$iv$iv = node3;
                                                            } else {
                                                                if (mutableVector != null) {
                                                                    mutableVector.add(node3);
                                                                }
                                                                node$iv$iv$iv = null;
                                                            }
                                                            if (mutableVector != null) {
                                                                mutableVector.add(next$iv$iv$iv2);
                                                            }
                                                            mutableVector4 = mutableVector;
                                                            count$iv$iv$iv5 = count$iv$iv$iv;
                                                        }
                                                    }
                                                    node$iv$iv$iv$iv2 = node$iv$iv$iv$iv2.getChild$ui_release();
                                                    node$iv$iv$iv4 = node$iv$iv$iv;
                                                    z4 = z3;
                                                }
                                                Object node$iv$iv$iv5 = node$iv$iv$iv4;
                                                z2 = z4;
                                                if (count$iv$iv$iv5 == 1) {
                                                    count$iv$iv$iv4 = type$iv6;
                                                    node$iv$iv$iv4 = node$iv$iv$iv5;
                                                    z4 = z2;
                                                }
                                            }
                                            node$iv$iv$iv4 = DelegatableNodeKt.pop(mutableVector4);
                                            count$iv$iv$iv4 = type$iv6;
                                            z4 = z2;
                                        }
                                    }
                                    continue;
                                }
                                node$iv$iv$iv3 = node$iv$iv$iv3.getParent$ui_release();
                                $this$nearestAncestor_u2d64DMado$iv7 = $this$nearestAncestor_u2d64DMado$iv2;
                                count$iv$iv$iv4 = count$iv$iv$iv4;
                                z4 = z4;
                            }
                            $this$nearestAncestor_u2d64DMado$iv = $this$nearestAncestor_u2d64DMado$iv7;
                            type$iv = count$iv$iv$iv4;
                            z = z4;
                        }
                        layout$iv$iv$iv2 = layout$iv$iv$iv2.getParent$ui_release();
                        node$iv$iv$iv3 = (layout$iv$iv$iv2 == null || (nodes$ui_release = layout$iv$iv$iv2.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
                        $this$nearestAncestor_u2d64DMado$iv7 = $this$nearestAncestor_u2d64DMado$iv;
                        count$iv$iv$iv4 = type$iv;
                        z4 = z;
                    } else {
                        i2 = 1;
                        obj = null;
                    }
                }
                FocusTargetNode focusParent = (FocusTargetNode) obj;
                if (focusParent == null && requestFocusForOwner($this$requestFocusForChild)) {
                    boolean success2 = grantFocus(childNode);
                    if (success2) {
                        $this$requestFocusForChild.setFocusState(FocusStateImpl.ActiveParent);
                        return success2;
                    }
                    return success2;
                } else if (focusParent != null && requestFocusForChild(focusParent, $this$requestFocusForChild)) {
                    boolean success3 = requestFocusForChild($this$requestFocusForChild, childNode);
                    if (($this$requestFocusForChild.getFocusState() == FocusStateImpl.ActiveParent ? i2 : 0) != 0) {
                        if (success3) {
                            focusParent.dispatchFocusCallbacks$ui_release();
                        }
                        return success3;
                    }
                    throw new IllegalStateException("Deactivated node is focused".toString());
                } else {
                    return false;
                }
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    private static final boolean requestFocusForOwner(FocusTargetNode $this$requestFocusForOwner) {
        return DelegatableNodeKt.requireOwner($this$requestFocusForOwner).getFocusOwner().mo3951requestFocusForOwner7o62pno(null, null);
    }

    private static final FocusTargetNode requireActiveChild(FocusTargetNode $this$requireActiveChild) {
        FocusTargetNode activeChild = FocusTraversalKt.getActiveChild($this$requireActiveChild);
        if (activeChild != null) {
            return activeChild;
        }
        throw new IllegalArgumentException("ActiveParent with no focused child".toString());
    }

    /* renamed from: performCustomRequestFocus-Mxy_nc0  reason: not valid java name */
    public static final CustomDestinationResult m3973performCustomRequestFocusMxy_nc0(FocusTargetNode $this$performCustomRequestFocus_u2dMxy_nc0, int focusDirection) {
        int i;
        int i2;
        FocusTargetNode focusTargetNode;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv;
        int type$iv;
        boolean z;
        NodeChain nodes$ui_release;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv2;
        int type$iv2;
        boolean z2;
        int i3;
        DelegatableNode $this$nearestAncestor_u2d64DMado$iv3;
        int type$iv3;
        boolean z3;
        MutableVector mutableVector;
        switch (WhenMappings.$EnumSwitchMapping$0[$this$performCustomRequestFocus_u2dMxy_nc0.getFocusState().ordinal()]) {
            case 1:
            case 2:
                return CustomDestinationResult.None;
            case 3:
                return m3970performCustomClearFocusMxy_nc0(requireActiveChild($this$performCustomRequestFocus_u2dMxy_nc0), focusDirection);
            case 4:
                FocusTargetNode $this$nearestAncestor_u2d64DMado$iv4 = $this$performCustomRequestFocus_u2dMxy_nc0;
                int type$iv4 = NodeKind.m5898constructorimpl(1024);
                boolean z4 = false;
                boolean value$iv$iv$iv$iv = $this$nearestAncestor_u2d64DMado$iv4.getNode().isAttached();
                if (!value$iv$iv$iv$iv) {
                    InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
                }
                Modifier.Node node$iv$iv$iv = $this$nearestAncestor_u2d64DMado$iv4.getNode().getParent$ui_release();
                LayoutNode layout$iv$iv$iv = DelegatableNodeKt.requireLayoutNode($this$nearestAncestor_u2d64DMado$iv4);
                while (true) {
                    int i4 = 1;
                    if (layout$iv$iv$iv == null) {
                        i = 1;
                        i2 = 0;
                        focusTargetNode = null;
                    } else {
                        Modifier.Node head$iv$iv$iv = layout$iv$iv$iv.getNodes$ui_release().getHead$ui_release();
                        if ((head$iv$iv$iv.getAggregateChildKindSet$ui_release() & type$iv4) == 0) {
                            $this$nearestAncestor_u2d64DMado$iv = $this$nearestAncestor_u2d64DMado$iv4;
                            type$iv = type$iv4;
                            z = z4;
                        } else {
                            while (node$iv$iv$iv != null) {
                                if ((node$iv$iv$iv.getKindSet$ui_release() & type$iv4) != 0) {
                                    Modifier.Node it$iv$iv = node$iv$iv$iv;
                                    MutableVector mutableVector2 = null;
                                    Modifier.Node node = it$iv$iv;
                                    while (node != null) {
                                        if (node instanceof FocusTargetNode) {
                                            focusTargetNode = node;
                                            i = i4;
                                            i2 = 0;
                                        } else {
                                            Modifier.Node this_$iv$iv$iv$iv = node;
                                            if (((this_$iv$iv$iv$iv.getKindSet$ui_release() & type$iv4) != 0 ? i4 : 0) == 0 || !(node instanceof DelegatingNode)) {
                                                $this$nearestAncestor_u2d64DMado$iv2 = $this$nearestAncestor_u2d64DMado$iv4;
                                                type$iv2 = type$iv4;
                                                z2 = z4;
                                                i3 = i4;
                                            } else {
                                                int count$iv$iv$iv = 0;
                                                DelegatingNode this_$iv$iv$iv$iv2 = (DelegatingNode) node;
                                                Modifier.Node node$iv$iv$iv$iv = this_$iv$iv$iv$iv2.getDelegate$ui_release();
                                                while (node$iv$iv$iv$iv != null) {
                                                    Modifier.Node next$iv$iv$iv = node$iv$iv$iv$iv;
                                                    if (((next$iv$iv$iv.getKindSet$ui_release() & type$iv4) != 0 ? i4 : 0) == 0) {
                                                        $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv4;
                                                        type$iv3 = type$iv4;
                                                        z3 = z4;
                                                    } else {
                                                        count$iv$iv$iv++;
                                                        if (count$iv$iv$iv == i4) {
                                                            node = next$iv$iv$iv;
                                                            $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv4;
                                                            type$iv3 = type$iv4;
                                                            z3 = z4;
                                                        } else {
                                                            if (mutableVector2 != null) {
                                                                $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv4;
                                                                type$iv3 = type$iv4;
                                                                z3 = z4;
                                                                mutableVector = mutableVector2;
                                                            } else {
                                                                $this$nearestAncestor_u2d64DMado$iv3 = $this$nearestAncestor_u2d64DMado$iv4;
                                                                type$iv3 = type$iv4;
                                                                z3 = z4;
                                                                mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                            }
                                                            Modifier.Node theNode$iv$iv$iv = node;
                                                            if (theNode$iv$iv$iv != null) {
                                                                if (mutableVector != null) {
                                                                    mutableVector.add(theNode$iv$iv$iv);
                                                                }
                                                                node = null;
                                                            }
                                                            if (mutableVector != null) {
                                                                mutableVector.add(next$iv$iv$iv);
                                                            }
                                                            mutableVector2 = mutableVector;
                                                        }
                                                    }
                                                    node$iv$iv$iv$iv = node$iv$iv$iv$iv.getChild$ui_release();
                                                    $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv3;
                                                    type$iv4 = type$iv3;
                                                    z4 = z3;
                                                    i4 = 1;
                                                }
                                                $this$nearestAncestor_u2d64DMado$iv2 = $this$nearestAncestor_u2d64DMado$iv4;
                                                type$iv2 = type$iv4;
                                                z2 = z4;
                                                i3 = 1;
                                                if (count$iv$iv$iv == 1) {
                                                    i4 = 1;
                                                    $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv2;
                                                    type$iv4 = type$iv2;
                                                    z4 = z2;
                                                }
                                            }
                                            node = DelegatableNodeKt.pop(mutableVector2);
                                            i4 = i3;
                                            $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv2;
                                            type$iv4 = type$iv2;
                                            z4 = z2;
                                        }
                                    }
                                    continue;
                                }
                                node$iv$iv$iv = node$iv$iv$iv.getParent$ui_release();
                                i4 = i4;
                                $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv4;
                                type$iv4 = type$iv4;
                                z4 = z4;
                            }
                            $this$nearestAncestor_u2d64DMado$iv = $this$nearestAncestor_u2d64DMado$iv4;
                            type$iv = type$iv4;
                            z = z4;
                        }
                        layout$iv$iv$iv = layout$iv$iv$iv.getParent$ui_release();
                        node$iv$iv$iv = (layout$iv$iv$iv == null || (nodes$ui_release = layout$iv$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
                        $this$nearestAncestor_u2d64DMado$iv4 = $this$nearestAncestor_u2d64DMado$iv;
                        type$iv4 = type$iv;
                        z4 = z;
                    }
                }
                FocusTargetNode focusParent = focusTargetNode;
                if (focusParent == null) {
                    return CustomDestinationResult.None;
                }
                switch (WhenMappings.$EnumSwitchMapping$0[focusParent.getFocusState().ordinal()]) {
                    case 1:
                        return m3971performCustomEnterMxy_nc0(focusParent, focusDirection);
                    case 2:
                        return CustomDestinationResult.Cancelled;
                    case 3:
                        return m3973performCustomRequestFocusMxy_nc0(focusParent, focusDirection);
                    case 4:
                        CustomDestinationResult it = m3973performCustomRequestFocusMxy_nc0(focusParent, focusDirection);
                        if (it != CustomDestinationResult.None) {
                            i = i2;
                        }
                        CustomDestinationResult customDestinationResult = i == 0 ? it : null;
                        if (customDestinationResult != null) {
                            return customDestinationResult;
                        }
                        return m3971performCustomEnterMxy_nc0(focusParent, focusDirection);
                    default:
                        throw new NoWhenBranchMatchedException();
                }
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    /* renamed from: performCustomClearFocus-Mxy_nc0  reason: not valid java name */
    public static final CustomDestinationResult m3970performCustomClearFocusMxy_nc0(FocusTargetNode $this$performCustomClearFocus_u2dMxy_nc0, int focusDirection) {
        switch (WhenMappings.$EnumSwitchMapping$0[$this$performCustomClearFocus_u2dMxy_nc0.getFocusState().ordinal()]) {
            case 1:
            case 4:
                return CustomDestinationResult.None;
            case 2:
                return CustomDestinationResult.Cancelled;
            case 3:
                CustomDestinationResult it = m3970performCustomClearFocusMxy_nc0(requireActiveChild($this$performCustomClearFocus_u2dMxy_nc0), focusDirection);
                if (it == CustomDestinationResult.None) {
                    it = null;
                }
                if (it == null) {
                    return m3972performCustomExitMxy_nc0($this$performCustomClearFocus_u2dMxy_nc0, focusDirection);
                }
                return it;
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    /* renamed from: performCustomEnter-Mxy_nc0  reason: not valid java name */
    private static final CustomDestinationResult m3971performCustomEnterMxy_nc0(FocusTargetNode $this$performCustomEnter_u2dMxy_nc0, int focusDirection) {
        int generationBefore$iv$iv;
        CustomDestinationResult customDestinationResult;
        CustomDestinationResult customDestinationResult2;
        if (!$this$performCustomEnter_u2dMxy_nc0.isProcessingCustomEnter) {
            $this$performCustomEnter_u2dMxy_nc0.isProcessingCustomEnter = true;
            try {
                FocusProperties focusProperties$iv$iv = $this$performCustomEnter_u2dMxy_nc0.fetchFocusProperties$ui_release();
                try {
                    CancelIndicatingFocusBoundaryScope scope$iv$iv = new CancelIndicatingFocusBoundaryScope(focusDirection, null);
                    FocusTransactionManager focusTransactionManager$iv$iv = FocusTargetNodeKt.getFocusTransactionManager($this$performCustomEnter_u2dMxy_nc0);
                    if (focusTransactionManager$iv$iv != null) {
                        try {
                            generationBefore$iv$iv = focusTransactionManager$iv$iv.getGeneration();
                        } catch (Throwable th) {
                            th = th;
                            $this$performCustomEnter_u2dMxy_nc0.isProcessingCustomEnter = false;
                            throw th;
                        }
                    } else {
                        generationBefore$iv$iv = 0;
                    }
                    FocusOwner focusOwner$iv$iv = DelegatableNodeKt.requireOwner($this$performCustomEnter_u2dMxy_nc0).getFocusOwner();
                    FocusTargetNode activeNodeBefore$iv$iv = focusOwner$iv$iv.getActiveFocusTargetNode();
                    CancelIndicatingFocusBoundaryScope it$iv = scope$iv$iv;
                    focusProperties$iv$iv.getOnEnter().invoke(it$iv);
                    int generationAfter$iv$iv = focusTransactionManager$iv$iv != null ? focusTransactionManager$iv$iv.getGeneration() : 0;
                    FocusTargetNode activeNodeAfter$iv$iv = focusOwner$iv$iv.getActiveFocusTargetNode();
                    try {
                        if (scope$iv$iv.isCanceled()) {
                            FocusRequester it = FocusRequester.Companion.getCancel();
                            if (it == FocusRequester.Companion.getCancel()) {
                                customDestinationResult2 = CustomDestinationResult.Cancelled;
                            } else if (it != FocusRequester.Companion.getRedirect$ui_release()) {
                                CustomDestinationResult customDestinationResult3 = FocusRequester.m3959requestFocus3ESFkO8$default(it, 0, 1, null) ? CustomDestinationResult.Redirected : CustomDestinationResult.RedirectCancelled;
                                $this$performCustomEnter_u2dMxy_nc0.isProcessingCustomEnter = false;
                                return customDestinationResult3;
                            } else {
                                customDestinationResult2 = CustomDestinationResult.Redirected;
                            }
                            $this$performCustomEnter_u2dMxy_nc0.isProcessingCustomEnter = false;
                            return customDestinationResult2;
                        } else if (generationBefore$iv$iv != generationAfter$iv$iv || (ComposeUiFlags.isTrackFocusEnabled && activeNodeBefore$iv$iv != activeNodeAfter$iv$iv && activeNodeAfter$iv$iv != null)) {
                            FocusRequester it2 = FocusRequester.Companion.getRedirect$ui_release();
                            if (it2 == FocusRequester.Companion.getCancel()) {
                                customDestinationResult = CustomDestinationResult.Cancelled;
                            } else if (it2 != FocusRequester.Companion.getRedirect$ui_release()) {
                                CustomDestinationResult customDestinationResult4 = FocusRequester.m3959requestFocus3ESFkO8$default(it2, 0, 1, null) ? CustomDestinationResult.Redirected : CustomDestinationResult.RedirectCancelled;
                                $this$performCustomEnter_u2dMxy_nc0.isProcessingCustomEnter = false;
                                return customDestinationResult4;
                            } else {
                                customDestinationResult = CustomDestinationResult.Redirected;
                            }
                            $this$performCustomEnter_u2dMxy_nc0.isProcessingCustomEnter = false;
                            return customDestinationResult;
                        } else {
                            $this$performCustomEnter_u2dMxy_nc0.isProcessingCustomEnter = false;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        $this$performCustomEnter_u2dMxy_nc0.isProcessingCustomEnter = false;
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    $this$performCustomEnter_u2dMxy_nc0.isProcessingCustomEnter = false;
                    throw th;
                }
            } catch (Throwable th4) {
                th = th4;
            }
        }
        return CustomDestinationResult.None;
    }

    /* renamed from: performCustomExit-Mxy_nc0  reason: not valid java name */
    private static final CustomDestinationResult m3972performCustomExitMxy_nc0(FocusTargetNode $this$performCustomExit_u2dMxy_nc0, int focusDirection) {
        int generationBefore$iv$iv;
        CustomDestinationResult customDestinationResult;
        CustomDestinationResult customDestinationResult2;
        if (!$this$performCustomExit_u2dMxy_nc0.isProcessingCustomExit) {
            $this$performCustomExit_u2dMxy_nc0.isProcessingCustomExit = true;
            try {
                FocusProperties focusProperties$iv$iv = $this$performCustomExit_u2dMxy_nc0.fetchFocusProperties$ui_release();
                try {
                    CancelIndicatingFocusBoundaryScope scope$iv$iv = new CancelIndicatingFocusBoundaryScope(focusDirection, null);
                    FocusTransactionManager focusTransactionManager$iv$iv = FocusTargetNodeKt.getFocusTransactionManager($this$performCustomExit_u2dMxy_nc0);
                    if (focusTransactionManager$iv$iv != null) {
                        try {
                            generationBefore$iv$iv = focusTransactionManager$iv$iv.getGeneration();
                        } catch (Throwable th) {
                            th = th;
                            $this$performCustomExit_u2dMxy_nc0.isProcessingCustomExit = false;
                            throw th;
                        }
                    } else {
                        generationBefore$iv$iv = 0;
                    }
                    FocusOwner focusOwner$iv$iv = DelegatableNodeKt.requireOwner($this$performCustomExit_u2dMxy_nc0).getFocusOwner();
                    FocusTargetNode activeNodeBefore$iv$iv = focusOwner$iv$iv.getActiveFocusTargetNode();
                    CancelIndicatingFocusBoundaryScope it$iv = scope$iv$iv;
                    focusProperties$iv$iv.getOnExit().invoke(it$iv);
                    int generationAfter$iv$iv = focusTransactionManager$iv$iv != null ? focusTransactionManager$iv$iv.getGeneration() : 0;
                    FocusTargetNode activeNodeAfter$iv$iv = focusOwner$iv$iv.getActiveFocusTargetNode();
                    try {
                        if (scope$iv$iv.isCanceled()) {
                            FocusRequester it = FocusRequester.Companion.getCancel();
                            if (it == FocusRequester.Companion.getCancel()) {
                                customDestinationResult2 = CustomDestinationResult.Cancelled;
                            } else if (it != FocusRequester.Companion.getRedirect$ui_release()) {
                                CustomDestinationResult customDestinationResult3 = FocusRequester.m3959requestFocus3ESFkO8$default(it, 0, 1, null) ? CustomDestinationResult.Redirected : CustomDestinationResult.RedirectCancelled;
                                $this$performCustomExit_u2dMxy_nc0.isProcessingCustomExit = false;
                                return customDestinationResult3;
                            } else {
                                customDestinationResult2 = CustomDestinationResult.Redirected;
                            }
                            $this$performCustomExit_u2dMxy_nc0.isProcessingCustomExit = false;
                            return customDestinationResult2;
                        } else if (generationBefore$iv$iv != generationAfter$iv$iv || (ComposeUiFlags.isTrackFocusEnabled && activeNodeBefore$iv$iv != activeNodeAfter$iv$iv && activeNodeAfter$iv$iv != null)) {
                            FocusRequester it2 = FocusRequester.Companion.getRedirect$ui_release();
                            if (it2 == FocusRequester.Companion.getCancel()) {
                                customDestinationResult = CustomDestinationResult.Cancelled;
                            } else if (it2 != FocusRequester.Companion.getRedirect$ui_release()) {
                                CustomDestinationResult customDestinationResult4 = FocusRequester.m3959requestFocus3ESFkO8$default(it2, 0, 1, null) ? CustomDestinationResult.Redirected : CustomDestinationResult.RedirectCancelled;
                                $this$performCustomExit_u2dMxy_nc0.isProcessingCustomExit = false;
                                return customDestinationResult4;
                            } else {
                                customDestinationResult = CustomDestinationResult.Redirected;
                            }
                            $this$performCustomExit_u2dMxy_nc0.isProcessingCustomExit = false;
                            return customDestinationResult;
                        } else {
                            $this$performCustomExit_u2dMxy_nc0.isProcessingCustomExit = false;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        $this$performCustomExit_u2dMxy_nc0.isProcessingCustomExit = false;
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    $this$performCustomExit_u2dMxy_nc0.isProcessingCustomExit = false;
                    throw th;
                }
            } catch (Throwable th4) {
                th = th4;
            }
        }
        return CustomDestinationResult.None;
    }
}
