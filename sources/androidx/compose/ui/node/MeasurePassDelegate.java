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
import androidx.compose.ui.unit.ConstraintsKt;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntSize;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: MeasurePassDelegate.kt */
@Metadata(d1 = {"\u0000¶\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\f\n\u0002\u0010\u0000\n\u0002\b\u0017\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\b=\b\u0000\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004B\r\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0002\u0010\u0007J\u0014\u0010y\u001a\u000e\u0012\u0004\u0012\u00020{\u0012\u0004\u0012\u00020U0zH\u0016J\b\u0010|\u001a\u00020/H\u0002J\b\u0010}\u001a\u00020/H\u0002J\u001c\u0010~\u001a\u00020/2\u0012\u0010\u007f\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020/0-H\u0016J\u001e\u0010\u0080\u0001\u001a\u00020/2\u0012\u0010\u007f\u001a\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020/0-H\u0082\bJ\u0013\u0010\u0081\u0001\u001a\u00020U2\u0007\u0010\u0082\u0001\u001a\u00020{H\u0096\u0002J\u0010\u0010\u0083\u0001\u001a\u00020/2\u0007\u0010\u0084\u0001\u001a\u00020\u0013J\u0007\u0010\u0085\u0001\u001a\u00020/J\t\u0010\u0086\u0001\u001a\u00020/H\u0016J\u000f\u0010\u0087\u0001\u001a\u00020/H\u0000¢\u0006\u0003\b\u0088\u0001J\u0007\u0010\u0089\u0001\u001a\u00020/J\u000f\u0010\u008a\u0001\u001a\u00020/H\u0000¢\u0006\u0003\b\u008b\u0001J\t\u0010\u008c\u0001\u001a\u00020/H\u0002J\t\u0010\u008d\u0001\u001a\u00020/H\u0002J\u0012\u0010\u008e\u0001\u001a\u00020U2\u0007\u0010\u008f\u0001\u001a\u00020UH\u0016J\u0012\u0010\u0090\u0001\u001a\u00020U2\u0007\u0010\u0091\u0001\u001a\u00020UH\u0016J\u001e\u0010\u0092\u0001\u001a\u00020\u00022\u0007\u0010\u0093\u0001\u001a\u00020'H\u0016ø\u0001\u0000¢\u0006\u0006\b\u0094\u0001\u0010\u0095\u0001J\u0012\u0010\u0096\u0001\u001a\u00020U2\u0007\u0010\u008f\u0001\u001a\u00020UH\u0016J\u0012\u0010\u0097\u0001\u001a\u00020U2\u0007\u0010\u0091\u0001\u001a\u00020UH\u0016J\u0007\u0010\u0098\u0001\u001a\u00020/J\t\u0010\u0099\u0001\u001a\u00020/H\u0002J\t\u0010\u009a\u0001\u001a\u00020/H\u0002J\u0007\u0010\u009b\u0001\u001a\u00020/J\u000f\u0010\u009c\u0001\u001a\u00020/H\u0000¢\u0006\u0003\b\u009d\u0001J\u001e\u0010\u009e\u0001\u001a\u00020/2\u0007\u0010\u0093\u0001\u001a\u00020'H\u0000ø\u0001\u0000¢\u0006\u0006\b\u009f\u0001\u0010 \u0001JB\u0010¡\u0001\u001a\u00020/2\u0007\u0010¢\u0001\u001a\u0002022\u0006\u0010v\u001a\u0002052\u001a\u0010£\u0001\u001a\u0015\u0012\u0004\u0012\u00020.\u0012\u0004\u0012\u00020/\u0018\u00010-¢\u0006\u0002\b0H\u0014ø\u0001\u0000¢\u0006\u0006\b¤\u0001\u0010¥\u0001J/\u0010¡\u0001\u001a\u00020/2\u0007\u0010¢\u0001\u001a\u0002022\u0006\u0010v\u001a\u0002052\u0007\u0010¦\u0001\u001a\u00020+H\u0014ø\u0001\u0000¢\u0006\u0006\b¤\u0001\u0010§\u0001JM\u0010¨\u0001\u001a\u00020/2\u0007\u0010¢\u0001\u001a\u0002022\u0006\u0010v\u001a\u0002052\u001a\u0010£\u0001\u001a\u0015\u0012\u0004\u0012\u00020.\u0012\u0004\u0012\u00020/\u0018\u00010-¢\u0006\u0002\b02\t\u0010¦\u0001\u001a\u0004\u0018\u00010+H\u0002ø\u0001\u0000¢\u0006\u0006\b©\u0001\u0010ª\u0001JM\u0010«\u0001\u001a\u00020/2\u0007\u0010¢\u0001\u001a\u0002022\u0006\u0010v\u001a\u0002052\u001a\u0010£\u0001\u001a\u0015\u0012\u0004\u0012\u00020.\u0012\u0004\u0012\u00020/\u0018\u00010-¢\u0006\u0002\b02\t\u0010¦\u0001\u001a\u0004\u0018\u00010+H\u0002ø\u0001\u0000¢\u0006\u0006\b¬\u0001\u0010ª\u0001J\u001c\u0010\u00ad\u0001\u001a\u00020\u00132\u0007\u0010\u0093\u0001\u001a\u00020'ø\u0001\u0000¢\u0006\u0006\b®\u0001\u0010¯\u0001J\u0007\u0010°\u0001\u001a\u00020/J\t\u0010±\u0001\u001a\u00020/H\u0016J\t\u0010²\u0001\u001a\u00020/H\u0016J\u0012\u0010³\u0001\u001a\u00020/2\u0007\u0010´\u0001\u001a\u00020;H\u0002J\u0007\u0010µ\u0001\u001a\u00020\u0013J\u0012\u0010¶\u0001\u001a\u00020/2\u0007\u0010·\u0001\u001a\u00020\u0013H\u0016R\u0014\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00000\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\n\u001a\u00020\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00000\u000f8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u0011R\u001a\u0010\u0012\u001a\u00020\u0013X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0014\u0010\u0015\"\u0004\b\u0016\u0010\u0017R\u001a\u0010\u0018\u001a\u00020\u0013X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0019\u0010\u0015\"\u0004\b\u001a\u0010\u0017R\u0014\u0010\u001b\u001a\u00020\u001c8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u001d\u0010\u001eR$\u0010 \u001a\u00020\u00132\u0006\u0010\u001f\u001a\u00020\u0013@PX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b \u0010\u0015\"\u0004\b!\u0010\u0017R$\u0010\"\u001a\u00020\u00132\u0006\u0010\u001f\u001a\u00020\u0013@@X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\"\u0010\u0015\"\u0004\b#\u0010\u0017R\u001a\u0010$\u001a\u00020\u0013X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b$\u0010\u0015\"\u0004\b%\u0010\u0017R\u0019\u0010&\u001a\u0004\u0018\u00010'8Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b(\u0010)R\u0010\u0010*\u001a\u0004\u0018\u00010+X\u0082\u000e¢\u0006\u0002\n\u0000R!\u0010,\u001a\u0015\u0012\u0004\u0012\u00020.\u0012\u0004\u0012\u00020/\u0018\u00010-¢\u0006\u0002\b0X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u00101\u001a\u000202X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u00103R\u000e\u00104\u001a\u000205X\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u00106\u001a\u00020\u00132\u0006\u0010\u001f\u001a\u00020\u0013@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b7\u0010\u0015R\u0014\u00108\u001a\b\u0012\u0004\u0012\u00020/09X\u0082\u0004¢\u0006\u0002\n\u0000R\u0011\u0010:\u001a\u00020;8F¢\u0006\u0006\u001a\u0004\b<\u0010=R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u001e\u0010>\u001a\u00020\u00132\u0006\u0010\u001f\u001a\u00020\u0013@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\b?\u0010\u0015R\u000e\u0010@\u001a\u00020\u0013X\u0082\u000e¢\u0006\u0002\n\u0000R$\u0010C\u001a\u00020B2\u0006\u0010A\u001a\u00020B8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\bD\u0010E\"\u0004\bF\u0010GR\u0016\u0010H\u001a\u0004\u0018\u00010I8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\bJ\u0010KR\u001e\u0010L\u001a\u00020\u00132\u0006\u0010\u001f\u001a\u00020\u0013@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\bM\u0010\u0015R\u001a\u0010N\u001a\u00020OX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bP\u0010Q\"\u0004\bR\u0010SR\u0014\u0010T\u001a\u00020U8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bV\u0010WR\u000e\u0010X\u001a\u00020\u0013X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010Y\u001a\u00020U8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bZ\u0010WR\u000e\u0010[\u001a\u00020\u0013X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\\\u001a\u00020\u0013X\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010]\u001a\u00020\u001c8F¢\u0006\u0006\u001a\u0004\b^\u0010\u001eR\u0016\u0010_\u001a\u0004\u0018\u00010\u00038VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b`\u0010aR\"\u0010c\u001a\u0004\u0018\u00010b2\b\u0010\u001f\u001a\u0004\u0018\u00010b@RX\u0096\u000e¢\u0006\b\n\u0000\u001a\u0004\bd\u0010eR\u000e\u0010f\u001a\u00020\u0013X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010g\u001a\b\u0012\u0004\u0012\u00020/09X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\bh\u0010iR\u0016\u0010j\u001a\u00020'X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u00103R\u001e\u0010k\u001a\u00020U2\u0006\u0010\u001f\u001a\u00020U@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\bl\u0010WR\u0014\u0010m\u001a\b\u0012\u0004\u0012\u00020/09X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010n\u001a\u0004\u0018\u00010+X\u0082\u000e¢\u0006\u0002\n\u0000R!\u0010o\u001a\u0015\u0012\u0004\u0012\u00020.\u0012\u0004\u0012\u00020/\u0018\u00010-¢\u0006\u0002\b0X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010p\u001a\u000202X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u00103R\u000e\u0010q\u001a\u000205X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010r\u001a\u00020\u0013X\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u0010s\u001a\u00020U2\u0006\u0010\u001f\u001a\u00020U@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\bt\u0010WR\u000e\u0010u\u001a\u00020\u0013X\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u0010v\u001a\u0002052\u0006\u0010\u001f\u001a\u000205@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\bw\u0010x\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006¸\u0001"}, d2 = {"Landroidx/compose/ui/node/MeasurePassDelegate;", "Landroidx/compose/ui/layout/Measurable;", "Landroidx/compose/ui/layout/Placeable;", "Landroidx/compose/ui/node/AlignmentLinesOwner;", "Landroidx/compose/ui/node/MotionReferencePlacementDelegate;", "layoutNodeLayoutDelegate", "Landroidx/compose/ui/node/LayoutNodeLayoutDelegate;", "(Landroidx/compose/ui/node/LayoutNodeLayoutDelegate;)V", "_childDelegates", "Landroidx/compose/runtime/collection/MutableVector;", "alignmentLines", "Landroidx/compose/ui/node/AlignmentLines;", "getAlignmentLines", "()Landroidx/compose/ui/node/AlignmentLines;", "childDelegates", "", "getChildDelegates$ui_release", "()Ljava/util/List;", "childDelegatesDirty", "", "getChildDelegatesDirty$ui_release", "()Z", "setChildDelegatesDirty$ui_release", "(Z)V", "duringAlignmentLinesQuery", "getDuringAlignmentLinesQuery$ui_release", "setDuringAlignmentLinesQuery$ui_release", "innerCoordinator", "Landroidx/compose/ui/node/NodeCoordinator;", "getInnerCoordinator", "()Landroidx/compose/ui/node/NodeCoordinator;", "<set-?>", "isPlaced", "setPlaced$ui_release", "isPlacedByParent", "setPlacedByParent$ui_release", "isPlacedUnderMotionFrameOfReference", "setPlacedUnderMotionFrameOfReference", "lastConstraints", "Landroidx/compose/ui/unit/Constraints;", "getLastConstraints-DWUhwKw", "()Landroidx/compose/ui/unit/Constraints;", "lastExplicitLayer", "Landroidx/compose/ui/graphics/layer/GraphicsLayer;", "lastLayerBlock", "Lkotlin/Function1;", "Landroidx/compose/ui/graphics/GraphicsLayerScope;", "", "Lkotlin/ExtensionFunctionType;", "lastPosition", "Landroidx/compose/ui/unit/IntOffset;", "J", "lastZIndex", "", "layingOutChildren", "getLayingOutChildren", "layoutChildrenBlock", "Lkotlin/Function0;", "layoutNode", "Landroidx/compose/ui/node/LayoutNode;", "getLayoutNode", "()Landroidx/compose/ui/node/LayoutNode;", "layoutPending", "getLayoutPending$ui_release", "layoutPendingForAlignment", "value", "Landroidx/compose/ui/node/LayoutNode$LayoutState;", "layoutState", "getLayoutState", "()Landroidx/compose/ui/node/LayoutNode$LayoutState;", "setLayoutState", "(Landroidx/compose/ui/node/LayoutNode$LayoutState;)V", "lookaheadPassDelegate", "Landroidx/compose/ui/node/LookaheadPassDelegate;", "getLookaheadPassDelegate", "()Landroidx/compose/ui/node/LookaheadPassDelegate;", "measurePending", "getMeasurePending$ui_release", "measuredByParent", "Landroidx/compose/ui/node/LayoutNode$UsageByParent;", "getMeasuredByParent$ui_release", "()Landroidx/compose/ui/node/LayoutNode$UsageByParent;", "setMeasuredByParent$ui_release", "(Landroidx/compose/ui/node/LayoutNode$UsageByParent;)V", "measuredHeight", "", "getMeasuredHeight", "()I", "measuredOnce", "measuredWidth", "getMeasuredWidth", "needsCoordinatesUpdate", "onNodePlacedCalled", "outerCoordinator", "getOuterCoordinator", "parentAlignmentLinesOwner", "getParentAlignmentLinesOwner", "()Landroidx/compose/ui/node/AlignmentLinesOwner;", "", "parentData", "getParentData", "()Ljava/lang/Object;", "parentDataDirty", "performMeasureBlock", "getPerformMeasureBlock$ui_release", "()Lkotlin/jvm/functions/Function0;", "performMeasureConstraints", "placeOrder", "getPlaceOrder$ui_release", "placeOuterCoordinatorBlock", "placeOuterCoordinatorLayer", "placeOuterCoordinatorLayerBlock", "placeOuterCoordinatorPosition", "placeOuterCoordinatorZIndex", "placedOnce", "previousPlaceOrder", "getPreviousPlaceOrder$ui_release", "relayoutWithoutParentInProgress", "zIndex", "getZIndex$ui_release", "()F", "calculateAlignmentLines", "", "Landroidx/compose/ui/layout/AlignmentLine;", "checkChildrenPlaceOrderForUpdates", "clearPlaceOrder", "forEachChildAlignmentLinesOwner", "block", "forEachChildDelegate", "get", "alignmentLine", "invalidateIntrinsicsParent", "forceRequest", "invalidateParentData", "layoutChildren", "markDetachedFromParentLookaheadPass", "markDetachedFromParentLookaheadPass$ui_release", "markLayoutPending", "markMeasurePending", "markMeasurePending$ui_release", "markNodeAndSubtreeAsPlaced", "markSubtreeAsNotPlaced", "maxIntrinsicHeight", "width", "maxIntrinsicWidth", "height", "measure", "constraints", "measure-BRTryo0", "(J)Landroidx/compose/ui/layout/Placeable;", "minIntrinsicHeight", "minIntrinsicWidth", "notifyChildrenUsingCoordinatesWhilePlacing", "onBeforeLayoutChildren", "onIntrinsicsQueried", "onNodeDetached", "onNodePlaced", "onNodePlaced$ui_release", "performMeasure", "performMeasure-BRTryo0$ui_release", "(J)V", "placeAt", "position", "layerBlock", "placeAt-f8xVGno", "(JFLkotlin/jvm/functions/Function1;)V", "layer", "(JFLandroidx/compose/ui/graphics/layer/GraphicsLayer;)V", "placeOuterCoordinator", "placeOuterCoordinator-MLgxB_4", "(JFLkotlin/jvm/functions/Function1;Landroidx/compose/ui/graphics/layer/GraphicsLayer;)V", "placeSelf", "placeSelf-MLgxB_4", "remeasure", "remeasure-BRTryo0", "(J)Z", "replace", "requestLayout", "requestMeasure", "trackMeasurementByParent", "node", "updateParentData", "updatePlacedUnderMotionFrameOfReference", "newMFR", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class MeasurePassDelegate extends Placeable implements Measurable, AlignmentLinesOwner, MotionReferencePlacementDelegate {
    public static final int $stable = 8;
    private boolean duringAlignmentLinesQuery;
    private boolean isPlaced;
    private boolean isPlacedByParent;
    private boolean isPlacedUnderMotionFrameOfReference;
    private GraphicsLayer lastExplicitLayer;
    private Function1<? super GraphicsLayerScope, Unit> lastLayerBlock;
    private float lastZIndex;
    private boolean layingOutChildren;
    private final LayoutNodeLayoutDelegate layoutNodeLayoutDelegate;
    private boolean layoutPending;
    private boolean layoutPendingForAlignment;
    private boolean measurePending;
    private boolean measuredOnce;
    private boolean needsCoordinatesUpdate;
    private boolean onNodePlacedCalled;
    private Object parentData;
    private GraphicsLayer placeOuterCoordinatorLayer;
    private Function1<? super GraphicsLayerScope, Unit> placeOuterCoordinatorLayerBlock;
    private float placeOuterCoordinatorZIndex;
    private boolean placedOnce;
    private boolean relayoutWithoutParentInProgress;
    private float zIndex;
    private int previousPlaceOrder = Integer.MAX_VALUE;
    private int placeOrder = Integer.MAX_VALUE;
    private LayoutNode.UsageByParent measuredByParent = LayoutNode.UsageByParent.NotUsed;
    private long lastPosition = IntOffset.Companion.m7012getZeronOccac();
    private boolean parentDataDirty = true;
    private final AlignmentLines alignmentLines = new LayoutNodeAlignmentLines(this);
    private final MutableVector<MeasurePassDelegate> _childDelegates = new MutableVector<>(new MeasurePassDelegate[16], 0);
    private boolean childDelegatesDirty = true;
    private long performMeasureConstraints = ConstraintsKt.Constraints$default(0, 0, 0, 0, 15, null);
    private final Function0<Unit> performMeasureBlock = new Function0<Unit>() { // from class: androidx.compose.ui.node.MeasurePassDelegate$performMeasureBlock$1
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
            long j;
            NodeCoordinator outerCoordinator = MeasurePassDelegate.this.getOuterCoordinator();
            j = MeasurePassDelegate.this.performMeasureConstraints;
            outerCoordinator.mo5637measureBRTryo0(j);
        }
    };
    private final Function0<Unit> layoutChildrenBlock = new Function0<Unit>() { // from class: androidx.compose.ui.node.MeasurePassDelegate$layoutChildrenBlock$1
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
            MeasurePassDelegate.this.clearPlaceOrder();
            MeasurePassDelegate.this.forEachChildAlignmentLinesOwner(new Function1<AlignmentLinesOwner, Unit>() { // from class: androidx.compose.ui.node.MeasurePassDelegate$layoutChildrenBlock$1.1
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(AlignmentLinesOwner alignmentLinesOwner) {
                    invoke2(alignmentLinesOwner);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(AlignmentLinesOwner it) {
                    it.getAlignmentLines().setUsedDuringParentLayout$ui_release(false);
                }
            });
            MeasurePassDelegate.this.getInnerCoordinator().getMeasureResult$ui_release().placeChildren();
            MeasurePassDelegate.this.checkChildrenPlaceOrderForUpdates();
            MeasurePassDelegate.this.forEachChildAlignmentLinesOwner(new Function1<AlignmentLinesOwner, Unit>() { // from class: androidx.compose.ui.node.MeasurePassDelegate$layoutChildrenBlock$1.2
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(AlignmentLinesOwner alignmentLinesOwner) {
                    invoke2(alignmentLinesOwner);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(AlignmentLinesOwner it) {
                    it.getAlignmentLines().setPreviousUsedDuringParentLayout$ui_release(it.getAlignmentLines().getUsedDuringParentLayout$ui_release());
                }
            });
        }
    };
    private long placeOuterCoordinatorPosition = IntOffset.Companion.m7012getZeronOccac();
    private final Function0<Unit> placeOuterCoordinatorBlock = new Function0<Unit>() { // from class: androidx.compose.ui.node.MeasurePassDelegate$placeOuterCoordinatorBlock$1
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
            Placeable.PlacementScope scope;
            Function1 layerBlock;
            GraphicsLayer layer;
            long j;
            float f;
            long j2;
            float f2;
            long j3;
            float f3;
            NodeCoordinator wrappedBy$ui_release = MeasurePassDelegate.this.getOuterCoordinator().getWrappedBy$ui_release();
            if (wrappedBy$ui_release == null || (scope = wrappedBy$ui_release.getPlacementScope()) == null) {
                scope = LayoutNodeKt.requireOwner(MeasurePassDelegate.this.getLayoutNode()).getPlacementScope();
            }
            MeasurePassDelegate measurePassDelegate = MeasurePassDelegate.this;
            Placeable.PlacementScope $this$invoke_u24lambda_u240 = scope;
            layerBlock = measurePassDelegate.placeOuterCoordinatorLayerBlock;
            layer = measurePassDelegate.placeOuterCoordinatorLayer;
            if (layer != null) {
                j3 = measurePassDelegate.placeOuterCoordinatorPosition;
                f3 = measurePassDelegate.placeOuterCoordinatorZIndex;
                $this$invoke_u24lambda_u240.m5716placeWithLayeraW9wM(measurePassDelegate.getOuterCoordinator(), j3, layer, f3);
            } else if (layerBlock == null) {
                j2 = measurePassDelegate.placeOuterCoordinatorPosition;
                f2 = measurePassDelegate.placeOuterCoordinatorZIndex;
                $this$invoke_u24lambda_u240.m5707place70tqf50(measurePassDelegate.getOuterCoordinator(), j2, f2);
            } else {
                j = measurePassDelegate.placeOuterCoordinatorPosition;
                f = measurePassDelegate.placeOuterCoordinatorZIndex;
                $this$invoke_u24lambda_u240.m5715placeWithLayeraW9wM(measurePassDelegate.getOuterCoordinator(), j, f, layerBlock);
            }
        }
    };

    /* compiled from: MeasurePassDelegate.kt */
    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;
        public static final /* synthetic */ int[] $EnumSwitchMapping$1;

        static {
            int[] iArr = new int[LayoutNode.LayoutState.values().length];
            try {
                iArr[LayoutNode.LayoutState.Measuring.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[LayoutNode.LayoutState.LayingOut.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            $EnumSwitchMapping$0 = iArr;
            int[] iArr2 = new int[LayoutNode.UsageByParent.values().length];
            try {
                iArr2[LayoutNode.UsageByParent.InMeasureBlock.ordinal()] = 1;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr2[LayoutNode.UsageByParent.InLayoutBlock.ordinal()] = 2;
            } catch (NoSuchFieldError e4) {
            }
            $EnumSwitchMapping$1 = iArr2;
        }
    }

    public MeasurePassDelegate(LayoutNodeLayoutDelegate layoutNodeLayoutDelegate) {
        this.layoutNodeLayoutDelegate = layoutNodeLayoutDelegate;
    }

    public final int getPreviousPlaceOrder$ui_release() {
        return this.previousPlaceOrder;
    }

    public final int getPlaceOrder$ui_release() {
        return this.placeOrder;
    }

    /* renamed from: getLastConstraints-DWUhwKw  reason: not valid java name */
    public final Constraints m5852getLastConstraintsDWUhwKw() {
        if (this.measuredOnce) {
            return Constraints.m6813boximpl(m5697getMeasurementConstraintsmsEJaDk());
        }
        return null;
    }

    public final LayoutNode getLayoutNode() {
        return this.layoutNodeLayoutDelegate.getLayoutNode$ui_release();
    }

    public final LayoutNode.UsageByParent getMeasuredByParent$ui_release() {
        return this.measuredByParent;
    }

    public final void setMeasuredByParent$ui_release(LayoutNode.UsageByParent usageByParent) {
        this.measuredByParent = usageByParent;
    }

    public final boolean getDuringAlignmentLinesQuery$ui_release() {
        return this.duringAlignmentLinesQuery;
    }

    public final void setDuringAlignmentLinesQuery$ui_release(boolean z) {
        this.duringAlignmentLinesQuery = z;
    }

    @Override // androidx.compose.ui.layout.Measured, androidx.compose.ui.layout.IntrinsicMeasurable
    public Object getParentData() {
        return this.parentData;
    }

    private final LookaheadPassDelegate getLookaheadPassDelegate() {
        return this.layoutNodeLayoutDelegate.getLookaheadPassDelegate$ui_release();
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public boolean isPlaced() {
        return this.isPlaced;
    }

    public void setPlaced$ui_release(boolean z) {
        this.isPlaced = z;
    }

    public final boolean isPlacedByParent() {
        return this.isPlacedByParent;
    }

    public final void setPlacedByParent$ui_release(boolean z) {
        this.isPlacedByParent = z;
    }

    public final boolean getMeasurePending$ui_release() {
        return this.measurePending;
    }

    public final boolean getLayoutPending$ui_release() {
        return this.layoutPending;
    }

    public final LayoutNode.LayoutState getLayoutState() {
        return this.layoutNodeLayoutDelegate.getLayoutState$ui_release();
    }

    public final void setLayoutState(LayoutNode.LayoutState value) {
        this.layoutNodeLayoutDelegate.setLayoutState$ui_release(value);
    }

    public final NodeCoordinator getOuterCoordinator() {
        return this.layoutNodeLayoutDelegate.getOuterCoordinator();
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public NodeCoordinator getInnerCoordinator() {
        return getLayoutNode().getInnerCoordinator$ui_release();
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public AlignmentLines getAlignmentLines() {
        return this.alignmentLines;
    }

    public final boolean getChildDelegatesDirty$ui_release() {
        return this.childDelegatesDirty;
    }

    public final void setChildDelegatesDirty$ui_release(boolean z) {
        this.childDelegatesDirty = z;
    }

    public final List<MeasurePassDelegate> getChildDelegates$ui_release() {
        getLayoutNode().updateChildrenIfDirty$ui_release();
        if (!this.childDelegatesDirty) {
            return this._childDelegates.asMutableList();
        }
        LayoutNode $this$updateChildMeasurables$iv = getLayoutNode();
        MutableVector destination$iv = this._childDelegates;
        MutableVector this_$iv$iv$iv = $this$updateChildMeasurables$iv.get_children$ui_release();
        Object[] content$iv$iv$iv = this_$iv$iv$iv.content;
        int size$iv$iv$iv = this_$iv$iv$iv.getSize();
        for (int i$iv$iv$iv = 0; i$iv$iv$iv < size$iv$iv$iv; i$iv$iv$iv++) {
            LayoutNode layoutNode$iv = (LayoutNode) content$iv$iv$iv[i$iv$iv$iv];
            int i$iv = i$iv$iv$iv;
            if (destination$iv.getSize() <= i$iv) {
                destination$iv.add(layoutNode$iv.getLayoutDelegate$ui_release().getMeasurePassDelegate$ui_release());
            } else {
                destination$iv.set(i$iv, layoutNode$iv.getLayoutDelegate$ui_release().getMeasurePassDelegate$ui_release());
            }
        }
        destination$iv.removeRange($this$updateChildMeasurables$iv.getChildren$ui_release().size(), destination$iv.getSize());
        this.childDelegatesDirty = false;
        return this._childDelegates.asMutableList();
    }

    public final void markDetachedFromParentLookaheadPass$ui_release() {
        this.layoutNodeLayoutDelegate.setDetachedFromParentLookaheadPass$ui_release(true);
    }

    public final boolean getLayingOutChildren() {
        return this.layingOutChildren;
    }

    public final Function0<Unit> getPerformMeasureBlock$ui_release() {
        return this.performMeasureBlock;
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public void layoutChildren() {
        this.layingOutChildren = true;
        getAlignmentLines().recalculateQueryOwner();
        if (this.layoutPending) {
            onBeforeLayoutChildren();
        }
        if (this.layoutPendingForAlignment || (!this.duringAlignmentLinesQuery && !getInnerCoordinator().isPlacingForAlignment$ui_release() && this.layoutPending)) {
            this.layoutPending = false;
            LayoutNode.LayoutState oldLayoutState = getLayoutState();
            setLayoutState(LayoutNode.LayoutState.LayingOut);
            this.layoutNodeLayoutDelegate.setCoordinatesAccessedDuringPlacement(false);
            LayoutNode $this$layoutChildren_u24lambda_u241 = getLayoutNode();
            Owner owner = LayoutNodeKt.requireOwner($this$layoutChildren_u24lambda_u241);
            owner.getSnapshotObserver().observeLayoutSnapshotReads$ui_release($this$layoutChildren_u24lambda_u241, false, this.layoutChildrenBlock);
            setLayoutState(oldLayoutState);
            if (getInnerCoordinator().isPlacingForAlignment$ui_release() && this.layoutNodeLayoutDelegate.getCoordinatesAccessedDuringPlacement()) {
                requestLayout();
            }
            this.layoutPendingForAlignment = false;
        }
        if (getAlignmentLines().getUsedDuringParentLayout$ui_release()) {
            getAlignmentLines().setPreviousUsedDuringParentLayout$ui_release(true);
        }
        if (getAlignmentLines().getDirty$ui_release() && getAlignmentLines().getRequired$ui_release()) {
            getAlignmentLines().recalculate();
        }
        this.layingOutChildren = false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void checkChildrenPlaceOrderForUpdates() {
        LayoutNode $this$checkChildrenPlaceOrderForUpdates_u24lambda_u243 = getLayoutNode();
        MutableVector this_$iv$iv = $this$checkChildrenPlaceOrderForUpdates_u24lambda_u243.get_children$ui_release();
        Object[] content$iv$iv = this_$iv$iv.content;
        int size$iv$iv = this_$iv$iv.getSize();
        for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
            LayoutNode child = (LayoutNode) content$iv$iv[i$iv$iv];
            if (child.getMeasurePassDelegate$ui_release().previousPlaceOrder != child.getPlaceOrder$ui_release()) {
                $this$checkChildrenPlaceOrderForUpdates_u24lambda_u243.onZSortedChildrenInvalidated$ui_release();
                $this$checkChildrenPlaceOrderForUpdates_u24lambda_u243.invalidateLayer$ui_release();
                if (child.getPlaceOrder$ui_release() == Integer.MAX_VALUE) {
                    if (child.getLayoutDelegate$ui_release().getDetachedFromParentLookaheadPlacement$ui_release()) {
                        LookaheadPassDelegate lookaheadPassDelegate$ui_release = child.getLookaheadPassDelegate$ui_release();
                        Intrinsics.checkNotNull(lookaheadPassDelegate$ui_release);
                        lookaheadPassDelegate$ui_release.markNodeAndSubtreeAsNotPlaced$ui_release(false);
                    }
                    child.getMeasurePassDelegate$ui_release().markSubtreeAsNotPlaced();
                }
            }
        }
    }

    private final void markSubtreeAsNotPlaced() {
        if (isPlaced()) {
            setPlaced$ui_release(false);
            LayoutNode this_$iv = getLayoutNode();
            NodeCoordinator final$iv = this_$iv.getInnerCoordinator$ui_release().getWrapped$ui_release();
            for (NodeCoordinator delegate$iv = this_$iv.getOuterCoordinator$ui_release(); !Intrinsics.areEqual(delegate$iv, final$iv) && delegate$iv != null; delegate$iv = delegate$iv.getWrapped$ui_release()) {
                NodeCoordinator it = delegate$iv;
                it.onUnplaced();
                it.releaseLayer();
            }
            LayoutNode this_$iv$iv = getLayoutNode();
            MutableVector this_$iv$iv$iv = this_$iv$iv.get_children$ui_release();
            Object[] content$iv$iv$iv = this_$iv$iv$iv.content;
            int size$iv$iv$iv = this_$iv$iv$iv.getSize();
            for (int i$iv$iv$iv = 0; i$iv$iv$iv < size$iv$iv$iv; i$iv$iv$iv++) {
                LayoutNode it$iv = (LayoutNode) content$iv$iv$iv[i$iv$iv$iv];
                it$iv.getMeasurePassDelegate$ui_release().markSubtreeAsNotPlaced();
            }
        }
    }

    private final void markNodeAndSubtreeAsPlaced() {
        boolean wasPlaced = isPlaced();
        setPlaced$ui_release(true);
        LayoutNode $this$markNodeAndSubtreeAsPlaced_u24lambda_u248 = getLayoutNode();
        if (!wasPlaced) {
            $this$markNodeAndSubtreeAsPlaced_u24lambda_u248.getInnerCoordinator$ui_release().onPlaced();
            if ($this$markNodeAndSubtreeAsPlaced_u24lambda_u248.getMeasurePending$ui_release()) {
                LayoutNode.requestRemeasure$ui_release$default($this$markNodeAndSubtreeAsPlaced_u24lambda_u248, true, false, false, 6, null);
            } else if ($this$markNodeAndSubtreeAsPlaced_u24lambda_u248.getLookaheadMeasurePending$ui_release()) {
                LayoutNode.requestLookaheadRemeasure$ui_release$default($this$markNodeAndSubtreeAsPlaced_u24lambda_u248, true, false, false, 6, null);
            }
        }
        NodeCoordinator final$iv = $this$markNodeAndSubtreeAsPlaced_u24lambda_u248.getInnerCoordinator$ui_release().getWrapped$ui_release();
        for (NodeCoordinator delegate$iv = $this$markNodeAndSubtreeAsPlaced_u24lambda_u248.getOuterCoordinator$ui_release(); !Intrinsics.areEqual(delegate$iv, final$iv) && delegate$iv != null; delegate$iv = delegate$iv.getWrapped$ui_release()) {
            NodeCoordinator it = delegate$iv;
            if (it.getLastLayerDrawingWasSkipped$ui_release()) {
                it.invalidateLayer();
            }
        }
        MutableVector this_$iv$iv = $this$markNodeAndSubtreeAsPlaced_u24lambda_u248.get_children$ui_release();
        Object[] content$iv$iv = this_$iv$iv.content;
        int size$iv$iv = this_$iv$iv.getSize();
        for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
            LayoutNode it2 = (LayoutNode) content$iv$iv[i$iv$iv];
            if (it2.getPlaceOrder$ui_release() != Integer.MAX_VALUE) {
                it2.getMeasurePassDelegate$ui_release().markNodeAndSubtreeAsPlaced();
                $this$markNodeAndSubtreeAsPlaced_u24lambda_u248.rescheduleRemeasureOrRelayout$ui_release(it2);
            }
        }
    }

    public final float getZIndex$ui_release() {
        return this.zIndex;
    }

    public final void onNodePlaced$ui_release() {
        this.onNodePlacedCalled = true;
        LayoutNode parent = getLayoutNode().getParent$ui_release();
        float newZIndex = getInnerCoordinator().getZIndex();
        LayoutNode this_$iv = getLayoutNode();
        NodeCoordinator inner$iv = this_$iv.getInnerCoordinator$ui_release();
        for (NodeCoordinator coordinator$iv = this_$iv.getOuterCoordinator$ui_release(); coordinator$iv != inner$iv; coordinator$iv = coordinator$iv.getWrapped$ui_release()) {
            Intrinsics.checkNotNull(coordinator$iv, "null cannot be cast to non-null type androidx.compose.ui.node.LayoutModifierNodeCoordinator");
            LayoutModifierNodeCoordinator it = (LayoutModifierNodeCoordinator) coordinator$iv;
            newZIndex += it.getZIndex();
        }
        if (!(newZIndex == this.zIndex)) {
            this.zIndex = newZIndex;
            if (parent != null) {
                parent.onZSortedChildrenInvalidated$ui_release();
            }
            if (parent != null) {
                parent.invalidateLayer$ui_release();
            }
        }
        if (!isPlaced()) {
            if (parent != null) {
                parent.invalidateLayer$ui_release();
            }
            markNodeAndSubtreeAsPlaced();
            if (this.relayoutWithoutParentInProgress && parent != null) {
                LayoutNode.requestRelayout$ui_release$default(parent, false, 1, null);
            }
        } else {
            getLayoutNode().getInnerCoordinator$ui_release().onPlaced();
        }
        if (parent != null) {
            if (!this.relayoutWithoutParentInProgress && parent.getLayoutState$ui_release() == LayoutNode.LayoutState.LayingOut) {
                boolean value$iv = this.placeOrder == Integer.MAX_VALUE;
                if (!value$iv) {
                    InlineClassHelperKt.throwIllegalStateException("Place was called on a node which was placed already");
                }
                this.placeOrder = parent.getLayoutDelegate$ui_release().getNextChildPlaceOrder$ui_release();
                LayoutNodeLayoutDelegate layoutDelegate$ui_release = parent.getLayoutDelegate$ui_release();
                layoutDelegate$ui_release.setNextChildPlaceOrder$ui_release(layoutDelegate$ui_release.getNextChildPlaceOrder$ui_release() + 1);
            }
        } else {
            this.placeOrder = 0;
        }
        layoutChildren();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void clearPlaceOrder() {
        boolean z = false;
        this.layoutNodeLayoutDelegate.setNextChildPlaceOrder$ui_release(0);
        LayoutNode this_$iv$iv = getLayoutNode();
        MutableVector this_$iv$iv$iv = this_$iv$iv.get_children$ui_release();
        int i$iv$iv$iv = 0;
        Object[] content$iv$iv$iv = this_$iv$iv$iv.content;
        int size$iv$iv$iv = this_$iv$iv$iv.getSize();
        while (i$iv$iv$iv < size$iv$iv$iv) {
            LayoutNode it$iv = (LayoutNode) content$iv$iv$iv[i$iv$iv$iv];
            MeasurePassDelegate child = it$iv.getMeasurePassDelegate$ui_release();
            child.previousPlaceOrder = child.placeOrder;
            child.placeOrder = Integer.MAX_VALUE;
            child.isPlacedByParent = z;
            if (child.measuredByParent == LayoutNode.UsageByParent.InLayoutBlock) {
                child.measuredByParent = LayoutNode.UsageByParent.NotUsed;
            }
            i$iv$iv$iv++;
            z = false;
        }
    }

    private final void forEachChildDelegate(Function1<? super MeasurePassDelegate, Unit> function1) {
        LayoutNode this_$iv = getLayoutNode();
        MutableVector this_$iv$iv = this_$iv.get_children$ui_release();
        Object[] content$iv$iv = this_$iv$iv.content;
        int size$iv$iv = this_$iv$iv.getSize();
        for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
            LayoutNode it = (LayoutNode) content$iv$iv[i$iv$iv];
            function1.invoke(it.getMeasurePassDelegate$ui_release());
        }
    }

    /* renamed from: performMeasure-BRTryo0$ui_release  reason: not valid java name */
    public final void m5853performMeasureBRTryo0$ui_release(long constraints) {
        boolean value$iv = getLayoutState() == LayoutNode.LayoutState.Idle;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("layout state is not idle before measure starts");
        }
        this.performMeasureConstraints = constraints;
        setLayoutState(LayoutNode.LayoutState.Measuring);
        this.measurePending = false;
        LayoutNodeKt.requireOwner(getLayoutNode()).getSnapshotObserver().observeMeasureSnapshotReads$ui_release(getLayoutNode(), false, this.performMeasureBlock);
        if (getLayoutState() == LayoutNode.LayoutState.Measuring) {
            markLayoutPending();
            setLayoutState(LayoutNode.LayoutState.Idle);
        }
    }

    @Override // androidx.compose.ui.layout.Measurable
    /* renamed from: measure-BRTryo0 */
    public Placeable mo5637measureBRTryo0(long constraints) {
        if (getLayoutNode().getIntrinsicsUsageByParent$ui_release() == LayoutNode.UsageByParent.NotUsed) {
            getLayoutNode().clearSubtreeIntrinsicsUsage$ui_release();
        }
        if (LayoutNodeLayoutDelegateKt.isOutMostLookaheadRoot(getLayoutNode())) {
            LookaheadPassDelegate $this$measure_BRTryo0_u24lambda_u2414 = getLookaheadPassDelegate();
            Intrinsics.checkNotNull($this$measure_BRTryo0_u24lambda_u2414);
            $this$measure_BRTryo0_u24lambda_u2414.setMeasuredByParent$ui_release(LayoutNode.UsageByParent.NotUsed);
            $this$measure_BRTryo0_u24lambda_u2414.mo5637measureBRTryo0(constraints);
        }
        trackMeasurementByParent(getLayoutNode());
        m5854remeasureBRTryo0(constraints);
        return this;
    }

    /* renamed from: remeasure-BRTryo0  reason: not valid java name */
    public final boolean m5854remeasureBRTryo0(long constraints) {
        boolean sizeChanged = true;
        boolean value$iv = !getLayoutNode().isDeactivated();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("measure is called on a deactivated node");
        }
        Owner owner = LayoutNodeKt.requireOwner(getLayoutNode());
        LayoutNode parent = getLayoutNode().getParent$ui_release();
        getLayoutNode().setCanMultiMeasure$ui_release(getLayoutNode().getCanMultiMeasure$ui_release() || (parent != null && parent.getCanMultiMeasure$ui_release()));
        if (!getLayoutNode().getMeasurePending$ui_release() && Constraints.m6819equalsimpl0(m5697getMeasurementConstraintsmsEJaDk(), constraints)) {
            Owner.forceMeasureTheSubtree$default(owner, getLayoutNode(), false, 2, null);
            getLayoutNode().resetSubtreeIntrinsicsUsage$ui_release();
            return false;
        }
        getAlignmentLines().setUsedByModifierMeasurement$ui_release(false);
        forEachChildAlignmentLinesOwner(new Function1<AlignmentLinesOwner, Unit>() { // from class: androidx.compose.ui.node.MeasurePassDelegate$remeasure$2
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
        this.measuredOnce = true;
        long outerPreviousMeasuredSize = getOuterCoordinator().mo5645getSizeYbymL2g();
        m5700setMeasurementConstraintsBRTryo0(constraints);
        m5853performMeasureBRTryo0$ui_release(constraints);
        if (IntSize.m7042equalsimpl0(getOuterCoordinator().mo5645getSizeYbymL2g(), outerPreviousMeasuredSize) && getOuterCoordinator().getWidth() == getWidth() && getOuterCoordinator().getHeight() == getHeight()) {
            sizeChanged = false;
        }
        int width$iv = getOuterCoordinator().getWidth();
        int height$iv = getOuterCoordinator().getHeight();
        m5699setMeasuredSizeozmzZPI(IntSize.m7039constructorimpl((width$iv << 32) | (height$iv & 4294967295L)));
        return sizeChanged;
    }

    private final void trackMeasurementByParent(LayoutNode node) {
        LayoutNode.UsageByParent usageByParent;
        LayoutNode parent = node.getParent$ui_release();
        if (parent != null) {
            boolean value$iv = this.measuredByParent == LayoutNode.UsageByParent.NotUsed || node.getCanMultiMeasure$ui_release();
            if (!value$iv) {
                InlineClassHelperKt.throwIllegalStateException(LayoutNodeLayoutDelegateKt.MeasuredTwiceErrorMessage);
            }
            switch (WhenMappings.$EnumSwitchMapping$0[parent.getLayoutState$ui_release().ordinal()]) {
                case 1:
                    usageByParent = LayoutNode.UsageByParent.InMeasureBlock;
                    break;
                case 2:
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

    @Override // androidx.compose.ui.layout.Placeable, androidx.compose.ui.layout.Measured
    public int getMeasuredWidth() {
        return getOuterCoordinator().getMeasuredWidth();
    }

    @Override // androidx.compose.ui.layout.Placeable, androidx.compose.ui.layout.Measured
    public int getMeasuredHeight() {
        return getOuterCoordinator().getMeasuredHeight();
    }

    @Override // androidx.compose.ui.layout.Measured
    public int get(AlignmentLine alignmentLine) {
        LayoutNode parent$ui_release = getLayoutNode().getParent$ui_release();
        if ((parent$ui_release != null ? parent$ui_release.getLayoutState$ui_release() : null) == LayoutNode.LayoutState.Measuring) {
            getAlignmentLines().setUsedDuringParentMeasurement$ui_release(true);
        } else {
            LayoutNode parent$ui_release2 = getLayoutNode().getParent$ui_release();
            if ((parent$ui_release2 != null ? parent$ui_release2.getLayoutState$ui_release() : null) == LayoutNode.LayoutState.LayingOut) {
                getAlignmentLines().setUsedDuringParentLayout$ui_release(true);
            }
        }
        this.duringAlignmentLinesQuery = true;
        int result = getOuterCoordinator().get(alignmentLine);
        this.duringAlignmentLinesQuery = false;
        return result;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // androidx.compose.ui.layout.Placeable
    /* renamed from: placeAt-f8xVGno */
    public void mo5638placeAtf8xVGno(long position, float zIndex, Function1<? super GraphicsLayerScope, Unit> function1) {
        m5851placeSelfMLgxB_4(position, zIndex, function1, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // androidx.compose.ui.layout.Placeable
    /* renamed from: placeAt-f8xVGno */
    public void mo5698placeAtf8xVGno(long position, float zIndex, GraphicsLayer layer) {
        m5851placeSelfMLgxB_4(position, zIndex, null, layer);
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
        boolean old = getOuterCoordinator().isPlacedUnderMotionFrameOfReference();
        if (newMFR != old) {
            getOuterCoordinator().setPlacedUnderMotionFrameOfReference(newMFR);
            this.needsCoordinatesUpdate = true;
        }
        setPlacedUnderMotionFrameOfReference(newMFR);
    }

    /* renamed from: placeSelf-MLgxB_4  reason: not valid java name */
    private final void m5851placeSelfMLgxB_4(long position, float zIndex, Function1<? super GraphicsLayerScope, Unit> function1, GraphicsLayer layer) {
        Placeable.PlacementScope scope;
        this.isPlacedByParent = true;
        boolean z = false;
        if (!IntOffset.m7000equalsimpl0(position, this.lastPosition) || this.needsCoordinatesUpdate) {
            if (this.layoutNodeLayoutDelegate.getCoordinatesAccessedDuringModifierPlacement() || this.layoutNodeLayoutDelegate.getCoordinatesAccessedDuringPlacement() || this.needsCoordinatesUpdate) {
                this.layoutPending = true;
                this.needsCoordinatesUpdate = false;
            }
            notifyChildrenUsingCoordinatesWhilePlacing();
        }
        LookaheadPassDelegate lookaheadPassDelegate = getLookaheadPassDelegate();
        if (lookaheadPassDelegate != null && lookaheadPassDelegate.getNeedsToBePlacedInApproach()) {
            NodeCoordinator wrappedBy$ui_release = getOuterCoordinator().getWrappedBy$ui_release();
            if (wrappedBy$ui_release == null || (scope = wrappedBy$ui_release.getPlacementScope()) == null) {
                scope = LayoutNodeKt.requireOwner(getLayoutNode()).getPlacementScope();
            }
            Placeable.PlacementScope $this$placeSelf_MLgxB_4_u24lambda_u2419 = scope;
            LookaheadPassDelegate it = getLookaheadPassDelegate();
            Intrinsics.checkNotNull(it);
            LayoutNode $this$placeSelf_MLgxB_4_u24lambda_u2419_u24lambda_u2418_u24lambda_u2417 = getLayoutNode().getParent$ui_release();
            if ($this$placeSelf_MLgxB_4_u24lambda_u2419_u24lambda_u2418_u24lambda_u2417 != null) {
                $this$placeSelf_MLgxB_4_u24lambda_u2419_u24lambda_u2418_u24lambda_u2417.getLayoutDelegate$ui_release().setNextChildLookaheadPlaceOrder$ui_release(0);
            }
            it.setPlaceOrder$ui_release(Integer.MAX_VALUE);
            Placeable.PlacementScope.place$default($this$placeSelf_MLgxB_4_u24lambda_u2419, it, IntOffset.m7001getXimpl(position), IntOffset.m7002getYimpl(position), 0.0f, 4, null);
        }
        LookaheadPassDelegate lookaheadPassDelegate2 = getLookaheadPassDelegate();
        if (lookaheadPassDelegate2 != null && !lookaheadPassDelegate2.getPlacedOnce$ui_release()) {
            z = true;
        }
        boolean value$iv = true ^ z;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("Error: Placement happened before lookahead.");
        }
        m5850placeOuterCoordinatorMLgxB_4(position, zIndex, function1, layer);
    }

    /* renamed from: placeOuterCoordinator-MLgxB_4  reason: not valid java name */
    private final void m5850placeOuterCoordinatorMLgxB_4(long position, float zIndex, Function1<? super GraphicsLayerScope, Unit> function1, GraphicsLayer layer) {
        boolean value$iv = !getLayoutNode().isDeactivated();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("place is called on a deactivated node");
        }
        setLayoutState(LayoutNode.LayoutState.LayingOut);
        boolean firstPlacement = !this.placedOnce;
        this.lastPosition = position;
        this.lastZIndex = zIndex;
        this.lastLayerBlock = function1;
        this.lastExplicitLayer = layer;
        this.placedOnce = true;
        this.onNodePlacedCalled = false;
        Owner owner = LayoutNodeKt.requireOwner(getLayoutNode());
        owner.getRectManager().m6127onLayoutPositionChanged70tqf50(getLayoutNode(), position, firstPlacement);
        if (this.layoutPending || !isPlaced()) {
            getAlignmentLines().setUsedByModifierLayout$ui_release(false);
            this.layoutNodeLayoutDelegate.setCoordinatesAccessedDuringModifierPlacement(false);
            this.placeOuterCoordinatorLayerBlock = function1;
            this.placeOuterCoordinatorPosition = position;
            this.placeOuterCoordinatorZIndex = zIndex;
            this.placeOuterCoordinatorLayer = layer;
            owner.getSnapshotObserver().observeLayoutModifierSnapshotReads$ui_release(getLayoutNode(), false, this.placeOuterCoordinatorBlock);
        } else {
            getOuterCoordinator().m5888placeSelfApparentToRealOffsetMLgxB_4(position, zIndex, function1, layer);
            onNodePlaced$ui_release();
        }
        setLayoutState(LayoutNode.LayoutState.Idle);
    }

    public final void replace() {
        LayoutNode parent$ui_release;
        try {
            this.relayoutWithoutParentInProgress = true;
            boolean value$iv = this.placedOnce;
            if (!value$iv) {
                InlineClassHelperKt.throwIllegalStateException("replace called on unplaced item");
            }
            boolean wasPlacedBefore = isPlaced();
            m5850placeOuterCoordinatorMLgxB_4(this.lastPosition, this.lastZIndex, this.lastLayerBlock, this.lastExplicitLayer);
            if (wasPlacedBefore && !this.onNodePlacedCalled && (parent$ui_release = getLayoutNode().getParent$ui_release()) != null) {
                LayoutNode.requestRelayout$ui_release$default(parent$ui_release, false, 1, null);
            }
        } finally {
            this.relayoutWithoutParentInProgress = false;
        }
    }

    @Override // androidx.compose.ui.layout.IntrinsicMeasurable
    public int minIntrinsicWidth(int height) {
        if (LayoutNodeLayoutDelegateKt.isOutMostLookaheadRoot(getLayoutNode())) {
            LookaheadPassDelegate lookaheadPassDelegate = getLookaheadPassDelegate();
            Intrinsics.checkNotNull(lookaheadPassDelegate);
            return lookaheadPassDelegate.minIntrinsicWidth(height);
        }
        onIntrinsicsQueried();
        return getOuterCoordinator().minIntrinsicWidth(height);
    }

    @Override // androidx.compose.ui.layout.IntrinsicMeasurable
    public int maxIntrinsicWidth(int height) {
        if (LayoutNodeLayoutDelegateKt.isOutMostLookaheadRoot(getLayoutNode())) {
            LookaheadPassDelegate lookaheadPassDelegate = getLookaheadPassDelegate();
            Intrinsics.checkNotNull(lookaheadPassDelegate);
            return lookaheadPassDelegate.maxIntrinsicWidth(height);
        }
        onIntrinsicsQueried();
        return getOuterCoordinator().maxIntrinsicWidth(height);
    }

    @Override // androidx.compose.ui.layout.IntrinsicMeasurable
    public int minIntrinsicHeight(int width) {
        if (LayoutNodeLayoutDelegateKt.isOutMostLookaheadRoot(getLayoutNode())) {
            LookaheadPassDelegate lookaheadPassDelegate = getLookaheadPassDelegate();
            Intrinsics.checkNotNull(lookaheadPassDelegate);
            return lookaheadPassDelegate.minIntrinsicHeight(width);
        }
        onIntrinsicsQueried();
        return getOuterCoordinator().minIntrinsicHeight(width);
    }

    @Override // androidx.compose.ui.layout.IntrinsicMeasurable
    public int maxIntrinsicHeight(int width) {
        if (LayoutNodeLayoutDelegateKt.isOutMostLookaheadRoot(getLayoutNode())) {
            LookaheadPassDelegate lookaheadPassDelegate = getLookaheadPassDelegate();
            Intrinsics.checkNotNull(lookaheadPassDelegate);
            return lookaheadPassDelegate.maxIntrinsicHeight(width);
        }
        onIntrinsicsQueried();
        return getOuterCoordinator().maxIntrinsicHeight(width);
    }

    private final void onIntrinsicsQueried() {
        LayoutNode.UsageByParent usageByParent;
        LayoutNode.requestRemeasure$ui_release$default(getLayoutNode(), false, false, false, 7, null);
        LayoutNode parent = getLayoutNode().getParent$ui_release();
        if (parent != null && getLayoutNode().getIntrinsicsUsageByParent$ui_release() == LayoutNode.UsageByParent.NotUsed) {
            LayoutNode layoutNode = getLayoutNode();
            switch (WhenMappings.$EnumSwitchMapping$0[parent.getLayoutState$ui_release().ordinal()]) {
                case 1:
                    usageByParent = LayoutNode.UsageByParent.InMeasureBlock;
                    break;
                case 2:
                    usageByParent = LayoutNode.UsageByParent.InLayoutBlock;
                    break;
                default:
                    usageByParent = parent.getIntrinsicsUsageByParent$ui_release();
                    break;
            }
            layoutNode.setIntrinsicsUsageByParent$ui_release(usageByParent);
        }
    }

    public final void invalidateParentData() {
        this.parentDataDirty = true;
    }

    public final boolean updateParentData() {
        if (!(getParentData() == null && getOuterCoordinator().getParentData() == null) && this.parentDataDirty) {
            this.parentDataDirty = false;
            this.parentData = getOuterCoordinator().getParentData();
            return true;
        }
        return false;
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public Map<AlignmentLine, Integer> calculateAlignmentLines() {
        if (!this.duringAlignmentLinesQuery) {
            if (getLayoutState() == LayoutNode.LayoutState.Measuring) {
                getAlignmentLines().setUsedByModifierMeasurement$ui_release(true);
                if (getAlignmentLines().getDirty$ui_release()) {
                    markLayoutPending();
                }
            } else {
                getAlignmentLines().setUsedByModifierLayout$ui_release(true);
            }
        }
        getInnerCoordinator().setPlacingForAlignment$ui_release(true);
        layoutChildren();
        getInnerCoordinator().setPlacingForAlignment$ui_release(false);
        return getAlignmentLines().getLastCalculation();
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public AlignmentLinesOwner getParentAlignmentLinesOwner() {
        LayoutNodeLayoutDelegate layoutDelegate$ui_release;
        LayoutNode parent$ui_release = getLayoutNode().getParent$ui_release();
        if (parent$ui_release == null || (layoutDelegate$ui_release = parent$ui_release.getLayoutDelegate$ui_release()) == null) {
            return null;
        }
        return layoutDelegate$ui_release.getAlignmentLinesOwner$ui_release();
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public void forEachChildAlignmentLinesOwner(Function1<? super AlignmentLinesOwner, Unit> function1) {
        LayoutNode this_$iv = getLayoutNode();
        MutableVector this_$iv$iv = this_$iv.get_children$ui_release();
        Object[] content$iv$iv = this_$iv$iv.content;
        int size$iv$iv = this_$iv$iv.getSize();
        for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
            LayoutNode it = (LayoutNode) content$iv$iv[i$iv$iv];
            function1.invoke(it.getLayoutDelegate$ui_release().getAlignmentLinesOwner$ui_release());
        }
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public void requestLayout() {
        LayoutNode.requestRelayout$ui_release$default(getLayoutNode(), false, 1, null);
    }

    @Override // androidx.compose.ui.node.AlignmentLinesOwner
    public void requestMeasure() {
        LayoutNode.requestRemeasure$ui_release$default(getLayoutNode(), false, false, false, 7, null);
    }

    public final void notifyChildrenUsingCoordinatesWhilePlacing() {
        if (this.layoutNodeLayoutDelegate.getChildrenAccessingCoordinatesDuringPlacement() > 0) {
            LayoutNode this_$iv = getLayoutNode();
            MutableVector this_$iv$iv = this_$iv.get_children$ui_release();
            Object[] content$iv$iv = this_$iv$iv.content;
            int size$iv$iv = this_$iv$iv.getSize();
            for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
                LayoutNode child = (LayoutNode) content$iv$iv[i$iv$iv];
                LayoutNodeLayoutDelegate childLayoutDelegate = child.getLayoutDelegate$ui_release();
                boolean accessed = childLayoutDelegate.getCoordinatesAccessedDuringPlacement() || childLayoutDelegate.getCoordinatesAccessedDuringModifierPlacement();
                if (accessed && !childLayoutDelegate.getLayoutPending$ui_release()) {
                    LayoutNode.requestRelayout$ui_release$default(child, false, 1, null);
                }
                childLayoutDelegate.getMeasurePassDelegate$ui_release().notifyChildrenUsingCoordinatesWhilePlacing();
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
            if (it.getMeasurePending$ui_release() && it.getMeasuredByParent$ui_release() == LayoutNode.UsageByParent.InMeasureBlock && LayoutNode.m5810remeasure_Sx5XlM$ui_release$default(it, null, 1, null)) {
                LayoutNode.requestRemeasure$ui_release$default(getLayoutNode(), false, false, false, 7, null);
            }
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
                    LayoutNode.requestRemeasure$ui_release$default(intrinsicsUsingParent, forceRequest, false, false, 6, null);
                    return;
                case 2:
                    intrinsicsUsingParent.requestRelayout$ui_release(forceRequest);
                    return;
                default:
                    throw new IllegalStateException("Intrinsics isn't used by the parent".toString());
            }
        }
    }

    public final void onNodeDetached() {
        this.placeOrder = Integer.MAX_VALUE;
        this.previousPlaceOrder = Integer.MAX_VALUE;
        setPlaced$ui_release(false);
    }

    public final void markLayoutPending() {
        this.layoutPending = true;
        this.layoutPendingForAlignment = true;
    }

    public final void markMeasurePending$ui_release() {
        this.measurePending = true;
    }
}
