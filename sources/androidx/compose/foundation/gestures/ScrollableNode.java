package androidx.compose.foundation.gestures;

import android.view.KeyEvent;
import androidx.autofill.HintConstants;
import androidx.compose.foundation.MutatePriority;
import androidx.compose.foundation.OverscrollEffect;
import androidx.compose.foundation.gestures.DragEvent;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.input.key.Key;
import androidx.compose.ui.input.key.KeyEventType;
import androidx.compose.ui.input.key.KeyEvent_androidKt;
import androidx.compose.ui.input.key.KeyInputModifierNode;
import androidx.compose.ui.input.nestedscroll.NestedScrollDispatcher;
import androidx.compose.ui.input.pointer.PointerEvent;
import androidx.compose.ui.input.pointer.PointerEventPass;
import androidx.compose.ui.input.pointer.PointerEventType;
import androidx.compose.ui.input.pointer.PointerInputChange;
import androidx.compose.ui.node.CompositionLocalConsumerModifierNode;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.SemanticsModifierNode;
import androidx.compose.ui.node.SemanticsModifierNodeKt;
import androidx.compose.ui.semantics.SemanticsPropertiesKt;
import androidx.compose.ui.semantics.SemanticsPropertyReceiver;
import androidx.compose.ui.unit.Density;
import androidx.core.app.NotificationCompat;
import com.itextpdf.io.codec.TIFFConstants;
import java.util.List;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: Scrollable.kt */
@Metadata(d1 = {"\u0000Î\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0007\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004BM\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\b\u0010\t\u001a\u0004\u0018\u00010\n\u0012\u0006\u0010\u000b\u001a\u00020\f\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011\u0012\b\u0010\u0012\u001a\u0004\u0018\u00010\u0013¢\u0006\u0002\u0010\u0014J\b\u00102\u001a\u000203H\u0002JM\u00104\u001a\u0002032=\u00105\u001a9\b\u0001\u0012\u001f\u0012\u001d\u0012\u0013\u0012\u001107¢\u0006\f\b\"\u0012\b\b#\u0012\u0004\b\b(8\u0012\u0004\u0012\u00020306\u0012\n\u0012\b\u0012\u0004\u0012\u0002030(\u0012\u0006\u0012\u0004\u0018\u00010)0 H\u0096@¢\u0006\u0002\u00109J\b\u0010:\u001a\u000203H\u0002J\b\u0010;\u001a\u000203H\u0016J\b\u0010<\u001a\u000203H\u0016J\u001a\u0010=\u001a\u0002032\u0006\u0010>\u001a\u00020'H\u0016ø\u0001\u0000¢\u0006\u0004\b?\u0010@J\u001a\u0010A\u001a\u0002032\u0006\u0010B\u001a\u00020CH\u0016ø\u0001\u0000¢\u0006\u0004\bD\u0010@J\u001a\u0010E\u001a\u00020\u000e2\u0006\u0010F\u001a\u00020GH\u0016ø\u0001\u0000¢\u0006\u0004\bH\u0010IJ*\u0010J\u001a\u0002032\u0006\u0010K\u001a\u00020L2\u0006\u0010M\u001a\u00020N2\u0006\u0010O\u001a\u00020PH\u0016ø\u0001\u0000¢\u0006\u0004\bQ\u0010RJ\u001a\u0010S\u001a\u00020\u000e2\u0006\u0010F\u001a\u00020GH\u0016ø\u0001\u0000¢\u0006\u0004\bT\u0010IJ\u001a\u0010U\u001a\u0002032\u0006\u0010B\u001a\u00020CH\u0002ø\u0001\u0000¢\u0006\u0004\bV\u0010@J\b\u0010W\u001a\u000203H\u0002J\b\u0010X\u001a\u00020\u000eH\u0016JN\u0010Y\u001a\u0002032\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\f2\b\u0010\u0007\u001a\u0004\u0018\u00010\b2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000e2\b\u0010\t\u001a\u0004\u0018\u00010\n2\b\u0010\u0010\u001a\u0004\u0018\u00010\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0013J\b\u0010Z\u001a\u000203H\u0002J\f\u0010[\u001a\u000203*\u00020\\H\u0016R\u000e\u0010\u0015\u001a\u00020\u0016X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0018X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u0004\u0018\u00010\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0019\u001a\u0004\u0018\u00010\u001aX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u001cX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u001eX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\bX\u0082\u000e¢\u0006\u0002\n\u0000R@\u0010\u001f\u001a4\u0012\u0013\u0012\u00110!¢\u0006\f\b\"\u0012\b\b#\u0012\u0004\b\b($\u0012\u0013\u0012\u00110!¢\u0006\f\b\"\u0012\b\b#\u0012\u0004\b\b(%\u0012\u0004\u0012\u00020\u000e\u0018\u00010 X\u0082\u000e¢\u0006\u0002\n\u0000R.\u0010&\u001a \b\u0001\u0012\u0004\u0012\u00020'\u0012\n\u0012\b\u0012\u0004\u0012\u00020'0(\u0012\u0006\u0012\u0004\u0018\u00010)\u0018\u00010 X\u0082\u000e¢\u0006\u0004\n\u0002\u0010*R\u000e\u0010+\u001a\u00020,X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010-\u001a\u00020.X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010/\u001a\u00020\u000eX\u0096D¢\u0006\b\n\u0000\u001a\u0004\b0\u00101\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006]"}, d2 = {"Landroidx/compose/foundation/gestures/ScrollableNode;", "Landroidx/compose/foundation/gestures/DragGestureNode;", "Landroidx/compose/ui/input/key/KeyInputModifierNode;", "Landroidx/compose/ui/node/SemanticsModifierNode;", "Landroidx/compose/ui/node/CompositionLocalConsumerModifierNode;", "state", "Landroidx/compose/foundation/gestures/ScrollableState;", "overscrollEffect", "Landroidx/compose/foundation/OverscrollEffect;", "flingBehavior", "Landroidx/compose/foundation/gestures/FlingBehavior;", "orientation", "Landroidx/compose/foundation/gestures/Orientation;", "enabled", "", "reverseDirection", "interactionSource", "Landroidx/compose/foundation/interaction/MutableInteractionSource;", "bringIntoViewSpec", "Landroidx/compose/foundation/gestures/BringIntoViewSpec;", "(Landroidx/compose/foundation/gestures/ScrollableState;Landroidx/compose/foundation/OverscrollEffect;Landroidx/compose/foundation/gestures/FlingBehavior;Landroidx/compose/foundation/gestures/Orientation;ZZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/foundation/gestures/BringIntoViewSpec;)V", "contentInViewNode", "Landroidx/compose/foundation/gestures/ContentInViewNode;", "defaultFlingBehavior", "Landroidx/compose/foundation/gestures/DefaultFlingBehavior;", "mouseWheelScrollingLogic", "Landroidx/compose/foundation/gestures/MouseWheelScrollingLogic;", "nestedScrollConnection", "Landroidx/compose/foundation/gestures/ScrollableNestedScrollConnection;", "nestedScrollDispatcher", "Landroidx/compose/ui/input/nestedscroll/NestedScrollDispatcher;", "scrollByAction", "Lkotlin/Function2;", "", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "x", "y", "scrollByOffsetAction", "Landroidx/compose/ui/geometry/Offset;", "Lkotlin/coroutines/Continuation;", "", "Lkotlin/jvm/functions/Function2;", "scrollableContainerNode", "Landroidx/compose/foundation/gestures/ScrollableContainerNode;", "scrollingLogic", "Landroidx/compose/foundation/gestures/ScrollingLogic;", "shouldAutoInvalidate", "getShouldAutoInvalidate", "()Z", "clearScrollSemanticsActions", "", "drag", "forEachDelta", "Lkotlin/Function1;", "Landroidx/compose/foundation/gestures/DragEvent$DragDelta;", "dragDelta", "(Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "ensureMouseWheelScrollNodeInitialized", "onAttach", "onDensityChange", "onDragStarted", "startedPosition", "onDragStarted-k-4lQ0M", "(J)V", "onDragStopped", "velocity", "Landroidx/compose/ui/unit/Velocity;", "onDragStopped-TH1AsA0", "onKeyEvent", NotificationCompat.CATEGORY_EVENT, "Landroidx/compose/ui/input/key/KeyEvent;", "onKeyEvent-ZmokQxo", "(Landroid/view/KeyEvent;)Z", "onPointerEvent", "pointerEvent", "Landroidx/compose/ui/input/pointer/PointerEvent;", "pass", "Landroidx/compose/ui/input/pointer/PointerEventPass;", "bounds", "Landroidx/compose/ui/unit/IntSize;", "onPointerEvent-H0pRuoY", "(Landroidx/compose/ui/input/pointer/PointerEvent;Landroidx/compose/ui/input/pointer/PointerEventPass;J)V", "onPreKeyEvent", "onPreKeyEvent-ZmokQxo", "onWheelScrollStopped", "onWheelScrollStopped-TH1AsA0", "setScrollSemanticsActions", "startDragImmediately", "update", "updateDefaultFlingBehavior", "applySemantics", "Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ScrollableNode extends DragGestureNode implements KeyInputModifierNode, SemanticsModifierNode, CompositionLocalConsumerModifierNode {
    public static final int $stable = 8;
    private final ContentInViewNode contentInViewNode;
    private final DefaultFlingBehavior defaultFlingBehavior;
    private FlingBehavior flingBehavior;
    private MouseWheelScrollingLogic mouseWheelScrollingLogic;
    private final ScrollableNestedScrollConnection nestedScrollConnection;
    private final NestedScrollDispatcher nestedScrollDispatcher;
    private OverscrollEffect overscrollEffect;
    private Function2<? super Float, ? super Float, Boolean> scrollByAction;
    private Function2<? super Offset, ? super Continuation<? super Offset>, ? extends Object> scrollByOffsetAction;
    private final ScrollableContainerNode scrollableContainerNode;
    private final ScrollingLogic scrollingLogic;
    private final boolean shouldAutoInvalidate;

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public ScrollableNode(androidx.compose.foundation.gestures.ScrollableState r15, androidx.compose.foundation.OverscrollEffect r16, androidx.compose.foundation.gestures.FlingBehavior r17, androidx.compose.foundation.gestures.Orientation r18, boolean r19, boolean r20, androidx.compose.foundation.interaction.MutableInteractionSource r21, androidx.compose.foundation.gestures.BringIntoViewSpec r22) {
        /*
            r14 = this;
            r4 = r18
            r8 = r19
            kotlin.jvm.functions.Function1 r0 = androidx.compose.foundation.gestures.ScrollableKt.access$getCanDragCalculation$p()
            r9 = r21
            r14.<init>(r0, r8, r9, r4)
            r10 = r16
            r14.overscrollEffect = r10
            r11 = r17
            r14.flingBehavior = r11
            androidx.compose.ui.input.nestedscroll.NestedScrollDispatcher r0 = new androidx.compose.ui.input.nestedscroll.NestedScrollDispatcher
            r0.<init>()
            r14.nestedScrollDispatcher = r0
            androidx.compose.foundation.gestures.ScrollableContainerNode r0 = new androidx.compose.foundation.gestures.ScrollableContainerNode
            r0.<init>(r8)
            androidx.compose.ui.node.DelegatableNode r0 = (androidx.compose.ui.node.DelegatableNode) r0
            androidx.compose.ui.node.DelegatableNode r0 = r14.delegate(r0)
            androidx.compose.foundation.gestures.ScrollableContainerNode r0 = (androidx.compose.foundation.gestures.ScrollableContainerNode) r0
            r14.scrollableContainerNode = r0
            androidx.compose.foundation.gestures.DefaultFlingBehavior r0 = new androidx.compose.foundation.gestures.DefaultFlingBehavior
            androidx.compose.foundation.gestures.ScrollableKt$UnityDensity$1 r1 = androidx.compose.foundation.gestures.ScrollableKt.access$getUnityDensity$p()
            androidx.compose.ui.unit.Density r1 = (androidx.compose.ui.unit.Density) r1
            androidx.compose.animation.core.DecayAnimationSpec r1 = androidx.compose.animation.SplineBasedDecayKt.splineBasedDecay(r1)
            r12 = 0
            r13 = 2
            r0.<init>(r1, r12, r13, r12)
            r14.defaultFlingBehavior = r0
            androidx.compose.foundation.OverscrollEffect r2 = r14.overscrollEffect
            androidx.compose.foundation.gestures.FlingBehavior r0 = r14.flingBehavior
            if (r0 != 0) goto L4c
            androidx.compose.foundation.gestures.DefaultFlingBehavior r0 = r14.defaultFlingBehavior
            androidx.compose.foundation.gestures.FlingBehavior r0 = (androidx.compose.foundation.gestures.FlingBehavior) r0
        L4c:
            r3 = r0
            androidx.compose.ui.input.nestedscroll.NestedScrollDispatcher r6 = r14.nestedScrollDispatcher
            androidx.compose.foundation.gestures.ScrollingLogic r0 = new androidx.compose.foundation.gestures.ScrollingLogic
            androidx.compose.foundation.gestures.ScrollableNode$scrollingLogic$1 r1 = new androidx.compose.foundation.gestures.ScrollableNode$scrollingLogic$1
            r1.<init>()
            r7 = r1
            kotlin.jvm.functions.Function0 r7 = (kotlin.jvm.functions.Function0) r7
            r1 = r15
            r5 = r20
            r0.<init>(r1, r2, r3, r4, r5, r6, r7)
            r14.scrollingLogic = r0
            androidx.compose.foundation.gestures.ScrollingLogic r0 = r14.scrollingLogic
            androidx.compose.foundation.gestures.ScrollableNestedScrollConnection r1 = new androidx.compose.foundation.gestures.ScrollableNestedScrollConnection
            r1.<init>(r0, r8)
            r14.nestedScrollConnection = r1
            androidx.compose.foundation.gestures.ContentInViewNode r0 = new androidx.compose.foundation.gestures.ContentInViewNode
            androidx.compose.foundation.gestures.ScrollingLogic r1 = r14.scrollingLogic
            r2 = r22
            r0.<init>(r4, r1, r5, r2)
            androidx.compose.ui.node.DelegatableNode r0 = (androidx.compose.ui.node.DelegatableNode) r0
            androidx.compose.ui.node.DelegatableNode r0 = r14.delegate(r0)
            androidx.compose.foundation.gestures.ContentInViewNode r0 = (androidx.compose.foundation.gestures.ContentInViewNode) r0
            r14.contentInViewNode = r0
            androidx.compose.foundation.gestures.ScrollableNestedScrollConnection r0 = r14.nestedScrollConnection
            androidx.compose.ui.input.nestedscroll.NestedScrollConnection r0 = (androidx.compose.ui.input.nestedscroll.NestedScrollConnection) r0
            androidx.compose.ui.input.nestedscroll.NestedScrollDispatcher r1 = r14.nestedScrollDispatcher
            androidx.compose.ui.node.DelegatableNode r0 = androidx.compose.ui.input.nestedscroll.NestedScrollNodeKt.nestedScrollModifierNode(r0, r1)
            r14.delegate(r0)
            androidx.compose.ui.focus.Focusability$Companion r0 = androidx.compose.ui.focus.Focusability.Companion
            int r0 = r0.m3985getNeverLCbbffg()
            androidx.compose.ui.focus.FocusTargetModifierNode r0 = androidx.compose.ui.focus.FocusTargetModifierNodeKt.m3966FocusTargetModifierNodePYyLHbc$default(r0, r12, r13, r12)
            androidx.compose.ui.node.DelegatableNode r0 = (androidx.compose.ui.node.DelegatableNode) r0
            r14.delegate(r0)
            androidx.compose.foundation.relocation.BringIntoViewResponderNode r0 = new androidx.compose.foundation.relocation.BringIntoViewResponderNode
            androidx.compose.foundation.gestures.ContentInViewNode r1 = r14.contentInViewNode
            androidx.compose.foundation.relocation.BringIntoViewResponder r1 = (androidx.compose.foundation.relocation.BringIntoViewResponder) r1
            r0.<init>(r1)
            androidx.compose.ui.node.DelegatableNode r0 = (androidx.compose.ui.node.DelegatableNode) r0
            r14.delegate(r0)
            androidx.compose.foundation.FocusedBoundsObserverNode r0 = new androidx.compose.foundation.FocusedBoundsObserverNode
            androidx.compose.foundation.gestures.ScrollableNode$1 r1 = new androidx.compose.foundation.gestures.ScrollableNode$1
            r1.<init>()
            kotlin.jvm.functions.Function1 r1 = (kotlin.jvm.functions.Function1) r1
            r0.<init>(r1)
            androidx.compose.ui.node.DelegatableNode r0 = (androidx.compose.ui.node.DelegatableNode) r0
            r14.delegate(r0)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.gestures.ScrollableNode.<init>(androidx.compose.foundation.gestures.ScrollableState, androidx.compose.foundation.OverscrollEffect, androidx.compose.foundation.gestures.FlingBehavior, androidx.compose.foundation.gestures.Orientation, boolean, boolean, androidx.compose.foundation.interaction.MutableInteractionSource, androidx.compose.foundation.gestures.BringIntoViewSpec):void");
    }

    @Override // androidx.compose.ui.Modifier.Node
    public boolean getShouldAutoInvalidate() {
        return this.shouldAutoInvalidate;
    }

    @Override // androidx.compose.foundation.gestures.DragGestureNode
    public Object drag(Function2<? super Function1<? super DragEvent.DragDelta, Unit>, ? super Continuation<? super Unit>, ? extends Object> function2, Continuation<? super Unit> continuation) {
        ScrollingLogic $this$drag_u24lambda_u240 = this.scrollingLogic;
        Object scroll = $this$drag_u24lambda_u240.scroll(MutatePriority.UserInput, new ScrollableNode$drag$2$1(function2, $this$drag_u24lambda_u240, null), continuation);
        return scroll == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? scroll : Unit.INSTANCE;
    }

    @Override // androidx.compose.foundation.gestures.DragGestureNode
    /* renamed from: onDragStarted-k-4lQ0M */
    public void mo662onDragStartedk4lQ0M(long startedPosition) {
    }

    @Override // androidx.compose.foundation.gestures.DragGestureNode
    /* renamed from: onDragStopped-TH1AsA0 */
    public void mo663onDragStoppedTH1AsA0(long velocity) {
        BuildersKt__Builders_commonKt.launch$default(this.nestedScrollDispatcher.getCoroutineScope(), null, null, new ScrollableNode$onDragStopped$1(this, velocity, null), 3, null);
    }

    /* renamed from: onWheelScrollStopped-TH1AsA0  reason: not valid java name */
    private final void m766onWheelScrollStoppedTH1AsA0(long velocity) {
        BuildersKt__Builders_commonKt.launch$default(this.nestedScrollDispatcher.getCoroutineScope(), null, null, new ScrollableNode$onWheelScrollStopped$1(this, velocity, null), 3, null);
    }

    @Override // androidx.compose.foundation.gestures.DragGestureNode
    public boolean startDragImmediately() {
        return this.scrollingLogic.shouldScrollImmediately();
    }

    private final void ensureMouseWheelScrollNodeInitialized() {
        if (this.mouseWheelScrollingLogic == null) {
            this.mouseWheelScrollingLogic = new MouseWheelScrollingLogic(this.scrollingLogic, AndroidScrollable_androidKt.platformScrollConfig(this), new ScrollableNode$ensureMouseWheelScrollNodeInitialized$1(this), DelegatableNodeKt.requireDensity(this));
        }
        MouseWheelScrollingLogic mouseWheelScrollingLogic = this.mouseWheelScrollingLogic;
        if (mouseWheelScrollingLogic != null) {
            mouseWheelScrollingLogic.startReceivingMouseWheelEvents(getCoroutineScope());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final /* synthetic */ Object ensureMouseWheelScrollNodeInitialized$onWheelScrollStopped(ScrollableNode $this$ensureMouseWheelScrollNodeInitialized_u24onWheelScrollStopped, long p0, Continuation $completion) {
        $this$ensureMouseWheelScrollNodeInitialized_u24onWheelScrollStopped.m766onWheelScrollStoppedTH1AsA0(p0);
        return Unit.INSTANCE;
    }

    public final void update(ScrollableState state, Orientation orientation, OverscrollEffect overscrollEffect, boolean enabled, boolean reverseDirection, FlingBehavior flingBehavior, MutableInteractionSource interactionSource, BringIntoViewSpec bringIntoViewSpec) {
        boolean shouldInvalidateSemantics;
        Function1<? super PointerInputChange, Boolean> function1;
        if (getEnabled() != enabled) {
            this.nestedScrollConnection.setEnabled(enabled);
            this.scrollableContainerNode.update(enabled);
            shouldInvalidateSemantics = true;
        } else {
            shouldInvalidateSemantics = false;
        }
        FlingBehavior resolvedFlingBehavior = flingBehavior == null ? this.defaultFlingBehavior : flingBehavior;
        boolean resetPointerInputHandling = this.scrollingLogic.update(state, orientation, overscrollEffect, reverseDirection, resolvedFlingBehavior, this.nestedScrollDispatcher);
        this.contentInViewNode.update(orientation, reverseDirection, bringIntoViewSpec);
        this.overscrollEffect = overscrollEffect;
        this.flingBehavior = flingBehavior;
        function1 = ScrollableKt.CanDragCalculation;
        update(function1, enabled, interactionSource, this.scrollingLogic.isVertical() ? Orientation.Vertical : Orientation.Horizontal, resetPointerInputHandling);
        if (shouldInvalidateSemantics) {
            clearScrollSemanticsActions();
            SemanticsModifierNodeKt.invalidateSemantics(this);
        }
    }

    @Override // androidx.compose.ui.Modifier.Node
    public void onAttach() {
        updateDefaultFlingBehavior();
        MouseWheelScrollingLogic mouseWheelScrollingLogic = this.mouseWheelScrollingLogic;
        if (mouseWheelScrollingLogic != null) {
            mouseWheelScrollingLogic.updateDensity(DelegatableNodeKt.requireDensity(this));
        }
    }

    private final void updateDefaultFlingBehavior() {
        if (isAttached()) {
            Density density = DelegatableNodeKt.requireDensity(this);
            this.defaultFlingBehavior.updateDensity(density);
        }
    }

    @Override // androidx.compose.ui.node.DelegatableNode, androidx.compose.ui.node.PointerInputModifierNode
    public void onDensityChange() {
        onCancelPointerInput();
        updateDefaultFlingBehavior();
        MouseWheelScrollingLogic mouseWheelScrollingLogic = this.mouseWheelScrollingLogic;
        if (mouseWheelScrollingLogic != null) {
            mouseWheelScrollingLogic.updateDensity(DelegatableNodeKt.requireDensity(this));
        }
    }

    @Override // androidx.compose.ui.input.key.KeyInputModifierNode
    /* renamed from: onKeyEvent-ZmokQxo */
    public boolean mo471onKeyEventZmokQxo(KeyEvent event) {
        float xAmount;
        long scrollAmount;
        float yAmount;
        if (getEnabled() && ((Key.m5060equalsimpl0(KeyEvent_androidKt.m5368getKeyZmokQxo(event), Key.Companion.m5248getPageDownEK5gGoQ()) || Key.m5060equalsimpl0(KeyEvent_androidKt.m5368getKeyZmokQxo(event), Key.Companion.m5249getPageUpEK5gGoQ())) && KeyEventType.m5361equalsimpl0(KeyEvent_androidKt.m5369getTypeZmokQxo(event), KeyEventType.Companion.m5365getKeyDownCS__XNY()) && !KeyEvent_androidKt.m5372isCtrlPressedZmokQxo(event))) {
            boolean isVertical = this.scrollingLogic.isVertical();
            ContentInViewNode contentInViewNode = this.contentInViewNode;
            if (isVertical) {
                long arg0$iv = contentInViewNode.m677getViewportSizeYbymL2g$foundation_release();
                int viewportHeight = (int) (arg0$iv & 4294967295L);
                if (Key.m5060equalsimpl0(KeyEvent_androidKt.m5368getKeyZmokQxo(event), Key.Companion.m5249getPageUpEK5gGoQ())) {
                    yAmount = viewportHeight;
                } else {
                    yAmount = -viewportHeight;
                }
                long v1$iv$iv = Float.floatToRawIntBits(0.0f);
                long v2$iv$iv = Float.floatToRawIntBits(yAmount);
                scrollAmount = Offset.m4040constructorimpl((4294967295L & v2$iv$iv) | (v1$iv$iv << 32));
            } else {
                long arg0$iv2 = contentInViewNode.m677getViewportSizeYbymL2g$foundation_release();
                int viewportWidth = (int) (arg0$iv2 >> 32);
                if (Key.m5060equalsimpl0(KeyEvent_androidKt.m5368getKeyZmokQxo(event), Key.Companion.m5249getPageUpEK5gGoQ())) {
                    xAmount = viewportWidth;
                } else {
                    xAmount = -viewportWidth;
                }
                long v1$iv$iv2 = Float.floatToRawIntBits(xAmount);
                long v2$iv$iv2 = Float.floatToRawIntBits(0.0f);
                scrollAmount = Offset.m4040constructorimpl((4294967295L & v2$iv$iv2) | (v1$iv$iv2 << 32));
            }
            BuildersKt__Builders_commonKt.launch$default(getCoroutineScope(), null, null, new ScrollableNode$onKeyEvent$1(this, scrollAmount, null), 3, null);
            return true;
        }
        return false;
    }

    @Override // androidx.compose.ui.input.key.KeyInputModifierNode
    /* renamed from: onPreKeyEvent-ZmokQxo */
    public boolean mo473onPreKeyEventZmokQxo(KeyEvent event) {
        return false;
    }

    @Override // androidx.compose.foundation.gestures.DragGestureNode, androidx.compose.ui.node.PointerInputModifierNode
    /* renamed from: onPointerEvent-H0pRuoY */
    public void mo472onPointerEventH0pRuoY(PointerEvent pointerEvent, PointerEventPass pass, long bounds) {
        boolean z;
        List $this$fastAny$iv = pointerEvent.getChanges();
        int index$iv$iv = 0;
        int size = $this$fastAny$iv.size();
        while (true) {
            if (index$iv$iv < size) {
                Object item$iv$iv = $this$fastAny$iv.get(index$iv$iv);
                PointerInputChange it = (PointerInputChange) item$iv$iv;
                if (getCanDrag().invoke(it).booleanValue()) {
                    z = true;
                    break;
                }
                index$iv$iv++;
            } else {
                z = false;
                break;
            }
        }
        if (z) {
            super.mo472onPointerEventH0pRuoY(pointerEvent, pass, bounds);
        }
        if (getEnabled()) {
            if (pass == PointerEventPass.Initial && PointerEventType.m5461equalsimpl0(pointerEvent.m5454getType7fucELk(), PointerEventType.Companion.m5470getScroll7fucELk())) {
                ensureMouseWheelScrollNodeInitialized();
            }
            MouseWheelScrollingLogic mouseWheelScrollingLogic = this.mouseWheelScrollingLogic;
            if (mouseWheelScrollingLogic != null) {
                mouseWheelScrollingLogic.m729onPointerEventH0pRuoY(pointerEvent, pass, bounds);
            }
        }
    }

    @Override // androidx.compose.ui.node.SemanticsModifierNode
    public void applySemantics(SemanticsPropertyReceiver $this$applySemantics) {
        if (getEnabled() && (this.scrollByAction == null || this.scrollByOffsetAction == null)) {
            setScrollSemanticsActions();
        }
        Function2 it = this.scrollByAction;
        if (it != null) {
            SemanticsPropertiesKt.scrollBy$default($this$applySemantics, null, it, 1, null);
        }
        Function2 it2 = this.scrollByOffsetAction;
        if (it2 != null) {
            SemanticsPropertiesKt.scrollByOffset($this$applySemantics, it2);
        }
    }

    private final void setScrollSemanticsActions() {
        this.scrollByAction = new Function2<Float, Float, Boolean>() { // from class: androidx.compose.foundation.gestures.ScrollableNode$setScrollSemanticsActions$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(2);
            }

            /* JADX INFO: Access modifiers changed from: package-private */
            /* compiled from: Scrollable.kt */
            @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
            @DebugMetadata(c = "androidx.compose.foundation.gestures.ScrollableNode$setScrollSemanticsActions$1$1", f = "Scrollable.kt", i = {}, l = {TIFFConstants.TIFFTAG_JPEGPOINTTRANSFORM}, m = "invokeSuspend", n = {}, s = {})
            /* renamed from: androidx.compose.foundation.gestures.ScrollableNode$setScrollSemanticsActions$1$1  reason: invalid class name */
            /* loaded from: classes.dex */
            public static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
                final /* synthetic */ float $x;
                final /* synthetic */ float $y;
                int label;
                final /* synthetic */ ScrollableNode this$0;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                AnonymousClass1(ScrollableNode scrollableNode, float f, float f2, Continuation<? super AnonymousClass1> continuation) {
                    super(2, continuation);
                    this.this$0 = scrollableNode;
                    this.$x = f;
                    this.$y = f2;
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                    return new AnonymousClass1(this.this$0, this.$x, this.$y, continuation);
                }

                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
                    return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                public final Object invokeSuspend(Object $result) {
                    ScrollingLogic scrollingLogic;
                    Object m763semanticsScrollByd4ec7I;
                    Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                    switch (this.label) {
                        case 0:
                            ResultKt.throwOnFailure($result);
                            scrollingLogic = this.this$0.scrollingLogic;
                            float x$iv = this.$x;
                            float y$iv = this.$y;
                            long v1$iv$iv = Float.floatToRawIntBits(x$iv);
                            long v2$iv$iv = Float.floatToRawIntBits(y$iv);
                            this.label = 1;
                            m763semanticsScrollByd4ec7I = ScrollableKt.m763semanticsScrollByd4ec7I(scrollingLogic, Offset.m4040constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv)), this);
                            if (m763semanticsScrollByd4ec7I == coroutine_suspended) {
                                return coroutine_suspended;
                            }
                            break;
                        case 1:
                            ResultKt.throwOnFailure($result);
                            break;
                        default:
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    return Unit.INSTANCE;
                }
            }

            @Override // kotlin.jvm.functions.Function2
            public /* bridge */ /* synthetic */ Boolean invoke(Float f, Float f2) {
                return invoke(f.floatValue(), f2.floatValue());
            }

            public final Boolean invoke(float x, float y) {
                BuildersKt__Builders_commonKt.launch$default(ScrollableNode.this.getCoroutineScope(), null, null, new AnonymousClass1(ScrollableNode.this, x, y, null), 3, null);
                return true;
            }
        };
        this.scrollByOffsetAction = new ScrollableNode$setScrollSemanticsActions$2(this, null);
    }

    private final void clearScrollSemanticsActions() {
        this.scrollByAction = null;
        this.scrollByOffsetAction = null;
    }
}
