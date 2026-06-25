package androidx.compose.ui.focus;

import android.os.Trace;
import androidx.autofill.HintConstants;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.ComposeUiFlags;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.layout.BeyondBoundsLayout;
import androidx.compose.ui.modifier.ModifierLocalModifierNode;
import androidx.compose.ui.node.CompositionLocalConsumerModifierNode;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.ModifierNodeElement;
import androidx.compose.ui.node.NodeChain;
import androidx.compose.ui.node.NodeKind;
import androidx.compose.ui.node.ObserverModifierNode;
import androidx.compose.ui.node.ObserverModifierNodeKt;
import androidx.compose.ui.platform.InspectorInfo;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ReplaceWith;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
/* compiled from: FocusTargetNode.kt */
@Metadata(d1 = {"\u0000|\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\r\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0015\b\u0000\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u00042\u00020\u0005:\u0001SBc\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007\u0012:\b\u0002\u0010\b\u001a4\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\r\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\u000e\u0012\u0004\u0012\u00020\u000f\u0018\u00010\t\u0012\u0016\b\u0002\u0010\u0010\u001a\u0010\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u000f\u0018\u00010\u0011¢\u0006\u0002\u0010\u0012J\r\u0010.\u001a\u00020\u000fH\u0000¢\u0006\u0002\b/J\r\u00100\u001a\u00020\u000fH\u0000¢\u0006\u0002\b1J\u001d\u00100\u001a\u00020\u000f2\u0006\u00102\u001a\u00020\n2\u0006\u00103\u001a\u00020\nH\u0000¢\u0006\u0002\b1J/\u00104\u001a\u00020\u000f2\u0006\u00105\u001a\u0002062\u0012\u00107\u001a\u000e\u0012\u0004\u0012\u000208\u0012\u0004\u0012\u00020\u000f0\u0011H\u0080\bø\u0001\u0000¢\u0006\u0004\b9\u0010:JN\u0010;\u001a\u00020\u000f2\u0006\u00105\u001a\u0002062\u0012\u00107\u001a\u000e\u0012\u0004\u0012\u000208\u0012\u0004\u0012\u00020\u000f0\u00112\u001d\u0010<\u001a\u0019\u0012\u0004\u0012\u00020=\u0012\u0004\u0012\u00020>\u0012\u0004\u0012\u00020\u000f0\t¢\u0006\u0002\b?H\u0082\bø\u0001\u0000¢\u0006\u0004\b@\u0010AJ/\u0010B\u001a\u00020\u000f2\u0006\u00105\u001a\u0002062\u0012\u00107\u001a\u000e\u0012\u0004\u0012\u000208\u0012\u0004\u0012\u00020\u000f0\u0011H\u0080\bø\u0001\u0000¢\u0006\u0004\bC\u0010:J\r\u0010D\u001a\u00020=H\u0000¢\u0006\u0002\bEJ\u0019\u0010F\u001a\u00020\u000f2\n\b\u0002\u0010G\u001a\u0004\u0018\u00010\u0018H\u0000¢\u0006\u0002\bHJ\r\u0010I\u001a\u00020\u000fH\u0000¢\u0006\u0002\bJJ\r\u0010K\u001a\u00020%H\u0000¢\u0006\u0002\bLJ\b\u0010M\u001a\u00020\u000fH\u0016J\b\u0010N\u001a\u00020\u000fH\u0016J\b\u0010O\u001a\u00020\u000fH\u0016J\b\u0010P\u001a\u00020%H\u0017J\u001a\u0010P\u001a\u00020%2\u0006\u00105\u001a\u000206H\u0016ø\u0001\u0000¢\u0006\u0004\bQ\u0010RR\u0013\u0010\u0013\u001a\u0004\u0018\u00010\u00148F¢\u0006\u0006\u001a\u0004\b\u0015\u0010\u0016R\u0010\u0010\u0017\u001a\u0004\u0018\u00010\u0018X\u0082\u000e¢\u0006\u0002\n\u0000R$\u0010\u001a\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u00188V@VX\u0096\u000e¢\u0006\f\u001a\u0004\b\u001b\u0010\u001c\"\u0004\b\u001d\u0010\u001eR,\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0019\u001a\u00020\u0007@VX\u0096\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010#\u001a\u0004\b\u001f\u0010 \"\u0004\b!\u0010\"R\u000e\u0010$\u001a\u00020%X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010&\u001a\u00020%X\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u0010\u0010\u001a\u0010\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u000f\u0018\u00010\u0011X\u0082\u0004¢\u0006\u0002\n\u0000R@\u0010\b\u001a4\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\r\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\u000e\u0012\u0004\u0012\u00020\u000f\u0018\u00010\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010'\u001a\u00020(X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b)\u0010 \"\u0004\b*\u0010\"R\u0014\u0010+\u001a\u00020%X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b,\u0010-\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006T"}, d2 = {"Landroidx/compose/ui/focus/FocusTargetNode;", "Landroidx/compose/ui/node/CompositionLocalConsumerModifierNode;", "Landroidx/compose/ui/focus/FocusTargetModifierNode;", "Landroidx/compose/ui/node/ObserverModifierNode;", "Landroidx/compose/ui/modifier/ModifierLocalModifierNode;", "Landroidx/compose/ui/Modifier$Node;", "focusability", "Landroidx/compose/ui/focus/Focusability;", "onFocusChange", "Lkotlin/Function2;", "Landroidx/compose/ui/focus/FocusState;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "previous", "current", "", "onDispatchEventsCompleted", "Lkotlin/Function1;", "(ILkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "beyondBoundsLayoutParent", "Landroidx/compose/ui/layout/BeyondBoundsLayout;", "getBeyondBoundsLayoutParent", "()Landroidx/compose/ui/layout/BeyondBoundsLayout;", "committedFocusState", "Landroidx/compose/ui/focus/FocusStateImpl;", "value", "focusState", "getFocusState", "()Landroidx/compose/ui/focus/FocusStateImpl;", "setFocusState", "(Landroidx/compose/ui/focus/FocusStateImpl;)V", "getFocusability-LCbbffg", "()I", "setFocusability-josRg5g", "(I)V", "I", "isProcessingCustomEnter", "", "isProcessingCustomExit", "previouslyFocusedChildHash", "", "getPreviouslyFocusedChildHash", "setPreviouslyFocusedChildHash", "shouldAutoInvalidate", "getShouldAutoInvalidate", "()Z", "commitFocusState", "commitFocusState$ui_release", "dispatchFocusCallbacks", "dispatchFocusCallbacks$ui_release", "previousState", "newState", "fetchCustomEnter", "focusDirection", "Landroidx/compose/ui/focus/FocusDirection;", "block", "Landroidx/compose/ui/focus/FocusRequester;", "fetchCustomEnter-aToIllA$ui_release", "(ILkotlin/jvm/functions/Function1;)V", "fetchCustomEnterOrExit", "enterOrExit", "Landroidx/compose/ui/focus/FocusProperties;", "Landroidx/compose/ui/focus/FocusEnterExitScope;", "Lkotlin/ExtensionFunctionType;", "fetchCustomEnterOrExit-ULY8qGw", "(ILkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V", "fetchCustomExit", "fetchCustomExit-aToIllA$ui_release", "fetchFocusProperties", "fetchFocusProperties$ui_release", "initializeFocusState", "initialFocusState", "initializeFocusState$ui_release", "invalidateFocus", "invalidateFocus$ui_release", "isInitialized", "isInitialized$ui_release", "onAttach", "onDetach", "onObservedReadsChanged", "requestFocus", "requestFocus-3ESFkO8", "(I)Z", "FocusTargetElement", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class FocusTargetNode extends Modifier.Node implements CompositionLocalConsumerModifierNode, FocusTargetModifierNode, ObserverModifierNode, ModifierLocalModifierNode {
    public static final int $stable = 8;
    private FocusStateImpl committedFocusState;
    private int focusability;
    private boolean isProcessingCustomEnter;
    private boolean isProcessingCustomExit;
    private final Function1<FocusTargetNode, Unit> onDispatchEventsCompleted;
    private final Function2<FocusState, FocusState, Unit> onFocusChange;
    private int previouslyFocusedChildHash;
    private final boolean shouldAutoInvalidate;

    /* compiled from: FocusTargetNode.kt */
    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;
        public static final /* synthetic */ int[] $EnumSwitchMapping$1;

        static {
            int[] iArr = new int[CustomDestinationResult.values().length];
            try {
                iArr[CustomDestinationResult.None.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[CustomDestinationResult.Redirected.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[CustomDestinationResult.Cancelled.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[CustomDestinationResult.RedirectCancelled.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            $EnumSwitchMapping$0 = iArr;
            int[] iArr2 = new int[FocusStateImpl.values().length];
            try {
                iArr2[FocusStateImpl.Active.ordinal()] = 1;
            } catch (NoSuchFieldError e5) {
            }
            try {
                iArr2[FocusStateImpl.Captured.ordinal()] = 2;
            } catch (NoSuchFieldError e6) {
            }
            try {
                iArr2[FocusStateImpl.ActiveParent.ordinal()] = 3;
            } catch (NoSuchFieldError e7) {
            }
            try {
                iArr2[FocusStateImpl.Inactive.ordinal()] = 4;
            } catch (NoSuchFieldError e8) {
            }
            $EnumSwitchMapping$1 = iArr2;
        }
    }

    public /* synthetic */ FocusTargetNode(int i, Function2 function2, Function1 function1, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, function2, function1);
    }

    public /* synthetic */ FocusTargetNode(int i, Function2 function2, Function1 function1, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this((i2 & 1) != 0 ? Focusability.Companion.m3984getAlwaysLCbbffg() : i, (i2 & 2) != 0 ? null : function2, (i2 & 4) != 0 ? null : function1, null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private FocusTargetNode(int focusability, Function2<? super FocusState, ? super FocusState, Unit> function2, Function1<? super FocusTargetNode, Unit> function1) {
        this.onFocusChange = function2;
        this.onDispatchEventsCompleted = function1;
        this.focusability = focusability;
    }

    @Override // androidx.compose.ui.Modifier.Node
    public boolean getShouldAutoInvalidate() {
        return this.shouldAutoInvalidate;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // androidx.compose.ui.focus.FocusTargetModifierNode
    public FocusStateImpl getFocusState() {
        FocusStateImpl uncommittedFocusState;
        FocusOwner focusOwner;
        FocusTargetNode activeNode;
        FocusOwner focusOwner2;
        FocusTargetNode activeNode2;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
        NodeChain nodes$ui_release;
        FocusOwner focusOwner3;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
        MutableVector mutableVector;
        Modifier.Node node;
        int count$iv$iv;
        MutableVector mutableVector2;
        if (!ComposeUiFlags.isTrackFocusEnabled) {
            FocusTransactionManager $this$_get_focusState__u24lambda_u241 = FocusTargetNodeKt.getFocusTransactionManager(this);
            if ($this$_get_focusState__u24lambda_u241 == null || (uncommittedFocusState = $this$_get_focusState__u24lambda_u241.getUncommittedFocusState(this)) == null) {
                FocusStateImpl focusStateImpl = this.committedFocusState;
                return focusStateImpl == null ? FocusStateImpl.Inactive : focusStateImpl;
            }
            return uncommittedFocusState;
        }
        if (isAttached() && (activeNode = (focusOwner = DelegatableNodeKt.requireOwner(this).getFocusOwner()).getActiveFocusTargetNode()) != null) {
            if (this == activeNode) {
                return focusOwner.isFocusCaptured() ? FocusStateImpl.Captured : FocusStateImpl.Active;
            }
            if (activeNode.isAttached()) {
                FocusTargetNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4 = activeNode;
                int m5898constructorimpl = NodeKind.m5898constructorimpl(1024);
                boolean value$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4.getNode().isAttached();
                if (!value$iv$iv$iv) {
                    InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
                }
                Modifier.Node node$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4.getNode().getParent$ui_release();
                LayoutNode layout$iv$iv = DelegatableNodeKt.requireLayoutNode($this$visitAncestors_u2dY_u2dYKmho_u24default$iv4);
                while (layout$iv$iv != null) {
                    Modifier.Node head$iv$iv = layout$iv$iv.getNodes$ui_release().getHead$ui_release();
                    if ((head$iv$iv.getAggregateChildKindSet$ui_release() & m5898constructorimpl) != 0) {
                        while (node$iv$iv != null) {
                            if ((node$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                                MutableVector mutableVector3 = null;
                                focusOwner3 = focusOwner;
                                Modifier.Node node2 = node$iv$iv;
                                while (node2 != null) {
                                    FocusTargetNode activeNode3 = activeNode;
                                    if (node2 instanceof FocusTargetNode) {
                                        FocusTargetNode it = (FocusTargetNode) node2;
                                        if (this == it) {
                                            return FocusStateImpl.ActiveParent;
                                        }
                                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                                    } else {
                                        Modifier.Node this_$iv$iv$iv = node2;
                                        if (((this_$iv$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0 ? 1 : 0) == 0 || !(node2 instanceof DelegatingNode)) {
                                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                                        } else {
                                            int count$iv$iv2 = 0;
                                            DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node2;
                                            Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                            while (node$iv$iv$iv != null) {
                                                FocusTargetNode focusTargetNode = node$iv$iv$iv;
                                                if ((focusTargetNode.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                                                    count$iv$iv2++;
                                                    FocusTargetNode focusTargetNode2 = node2;
                                                    if (count$iv$iv2 == 1) {
                                                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                                                        mutableVector = mutableVector3;
                                                        node = focusTargetNode;
                                                    } else {
                                                        if (mutableVector3 == null) {
                                                            count$iv$iv = count$iv$iv2;
                                                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                                                            mutableVector2 = new MutableVector(new Modifier.Node[16], 0);
                                                        } else {
                                                            count$iv$iv = count$iv$iv2;
                                                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                                                            mutableVector2 = mutableVector3;
                                                        }
                                                        if (focusTargetNode2 != null) {
                                                            if (mutableVector2 != null) {
                                                                mutableVector2.add(focusTargetNode2);
                                                            }
                                                            node = null;
                                                        } else {
                                                            node = focusTargetNode2;
                                                        }
                                                        if (mutableVector2 != null) {
                                                            mutableVector2.add(focusTargetNode);
                                                        }
                                                        mutableVector = mutableVector2;
                                                        count$iv$iv2 = count$iv$iv;
                                                    }
                                                } else {
                                                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                                                    mutableVector = mutableVector3;
                                                    node = node2;
                                                }
                                                node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                                node2 = node;
                                                mutableVector3 = mutableVector;
                                                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                                            }
                                            Modifier.Node node3 = node2;
                                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                                            if (count$iv$iv2 == 1) {
                                                activeNode = activeNode3;
                                                node2 = node3;
                                                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                                            }
                                        }
                                    }
                                    node2 = DelegatableNodeKt.pop(mutableVector3);
                                    activeNode = activeNode3;
                                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                                }
                                continue;
                            } else {
                                focusOwner3 = focusOwner;
                            }
                            node$iv$iv = node$iv$iv.getParent$ui_release();
                            focusOwner = focusOwner3;
                            activeNode = activeNode;
                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                        }
                        focusOwner2 = focusOwner;
                        activeNode2 = activeNode;
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                    } else {
                        focusOwner2 = focusOwner;
                        activeNode2 = activeNode;
                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4;
                    }
                    layout$iv$iv = layout$iv$iv.getParent$ui_release();
                    node$iv$iv = (layout$iv$iv == null || (nodes$ui_release = layout$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
                    focusOwner = focusOwner2;
                    activeNode = activeNode2;
                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv4 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
                }
            }
            return FocusStateImpl.Inactive;
        }
        return FocusStateImpl.Inactive;
    }

    public void setFocusState(FocusStateImpl value) {
        if (!ComposeUiFlags.isTrackFocusEnabled) {
            FocusTransactionManager $this$_set_focusState__u24lambda_u242 = FocusTargetNodeKt.requireTransactionManager(this);
            $this$_set_focusState__u24lambda_u242.setUncommittedFocusState(this, value);
        }
    }

    @Override // androidx.compose.ui.focus.FocusTargetModifierNode
    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Use the version accepting FocusDirection", replaceWith = @ReplaceWith(expression = "this.requestFocus()", imports = {}))
    public /* synthetic */ boolean requestFocus() {
        return mo3963requestFocus3ESFkO8(FocusDirection.Companion.m3937getEnterdhqQ8s());
    }

    @Override // androidx.compose.ui.focus.FocusTargetModifierNode
    /* renamed from: requestFocus-3ESFkO8 */
    public boolean mo3963requestFocus3ESFkO8(int focusDirection) {
        Trace.beginSection("FocusTransactions:requestFocus");
        try {
            boolean z = false;
            if (fetchFocusProperties$ui_release().getCanFocus()) {
                if (ComposeUiFlags.isTrackFocusEnabled) {
                    switch (WhenMappings.$EnumSwitchMapping$0[FocusTransactionsKt.m3973performCustomRequestFocusMxy_nc0(this, focusDirection).ordinal()]) {
                        case 1:
                            z = FocusTransactionsKt.performRequestFocus(this);
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
                } else {
                    FocusTransactionManager this_$iv = FocusTargetNodeKt.requireTransactionManager(this);
                    Function0 onCancelled$iv = new Function0<Unit>() { // from class: androidx.compose.ui.focus.FocusTargetNode$requestFocus$1$1
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
                            if (FocusTargetNode.this.getNode().isAttached()) {
                                FocusTargetNode.this.dispatchFocusCallbacks$ui_release();
                            }
                        }
                    };
                    if (this_$iv.getOngoingTransaction()) {
                        FocusTransactionManager.access$cancelTransaction(this_$iv);
                    }
                    FocusTransactionManager.access$beginTransaction(this_$iv);
                    MutableVector this_$iv$iv = FocusTransactionManager.access$getCancellationListener$p(this_$iv);
                    this_$iv$iv.add(onCancelled$iv);
                    switch (WhenMappings.$EnumSwitchMapping$0[FocusTransactionsKt.m3973performCustomRequestFocusMxy_nc0(this, focusDirection).ordinal()]) {
                        case 1:
                            z = FocusTransactionsKt.performRequestFocus(this);
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
                    FocusTransactionManager.access$commitTransaction(this_$iv);
                }
            }
            return z;
        } finally {
            Trace.endSection();
        }
    }

    @Override // androidx.compose.ui.focus.FocusTargetModifierNode
    /* renamed from: getFocusability-LCbbffg */
    public int mo3962getFocusabilityLCbbffg() {
        return this.focusability;
    }

    @Override // androidx.compose.ui.focus.FocusTargetModifierNode
    /* renamed from: setFocusability-josRg5g */
    public void mo3964setFocusabilityjosRg5g(int value) {
        if (!Focusability.m3980equalsimpl0(this.focusability, value)) {
            this.focusability = value;
            if (ComposeUiFlags.isTrackFocusEnabled) {
                if (isAttached() && this == DelegatableNodeKt.requireOwner(this).getFocusOwner().getActiveFocusTargetNode() && !Focusability.m3977canFocusimpl$ui_release(this.focusability, this)) {
                    FocusTransactionsKt.clearFocus(this, true, true);
                }
            } else if (isAttached() && isInitialized$ui_release()) {
                onObservedReadsChanged();
            }
        }
    }

    public final int getPreviouslyFocusedChildHash() {
        return this.previouslyFocusedChildHash;
    }

    public final void setPreviouslyFocusedChildHash(int i) {
        this.previouslyFocusedChildHash = i;
    }

    public final BeyondBoundsLayout getBeyondBoundsLayoutParent() {
        return (BeyondBoundsLayout) getCurrent(androidx.compose.ui.layout.BeyondBoundsLayoutKt.getModifierLocalBeyondBoundsLayout());
    }

    @Override // androidx.compose.ui.node.ObserverModifierNode
    public void onObservedReadsChanged() {
        if (ComposeUiFlags.isTrackFocusEnabled) {
            invalidateFocus$ui_release();
            return;
        }
        FocusStateImpl previousFocusState = getFocusState();
        invalidateFocus$ui_release();
        if (previousFocusState != getFocusState()) {
            dispatchFocusCallbacks$ui_release();
        }
    }

    @Override // androidx.compose.ui.Modifier.Node
    public void onAttach() {
        if (ComposeUiFlags.isTrackFocusEnabled) {
            return;
        }
        FocusTargetNodeKt.invalidateFocusTarget(this);
    }

    @Override // androidx.compose.ui.Modifier.Node
    public void onDetach() {
        switch (WhenMappings.$EnumSwitchMapping$1[getFocusState().ordinal()]) {
            case 1:
            case 2:
                FocusOwner focusOwner = DelegatableNodeKt.requireOwner(this).getFocusOwner();
                focusOwner.mo3947clearFocusI7lrPNg(true, true, false, FocusDirection.Companion.m3938getExitdhqQ8s());
                if (ComposeUiFlags.isTrackFocusEnabled) {
                    focusOwner.scheduleInvalidationForOwner();
                    break;
                } else {
                    FocusTargetNodeKt.invalidateFocusTarget(this);
                    break;
                }
            case 3:
                if (!ComposeUiFlags.isTrackFocusEnabled) {
                    FocusTransactionManager $this$iv = FocusTargetNodeKt.requireTransactionManager(this);
                    try {
                        if ($this$iv.getOngoingTransaction()) {
                            FocusTransactionManager.access$cancelTransaction($this$iv);
                        }
                        FocusTransactionManager.access$beginTransaction($this$iv);
                        setFocusState(FocusStateImpl.Inactive);
                        Unit unit = Unit.INSTANCE;
                        break;
                    } finally {
                        FocusTransactionManager.access$commitTransaction($this$iv);
                    }
                }
                break;
        }
        this.committedFocusState = null;
    }

    public final FocusProperties fetchFocusProperties$ui_release() {
        FocusPropertiesImpl properties;
        FocusPropertiesImpl properties2;
        DelegatableNode $this$visitSelfAndAncestors_u2d5BbP62I$iv;
        int type$iv;
        int untilType$iv;
        NodeChain nodes$ui_release;
        DelegatableNode $this$visitSelfAndAncestors_u2d5BbP62I$iv2;
        int type$iv2;
        int untilType$iv2;
        DelegatingNode this_$iv$iv$iv;
        int type$iv3;
        int untilType$iv3;
        int count$iv$iv;
        MutableVector mutableVector;
        FocusPropertiesImpl properties3 = new FocusPropertiesImpl();
        properties3.setCanFocus(Focusability.m3977canFocusimpl$ui_release(mo3962getFocusabilityLCbbffg(), this));
        FocusTargetNode $this$visitSelfAndAncestors_u2d5BbP62I$iv3 = this;
        int type$iv4 = NodeKind.m5898constructorimpl(2048);
        int untilType$iv4 = NodeKind.m5898constructorimpl(1024);
        Modifier.Node self$iv = $this$visitSelfAndAncestors_u2d5BbP62I$iv3.getNode();
        int mask$iv$iv = type$iv4 | untilType$iv4;
        boolean value$iv$iv$iv = $this$visitSelfAndAncestors_u2d5BbP62I$iv3.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv$iv = $this$visitSelfAndAncestors_u2d5BbP62I$iv3.getNode();
        LayoutNode layout$iv$iv = DelegatableNodeKt.requireLayoutNode($this$visitSelfAndAncestors_u2d5BbP62I$iv3);
        loop0: while (true) {
            if (layout$iv$iv == null) {
                properties = properties3;
                break;
            }
            Modifier.Node head$iv$iv = layout$iv$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv$iv.getAggregateChildKindSet$ui_release() & mask$iv$iv) != 0) {
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & mask$iv$iv) != 0) {
                        Modifier.Node it$iv = node$iv$iv;
                        if (it$iv != self$iv) {
                            if ((it$iv.getKindSet$ui_release() & untilType$iv4) != 0) {
                                properties = properties3;
                                break loop0;
                            }
                        }
                        if ((it$iv.getKindSet$ui_release() & type$iv4) != 0) {
                            MutableVector mutableVector2 = null;
                            Modifier.Node this_$iv$iv$iv2 = it$iv;
                            while (this_$iv$iv$iv2 != null) {
                                FocusPropertiesImpl properties4 = properties3;
                                if (this_$iv$iv$iv2 instanceof FocusPropertiesModifierNode) {
                                    FocusPropertiesModifierNode it = (FocusPropertiesModifierNode) this_$iv$iv$iv2;
                                    $this$visitSelfAndAncestors_u2d5BbP62I$iv2 = $this$visitSelfAndAncestors_u2d5BbP62I$iv3;
                                    it.applyFocusProperties(properties4);
                                    type$iv2 = type$iv4;
                                    untilType$iv2 = untilType$iv4;
                                } else {
                                    $this$visitSelfAndAncestors_u2d5BbP62I$iv2 = $this$visitSelfAndAncestors_u2d5BbP62I$iv3;
                                    if (((this_$iv$iv$iv2.getKindSet$ui_release() & type$iv4) != 0) && (this_$iv$iv$iv2 instanceof DelegatingNode)) {
                                        int count$iv$iv2 = 0;
                                        DelegatingNode this_$iv$iv$iv3 = (DelegatingNode) this_$iv$iv$iv2;
                                        Modifier.Node node$iv$iv$iv = this_$iv$iv$iv3.getDelegate$ui_release();
                                        while (node$iv$iv$iv != null) {
                                            Modifier.Node next$iv$iv = node$iv$iv$iv;
                                            if ((next$iv$iv.getKindSet$ui_release() & type$iv4) != 0) {
                                                count$iv$iv2++;
                                                this_$iv$iv$iv = this_$iv$iv$iv3;
                                                if (count$iv$iv2 == 1) {
                                                    this_$iv$iv$iv2 = next$iv$iv;
                                                    type$iv3 = type$iv4;
                                                    untilType$iv3 = untilType$iv4;
                                                } else {
                                                    if (mutableVector2 == null) {
                                                        count$iv$iv = count$iv$iv2;
                                                        type$iv3 = type$iv4;
                                                        untilType$iv3 = untilType$iv4;
                                                        mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                    } else {
                                                        count$iv$iv = count$iv$iv2;
                                                        type$iv3 = type$iv4;
                                                        untilType$iv3 = untilType$iv4;
                                                        mutableVector = mutableVector2;
                                                    }
                                                    Modifier.Node theNode$iv$iv = this_$iv$iv$iv2;
                                                    if (theNode$iv$iv != null) {
                                                        if (mutableVector != null) {
                                                            mutableVector.add(theNode$iv$iv);
                                                        }
                                                        this_$iv$iv$iv2 = null;
                                                    }
                                                    if (mutableVector != null) {
                                                        mutableVector.add(next$iv$iv);
                                                    }
                                                    mutableVector2 = mutableVector;
                                                    count$iv$iv2 = count$iv$iv;
                                                }
                                            } else {
                                                this_$iv$iv$iv = this_$iv$iv$iv3;
                                                type$iv3 = type$iv4;
                                                untilType$iv3 = untilType$iv4;
                                            }
                                            node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                            this_$iv$iv$iv3 = this_$iv$iv$iv;
                                            type$iv4 = type$iv3;
                                            untilType$iv4 = untilType$iv3;
                                        }
                                        type$iv2 = type$iv4;
                                        untilType$iv2 = untilType$iv4;
                                        if (count$iv$iv2 == 1) {
                                            properties3 = properties4;
                                            $this$visitSelfAndAncestors_u2d5BbP62I$iv3 = $this$visitSelfAndAncestors_u2d5BbP62I$iv2;
                                            type$iv4 = type$iv2;
                                            untilType$iv4 = untilType$iv2;
                                        }
                                    } else {
                                        type$iv2 = type$iv4;
                                        untilType$iv2 = untilType$iv4;
                                    }
                                }
                                this_$iv$iv$iv2 = DelegatableNodeKt.pop(mutableVector2);
                                properties3 = properties4;
                                $this$visitSelfAndAncestors_u2d5BbP62I$iv3 = $this$visitSelfAndAncestors_u2d5BbP62I$iv2;
                                type$iv4 = type$iv2;
                                untilType$iv4 = untilType$iv2;
                            }
                        }
                    }
                    node$iv$iv = node$iv$iv.getParent$ui_release();
                    properties3 = properties3;
                    $this$visitSelfAndAncestors_u2d5BbP62I$iv3 = $this$visitSelfAndAncestors_u2d5BbP62I$iv3;
                    type$iv4 = type$iv4;
                    untilType$iv4 = untilType$iv4;
                }
                properties2 = properties3;
                $this$visitSelfAndAncestors_u2d5BbP62I$iv = $this$visitSelfAndAncestors_u2d5BbP62I$iv3;
                type$iv = type$iv4;
                untilType$iv = untilType$iv4;
            } else {
                properties2 = properties3;
                $this$visitSelfAndAncestors_u2d5BbP62I$iv = $this$visitSelfAndAncestors_u2d5BbP62I$iv3;
                type$iv = type$iv4;
                untilType$iv = untilType$iv4;
            }
            layout$iv$iv = layout$iv$iv.getParent$ui_release();
            node$iv$iv = (layout$iv$iv == null || (nodes$ui_release = layout$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
            properties3 = properties2;
            $this$visitSelfAndAncestors_u2d5BbP62I$iv3 = $this$visitSelfAndAncestors_u2d5BbP62I$iv;
            type$iv4 = type$iv;
            untilType$iv4 = untilType$iv;
        }
        return properties;
    }

    /* renamed from: fetchCustomEnterOrExit-ULY8qGw  reason: not valid java name */
    private final void m3967fetchCustomEnterOrExitULY8qGw(int focusDirection, Function1<? super FocusRequester, Unit> function1, Function2<? super FocusProperties, ? super FocusEnterExitScope, Unit> function2) {
        FocusProperties focusProperties = fetchFocusProperties$ui_release();
        CancelIndicatingFocusBoundaryScope scope = new CancelIndicatingFocusBoundaryScope(focusDirection, null);
        FocusTransactionManager focusTransactionManager = FocusTargetNodeKt.getFocusTransactionManager(this);
        int generationBefore = focusTransactionManager != null ? focusTransactionManager.getGeneration() : 0;
        FocusOwner focusOwner = DelegatableNodeKt.requireOwner(this).getFocusOwner();
        FocusTargetNode activeNodeBefore = focusOwner.getActiveFocusTargetNode();
        function2.invoke(focusProperties, scope);
        int generationAfter = focusTransactionManager != null ? focusTransactionManager.getGeneration() : 0;
        FocusTargetNode activeNodeAfter = focusOwner.getActiveFocusTargetNode();
        if (scope.isCanceled()) {
            function1.invoke(FocusRequester.Companion.getCancel());
        } else if (generationBefore != generationAfter || (ComposeUiFlags.isTrackFocusEnabled && activeNodeBefore != activeNodeAfter && activeNodeAfter != null)) {
            function1.invoke(FocusRequester.Companion.getRedirect$ui_release());
        }
    }

    /* renamed from: fetchCustomEnter-aToIllA$ui_release  reason: not valid java name */
    public final void m3968fetchCustomEnteraToIllA$ui_release(int focusDirection, Function1<? super FocusRequester, Unit> function1) {
        if (!this.isProcessingCustomEnter) {
            this.isProcessingCustomEnter = true;
            try {
                FocusProperties focusProperties$iv = fetchFocusProperties$ui_release();
                try {
                    CancelIndicatingFocusBoundaryScope scope$iv = new CancelIndicatingFocusBoundaryScope(focusDirection, null);
                    FocusTransactionManager focusTransactionManager$iv = FocusTargetNodeKt.getFocusTransactionManager(this);
                    int generationBefore$iv = focusTransactionManager$iv != null ? focusTransactionManager$iv.getGeneration() : 0;
                    FocusOwner focusOwner$iv = DelegatableNodeKt.requireOwner(this).getFocusOwner();
                    FocusTargetNode activeNodeBefore$iv = focusOwner$iv.getActiveFocusTargetNode();
                    CancelIndicatingFocusBoundaryScope it = scope$iv;
                    focusProperties$iv.getOnEnter().invoke(it);
                    int generationAfter$iv = focusTransactionManager$iv != null ? focusTransactionManager$iv.getGeneration() : 0;
                    FocusTargetNode activeNodeAfter$iv = focusOwner$iv.getActiveFocusTargetNode();
                    if (scope$iv.isCanceled()) {
                        function1.invoke(FocusRequester.Companion.getCancel());
                    } else if (generationBefore$iv != generationAfter$iv || (ComposeUiFlags.isTrackFocusEnabled && activeNodeBefore$iv != activeNodeAfter$iv && activeNodeAfter$iv != null)) {
                        function1.invoke(FocusRequester.Companion.getRedirect$ui_release());
                    }
                    this.isProcessingCustomEnter = false;
                } catch (Throwable th) {
                    th = th;
                    this.isProcessingCustomEnter = false;
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }
    }

    /* renamed from: fetchCustomExit-aToIllA$ui_release  reason: not valid java name */
    public final void m3969fetchCustomExitaToIllA$ui_release(int focusDirection, Function1<? super FocusRequester, Unit> function1) {
        if (!this.isProcessingCustomExit) {
            this.isProcessingCustomExit = true;
            try {
                FocusProperties focusProperties$iv = fetchFocusProperties$ui_release();
                try {
                    CancelIndicatingFocusBoundaryScope scope$iv = new CancelIndicatingFocusBoundaryScope(focusDirection, null);
                    FocusTransactionManager focusTransactionManager$iv = FocusTargetNodeKt.getFocusTransactionManager(this);
                    int generationBefore$iv = focusTransactionManager$iv != null ? focusTransactionManager$iv.getGeneration() : 0;
                    FocusOwner focusOwner$iv = DelegatableNodeKt.requireOwner(this).getFocusOwner();
                    FocusTargetNode activeNodeBefore$iv = focusOwner$iv.getActiveFocusTargetNode();
                    CancelIndicatingFocusBoundaryScope it = scope$iv;
                    focusProperties$iv.getOnExit().invoke(it);
                    int generationAfter$iv = focusTransactionManager$iv != null ? focusTransactionManager$iv.getGeneration() : 0;
                    FocusTargetNode activeNodeAfter$iv = focusOwner$iv.getActiveFocusTargetNode();
                    if (scope$iv.isCanceled()) {
                        function1.invoke(FocusRequester.Companion.getCancel());
                    } else if (generationBefore$iv != generationAfter$iv || (ComposeUiFlags.isTrackFocusEnabled && activeNodeBefore$iv != activeNodeAfter$iv && activeNodeAfter$iv != null)) {
                        function1.invoke(FocusRequester.Companion.getRedirect$ui_release());
                    }
                    this.isProcessingCustomExit = false;
                } catch (Throwable th) {
                    th = th;
                    this.isProcessingCustomExit = false;
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }
    }

    public final void commitFocusState$ui_release() {
        FocusTransactionManager $this$commitFocusState_u24lambda_u2410 = FocusTargetNodeKt.requireTransactionManager(this);
        FocusStateImpl uncommittedFocusState = $this$commitFocusState_u24lambda_u2410.getUncommittedFocusState(this);
        if (uncommittedFocusState != null) {
            this.committedFocusState = uncommittedFocusState;
        } else {
            InlineClassHelperKt.throwIllegalStateExceptionForNullCheck("committing a node that was not updated in the current transaction");
            throw new KotlinNothingValueException();
        }
    }

    public final void invalidateFocus$ui_release() {
        FocusProperties focusProperties = null;
        if (!isInitialized$ui_release()) {
            initializeFocusState$ui_release$default(this, null, 1, null);
        }
        switch (WhenMappings.$EnumSwitchMapping$1[getFocusState().ordinal()]) {
            case 1:
            case 2:
                final Ref.ObjectRef focusProperties2 = new Ref.ObjectRef();
                ObserverModifierNodeKt.observeReads(this, new Function0<Unit>() { // from class: androidx.compose.ui.focus.FocusTargetNode$invalidateFocus$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Unit invoke() {
                        invoke2();
                        return Unit.INSTANCE;
                    }

                    /* JADX WARN: Type inference failed for: r1v1, types: [androidx.compose.ui.focus.FocusProperties, T] */
                    /* renamed from: invoke  reason: avoid collision after fix types in other method */
                    public final void invoke2() {
                        focusProperties2.element = this.fetchFocusProperties$ui_release();
                    }
                });
                if (focusProperties2.element == 0) {
                    Intrinsics.throwUninitializedPropertyAccessException("focusProperties");
                } else {
                    focusProperties = (FocusProperties) focusProperties2.element;
                }
                if (!focusProperties.getCanFocus()) {
                    DelegatableNodeKt.requireOwner(this).getFocusOwner().clearFocus(true);
                    return;
                }
                return;
            default:
                return;
        }
    }

    public final void dispatchFocusCallbacks$ui_release() {
        FocusStateImpl previousOrInactive;
        FocusStateImpl focusState;
        DelegatableNode $this$visitSelfAndAncestors_u2d5BbP62I$iv;
        NodeChain nodes$ui_release;
        FocusStateImpl previousOrInactive2;
        DelegatableNode $this$visitSelfAndAncestors_u2d5BbP62I$iv2;
        DelegatingNode this_$iv$iv$iv;
        Modifier.Node node;
        int count$iv$iv;
        MutableVector mutableVector;
        Function2<FocusState, FocusState, Unit> function2;
        FocusStateImpl previousOrInactive3 = this.committedFocusState;
        if (previousOrInactive3 == null) {
            previousOrInactive3 = FocusStateImpl.Inactive;
        }
        FocusStateImpl focusState2 = getFocusState();
        if (previousOrInactive3 != focusState2 && (function2 = this.onFocusChange) != null) {
            function2.invoke(previousOrInactive3, focusState2);
        }
        FocusTargetNode $this$visitSelfAndAncestors_u2d5BbP62I$iv3 = this;
        int m5898constructorimpl = NodeKind.m5898constructorimpl(4096);
        int m5898constructorimpl2 = NodeKind.m5898constructorimpl(1024);
        Modifier.Node self$iv = $this$visitSelfAndAncestors_u2d5BbP62I$iv3.getNode();
        int mask$iv$iv = m5898constructorimpl | m5898constructorimpl2;
        boolean value$iv$iv$iv = $this$visitSelfAndAncestors_u2d5BbP62I$iv3.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv$iv = $this$visitSelfAndAncestors_u2d5BbP62I$iv3.getNode();
        LayoutNode layout$iv$iv = DelegatableNodeKt.requireLayoutNode($this$visitSelfAndAncestors_u2d5BbP62I$iv3);
        loop0: while (layout$iv$iv != null) {
            Modifier.Node head$iv$iv = layout$iv$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv$iv.getAggregateChildKindSet$ui_release() & mask$iv$iv) != 0) {
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & mask$iv$iv) != 0) {
                        Modifier.Node it$iv = node$iv$iv;
                        previousOrInactive2 = previousOrInactive3;
                        if (it$iv != self$iv) {
                            if ((it$iv.getKindSet$ui_release() & m5898constructorimpl2) != 0) {
                                break loop0;
                            }
                        }
                        if ((it$iv.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                            MutableVector mutableVector2 = null;
                            Modifier.Node this_$iv$iv$iv2 = it$iv;
                            while (this_$iv$iv$iv2 != null) {
                                FocusStateImpl focusState3 = focusState2;
                                if (this_$iv$iv$iv2 instanceof FocusEventModifierNode) {
                                    FocusEventModifierNode it = (FocusEventModifierNode) this_$iv$iv$iv2;
                                    $this$visitSelfAndAncestors_u2d5BbP62I$iv2 = $this$visitSelfAndAncestors_u2d5BbP62I$iv3;
                                    it.onFocusEvent(FocusEventModifierNodeKt.getFocusState(it));
                                } else {
                                    $this$visitSelfAndAncestors_u2d5BbP62I$iv2 = $this$visitSelfAndAncestors_u2d5BbP62I$iv3;
                                    if (((this_$iv$iv$iv2.getKindSet$ui_release() & m5898constructorimpl) != 0) && (this_$iv$iv$iv2 instanceof DelegatingNode)) {
                                        int count$iv$iv2 = 0;
                                        DelegatingNode this_$iv$iv$iv3 = (DelegatingNode) this_$iv$iv$iv2;
                                        Modifier.Node node$iv$iv$iv = this_$iv$iv$iv3.getDelegate$ui_release();
                                        while (node$iv$iv$iv != null) {
                                            Modifier.Node next$iv$iv = node$iv$iv$iv;
                                            if ((next$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                                                count$iv$iv2++;
                                                Modifier.Node node2 = this_$iv$iv$iv2;
                                                if (count$iv$iv2 == 1) {
                                                    node = next$iv$iv;
                                                    this_$iv$iv$iv = this_$iv$iv$iv3;
                                                } else {
                                                    if (mutableVector2 == null) {
                                                        count$iv$iv = count$iv$iv2;
                                                        this_$iv$iv$iv = this_$iv$iv$iv3;
                                                        mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                    } else {
                                                        count$iv$iv = count$iv$iv2;
                                                        this_$iv$iv$iv = this_$iv$iv$iv3;
                                                        mutableVector = mutableVector2;
                                                    }
                                                    if (node2 != null) {
                                                        if (mutableVector != null) {
                                                            mutableVector.add(node2);
                                                        }
                                                        node = null;
                                                    } else {
                                                        node = node2;
                                                    }
                                                    if (mutableVector != null) {
                                                        mutableVector.add(next$iv$iv);
                                                    }
                                                    mutableVector2 = mutableVector;
                                                    count$iv$iv2 = count$iv$iv;
                                                }
                                            } else {
                                                this_$iv$iv$iv = this_$iv$iv$iv3;
                                                node = this_$iv$iv$iv2;
                                            }
                                            node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                            this_$iv$iv$iv2 = node;
                                            this_$iv$iv$iv3 = this_$iv$iv$iv;
                                        }
                                        Modifier.Node node3 = this_$iv$iv$iv2;
                                        if (count$iv$iv2 == 1) {
                                            focusState2 = focusState3;
                                            $this$visitSelfAndAncestors_u2d5BbP62I$iv3 = $this$visitSelfAndAncestors_u2d5BbP62I$iv2;
                                            this_$iv$iv$iv2 = node3;
                                        }
                                    }
                                }
                                this_$iv$iv$iv2 = DelegatableNodeKt.pop(mutableVector2);
                                focusState2 = focusState3;
                                $this$visitSelfAndAncestors_u2d5BbP62I$iv3 = $this$visitSelfAndAncestors_u2d5BbP62I$iv2;
                            }
                        }
                    } else {
                        previousOrInactive2 = previousOrInactive3;
                    }
                    node$iv$iv = node$iv$iv.getParent$ui_release();
                    previousOrInactive3 = previousOrInactive2;
                    focusState2 = focusState2;
                    $this$visitSelfAndAncestors_u2d5BbP62I$iv3 = $this$visitSelfAndAncestors_u2d5BbP62I$iv3;
                }
                previousOrInactive = previousOrInactive3;
                focusState = focusState2;
                $this$visitSelfAndAncestors_u2d5BbP62I$iv = $this$visitSelfAndAncestors_u2d5BbP62I$iv3;
            } else {
                previousOrInactive = previousOrInactive3;
                focusState = focusState2;
                $this$visitSelfAndAncestors_u2d5BbP62I$iv = $this$visitSelfAndAncestors_u2d5BbP62I$iv3;
            }
            layout$iv$iv = layout$iv$iv.getParent$ui_release();
            node$iv$iv = (layout$iv$iv == null || (nodes$ui_release = layout$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
            previousOrInactive3 = previousOrInactive;
            focusState2 = focusState;
            $this$visitSelfAndAncestors_u2d5BbP62I$iv3 = $this$visitSelfAndAncestors_u2d5BbP62I$iv;
        }
        Function1<FocusTargetNode, Unit> function1 = this.onDispatchEventsCompleted;
        if (function1 != null) {
            function1.invoke(this);
        }
    }

    public final void dispatchFocusCallbacks$ui_release(FocusState previousState, FocusState newState) {
        FocusOwner focusOwner;
        FocusTargetNode activeNode;
        DelegatableNode $this$visitSelfAndAncestors_u2d5BbP62I$iv;
        NodeChain nodes$ui_release;
        FocusOwner focusOwner2;
        FocusTargetNode activeNode2;
        FocusTargetNode activeNode3;
        Modifier.Node node;
        MutableVector mutableVector;
        Function2<FocusState, FocusState, Unit> function2;
        FocusState focusState = newState;
        FocusOwner focusOwner3 = DelegatableNodeKt.requireOwner(this).getFocusOwner();
        FocusTargetNode activeNode4 = focusOwner3.getActiveFocusTargetNode();
        if (!Intrinsics.areEqual(previousState, newState) && (function2 = this.onFocusChange) != null) {
            function2.invoke(previousState, focusState);
        }
        FocusTargetNode $this$visitSelfAndAncestors_u2d5BbP62I$iv2 = this;
        int m5898constructorimpl = NodeKind.m5898constructorimpl(4096);
        int m5898constructorimpl2 = NodeKind.m5898constructorimpl(1024);
        Modifier.Node self$iv = $this$visitSelfAndAncestors_u2d5BbP62I$iv2.getNode();
        int mask$iv$iv = m5898constructorimpl | m5898constructorimpl2;
        boolean value$iv$iv$iv = $this$visitSelfAndAncestors_u2d5BbP62I$iv2.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv$iv = $this$visitSelfAndAncestors_u2d5BbP62I$iv2.getNode();
        LayoutNode layout$iv$iv = DelegatableNodeKt.requireLayoutNode($this$visitSelfAndAncestors_u2d5BbP62I$iv2);
        loop0: while (layout$iv$iv != null) {
            Modifier.Node head$iv$iv = layout$iv$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv$iv.getAggregateChildKindSet$ui_release() & mask$iv$iv) != 0) {
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & mask$iv$iv) != 0) {
                        Modifier.Node it$iv = node$iv$iv;
                        focusOwner2 = focusOwner3;
                        if (it$iv != self$iv) {
                            if ((it$iv.getKindSet$ui_release() & m5898constructorimpl2) != 0) {
                                break loop0;
                            }
                        }
                        if ((it$iv.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                            MutableVector mutableVector2 = null;
                            Object it$iv2 = it$iv;
                            while (it$iv2 != null) {
                                DelegatableNode $this$visitSelfAndAncestors_u2d5BbP62I$iv3 = $this$visitSelfAndAncestors_u2d5BbP62I$iv2;
                                if (it$iv2 instanceof FocusEventModifierNode) {
                                    FocusEventModifierNode it = (FocusEventModifierNode) it$iv2;
                                    if (activeNode4 == focusOwner2.getActiveFocusTargetNode()) {
                                        it.onFocusEvent(focusState);
                                    }
                                    activeNode2 = activeNode4;
                                } else {
                                    Modifier.Node this_$iv$iv$iv = it$iv2;
                                    if (((this_$iv$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0) && (it$iv2 instanceof DelegatingNode)) {
                                        int count$iv$iv = 0;
                                        DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) it$iv2;
                                        Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                        while (node$iv$iv$iv != null) {
                                            Modifier.Node next$iv$iv = node$iv$iv$iv;
                                            if ((next$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                                                count$iv$iv++;
                                                if (count$iv$iv == 1) {
                                                    it$iv2 = next$iv$iv;
                                                    activeNode3 = activeNode4;
                                                } else {
                                                    if (mutableVector2 == null) {
                                                        node = it$iv2;
                                                        activeNode3 = activeNode4;
                                                        mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                    } else {
                                                        node = it$iv2;
                                                        activeNode3 = activeNode4;
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
                                                    it$iv2 = node;
                                                }
                                            } else {
                                                activeNode3 = activeNode4;
                                            }
                                            node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                            activeNode4 = activeNode3;
                                        }
                                        Modifier.Node node2 = it$iv2;
                                        activeNode2 = activeNode4;
                                        if (count$iv$iv == 1) {
                                            focusState = newState;
                                            $this$visitSelfAndAncestors_u2d5BbP62I$iv2 = $this$visitSelfAndAncestors_u2d5BbP62I$iv3;
                                            it$iv2 = node2;
                                            activeNode4 = activeNode2;
                                        }
                                    } else {
                                        activeNode2 = activeNode4;
                                    }
                                }
                                it$iv2 = DelegatableNodeKt.pop(mutableVector2);
                                focusState = newState;
                                $this$visitSelfAndAncestors_u2d5BbP62I$iv2 = $this$visitSelfAndAncestors_u2d5BbP62I$iv3;
                                activeNode4 = activeNode2;
                            }
                        }
                    } else {
                        focusOwner2 = focusOwner3;
                    }
                    node$iv$iv = node$iv$iv.getParent$ui_release();
                    focusState = newState;
                    focusOwner3 = focusOwner2;
                    $this$visitSelfAndAncestors_u2d5BbP62I$iv2 = $this$visitSelfAndAncestors_u2d5BbP62I$iv2;
                    activeNode4 = activeNode4;
                }
                focusOwner = focusOwner3;
                activeNode = activeNode4;
                $this$visitSelfAndAncestors_u2d5BbP62I$iv = $this$visitSelfAndAncestors_u2d5BbP62I$iv2;
            } else {
                focusOwner = focusOwner3;
                activeNode = activeNode4;
                $this$visitSelfAndAncestors_u2d5BbP62I$iv = $this$visitSelfAndAncestors_u2d5BbP62I$iv2;
            }
            layout$iv$iv = layout$iv$iv.getParent$ui_release();
            node$iv$iv = (layout$iv$iv == null || (nodes$ui_release = layout$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
            focusState = newState;
            focusOwner3 = focusOwner;
            $this$visitSelfAndAncestors_u2d5BbP62I$iv2 = $this$visitSelfAndAncestors_u2d5BbP62I$iv;
            activeNode4 = activeNode;
        }
        Function1<FocusTargetNode, Unit> function1 = this.onDispatchEventsCompleted;
        if (function1 != null) {
            function1.invoke(this);
        }
    }

    /* compiled from: FocusTargetNode.kt */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\bÀ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0003J\b\u0010\u0004\u001a\u00020\u0002H\u0016J\u0013\u0010\u0005\u001a\u00020\u00062\b\u0010\u0007\u001a\u0004\u0018\u00010\bH\u0096\u0002J\b\u0010\t\u001a\u00020\nH\u0016J\u0010\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u0002H\u0016J\f\u0010\u000e\u001a\u00020\f*\u00020\u000fH\u0016¨\u0006\u0010"}, d2 = {"Landroidx/compose/ui/focus/FocusTargetNode$FocusTargetElement;", "Landroidx/compose/ui/node/ModifierNodeElement;", "Landroidx/compose/ui/focus/FocusTargetNode;", "()V", "create", "equals", "", "other", "", "hashCode", "", "update", "", "node", "inspectableProperties", "Landroidx/compose/ui/platform/InspectorInfo;", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class FocusTargetElement extends ModifierNodeElement<FocusTargetNode> {
        public static final int $stable = 0;
        public static final FocusTargetElement INSTANCE = new FocusTargetElement();

        private FocusTargetElement() {
        }

        @Override // androidx.compose.ui.node.ModifierNodeElement
        public FocusTargetNode create() {
            return new FocusTargetNode(0, null, null, 7, null);
        }

        @Override // androidx.compose.ui.node.ModifierNodeElement
        public void update(FocusTargetNode node) {
        }

        @Override // androidx.compose.ui.node.ModifierNodeElement
        public void inspectableProperties(InspectorInfo $this$inspectableProperties) {
            $this$inspectableProperties.setName("focusTarget");
        }

        @Override // androidx.compose.ui.node.ModifierNodeElement
        public int hashCode() {
            return "focusTarget".hashCode();
        }

        @Override // androidx.compose.ui.node.ModifierNodeElement
        public boolean equals(Object other) {
            return other == this;
        }
    }

    public final boolean isInitialized$ui_release() {
        return ComposeUiFlags.isTrackFocusEnabled || this.committedFocusState != null;
    }

    public static /* synthetic */ void initializeFocusState$ui_release$default(FocusTargetNode focusTargetNode, FocusStateImpl focusStateImpl, int i, Object obj) {
        if ((i & 1) != 0) {
            focusStateImpl = null;
        }
        focusTargetNode.initializeFocusState$ui_release(focusStateImpl);
    }

    private static final boolean initializeFocusState$isInActiveSubTree(FocusTargetNode this$0) {
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
        int type$iv;
        boolean includeSelf$iv;
        NodeChain nodes$ui_release;
        int type$iv2;
        boolean includeSelf$iv2;
        int type$iv3;
        boolean includeSelf$iv3;
        int count$iv$iv;
        MutableVector mutableVector;
        FocusTargetNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = this$0;
        int type$iv4 = NodeKind.m5898constructorimpl(1024);
        boolean includeSelf$iv4 = false;
        boolean value$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2.getNode().getParent$ui_release();
        LayoutNode layout$iv$iv = DelegatableNodeKt.requireLayoutNode($this$visitAncestors_u2dY_u2dYKmho_u24default$iv2);
        while (layout$iv$iv != null) {
            Modifier.Node head$iv$iv = layout$iv$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv$iv.getAggregateChildKindSet$ui_release() & type$iv4) == 0) {
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                type$iv = type$iv4;
                includeSelf$iv = includeSelf$iv4;
            } else {
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & type$iv4) != 0) {
                        Modifier.Node it$iv = node$iv$iv;
                        MutableVector mutableVector2 = null;
                        Modifier.Node node = it$iv;
                        while (node != null) {
                            DelegatableNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                            if (node instanceof FocusTargetNode) {
                                FocusTargetNode it = (FocusTargetNode) node;
                                if (it.isInitialized$ui_release()) {
                                    switch (WhenMappings.$EnumSwitchMapping$1[it.getFocusState().ordinal()]) {
                                        case 1:
                                        case 2:
                                        case 4:
                                            return false;
                                        case 3:
                                            return true;
                                        default:
                                            throw new NoWhenBranchMatchedException();
                                    }
                                }
                                type$iv2 = type$iv4;
                                includeSelf$iv2 = includeSelf$iv4;
                            } else {
                                Modifier.Node this_$iv$iv$iv = node;
                                if (!((this_$iv$iv$iv.getKindSet$ui_release() & type$iv4) != 0) || !(node instanceof DelegatingNode)) {
                                    type$iv2 = type$iv4;
                                    includeSelf$iv2 = includeSelf$iv4;
                                } else {
                                    int count$iv$iv2 = 0;
                                    DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node;
                                    Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                    while (node$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv = node$iv$iv$iv;
                                        if (!((next$iv$iv.getKindSet$ui_release() & type$iv4) != 0)) {
                                            type$iv3 = type$iv4;
                                            includeSelf$iv3 = includeSelf$iv4;
                                        } else {
                                            count$iv$iv2++;
                                            type$iv3 = type$iv4;
                                            if (count$iv$iv2 == 1) {
                                                node = next$iv$iv;
                                                includeSelf$iv3 = includeSelf$iv4;
                                            } else {
                                                if (mutableVector2 != null) {
                                                    count$iv$iv = count$iv$iv2;
                                                    includeSelf$iv3 = includeSelf$iv4;
                                                    mutableVector = mutableVector2;
                                                } else {
                                                    count$iv$iv = count$iv$iv2;
                                                    includeSelf$iv3 = includeSelf$iv4;
                                                    mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                }
                                                mutableVector2 = mutableVector;
                                                Modifier.Node theNode$iv$iv = node;
                                                if (theNode$iv$iv != null) {
                                                    if (mutableVector2 != null) {
                                                        mutableVector2.add(theNode$iv$iv);
                                                    }
                                                    node = null;
                                                }
                                                if (mutableVector2 != null) {
                                                    mutableVector2.add(next$iv$iv);
                                                }
                                                count$iv$iv2 = count$iv$iv;
                                            }
                                        }
                                        node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                        type$iv4 = type$iv3;
                                        includeSelf$iv4 = includeSelf$iv3;
                                    }
                                    type$iv2 = type$iv4;
                                    includeSelf$iv2 = includeSelf$iv4;
                                    if (count$iv$iv2 == 1) {
                                        $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                                        type$iv4 = type$iv2;
                                        includeSelf$iv4 = includeSelf$iv2;
                                    }
                                }
                            }
                            node = DelegatableNodeKt.pop(mutableVector2);
                            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv3;
                            type$iv4 = type$iv2;
                            includeSelf$iv4 = includeSelf$iv2;
                        }
                        continue;
                    }
                    node$iv$iv = node$iv$iv.getParent$ui_release();
                    $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                    type$iv4 = type$iv4;
                    includeSelf$iv4 = includeSelf$iv4;
                }
                $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2;
                type$iv = type$iv4;
                includeSelf$iv = includeSelf$iv4;
            }
            layout$iv$iv = layout$iv$iv.getParent$ui_release();
            node$iv$iv = (layout$iv$iv == null || (nodes$ui_release = layout$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
            $this$visitAncestors_u2dY_u2dYKmho_u24default$iv2 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv;
            type$iv4 = type$iv;
            includeSelf$iv4 = includeSelf$iv;
        }
        return false;
    }

    private static final boolean initializeFocusState$hasActiveChild(FocusTargetNode this$0) {
        DelegatableNode $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
        int type$iv;
        int i;
        boolean z;
        boolean diveDeeper$iv$iv;
        boolean z2;
        DelegatableNode $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
        int type$iv2;
        int i2;
        boolean z3;
        DelegatableNode $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv3;
        int type$iv3;
        int i3;
        MutableVector mutableVector;
        FocusTargetNode $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4 = this$0;
        int type$iv4 = NodeKind.m5898constructorimpl(1024);
        int i4 = 0;
        boolean value$iv$iv$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitSubtreeIf called on an unattached node");
        }
        MutableVector mutableVector2 = null;
        MutableVector branches$iv$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4.getNode().getChild$ui_release();
        if (child$iv$iv == null) {
            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4.getNode(), false);
        } else {
            branches$iv$iv.add(child$iv$iv);
        }
        while (true) {
            boolean z4 = true;
            MutableVector this_$iv$iv$iv = branches$iv$iv.getSize() != 0 ? 1 : mutableVector2;
            if (this_$iv$iv$iv == null) {
                return false;
            }
            Modifier.Node branch$iv$iv = (Modifier.Node) branches$iv$iv.removeAt(branches$iv$iv.getSize() - 1);
            if ((branch$iv$iv.getAggregateChildKindSet$ui_release() & type$iv4) != 0) {
                Modifier.Node node$iv$iv = branch$iv$iv;
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & type$iv4) == 0) {
                        $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4;
                        type$iv = type$iv4;
                        i = i4;
                        z = z4;
                    } else {
                        Object node$iv = node$iv$iv;
                        MutableVector mutableVector3 = null;
                        Object obj = node$iv;
                        while (true) {
                            if (obj != null) {
                                boolean z5 = z4;
                                if (obj instanceof FocusTargetNode) {
                                    Object it$iv = obj;
                                    FocusTargetNode it = (FocusTargetNode) it$iv;
                                    if (it.isInitialized$ui_release()) {
                                        switch (WhenMappings.$EnumSwitchMapping$1[it.getFocusState().ordinal()]) {
                                            case 1:
                                            case 2:
                                            case 3:
                                                return z5;
                                            case 4:
                                                z2 = false;
                                                break;
                                            default:
                                                throw new NoWhenBranchMatchedException();
                                        }
                                    } else {
                                        z2 = z5;
                                    }
                                    if (z2) {
                                        $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4;
                                        type$iv2 = type$iv4;
                                        i2 = i4;
                                        z3 = z5;
                                    } else {
                                        $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4;
                                        type$iv = type$iv4;
                                        i = i4;
                                        z = z5;
                                        diveDeeper$iv$iv = false;
                                    }
                                } else {
                                    Modifier.Node this_$iv$iv$iv2 = obj;
                                    if (!((this_$iv$iv$iv2.getKindSet$ui_release() & type$iv4) != 0 ? z5 : false) || !(obj instanceof DelegatingNode)) {
                                        $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4;
                                        type$iv2 = type$iv4;
                                        i2 = i4;
                                        z3 = z5;
                                    } else {
                                        int count$iv$iv = 0;
                                        DelegatingNode this_$iv$iv$iv3 = (DelegatingNode) obj;
                                        Modifier.Node node$iv$iv$iv = this_$iv$iv$iv3.getDelegate$ui_release();
                                        while (node$iv$iv$iv != null) {
                                            Modifier.Node next$iv$iv = node$iv$iv$iv;
                                            if (!((next$iv$iv.getKindSet$ui_release() & type$iv4) != 0 ? z5 : false)) {
                                                $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv3 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4;
                                                type$iv3 = type$iv4;
                                                i3 = i4;
                                            } else {
                                                count$iv$iv++;
                                                $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv3 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4;
                                                if (count$iv$iv == z5) {
                                                    obj = next$iv$iv;
                                                    type$iv3 = type$iv4;
                                                    i3 = i4;
                                                } else {
                                                    if (mutableVector3 == null) {
                                                        type$iv3 = type$iv4;
                                                        i3 = i4;
                                                        mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                    } else {
                                                        type$iv3 = type$iv4;
                                                        i3 = i4;
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
                                                }
                                            }
                                            node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                            $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv3;
                                            type$iv4 = type$iv3;
                                            i4 = i3;
                                            z5 = true;
                                        }
                                        $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4;
                                        type$iv2 = type$iv4;
                                        i2 = i4;
                                        z3 = true;
                                        if (count$iv$iv == 1) {
                                            z4 = true;
                                            $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
                                            type$iv4 = type$iv2;
                                            i4 = i2;
                                        }
                                    }
                                }
                                obj = DelegatableNodeKt.pop(mutableVector3);
                                z4 = z3;
                                $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv2;
                                type$iv4 = type$iv2;
                                i4 = i2;
                            } else {
                                $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4;
                                type$iv = type$iv4;
                                i = i4;
                                z = z4;
                                diveDeeper$iv$iv = z;
                            }
                        }
                        if (!diveDeeper$iv$iv) {
                            $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
                            type$iv4 = type$iv;
                            i4 = i;
                            mutableVector2 = null;
                        }
                    }
                    node$iv$iv = node$iv$iv.getChild$ui_release();
                    z4 = z;
                    $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv;
                    type$iv4 = type$iv;
                    i4 = i;
                }
            }
            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, branch$iv$iv, false);
            $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4 = $this$visitSubtreeIf_u2dY_u2dYKmho_u24default$iv4;
            type$iv4 = type$iv4;
            i4 = i4;
            mutableVector2 = null;
        }
    }

    public final void initializeFocusState$ui_release(FocusStateImpl initialFocusState) {
        FocusStateImpl focusStateImpl;
        if (isInitialized$ui_release()) {
            throw new IllegalStateException("Re-initializing focus target node.".toString());
        }
        if (!ComposeUiFlags.isTrackFocusEnabled) {
            FocusTransactionManager $this$iv = FocusTargetNodeKt.requireTransactionManager(this);
            try {
                if ($this$iv.getOngoingTransaction()) {
                    FocusTransactionManager.access$cancelTransaction($this$iv);
                }
                FocusTransactionManager.access$beginTransaction($this$iv);
                if (initialFocusState != null) {
                    focusStateImpl = initialFocusState;
                } else {
                    focusStateImpl = (initializeFocusState$isInActiveSubTree(this) && initializeFocusState$hasActiveChild(this)) ? FocusStateImpl.ActiveParent : FocusStateImpl.Inactive;
                }
                setFocusState(focusStateImpl);
                Unit unit = Unit.INSTANCE;
            } finally {
                FocusTransactionManager.access$commitTransaction($this$iv);
            }
        }
    }
}
