package androidx.compose.ui.layout;

import androidx.collection.MutableScatterMap;
import androidx.collection.ScatterMap;
import androidx.collection.ScatterMapKt;
import androidx.compose.runtime.ComposeNodeLifecycleCallback;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.CompositionContext;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.ReusableComposition;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.runtime.snapshots.Snapshot;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.layout.LayoutNodeSubcompositionsState;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.layout.SubcomposeLayoutState;
import androidx.compose.ui.layout.SubcomposeSlotReusePolicy;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.LayoutNodeKt;
import androidx.compose.ui.node.LookaheadDelegate;
import androidx.compose.ui.node.LookaheadPassDelegate;
import androidx.compose.ui.node.MeasurePassDelegate;
import androidx.compose.ui.node.NodeChain;
import androidx.compose.ui.node.TraversableNode;
import androidx.compose.ui.node.TraversableNodeKt;
import androidx.compose.ui.platform.SubcompositionKt;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.DpRect;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.core.view.ViewCompat;
import androidx.navigation.compose.ComposeNavigator;
import java.util.List;
import java.util.Map;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: SubcomposeLayout.kt */
@Metadata(d1 = {"\u0000¨\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\f\b\u0000\u0018\u00002\u00020\u0001:\u0003bcdB\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J0\u0010)\u001a\b\u0012\u0004\u0012\u00020+0*2\b\u0010,\u001a\u0004\u0018\u00010\u000b2\u0011\u0010-\u001a\r\u0012\u0004\u0012\u00020/0.¢\u0006\u0002\b0H\u0002¢\u0006\u0002\u00101J%\u00102\u001a\u0002032\u001d\u00104\u001a\u0019\u0012\u0004\u0012\u000206\u0012\u0004\u0012\u000207\u0012\u0004\u0012\u00020805¢\u0006\u0002\b9J!\u0010:\u001a\u0002082\u0006\u0010;\u001a\u0002082\u000e\b\u0004\u0010<\u001a\b\u0012\u0004\u0012\u00020/0.H\u0082\bJ\u0010\u0010=\u001a\u00020\u00032\u0006\u0010>\u001a\u00020\u0018H\u0002J\b\u0010?\u001a\u00020/H\u0002J\u000e\u0010@\u001a\u00020/2\u0006\u0010A\u001a\u00020\u0018J\b\u0010B\u001a\u00020/H\u0002J\u0006\u0010C\u001a\u00020/J \u0010D\u001a\u0004\u0018\u00010\u000b2\f\u0010E\u001a\b\u0012\u0004\u0012\u00020\u00030*2\u0006\u0010>\u001a\u00020\u0018H\u0002J\u0017\u0010F\u001a\u00020/2\f\u00104\u001a\b\u0012\u0004\u0012\u00020/0.H\u0082\bJ\u0006\u0010G\u001a\u00020/J\u0010\u0010H\u001a\u00020/2\u0006\u0010I\u001a\u00020JH\u0002J\"\u0010K\u001a\u00020/2\u0006\u0010L\u001a\u00020\u00182\u0006\u0010M\u001a\u00020\u00182\b\b\u0002\u0010N\u001a\u00020\u0018H\u0002J\b\u0010O\u001a\u00020/H\u0016J\b\u0010P\u001a\u00020/H\u0016J\b\u0010Q\u001a\u00020/H\u0016J(\u0010R\u001a\u00020\u00102\b\u0010,\u001a\u0004\u0018\u00010\u000b2\u0011\u0010-\u001a\r\u0012\u0004\u0012\u00020/0.¢\u0006\u0002\b0¢\u0006\u0002\u0010SJ\u0018\u0010T\u001a\u00020/2\u0006\u0010U\u001a\u00020\u00032\u0006\u0010V\u001a\u00020\u001bH\u0002J2\u0010T\u001a\u00020/2\u0006\u0010U\u001a\u00020\u00032\b\u0010,\u001a\u0004\u0018\u00010\u000b2\u0011\u0010-\u001a\r\u0012\u0004\u0012\u00020/0.¢\u0006\u0002\b0H\u0002¢\u0006\u0002\u0010WJ.\u0010T\u001a\b\u0012\u0004\u0012\u00020+0*2\b\u0010,\u001a\u0004\u0018\u00010\u000b2\u0011\u0010-\u001a\r\u0012\u0004\u0012\u00020/0.¢\u0006\u0002\b0¢\u0006\u0002\u00101JB\u0010X\u001a\u00020Y2\b\u0010Z\u001a\u0004\u0018\u00010Y2\u0006\u0010[\u001a\u00020\u00032\u0006\u0010\\\u001a\u00020J2\u0006\u0010]\u001a\u00020\u00122\u0011\u0010^\u001a\r\u0012\u0004\u0012\u00020/0.¢\u0006\u0002\b0H\u0002¢\u0006\u0002\u0010_J\u0014\u0010`\u001a\u0004\u0018\u00010\u00032\b\u0010,\u001a\u0004\u0018\u00010\u000bH\u0002J\f\u0010a\u001a\u00020/*\u00020\u0003H\u0002R\u000e\u0010\u0007\u001a\u00020\bX\u0082D¢\u0006\u0002\n\u0000R\u0016\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u000b0\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u0012\u0010\f\u001a\u00060\rR\u00020\u0000X\u0082\u0004¢\u0006\u0002\n\u0000R\u001c\u0010\u000e\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010\u000b\u0012\u0004\u0012\u00020\u00100\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u001c\u0010\u0011\u001a\u0004\u0018\u00010\u0012X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0013\u0010\u0014\"\u0004\b\u0015\u0010\u0016R\u000e\u0010\u0017\u001a\u00020\u0018X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u0018X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010\u001a\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u001b0\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u001c\u0010\u001c\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010\u000b\u0012\u0004\u0012\u00020\u00030\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u0018X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u0018X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020 X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0012\u0010!\u001a\u00060\"R\u00020\u0000X\u0082\u0004¢\u0006\u0002\n\u0000R\u001c\u0010#\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010\u000b\u0012\u0004\u0012\u00020\u00030\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R$\u0010\u0004\u001a\u00020\u00052\u0006\u0010$\u001a\u00020\u0005@FX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b%\u0010&\"\u0004\b'\u0010(¨\u0006e"}, d2 = {"Landroidx/compose/ui/layout/LayoutNodeSubcompositionsState;", "Landroidx/compose/runtime/ComposeNodeLifecycleCallback;", "root", "Landroidx/compose/ui/node/LayoutNode;", "slotReusePolicy", "Landroidx/compose/ui/layout/SubcomposeSlotReusePolicy;", "(Landroidx/compose/ui/node/LayoutNode;Landroidx/compose/ui/layout/SubcomposeSlotReusePolicy;)V", "NoIntrinsicsMessage", "", "approachComposedSlotIds", "Landroidx/compose/runtime/collection/MutableVector;", "", "approachMeasureScope", "Landroidx/compose/ui/layout/LayoutNodeSubcompositionsState$ApproachMeasureScopeImpl;", "approachPrecomposeSlotHandleMap", "Landroidx/collection/MutableScatterMap;", "Landroidx/compose/ui/layout/SubcomposeLayoutState$PrecomposedSlotHandle;", "compositionContext", "Landroidx/compose/runtime/CompositionContext;", "getCompositionContext", "()Landroidx/compose/runtime/CompositionContext;", "setCompositionContext", "(Landroidx/compose/runtime/CompositionContext;)V", "currentApproachIndex", "", "currentIndex", "nodeToNodeState", "Landroidx/compose/ui/layout/LayoutNodeSubcompositionsState$NodeState;", "precomposeMap", "precomposedCount", "reusableCount", "reusableSlotIdsSet", "Landroidx/compose/ui/layout/SubcomposeSlotReusePolicy$SlotIdsSet;", "scope", "Landroidx/compose/ui/layout/LayoutNodeSubcompositionsState$Scope;", "slotIdToNode", "value", "getSlotReusePolicy", "()Landroidx/compose/ui/layout/SubcomposeSlotReusePolicy;", "setSlotReusePolicy", "(Landroidx/compose/ui/layout/SubcomposeSlotReusePolicy;)V", "approachSubcompose", "", "Landroidx/compose/ui/layout/Measurable;", "slotId", "content", "Lkotlin/Function0;", "", "Landroidx/compose/runtime/Composable;", "(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/util/List;", "createMeasurePolicy", "Landroidx/compose/ui/layout/MeasurePolicy;", "block", "Lkotlin/Function2;", "Landroidx/compose/ui/layout/SubcomposeMeasureScope;", "Landroidx/compose/ui/unit/Constraints;", "Landroidx/compose/ui/layout/MeasureResult;", "Lkotlin/ExtensionFunctionType;", "createMeasureResult", "result", "placeChildrenBlock", "createNodeAt", "index", "disposeCurrentNodes", "disposeOrReuseStartingFromIndex", "startIndex", "disposeUnusedSlotsInApproach", "forceRecomposeChildren", "getSlotIdAtIndex", "foldedChildren", "ignoreRemeasureRequests", "makeSureStateIsConsistent", "markActiveNodesAsReused", "deactivate", "", "move", TypedValues.TransitionType.S_FROM, TypedValues.TransitionType.S_TO, "count", "onDeactivate", "onRelease", "onReuse", "precompose", "(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Landroidx/compose/ui/layout/SubcomposeLayoutState$PrecomposedSlotHandle;", "subcompose", "node", "nodeState", "(Landroidx/compose/ui/node/LayoutNode;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V", "subcomposeInto", "Landroidx/compose/runtime/ReusableComposition;", "existing", "container", "reuseContent", "parent", ComposeNavigator.NAME, "(Landroidx/compose/runtime/ReusableComposition;Landroidx/compose/ui/node/LayoutNode;ZLandroidx/compose/runtime/CompositionContext;Lkotlin/jvm/functions/Function2;)Landroidx/compose/runtime/ReusableComposition;", "takeNodeFromReusables", "resetLayoutState", "ApproachMeasureScopeImpl", "NodeState", "Scope", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class LayoutNodeSubcompositionsState implements ComposeNodeLifecycleCallback {
    public static final int $stable = 8;
    private CompositionContext compositionContext;
    private int currentApproachIndex;
    private int currentIndex;
    private int precomposedCount;
    private int reusableCount;
    private final LayoutNode root;
    private SubcomposeSlotReusePolicy slotReusePolicy;
    private final MutableScatterMap<LayoutNode, NodeState> nodeToNodeState = ScatterMapKt.mutableScatterMapOf();
    private final MutableScatterMap<Object, LayoutNode> slotIdToNode = ScatterMapKt.mutableScatterMapOf();
    private final Scope scope = new Scope();
    private final ApproachMeasureScopeImpl approachMeasureScope = new ApproachMeasureScopeImpl();
    private final MutableScatterMap<Object, LayoutNode> precomposeMap = ScatterMapKt.mutableScatterMapOf();
    private final SubcomposeSlotReusePolicy.SlotIdsSet reusableSlotIdsSet = new SubcomposeSlotReusePolicy.SlotIdsSet(null, 1, null);
    private final MutableScatterMap<Object, SubcomposeLayoutState.PrecomposedSlotHandle> approachPrecomposeSlotHandleMap = ScatterMapKt.mutableScatterMapOf();
    private final MutableVector<Object> approachComposedSlotIds = new MutableVector<>(new Object[16], 0);
    private final String NoIntrinsicsMessage = "Asking for intrinsic measurements of SubcomposeLayout layouts is not supported. This includes components that are built on top of SubcomposeLayout, such as lazy lists, BoxWithConstraints, TabRow, etc. To mitigate this:\n- if intrinsic measurements are used to achieve 'match parent' sizing, consider replacing the parent of the component with a custom layout which controls the order in which children are measured, making intrinsic measurement not needed\n- adding a size modifier to the component, in order to fast return the queried intrinsic measurement.";

    public LayoutNodeSubcompositionsState(LayoutNode root, SubcomposeSlotReusePolicy slotReusePolicy) {
        this.root = root;
        this.slotReusePolicy = slotReusePolicy;
    }

    public final CompositionContext getCompositionContext() {
        return this.compositionContext;
    }

    public final void setCompositionContext(CompositionContext compositionContext) {
        this.compositionContext = compositionContext;
    }

    public final SubcomposeSlotReusePolicy getSlotReusePolicy() {
        return this.slotReusePolicy;
    }

    public final void setSlotReusePolicy(SubcomposeSlotReusePolicy value) {
        if (this.slotReusePolicy != value) {
            this.slotReusePolicy = value;
            markActiveNodesAsReused(false);
            LayoutNode.requestRemeasure$ui_release$default(this.root, false, false, false, 7, null);
        }
    }

    @Override // androidx.compose.runtime.ComposeNodeLifecycleCallback
    public void onReuse() {
        markActiveNodesAsReused(false);
    }

    @Override // androidx.compose.runtime.ComposeNodeLifecycleCallback
    public void onDeactivate() {
        markActiveNodesAsReused(true);
    }

    @Override // androidx.compose.runtime.ComposeNodeLifecycleCallback
    public void onRelease() {
        disposeCurrentNodes();
    }

    public final List<Measurable> subcompose(Object slotId, Function2<? super Composer, ? super Integer, Unit> function2) {
        LayoutNode takeNodeFromReusables;
        makeSureStateIsConsistent();
        LayoutNode.LayoutState layoutState = this.root.getLayoutState$ui_release();
        boolean value$iv = layoutState == LayoutNode.LayoutState.Measuring || layoutState == LayoutNode.LayoutState.LayingOut || layoutState == LayoutNode.LayoutState.LookaheadMeasuring || layoutState == LayoutNode.LayoutState.LookaheadLayingOut;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("subcompose can only be used inside the measure or layout blocks");
        }
        MutableScatterMap this_$iv = this.slotIdToNode;
        LayoutNode layoutNode = this_$iv.get(slotId);
        if (layoutNode == null) {
            LayoutNode precomposed = this.precomposeMap.remove(slotId);
            if (precomposed != null) {
                boolean value$iv2 = this.precomposedCount > 0;
                if (!value$iv2) {
                    InlineClassHelperKt.throwIllegalStateException("Check failed.");
                }
                this.precomposedCount--;
                takeNodeFromReusables = precomposed;
            } else {
                takeNodeFromReusables = takeNodeFromReusables(slotId);
                if (takeNodeFromReusables == null) {
                    takeNodeFromReusables = createNodeAt(this.currentIndex);
                }
            }
            layoutNode = takeNodeFromReusables;
            this_$iv.set(slotId, layoutNode);
        }
        LayoutNode node = layoutNode;
        if (CollectionsKt.getOrNull(this.root.getFoldedChildren$ui_release(), this.currentIndex) != node) {
            int itemIndex = this.root.getFoldedChildren$ui_release().indexOf(node);
            boolean value$iv3 = itemIndex >= this.currentIndex;
            if (!value$iv3) {
                InlineClassHelperKt.throwIllegalArgumentException("Key \"" + slotId + "\" was already used. If you are using LazyColumn/Row please make sure you provide a unique key for each item.");
            }
            int $i$f$requirePrecondition = this.currentIndex;
            if ($i$f$requirePrecondition != itemIndex) {
                move$default(this, itemIndex, this.currentIndex, 0, 4, null);
            }
        }
        this.currentIndex++;
        subcompose(node, slotId, function2);
        if (layoutState == LayoutNode.LayoutState.Measuring || layoutState == LayoutNode.LayoutState.LayingOut) {
            return node.getChildMeasurables$ui_release();
        }
        return node.getChildLookaheadMeasurables$ui_release();
    }

    private final void subcompose(LayoutNode node, Object slotId, Function2<? super Composer, ? super Integer, Unit> function2) {
        MutableScatterMap this_$iv = this.nodeToNodeState;
        Object obj = this_$iv.get(node);
        if (obj == null) {
            NodeState nodeState = new NodeState(slotId, ComposableSingletons$SubcomposeLayoutKt.INSTANCE.m5629getLambda1$ui_release(), null, 4, null);
            this_$iv.set(node, nodeState);
            obj = nodeState;
        }
        Object slotId2 = obj;
        NodeState nodeState2 = (NodeState) slotId2;
        ReusableComposition composition = nodeState2.getComposition();
        boolean hasPendingChanges = composition != null ? composition.getHasInvalidations() : true;
        if (nodeState2.getContent() != function2 || hasPendingChanges || nodeState2.getForceRecompose()) {
            nodeState2.setContent(function2);
            subcompose(node, nodeState2);
            nodeState2.setForceRecompose(false);
        }
    }

    private final void subcompose(LayoutNode node, final NodeState nodeState) {
        Snapshot.Companion this_$iv = Snapshot.Companion;
        Snapshot previousSnapshot$iv = this_$iv.getCurrentThreadSnapshot();
        Function1 observer$iv = previousSnapshot$iv != null ? previousSnapshot$iv.getReadObserver() : null;
        Snapshot newSnapshot$iv = this_$iv.makeCurrentNonObservable(previousSnapshot$iv);
        try {
            LayoutNode this_$iv$iv = this.root;
            this_$iv$iv.ignoreRemeasureRequests = true;
            final Function2 content = nodeState.getContent();
            ReusableComposition composition = nodeState.getComposition();
            CompositionContext compositionContext = this.compositionContext;
            try {
                if (compositionContext != null) {
                    nodeState.setComposition(subcomposeInto(composition, node, nodeState.getForceReuse(), compositionContext, ComposableLambdaKt.composableLambdaInstance(-1750409193, true, new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.ui.layout.LayoutNodeSubcompositionsState$subcompose$3$1$1
                        /* JADX INFO: Access modifiers changed from: package-private */
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        /* JADX WARN: Multi-variable type inference failed */
                        {
                            super(2);
                        }

                        @Override // kotlin.jvm.functions.Function2
                        public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                            invoke(composer, num.intValue());
                            return Unit.INSTANCE;
                        }

                        public final void invoke(Composer $composer, int $changed) {
                            ComposerKt.sourceInformation($composer, "C522@22985L46:SubcomposeLayout.kt#80mrfh");
                            if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
                                $composer.skipToGroupEnd();
                                return;
                            }
                            if (ComposerKt.isTraceInProgress()) {
                                ComposerKt.traceEventStart(-1750409193, $changed, -1, "androidx.compose.ui.layout.LayoutNodeSubcompositionsState.subcompose.<anonymous>.<anonymous>.<anonymous> (SubcomposeLayout.kt:522)");
                            }
                            boolean active$iv = LayoutNodeSubcompositionsState.NodeState.this.getActive();
                            Function2 content$iv = content;
                            ComposerKt.sourceInformationMarkerStart($composer, -570654463, "CC(ReusableContentHost)161@6675L9:Composables.kt#9igjgp");
                            $composer.startReusableGroup(ComposerKt.reuseKey, Boolean.valueOf(active$iv));
                            boolean activeChanged$iv = $composer.changed(active$iv);
                            if (active$iv) {
                                content$iv.invoke($composer, Integer.valueOf((0 >> 3) & 14));
                            } else {
                                $composer.deactivateToEndGroup(activeChanged$iv);
                            }
                            $composer.endReusableGroup();
                            ComposerKt.sourceInformationMarkerEnd($composer);
                            if (ComposerKt.isTraceInProgress()) {
                                ComposerKt.traceEventEnd();
                            }
                        }
                    })));
                    nodeState.setForceReuse(false);
                    this_$iv$iv.ignoreRemeasureRequests = false;
                    Unit unit = Unit.INSTANCE;
                    this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
                    return;
                }
                InlineClassHelperKt.throwIllegalStateExceptionForNullCheck("parent composition reference not set");
                throw new KotlinNothingValueException();
            } catch (Throwable th) {
                th = th;
                this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    private final ReusableComposition subcomposeInto(ReusableComposition existing, LayoutNode container, boolean reuseContent, CompositionContext parent, Function2<? super Composer, ? super Integer, Unit> function2) {
        ReusableComposition createSubcomposition;
        if (existing == null || existing.isDisposed()) {
            createSubcomposition = SubcompositionKt.createSubcomposition(container, parent);
        } else {
            createSubcomposition = existing;
        }
        ReusableComposition $this$subcomposeInto_u24lambda_u246 = createSubcomposition;
        if (!reuseContent) {
            $this$subcomposeInto_u24lambda_u246.setContent(function2);
        } else {
            $this$subcomposeInto_u24lambda_u246.setContentWithReuse(function2);
        }
        return createSubcomposition;
    }

    private final Object getSlotIdAtIndex(List<LayoutNode> list, int index) {
        LayoutNode node = list.get(index);
        NodeState nodeState = this.nodeToNodeState.get(node);
        Intrinsics.checkNotNull(nodeState);
        return nodeState.getSlotId();
    }

    public final void disposeOrReuseStartingFromIndex(int startIndex) {
        Throwable th;
        List foldedChildren;
        int lastReusableIndex;
        boolean z;
        boolean z2;
        int i = startIndex;
        this.reusableCount = 0;
        List foldedChildren2 = this.root.getFoldedChildren$ui_release();
        boolean z3 = true;
        int lastReusableIndex2 = (foldedChildren2.size() - this.precomposedCount) - 1;
        boolean needApplyNotification = false;
        if (i <= lastReusableIndex2) {
            this.reusableSlotIdsSet.clear();
            int i2 = startIndex;
            if (i2 <= lastReusableIndex2) {
                while (true) {
                    this.reusableSlotIdsSet.add(getSlotIdAtIndex(foldedChildren2, i2));
                    if (i2 == lastReusableIndex2) {
                        break;
                    }
                    i2++;
                }
            }
            this.slotReusePolicy.getSlotsToRetain(this.reusableSlotIdsSet);
            int i3 = lastReusableIndex2;
            Snapshot.Companion this_$iv = Snapshot.Companion;
            Snapshot previousSnapshot$iv = this_$iv.getCurrentThreadSnapshot();
            Function1 observer$iv = previousSnapshot$iv != null ? previousSnapshot$iv.getReadObserver() : null;
            Snapshot newSnapshot$iv = this_$iv.makeCurrentNonObservable(previousSnapshot$iv);
            while (i3 >= i) {
                try {
                    LayoutNode node = foldedChildren2.get(i3);
                    NodeState nodeState = this.nodeToNodeState.get(node);
                    Intrinsics.checkNotNull(nodeState);
                    NodeState nodeState2 = nodeState;
                    Object slotId = nodeState2.getSlotId();
                    boolean z4 = z3;
                    if (this.reusableSlotIdsSet.contains(slotId)) {
                        try {
                            this.reusableCount++;
                            if (nodeState2.getActive()) {
                                resetLayoutState(node);
                                nodeState2.setActive(false);
                                foldedChildren = foldedChildren2;
                                lastReusableIndex = lastReusableIndex2;
                                needApplyNotification = true;
                                z = z4;
                                z2 = false;
                            } else {
                                foldedChildren = foldedChildren2;
                                lastReusableIndex = lastReusableIndex2;
                                z = z4;
                                z2 = false;
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
                            throw th;
                        }
                    } else {
                        LayoutNode this_$iv$iv = this.root;
                        foldedChildren = foldedChildren2;
                        try {
                            this_$iv$iv.ignoreRemeasureRequests = z4;
                            this.nodeToNodeState.remove(node);
                            ReusableComposition composition = nodeState2.getComposition();
                            if (composition != null) {
                                try {
                                    composition.dispose();
                                } catch (Throwable th3) {
                                    th = th3;
                                    this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
                                    throw th;
                                }
                            }
                            lastReusableIndex = lastReusableIndex2;
                            z = true;
                        } catch (Throwable th4) {
                            th = th4;
                        }
                        try {
                            this.root.removeAt$ui_release(i3, 1);
                            z2 = false;
                            this_$iv$iv.ignoreRemeasureRequests = false;
                        } catch (Throwable th5) {
                            th = th5;
                            this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
                            throw th;
                        }
                    }
                    this.slotIdToNode.remove(slotId);
                    i3--;
                    i = startIndex;
                    z3 = z;
                    foldedChildren2 = foldedChildren;
                    lastReusableIndex2 = lastReusableIndex;
                } catch (Throwable th6) {
                    th = th6;
                }
            }
            Unit unit = Unit.INSTANCE;
            this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
        }
        if (needApplyNotification) {
            Snapshot.Companion.sendApplyNotifications();
        }
        makeSureStateIsConsistent();
    }

    private final void markActiveNodesAsReused(boolean deactivate) {
        MutableState<Boolean> mutableStateOf$default;
        this.precomposedCount = 0;
        this.precomposeMap.clear();
        List foldedChildren = this.root.getFoldedChildren$ui_release();
        int childCount = foldedChildren.size();
        if (this.reusableCount != childCount) {
            this.reusableCount = childCount;
            Snapshot.Companion this_$iv = Snapshot.Companion;
            Snapshot previousSnapshot$iv = this_$iv.getCurrentThreadSnapshot();
            Function1 observer$iv = previousSnapshot$iv != null ? previousSnapshot$iv.getReadObserver() : null;
            Snapshot newSnapshot$iv = this_$iv.makeCurrentNonObservable(previousSnapshot$iv);
            for (int i = 0; i < childCount; i++) {
                try {
                    LayoutNode node = foldedChildren.get(i);
                    NodeState nodeState = this.nodeToNodeState.get(node);
                    if (nodeState != null && nodeState.getActive()) {
                        resetLayoutState(node);
                        if (deactivate) {
                            ReusableComposition composition = nodeState.getComposition();
                            if (composition != null) {
                                composition.deactivate();
                            }
                            mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
                            nodeState.setActiveState(mutableStateOf$default);
                        } else {
                            nodeState.setActive(false);
                        }
                        nodeState.setSlotId(SubcomposeLayoutKt.access$getReusedSlotId$p());
                    }
                } catch (Throwable th) {
                    this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
                    throw th;
                }
            }
            Unit unit = Unit.INSTANCE;
            this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
            this.slotIdToNode.clear();
        }
        makeSureStateIsConsistent();
    }

    private final void disposeCurrentNodes() {
        LayoutNode this_$iv = this.root;
        this_$iv.ignoreRemeasureRequests = true;
        int i = 0;
        ScatterMap this_$iv2 = this.nodeToNodeState;
        Object[] v$iv = this_$iv2.values;
        long[] m$iv$iv = this_$iv2.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 <= lastIndex$iv$iv) {
            while (true) {
                long slot$iv$iv = m$iv$iv[i$iv$iv];
                int i2 = i;
                long $this$maskEmptyOrDeleted$iv$iv$iv = ((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L);
                if ($this$maskEmptyOrDeleted$iv$iv$iv != -9187201950435737472L) {
                    int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                    long slot$iv$iv2 = slot$iv$iv;
                    for (int j$iv$iv = 0; j$iv$iv < bitCount$iv$iv; j$iv$iv++) {
                        long value$iv$iv$iv = slot$iv$iv2 & 255;
                        if (value$iv$iv$iv < 128) {
                            int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                            NodeState it = (NodeState) v$iv[index$iv$iv];
                            ReusableComposition composition = it.getComposition();
                            if (composition != null) {
                                composition.dispose();
                            }
                        }
                        slot$iv$iv2 >>= 8;
                    }
                    if (bitCount$iv$iv != 8) {
                        break;
                    }
                }
                if (i$iv$iv == lastIndex$iv$iv) {
                    break;
                }
                i$iv$iv++;
                i = i2;
            }
        }
        this.root.removeAll$ui_release();
        this_$iv.ignoreRemeasureRequests = false;
        this.nodeToNodeState.clear();
        this.slotIdToNode.clear();
        this.precomposedCount = 0;
        this.reusableCount = 0;
        this.precomposeMap.clear();
        makeSureStateIsConsistent();
    }

    public final void makeSureStateIsConsistent() {
        int childrenCount = this.root.getFoldedChildren$ui_release().size();
        boolean value$iv = this.nodeToNodeState.getSize() == childrenCount;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("Inconsistency between the count of nodes tracked by the state (" + this.nodeToNodeState.getSize() + ") and the children count on the SubcomposeLayout (" + childrenCount + "). Are you trying to use the state of the disposed SubcomposeLayout?");
        }
        boolean value$iv2 = (childrenCount - this.reusableCount) - this.precomposedCount >= 0;
        if (!value$iv2) {
            InlineClassHelperKt.throwIllegalArgumentException("Incorrect state. Total children " + childrenCount + ". Reusable children " + this.reusableCount + ". Precomposed children " + this.precomposedCount);
        }
        boolean value$iv3 = this.precomposeMap.getSize() == this.precomposedCount;
        if (value$iv3) {
            return;
        }
        InlineClassHelperKt.throwIllegalArgumentException("Incorrect state. Precomposed children " + this.precomposedCount + ". Map size " + this.precomposeMap.getSize());
    }

    private final void resetLayoutState(LayoutNode $this$resetLayoutState) {
        $this$resetLayoutState.getMeasurePassDelegate$ui_release().setMeasuredByParent$ui_release(LayoutNode.UsageByParent.NotUsed);
        LookaheadPassDelegate it = $this$resetLayoutState.getLookaheadPassDelegate$ui_release();
        if (it != null) {
            it.setMeasuredByParent$ui_release(LayoutNode.UsageByParent.NotUsed);
        }
    }

    private final LayoutNode takeNodeFromReusables(Object slotId) {
        MutableState<Boolean> mutableStateOf$default;
        if (this.reusableCount == 0) {
            return null;
        }
        List foldedChildren = this.root.getFoldedChildren$ui_release();
        int reusableNodesSectionEnd = foldedChildren.size() - this.precomposedCount;
        int reusableNodesSectionStart = reusableNodesSectionEnd - this.reusableCount;
        int index = reusableNodesSectionEnd - 1;
        int chosenIndex = -1;
        while (true) {
            if (index < reusableNodesSectionStart) {
                break;
            } else if (Intrinsics.areEqual(getSlotIdAtIndex(foldedChildren, index), slotId)) {
                chosenIndex = index;
                break;
            } else {
                index--;
            }
        }
        if (chosenIndex == -1) {
            index = reusableNodesSectionEnd - 1;
            while (index >= reusableNodesSectionStart) {
                NodeState nodeState = this.nodeToNodeState.get(foldedChildren.get(index));
                Intrinsics.checkNotNull(nodeState);
                NodeState nodeState2 = nodeState;
                if (nodeState2.getSlotId() == SubcomposeLayoutKt.access$getReusedSlotId$p() || this.slotReusePolicy.areCompatible(slotId, nodeState2.getSlotId())) {
                    nodeState2.setSlotId(slotId);
                    chosenIndex = index;
                    break;
                }
                index--;
            }
        }
        if (chosenIndex == -1) {
            return null;
        }
        if (index != reusableNodesSectionStart) {
            move(index, reusableNodesSectionStart, 1);
        }
        this.reusableCount--;
        LayoutNode node = foldedChildren.get(reusableNodesSectionStart);
        NodeState nodeState3 = this.nodeToNodeState.get(node);
        Intrinsics.checkNotNull(nodeState3);
        NodeState nodeState4 = nodeState3;
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(true, null, 2, null);
        nodeState4.setActiveState(mutableStateOf$default);
        nodeState4.setForceReuse(true);
        nodeState4.setForceRecompose(true);
        return node;
    }

    public final MeasurePolicy createMeasurePolicy(final Function2<? super SubcomposeMeasureScope, ? super Constraints, ? extends MeasureResult> function2) {
        final String str = this.NoIntrinsicsMessage;
        return new LayoutNode.NoIntrinsicsMeasurePolicy(str) { // from class: androidx.compose.ui.layout.LayoutNodeSubcompositionsState$createMeasurePolicy$1
            @Override // androidx.compose.ui.layout.MeasurePolicy
            /* renamed from: measure-3p2s80s */
            public MeasureResult mo300measure3p2s80s(MeasureScope $this$measure_u2d3p2s80s, List<? extends Measurable> list, long constraints) {
                LayoutNodeSubcompositionsState.ApproachMeasureScopeImpl approachMeasureScopeImpl;
                final int indexAfterMeasure;
                LayoutNodeSubcompositionsState.this.scope.setLayoutDirection($this$measure_u2d3p2s80s.getLayoutDirection());
                LayoutNodeSubcompositionsState.this.scope.setDensity($this$measure_u2d3p2s80s.getDensity());
                LayoutNodeSubcompositionsState.this.scope.setFontScale($this$measure_u2d3p2s80s.getFontScale());
                if ($this$measure_u2d3p2s80s.isLookingAhead() || LayoutNodeSubcompositionsState.this.root.getLookaheadRoot$ui_release() == null) {
                    LayoutNodeSubcompositionsState.this.currentIndex = 0;
                    final MeasureResult result = function2.invoke(LayoutNodeSubcompositionsState.this.scope, Constraints.m6813boximpl(constraints));
                    final int indexAfterMeasure2 = LayoutNodeSubcompositionsState.this.currentIndex;
                    LayoutNodeSubcompositionsState layoutNodeSubcompositionsState = LayoutNodeSubcompositionsState.this;
                    final LayoutNodeSubcompositionsState layoutNodeSubcompositionsState2 = LayoutNodeSubcompositionsState.this;
                    return new MeasureResult() { // from class: androidx.compose.ui.layout.LayoutNodeSubcompositionsState$createMeasurePolicy$1$measure-3p2s80s$$inlined$createMeasureResult$2
                        @Override // androidx.compose.ui.layout.MeasureResult
                        public Map<AlignmentLine, Integer> getAlignmentLines() {
                            return result.getAlignmentLines();
                        }

                        @Override // androidx.compose.ui.layout.MeasureResult
                        public int getHeight() {
                            return result.getHeight();
                        }

                        @Override // androidx.compose.ui.layout.MeasureResult
                        public Function1<RulerScope, Unit> getRulers() {
                            return result.getRulers();
                        }

                        @Override // androidx.compose.ui.layout.MeasureResult
                        public int getWidth() {
                            return result.getWidth();
                        }

                        @Override // androidx.compose.ui.layout.MeasureResult
                        public void placeChildren() {
                            layoutNodeSubcompositionsState2.currentIndex = indexAfterMeasure2;
                            result.placeChildren();
                            layoutNodeSubcompositionsState2.disposeOrReuseStartingFromIndex(layoutNodeSubcompositionsState2.currentIndex);
                        }
                    };
                }
                LayoutNodeSubcompositionsState.this.currentApproachIndex = 0;
                Function2<SubcomposeMeasureScope, Constraints, MeasureResult> function22 = function2;
                approachMeasureScopeImpl = LayoutNodeSubcompositionsState.this.approachMeasureScope;
                final MeasureResult result2 = function22.invoke(approachMeasureScopeImpl, Constraints.m6813boximpl(constraints));
                indexAfterMeasure = LayoutNodeSubcompositionsState.this.currentApproachIndex;
                LayoutNodeSubcompositionsState layoutNodeSubcompositionsState3 = LayoutNodeSubcompositionsState.this;
                final LayoutNodeSubcompositionsState layoutNodeSubcompositionsState4 = LayoutNodeSubcompositionsState.this;
                return new MeasureResult() { // from class: androidx.compose.ui.layout.LayoutNodeSubcompositionsState$createMeasurePolicy$1$measure-3p2s80s$$inlined$createMeasureResult$1
                    @Override // androidx.compose.ui.layout.MeasureResult
                    public Map<AlignmentLine, Integer> getAlignmentLines() {
                        return result2.getAlignmentLines();
                    }

                    @Override // androidx.compose.ui.layout.MeasureResult
                    public int getHeight() {
                        return result2.getHeight();
                    }

                    @Override // androidx.compose.ui.layout.MeasureResult
                    public Function1<RulerScope, Unit> getRulers() {
                        return result2.getRulers();
                    }

                    @Override // androidx.compose.ui.layout.MeasureResult
                    public int getWidth() {
                        return result2.getWidth();
                    }

                    @Override // androidx.compose.ui.layout.MeasureResult
                    public void placeChildren() {
                        layoutNodeSubcompositionsState4.currentApproachIndex = indexAfterMeasure;
                        result2.placeChildren();
                        layoutNodeSubcompositionsState4.disposeUnusedSlotsInApproach();
                    }
                };
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0068, code lost:
        if (r2 >= r23.currentApproachIndex) goto L15;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void disposeUnusedSlotsInApproach() {
        /*
            r23 = this;
            r0 = r23
            androidx.collection.MutableScatterMap<java.lang.Object, androidx.compose.ui.layout.SubcomposeLayoutState$PrecomposedSlotHandle> r1 = r0.approachPrecomposeSlotHandleMap
            r2 = 0
            r3 = r1
            androidx.collection.ScatterMap r3 = (androidx.collection.ScatterMap) r3
            r4 = 0
            long[] r5 = r3.metadata
            int r6 = r5.length
            int r6 = r6 + (-2)
            r7 = 0
            if (r7 > r6) goto La5
        L11:
            r8 = r5[r7]
            r10 = r8
            r12 = 0
            long r13 = ~r10
            r15 = 7
            long r13 = r13 << r15
            long r13 = r13 & r10
            r15 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r10 = r13 & r15
            int r10 = (r10 > r15 ? 1 : (r10 == r15 ? 0 : -1))
            if (r10 == 0) goto L97
            int r10 = r7 - r6
            int r10 = ~r10
            int r10 = r10 >>> 31
            r11 = 8
            int r10 = 8 - r10
            r12 = 0
        L2e:
            if (r12 >= r10) goto L8c
            r13 = 255(0xff, double:1.26E-321)
            long r13 = r13 & r8
            r15 = 0
            r16 = 128(0x80, double:6.3E-322)
            int r16 = (r13 > r16 ? 1 : (r13 == r16 ? 0 : -1))
            r17 = 0
            r18 = 1
            if (r16 >= 0) goto L41
            r13 = r18
            goto L43
        L41:
            r13 = r17
        L43:
            if (r13 == 0) goto L7b
            int r13 = r7 << 3
            int r13 = r13 + r12
            r14 = r13
            r15 = 0
            r16 = r11
            java.lang.Object[] r11 = r1.keys
            r11 = r11[r14]
            r19 = r2
            java.lang.Object[] r2 = r1.values
            r2 = r2[r14]
            androidx.compose.ui.layout.SubcomposeLayoutState$PrecomposedSlotHandle r2 = (androidx.compose.ui.layout.SubcomposeLayoutState.PrecomposedSlotHandle) r2
            r20 = 0
            r21 = r2
            androidx.compose.runtime.collection.MutableVector<java.lang.Object> r2 = r0.approachComposedSlotIds
            int r2 = r2.indexOf(r11)
            if (r2 < 0) goto L6c
            r22 = r3
            int r3 = r0.currentApproachIndex
            if (r2 < r3) goto L6b
            goto L6e
        L6b:
            goto L73
        L6c:
            r22 = r3
        L6e:
            r21.dispose()
            r17 = r18
        L73:
            if (r17 == 0) goto L79
            r1.removeValueAt(r14)
        L79:
            goto L81
        L7b:
            r19 = r2
            r22 = r3
            r16 = r11
        L81:
            long r8 = r8 >> r16
            int r12 = r12 + 1
            r11 = r16
            r2 = r19
            r3 = r22
            goto L2e
        L8c:
            r19 = r2
            r22 = r3
            r16 = r11
            r2 = r16
            if (r10 != r2) goto Laa
            goto L9b
        L97:
            r19 = r2
            r22 = r3
        L9b:
            if (r7 == r6) goto La9
            int r7 = r7 + 1
            r2 = r19
            r3 = r22
            goto L11
        La5:
            r19 = r2
            r22 = r3
        La9:
        Laa:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.layout.LayoutNodeSubcompositionsState.disposeUnusedSlotsInApproach():void");
    }

    private final MeasureResult createMeasureResult(final MeasureResult result, final Function0<Unit> function0) {
        return new MeasureResult() { // from class: androidx.compose.ui.layout.LayoutNodeSubcompositionsState$createMeasureResult$1
            @Override // androidx.compose.ui.layout.MeasureResult
            public Map<AlignmentLine, Integer> getAlignmentLines() {
                return result.getAlignmentLines();
            }

            @Override // androidx.compose.ui.layout.MeasureResult
            public int getHeight() {
                return result.getHeight();
            }

            @Override // androidx.compose.ui.layout.MeasureResult
            public Function1<RulerScope, Unit> getRulers() {
                return result.getRulers();
            }

            @Override // androidx.compose.ui.layout.MeasureResult
            public int getWidth() {
                return result.getWidth();
            }

            @Override // androidx.compose.ui.layout.MeasureResult
            public void placeChildren() {
                function0.invoke();
            }
        };
    }

    public final SubcomposeLayoutState.PrecomposedSlotHandle precompose(final Object slotId, Function2<? super Composer, ? super Integer, Unit> function2) {
        LayoutNode createNodeAt;
        if (!this.root.isAttached()) {
            return new SubcomposeLayoutState.PrecomposedSlotHandle() { // from class: androidx.compose.ui.layout.LayoutNodeSubcompositionsState$precompose$1
                @Override // androidx.compose.ui.layout.SubcomposeLayoutState.PrecomposedSlotHandle
                public void dispose() {
                }
            };
        }
        makeSureStateIsConsistent();
        if (!this.slotIdToNode.containsKey(slotId)) {
            this.approachPrecomposeSlotHandleMap.remove(slotId);
            MutableScatterMap this_$iv = this.precomposeMap;
            LayoutNode layoutNode = this_$iv.get(slotId);
            if (layoutNode == null) {
                LayoutNode reusedNode = takeNodeFromReusables(slotId);
                LayoutNode layoutNode2 = this.root;
                if (reusedNode != null) {
                    int nodeIndex = layoutNode2.getFoldedChildren$ui_release().indexOf(reusedNode);
                    move(nodeIndex, this.root.getFoldedChildren$ui_release().size(), 1);
                    this.precomposedCount++;
                    createNodeAt = reusedNode;
                } else {
                    createNodeAt = createNodeAt(layoutNode2.getFoldedChildren$ui_release().size());
                    this.precomposedCount++;
                }
                layoutNode = createNodeAt;
                this_$iv.set(slotId, layoutNode);
            }
            LayoutNode node = layoutNode;
            subcompose(node, slotId, function2);
        }
        return new SubcomposeLayoutState.PrecomposedSlotHandle() { // from class: androidx.compose.ui.layout.LayoutNodeSubcompositionsState$precompose$2
            @Override // androidx.compose.ui.layout.SubcomposeLayoutState.PrecomposedSlotHandle
            public void dispose() {
                MutableScatterMap mutableScatterMap;
                int i;
                int i2;
                int i3;
                int i4;
                int i5;
                int i6;
                LayoutNodeSubcompositionsState.this.makeSureStateIsConsistent();
                mutableScatterMap = LayoutNodeSubcompositionsState.this.precomposeMap;
                LayoutNode node2 = (LayoutNode) mutableScatterMap.remove(slotId);
                if (node2 != null) {
                    i = LayoutNodeSubcompositionsState.this.precomposedCount;
                    boolean value$iv = i > 0;
                    if (!value$iv) {
                        InlineClassHelperKt.throwIllegalStateException("No pre-composed items to dispose");
                    }
                    int itemIndex = LayoutNodeSubcompositionsState.this.root.getFoldedChildren$ui_release().indexOf(node2);
                    int size = LayoutNodeSubcompositionsState.this.root.getFoldedChildren$ui_release().size();
                    i2 = LayoutNodeSubcompositionsState.this.precomposedCount;
                    boolean value$iv2 = itemIndex >= size - i2;
                    if (!value$iv2) {
                        InlineClassHelperKt.throwIllegalStateException("Item is not in pre-composed item range");
                    }
                    LayoutNodeSubcompositionsState layoutNodeSubcompositionsState = LayoutNodeSubcompositionsState.this;
                    i3 = layoutNodeSubcompositionsState.reusableCount;
                    layoutNodeSubcompositionsState.reusableCount = i3 + 1;
                    LayoutNodeSubcompositionsState layoutNodeSubcompositionsState2 = LayoutNodeSubcompositionsState.this;
                    i4 = layoutNodeSubcompositionsState2.precomposedCount;
                    layoutNodeSubcompositionsState2.precomposedCount = i4 - 1;
                    int size2 = LayoutNodeSubcompositionsState.this.root.getFoldedChildren$ui_release().size();
                    i5 = LayoutNodeSubcompositionsState.this.precomposedCount;
                    int i7 = size2 - i5;
                    i6 = LayoutNodeSubcompositionsState.this.reusableCount;
                    int reusableStart = i7 - i6;
                    LayoutNodeSubcompositionsState.this.move(itemIndex, reusableStart, 1);
                    LayoutNodeSubcompositionsState.this.disposeOrReuseStartingFromIndex(reusableStart);
                }
            }

            @Override // androidx.compose.ui.layout.SubcomposeLayoutState.PrecomposedSlotHandle
            public int getPlaceablesCount() {
                MutableScatterMap mutableScatterMap;
                List<LayoutNode> children$ui_release;
                mutableScatterMap = LayoutNodeSubcompositionsState.this.precomposeMap;
                LayoutNode layoutNode3 = (LayoutNode) mutableScatterMap.get(slotId);
                if (layoutNode3 == null || (children$ui_release = layoutNode3.getChildren$ui_release()) == null) {
                    return 0;
                }
                return children$ui_release.size();
            }

            @Override // androidx.compose.ui.layout.SubcomposeLayoutState.PrecomposedSlotHandle
            /* renamed from: premeasure-0kLqBqw  reason: not valid java name */
            public void mo5663premeasure0kLqBqw(int index, long constraints) {
                MutableScatterMap mutableScatterMap;
                mutableScatterMap = LayoutNodeSubcompositionsState.this.precomposeMap;
                LayoutNode node2 = (LayoutNode) mutableScatterMap.get(slotId);
                if (node2 != null && node2.isAttached()) {
                    int size = node2.getChildren$ui_release().size();
                    if (index < 0 || index >= size) {
                        InlineClassHelperKt.throwIndexOutOfBoundsException("Index (" + index + ") is out of bound of [0, " + size + ')');
                    }
                    boolean value$iv = !node2.isPlaced();
                    if (!value$iv) {
                        InlineClassHelperKt.throwIllegalArgumentException("Pre-measure called on node that is not placed");
                    }
                    LayoutNode this_$iv2 = LayoutNodeSubcompositionsState.this.root;
                    this_$iv2.ignoreRemeasureRequests = true;
                    LayoutNodeKt.requireOwner(node2).mo5959measureAndLayout0kLqBqw(node2.getChildren$ui_release().get(index), constraints);
                    this_$iv2.ignoreRemeasureRequests = false;
                }
            }

            @Override // androidx.compose.ui.layout.SubcomposeLayoutState.PrecomposedSlotHandle
            public void traverseDescendants(Object key, Function1<? super TraversableNode, ? extends TraversableNode.Companion.TraverseDescendantsAction> function1) {
                MutableScatterMap mutableScatterMap;
                NodeChain nodes$ui_release;
                Modifier.Node head$ui_release;
                mutableScatterMap = LayoutNodeSubcompositionsState.this.precomposeMap;
                LayoutNode layoutNode3 = (LayoutNode) mutableScatterMap.get(slotId);
                if (layoutNode3 == null || (nodes$ui_release = layoutNode3.getNodes$ui_release()) == null || (head$ui_release = nodes$ui_release.getHead$ui_release()) == null) {
                    return;
                }
                TraversableNodeKt.traverseDescendants(head$ui_release, key, function1);
            }
        };
    }

    public final void forceRecomposeChildren() {
        int $i$f$forEachValue;
        int $i$f$forEachValue2;
        int childCount = this.root.getFoldedChildren$ui_release().size();
        if (this.reusableCount != childCount) {
            ScatterMap this_$iv = this.nodeToNodeState;
            int $i$f$forEachValue3 = 0;
            Object[] v$iv = this_$iv.values;
            long[] m$iv$iv = this_$iv.metadata;
            int lastIndex$iv$iv = m$iv$iv.length - 2;
            int i$iv$iv = 0;
            if (0 <= lastIndex$iv$iv) {
                while (true) {
                    long slot$iv$iv = m$iv$iv[i$iv$iv];
                    int childCount2 = childCount;
                    ScatterMap this_$iv2 = this_$iv;
                    if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                        $i$f$forEachValue = $i$f$forEachValue3;
                    } else {
                        int i = 8;
                        int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                        int j$iv$iv = 0;
                        while (j$iv$iv < bitCount$iv$iv) {
                            long value$iv$iv$iv = 255 & slot$iv$iv;
                            int i2 = i;
                            if (!(value$iv$iv$iv < 128)) {
                                $i$f$forEachValue2 = $i$f$forEachValue3;
                            } else {
                                int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                                NodeState nodeState = (NodeState) v$iv[index$iv$iv];
                                $i$f$forEachValue2 = $i$f$forEachValue3;
                                nodeState.setForceRecompose(true);
                            }
                            slot$iv$iv >>= i2;
                            j$iv$iv++;
                            i = i2;
                            $i$f$forEachValue3 = $i$f$forEachValue2;
                        }
                        $i$f$forEachValue = $i$f$forEachValue3;
                        if (bitCount$iv$iv != i) {
                            break;
                        }
                    }
                    if (i$iv$iv == lastIndex$iv$iv) {
                        break;
                    }
                    i$iv$iv++;
                    childCount = childCount2;
                    this_$iv = this_$iv2;
                    $i$f$forEachValue3 = $i$f$forEachValue;
                }
            }
            if (!this.root.getMeasurePending$ui_release()) {
                LayoutNode.requestRemeasure$ui_release$default(this.root, false, false, false, 7, null);
            }
        }
    }

    private final LayoutNode createNodeAt(int index) {
        LayoutNode node = new LayoutNode(true, 0, 2, null);
        LayoutNode this_$iv$iv = this.root;
        this_$iv$iv.ignoreRemeasureRequests = true;
        this.root.insertAt$ui_release(index, node);
        this_$iv$iv.ignoreRemeasureRequests = false;
        return node;
    }

    static /* synthetic */ void move$default(LayoutNodeSubcompositionsState layoutNodeSubcompositionsState, int i, int i2, int i3, int i4, Object obj) {
        if ((i4 & 4) != 0) {
            i3 = 1;
        }
        layoutNodeSubcompositionsState.move(i, i2, i3);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void move(int from, int to, int count) {
        LayoutNode this_$iv$iv = this.root;
        this_$iv$iv.ignoreRemeasureRequests = true;
        this.root.move$ui_release(from, to, count);
        this_$iv$iv.ignoreRemeasureRequests = false;
    }

    private final void ignoreRemeasureRequests(Function0<Unit> function0) {
        LayoutNode this_$iv = this.root;
        this_$iv.ignoreRemeasureRequests = true;
        function0.invoke();
        this_$iv.ignoreRemeasureRequests = false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: SubcomposeLayout.kt */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0018\b\u0002\u0018\u00002\u00020\u0001B.\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0001\u0012\u0011\u0010\u0003\u001a\r\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\u0002\b\u0006\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\u0002\u0010\tR$\u0010\f\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\u000b8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010R \u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u000b0\u0012X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0013\u0010\u0014\"\u0004\b\u0015\u0010\u0016R\u001c\u0010\u0007\u001a\u0004\u0018\u00010\bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0017\u0010\u0018\"\u0004\b\u0019\u0010\u001aR'\u0010\u0003\u001a\r\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\u0002\b\u0006X\u0086\u000e¢\u0006\u0010\n\u0002\u0010\u001f\u001a\u0004\b\u001b\u0010\u001c\"\u0004\b\u001d\u0010\u001eR\u001a\u0010 \u001a\u00020\u000bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b!\u0010\u000e\"\u0004\b\"\u0010\u0010R\u001a\u0010#\u001a\u00020\u000bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b$\u0010\u000e\"\u0004\b%\u0010\u0010R\u001c\u0010\u0002\u001a\u0004\u0018\u00010\u0001X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b&\u0010'\"\u0004\b(\u0010)¨\u0006*"}, d2 = {"Landroidx/compose/ui/layout/LayoutNodeSubcompositionsState$NodeState;", "", "slotId", "content", "Lkotlin/Function0;", "", "Landroidx/compose/runtime/Composable;", "composition", "Landroidx/compose/runtime/ReusableComposition;", "(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/ReusableComposition;)V", "value", "", "active", "getActive", "()Z", "setActive", "(Z)V", "activeState", "Landroidx/compose/runtime/MutableState;", "getActiveState", "()Landroidx/compose/runtime/MutableState;", "setActiveState", "(Landroidx/compose/runtime/MutableState;)V", "getComposition", "()Landroidx/compose/runtime/ReusableComposition;", "setComposition", "(Landroidx/compose/runtime/ReusableComposition;)V", "getContent", "()Lkotlin/jvm/functions/Function2;", "setContent", "(Lkotlin/jvm/functions/Function2;)V", "Lkotlin/jvm/functions/Function2;", "forceRecompose", "getForceRecompose", "setForceRecompose", "forceReuse", "getForceReuse", "setForceReuse", "getSlotId", "()Ljava/lang/Object;", "setSlotId", "(Ljava/lang/Object;)V", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class NodeState {
        private MutableState<Boolean> activeState;
        private ReusableComposition composition;
        private Function2<? super Composer, ? super Integer, Unit> content;
        private boolean forceRecompose;
        private boolean forceReuse;
        private Object slotId;

        public NodeState(Object slotId, Function2<? super Composer, ? super Integer, Unit> function2, ReusableComposition composition) {
            MutableState<Boolean> mutableStateOf$default;
            this.slotId = slotId;
            this.content = function2;
            this.composition = composition;
            mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(true, null, 2, null);
            this.activeState = mutableStateOf$default;
        }

        public /* synthetic */ NodeState(Object obj, Function2 function2, ReusableComposition reusableComposition, int i, DefaultConstructorMarker defaultConstructorMarker) {
            this(obj, function2, (i & 4) != 0 ? null : reusableComposition);
        }

        public final Object getSlotId() {
            return this.slotId;
        }

        public final void setSlotId(Object obj) {
            this.slotId = obj;
        }

        public final Function2<Composer, Integer, Unit> getContent() {
            return this.content;
        }

        public final void setContent(Function2<? super Composer, ? super Integer, Unit> function2) {
            this.content = function2;
        }

        public final ReusableComposition getComposition() {
            return this.composition;
        }

        public final void setComposition(ReusableComposition reusableComposition) {
            this.composition = reusableComposition;
        }

        public final boolean getForceRecompose() {
            return this.forceRecompose;
        }

        public final void setForceRecompose(boolean z) {
            this.forceRecompose = z;
        }

        public final boolean getForceReuse() {
            return this.forceReuse;
        }

        public final void setForceReuse(boolean z) {
            this.forceReuse = z;
        }

        public final MutableState<Boolean> getActiveState() {
            return this.activeState;
        }

        public final void setActiveState(MutableState<Boolean> mutableState) {
            this.activeState = mutableState;
        }

        public final boolean getActive() {
            return this.activeState.getValue().booleanValue();
        }

        public final void setActive(boolean value) {
            this.activeState.setValue(Boolean.valueOf(value));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: SubcomposeLayout.kt */
    @Metadata(d1 = {"\u0000p\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\b\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0082\u0004\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J`\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u00182\u0012\u0010\u001a\u001a\u000e\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u00180\u001b2\u0019\u0010\u001d\u001a\u0015\u0012\u0004\u0012\u00020\u001f\u0012\u0004\u0012\u00020 \u0018\u00010\u001e¢\u0006\u0002\b!2\u0017\u0010\"\u001a\u0013\u0012\u0004\u0012\u00020#\u0012\u0004\u0012\u00020 0\u001e¢\u0006\u0002\b!H\u0016J0\u0010$\u001a\b\u0012\u0004\u0012\u00020&0%2\b\u0010'\u001a\u0004\u0018\u00010(2\u0011\u0010)\u001a\r\u0012\u0004\u0012\u00020 0*¢\u0006\u0002\b+H\u0016¢\u0006\u0002\u0010,R\u001a\u0010\u0003\u001a\u00020\u0004X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\bR\u001a\u0010\t\u001a\u00020\u0004X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\n\u0010\u0006\"\u0004\b\u000b\u0010\bR\u0014\u0010\f\u001a\u00020\r8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\f\u0010\u000eR\u001a\u0010\u000f\u001a\u00020\u0010X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0011\u0010\u0012\"\u0004\b\u0013\u0010\u0014¨\u0006-"}, d2 = {"Landroidx/compose/ui/layout/LayoutNodeSubcompositionsState$Scope;", "Landroidx/compose/ui/layout/SubcomposeMeasureScope;", "(Landroidx/compose/ui/layout/LayoutNodeSubcompositionsState;)V", "density", "", "getDensity", "()F", "setDensity", "(F)V", "fontScale", "getFontScale", "setFontScale", "isLookingAhead", "", "()Z", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "getLayoutDirection", "()Landroidx/compose/ui/unit/LayoutDirection;", "setLayoutDirection", "(Landroidx/compose/ui/unit/LayoutDirection;)V", "layout", "Landroidx/compose/ui/layout/MeasureResult;", "width", "", "height", "alignmentLines", "", "Landroidx/compose/ui/layout/AlignmentLine;", "rulers", "Lkotlin/Function1;", "Landroidx/compose/ui/layout/RulerScope;", "", "Lkotlin/ExtensionFunctionType;", "placementBlock", "Landroidx/compose/ui/layout/Placeable$PlacementScope;", "subcompose", "", "Landroidx/compose/ui/layout/Measurable;", "slotId", "", "content", "Lkotlin/Function0;", "Landroidx/compose/runtime/Composable;", "(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/util/List;", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public final class Scope implements SubcomposeMeasureScope {
        private float density;
        private float fontScale;
        private LayoutDirection layoutDirection = LayoutDirection.Rtl;

        public Scope() {
        }

        @Override // androidx.compose.ui.layout.IntrinsicMeasureScope
        public LayoutDirection getLayoutDirection() {
            return this.layoutDirection;
        }

        public void setLayoutDirection(LayoutDirection layoutDirection) {
            this.layoutDirection = layoutDirection;
        }

        @Override // androidx.compose.ui.unit.Density
        public float getDensity() {
            return this.density;
        }

        public void setDensity(float f) {
            this.density = f;
        }

        @Override // androidx.compose.ui.unit.FontScaling
        public float getFontScale() {
            return this.fontScale;
        }

        public void setFontScale(float f) {
            this.fontScale = f;
        }

        @Override // androidx.compose.ui.layout.IntrinsicMeasureScope
        public boolean isLookingAhead() {
            return LayoutNodeSubcompositionsState.this.root.getLayoutState$ui_release() == LayoutNode.LayoutState.LookaheadLayingOut || LayoutNodeSubcompositionsState.this.root.getLayoutState$ui_release() == LayoutNode.LayoutState.LookaheadMeasuring;
        }

        @Override // androidx.compose.ui.layout.SubcomposeMeasureScope
        public List<Measurable> subcompose(Object slotId, Function2<? super Composer, ? super Integer, Unit> function2) {
            return LayoutNodeSubcompositionsState.this.subcompose(slotId, function2);
        }

        @Override // androidx.compose.ui.layout.MeasureScope
        public MeasureResult layout(final int width, final int height, final Map<AlignmentLine, Integer> map, final Function1<? super RulerScope, Unit> function1, final Function1<? super Placeable.PlacementScope, Unit> function12) {
            boolean value$iv$iv = (width & ViewCompat.MEASURED_STATE_MASK) == 0 && ((-16777216) & height) == 0;
            if (!value$iv$iv) {
                InlineClassHelperKt.throwIllegalStateException("Size(" + width + " x " + height + ") is out of range. Each dimension must be between 0 and 16777215.");
            }
            final LayoutNodeSubcompositionsState layoutNodeSubcompositionsState = LayoutNodeSubcompositionsState.this;
            return new MeasureResult() { // from class: androidx.compose.ui.layout.LayoutNodeSubcompositionsState$Scope$layout$1
                @Override // androidx.compose.ui.layout.MeasureResult
                public int getWidth() {
                    return width;
                }

                @Override // androidx.compose.ui.layout.MeasureResult
                public int getHeight() {
                    return height;
                }

                @Override // androidx.compose.ui.layout.MeasureResult
                public Map<AlignmentLine, Integer> getAlignmentLines() {
                    return map;
                }

                @Override // androidx.compose.ui.layout.MeasureResult
                public Function1<RulerScope, Unit> getRulers() {
                    return function1;
                }

                @Override // androidx.compose.ui.layout.MeasureResult
                public void placeChildren() {
                    LookaheadDelegate delegate;
                    if (!this.isLookingAhead() || (delegate = layoutNodeSubcompositionsState.root.getInnerCoordinator$ui_release().getLookaheadDelegate()) == null) {
                        function12.invoke(layoutNodeSubcompositionsState.root.getInnerCoordinator$ui_release().getPlacementScope());
                    } else {
                        function12.invoke(delegate.getPlacementScope());
                    }
                }
            };
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: SubcomposeLayout.kt */
    @Metadata(d1 = {"\u0000\u009c\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\b\u0082\u0004\u0018\u00002\u00020\u00012\u00020\u0002B\u0005¢\u0006\u0002\u0010\u0003Je\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00142\u0014\b\u0002\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0018\u0012\u0004\u0012\u00020\u00140\u00172\u001b\b\u0002\u0010\u0019\u001a\u0015\u0012\u0004\u0012\u00020\u001b\u0012\u0004\u0012\u00020\u001c\u0018\u00010\u001a¢\u0006\u0002\b\u001d2\u0017\u0010\u001e\u001a\u0013\u0012\u0004\u0012\u00020\u001f\u0012\u0004\u0012\u00020\u001c0\u001a¢\u0006\u0002\b\u001dH\u0096\u0001JH\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00142\u0014\b\u0002\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0018\u0012\u0004\u0012\u00020\u00140\u00172\u0017\u0010\u001e\u001a\u0013\u0012\u0004\u0012\u00020\u001f\u0012\u0004\u0012\u00020\u001c0\u001a¢\u0006\u0002\b\u001dH\u0096\u0001J0\u0010 \u001a\b\u0012\u0004\u0012\u00020\"0!2\b\u0010#\u001a\u0004\u0018\u00010$2\u0011\u0010%\u001a\r\u0012\u0004\u0012\u00020\u001c0&¢\u0006\u0002\b'H\u0016¢\u0006\u0002\u0010(J\u0017\u0010)\u001a\u00020\u0014*\u00020*H\u0097\u0001ø\u0001\u0000¢\u0006\u0004\b+\u0010,J\u0017\u0010)\u001a\u00020\u0014*\u00020-H\u0097\u0001ø\u0001\u0000¢\u0006\u0004\b.\u0010/J\u0017\u00100\u001a\u00020**\u00020-H\u0097\u0001ø\u0001\u0000¢\u0006\u0004\b1\u00102J\u001a\u00100\u001a\u00020**\u00020\u0005H\u0097\u0001ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b3\u00104J\u001a\u00100\u001a\u00020**\u00020\u0014H\u0097\u0001ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b3\u00105J\u0017\u00106\u001a\u000207*\u000208H\u0097\u0001ø\u0001\u0000¢\u0006\u0004\b9\u0010:J\u0017\u0010;\u001a\u00020\u0005*\u00020*H\u0097\u0001ø\u0001\u0000¢\u0006\u0004\b<\u00104J\u0017\u0010;\u001a\u00020\u0005*\u00020-H\u0097\u0001ø\u0001\u0000¢\u0006\u0004\b=\u00102J\r\u0010>\u001a\u00020?*\u00020@H\u0097\u0001J\u0017\u0010A\u001a\u000208*\u000207H\u0097\u0001ø\u0001\u0000¢\u0006\u0004\bB\u0010:J\u0017\u0010C\u001a\u00020-*\u00020*H\u0097\u0001ø\u0001\u0000¢\u0006\u0004\bD\u0010EJ\u001a\u0010C\u001a\u00020-*\u00020\u0005H\u0097\u0001ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\bF\u0010EJ\u001a\u0010C\u001a\u00020-*\u00020\u0014H\u0097\u0001ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\bF\u0010GR\u0014\u0010\u0004\u001a\u00020\u00058\u0016X\u0097\u0005¢\u0006\u0006\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u00058\u0016X\u0097\u0005¢\u0006\u0006\u001a\u0004\b\t\u0010\u0007R\u0014\u0010\n\u001a\u00020\u000b8VX\u0096\u0005¢\u0006\u0006\u001a\u0004\b\n\u0010\fR\u0012\u0010\r\u001a\u00020\u000eX\u0096\u0005¢\u0006\u0006\u001a\u0004\b\u000f\u0010\u0010\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006H"}, d2 = {"Landroidx/compose/ui/layout/LayoutNodeSubcompositionsState$ApproachMeasureScopeImpl;", "Landroidx/compose/ui/layout/SubcomposeMeasureScope;", "Landroidx/compose/ui/layout/MeasureScope;", "(Landroidx/compose/ui/layout/LayoutNodeSubcompositionsState;)V", "density", "", "getDensity", "()F", "fontScale", "getFontScale", "isLookingAhead", "", "()Z", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "getLayoutDirection", "()Landroidx/compose/ui/unit/LayoutDirection;", "layout", "Landroidx/compose/ui/layout/MeasureResult;", "width", "", "height", "alignmentLines", "", "Landroidx/compose/ui/layout/AlignmentLine;", "rulers", "Lkotlin/Function1;", "Landroidx/compose/ui/layout/RulerScope;", "", "Lkotlin/ExtensionFunctionType;", "placementBlock", "Landroidx/compose/ui/layout/Placeable$PlacementScope;", "subcompose", "", "Landroidx/compose/ui/layout/Measurable;", "slotId", "", "content", "Lkotlin/Function0;", "Landroidx/compose/runtime/Composable;", "(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/util/List;", "roundToPx", "Landroidx/compose/ui/unit/Dp;", "roundToPx-0680j_4", "(F)I", "Landroidx/compose/ui/unit/TextUnit;", "roundToPx--R2X_6o", "(J)I", "toDp", "toDp-GaN1DYA", "(J)F", "toDp-u2uoSUM", "(F)F", "(I)F", "toDpSize", "Landroidx/compose/ui/unit/DpSize;", "Landroidx/compose/ui/geometry/Size;", "toDpSize-k-rfVVM", "(J)J", "toPx", "toPx-0680j_4", "toPx--R2X_6o", "toRect", "Landroidx/compose/ui/geometry/Rect;", "Landroidx/compose/ui/unit/DpRect;", "toSize", "toSize-XkaWNTQ", "toSp", "toSp-0xMU5do", "(F)J", "toSp-kPz2Gy4", "(I)J", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public final class ApproachMeasureScopeImpl implements SubcomposeMeasureScope, MeasureScope {
        private final /* synthetic */ Scope $$delegate_0;

        @Override // androidx.compose.ui.unit.Density
        public float getDensity() {
            return this.$$delegate_0.getDensity();
        }

        @Override // androidx.compose.ui.unit.FontScaling
        public float getFontScale() {
            return this.$$delegate_0.getFontScale();
        }

        @Override // androidx.compose.ui.layout.IntrinsicMeasureScope
        public LayoutDirection getLayoutDirection() {
            return this.$$delegate_0.getLayoutDirection();
        }

        @Override // androidx.compose.ui.layout.IntrinsicMeasureScope
        public boolean isLookingAhead() {
            return this.$$delegate_0.isLookingAhead();
        }

        @Override // androidx.compose.ui.layout.MeasureScope
        public MeasureResult layout(int i, int i2, Map<AlignmentLine, Integer> map, Function1<? super Placeable.PlacementScope, Unit> function1) {
            return this.$$delegate_0.layout(i, i2, map, function1);
        }

        @Override // androidx.compose.ui.layout.MeasureScope
        public MeasureResult layout(int i, int i2, Map<AlignmentLine, Integer> map, Function1<? super RulerScope, Unit> function1, Function1<? super Placeable.PlacementScope, Unit> function12) {
            return this.$$delegate_0.layout(i, i2, map, function1, function12);
        }

        @Override // androidx.compose.ui.unit.Density
        /* renamed from: roundToPx--R2X_6o */
        public int mo637roundToPxR2X_6o(long j) {
            return this.$$delegate_0.mo637roundToPxR2X_6o(j);
        }

        @Override // androidx.compose.ui.unit.Density
        /* renamed from: roundToPx-0680j_4 */
        public int mo638roundToPx0680j_4(float f) {
            return this.$$delegate_0.mo638roundToPx0680j_4(f);
        }

        @Override // androidx.compose.ui.unit.FontScaling
        /* renamed from: toDp-GaN1DYA */
        public float mo639toDpGaN1DYA(long j) {
            return this.$$delegate_0.mo639toDpGaN1DYA(j);
        }

        @Override // androidx.compose.ui.unit.Density
        /* renamed from: toDp-u2uoSUM */
        public float mo640toDpu2uoSUM(float f) {
            return this.$$delegate_0.mo640toDpu2uoSUM(f);
        }

        @Override // androidx.compose.ui.unit.Density
        /* renamed from: toDp-u2uoSUM */
        public float mo641toDpu2uoSUM(int i) {
            return this.$$delegate_0.mo641toDpu2uoSUM(i);
        }

        @Override // androidx.compose.ui.unit.Density
        /* renamed from: toDpSize-k-rfVVM */
        public long mo642toDpSizekrfVVM(long j) {
            return this.$$delegate_0.mo642toDpSizekrfVVM(j);
        }

        @Override // androidx.compose.ui.unit.Density
        /* renamed from: toPx--R2X_6o */
        public float mo643toPxR2X_6o(long j) {
            return this.$$delegate_0.mo643toPxR2X_6o(j);
        }

        @Override // androidx.compose.ui.unit.Density
        /* renamed from: toPx-0680j_4 */
        public float mo644toPx0680j_4(float f) {
            return this.$$delegate_0.mo644toPx0680j_4(f);
        }

        @Override // androidx.compose.ui.unit.Density
        public Rect toRect(DpRect dpRect) {
            return this.$$delegate_0.toRect(dpRect);
        }

        @Override // androidx.compose.ui.unit.Density
        /* renamed from: toSize-XkaWNTQ */
        public long mo645toSizeXkaWNTQ(long j) {
            return this.$$delegate_0.mo645toSizeXkaWNTQ(j);
        }

        @Override // androidx.compose.ui.unit.FontScaling
        /* renamed from: toSp-0xMU5do */
        public long mo646toSp0xMU5do(float f) {
            return this.$$delegate_0.mo646toSp0xMU5do(f);
        }

        @Override // androidx.compose.ui.unit.Density
        /* renamed from: toSp-kPz2Gy4 */
        public long mo647toSpkPz2Gy4(float f) {
            return this.$$delegate_0.mo647toSpkPz2Gy4(f);
        }

        @Override // androidx.compose.ui.unit.Density
        /* renamed from: toSp-kPz2Gy4 */
        public long mo648toSpkPz2Gy4(int i) {
            return this.$$delegate_0.mo648toSpkPz2Gy4(i);
        }

        public ApproachMeasureScopeImpl() {
            this.$$delegate_0 = LayoutNodeSubcompositionsState.this.scope;
        }

        @Override // androidx.compose.ui.layout.SubcomposeMeasureScope
        public List<Measurable> subcompose(Object slotId, Function2<? super Composer, ? super Integer, Unit> function2) {
            LayoutNode nodeInSlot = (LayoutNode) LayoutNodeSubcompositionsState.this.slotIdToNode.get(slotId);
            if (nodeInSlot == null || LayoutNodeSubcompositionsState.this.root.getFoldedChildren$ui_release().indexOf(nodeInSlot) >= LayoutNodeSubcompositionsState.this.currentIndex) {
                return LayoutNodeSubcompositionsState.this.approachSubcompose(slotId, function2);
            }
            return nodeInSlot.getChildMeasurables$ui_release();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final List<Measurable> approachSubcompose(Object slotId, Function2<? super Composer, ? super Integer, Unit> function2) {
        boolean value$iv = this.approachComposedSlotIds.getSize() >= this.currentApproachIndex;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("Error: currentApproachIndex cannot be greater than the size of theapproachComposedSlotIds list.");
        }
        int size = this.approachComposedSlotIds.getSize();
        int i = this.currentApproachIndex;
        MutableVector<Object> mutableVector = this.approachComposedSlotIds;
        if (size == i) {
            mutableVector.add(slotId);
        } else {
            mutableVector.set(this.currentApproachIndex, slotId);
        }
        this.currentApproachIndex++;
        if (!this.precomposeMap.contains(slotId)) {
            this.approachPrecomposeSlotHandleMap.set(slotId, precompose(slotId, function2));
            LayoutNode.LayoutState layoutState$ui_release = this.root.getLayoutState$ui_release();
            LayoutNode.LayoutState layoutState = LayoutNode.LayoutState.LayingOut;
            LayoutNode layoutNode = this.root;
            if (layoutState$ui_release == layoutState) {
                layoutNode.requestLookaheadRelayout$ui_release(true);
            } else {
                LayoutNode.requestLookaheadRemeasure$ui_release$default(layoutNode, true, false, false, 6, null);
            }
        }
        LayoutNode $this$approachSubcompose_u24lambda_u2427 = this.precomposeMap.get(slotId);
        if ($this$approachSubcompose_u24lambda_u2427 != null) {
            List it = $this$approachSubcompose_u24lambda_u2427.getMeasurePassDelegate$ui_release().getChildDelegates$ui_release();
            int size2 = it.size();
            for (int index$iv = 0; index$iv < size2; index$iv++) {
                Object item$iv = it.get(index$iv);
                MeasurePassDelegate delegate = (MeasurePassDelegate) item$iv;
                delegate.markDetachedFromParentLookaheadPass$ui_release();
            }
            if (it != null) {
                return it;
            }
        }
        return CollectionsKt.emptyList();
    }
}
