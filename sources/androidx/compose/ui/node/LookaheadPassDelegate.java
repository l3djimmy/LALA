package androidx.compose.ui.node;

import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.graphics.GraphicsLayerScope;
import androidx.compose.ui.graphics.layer.GraphicsLayer;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.layout.AlignmentLine;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntSize;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: LookaheadPassDelegate.kt */
@Metadata(d1 = {"\u0000¶\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\r\n\u0002\u0010\u0000\n\u0002\b\u000e\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\b?\b\u0000\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004:\u0002³\u0001B\r\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0002\u0010\u0007J\u0014\u0010s\u001a\u000e\u0012\u0004\u0012\u00020u\u0012\u0004\u0012\u00020W0tH\u0016J\b\u0010v\u001a\u00020-H\u0002J\b\u0010w\u001a\u00020-H\u0002J\u001c\u0010x\u001a\u00020-2\u0012\u0010y\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020-0+H\u0016J\u001d\u0010z\u001a\u00020-2\u0012\u0010y\u001a\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020-0+H\u0082\bJ\u0011\u0010{\u001a\u00020W2\u0006\u0010|\u001a\u00020uH\u0096\u0002J\u000e\u0010}\u001a\u00020-2\u0006\u0010~\u001a\u00020\u0015J\u0006\u0010\u007f\u001a\u00020-J\t\u0010\u0080\u0001\u001a\u00020-H\u0016J\u000f\u0010\u0081\u0001\u001a\u00020-H\u0000¢\u0006\u0003\b\u0082\u0001J\u000f\u0010\u0083\u0001\u001a\u00020-H\u0000¢\u0006\u0003\b\u0084\u0001J\u0018\u0010\u0085\u0001\u001a\u00020-2\u0007\u0010\u0086\u0001\u001a\u00020\u0015H\u0000¢\u0006\u0003\b\u0087\u0001J\t\u0010\u0088\u0001\u001a\u00020-H\u0002J\u0012\u0010\u0089\u0001\u001a\u00020W2\u0007\u0010\u008a\u0001\u001a\u00020WH\u0016J\u0012\u0010\u008b\u0001\u001a\u00020W2\u0007\u0010\u008c\u0001\u001a\u00020WH\u0016J\u001e\u0010\u008d\u0001\u001a\u00020\u00012\u0007\u0010\u008e\u0001\u001a\u00020%H\u0016ø\u0001\u0000¢\u0006\u0006\b\u008f\u0001\u0010\u0090\u0001J\u0012\u0010\u0091\u0001\u001a\u00020W2\u0007\u0010\u008a\u0001\u001a\u00020WH\u0016J\u0012\u0010\u0092\u0001\u001a\u00020W2\u0007\u0010\u008c\u0001\u001a\u00020WH\u0016J\u0007\u0010\u0093\u0001\u001a\u00020-J\u0007\u0010\u0094\u0001\u001a\u00020-J\t\u0010\u0095\u0001\u001a\u00020-H\u0002J\t\u0010\u0096\u0001\u001a\u00020-H\u0002J\u0007\u0010\u0097\u0001\u001a\u00020-J\u000f\u0010\u0098\u0001\u001a\u00020-H\u0000¢\u0006\u0003\b\u0099\u0001J\u001e\u0010\u009a\u0001\u001a\u00020-2\u0007\u0010\u008e\u0001\u001a\u00020%H\u0000ø\u0001\u0000¢\u0006\u0006\b\u009b\u0001\u0010\u009c\u0001JC\u0010\u009d\u0001\u001a\u00020-2\u0007\u0010\u009e\u0001\u001a\u0002002\u0007\u0010\u009f\u0001\u001a\u0002032\u001a\u0010 \u0001\u001a\u0015\u0012\u0004\u0012\u00020,\u0012\u0004\u0012\u00020-\u0018\u00010+¢\u0006\u0002\b.H\u0014ø\u0001\u0000¢\u0006\u0006\b¡\u0001\u0010¢\u0001J0\u0010\u009d\u0001\u001a\u00020-2\u0007\u0010\u009e\u0001\u001a\u0002002\u0007\u0010\u009f\u0001\u001a\u0002032\u0007\u0010£\u0001\u001a\u00020)H\u0014ø\u0001\u0000¢\u0006\u0006\b¡\u0001\u0010¤\u0001JN\u0010¥\u0001\u001a\u00020-2\u0007\u0010\u009e\u0001\u001a\u0002002\u0007\u0010\u009f\u0001\u001a\u0002032\u001a\u0010 \u0001\u001a\u0015\u0012\u0004\u0012\u00020,\u0012\u0004\u0012\u00020-\u0018\u00010+¢\u0006\u0002\b.2\t\u0010£\u0001\u001a\u0004\u0018\u00010)H\u0002ø\u0001\u0000¢\u0006\u0006\b¦\u0001\u0010§\u0001J\u001c\u0010¨\u0001\u001a\u00020\u00152\u0007\u0010\u008e\u0001\u001a\u00020%ø\u0001\u0000¢\u0006\u0006\b©\u0001\u0010ª\u0001J\u0007\u0010«\u0001\u001a\u00020-J\t\u0010¬\u0001\u001a\u00020-H\u0016J\t\u0010\u00ad\u0001\u001a\u00020-H\u0016J\u0012\u0010®\u0001\u001a\u00020-2\u0007\u0010¯\u0001\u001a\u000208H\u0002J\u0007\u0010°\u0001\u001a\u00020\u0015J\u0012\u0010±\u0001\u001a\u00020-2\u0007\u0010²\u0001\u001a\u00020\u0015H\u0016R\u0014\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00000\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\f\u001a\u00020\rX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u001a\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00000\u00118@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013R\u001a\u0010\u0014\u001a\u00020\u0015X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0016\u0010\u0017\"\u0004\b\u0018\u0010\u0019R\u0014\u0010\u001a\u001a\u00020\u00158BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u001b\u0010\u0017R\u000e\u0010\u001c\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u001d\u001a\u00020\u001e8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u001f\u0010 R\u0014\u0010!\u001a\u00020\u00158VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b!\u0010\u0017R\u001a\u0010\"\u001a\u00020\u0015X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\"\u0010\u0017\"\u0004\b#\u0010\u0019R\u0019\u0010$\u001a\u0004\u0018\u00010%8Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b&\u0010'R\u0010\u0010(\u001a\u0004\u0018\u00010)X\u0082\u000e¢\u0006\u0002\n\u0000R!\u0010*\u001a\u0015\u0012\u0004\u0012\u00020,\u0012\u0004\u0012\u00020-\u0018\u00010+¢\u0006\u0002\b.X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010/\u001a\u000200X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u00101R\u000e\u00102\u001a\u000203X\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u00105\u001a\u00020\u00152\u0006\u00104\u001a\u00020\u0015@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b6\u0010\u0017R\u0014\u00107\u001a\u0002088BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b9\u0010:R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R$\u0010<\u001a\u00020\u00152\u0006\u0010;\u001a\u00020\u00158B@BX\u0082\u000e¢\u0006\f\u001a\u0004\b=\u0010\u0017\"\u0004\b>\u0010\u0019R$\u0010?\u001a\u00020\u00152\u0006\u0010;\u001a\u00020\u00158B@BX\u0082\u000e¢\u0006\f\u001a\u0004\b@\u0010\u0017\"\u0004\bA\u0010\u0019R$\u0010C\u001a\u00020B2\u0006\u0010;\u001a\u00020B8B@BX\u0082\u000e¢\u0006\f\u001a\u0004\bD\u0010E\"\u0004\bF\u0010GR\u0016\u0010H\u001a\u0004\u0018\u00010%X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0002\n\u0000R\u0014\u0010I\u001a\u00020J8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\bK\u0010LR$\u0010M\u001a\u00020\u00152\u0006\u0010;\u001a\u00020\u00158B@BX\u0082\u000e¢\u0006\f\u001a\u0004\bN\u0010\u0017\"\u0004\bO\u0010\u0019R\u001a\u0010P\u001a\u00020QX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bR\u0010S\"\u0004\bT\u0010UR\u0014\u0010V\u001a\u00020W8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bX\u0010YR\u000e\u0010Z\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010[\u001a\u00020W8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\\\u0010YR\u0011\u0010]\u001a\u00020\u00158F¢\u0006\u0006\u001a\u0004\b^\u0010\u0017R\u000e\u0010_\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010`\u001a\u00020\u001e8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\ba\u0010 R\u0016\u0010b\u001a\u0004\u0018\u00010\u00038VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bc\u0010dR\"\u0010f\u001a\u0004\u0018\u00010e2\b\u00104\u001a\u0004\u0018\u00010e@RX\u0096\u000e¢\u0006\b\n\u0000\u001a\u0004\bg\u0010hR\u000e\u0010i\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010j\u001a\u00020WX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bk\u0010Y\"\u0004\bl\u0010mR\u001a\u0010n\u001a\u00020\u0015X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bo\u0010\u0017\"\u0004\bp\u0010\u0019R\u000e\u0010q\u001a\u00020WX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010r\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006´\u0001"}, d2 = {"Landroidx/compose/ui/node/LookaheadPassDelegate;", "Landroidx/compose/ui/layout/Placeable;", "Landroidx/compose/ui/layout/Measurable;", "Landroidx/compose/ui/node/AlignmentLinesOwner;", "Landroidx/compose/ui/node/MotionReferencePlacementDelegate;", "layoutNodeLayoutDelegate", "Landroidx/compose/ui/node/LayoutNodeLayoutDelegate;", "(Landroidx/compose/ui/node/LayoutNodeLayoutDelegate;)V", "_childDelegates", "Landroidx/compose/runtime/collection/MutableVector;", "_placedState", "Landroidx/compose/ui/node/LookaheadPassDelegate$PlacedState;", "alignmentLines", "Landroidx/compose/ui/node/AlignmentLines;", "getAlignmentLines", "()Landroidx/compose/ui/node/AlignmentLines;", "childDelegates", "", "getChildDelegates$ui_release", "()Ljava/util/List;", "childDelegatesDirty", "", "getChildDelegatesDirty$ui_release", "()Z", "setChildDelegatesDirty$ui_release", "(Z)V", "detachedFromParentLookaheadPlacement", "getDetachedFromParentLookaheadPlacement", "duringAlignmentLinesQuery", "innerCoordinator", "Landroidx/compose/ui/node/NodeCoordinator;", "getInnerCoordinator", "()Landroidx/compose/ui/node/NodeCoordinator;", "isPlaced", "isPlacedUnderMotionFrameOfReference", "setPlacedUnderMotionFrameOfReference", "lastConstraints", "Landroidx/compose/ui/unit/Constraints;", "getLastConstraints-DWUhwKw", "()Landroidx/compose/ui/unit/Constraints;", "lastExplicitLayer", "Landroidx/compose/ui/graphics/layer/GraphicsLayer;", "lastLayerBlock", "Lkotlin/Function1;", "Landroidx/compose/ui/graphics/GraphicsLayerScope;", "", "Lkotlin/ExtensionFunctionType;", "lastPosition", "Landroidx/compose/ui/unit/IntOffset;", "J", "lastZIndex", "", "<set-?>", "layingOutChildren", "getLayingOutChildren", "layoutNode", "Landroidx/compose/ui/node/LayoutNode;", "getLayoutNode", "()Landroidx/compose/ui/node/LayoutNode;", "value", "layoutPending", "getLayoutPending", "setLayoutPending", "layoutPendingForAlignment", "getLayoutPendingForAlignment", "setLayoutPendingForAlignment", "Landroidx/compose/ui/node/LayoutNode$LayoutState;", "layoutState", "getLayoutState", "()Landroidx/compose/ui/node/LayoutNode$LayoutState;", "setLayoutState", "(Landroidx/compose/ui/node/LayoutNode$LayoutState;)V", "lookaheadConstraints", "measurePassDelegate", "Landroidx/compose/ui/node/MeasurePassDelegate;", "getMeasurePassDelegate$ui_release", "()Landroidx/compose/ui/node/MeasurePassDelegate;", "measurePending", "getMeasurePending", "setMeasurePending", "measuredByParent", "Landroidx/compose/ui/node/LayoutNode$UsageByParent;", "getMeasuredByParent$ui_release", "()Landroidx/compose/ui/node/LayoutNode$UsageByParent;", "setMeasuredByParent$ui_release", "(Landroidx/compose/ui/node/LayoutNode$UsageByParent;)V", "measuredHeight", "", "getMeasuredHeight", "()I", "measuredOnce", "measuredWidth", "getMeasuredWidth", "needsToBePlacedInApproach", "getNeedsToBePlacedInApproach", "onNodePlacedCalled", "outerCoordinator", "getOuterCoordinator", "parentAlignmentLinesOwner", "getParentAlignmentLinesOwner", "()Landroidx/compose/ui/node/AlignmentLinesOwner;", "", "parentData", "getParentData", "()Ljava/lang/Object;", "parentDataDirty", "placeOrder", "getPlaceOrder$ui_release", "setPlaceOrder$ui_release", "(I)V", "placedOnce", "getPlacedOnce$ui_release", "setPlacedOnce$ui_release", "previousPlaceOrder", "relayoutWithoutParentInProgress", "calculateAlignmentLines", "", "Landroidx/compose/ui/layout/AlignmentLine;", "checkChildrenPlaceOrderForUpdates", "clearPlaceOrder", "forEachChildAlignmentLinesOwner", "block", "forEachChildDelegate", "get", "alignmentLine", "invalidateIntrinsicsParent", "forceRequest", "invalidateParentData", "layoutChildren", "markLayoutPending", "markLayoutPending$ui_release", "markMeasurePending", "markMeasurePending$ui_release", "markNodeAndSubtreeAsNotPlaced", "inLookahead", "markNodeAndSubtreeAsNotPlaced$ui_release", "markNodeAndSubtreeAsPlaced", "maxIntrinsicHeight", "width", "maxIntrinsicWidth", "height", "measure", "constraints", "measure-BRTryo0", "(J)Landroidx/compose/ui/layout/Placeable;", "minIntrinsicHeight", "minIntrinsicWidth", "notifyChildrenUsingLookaheadCoordinatesWhilePlacing", "onAttachedToNullParent", "onBeforeLayoutChildren", "onIntrinsicsQueried", "onNodeDetached", "onNodePlaced", "onNodePlaced$ui_release", "performMeasure", "performMeasure-BRTryo0$ui_release", "(J)V", "placeAt", "position", "zIndex", "layerBlock", "placeAt-f8xVGno", "(JFLkotlin/jvm/functions/Function1;)V", "layer", "(JFLandroidx/compose/ui/graphics/layer/GraphicsLayer;)V", "placeSelf", "placeSelf-MLgxB_4", "(JFLkotlin/jvm/functions/Function1;Landroidx/compose/ui/graphics/layer/GraphicsLayer;)V", "remeasure", "remeasure-BRTryo0", "(J)Z", "replace", "requestLayout", "requestMeasure", "trackLookaheadMeasurementByParent", "node", "updateParentData", "updatePlacedUnderMotionFrameOfReference", "newMFR", "PlacedState", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class LookaheadPassDelegate extends Placeable implements Measurable, AlignmentLinesOwner, MotionReferencePlacementDelegate {
    public static final int $stable = 8;
    private boolean duringAlignmentLinesQuery;
    private boolean isPlacedUnderMotionFrameOfReference;
    private GraphicsLayer lastExplicitLayer;
    private Function1<? super GraphicsLayerScope, Unit> lastLayerBlock;
    private float lastZIndex;
    private boolean layingOutChildren;
    private final LayoutNodeLayoutDelegate layoutNodeLayoutDelegate;
    private Constraints lookaheadConstraints;
    private boolean measuredOnce;
    private boolean onNodePlacedCalled;
    private boolean placedOnce;
    private boolean relayoutWithoutParentInProgress;
    private int previousPlaceOrder = Integer.MAX_VALUE;
    private int placeOrder = Integer.MAX_VALUE;
    private LayoutNode.UsageByParent measuredByParent = LayoutNode.UsageByParent.NotUsed;
    private long lastPosition = IntOffset.Companion.m7012getZeronOccac();
    private PlacedState _placedState = PlacedState.IsNotPlaced;
    private final AlignmentLines alignmentLines = new LookaheadAlignmentLines(this);
    private final MutableVector<LookaheadPassDelegate> _childDelegates = new MutableVector<>(new LookaheadPassDelegate[16], 0);
    private boolean childDelegatesDirty = true;
    private boolean parentDataDirty = true;
    private Object parentData = getMeasurePassDelegate$ui_release().getParentData();

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: LookaheadPassDelegate.kt */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0005\b\u0082\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004j\u0002\b\u0005¨\u0006\u0006"}, d2 = {"Landroidx/compose/ui/node/LookaheadPassDelegate$PlacedState;", "", "(Ljava/lang/String;I)V", "IsPlacedInLookahead", "IsPlacedInApproach", "IsNotPlaced", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public enum PlacedState {
        IsPlacedInLookahead,
        IsPlacedInApproach,
        IsNotPlaced;
        
        private static final /* synthetic */ EnumEntries $ENTRIES = EnumEntriesKt.enumEntries($VALUES);

        public static EnumEntries<PlacedState> getEntries() {
            return $ENTRIES;
        }
    }

    /* compiled from: LookaheadPassDelegate.kt */
    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;
        public static final /* synthetic */ int[] $EnumSwitchMapping$1;

        static {
            int[] iArr = new int[LayoutNode.LayoutState.values().length];
            try {
                iArr[LayoutNode.LayoutState.LookaheadMeasuring.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[LayoutNode.LayoutState.Measuring.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[LayoutNode.LayoutState.LayingOut.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[LayoutNode.LayoutState.LookaheadLayingOut.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            $EnumSwitchMapping$0 = iArr;
            int[] iArr2 = new int[LayoutNode.UsageByParent.values().length];
            try {
                iArr2[LayoutNode.UsageByParent.InMeasureBlock.ordinal()] = 1;
            } catch (NoSuchFieldError e5) {
            }
            try {
                iArr2[LayoutNode.UsageByParent.InLayoutBlock.ordinal()] = 2;
            } catch (NoSuchFieldError e6) {
            }
            $EnumSwitchMapping$1 = iArr2;
        }
    }

    public LookaheadPassDelegate(LayoutNodeLayoutDelegate layoutNodeLayoutDelegate) {
        this.layoutNodeLayoutDelegate = layoutNodeLayoutDelegate;
    }

    private final void setMeasurePending(boolean value) {
        this.layoutNodeLayoutDelegate.setLookaheadMeasurePending$ui_release(value);
    }

    private final boolean getMeasurePending() {
        return this.layoutNodeLayoutDelegate.getLookaheadMeasurePending$ui_release();
    }

    private final void setLayoutPending(boolean value) {
        this.layoutNodeLayoutDelegate.setLookaheadLayoutPending$ui_release(value);
    }

    private final boolean getLayoutPending() {
        return this.layoutNodeLayoutDelegate.getLookaheadLayoutPending$ui_release();
    }

    private final void setLayoutPendingForAlignment(boolean value) {
        this.layoutNodeLayoutDelegate.setLookaheadLayoutPendingForAlignment$ui_release(value);
    }

    private final boolean getLayoutPendingForAlignment() {
        return this.layoutNodeLayoutDelegate.getLookaheadLayoutPendingForAlignment$ui_release();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final LayoutNode getLayoutNode() {
        return this.layoutNodeLayoutDelegate.getLayoutNode$ui_release();
    }

    public final void markLayoutPending$ui_release() {
        setLayoutPending(true);
        setLayoutPendingForAlignment(true);
    }

    public final void markMeasurePending$ui_release() {
        setMeasurePending(true);
    }

    public final int getPlaceOrder$ui_release() {
        return this.placeOrder;
    }

    public final void setPlaceOrder$ui_release(int i) {
        this.placeOrder = i;
    }

    public final LayoutNode.UsageByParent getMeasuredByParent$ui_release() {
        return this.measuredByParent;
    }

    public final void setMeasuredByParent$ui_release(LayoutNode.UsageByParent usageByParent) {
        this.measuredByParent = usageByParent;
    }

    public final MeasurePassDelegate getMeasurePassDelegate$ui_release() {
        return this.layoutNodeLayoutDelegate.getMeasurePassDelegate$ui_release();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final NodeCoordinator getOuterCoordinator() {
        return this.layoutNodeLayoutDelegate.getOuterCoordinator();
    }

    private final void setLayoutState(LayoutNode.LayoutState value) {
        this.layoutNodeLayoutDelegate.setLayoutState$ui_release(value);
    }

    private final LayoutNode.LayoutState getLayoutState() {
        return this.layoutNodeLayoutDelegate.getLayoutState$ui_release();
    }

    public final boolean getPlacedOnce$ui_release() {
        return this.placedOnce;
    }

    public final void setPlacedOnce$ui_release(boolean z) {
        this.placedOnce = z;
    }

    /* renamed from: getLastConstraints-DWUhwKw  reason: not valid java name */
    public final Constraints m5842getLastConstraintsDWUhwKw() {
        return this.lookaheadConstraints;
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public boolean isPlaced() {
        return this._placedState != PlacedState.IsNotPlaced;
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public NodeCoordinator getInnerCoordinator() {
        return getLayoutNode().getInnerCoordinator$ui_release();
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public AlignmentLines getAlignmentLines() {
        return this.alignmentLines;
    }

    public final boolean getNeedsToBePlacedInApproach() {
        if (LayoutNodeLayoutDelegateKt.isOutMostLookaheadRoot(getLayoutNode())) {
            return true;
        }
        if (this._placedState == PlacedState.IsNotPlaced && !this.layoutNodeLayoutDelegate.getDetachedFromParentLookaheadPass$ui_release()) {
            this.layoutNodeLayoutDelegate.setDetachedFromParentLookaheadPlacement$ui_release(true);
        }
        return getDetachedFromParentLookaheadPlacement();
    }

    public final boolean getChildDelegatesDirty$ui_release() {
        return this.childDelegatesDirty;
    }

    public final void setChildDelegatesDirty$ui_release(boolean z) {
        this.childDelegatesDirty = z;
    }

    public final List<LookaheadPassDelegate> getChildDelegates$ui_release() {
        LayoutNode $this$updateChildMeasurables$iv;
        getLayoutNode().getChildren$ui_release();
        if (!this.childDelegatesDirty) {
            return this._childDelegates.asMutableList();
        }
        LayoutNode $this$updateChildMeasurables$iv2 = getLayoutNode();
        MutableVector destination$iv = this._childDelegates;
        MutableVector this_$iv$iv$iv = $this$updateChildMeasurables$iv2.get_children$ui_release();
        int i$iv$iv$iv = 0;
        Object[] content$iv$iv$iv = this_$iv$iv$iv.content;
        int size$iv$iv$iv = this_$iv$iv$iv.getSize();
        while (i$iv$iv$iv < size$iv$iv$iv) {
            LayoutNode layoutNode$iv = (LayoutNode) content$iv$iv$iv[i$iv$iv$iv];
            int i$iv = i$iv$iv$iv;
            if (destination$iv.getSize() <= i$iv) {
                $this$updateChildMeasurables$iv = $this$updateChildMeasurables$iv2;
                LookaheadPassDelegate lookaheadPassDelegate$ui_release = layoutNode$iv.getLayoutDelegate$ui_release().getLookaheadPassDelegate$ui_release();
                Intrinsics.checkNotNull(lookaheadPassDelegate$ui_release);
                destination$iv.add(lookaheadPassDelegate$ui_release);
            } else {
                $this$updateChildMeasurables$iv = $this$updateChildMeasurables$iv2;
                LookaheadPassDelegate lookaheadPassDelegate$ui_release2 = layoutNode$iv.getLayoutDelegate$ui_release().getLookaheadPassDelegate$ui_release();
                Intrinsics.checkNotNull(lookaheadPassDelegate$ui_release2);
                destination$iv.set(i$iv, lookaheadPassDelegate$ui_release2);
            }
            i$iv$iv$iv++;
            $this$updateChildMeasurables$iv2 = $this$updateChildMeasurables$iv;
        }
        destination$iv.removeRange($this$updateChildMeasurables$iv2.getChildren$ui_release().size(), destination$iv.getSize());
        this.childDelegatesDirty = false;
        return this._childDelegates.asMutableList();
    }

    public final boolean getLayingOutChildren() {
        return this.layingOutChildren;
    }

    private final void forEachChildDelegate(Function1<? super LookaheadPassDelegate, Unit> function1) {
        LayoutNode this_$iv = getLayoutNode();
        MutableVector this_$iv$iv = this_$iv.get_children$ui_release();
        Object[] content$iv$iv = this_$iv$iv.content;
        int size$iv$iv = this_$iv$iv.getSize();
        for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
            LayoutNode it = (LayoutNode) content$iv$iv[i$iv$iv];
            LookaheadPassDelegate lookaheadPassDelegate$ui_release = it.getLayoutDelegate$ui_release().getLookaheadPassDelegate$ui_release();
            Intrinsics.checkNotNull(lookaheadPassDelegate$ui_release);
            function1.invoke(lookaheadPassDelegate$ui_release);
        }
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public void layoutChildren() {
        this.layingOutChildren = true;
        getAlignmentLines().recalculateQueryOwner();
        if (getLayoutPending()) {
            onBeforeLayoutChildren();
        }
        final LookaheadDelegate lookaheadDelegate = getInnerCoordinator().getLookaheadDelegate();
        Intrinsics.checkNotNull(lookaheadDelegate);
        if (getLayoutPendingForAlignment() || (!this.duringAlignmentLinesQuery && !lookaheadDelegate.isPlacingForAlignment$ui_release() && getLayoutPending())) {
            setLayoutPending(false);
            LayoutNode.LayoutState oldLayoutState = getLayoutState();
            setLayoutState(LayoutNode.LayoutState.LookaheadLayingOut);
            Owner owner = LayoutNodeKt.requireOwner(getLayoutNode());
            this.layoutNodeLayoutDelegate.setLookaheadCoordinatesAccessedDuringPlacement(false);
            OwnerSnapshotObserver.observeLayoutSnapshotReads$ui_release$default(owner.getSnapshotObserver(), getLayoutNode(), false, new Function0<Unit>() { // from class: androidx.compose.ui.node.LookaheadPassDelegate$layoutChildren$1
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

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2() {
                    LayoutNode layoutNode;
                    LayoutNode layoutNode2;
                    LookaheadPassDelegate.this.clearPlaceOrder();
                    LookaheadPassDelegate.this.forEachChildAlignmentLinesOwner(new Function1<AlignmentLinesOwner, Unit>() { // from class: androidx.compose.ui.node.LookaheadPassDelegate$layoutChildren$1.1
                        @Override // kotlin.jvm.functions.Function1
                        public /* bridge */ /* synthetic */ Unit invoke(AlignmentLinesOwner alignmentLinesOwner) {
                            invoke2(alignmentLinesOwner);
                            return Unit.INSTANCE;
                        }

                        /* renamed from: invoke  reason: avoid collision after fix types in other method */
                        public final void invoke2(AlignmentLinesOwner child) {
                            child.getAlignmentLines().setUsedDuringParentLayout$ui_release(false);
                        }
                    });
                    LookaheadDelegate lookaheadDelegate2 = LookaheadPassDelegate.this.getInnerCoordinator().getLookaheadDelegate();
                    if (lookaheadDelegate2 != null) {
                        boolean forAlignment = lookaheadDelegate2.isPlacingForAlignment$ui_release();
                        layoutNode2 = LookaheadPassDelegate.this.getLayoutNode();
                        List $this$fastForEach$iv = layoutNode2.getChildren$ui_release();
                        int size = $this$fastForEach$iv.size();
                        for (int index$iv = 0; index$iv < size; index$iv++) {
                            Object item$iv = $this$fastForEach$iv.get(index$iv);
                            LayoutNode it = (LayoutNode) item$iv;
                            LookaheadDelegate lookaheadDelegate3 = it.getOuterCoordinator$ui_release().getLookaheadDelegate();
                            if (lookaheadDelegate3 != null) {
                                lookaheadDelegate3.setPlacingForAlignment$ui_release(forAlignment);
                            }
                        }
                    }
                    lookaheadDelegate.getMeasureResult$ui_release().placeChildren();
                    LookaheadDelegate lookaheadDelegate4 = LookaheadPassDelegate.this.getInnerCoordinator().getLookaheadDelegate();
                    if (lookaheadDelegate4 != null) {
                        lookaheadDelegate4.isPlacingForAlignment$ui_release();
                        layoutNode = LookaheadPassDelegate.this.getLayoutNode();
                        List $this$fastForEach$iv2 = layoutNode.getChildren$ui_release();
                        int size2 = $this$fastForEach$iv2.size();
                        for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
                            Object item$iv2 = $this$fastForEach$iv2.get(index$iv2);
                            LayoutNode it2 = (LayoutNode) item$iv2;
                            LookaheadDelegate lookaheadDelegate5 = it2.getOuterCoordinator$ui_release().getLookaheadDelegate();
                            if (lookaheadDelegate5 != null) {
                                lookaheadDelegate5.setPlacingForAlignment$ui_release(false);
                            }
                        }
                    }
                    LookaheadPassDelegate.this.checkChildrenPlaceOrderForUpdates();
                    LookaheadPassDelegate.this.forEachChildAlignmentLinesOwner(new Function1<AlignmentLinesOwner, Unit>() { // from class: androidx.compose.ui.node.LookaheadPassDelegate$layoutChildren$1.4
                        @Override // kotlin.jvm.functions.Function1
                        public /* bridge */ /* synthetic */ Unit invoke(AlignmentLinesOwner alignmentLinesOwner) {
                            invoke2(alignmentLinesOwner);
                            return Unit.INSTANCE;
                        }

                        /* renamed from: invoke  reason: avoid collision after fix types in other method */
                        public final void invoke2(AlignmentLinesOwner child) {
                            child.getAlignmentLines().setPreviousUsedDuringParentLayout$ui_release(child.getAlignmentLines().getUsedDuringParentLayout$ui_release());
                        }
                    });
                }
            }, 2, null);
            setLayoutState(oldLayoutState);
            if (this.layoutNodeLayoutDelegate.getLookaheadCoordinatesAccessedDuringPlacement() && lookaheadDelegate.isPlacingForAlignment$ui_release()) {
                requestLayout();
            }
            setLayoutPendingForAlignment(false);
        }
        if (getAlignmentLines().getUsedDuringParentLayout$ui_release()) {
            getAlignmentLines().setPreviousUsedDuringParentLayout$ui_release(true);
        }
        if (getAlignmentLines().getDirty$ui_release() && getAlignmentLines().getRequired$ui_release()) {
            getAlignmentLines().recalculate();
        }
        this.layingOutChildren = false;
    }

    private final boolean getDetachedFromParentLookaheadPlacement() {
        return this.layoutNodeLayoutDelegate.getDetachedFromParentLookaheadPlacement$ui_release();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void checkChildrenPlaceOrderForUpdates() {
        LayoutNode this_$iv$iv = getLayoutNode();
        MutableVector this_$iv$iv$iv = this_$iv$iv.get_children$ui_release();
        Object[] content$iv$iv$iv = this_$iv$iv$iv.content;
        int size$iv$iv$iv = this_$iv$iv$iv.getSize();
        for (int i$iv$iv$iv = 0; i$iv$iv$iv < size$iv$iv$iv; i$iv$iv$iv++) {
            LayoutNode it$iv = (LayoutNode) content$iv$iv$iv[i$iv$iv$iv];
            LookaheadPassDelegate child = it$iv.getLayoutDelegate$ui_release().getLookaheadPassDelegate$ui_release();
            Intrinsics.checkNotNull(child);
            if (child.previousPlaceOrder != child.placeOrder && child.placeOrder == Integer.MAX_VALUE) {
                child.markNodeAndSubtreeAsNotPlaced$ui_release(true);
            }
        }
    }

    public final void markNodeAndSubtreeAsNotPlaced$ui_release(boolean inLookahead) {
        if (!inLookahead || !getDetachedFromParentLookaheadPlacement()) {
            if (!inLookahead && !getDetachedFromParentLookaheadPlacement()) {
                return;
            }
            this._placedState = PlacedState.IsNotPlaced;
            LayoutNode this_$iv$iv = getLayoutNode();
            MutableVector this_$iv$iv$iv = this_$iv$iv.get_children$ui_release();
            Object[] content$iv$iv$iv = this_$iv$iv$iv.content;
            int size$iv$iv$iv = this_$iv$iv$iv.getSize();
            for (int i$iv$iv$iv = 0; i$iv$iv$iv < size$iv$iv$iv; i$iv$iv$iv++) {
                LayoutNode it$iv = (LayoutNode) content$iv$iv$iv[i$iv$iv$iv];
                LookaheadPassDelegate it = it$iv.getLayoutDelegate$ui_release().getLookaheadPassDelegate$ui_release();
                Intrinsics.checkNotNull(it);
                it.markNodeAndSubtreeAsNotPlaced$ui_release(true);
            }
        }
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public Map<AlignmentLine, Integer> calculateAlignmentLines() {
        if (!this.duringAlignmentLinesQuery) {
            if (getLayoutState() == LayoutNode.LayoutState.LookaheadMeasuring) {
                getAlignmentLines().setUsedByModifierMeasurement$ui_release(true);
                if (getAlignmentLines().getDirty$ui_release()) {
                    this.layoutNodeLayoutDelegate.markLookaheadLayoutPending$ui_release();
                }
            } else {
                getAlignmentLines().setUsedByModifierLayout$ui_release(true);
            }
        }
        LookaheadDelegate lookaheadDelegate = getInnerCoordinator().getLookaheadDelegate();
        if (lookaheadDelegate != null) {
            lookaheadDelegate.setPlacingForAlignment$ui_release(true);
        }
        layoutChildren();
        LookaheadDelegate lookaheadDelegate2 = getInnerCoordinator().getLookaheadDelegate();
        if (lookaheadDelegate2 != null) {
            lookaheadDelegate2.setPlacingForAlignment$ui_release(false);
        }
        return getAlignmentLines().getLastCalculation();
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public AlignmentLinesOwner getParentAlignmentLinesOwner() {
        LayoutNodeLayoutDelegate layoutDelegate$ui_release;
        LayoutNode parent$ui_release = getLayoutNode().getParent$ui_release();
        if (parent$ui_release == null || (layoutDelegate$ui_release = parent$ui_release.getLayoutDelegate$ui_release()) == null) {
            return null;
        }
        return layoutDelegate$ui_release.getLookaheadAlignmentLinesOwner$ui_release();
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public void forEachChildAlignmentLinesOwner(Function1<? super AlignmentLinesOwner, Unit> function1) {
        LayoutNode this_$iv = getLayoutNode();
        MutableVector this_$iv$iv = this_$iv.get_children$ui_release();
        Object[] content$iv$iv = this_$iv$iv.content;
        int size$iv$iv = this_$iv$iv.getSize();
        for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
            LayoutNode it = (LayoutNode) content$iv$iv[i$iv$iv];
            AlignmentLinesOwner lookaheadAlignmentLinesOwner$ui_release = it.getLayoutDelegate$ui_release().getLookaheadAlignmentLinesOwner$ui_release();
            Intrinsics.checkNotNull(lookaheadAlignmentLinesOwner$ui_release);
            function1.invoke(lookaheadAlignmentLinesOwner$ui_release);
        }
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public void requestLayout() {
        LayoutNode.requestLookaheadRelayout$ui_release$default(getLayoutNode(), false, 1, null);
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public void requestMeasure() {
        LayoutNode.requestLookaheadRemeasure$ui_release$default(getLayoutNode(), false, false, false, 7, null);
    }

    public final void notifyChildrenUsingLookaheadCoordinatesWhilePlacing() {
        if (this.layoutNodeLayoutDelegate.getChildrenAccessingLookaheadCoordinatesDuringPlacement() > 0) {
            LayoutNode this_$iv = getLayoutNode();
            MutableVector this_$iv$iv = this_$iv.get_children$ui_release();
            Object[] content$iv$iv = this_$iv$iv.content;
            int size$iv$iv = this_$iv$iv.getSize();
            for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
                LayoutNode child = (LayoutNode) content$iv$iv[i$iv$iv];
                LayoutNodeLayoutDelegate childLayoutDelegate = child.getLayoutDelegate$ui_release();
                boolean accessed = childLayoutDelegate.getLookaheadCoordinatesAccessedDuringPlacement() || childLayoutDelegate.getLookaheadCoordinatesAccessedDuringModifierPlacement();
                if (accessed && !childLayoutDelegate.getLookaheadLayoutPending$ui_release()) {
                    LayoutNode.requestLookaheadRelayout$ui_release$default(child, false, 1, null);
                }
                LookaheadPassDelegate lookaheadPassDelegate$ui_release = childLayoutDelegate.getLookaheadPassDelegate$ui_release();
                if (lookaheadPassDelegate$ui_release != null) {
                    lookaheadPassDelegate$ui_release.notifyChildrenUsingLookaheadCoordinatesWhilePlacing();
                }
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0026, code lost:
        if ((r0 != null ? r0.getLayoutState$ui_release() : null) == androidx.compose.ui.node.LayoutNode.LayoutState.LookaheadLayingOut) goto L17;
     */
    @Override // androidx.compose.ui.layout.Measurable
    /* renamed from: measure-BRTryo0 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public androidx.compose.ui.layout.Placeable mo5637measureBRTryo0(long r4) {
        /*
            r3 = this;
            androidx.compose.ui.node.LayoutNode r0 = r3.getLayoutNode()
            androidx.compose.ui.node.LayoutNode r0 = r0.getParent$ui_release()
            r1 = 0
            if (r0 == 0) goto L11
            androidx.compose.ui.node.LayoutNode$LayoutState r0 = r0.getLayoutState$ui_release()
            goto L12
        L11:
            r0 = r1
        L12:
            androidx.compose.ui.node.LayoutNode$LayoutState r2 = androidx.compose.ui.node.LayoutNode.LayoutState.LookaheadMeasuring
            if (r0 == r2) goto L28
            androidx.compose.ui.node.LayoutNode r0 = r3.getLayoutNode()
            androidx.compose.ui.node.LayoutNode r0 = r0.getParent$ui_release()
            if (r0 == 0) goto L24
            androidx.compose.ui.node.LayoutNode$LayoutState r1 = r0.getLayoutState$ui_release()
        L24:
            androidx.compose.ui.node.LayoutNode$LayoutState r0 = androidx.compose.ui.node.LayoutNode.LayoutState.LookaheadLayingOut
            if (r1 != r0) goto L2e
        L28:
            androidx.compose.ui.node.LayoutNodeLayoutDelegate r0 = r3.layoutNodeLayoutDelegate
            r1 = 0
            r0.setDetachedFromParentLookaheadPass$ui_release(r1)
        L2e:
            androidx.compose.ui.node.LayoutNode r0 = r3.getLayoutNode()
            r3.trackLookaheadMeasurementByParent(r0)
            androidx.compose.ui.node.LayoutNode r0 = r3.getLayoutNode()
            androidx.compose.ui.node.LayoutNode$UsageByParent r0 = r0.getIntrinsicsUsageByParent$ui_release()
            androidx.compose.ui.node.LayoutNode$UsageByParent r1 = androidx.compose.ui.node.LayoutNode.UsageByParent.NotUsed
            if (r0 != r1) goto L48
            androidx.compose.ui.node.LayoutNode r0 = r3.getLayoutNode()
            r0.clearSubtreeIntrinsicsUsage$ui_release()
        L48:
            r3.m5844remeasureBRTryo0(r4)
            r0 = r3
            androidx.compose.ui.layout.Placeable r0 = (androidx.compose.ui.layout.Placeable) r0
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.node.LookaheadPassDelegate.mo5637measureBRTryo0(long):androidx.compose.ui.layout.Placeable");
    }

    private final void trackLookaheadMeasurementByParent(LayoutNode node) {
        LayoutNode.UsageByParent usageByParent;
        LayoutNode parent = node.getParent$ui_release();
        if (parent != null) {
            boolean value$iv = this.measuredByParent == LayoutNode.UsageByParent.NotUsed || node.getCanMultiMeasure$ui_release();
            if (!value$iv) {
                InlineClassHelperKt.throwIllegalStateException(LayoutNodeLayoutDelegateKt.MeasuredTwiceErrorMessage);
            }
            switch (WhenMappings.$EnumSwitchMapping$0[parent.getLayoutState$ui_release().ordinal()]) {
                case 1:
                case 2:
                    usageByParent = LayoutNode.UsageByParent.InMeasureBlock;
                    break;
                case 3:
                case 4:
                    usageByParent = LayoutNode.UsageByParent.InLayoutBlock;
                    break;
                default:
                    throw new IllegalStateException("Measurable could be only measured from the parent's measure or layout block. Parents state is " + parent.getLayoutState$ui_release());
            }
            this.measuredByParent = usageByParent;
            return;
        }
        this.measuredByParent = LayoutNode.UsageByParent.NotUsed;
    }

    @Override // androidx.compose.ui.layout.Measured, androidx.compose.ui.layout.IntrinsicMeasurable
    public Object getParentData() {
        return this.parentData;
    }

    /* renamed from: performMeasure-BRTryo0$ui_release  reason: not valid java name */
    public final void m5843performMeasureBRTryo0$ui_release(final long constraints) {
        setLayoutState(LayoutNode.LayoutState.LookaheadMeasuring);
        setMeasurePending(false);
        OwnerSnapshotObserver.observeMeasureSnapshotReads$ui_release$default(LayoutNodeKt.requireOwner(getLayoutNode()).getSnapshotObserver(), getLayoutNode(), false, new Function0<Unit>() { // from class: androidx.compose.ui.node.LookaheadPassDelegate$performMeasure$1
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

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2() {
                NodeCoordinator outerCoordinator;
                outerCoordinator = LookaheadPassDelegate.this.getOuterCoordinator();
                LookaheadDelegate lookaheadDelegate = outerCoordinator.getLookaheadDelegate();
                Intrinsics.checkNotNull(lookaheadDelegate);
                lookaheadDelegate.mo5637measureBRTryo0(constraints);
            }
        }, 2, null);
        markLayoutPending$ui_release();
        if (LayoutNodeLayoutDelegateKt.isOutMostLookaheadRoot(getLayoutNode())) {
            getMeasurePassDelegate$ui_release().markLayoutPending();
        } else {
            getMeasurePassDelegate$ui_release().markMeasurePending$ui_release();
        }
        setLayoutState(LayoutNode.LayoutState.Idle);
    }

    /* renamed from: remeasure-BRTryo0  reason: not valid java name */
    public final boolean m5844remeasureBRTryo0(long constraints) {
        char c;
        long lastLookaheadSize;
        boolean value$iv = !getLayoutNode().isDeactivated();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("measure is called on a deactivated node");
        }
        LayoutNode parent = getLayoutNode().getParent$ui_release();
        getLayoutNode().setCanMultiMeasure$ui_release(getLayoutNode().getCanMultiMeasure$ui_release() || (parent != null && parent.getCanMultiMeasure$ui_release()));
        if (!getLayoutNode().getLookaheadMeasurePending$ui_release()) {
            Constraints constraints2 = this.lookaheadConstraints;
            if (constraints2 == null ? false : Constraints.m6819equalsimpl0(constraints2.m6832unboximpl(), constraints)) {
                Owner owner$ui_release = getLayoutNode().getOwner$ui_release();
                if (owner$ui_release != null) {
                    owner$ui_release.forceMeasureTheSubtree(getLayoutNode(), true);
                }
                getLayoutNode().resetSubtreeIntrinsicsUsage$ui_release();
                return false;
            }
        }
        this.lookaheadConstraints = Constraints.m6813boximpl(constraints);
        m5700setMeasurementConstraintsBRTryo0(constraints);
        getAlignmentLines().setUsedByModifierMeasurement$ui_release(false);
        forEachChildAlignmentLinesOwner(new Function1<AlignmentLinesOwner, Unit>() { // from class: androidx.compose.ui.node.LookaheadPassDelegate$remeasure$2
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(AlignmentLinesOwner alignmentLinesOwner) {
                invoke2(alignmentLinesOwner);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(AlignmentLinesOwner it) {
                it.getAlignmentLines().setUsedDuringParentMeasurement$ui_release(false);
            }
        });
        if (this.measuredOnce) {
            lastLookaheadSize = m5696getMeasuredSizeYbymL2g();
            c = ' ';
        } else {
            c = ' ';
            lastLookaheadSize = IntSize.m7039constructorimpl((Integer.MIN_VALUE & 4294967295L) | (Integer.MIN_VALUE << 32));
        }
        this.measuredOnce = true;
        LookaheadDelegate lookaheadDelegate = getOuterCoordinator().getLookaheadDelegate();
        boolean value$iv2 = lookaheadDelegate != null;
        if (!value$iv2) {
            InlineClassHelperKt.throwIllegalStateException("Lookahead result from lookaheadRemeasure cannot be null");
        }
        this.layoutNodeLayoutDelegate.m5831performLookaheadMeasureBRTryo0$ui_release(constraints);
        int width$iv = lookaheadDelegate.getWidth();
        int height$iv = lookaheadDelegate.getHeight();
        m5699setMeasuredSizeozmzZPI(IntSize.m7039constructorimpl((width$iv << c) | (height$iv & 4294967295L)));
        long value$iv$iv = lastLookaheadSize;
        if (((int) (value$iv$iv >> c)) == lookaheadDelegate.getWidth()) {
            long value$iv$iv2 = lastLookaheadSize;
            if (((int) (value$iv$iv2 & 4294967295L)) == lookaheadDelegate.getHeight()) {
                return false;
            }
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // androidx.compose.ui.layout.Placeable
    /* renamed from: placeAt-f8xVGno */
    public void mo5638placeAtf8xVGno(long position, float zIndex, Function1<? super GraphicsLayerScope, Unit> function1) {
        m5841placeSelfMLgxB_4(position, zIndex, function1, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // androidx.compose.ui.layout.Placeable
    /* renamed from: placeAt-f8xVGno */
    public void mo5698placeAtf8xVGno(long position, float zIndex, GraphicsLayer layer) {
        m5841placeSelfMLgxB_4(position, zIndex, null, layer);
    }

    @Override // androidx.compose.ui.node.MotionReferencePlacementDelegate
    public boolean isPlacedUnderMotionFrameOfReference() {
        return this.isPlacedUnderMotionFrameOfReference;
    }

    public void setPlacedUnderMotionFrameOfReference(boolean z) {
        this.isPlacedUnderMotionFrameOfReference = z;
    }

    @Override // androidx.compose.ui.node.MotionReferencePlacementDelegate
    public void updatePlacedUnderMotionFrameOfReference(boolean newMFR) {
        LookaheadDelegate lookaheadDelegate;
        LookaheadDelegate lookaheadDelegate2 = getOuterCoordinator().getLookaheadDelegate();
        Boolean old = lookaheadDelegate2 != null ? Boolean.valueOf(lookaheadDelegate2.isPlacedUnderMotionFrameOfReference()) : null;
        if (!Intrinsics.areEqual(Boolean.valueOf(newMFR), old) && (lookaheadDelegate = getOuterCoordinator().getLookaheadDelegate()) != null) {
            lookaheadDelegate.setPlacedUnderMotionFrameOfReference(newMFR);
        }
        setPlacedUnderMotionFrameOfReference(newMFR);
    }

    /* renamed from: placeSelf-MLgxB_4  reason: not valid java name */
    private final void m5841placeSelfMLgxB_4(final long position, float zIndex, Function1<? super GraphicsLayerScope, Unit> function1, GraphicsLayer layer) {
        LayoutNode parent$ui_release = getLayoutNode().getParent$ui_release();
        if ((parent$ui_release != null ? parent$ui_release.getLayoutState$ui_release() : null) == LayoutNode.LayoutState.LookaheadLayingOut) {
            this.layoutNodeLayoutDelegate.setDetachedFromParentLookaheadPlacement$ui_release(false);
        }
        boolean value$iv = !getLayoutNode().isDeactivated();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("place is called on a deactivated node");
        }
        setLayoutState(LayoutNode.LayoutState.LookaheadLayingOut);
        this.placedOnce = true;
        this.onNodePlacedCalled = false;
        if (!IntOffset.m7000equalsimpl0(position, this.lastPosition)) {
            if (this.layoutNodeLayoutDelegate.getLookaheadCoordinatesAccessedDuringModifierPlacement() || this.layoutNodeLayoutDelegate.getLookaheadCoordinatesAccessedDuringPlacement()) {
                setLayoutPending(true);
            }
            notifyChildrenUsingLookaheadCoordinatesWhilePlacing();
        }
        final Owner owner = LayoutNodeKt.requireOwner(getLayoutNode());
        if (!getLayoutPending() && isPlaced()) {
            LookaheadDelegate lookaheadDelegate = getOuterCoordinator().getLookaheadDelegate();
            Intrinsics.checkNotNull(lookaheadDelegate);
            lookaheadDelegate.m5838placeSelfApparentToRealOffsetgyyYBs$ui_release(position);
            onNodePlaced$ui_release();
        } else {
            this.layoutNodeLayoutDelegate.setLookaheadCoordinatesAccessedDuringModifierPlacement(false);
            getAlignmentLines().setUsedByModifierLayout$ui_release(false);
            OwnerSnapshotObserver.observeLayoutModifierSnapshotReads$ui_release$default(owner.getSnapshotObserver(), getLayoutNode(), false, new Function0<Unit>() { // from class: androidx.compose.ui.node.LookaheadPassDelegate$placeSelf$2
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

                /* JADX WARN: Removed duplicated region for block: B:10:0x0022  */
                /* JADX WARN: Removed duplicated region for block: B:15:0x0037  */
                /* JADX WARN: Removed duplicated region for block: B:19:0x0047  */
                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct add '--show-bad-code' argument
                */
                public final void invoke2() {
                    /*
                        r11 = this;
                        androidx.compose.ui.node.LookaheadPassDelegate r0 = androidx.compose.ui.node.LookaheadPassDelegate.this
                        androidx.compose.ui.node.LayoutNode r0 = androidx.compose.ui.node.LookaheadPassDelegate.access$getLayoutNode(r0)
                        boolean r0 = androidx.compose.ui.node.LayoutNodeLayoutDelegateKt.isOutMostLookaheadRoot(r0)
                        if (r0 != 0) goto L1a
                        androidx.compose.ui.node.LookaheadPassDelegate r0 = androidx.compose.ui.node.LookaheadPassDelegate.this
                        androidx.compose.ui.node.LayoutNodeLayoutDelegate r0 = androidx.compose.ui.node.LookaheadPassDelegate.access$getLayoutNodeLayoutDelegate$p(r0)
                        boolean r0 = r0.getDetachedFromParentLookaheadPlacement$ui_release()
                        if (r0 != 0) goto L1a
                        r0 = 1
                        goto L1b
                    L1a:
                        r0 = 0
                    L1b:
                        androidx.compose.ui.node.LookaheadPassDelegate r1 = androidx.compose.ui.node.LookaheadPassDelegate.this
                        r2 = 0
                        if (r0 == 0) goto L37
                        androidx.compose.ui.node.NodeCoordinator r1 = androidx.compose.ui.node.LookaheadPassDelegate.access$getOuterCoordinator(r1)
                        androidx.compose.ui.node.NodeCoordinator r1 = r1.getWrappedBy$ui_release()
                        if (r1 == 0) goto L45
                        androidx.compose.ui.node.LookaheadDelegate r1 = r1.getLookaheadDelegate()
                        if (r1 == 0) goto L45
                        androidx.compose.ui.layout.Placeable$PlacementScope r2 = r1.getPlacementScope()
                        goto L45
                    L37:
                        androidx.compose.ui.node.NodeCoordinator r1 = androidx.compose.ui.node.LookaheadPassDelegate.access$getOuterCoordinator(r1)
                        androidx.compose.ui.node.NodeCoordinator r1 = r1.getWrappedBy$ui_release()
                        if (r1 == 0) goto L45
                        androidx.compose.ui.layout.Placeable$PlacementScope r2 = r1.getPlacementScope()
                    L45:
                        if (r2 != 0) goto L4d
                        androidx.compose.ui.node.Owner r1 = r3
                        androidx.compose.ui.layout.Placeable$PlacementScope r2 = r1.getPlacementScope()
                    L4d:
                        androidx.compose.ui.node.LookaheadPassDelegate r1 = androidx.compose.ui.node.LookaheadPassDelegate.this
                        long r5 = r4
                        r3 = r2
                        r10 = 0
                        androidx.compose.ui.node.NodeCoordinator r1 = androidx.compose.ui.node.LookaheadPassDelegate.access$getOuterCoordinator(r1)
                        androidx.compose.ui.node.LookaheadDelegate r1 = r1.getLookaheadDelegate()
                        kotlin.jvm.internal.Intrinsics.checkNotNull(r1)
                        r4 = r1
                        androidx.compose.ui.layout.Placeable r4 = (androidx.compose.ui.layout.Placeable) r4
                        r8 = 2
                        r9 = 0
                        r7 = 0
                        androidx.compose.ui.layout.Placeable.PlacementScope.m5701place70tqf50$default(r3, r4, r5, r7, r8, r9)
                        return
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.node.LookaheadPassDelegate$placeSelf$2.invoke2():void");
                }
            }, 2, null);
        }
        this.lastPosition = position;
        this.lastZIndex = zIndex;
        this.lastLayerBlock = function1;
        this.lastExplicitLayer = layer;
        setLayoutState(LayoutNode.LayoutState.Idle);
    }

    @Override // androidx.compose.ui.layout.Placeable, androidx.compose.ui.layout.Measured
    public int getMeasuredWidth() {
        LookaheadDelegate lookaheadDelegate = getOuterCoordinator().getLookaheadDelegate();
        Intrinsics.checkNotNull(lookaheadDelegate);
        return lookaheadDelegate.getMeasuredWidth();
    }

    @Override // androidx.compose.ui.layout.Placeable, androidx.compose.ui.layout.Measured
    public int getMeasuredHeight() {
        LookaheadDelegate lookaheadDelegate = getOuterCoordinator().getLookaheadDelegate();
        Intrinsics.checkNotNull(lookaheadDelegate);
        return lookaheadDelegate.getMeasuredHeight();
    }

    @Override // androidx.compose.ui.layout.Measured
    public int get(AlignmentLine alignmentLine) {
        LayoutNode parent$ui_release = getLayoutNode().getParent$ui_release();
        if ((parent$ui_release != null ? parent$ui_release.getLayoutState$ui_release() : null) == LayoutNode.LayoutState.LookaheadMeasuring) {
            getAlignmentLines().setUsedDuringParentMeasurement$ui_release(true);
        } else {
            LayoutNode parent$ui_release2 = getLayoutNode().getParent$ui_release();
            if ((parent$ui_release2 != null ? parent$ui_release2.getLayoutState$ui_release() : null) == LayoutNode.LayoutState.LookaheadLayingOut) {
                getAlignmentLines().setUsedDuringParentLayout$ui_release(true);
            }
        }
        this.duringAlignmentLinesQuery = true;
        LookaheadDelegate lookaheadDelegate = getOuterCoordinator().getLookaheadDelegate();
        Intrinsics.checkNotNull(lookaheadDelegate);
        int result = lookaheadDelegate.get(alignmentLine);
        this.duringAlignmentLinesQuery = false;
        return result;
    }

    @Override // androidx.compose.ui.layout.IntrinsicMeasurable
    public int minIntrinsicWidth(int height) {
        onIntrinsicsQueried();
        LookaheadDelegate lookaheadDelegate = getOuterCoordinator().getLookaheadDelegate();
        Intrinsics.checkNotNull(lookaheadDelegate);
        return lookaheadDelegate.minIntrinsicWidth(height);
    }

    @Override // androidx.compose.ui.layout.IntrinsicMeasurable
    public int maxIntrinsicWidth(int height) {
        onIntrinsicsQueried();
        LookaheadDelegate lookaheadDelegate = getOuterCoordinator().getLookaheadDelegate();
        Intrinsics.checkNotNull(lookaheadDelegate);
        return lookaheadDelegate.maxIntrinsicWidth(height);
    }

    @Override // androidx.compose.ui.layout.IntrinsicMeasurable
    public int minIntrinsicHeight(int width) {
        onIntrinsicsQueried();
        LookaheadDelegate lookaheadDelegate = getOuterCoordinator().getLookaheadDelegate();
        Intrinsics.checkNotNull(lookaheadDelegate);
        return lookaheadDelegate.minIntrinsicHeight(width);
    }

    @Override // androidx.compose.ui.layout.IntrinsicMeasurable
    public int maxIntrinsicHeight(int width) {
        onIntrinsicsQueried();
        LookaheadDelegate lookaheadDelegate = getOuterCoordinator().getLookaheadDelegate();
        Intrinsics.checkNotNull(lookaheadDelegate);
        return lookaheadDelegate.maxIntrinsicHeight(width);
    }

    private final void onIntrinsicsQueried() {
        LayoutNode.UsageByParent usageByParent;
        LayoutNode.requestLookaheadRemeasure$ui_release$default(getLayoutNode(), false, false, false, 7, null);
        LayoutNode parent = getLayoutNode().getParent$ui_release();
        if (parent != null && getLayoutNode().getIntrinsicsUsageByParent$ui_release() == LayoutNode.UsageByParent.NotUsed) {
            LayoutNode layoutNode = getLayoutNode();
            switch (WhenMappings.$EnumSwitchMapping$0[parent.getLayoutState$ui_release().ordinal()]) {
                case 2:
                    usageByParent = LayoutNode.UsageByParent.InMeasureBlock;
                    break;
                case 3:
                    usageByParent = LayoutNode.UsageByParent.InLayoutBlock;
                    break;
                default:
                    usageByParent = parent.getIntrinsicsUsageByParent$ui_release();
                    break;
            }
            layoutNode.setIntrinsicsUsageByParent$ui_release(usageByParent);
        }
    }

    public final void invalidateIntrinsicsParent(boolean forceRequest) {
        LayoutNode intrinsicsUsingParent;
        LayoutNode parent = getLayoutNode().getParent$ui_release();
        LayoutNode.UsageByParent intrinsicsUsageByParent = getLayoutNode().getIntrinsicsUsageByParent$ui_release();
        if (parent != null && intrinsicsUsageByParent != LayoutNode.UsageByParent.NotUsed) {
            LayoutNode layoutNode = parent;
            while (true) {
                intrinsicsUsingParent = layoutNode;
                if (intrinsicsUsingParent.getIntrinsicsUsageByParent$ui_release() != intrinsicsUsageByParent || (layoutNode = intrinsicsUsingParent.getParent$ui_release()) == null) {
                    break;
                }
            }
            switch (WhenMappings.$EnumSwitchMapping$1[intrinsicsUsageByParent.ordinal()]) {
                case 1:
                    if (intrinsicsUsingParent.getLookaheadRoot$ui_release() != null) {
                        LayoutNode.requestLookaheadRemeasure$ui_release$default(intrinsicsUsingParent, forceRequest, false, false, 6, null);
                        return;
                    } else {
                        LayoutNode.requestRemeasure$ui_release$default(intrinsicsUsingParent, forceRequest, false, false, 6, null);
                        return;
                    }
                case 2:
                    if (intrinsicsUsingParent.getLookaheadRoot$ui_release() != null) {
                        intrinsicsUsingParent.requestLookaheadRelayout$ui_release(forceRequest);
                        return;
                    } else {
                        intrinsicsUsingParent.requestRelayout$ui_release(forceRequest);
                        return;
                    }
                default:
                    throw new IllegalStateException("Intrinsics isn't used by the parent".toString());
            }
        }
    }

    public final void invalidateParentData() {
        this.parentDataDirty = true;
    }

    public final boolean updateParentData() {
        if (getParentData() == null) {
            LookaheadDelegate lookaheadDelegate = getOuterCoordinator().getLookaheadDelegate();
            Intrinsics.checkNotNull(lookaheadDelegate);
            if (lookaheadDelegate.getParentData() == null) {
                return false;
            }
        }
        if (this.parentDataDirty) {
            this.parentDataDirty = false;
            LookaheadDelegate lookaheadDelegate2 = getOuterCoordinator().getLookaheadDelegate();
            Intrinsics.checkNotNull(lookaheadDelegate2);
            this.parentData = lookaheadDelegate2.getParentData();
            return true;
        }
        return false;
    }

    public final void onNodePlaced$ui_release() {
        this.onNodePlacedCalled = true;
        LayoutNode parent = getLayoutNode().getParent$ui_release();
        if ((this._placedState != PlacedState.IsPlacedInLookahead && !getDetachedFromParentLookaheadPlacement()) || (this._placedState != PlacedState.IsPlacedInApproach && getDetachedFromParentLookaheadPlacement())) {
            markNodeAndSubtreeAsPlaced();
            if (this.relayoutWithoutParentInProgress && parent != null) {
                LayoutNode.requestLookaheadRelayout$ui_release$default(parent, false, 1, null);
            }
        }
        if (parent != null) {
            if (!this.relayoutWithoutParentInProgress && (parent.getLayoutState$ui_release() == LayoutNode.LayoutState.LayingOut || parent.getLayoutState$ui_release() == LayoutNode.LayoutState.LookaheadLayingOut)) {
                boolean value$iv = this.placeOrder == Integer.MAX_VALUE;
                if (!value$iv) {
                    InlineClassHelperKt.throwIllegalStateException("Place was called on a node which was placed already");
                }
                this.placeOrder = parent.getLayoutDelegate$ui_release().getNextChildLookaheadPlaceOrder$ui_release();
                LayoutNodeLayoutDelegate layoutDelegate$ui_release = parent.getLayoutDelegate$ui_release();
                layoutDelegate$ui_release.setNextChildLookaheadPlaceOrder$ui_release(layoutDelegate$ui_release.getNextChildLookaheadPlaceOrder$ui_release() + 1);
            }
        } else {
            this.placeOrder = 0;
        }
        layoutChildren();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void clearPlaceOrder() {
        this.layoutNodeLayoutDelegate.setNextChildLookaheadPlaceOrder$ui_release(0);
        LayoutNode this_$iv$iv = getLayoutNode();
        MutableVector this_$iv$iv$iv = this_$iv$iv.get_children$ui_release();
        Object[] content$iv$iv$iv = this_$iv$iv$iv.content;
        int size$iv$iv$iv = this_$iv$iv$iv.getSize();
        for (int i$iv$iv$iv = 0; i$iv$iv$iv < size$iv$iv$iv; i$iv$iv$iv++) {
            LayoutNode it$iv = (LayoutNode) content$iv$iv$iv[i$iv$iv$iv];
            LookaheadPassDelegate child = it$iv.getLayoutDelegate$ui_release().getLookaheadPassDelegate$ui_release();
            Intrinsics.checkNotNull(child);
            child.previousPlaceOrder = child.placeOrder;
            child.placeOrder = Integer.MAX_VALUE;
            if (child.measuredByParent == LayoutNode.UsageByParent.InLayoutBlock) {
                child.measuredByParent = LayoutNode.UsageByParent.NotUsed;
            }
        }
    }

    private final void markNodeAndSubtreeAsPlaced() {
        PlacedState prevPlacedState = this._placedState;
        if (getDetachedFromParentLookaheadPlacement()) {
            this._placedState = PlacedState.IsPlacedInApproach;
        } else {
            this._placedState = PlacedState.IsPlacedInLookahead;
        }
        if (prevPlacedState != PlacedState.IsPlacedInLookahead && this.layoutNodeLayoutDelegate.getLookaheadMeasurePending$ui_release()) {
            LayoutNode.requestLookaheadRemeasure$ui_release$default(getLayoutNode(), true, false, false, 6, null);
        }
        LayoutNode this_$iv = getLayoutNode();
        MutableVector this_$iv$iv = this_$iv.get_children$ui_release();
        Object[] content$iv$iv = this_$iv$iv.content;
        int size$iv$iv = this_$iv$iv.getSize();
        for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
            LayoutNode it = (LayoutNode) content$iv$iv[i$iv$iv];
            LookaheadPassDelegate childDelegate = it.getLookaheadPassDelegate$ui_release();
            if (childDelegate == null) {
                throw new IllegalArgumentException("Error: Child node's lookahead pass delegate cannot be null when in a lookahead scope.".toString());
            }
            if (childDelegate.placeOrder != Integer.MAX_VALUE) {
                childDelegate.markNodeAndSubtreeAsPlaced();
                it.rescheduleRemeasureOrRelayout$ui_release(it);
            }
        }
    }

    private final void onBeforeLayoutChildren() {
        LayoutNode this_$iv = getLayoutNode();
        MutableVector this_$iv$iv = this_$iv.get_children$ui_release();
        Object[] content$iv$iv = this_$iv$iv.content;
        int size$iv$iv = this_$iv$iv.getSize();
        for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
            LayoutNode it = (LayoutNode) content$iv$iv[i$iv$iv];
            if (it.getLookaheadMeasurePending$ui_release() && it.getMeasuredByParentInLookahead$ui_release() == LayoutNode.UsageByParent.InMeasureBlock) {
                LookaheadPassDelegate lookaheadPassDelegate$ui_release = it.getLayoutDelegate$ui_release().getLookaheadPassDelegate$ui_release();
                Intrinsics.checkNotNull(lookaheadPassDelegate$ui_release);
                Constraints m5830getLastLookaheadConstraintsDWUhwKw = it.getLayoutDelegate$ui_release().m5830getLastLookaheadConstraintsDWUhwKw();
                Intrinsics.checkNotNull(m5830getLastLookaheadConstraintsDWUhwKw);
                if (lookaheadPassDelegate$ui_release.m5844remeasureBRTryo0(m5830getLastLookaheadConstraintsDWUhwKw.m6832unboximpl())) {
                    LayoutNode.requestLookaheadRemeasure$ui_release$default(getLayoutNode(), false, false, false, 7, null);
                }
            }
        }
    }

    public final void replace() {
        LayoutNode parent$ui_release;
        try {
            this.relayoutWithoutParentInProgress = true;
            boolean value$iv = this.placedOnce;
            if (!value$iv) {
                InlineClassHelperKt.throwIllegalStateException("replace() called on item that was not placed");
            }
            this.onNodePlacedCalled = false;
            boolean wasPlacedBefore = isPlaced();
            m5841placeSelfMLgxB_4(this.lastPosition, 0.0f, this.lastLayerBlock, this.lastExplicitLayer);
            if (wasPlacedBefore && !this.onNodePlacedCalled && (parent$ui_release = getLayoutNode().getParent$ui_release()) != null) {
                LayoutNode.requestLookaheadRelayout$ui_release$default(parent$ui_release, false, 1, null);
            }
        } finally {
            this.relayoutWithoutParentInProgress = false;
        }
    }

    public final void onNodeDetached() {
        this.placeOrder = Integer.MAX_VALUE;
        this.previousPlaceOrder = Integer.MAX_VALUE;
        this._placedState = PlacedState.IsNotPlaced;
    }

    public final void onAttachedToNullParent() {
        this._placedState = PlacedState.IsPlacedInLookahead;
    }
}
