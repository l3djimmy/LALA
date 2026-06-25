package androidx.compose.ui.focus;

import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.ComposeUiFlags;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.layout.LayoutCoordinatesKt;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.NodeChain;
import androidx.compose.ui.node.NodeCoordinator;
import androidx.compose.ui.node.NodeKind;
import androidx.compose.ui.unit.LayoutDirection;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: FocusTraversal.kt */
@Metadata(d1 = {"\u00006\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a&\u0010\u0007\u001a\u00020\b*\u00020\u00012\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\fH\u0000ø\u0001\u0000¢\u0006\u0004\b\r\u0010\u000e\u001a\u000e\u0010\u000f\u001a\u0004\u0018\u00010\u0001*\u00020\u0001H\u0000\u001a\u000e\u0010\u0010\u001a\u0004\u0018\u00010\u0001*\u00020\u0001H\u0002\u001a\f\u0010\u0011\u001a\u00020\u0012*\u00020\u0001H\u0000\u001aF\u0010\u0013\u001a\u0004\u0018\u00010\u0005*\u00020\u00012\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\f2\b\u0010\u0014\u001a\u0004\u0018\u00010\u00122\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u00050\u0016H\u0000ø\u0001\u0000¢\u0006\u0004\b\u0017\u0010\u0018\"\u001a\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u00018@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0002\u0010\u0003\"\u0018\u0010\u0004\u001a\u00020\u0005*\u00020\u00018@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0004\u0010\u0006\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0019"}, d2 = {"activeChild", "Landroidx/compose/ui/focus/FocusTargetNode;", "getActiveChild", "(Landroidx/compose/ui/focus/FocusTargetNode;)Landroidx/compose/ui/focus/FocusTargetNode;", "isEligibleForFocusSearch", "", "(Landroidx/compose/ui/focus/FocusTargetNode;)Z", "customFocusSearch", "Landroidx/compose/ui/focus/FocusRequester;", "focusDirection", "Landroidx/compose/ui/focus/FocusDirection;", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "customFocusSearch--OM-vw8", "(Landroidx/compose/ui/focus/FocusTargetNode;ILandroidx/compose/ui/unit/LayoutDirection;)Landroidx/compose/ui/focus/FocusRequester;", "findActiveFocusNode", "findNonDeactivatedParent", "focusRect", "Landroidx/compose/ui/geometry/Rect;", "focusSearch", "previouslyFocusedRect", "onFound", "Lkotlin/Function1;", "focusSearch-0X8WOeE", "(Landroidx/compose/ui/focus/FocusTargetNode;ILandroidx/compose/ui/unit/LayoutDirection;Landroidx/compose/ui/geometry/Rect;Lkotlin/jvm/functions/Function1;)Ljava/lang/Boolean;", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class FocusTraversalKt {

    /* compiled from: FocusTraversal.kt */
    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;
        public static final /* synthetic */ int[] $EnumSwitchMapping$1;

        static {
            int[] iArr = new int[LayoutDirection.values().length];
            try {
                iArr[LayoutDirection.Ltr.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[LayoutDirection.Rtl.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            $EnumSwitchMapping$0 = iArr;
            int[] iArr2 = new int[FocusStateImpl.values().length];
            try {
                iArr2[FocusStateImpl.Active.ordinal()] = 1;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr2[FocusStateImpl.ActiveParent.ordinal()] = 2;
            } catch (NoSuchFieldError e4) {
            }
            try {
                iArr2[FocusStateImpl.Captured.ordinal()] = 3;
            } catch (NoSuchFieldError e5) {
            }
            try {
                iArr2[FocusStateImpl.Inactive.ordinal()] = 4;
            } catch (NoSuchFieldError e6) {
            }
            $EnumSwitchMapping$1 = iArr2;
        }
    }

    /* renamed from: customFocusSearch--OM-vw8  reason: not valid java name */
    public static final FocusRequester m3974customFocusSearchOMvw8(FocusTargetNode $this$customFocusSearch_u2d_u2dOM_u2dvw8, int focusDirection, LayoutDirection layoutDirection) {
        FocusRequester redirect$ui_release;
        FocusRequester end;
        FocusRequester start;
        FocusProperties focusProperties = $this$customFocusSearch_u2d_u2dOM_u2dvw8.fetchFocusProperties$ui_release();
        if (FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3940getNextdhqQ8s())) {
            return focusProperties.getNext();
        }
        if (FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3941getPreviousdhqQ8s())) {
            return focusProperties.getPrevious();
        }
        if (FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3943getUpdhqQ8s())) {
            return focusProperties.getUp();
        }
        if (FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3936getDowndhqQ8s())) {
            return focusProperties.getDown();
        }
        if (FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3939getLeftdhqQ8s())) {
            switch (WhenMappings.$EnumSwitchMapping$0[layoutDirection.ordinal()]) {
                case 1:
                    start = focusProperties.getStart();
                    break;
                case 2:
                    start = focusProperties.getEnd();
                    break;
                default:
                    throw new NoWhenBranchMatchedException();
            }
            FocusRequester it = start;
            if (it == FocusRequester.Companion.getDefault()) {
                start = null;
            }
            if (start != null) {
                return start;
            }
            return focusProperties.getLeft();
        } else if (FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3942getRightdhqQ8s())) {
            switch (WhenMappings.$EnumSwitchMapping$0[layoutDirection.ordinal()]) {
                case 1:
                    end = focusProperties.getEnd();
                    break;
                case 2:
                    end = focusProperties.getStart();
                    break;
                default:
                    throw new NoWhenBranchMatchedException();
            }
            FocusRequester it2 = end;
            if (it2 == FocusRequester.Companion.getDefault()) {
                end = null;
            }
            if (end != null) {
                return end;
            }
            return focusProperties.getRight();
        } else {
            if (FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3937getEnterdhqQ8s()) ? true : FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3938getExitdhqQ8s())) {
                CancelIndicatingFocusBoundaryScope scope = new CancelIndicatingFocusBoundaryScope(focusDirection, null);
                FocusTransactionManager focusTransactionManager = FocusTargetNodeKt.getFocusTransactionManager($this$customFocusSearch_u2d_u2dOM_u2dvw8);
                int generationBefore = focusTransactionManager != null ? focusTransactionManager.getGeneration() : 0;
                FocusOwner focusOwner = DelegatableNodeKt.requireOwner($this$customFocusSearch_u2d_u2dOM_u2dvw8).getFocusOwner();
                FocusTargetNode activeNodeBefore = focusOwner.getActiveFocusTargetNode();
                if (FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3937getEnterdhqQ8s())) {
                    focusProperties.getOnEnter().invoke(scope);
                } else {
                    focusProperties.getOnExit().invoke(scope);
                }
                int generationAfter = focusTransactionManager != null ? focusTransactionManager.getGeneration() : 0;
                if (scope.isCanceled()) {
                    redirect$ui_release = FocusRequester.Companion.getCancel();
                } else if (generationBefore != generationAfter || (ComposeUiFlags.isTrackFocusEnabled && activeNodeBefore != focusOwner.getActiveFocusTargetNode())) {
                    redirect$ui_release = FocusRequester.Companion.getRedirect$ui_release();
                } else {
                    redirect$ui_release = FocusRequester.Companion.getDefault();
                }
                return redirect$ui_release;
            }
            throw new IllegalStateException("invalid FocusDirection".toString());
        }
    }

    /* renamed from: focusSearch-0X8WOeE  reason: not valid java name */
    public static final Boolean m3975focusSearch0X8WOeE(FocusTargetNode $this$focusSearch_u2d0X8WOeE, int focusDirection, LayoutDirection layoutDirection, Rect previouslyFocusedRect, Function1<? super FocusTargetNode, Boolean> function1) {
        int direction;
        if (FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3940getNextdhqQ8s()) ? true : FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3941getPreviousdhqQ8s())) {
            return Boolean.valueOf(OneDimensionalFocusSearchKt.m3989oneDimensionalFocusSearchOMvw8($this$focusSearch_u2d0X8WOeE, focusDirection, function1));
        }
        if (FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3939getLeftdhqQ8s()) ? true : FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3942getRightdhqQ8s()) ? true : FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3943getUpdhqQ8s()) ? true : FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3936getDowndhqQ8s())) {
            return TwoDimensionalFocusSearchKt.m3998twoDimensionalFocusSearchsMXa3k8($this$focusSearch_u2d0X8WOeE, focusDirection, previouslyFocusedRect, function1);
        }
        if (FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3937getEnterdhqQ8s())) {
            switch (WhenMappings.$EnumSwitchMapping$0[layoutDirection.ordinal()]) {
                case 1:
                    direction = FocusDirection.Companion.m3942getRightdhqQ8s();
                    break;
                case 2:
                    direction = FocusDirection.Companion.m3939getLeftdhqQ8s();
                    break;
                default:
                    throw new NoWhenBranchMatchedException();
            }
            FocusTargetNode findActiveFocusNode = findActiveFocusNode($this$focusSearch_u2d0X8WOeE);
            if (findActiveFocusNode != null) {
                return TwoDimensionalFocusSearchKt.m3998twoDimensionalFocusSearchsMXa3k8(findActiveFocusNode, direction, previouslyFocusedRect, function1);
            }
            return null;
        } else if (FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3938getExitdhqQ8s())) {
            FocusTargetNode findActiveFocusNode2 = findActiveFocusNode($this$focusSearch_u2d0X8WOeE);
            FocusTargetNode it = findActiveFocusNode2 != null ? findNonDeactivatedParent(findActiveFocusNode2) : null;
            return Boolean.valueOf((it == null || Intrinsics.areEqual(it, $this$focusSearch_u2d0X8WOeE)) ? false : function1.invoke(it).booleanValue());
        } else {
            throw new IllegalStateException(("Focus search invoked with invalid FocusDirection " + ((Object) FocusDirection.m3934toStringimpl(focusDirection))).toString());
        }
    }

    public static final Rect focusRect(FocusTargetNode $this$focusRect) {
        Rect localBoundingBoxOf;
        NodeCoordinator it = $this$focusRect.getCoordinator$ui_release();
        return (it == null || (localBoundingBoxOf = LayoutCoordinatesKt.findRootCoordinates(it).localBoundingBoxOf(it, false)) == null) ? Rect.Companion.getZero() : localBoundingBoxOf;
    }

    public static final boolean isEligibleForFocusSearch(FocusTargetNode $this$isEligibleForFocusSearch) {
        LayoutNode layoutNode;
        LayoutNode layoutNode2;
        NodeCoordinator coordinator$ui_release = $this$isEligibleForFocusSearch.getCoordinator$ui_release();
        if ((coordinator$ui_release == null || (layoutNode2 = coordinator$ui_release.getLayoutNode()) == null || !layoutNode2.isPlaced()) ? false : true) {
            NodeCoordinator coordinator$ui_release2 = $this$isEligibleForFocusSearch.getCoordinator$ui_release();
            if ((coordinator$ui_release2 == null || (layoutNode = coordinator$ui_release2.getLayoutNode()) == null || !layoutNode.isAttached()) ? false : true) {
                return true;
            }
        }
        return false;
    }

    public static final FocusTargetNode getActiveChild(FocusTargetNode $this$activeChild) {
        DelegatableNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
        int type$iv;
        int i;
        boolean z;
        DelegatableNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv2;
        int type$iv2;
        Modifier.Node node;
        MutableVector mutableVector;
        FocusTargetNode focusTargetNode = null;
        if (!$this$activeChild.getNode().isAttached()) {
            return null;
        }
        FocusTargetNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv3 = $this$activeChild;
        int type$iv3 = NodeKind.m5898constructorimpl(1024);
        boolean value$iv$iv$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitChildren called on an unattached node");
        }
        boolean z2 = false;
        MutableVector branches$iv$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3.getNode().getChild$ui_release();
        if (child$iv$iv == null) {
            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, $this$visitChildren_u2dY_u2dYKmho_u24default$iv3.getNode(), false);
        } else {
            branches$iv$iv.add(child$iv$iv);
        }
        while (true) {
            int i2 = 1;
            if (branches$iv$iv.getSize() != 0 ? true : z2) {
                Modifier.Node branch$iv$iv = (Modifier.Node) branches$iv$iv.removeAt(branches$iv$iv.getSize() - 1);
                if ((branch$iv$iv.getAggregateChildKindSet$ui_release() & type$iv3) == 0) {
                    DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, branch$iv$iv, false);
                } else {
                    Modifier.Node node$iv$iv = branch$iv$iv;
                    while (true) {
                        if (node$iv$iv == null) {
                            type$iv3 = type$iv3;
                        } else if ((node$iv$iv.getKindSet$ui_release() & type$iv3) != 0) {
                            Modifier.Node it$iv = node$iv$iv;
                            MutableVector mutableVector2 = null;
                            FocusTargetNode focusTargetNode2 = focusTargetNode;
                            Modifier.Node node2 = it$iv;
                            while (node2 != null) {
                                if (node2 instanceof FocusTargetNode) {
                                    FocusTargetNode it = (FocusTargetNode) node2;
                                    if (it.getNode().isAttached()) {
                                        switch (WhenMappings.$EnumSwitchMapping$1[it.getFocusState().ordinal()]) {
                                            case 1:
                                            case 2:
                                            case 3:
                                                return it;
                                        }
                                    }
                                    $this$visitChildren_u2dY_u2dYKmho_u24default$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                                    type$iv = type$iv3;
                                    i = i2;
                                    z = false;
                                } else {
                                    Modifier.Node this_$iv$iv$iv = node2;
                                    if (((this_$iv$iv$iv.getKindSet$ui_release() & type$iv3) != 0 ? i2 : 0) == 0 || !(node2 instanceof DelegatingNode)) {
                                        $this$visitChildren_u2dY_u2dYKmho_u24default$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                                        type$iv = type$iv3;
                                        i = i2;
                                        z = false;
                                    } else {
                                        int count$iv$iv = 0;
                                        DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node2;
                                        Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                        while (node$iv$iv$iv != null) {
                                            Modifier.Node next$iv$iv = node$iv$iv$iv;
                                            if (((next$iv$iv.getKindSet$ui_release() & type$iv3) != 0 ? i2 : 0) == 0) {
                                                $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                                                type$iv2 = type$iv3;
                                            } else {
                                                count$iv$iv++;
                                                if (count$iv$iv == i2) {
                                                    node2 = next$iv$iv;
                                                    $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                                                    type$iv2 = type$iv3;
                                                } else {
                                                    if (mutableVector2 == null) {
                                                        $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                                                        node = node2;
                                                        type$iv2 = type$iv3;
                                                        mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                    } else {
                                                        $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                                                        node = node2;
                                                        type$iv2 = type$iv3;
                                                        mutableVector = mutableVector2;
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
                                                    mutableVector2 = mutableVector;
                                                    node2 = node;
                                                }
                                            }
                                            node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                            $this$visitChildren_u2dY_u2dYKmho_u24default$iv3 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2;
                                            type$iv3 = type$iv2;
                                            i2 = 1;
                                        }
                                        $this$visitChildren_u2dY_u2dYKmho_u24default$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                                        Modifier.Node node3 = node2;
                                        type$iv = type$iv3;
                                        z = false;
                                        i = 1;
                                        if (count$iv$iv == 1) {
                                            i2 = 1;
                                            z2 = false;
                                            $this$visitChildren_u2dY_u2dYKmho_u24default$iv3 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
                                            node2 = node3;
                                            type$iv3 = type$iv;
                                        }
                                    }
                                }
                                node2 = DelegatableNodeKt.pop(mutableVector2);
                                i2 = i;
                                z2 = z;
                                $this$visitChildren_u2dY_u2dYKmho_u24default$iv3 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
                                type$iv3 = type$iv;
                            }
                            focusTargetNode = focusTargetNode2;
                            type$iv3 = type$iv3;
                        } else {
                            node$iv$iv = node$iv$iv.getChild$ui_release();
                            $this$visitChildren_u2dY_u2dYKmho_u24default$iv3 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                            type$iv3 = type$iv3;
                        }
                    }
                }
            } else {
                return focusTargetNode;
            }
        }
    }

    public static final FocusTargetNode findActiveFocusNode(FocusTargetNode $this$findActiveFocusNode) {
        DelegatableNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
        int type$iv;
        int i;
        boolean z;
        DelegatableNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv2;
        int type$iv2;
        Modifier.Node node;
        MutableVector mutableVector;
        FocusTargetNode focusTargetNode = null;
        if (ComposeUiFlags.isTrackFocusEnabled) {
            FocusTargetNode activeNode = DelegatableNodeKt.requireOwner($this$findActiveFocusNode).getFocusOwner().getActiveFocusTargetNode();
            if (activeNode == null || !activeNode.isAttached()) {
                return null;
            }
            return activeNode;
        }
        switch (WhenMappings.$EnumSwitchMapping$1[$this$findActiveFocusNode.getFocusState().ordinal()]) {
            case 1:
            case 3:
                return $this$findActiveFocusNode;
            case 2:
                FocusTargetNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv3 = $this$findActiveFocusNode;
                int type$iv3 = NodeKind.m5898constructorimpl(1024);
                boolean value$iv$iv$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3.getNode().isAttached();
                if (!value$iv$iv$iv) {
                    InlineClassHelperKt.throwIllegalStateException("visitChildren called on an unattached node");
                }
                boolean z2 = false;
                MutableVector branches$iv$iv = new MutableVector(new Modifier.Node[16], 0);
                Modifier.Node child$iv$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3.getNode().getChild$ui_release();
                if (child$iv$iv == null) {
                    DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, $this$visitChildren_u2dY_u2dYKmho_u24default$iv3.getNode(), false);
                } else {
                    branches$iv$iv.add(child$iv$iv);
                }
                while (true) {
                    int i2 = 1;
                    if (branches$iv$iv.getSize() != 0 ? true : z2) {
                        Modifier.Node branch$iv$iv = (Modifier.Node) branches$iv$iv.removeAt(branches$iv$iv.getSize() - 1);
                        if ((branch$iv$iv.getAggregateChildKindSet$ui_release() & type$iv3) == 0) {
                            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, branch$iv$iv, false);
                        } else {
                            Modifier.Node node$iv$iv = branch$iv$iv;
                            while (true) {
                                if (node$iv$iv == null) {
                                    type$iv3 = type$iv3;
                                } else if ((node$iv$iv.getKindSet$ui_release() & type$iv3) != 0) {
                                    Modifier.Node it$iv = node$iv$iv;
                                    MutableVector mutableVector2 = null;
                                    FocusTargetNode focusTargetNode2 = focusTargetNode;
                                    Modifier.Node node2 = it$iv;
                                    while (node2 != null) {
                                        if (node2 instanceof FocusTargetNode) {
                                            FocusTargetNode node3 = (FocusTargetNode) node2;
                                            FocusTargetNode it = findActiveFocusNode(node3);
                                            if (it != null) {
                                                return it;
                                            }
                                            $this$visitChildren_u2dY_u2dYKmho_u24default$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                                            type$iv = type$iv3;
                                            i = i2;
                                            z = false;
                                        } else {
                                            Modifier.Node this_$iv$iv$iv = node2;
                                            if (((this_$iv$iv$iv.getKindSet$ui_release() & type$iv3) != 0 ? i2 : 0) == 0 || !(node2 instanceof DelegatingNode)) {
                                                $this$visitChildren_u2dY_u2dYKmho_u24default$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                                                type$iv = type$iv3;
                                                i = i2;
                                                z = false;
                                            } else {
                                                int count$iv$iv = 0;
                                                DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node2;
                                                Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                                while (node$iv$iv$iv != null) {
                                                    Modifier.Node next$iv$iv = node$iv$iv$iv;
                                                    if (((next$iv$iv.getKindSet$ui_release() & type$iv3) != 0 ? i2 : 0) == 0) {
                                                        $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                                                        type$iv2 = type$iv3;
                                                    } else {
                                                        count$iv$iv++;
                                                        if (count$iv$iv == i2) {
                                                            node2 = next$iv$iv;
                                                            $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                                                            type$iv2 = type$iv3;
                                                        } else {
                                                            if (mutableVector2 == null) {
                                                                $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                                                                node = node2;
                                                                type$iv2 = type$iv3;
                                                                mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                            } else {
                                                                $this$visitChildren_u2dY_u2dYKmho_u24default$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                                                                node = node2;
                                                                type$iv2 = type$iv3;
                                                                mutableVector = mutableVector2;
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
                                                            mutableVector2 = mutableVector;
                                                            node2 = node;
                                                        }
                                                    }
                                                    node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                                    $this$visitChildren_u2dY_u2dYKmho_u24default$iv3 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv2;
                                                    type$iv3 = type$iv2;
                                                    i2 = 1;
                                                }
                                                $this$visitChildren_u2dY_u2dYKmho_u24default$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                                                Modifier.Node node4 = node2;
                                                type$iv = type$iv3;
                                                z = false;
                                                i = 1;
                                                if (count$iv$iv == 1) {
                                                    i2 = 1;
                                                    z2 = false;
                                                    $this$visitChildren_u2dY_u2dYKmho_u24default$iv3 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
                                                    node2 = node4;
                                                    type$iv3 = type$iv;
                                                }
                                            }
                                        }
                                        node2 = DelegatableNodeKt.pop(mutableVector2);
                                        i2 = i;
                                        z2 = z;
                                        $this$visitChildren_u2dY_u2dYKmho_u24default$iv3 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv;
                                        type$iv3 = type$iv;
                                    }
                                    focusTargetNode = focusTargetNode2;
                                    type$iv3 = type$iv3;
                                } else {
                                    node$iv$iv = node$iv$iv.getChild$ui_release();
                                    $this$visitChildren_u2dY_u2dYKmho_u24default$iv3 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv3;
                                    type$iv3 = type$iv3;
                                }
                            }
                        }
                    } else {
                        return focusTargetNode;
                    }
                }
                break;
            case 4:
                return null;
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    private static final FocusTargetNode findNonDeactivatedParent(FocusTargetNode $this$findNonDeactivatedParent) {
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
        int type$iv;
        boolean includeSelf$iv;
        int i;
        Modifier.Node node;
        NodeChain nodes$ui_release;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
        int type$iv2;
        boolean includeSelf$iv2;
        int i2;
        int type$iv3;
        boolean includeSelf$iv3;
        int i3;
        int type$iv4;
        boolean includeSelf$iv4;
        int i4;
        int count$iv$iv;
        MutableVector mutableVector;
        FocusTargetNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$findNonDeactivatedParent;
        int type$iv5 = NodeKind.m5898constructorimpl(1024);
        boolean includeSelf$iv5 = false;
        int i5 = 0;
        boolean value$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3.getNode().getParent$ui_release();
        LayoutNode layout$iv$iv = DelegatableNodeKt.requireLayoutNode($this$visitAncestors_u2dY_u2dYKmho_u24default$iv3);
        while (layout$iv$iv != null) {
            Modifier.Node head$iv$iv = layout$iv$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv$iv.getAggregateChildKindSet$ui_release() & type$iv5) == 0) {
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                type$iv = type$iv5;
                includeSelf$iv = includeSelf$iv5;
                i = i5;
                node = null;
            } else {
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & type$iv5) == 0) {
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                        type$iv2 = type$iv5;
                        includeSelf$iv2 = includeSelf$iv5;
                        i2 = i5;
                    } else {
                        Modifier.Node it$iv = node$iv$iv;
                        MutableVector mutableVector2 = null;
                        Modifier.Node node2 = it$iv;
                        while (node2 != null) {
                            DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                            if (node2 instanceof FocusTargetNode) {
                                FocusTargetNode it = (FocusTargetNode) node2;
                                if (it.fetchFocusProperties$ui_release().getCanFocus()) {
                                    return it;
                                }
                                type$iv3 = type$iv5;
                                includeSelf$iv3 = includeSelf$iv5;
                                i3 = i5;
                            } else {
                                Modifier.Node this_$iv$iv$iv = node2;
                                if (((this_$iv$iv$iv.getKindSet$ui_release() & type$iv5) != 0 ? 1 : 0) == 0 || !(node2 instanceof DelegatingNode)) {
                                    type$iv3 = type$iv5;
                                    includeSelf$iv3 = includeSelf$iv5;
                                    i3 = i5;
                                } else {
                                    int count$iv$iv2 = 0;
                                    DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node2;
                                    Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                    while (node$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv = node$iv$iv$iv;
                                        if (!((next$iv$iv.getKindSet$ui_release() & type$iv5) != 0)) {
                                            type$iv4 = type$iv5;
                                            includeSelf$iv4 = includeSelf$iv5;
                                            i4 = i5;
                                        } else {
                                            count$iv$iv2++;
                                            type$iv4 = type$iv5;
                                            if (count$iv$iv2 == 1) {
                                                node2 = next$iv$iv;
                                                includeSelf$iv4 = includeSelf$iv5;
                                                i4 = i5;
                                            } else {
                                                if (mutableVector2 != null) {
                                                    count$iv$iv = count$iv$iv2;
                                                    includeSelf$iv4 = includeSelf$iv5;
                                                    i4 = i5;
                                                    mutableVector = mutableVector2;
                                                } else {
                                                    count$iv$iv = count$iv$iv2;
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
                                                count$iv$iv2 = count$iv$iv;
                                            }
                                        }
                                        node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                        type$iv5 = type$iv4;
                                        includeSelf$iv5 = includeSelf$iv4;
                                        i5 = i4;
                                    }
                                    type$iv3 = type$iv5;
                                    includeSelf$iv3 = includeSelf$iv5;
                                    i3 = i5;
                                    if (count$iv$iv2 == 1) {
                                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                                        type$iv5 = type$iv3;
                                        includeSelf$iv5 = includeSelf$iv3;
                                        i5 = i3;
                                    }
                                }
                            }
                            node2 = DelegatableNodeKt.pop(mutableVector2);
                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                            type$iv5 = type$iv3;
                            includeSelf$iv5 = includeSelf$iv3;
                            i5 = i3;
                        }
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                        type$iv2 = type$iv5;
                        includeSelf$iv2 = includeSelf$iv5;
                        i2 = i5;
                    }
                    node$iv$iv = node$iv$iv.getParent$ui_release();
                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                    type$iv5 = type$iv2;
                    includeSelf$iv5 = includeSelf$iv2;
                    i5 = i2;
                }
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                type$iv = type$iv5;
                includeSelf$iv = includeSelf$iv5;
                i = i5;
                node = null;
            }
            layout$iv$iv = layout$iv$iv.getParent$ui_release();
            node$iv$iv = (layout$iv$iv == null || (nodes$ui_release = layout$iv$iv.getNodes$ui_release()) == null) ? node : nodes$ui_release.getTail$ui_release();
            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
            type$iv5 = type$iv;
            includeSelf$iv5 = includeSelf$iv;
            i5 = i;
        }
        return null;
    }
}
