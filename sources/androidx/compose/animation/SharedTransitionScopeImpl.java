package androidx.compose.animation;

import androidx.collection.MutableScatterMap;
import androidx.collection.ScatterMap;
import androidx.compose.animation.SharedTransitionScope;
import androidx.compose.animation.core.Transition;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.snapshots.SnapshotStateList;
import androidx.compose.runtime.snapshots.SnapshotStateObserver;
import androidx.compose.ui.ComposedModifierKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.graphics.AndroidPath_androidKt;
import androidx.compose.ui.graphics.OutlineKt;
import androidx.compose.ui.graphics.Path;
import androidx.compose.ui.graphics.Shape;
import androidx.compose.ui.graphics.drawscope.ContentDrawScope;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.layout.LookaheadScope;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.exifinterface.media.ExifInterface;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.comparisons.ComparisonsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: SharedTransitionScope.kt */
@Metadata(d1 = {"\u0000è\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0007\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\t\b\u0001\u0018\u0000 \u0083\u00012\u00020\u00012\u00020\u0002:\u0004\u0083\u0001\u0084\u0001B\u0017\b\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\u0010\u00102\u001a\u0002032\u0006\u00104\u001a\u000205H\u0016J\u0015\u00106\u001a\u00020\u001d2\u0006\u00107\u001a\u00020*H\u0000¢\u0006\u0002\b8J\u0015\u00109\u001a\u00020\u001d2\u0006\u00107\u001a\u00020:H\u0000¢\u0006\u0002\b;J\b\u0010<\u001a\u00020\u001dH\u0002J7\u0010=\u001a\u00020\u001d2\u0006\u00107\u001a\u00020+2\u0012\u0010>\u001a\u000e\u0012\u0004\u0012\u00020+\u0012\u0004\u0012\u00020\u001d0-2\f\u0010?\u001a\b\u0012\u0004\u0012\u00020\u001d0\u001cH\u0000¢\u0006\u0002\b@J\r\u0010A\u001a\u00020\u001dH\u0000¢\u0006\u0002\bBJ\u0015\u0010C\u001a\u00020\u001d2\u0006\u0010D\u001a\u00020$H\u0000¢\u0006\u0002\bEJ\u0015\u0010F\u001a\u00020\u001d2\u0006\u0010D\u001a\u00020$H\u0000¢\u0006\u0002\bGJ\u0015\u0010H\u001a\u00020\u001d2\u0006\u0010I\u001a\u00020JH\u0000¢\u0006\u0002\bKJ\u0015\u0010L\u001a\u00020\u001d2\u0006\u0010I\u001a\u00020JH\u0000¢\u0006\u0002\bMJ\u0015\u0010N\u001a\u00020O2\u0006\u0010P\u001a\u00020*H\u0017¢\u0006\u0002\u0010QJM\u0010R\u001a\u00020J2\u0006\u0010S\u001a\u00020+2\u0006\u0010T\u001a\u00020U2\u0006\u0010V\u001a\u00020W2\u0006\u0010X\u001a\u00020\n2\u0006\u0010Y\u001a\u00020O2\u0006\u0010Z\u001a\u0002032\u0006\u0010[\u001a\u00020\\2\u0006\u0010]\u001a\u00020\nH\u0003¢\u0006\u0002\u0010^J\u0010\u0010_\u001a\u00020+2\u0006\u0010P\u001a\u00020*H\u0002J\b\u0010,\u001a\u00020\u001dH\u0002J3\u0010`\u001a\u00020a*\u00020\u00142\u0006\u0010b\u001a\u00020\u00142\b\b\u0002\u0010c\u001a\u00020a2\b\b\u0002\u0010d\u001a\u00020\nH\u0096\u0001ø\u0001\u0000¢\u0006\u0004\be\u0010fJ>\u0010g\u001a\u00020h*\u00020h2\f\u0010i\u001a\b\u0012\u0004\u0012\u00020\n0\u001c2\u0006\u0010[\u001a\u00020\\2\u001a\u0010Z\u001a\u0016\u0012\u0004\u0012\u00020k\u0012\u0004\u0012\u00020l\u0012\u0006\u0012\u0004\u0018\u00010m0jH\u0016J\\\u0010n\u001a\u00020h*\u00020h2\u0006\u0010Y\u001a\u00020O2\u0006\u0010o\u001a\u00020p2\u0006\u0010q\u001a\u00020r2\u0006\u0010s\u001a\u00020t2\u0006\u0010u\u001a\u00020v2\u0006\u0010w\u001a\u00020x2\u0006\u0010V\u001a\u00020W2\u0006\u0010]\u001a\u00020\n2\u0006\u0010[\u001a\u00020\\2\u0006\u0010Z\u001a\u000203H\u0016Jp\u0010y\u001a\u00020h\"\u0004\b\u0000\u0010z*\u00020h2\u0006\u0010Y\u001a\u00020O2\u000e\u0010{\u001a\n\u0012\u0004\u0012\u0002Hz\u0018\u00010|2\u0012\u0010}\u001a\u000e\u0012\u0004\u0012\u0002Hz\u0012\u0004\u0012\u00020\n0-2\u0006\u0010u\u001a\u00020v2\b\b\u0002\u0010V\u001a\u00020W2\u0006\u0010X\u001a\u00020\n2\u0006\u0010]\u001a\u00020\n2\u0006\u0010[\u001a\u00020\\2\u0006\u0010Z\u001a\u000203H\u0002JS\u0010~\u001a\u00020h*\u00020h2\u0006\u0010Y\u001a\u00020O2\u0006\u0010}\u001a\u00020\n2\b\b\u0002\u0010u\u001a\u00020v2\b\b\u0002\u0010V\u001a\u00020W2\b\b\u0002\u0010]\u001a\u00020\n2\b\b\u0002\u0010[\u001a\u00020\\2\b\b\u0002\u0010Z\u001a\u000203H\u0000¢\u0006\u0002\b\u007fJD\u0010S\u001a\u00020h*\u00020h2\u0006\u0010Y\u001a\u00020O2\u0006\u0010o\u001a\u00020p2\u0006\u0010u\u001a\u00020v2\u0006\u0010V\u001a\u00020W2\u0006\u0010]\u001a\u00020\n2\u0006\u0010[\u001a\u00020\\2\u0006\u0010Z\u001a\u000203H\u0016JE\u0010\u0080\u0001\u001a\u00020h*\u00020h2\u0006\u0010Y\u001a\u00020O2\u0006\u0010}\u001a\u00020\n2\u0006\u0010u\u001a\u00020v2\u0006\u0010V\u001a\u00020W2\u0006\u0010]\u001a\u00020\n2\u0006\u0010[\u001a\u00020\\2\u0006\u0010Z\u001a\u000203H\u0016J\r\u0010\u0081\u0001\u001a\u00020h*\u00020hH\u0016J\u000e\u0010\u0082\u0001\u001a\u00020\u0014*\u00020\u0014H\u0096\u0001R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u001e\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\n@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR+\u0010\u000e\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\n8V@RX\u0096\u008e\u0002¢\u0006\u0012\n\u0004\b\u0011\u0010\u0012\u001a\u0004\b\u000e\u0010\r\"\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0013\u001a\u00020\u00148@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0015\u0010\u0016R\u001c\u0010\u0017\u001a\u0004\u0018\u00010\u0014X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0018\u0010\u0016\"\u0004\b\u0019\u0010\u001aR\u0014\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u001d0\u001cX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u001e\u001a\u00020\u001f8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b \u0010!R\u0014\u0010\"\u001a\b\u0012\u0004\u0012\u00020$0#X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010%\u001a\u00020\u0014X\u0080.¢\u0006\u000e\n\u0000\u001a\u0004\b&\u0010\u0016\"\u0004\b'\u0010\u001aR\u001a\u0010(\u001a\u000e\u0012\u0004\u0012\u00020*\u0012\u0004\u0012\u00020+0)X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010,\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u001d0-X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010.\u001a\u00020\u0014*\u00020/X\u0096\u0005¢\u0006\u0006\u001a\u0004\b0\u00101\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0085\u0001"}, d2 = {"Landroidx/compose/animation/SharedTransitionScopeImpl;", "Landroidx/compose/animation/SharedTransitionScope;", "Landroidx/compose/ui/layout/LookaheadScope;", "lookaheadScope", "coroutineScope", "Lkotlinx/coroutines/CoroutineScope;", "(Landroidx/compose/ui/layout/LookaheadScope;Lkotlinx/coroutines/CoroutineScope;)V", "getCoroutineScope", "()Lkotlinx/coroutines/CoroutineScope;", "<set-?>", "", "disposed", "getDisposed$animation", "()Z", "isTransitionActive", "setTransitionActive", "(Z)V", "isTransitionActive$delegate", "Landroidx/compose/runtime/MutableState;", "lookaheadRoot", "Landroidx/compose/ui/layout/LayoutCoordinates;", "getLookaheadRoot$animation", "()Landroidx/compose/ui/layout/LayoutCoordinates;", "nullableLookaheadRoot", "getNullableLookaheadRoot$animation", "setNullableLookaheadRoot$animation", "(Landroidx/compose/ui/layout/LayoutCoordinates;)V", "observeAnimatingBlock", "Lkotlin/Function0;", "", "observerForTest", "Landroidx/compose/runtime/snapshots/SnapshotStateObserver;", "getObserverForTest$animation", "()Landroidx/compose/runtime/snapshots/SnapshotStateObserver;", "renderers", "Landroidx/compose/runtime/snapshots/SnapshotStateList;", "Landroidx/compose/animation/LayerRenderer;", "root", "getRoot$animation", "setRoot$animation", "sharedElements", "Landroidx/collection/MutableScatterMap;", "", "Landroidx/compose/animation/SharedElement;", "updateTransitionActiveness", "Lkotlin/Function1;", "lookaheadScopeCoordinates", "Landroidx/compose/ui/layout/Placeable$PlacementScope;", "getLookaheadScopeCoordinates", "(Landroidx/compose/ui/layout/Placeable$PlacementScope;)Landroidx/compose/ui/layout/LayoutCoordinates;", "OverlayClip", "Landroidx/compose/animation/SharedTransitionScope$OverlayClip;", "clipShape", "Landroidx/compose/ui/graphics/Shape;", "clearObservation", "scope", "clearObservation$animation", "drawInOverlay", "Landroidx/compose/ui/graphics/drawscope/ContentDrawScope;", "drawInOverlay$animation", "observeIsAnimating", "observeReads", "onValueChangedForScope", "block", "observeReads$animation", "onDispose", "onDispose$animation", "onLayerRendererCreated", "renderer", "onLayerRendererCreated$animation", "onLayerRendererRemoved", "onLayerRendererRemoved$animation", "onStateAdded", "sharedElementState", "Landroidx/compose/animation/SharedElementInternalState;", "onStateAdded$animation", "onStateRemoved", "onStateRemoved$animation", "rememberSharedContentState", "Landroidx/compose/animation/SharedTransitionScope$SharedContentState;", "key", "(Ljava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/animation/SharedTransitionScope$SharedContentState;", "rememberSharedElementState", "sharedElement", "boundsAnimation", "Landroidx/compose/animation/BoundsAnimation;", "placeHolderSize", "Landroidx/compose/animation/SharedTransitionScope$PlaceHolderSize;", "renderOnlyWhenVisible", "sharedContentState", "clipInOverlayDuringTransition", "zIndexInOverlay", "", "renderInOverlayDuringTransition", "(Landroidx/compose/animation/SharedElement;Landroidx/compose/animation/BoundsAnimation;Landroidx/compose/animation/SharedTransitionScope$PlaceHolderSize;ZLandroidx/compose/animation/SharedTransitionScope$SharedContentState;Landroidx/compose/animation/SharedTransitionScope$OverlayClip;FZLandroidx/compose/runtime/Composer;I)Landroidx/compose/animation/SharedElementInternalState;", "sharedElementsFor", "localLookaheadPositionOf", "Landroidx/compose/ui/geometry/Offset;", "sourceCoordinates", "relativeToSource", "includeMotionFrameOfReference", "localLookaheadPositionOf-au-aQtc", "(Landroidx/compose/ui/layout/LayoutCoordinates;Landroidx/compose/ui/layout/LayoutCoordinates;JZ)J", "renderInSharedTransitionScopeOverlay", "Landroidx/compose/ui/Modifier;", "renderInOverlay", "Lkotlin/Function2;", "Landroidx/compose/ui/unit/LayoutDirection;", "Landroidx/compose/ui/unit/Density;", "Landroidx/compose/ui/graphics/Path;", "sharedBounds", "animatedVisibilityScope", "Landroidx/compose/animation/AnimatedVisibilityScope;", "enter", "Landroidx/compose/animation/EnterTransition;", "exit", "Landroidx/compose/animation/ExitTransition;", "boundsTransform", "Landroidx/compose/animation/BoundsTransform;", "resizeMode", "Landroidx/compose/animation/SharedTransitionScope$ResizeMode;", "sharedBoundsImpl", ExifInterface.GPS_DIRECTION_TRUE, "parentTransition", "Landroidx/compose/animation/core/Transition;", "visible", "sharedBoundsWithCallerManagedVisibility", "sharedBoundsWithCallerManagedVisibility$animation", "sharedElementWithCallerManagedVisibility", "skipToLookaheadSize", "toLookaheadCoordinates", "Companion", "ShapeBasedClip", "animation"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class SharedTransitionScopeImpl implements SharedTransitionScope, LookaheadScope {
    public static final int $stable = 0;
    public static final Companion Companion = new Companion(null);
    private static final Lazy<SnapshotStateObserver> SharedTransitionObserver$delegate = LazyKt.lazy(LazyThreadSafetyMode.NONE, (Function0) new Function0<SnapshotStateObserver>() { // from class: androidx.compose.animation.SharedTransitionScopeImpl$Companion$SharedTransitionObserver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function0
        public final SnapshotStateObserver invoke() {
            SnapshotStateObserver it = new SnapshotStateObserver(new Function1<Function0<? extends Unit>, Unit>() { // from class: androidx.compose.animation.SharedTransitionScopeImpl$Companion$SharedTransitionObserver$2.1
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(Function0<? extends Unit> function0) {
                    invoke2((Function0<Unit>) function0);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(Function0<Unit> function0) {
                    function0.invoke();
                }
            });
            it.start();
            return it;
        }
    });
    private final /* synthetic */ LookaheadScope $$delegate_0;
    private final CoroutineScope coroutineScope;
    private boolean disposed;
    private final MutableState isTransitionActive$delegate;
    private LayoutCoordinates nullableLookaheadRoot;
    private final Function0<Unit> observeAnimatingBlock;
    private final SnapshotStateList<LayerRenderer> renderers;
    public LayoutCoordinates root;
    private final MutableScatterMap<Object, SharedElement> sharedElements;
    private final Function1<SharedTransitionScope, Unit> updateTransitionActiveness;

    @Override // androidx.compose.ui.layout.LookaheadScope
    public LayoutCoordinates getLookaheadScopeCoordinates(Placeable.PlacementScope placementScope) {
        return this.$$delegate_0.getLookaheadScopeCoordinates(placementScope);
    }

    @Override // androidx.compose.ui.layout.LookaheadScope
    /* renamed from: localLookaheadPositionOf-au-aQtc  reason: not valid java name */
    public long mo376localLookaheadPositionOfauaQtc(LayoutCoordinates layoutCoordinates, LayoutCoordinates layoutCoordinates2, long j, boolean z) {
        return this.$$delegate_0.mo376localLookaheadPositionOfauaQtc(layoutCoordinates, layoutCoordinates2, j, z);
    }

    @Override // androidx.compose.ui.layout.LookaheadScope
    public LayoutCoordinates toLookaheadCoordinates(LayoutCoordinates layoutCoordinates) {
        return this.$$delegate_0.toLookaheadCoordinates(layoutCoordinates);
    }

    public SharedTransitionScopeImpl(LookaheadScope lookaheadScope, CoroutineScope coroutineScope) {
        MutableState mutableStateOf$default;
        this.coroutineScope = coroutineScope;
        this.$$delegate_0 = lookaheadScope;
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.isTransitionActive$delegate = mutableStateOf$default;
        this.observeAnimatingBlock = new Function0<Unit>() { // from class: androidx.compose.animation.SharedTransitionScopeImpl$observeAnimatingBlock$1
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
                ScatterMap scatterMap;
                scatterMap = SharedTransitionScopeImpl.this.sharedElements;
                ScatterMap this_$iv = scatterMap;
                Object[] k$iv$iv = this_$iv.keys;
                Object[] v$iv$iv = this_$iv.values;
                long[] m$iv$iv$iv = this_$iv.metadata;
                int lastIndex$iv$iv$iv = m$iv$iv$iv.length - 2;
                int i$iv$iv$iv = 0;
                if (0 > lastIndex$iv$iv$iv) {
                    return;
                }
                while (true) {
                    long slot$iv$iv$iv = m$iv$iv$iv[i$iv$iv$iv];
                    ScatterMap this_$iv2 = this_$iv;
                    if ((((~slot$iv$iv$iv) << 7) & slot$iv$iv$iv & (-9187201950435737472L)) != -9187201950435737472L) {
                        int bitCount$iv$iv$iv = 8 - ((~(i$iv$iv$iv - lastIndex$iv$iv$iv)) >>> 31);
                        for (int j$iv$iv$iv = 0; j$iv$iv$iv < bitCount$iv$iv$iv; j$iv$iv$iv++) {
                            long value$iv$iv$iv$iv = 255 & slot$iv$iv$iv;
                            if (value$iv$iv$iv$iv < 128) {
                                int index$iv$iv$iv = (i$iv$iv$iv << 3) + j$iv$iv$iv;
                                Object obj = k$iv$iv[index$iv$iv$iv];
                                Object value$iv = v$iv$iv[index$iv$iv$iv];
                                SharedElement element = (SharedElement) value$iv;
                                if (element.isAnimating()) {
                                    return;
                                }
                            }
                            slot$iv$iv$iv >>= 8;
                        }
                        if (bitCount$iv$iv$iv != 8) {
                            return;
                        }
                    }
                    if (i$iv$iv$iv == lastIndex$iv$iv$iv) {
                        return;
                    }
                    i$iv$iv$iv++;
                    this_$iv = this_$iv2;
                }
            }
        };
        this.updateTransitionActiveness = new Function1<SharedTransitionScope, Unit>() { // from class: androidx.compose.animation.SharedTransitionScopeImpl$updateTransitionActiveness$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(SharedTransitionScope sharedTransitionScope) {
                invoke2(sharedTransitionScope);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(SharedTransitionScope it) {
                SharedTransitionScopeImpl.this.updateTransitionActiveness();
            }
        };
        this.renderers = SnapshotStateKt.mutableStateListOf();
        this.sharedElements = new MutableScatterMap<>(0, 1, null);
    }

    public final CoroutineScope getCoroutineScope() {
        return this.coroutineScope;
    }

    /* compiled from: SharedTransitionScope.kt */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u001b\u0010\u0003\u001a\u00020\u00048BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b\u0007\u0010\b\u001a\u0004\b\u0005\u0010\u0006¨\u0006\t"}, d2 = {"Landroidx/compose/animation/SharedTransitionScopeImpl$Companion;", "", "()V", "SharedTransitionObserver", "Landroidx/compose/runtime/snapshots/SnapshotStateObserver;", "getSharedTransitionObserver", "()Landroidx/compose/runtime/snapshots/SnapshotStateObserver;", "SharedTransitionObserver$delegate", "Lkotlin/Lazy;", "animation"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final SnapshotStateObserver getSharedTransitionObserver() {
            return (SnapshotStateObserver) SharedTransitionScopeImpl.SharedTransitionObserver$delegate.getValue();
        }
    }

    public final boolean getDisposed$animation() {
        return this.disposed;
    }

    private void setTransitionActive(boolean z) {
        MutableState $this$setValue$iv = this.isTransitionActive$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    @Override // androidx.compose.animation.SharedTransitionScope
    public boolean isTransitionActive() {
        State $this$getValue$iv = this.isTransitionActive$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    @Override // androidx.compose.animation.SharedTransitionScope
    public Modifier skipToLookaheadSize(Modifier $this$skipToLookaheadSize) {
        return $this$skipToLookaheadSize.then(new SkipToLookaheadElement(null, null, 3, null));
    }

    @Override // androidx.compose.animation.SharedTransitionScope
    public Modifier renderInSharedTransitionScopeOverlay(Modifier $this$renderInSharedTransitionScopeOverlay, Function0<Boolean> function0, float zIndexInOverlay, Function2<? super LayoutDirection, ? super Density, ? extends Path> function2) {
        return $this$renderInSharedTransitionScopeOverlay.then(new RenderInTransitionOverlayNodeElement(this, function0, zIndexInOverlay, function2));
    }

    @Override // androidx.compose.animation.SharedTransitionScope
    public Modifier sharedElement(Modifier $this$sharedElement, SharedTransitionScope.SharedContentState sharedContentState, AnimatedVisibilityScope animatedVisibilityScope, BoundsTransform boundsTransform, SharedTransitionScope.PlaceHolderSize placeHolderSize, boolean renderInOverlayDuringTransition, float zIndexInOverlay, SharedTransitionScope.OverlayClip clipInOverlayDuringTransition) {
        return sharedBoundsImpl($this$sharedElement, sharedContentState, animatedVisibilityScope.getTransition(), new Function1<EnterExitState, Boolean>() { // from class: androidx.compose.animation.SharedTransitionScopeImpl$sharedElement$1
            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(EnterExitState it) {
                return Boolean.valueOf(it == EnterExitState.Visible);
            }
        }, boundsTransform, placeHolderSize, true, renderInOverlayDuringTransition, zIndexInOverlay, clipInOverlayDuringTransition);
    }

    @Override // androidx.compose.animation.SharedTransitionScope
    public Modifier sharedBounds(Modifier $this$sharedBounds, final SharedTransitionScope.SharedContentState sharedContentState, final AnimatedVisibilityScope animatedVisibilityScope, final EnterTransition enter, final ExitTransition exit, BoundsTransform boundsTransform, final SharedTransitionScope.ResizeMode resizeMode, SharedTransitionScope.PlaceHolderSize placeHolderSize, boolean renderInOverlayDuringTransition, float zIndexInOverlay, SharedTransitionScope.OverlayClip clipInOverlayDuringTransition) {
        return ComposedModifierKt.composed$default(sharedBoundsImpl($this$sharedBounds, sharedContentState, animatedVisibilityScope.getTransition(), new Function1<EnterExitState, Boolean>() { // from class: androidx.compose.animation.SharedTransitionScopeImpl$sharedBounds$1
            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(EnterExitState it) {
                return Boolean.valueOf(it == EnterExitState.Visible);
            }
        }, boundsTransform, placeHolderSize, false, renderInOverlayDuringTransition, zIndexInOverlay, clipInOverlayDuringTransition), null, new Function3<Modifier, Composer, Integer, Modifier>() { // from class: androidx.compose.animation.SharedTransitionScopeImpl$sharedBounds$2
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(3);
            }

            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ Modifier invoke(Modifier modifier, Composer composer, Integer num) {
                return invoke(modifier, composer, num.intValue());
            }

            public final Modifier invoke(Modifier $this$composed, Composer $composer, int $changed) {
                Modifier.Companion companion;
                $composer.startReplaceGroup(-419341573);
                ComposerKt.sourceInformation($composer, "C745@41603L35,737@41080L656:SharedTransitionScope.kt#xbi5r1");
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventStart(-419341573, $changed, -1, "androidx.compose.animation.SharedTransitionScopeImpl.sharedBounds.<anonymous> (SharedTransitionScope.kt:736)");
                }
                Transition<EnterExitState> transition = AnimatedVisibilityScope.this.getTransition();
                EnterTransition enterTransition = enter;
                ExitTransition exitTransition = exit;
                ComposerKt.sourceInformationMarkerStart($composer, -1411467109, "CC(remember):SharedTransitionScope.kt#9igjgp");
                boolean invalid$iv = $composer.changedInstance(sharedContentState);
                final SharedTransitionScope.SharedContentState sharedContentState2 = sharedContentState;
                Object it$iv = $composer.rememberedValue();
                if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                    Object value$iv = (Function0) new Function0<Boolean>() { // from class: androidx.compose.animation.SharedTransitionScopeImpl$sharedBounds$2$1$1
                        /* JADX INFO: Access modifiers changed from: package-private */
                        {
                            super(0);
                        }

                        /* JADX WARN: Can't rename method to resolve collision */
                        @Override // kotlin.jvm.functions.Function0
                        public final Boolean invoke() {
                            return Boolean.valueOf(SharedTransitionScope.SharedContentState.this.isMatchFound());
                        }
                    };
                    $composer.updateRememberedValue(value$iv);
                    it$iv = value$iv;
                }
                ComposerKt.sourceInformationMarkerEnd($composer);
                Modifier createModifier = EnterExitTransitionKt.createModifier(transition, enterTransition, exitTransition, (Function0) it$iv, "enter/exit for " + sharedContentState.getKey(), $composer, 0, 0);
                if (resizeMode instanceof ScaleToBoundsImpl) {
                    $composer.startReplaceGroup(-805568624);
                    ComposerKt.sourceInformation($composer, "750@41903L530");
                    Modifier.Companion companion2 = Modifier.Companion;
                    ScaleToBoundsImpl scaleToBoundsImpl = (ScaleToBoundsImpl) resizeMode;
                    ComposerKt.sourceInformationMarkerStart($composer, -1411457014, "CC(remember):SharedTransitionScope.kt#9igjgp");
                    boolean invalid$iv2 = $composer.changedInstance(sharedContentState);
                    final SharedTransitionScope.SharedContentState sharedContentState3 = sharedContentState;
                    Object it$iv2 = $composer.rememberedValue();
                    if (invalid$iv2 || it$iv2 == Composer.Companion.getEmpty()) {
                        Object value$iv2 = (Function0) new Function0<Boolean>() { // from class: androidx.compose.animation.SharedTransitionScopeImpl$sharedBounds$2$2$1
                            /* JADX INFO: Access modifiers changed from: package-private */
                            {
                                super(0);
                            }

                            /* JADX WARN: Can't rename method to resolve collision */
                            @Override // kotlin.jvm.functions.Function0
                            public final Boolean invoke() {
                                return Boolean.valueOf(SharedTransitionScope.SharedContentState.this.isMatchFound());
                            }
                        };
                        $composer.updateRememberedValue(value$iv2);
                        it$iv2 = value$iv2;
                    }
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    companion = SkipToLookaheadNodeKt.createContentScaleModifier(companion2, scaleToBoundsImpl, (Function0) it$iv2);
                    $composer.endReplaceGroup();
                } else {
                    $composer.startReplaceGroup(-804951414);
                    $composer.endReplaceGroup();
                    companion = Modifier.Companion;
                }
                Modifier then = createModifier.then(companion);
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventEnd();
                }
                $composer.endReplaceGroup();
                return then;
            }
        }, 1, null);
    }

    @Override // androidx.compose.animation.SharedTransitionScope
    public Modifier sharedElementWithCallerManagedVisibility(Modifier $this$sharedElementWithCallerManagedVisibility, SharedTransitionScope.SharedContentState sharedContentState, final boolean visible, BoundsTransform boundsTransform, SharedTransitionScope.PlaceHolderSize placeHolderSize, boolean renderInOverlayDuringTransition, float zIndexInOverlay, SharedTransitionScope.OverlayClip clipInOverlayDuringTransition) {
        return sharedBoundsImpl($this$sharedElementWithCallerManagedVisibility, sharedContentState, null, new Function1<Unit, Boolean>() { // from class: androidx.compose.animation.SharedTransitionScopeImpl$sharedElementWithCallerManagedVisibility$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(Unit it) {
                return Boolean.valueOf(visible);
            }
        }, boundsTransform, placeHolderSize, true, renderInOverlayDuringTransition, zIndexInOverlay, clipInOverlayDuringTransition);
    }

    public static /* synthetic */ Modifier sharedBoundsWithCallerManagedVisibility$animation$default(SharedTransitionScopeImpl sharedTransitionScopeImpl, Modifier modifier, SharedTransitionScope.SharedContentState sharedContentState, boolean z, BoundsTransform boundsTransform, SharedTransitionScope.PlaceHolderSize placeHolderSize, boolean z2, float f, SharedTransitionScope.OverlayClip overlayClip, int i, Object obj) {
        BoundsTransform boundsTransform2;
        SharedTransitionScope.OverlayClip overlayClip2;
        SharedTransitionScope.OverlayClip overlayClip3;
        BoundsTransform boundsTransform3;
        if ((i & 4) != 0) {
            boundsTransform3 = SharedTransitionScopeKt.DefaultBoundsTransform;
            boundsTransform2 = boundsTransform3;
        } else {
            boundsTransform2 = boundsTransform;
        }
        SharedTransitionScope.PlaceHolderSize contentSize = (i & 8) != 0 ? SharedTransitionScope.PlaceHolderSize.Companion.getContentSize() : placeHolderSize;
        boolean z3 = (i & 16) != 0 ? true : z2;
        float f2 = (i & 32) != 0 ? 0.0f : f;
        if ((i & 64) != 0) {
            overlayClip3 = SharedTransitionScopeKt.ParentClip;
            overlayClip2 = overlayClip3;
        } else {
            overlayClip2 = overlayClip;
        }
        return sharedTransitionScopeImpl.sharedBoundsWithCallerManagedVisibility$animation(modifier, sharedContentState, z, boundsTransform2, contentSize, z3, f2, overlayClip2);
    }

    public final Modifier sharedBoundsWithCallerManagedVisibility$animation(Modifier $this$sharedBoundsWithCallerManagedVisibility, SharedTransitionScope.SharedContentState sharedContentState, final boolean visible, BoundsTransform boundsTransform, SharedTransitionScope.PlaceHolderSize placeHolderSize, boolean renderInOverlayDuringTransition, float zIndexInOverlay, SharedTransitionScope.OverlayClip clipInOverlayDuringTransition) {
        return sharedBoundsImpl($this$sharedBoundsWithCallerManagedVisibility, sharedContentState, null, new Function1<Unit, Boolean>() { // from class: androidx.compose.animation.SharedTransitionScopeImpl$sharedBoundsWithCallerManagedVisibility$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(Unit it) {
                return Boolean.valueOf(visible);
            }
        }, boundsTransform, placeHolderSize, false, renderInOverlayDuringTransition, zIndexInOverlay, clipInOverlayDuringTransition);
    }

    @Override // androidx.compose.animation.SharedTransitionScope
    public SharedTransitionScope.OverlayClip OverlayClip(Shape clipShape) {
        return new ShapeBasedClip(clipShape);
    }

    @Override // androidx.compose.animation.SharedTransitionScope
    public SharedTransitionScope.SharedContentState rememberSharedContentState(Object key, Composer $composer, int $changed) {
        $composer.startReplaceGroup(799702514);
        ComposerKt.sourceInformation($composer, "C(rememberSharedContentState)874@49196L41:SharedTransitionScope.kt#xbi5r1");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(799702514, $changed, -1, "androidx.compose.animation.SharedTransitionScopeImpl.rememberSharedContentState (SharedTransitionScope.kt:874)");
        }
        ComposerKt.sourceInformationMarkerStart($composer, 935461266, "CC(remember):SharedTransitionScope.kt#9igjgp");
        boolean invalid$iv = $composer.changed(key);
        Object it$iv = $composer.rememberedValue();
        if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
            Object value$iv = new SharedTransitionScope.SharedContentState(key);
            $composer.updateRememberedValue(value$iv);
            it$iv = value$iv;
        }
        SharedTransitionScope.SharedContentState sharedContentState = (SharedTransitionScope.SharedContentState) it$iv;
        ComposerKt.sourceInformationMarkerEnd($composer);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        $composer.endReplaceGroup();
        return sharedContentState;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void updateTransitionActiveness() {
        long j;
        boolean isActive;
        ScatterMap this_$iv = this.sharedElements;
        int $i$f$any = 0;
        Object[] k$iv$iv = this_$iv.keys;
        Object[] v$iv$iv = this_$iv.values;
        long[] m$iv$iv$iv = this_$iv.metadata;
        int lastIndex$iv$iv$iv = m$iv$iv$iv.length - 2;
        int i$iv$iv$iv = 0;
        int i = 8;
        if (0 <= lastIndex$iv$iv$iv) {
            loop0: while (true) {
                long slot$iv$iv$iv = m$iv$iv$iv[i$iv$iv$iv];
                j = 255;
                ScatterMap this_$iv2 = this_$iv;
                int $i$f$any2 = $i$f$any;
                if ((((~slot$iv$iv$iv) << 7) & slot$iv$iv$iv & (-9187201950435737472L)) != -9187201950435737472L) {
                    int bitCount$iv$iv$iv = 8 - ((~(i$iv$iv$iv - lastIndex$iv$iv$iv)) >>> 31);
                    for (int j$iv$iv$iv = 0; j$iv$iv$iv < bitCount$iv$iv$iv; j$iv$iv$iv++) {
                        long value$iv$iv$iv$iv = slot$iv$iv$iv & 255;
                        if (value$iv$iv$iv$iv < 128) {
                            int index$iv$iv$iv = (i$iv$iv$iv << 3) + j$iv$iv$iv;
                            Object obj = k$iv$iv[index$iv$iv$iv];
                            Object value$iv = v$iv$iv[index$iv$iv$iv];
                            SharedElement element = (SharedElement) value$iv;
                            if (element.isAnimating()) {
                                isActive = true;
                                break loop0;
                            }
                        }
                        slot$iv$iv$iv >>= 8;
                    }
                    if (bitCount$iv$iv$iv != 8) {
                        break;
                    }
                }
                if (i$iv$iv$iv == lastIndex$iv$iv$iv) {
                    break;
                }
                i$iv$iv$iv++;
                this_$iv = this_$iv2;
                $i$f$any = $i$f$any2;
            }
        } else {
            j = 255;
        }
        isActive = false;
        if (isActive != isTransitionActive()) {
            setTransitionActive(isActive);
            if (!isActive) {
                ScatterMap this_$iv3 = this.sharedElements;
                Object[] k$iv = this_$iv3.keys;
                Object[] v$iv = this_$iv3.values;
                long[] m$iv$iv = this_$iv3.metadata;
                int lastIndex$iv$iv = m$iv$iv.length - 2;
                int i$iv$iv = 0;
                if (0 <= lastIndex$iv$iv) {
                    while (true) {
                        long slot$iv$iv = m$iv$iv[i$iv$iv];
                        int i2 = i;
                        long slot$iv$iv2 = slot$iv$iv;
                        boolean isActive2 = isActive;
                        ScatterMap this_$iv4 = this_$iv3;
                        if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) != -9187201950435737472L) {
                            int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                            for (int j$iv$iv = 0; j$iv$iv < bitCount$iv$iv; j$iv$iv++) {
                                long value$iv$iv$iv = slot$iv$iv2 & j;
                                int $i$f$isFull = value$iv$iv$iv < 128 ? 1 : 0;
                                if ($i$f$isFull != 0) {
                                    int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                                    Object obj2 = k$iv[index$iv$iv];
                                    SharedElement element2 = (SharedElement) v$iv[index$iv$iv];
                                    element2.onSharedTransitionFinished();
                                }
                                slot$iv$iv2 >>= i2;
                            }
                            if (bitCount$iv$iv != i2) {
                                break;
                            }
                        }
                        if (i$iv$iv == lastIndex$iv$iv) {
                            break;
                        }
                        i$iv$iv++;
                        isActive = isActive2;
                        this_$iv3 = this_$iv4;
                        i = 8;
                    }
                }
            }
        }
        ScatterMap this_$iv5 = this.sharedElements;
        Object[] k$iv2 = this_$iv5.keys;
        Object[] v$iv2 = this_$iv5.values;
        long[] m$iv$iv2 = this_$iv5.metadata;
        int lastIndex$iv$iv2 = m$iv$iv2.length - 2;
        int i$iv$iv2 = 0;
        if (0 <= lastIndex$iv$iv2) {
            while (true) {
                long slot$iv$iv3 = m$iv$iv2[i$iv$iv2];
                ScatterMap this_$iv6 = this_$iv5;
                if ((((~slot$iv$iv3) << 7) & slot$iv$iv3 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int bitCount$iv$iv2 = 8 - ((~(i$iv$iv2 - lastIndex$iv$iv2)) >>> 31);
                    for (int j$iv$iv2 = 0; j$iv$iv2 < bitCount$iv$iv2; j$iv$iv2++) {
                        long value$iv$iv$iv2 = slot$iv$iv3 & j;
                        int $i$f$isFull2 = value$iv$iv$iv2 < 128 ? 1 : 0;
                        if ($i$f$isFull2 != 0) {
                            int index$iv$iv2 = (i$iv$iv2 << 3) + j$iv$iv2;
                            Object obj3 = k$iv2[index$iv$iv2];
                            SharedElement element3 = (SharedElement) v$iv2[index$iv$iv2];
                            element3.updateMatch();
                        }
                        slot$iv$iv3 >>= 8;
                    }
                    if (bitCount$iv$iv2 != 8) {
                        break;
                    }
                }
                if (i$iv$iv2 == lastIndex$iv$iv2) {
                    break;
                }
                i$iv$iv2++;
                this_$iv5 = this_$iv6;
            }
        }
        observeIsAnimating();
    }

    static /* synthetic */ Modifier sharedBoundsImpl$default(SharedTransitionScopeImpl sharedTransitionScopeImpl, Modifier modifier, SharedTransitionScope.SharedContentState sharedContentState, Transition transition, Function1 function1, BoundsTransform boundsTransform, SharedTransitionScope.PlaceHolderSize placeHolderSize, boolean z, boolean z2, float f, SharedTransitionScope.OverlayClip overlayClip, int i, Object obj) {
        SharedTransitionScope.PlaceHolderSize placeHolderSize2;
        if ((i & 16) == 0) {
            placeHolderSize2 = placeHolderSize;
        } else {
            placeHolderSize2 = SharedTransitionScope.PlaceHolderSize.Companion.getContentSize();
        }
        return sharedTransitionScopeImpl.sharedBoundsImpl(modifier, sharedContentState, transition, function1, boundsTransform, placeHolderSize2, z, z2, f, overlayClip);
    }

    private final <T> Modifier sharedBoundsImpl(Modifier $this$sharedBoundsImpl, final SharedTransitionScope.SharedContentState sharedContentState, final Transition<T> transition, final Function1<? super T, Boolean> function1, final BoundsTransform boundsTransform, final SharedTransitionScope.PlaceHolderSize placeHolderSize, final boolean renderOnlyWhenVisible, final boolean renderInOverlayDuringTransition, final float zIndexInOverlay, final SharedTransitionScope.OverlayClip clipInOverlayDuringTransition) {
        return ComposedModifierKt.composed$default($this$sharedBoundsImpl, null, new Function3<Modifier, Composer, Integer, Modifier>() { // from class: androidx.compose.animation.SharedTransitionScopeImpl$sharedBoundsImpl$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            {
                super(3);
            }

            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ Modifier invoke(Modifier modifier, Composer composer, Integer num) {
                return invoke(modifier, composer, num.intValue());
            }

            /* JADX WARN: Code restructure failed: missing block: B:23:0x00be, code lost:
                if (r5 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L18;
             */
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final androidx.compose.ui.Modifier invoke(androidx.compose.ui.Modifier r21, androidx.compose.runtime.Composer r22, int r23) {
                /*
                    Method dump skipped, instructions count: 674
                    To view this dump add '--comments-level debug' option
                */
                throw new UnsupportedOperationException("Method not decompiled: androidx.compose.animation.SharedTransitionScopeImpl$sharedBoundsImpl$1.invoke(androidx.compose.ui.Modifier, androidx.compose.runtime.Composer, int):androidx.compose.ui.Modifier");
            }
        }, 1, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final SharedElementInternalState rememberSharedElementState(SharedElement sharedElement, BoundsAnimation boundsAnimation, SharedTransitionScope.PlaceHolderSize placeHolderSize, boolean renderOnlyWhenVisible, SharedTransitionScope.SharedContentState sharedContentState, SharedTransitionScope.OverlayClip clipInOverlayDuringTransition, float zIndexInOverlay, boolean renderInOverlayDuringTransition, Composer $composer, int $changed) {
        SharedTransitionScope.SharedContentState sharedContentState2;
        ComposerKt.sourceInformationMarkerStart($composer, 2066772852, "C(rememberSharedElementState)P(6!1,2,4,5!1,7)*991@54957L511:SharedTransitionScope.kt#xbi5r1");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(2066772852, $changed, -1, "androidx.compose.animation.SharedTransitionScopeImpl.rememberSharedElementState (SharedTransitionScope.kt:991)");
        }
        ComposerKt.sourceInformationMarkerStart($composer, -663248987, "CC(remember):SharedTransitionScope.kt#9igjgp");
        Object it$iv = $composer.rememberedValue();
        if (it$iv == Composer.Companion.getEmpty()) {
            sharedContentState2 = sharedContentState;
            Object value$iv = new SharedElementInternalState(sharedElement, boundsAnimation, placeHolderSize, renderOnlyWhenVisible, clipInOverlayDuringTransition, renderInOverlayDuringTransition, sharedContentState2, zIndexInOverlay);
            $composer.updateRememberedValue(value$iv);
            it$iv = value$iv;
        } else {
            sharedContentState2 = sharedContentState;
        }
        SharedElementInternalState it = (SharedElementInternalState) it$iv;
        ComposerKt.sourceInformationMarkerEnd($composer);
        sharedContentState2.setInternalState$animation(it);
        it.setSharedElement(sharedElement);
        it.setRenderOnlyWhenVisible(renderOnlyWhenVisible);
        it.setBoundsAnimation(boundsAnimation);
        it.setPlaceHolderSize(placeHolderSize);
        it.setOverlayClip(clipInOverlayDuringTransition);
        it.setZIndex(zIndexInOverlay);
        it.setRenderInOverlayDuringTransition(renderInOverlayDuringTransition);
        it.setUserState(sharedContentState2);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return it;
    }

    public final LayoutCoordinates getRoot$animation() {
        LayoutCoordinates layoutCoordinates = this.root;
        if (layoutCoordinates != null) {
            return layoutCoordinates;
        }
        Intrinsics.throwUninitializedPropertyAccessException("root");
        return null;
    }

    public final void setRoot$animation(LayoutCoordinates layoutCoordinates) {
        this.root = layoutCoordinates;
    }

    public final LayoutCoordinates getLookaheadRoot$animation() {
        LayoutCoordinates layoutCoordinates = this.nullableLookaheadRoot;
        if (layoutCoordinates == null) {
            throw new IllegalArgumentException("Error: Uninitialized LayoutCoordinates. Please make sure when using the SharedTransitionScope composable function, the modifier passed to the child content is being used, or use SharedTransitionLayout instead.".toString());
        }
        return layoutCoordinates;
    }

    public final LayoutCoordinates getNullableLookaheadRoot$animation() {
        return this.nullableLookaheadRoot;
    }

    public final void setNullableLookaheadRoot$animation(LayoutCoordinates layoutCoordinates) {
        this.nullableLookaheadRoot = layoutCoordinates;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final SharedElement sharedElementsFor(Object key) {
        SharedElement sharedElement = this.sharedElements.get(key);
        if (sharedElement == null) {
            SharedElement it = new SharedElement(key, this);
            this.sharedElements.set(key, it);
            return it;
        }
        return sharedElement;
    }

    public final void drawInOverlay$animation(ContentDrawScope scope) {
        List $this$sortBy$iv = this.renderers;
        if ($this$sortBy$iv.size() > 1) {
            CollectionsKt.sortWith($this$sortBy$iv, new Comparator() { // from class: androidx.compose.animation.SharedTransitionScopeImpl$drawInOverlay$$inlined$sortBy$1
                @Override // java.util.Comparator
                public final int compare(T t, T t2) {
                    float zIndex;
                    LayerRenderer it = (LayerRenderer) t;
                    float f = -1.0f;
                    if ((it.getZIndex() == 0.0f) && (it instanceof SharedElementInternalState) && ((SharedElementInternalState) it).getParentState() == null) {
                        zIndex = -1.0f;
                    } else {
                        zIndex = it.getZIndex();
                    }
                    Float valueOf = Float.valueOf(zIndex);
                    LayerRenderer it2 = (LayerRenderer) t2;
                    if (!(it2.getZIndex() == 0.0f) || !(it2 instanceof SharedElementInternalState) || ((SharedElementInternalState) it2).getParentState() != null) {
                        f = it2.getZIndex();
                    }
                    return ComparisonsKt.compareValues(valueOf, Float.valueOf(f));
                }
            });
        }
        List $this$fastForEach$iv = this.renderers;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            LayerRenderer it = (LayerRenderer) item$iv;
            it.drawInOverlay(scope);
        }
    }

    public final void onStateRemoved$animation(SharedElementInternalState sharedElementState) {
        SharedElement $this$onStateRemoved_u24lambda_u2410 = sharedElementState.getSharedElement();
        $this$onStateRemoved_u24lambda_u2410.removeState(sharedElementState);
        this.updateTransitionActiveness.invoke(this);
        $this$onStateRemoved_u24lambda_u2410.getScope().observeIsAnimating();
        this.renderers.remove(sharedElementState);
        if ($this$onStateRemoved_u24lambda_u2410.getStates().isEmpty()) {
            BuildersKt__Builders_commonKt.launch$default($this$onStateRemoved_u24lambda_u2410.getScope().coroutineScope, null, null, new SharedTransitionScopeImpl$onStateRemoved$1$1($this$onStateRemoved_u24lambda_u2410, null), 3, null);
        }
    }

    public final void onStateAdded$animation(SharedElementInternalState sharedElementState) {
        SharedElement $this$onStateAdded_u24lambda_u2412 = sharedElementState.getSharedElement();
        $this$onStateAdded_u24lambda_u2412.addState(sharedElementState);
        this.updateTransitionActiveness.invoke(this);
        $this$onStateAdded_u24lambda_u2412.getScope().observeIsAnimating();
        List $this$indexOfFirst$iv = this.renderers;
        int index$iv = 0;
        Iterator<LayerRenderer> it = $this$indexOfFirst$iv.iterator();
        while (true) {
            if (it.hasNext()) {
                Object item$iv = it.next();
                LayerRenderer it2 = (LayerRenderer) item$iv;
                SharedElementInternalState sharedElementInternalState = it2 instanceof SharedElementInternalState ? (SharedElementInternalState) it2 : null;
                if (Intrinsics.areEqual(sharedElementInternalState != null ? sharedElementInternalState.getSharedElement() : null, sharedElementState.getSharedElement())) {
                    break;
                }
                index$iv++;
            } else {
                index$iv = -1;
                break;
            }
        }
        if (index$iv == this.renderers.size() - 1 || index$iv == -1) {
            this.renderers.add(sharedElementState);
        } else {
            this.renderers.add(index$iv + 1, sharedElementState);
        }
    }

    public final void onLayerRendererCreated$animation(LayerRenderer renderer) {
        this.renderers.add(renderer);
    }

    public final void onLayerRendererRemoved$animation(LayerRenderer renderer) {
        this.renderers.remove(renderer);
    }

    public final void onDispose$animation() {
        Companion.getSharedTransitionObserver().clear(this);
        this.disposed = true;
    }

    public final SnapshotStateObserver getObserverForTest$animation() {
        return Companion.getSharedTransitionObserver();
    }

    private final void observeIsAnimating() {
        if (!this.disposed) {
            Companion.getSharedTransitionObserver().observeReads(this, this.updateTransitionActiveness, this.observeAnimatingBlock);
        }
    }

    public final void observeReads$animation(SharedElement scope, Function1<? super SharedElement, Unit> function1, Function0<Unit> function0) {
        if (!this.disposed) {
            Companion.getSharedTransitionObserver().observeReads(scope, function1, function0);
        }
    }

    public final void clearObservation$animation(Object scope) {
        Companion.getSharedTransitionObserver().clear(scope);
    }

    /* compiled from: SharedTransitionScope.kt */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J(\u0010\t\u001a\u00020\b2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0011H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0012"}, d2 = {"Landroidx/compose/animation/SharedTransitionScopeImpl$ShapeBasedClip;", "Landroidx/compose/animation/SharedTransitionScope$OverlayClip;", "clipShape", "Landroidx/compose/ui/graphics/Shape;", "(Landroidx/compose/ui/graphics/Shape;)V", "getClipShape", "()Landroidx/compose/ui/graphics/Shape;", "path", "Landroidx/compose/ui/graphics/Path;", "getClipPath", "sharedContentState", "Landroidx/compose/animation/SharedTransitionScope$SharedContentState;", "bounds", "Landroidx/compose/ui/geometry/Rect;", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "density", "Landroidx/compose/ui/unit/Density;", "animation"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    private static final class ShapeBasedClip implements SharedTransitionScope.OverlayClip {
        private final Shape clipShape;
        private final Path path = AndroidPath_androidKt.Path();

        public ShapeBasedClip(Shape clipShape) {
            this.clipShape = clipShape;
        }

        public final Shape getClipShape() {
            return this.clipShape;
        }

        @Override // androidx.compose.animation.SharedTransitionScope.OverlayClip
        public Path getClipPath(SharedTransitionScope.SharedContentState sharedContentState, Rect bounds, LayoutDirection layoutDirection, Density density) {
            this.path.reset();
            OutlineKt.addOutline(this.path, this.clipShape.mo558createOutlinePq9zytI(bounds.m4081getSizeNHjbRc(), layoutDirection, density));
            this.path.mo4184translatek4lQ0M(bounds.m4083getTopLeftF1C5BW0());
            return this.path;
        }
    }
}
