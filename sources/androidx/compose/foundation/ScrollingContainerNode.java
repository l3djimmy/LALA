package androidx.compose.foundation;

import androidx.compose.foundation.gestures.BringIntoViewSpec;
import androidx.compose.foundation.gestures.FlingBehavior;
import androidx.compose.foundation.gestures.Orientation;
import androidx.compose.foundation.gestures.ScrollableDefaults;
import androidx.compose.foundation.gestures.ScrollableNode;
import androidx.compose.foundation.gestures.ScrollableState;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.ui.node.CompositionLocalConsumerModifierNode;
import androidx.compose.ui.node.CompositionLocalConsumerModifierNodeKt;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.ObserverModifierNode;
import androidx.compose.ui.node.ObserverModifierNodeKt;
import androidx.compose.ui.unit.LayoutDirection;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: ScrollingContainer.kt */
@Metadata(d1 = {"\u0000`\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\b\b\u0002\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003BU\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\t\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\f\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u000e\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010\u0012\u0006\u0010\u0011\u001a\u00020\t\u0012\b\u0010\u0012\u001a\u0004\u0018\u00010\u0013¢\u0006\u0002\u0010\u0014J\b\u0010 \u001a\u00020!H\u0002J\b\u0010\"\u001a\u0004\u0018\u00010\u0013J\b\u0010#\u001a\u00020!H\u0016J\b\u0010$\u001a\u00020!H\u0016J\b\u0010%\u001a\u00020!H\u0016J\b\u0010&\u001a\u00020!H\u0016J\u0006\u0010\u001f\u001a\u00020\tJV\u0010'\u001a\u00020!2\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0011\u001a\u00020\t2\b\u0010(\u001a\u0004\u0018\u00010\u00132\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\t2\b\u0010\u000b\u001a\u0004\u0018\u00010\f2\b\u0010\r\u001a\u0004\u0018\u00010\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010R\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0015\u001a\u0004\u0018\u00010\u0016X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0017\u001a\u0004\u0018\u00010\u0013X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0018\u001a\u0004\u0018\u00010\u0019X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u001a\u001a\u0004\u0018\u00010\u001bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u001c\u001a\u00020\tX\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u001eR\u000e\u0010\u001f\u001a\u00020\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u0013X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006)"}, d2 = {"Landroidx/compose/foundation/ScrollingContainerNode;", "Landroidx/compose/ui/node/DelegatingNode;", "Landroidx/compose/ui/node/CompositionLocalConsumerModifierNode;", "Landroidx/compose/ui/node/ObserverModifierNode;", "state", "Landroidx/compose/foundation/gestures/ScrollableState;", "orientation", "Landroidx/compose/foundation/gestures/Orientation;", "enabled", "", "reverseScrolling", "flingBehavior", "Landroidx/compose/foundation/gestures/FlingBehavior;", "interactionSource", "Landroidx/compose/foundation/interaction/MutableInteractionSource;", "bringIntoViewSpec", "Landroidx/compose/foundation/gestures/BringIntoViewSpec;", "useLocalOverscrollFactory", "userProvidedOverscrollEffect", "Landroidx/compose/foundation/OverscrollEffect;", "(Landroidx/compose/foundation/gestures/ScrollableState;Landroidx/compose/foundation/gestures/Orientation;ZZLandroidx/compose/foundation/gestures/FlingBehavior;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/foundation/gestures/BringIntoViewSpec;ZLandroidx/compose/foundation/OverscrollEffect;)V", "localOverscrollFactory", "Landroidx/compose/foundation/OverscrollFactory;", "localOverscrollFactoryCreatedOverscrollEffect", "overscrollNode", "Landroidx/compose/ui/node/DelegatableNode;", "scrollableNode", "Landroidx/compose/foundation/gestures/ScrollableNode;", "shouldAutoInvalidate", "getShouldAutoInvalidate", "()Z", "shouldReverseDirection", "attachOverscrollNodeIfNeeded", "", "getOverscrollEffect", "onAttach", "onDetach", "onLayoutDirectionChange", "onObservedReadsChanged", "update", "overscrollEffect", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
final class ScrollingContainerNode extends DelegatingNode implements CompositionLocalConsumerModifierNode, ObserverModifierNode {
    private BringIntoViewSpec bringIntoViewSpec;
    private boolean enabled;
    private FlingBehavior flingBehavior;
    private MutableInteractionSource interactionSource;
    private OverscrollFactory localOverscrollFactory;
    private OverscrollEffect localOverscrollFactoryCreatedOverscrollEffect;
    private Orientation orientation;
    private DelegatableNode overscrollNode;
    private boolean reverseScrolling;
    private ScrollableNode scrollableNode;
    private final boolean shouldAutoInvalidate;
    private boolean shouldReverseDirection;
    private ScrollableState state;
    private boolean useLocalOverscrollFactory;
    private OverscrollEffect userProvidedOverscrollEffect;

    public ScrollingContainerNode(ScrollableState state, Orientation orientation, boolean enabled, boolean reverseScrolling, FlingBehavior flingBehavior, MutableInteractionSource interactionSource, BringIntoViewSpec bringIntoViewSpec, boolean useLocalOverscrollFactory, OverscrollEffect userProvidedOverscrollEffect) {
        this.state = state;
        this.orientation = orientation;
        this.enabled = enabled;
        this.reverseScrolling = reverseScrolling;
        this.flingBehavior = flingBehavior;
        this.interactionSource = interactionSource;
        this.bringIntoViewSpec = bringIntoViewSpec;
        this.useLocalOverscrollFactory = useLocalOverscrollFactory;
        this.userProvidedOverscrollEffect = userProvidedOverscrollEffect;
    }

    @Override // androidx.compose.ui.Modifier.Node
    public boolean getShouldAutoInvalidate() {
        return this.shouldAutoInvalidate;
    }

    public final OverscrollEffect getOverscrollEffect() {
        if (this.useLocalOverscrollFactory) {
            return this.localOverscrollFactoryCreatedOverscrollEffect;
        }
        return this.userProvidedOverscrollEffect;
    }

    @Override // androidx.compose.ui.Modifier.Node
    public void onAttach() {
        this.shouldReverseDirection = shouldReverseDirection();
        attachOverscrollNodeIfNeeded();
        if (this.scrollableNode == null) {
            this.scrollableNode = (ScrollableNode) delegate(new ScrollableNode(this.state, getOverscrollEffect(), this.flingBehavior, this.orientation, this.enabled, this.shouldReverseDirection, this.interactionSource, this.bringIntoViewSpec));
        }
    }

    @Override // androidx.compose.ui.Modifier.Node
    public void onDetach() {
        DelegatableNode it = this.overscrollNode;
        if (it != null) {
            undelegate(it);
        }
    }

    @Override // androidx.compose.ui.node.DelegatableNode
    public void onLayoutDirectionChange() {
        boolean reverseDirection = shouldReverseDirection();
        if (this.shouldReverseDirection != reverseDirection) {
            this.shouldReverseDirection = reverseDirection;
            update(this.state, this.orientation, this.useLocalOverscrollFactory, getOverscrollEffect(), this.enabled, this.reverseScrolling, this.flingBehavior, this.interactionSource, this.bringIntoViewSpec);
        }
    }

    public final void update(ScrollableState state, Orientation orientation, boolean useLocalOverscrollFactory, OverscrollEffect overscrollEffect, boolean enabled, boolean reverseScrolling, FlingBehavior flingBehavior, MutableInteractionSource interactionSource, BringIntoViewSpec bringIntoViewSpec) {
        boolean useLocalOverscrollFactoryChanged;
        boolean overscrollEffectChanged;
        this.state = state;
        this.orientation = orientation;
        if (this.useLocalOverscrollFactory == useLocalOverscrollFactory) {
            useLocalOverscrollFactoryChanged = false;
        } else {
            this.useLocalOverscrollFactory = useLocalOverscrollFactory;
            useLocalOverscrollFactoryChanged = true;
        }
        if (Intrinsics.areEqual(this.userProvidedOverscrollEffect, overscrollEffect)) {
            overscrollEffectChanged = false;
        } else {
            this.userProvidedOverscrollEffect = overscrollEffect;
            overscrollEffectChanged = true;
        }
        if (useLocalOverscrollFactoryChanged || (overscrollEffectChanged && !useLocalOverscrollFactory)) {
            DelegatableNode it = this.overscrollNode;
            if (it != null) {
                undelegate(it);
            }
            this.overscrollNode = null;
            attachOverscrollNodeIfNeeded();
        }
        this.enabled = enabled;
        this.reverseScrolling = reverseScrolling;
        this.flingBehavior = flingBehavior;
        this.interactionSource = interactionSource;
        this.bringIntoViewSpec = bringIntoViewSpec;
        this.shouldReverseDirection = shouldReverseDirection();
        ScrollableNode scrollableNode = this.scrollableNode;
        if (scrollableNode != null) {
            scrollableNode.update(state, orientation, getOverscrollEffect(), enabled, this.shouldReverseDirection, flingBehavior, interactionSource, bringIntoViewSpec);
        }
    }

    public final boolean shouldReverseDirection() {
        LayoutDirection layoutDirection = LayoutDirection.Ltr;
        if (isAttached()) {
            layoutDirection = DelegatableNodeKt.requireLayoutDirection(this);
        }
        return ScrollableDefaults.INSTANCE.reverseDirection(layoutDirection, this.orientation, this.reverseScrolling);
    }

    private final void attachOverscrollNodeIfNeeded() {
        if (this.overscrollNode == null) {
            if (this.useLocalOverscrollFactory) {
                ObserverModifierNodeKt.observeReads(this, new Function0<Unit>() { // from class: androidx.compose.foundation.ScrollingContainerNode$attachOverscrollNodeIfNeeded$1
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
                        OverscrollFactory overscrollFactory;
                        ScrollingContainerNode.this.localOverscrollFactory = (OverscrollFactory) CompositionLocalConsumerModifierNodeKt.currentValueOf(ScrollingContainerNode.this, OverscrollKt.getLocalOverscrollFactory());
                        ScrollingContainerNode scrollingContainerNode = ScrollingContainerNode.this;
                        overscrollFactory = ScrollingContainerNode.this.localOverscrollFactory;
                        scrollingContainerNode.localOverscrollFactoryCreatedOverscrollEffect = overscrollFactory != null ? overscrollFactory.createOverscrollEffect() : null;
                    }
                });
            }
            OverscrollEffect effect = getOverscrollEffect();
            if (effect != null) {
                DelegatableNode node = effect.getNode();
                if (!node.getNode().isAttached()) {
                    this.overscrollNode = delegate(node);
                    return;
                }
                return;
            }
            return;
        }
        DelegatableNode it = this.overscrollNode;
        if (it != null && !it.getNode().isAttached()) {
            delegate(it);
        }
    }

    @Override // androidx.compose.ui.node.ObserverModifierNode
    public void onObservedReadsChanged() {
        OverscrollFactory factory = (OverscrollFactory) CompositionLocalConsumerModifierNodeKt.currentValueOf(this, OverscrollKt.getLocalOverscrollFactory());
        if (!Intrinsics.areEqual(factory, this.localOverscrollFactory)) {
            this.localOverscrollFactory = factory;
            this.localOverscrollFactoryCreatedOverscrollEffect = null;
            DelegatableNode it = this.overscrollNode;
            if (it != null) {
                undelegate(it);
            }
            this.overscrollNode = null;
            attachOverscrollNodeIfNeeded();
            ScrollableNode scrollableNode = this.scrollableNode;
            if (scrollableNode != null) {
                scrollableNode.update(this.state, this.orientation, getOverscrollEffect(), this.enabled, this.shouldReverseDirection, this.flingBehavior, this.interactionSource, this.bringIntoViewSpec);
            }
        }
    }
}
