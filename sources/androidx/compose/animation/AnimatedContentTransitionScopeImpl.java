package androidx.compose.animation;

import androidx.autofill.HintConstants;
import androidx.collection.MutableScatterMap;
import androidx.collection.ScatterMapKt;
import androidx.compose.animation.AnimatedContentTransitionScope;
import androidx.compose.animation.AnimatedContentTransitionScopeImpl;
import androidx.compose.animation.core.AnimationSpecKt;
import androidx.compose.animation.core.AnimationVector2D;
import androidx.compose.animation.core.FiniteAnimationSpec;
import androidx.compose.animation.core.Transition;
import androidx.compose.animation.core.VectorConvertersKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.Alignment;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.draw.ClipKt;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.MeasureScope;
import androidx.compose.ui.layout.ParentDataModifier;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.node.ModifierNodeElement;
import androidx.compose.ui.platform.InspectorInfo;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntSize;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: AnimatedContent.kt */
@Metadata(d1 = {"\u0000\u0084\u0001\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u001a\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0000\u0018\u0000*\u0004\b\u0000\u0010\u00012\b\u0012\u0004\u0012\u0002H\u00010\u0002:\u0003UVWB%\b\u0000\u0012\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00000\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0002\u0010\tJ\"\u00105\u001a\u0002062\u0006\u00107\u001a\u00020\f2\u0006\u0010\u0015\u001a\u00020\fH\u0002ø\u0001\u0000¢\u0006\u0004\b8\u00109J\u0017\u0010:\u001a\u00020;2\u0006\u0010<\u001a\u00020=H\u0001¢\u0006\u0004\b>\u0010?JK\u0010@\u001a\u00020A2\u0006\u0010B\u001a\u0002002\f\u0010C\u001a\b\u0012\u0004\u0012\u0002060D2!\u0010E\u001a\u001d\u0012\u0013\u0012\u00110G¢\u0006\f\bH\u0012\b\bI\u0012\u0004\b\b(J\u0012\u0004\u0012\u00020G0FH\u0016ø\u0001\u0000¢\u0006\u0004\bK\u0010LJK\u0010M\u001a\u00020N2\u0006\u0010B\u001a\u0002002\f\u0010C\u001a\b\u0012\u0004\u0012\u0002060D2!\u0010O\u001a\u001d\u0012\u0013\u0012\u00110G¢\u0006\f\bH\u0012\b\bI\u0012\u0004\b\b(J\u0012\u0004\u0012\u00020G0FH\u0016ø\u0001\u0000¢\u0006\u0004\bP\u0010QJ\u0017\u0010R\u001a\u00020=*\u00020=2\b\u0010S\u001a\u0004\u0018\u00010TH\u0096\u0004R\"\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000bX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010R\u001a\u0010\u0005\u001a\u00020\u0006X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0011\u0010\u0012\"\u0004\b\u0013\u0010\u0014R\u001a\u0010\u0015\u001a\u00020\f8BX\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u0016\u0010\u0017R\u0014\u0010\u0018\u001a\u00028\u00008VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0019\u0010\u001aR\u001a\u0010\u0007\u001a\u00020\bX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001b\u0010\u001c\"\u0004\b\u001d\u0010\u001eR1\u0010 \u001a\u00020\f2\u0006\u0010\u001f\u001a\u00020\f8@@@X\u0080\u008e\u0002ø\u0001\u0000ø\u0001\u0001¢\u0006\u0012\n\u0004\b$\u0010%\u001a\u0004\b!\u0010\u0017\"\u0004\b\"\u0010#R&\u0010&\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\n\u0012\b\u0012\u0004\u0012\u00020\f0\u000b0'X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b(\u0010)R\u0014\u0010*\u001a\u00028\u00008VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b+\u0010\u001aR\u001a\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00000\u0004X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b,\u0010-R\u0018\u0010.\u001a\u00020/*\u0002008BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b1\u00102R\u0018\u00103\u001a\u00020/*\u0002008BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b4\u00102\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006X²\u0006\u0010\u0010Y\u001a\u00020/\"\u0004\b\u0000\u0010\u0001X\u008a\u008e\u0002"}, d2 = {"Landroidx/compose/animation/AnimatedContentTransitionScopeImpl;", ExifInterface.LATITUDE_SOUTH, "Landroidx/compose/animation/AnimatedContentTransitionScope;", "transition", "Landroidx/compose/animation/core/Transition;", "contentAlignment", "Landroidx/compose/ui/Alignment;", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "(Landroidx/compose/animation/core/Transition;Landroidx/compose/ui/Alignment;Landroidx/compose/ui/unit/LayoutDirection;)V", "animatedSize", "Landroidx/compose/runtime/State;", "Landroidx/compose/ui/unit/IntSize;", "getAnimatedSize$animation", "()Landroidx/compose/runtime/State;", "setAnimatedSize$animation", "(Landroidx/compose/runtime/State;)V", "getContentAlignment", "()Landroidx/compose/ui/Alignment;", "setContentAlignment", "(Landroidx/compose/ui/Alignment;)V", "currentSize", "getCurrentSize-YbymL2g", "()J", "initialState", "getInitialState", "()Ljava/lang/Object;", "getLayoutDirection$animation", "()Landroidx/compose/ui/unit/LayoutDirection;", "setLayoutDirection$animation", "(Landroidx/compose/ui/unit/LayoutDirection;)V", "<set-?>", "measuredSize", "getMeasuredSize-YbymL2g$animation", "setMeasuredSize-ozmzZPI$animation", "(J)V", "measuredSize$delegate", "Landroidx/compose/runtime/MutableState;", "targetSizeMap", "Landroidx/collection/MutableScatterMap;", "getTargetSizeMap$animation", "()Landroidx/collection/MutableScatterMap;", "targetState", "getTargetState", "getTransition$animation", "()Landroidx/compose/animation/core/Transition;", "isLeft", "", "Landroidx/compose/animation/AnimatedContentTransitionScope$SlideDirection;", "isLeft-gWo6LJ4", "(I)Z", "isRight", "isRight-gWo6LJ4", "calculateOffset", "Landroidx/compose/ui/unit/IntOffset;", "fullSize", "calculateOffset-emnUabE", "(JJ)J", "createSizeAnimationModifier", "Landroidx/compose/ui/Modifier;", "contentTransform", "Landroidx/compose/animation/ContentTransform;", "createSizeAnimationModifier$animation", "(Landroidx/compose/animation/ContentTransform;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/Modifier;", "slideIntoContainer", "Landroidx/compose/animation/EnterTransition;", "towards", "animationSpec", "Landroidx/compose/animation/core/FiniteAnimationSpec;", "initialOffset", "Lkotlin/Function1;", "", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "offsetForFullSlide", "slideIntoContainer-mOhB8PU", "(ILandroidx/compose/animation/core/FiniteAnimationSpec;Lkotlin/jvm/functions/Function1;)Landroidx/compose/animation/EnterTransition;", "slideOutOfContainer", "Landroidx/compose/animation/ExitTransition;", "targetOffset", "slideOutOfContainer-mOhB8PU", "(ILandroidx/compose/animation/core/FiniteAnimationSpec;Lkotlin/jvm/functions/Function1;)Landroidx/compose/animation/ExitTransition;", "using", "sizeTransform", "Landroidx/compose/animation/SizeTransform;", "ChildData", "SizeModifierElement", "SizeModifierNode", "animation", "shouldAnimateSize"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class AnimatedContentTransitionScopeImpl<S> implements AnimatedContentTransitionScope<S> {
    public static final int $stable = 8;
    private State<IntSize> animatedSize;
    private Alignment contentAlignment;
    private LayoutDirection layoutDirection;
    private final MutableState measuredSize$delegate;
    private final MutableScatterMap<S, State<IntSize>> targetSizeMap;
    private final Transition<S> transition;

    public AnimatedContentTransitionScopeImpl(Transition<S> transition, Alignment contentAlignment, LayoutDirection layoutDirection) {
        MutableState mutableStateOf$default;
        this.transition = transition;
        this.contentAlignment = contentAlignment;
        this.layoutDirection = layoutDirection;
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(IntSize.m7036boximpl(IntSize.Companion.m7049getZeroYbymL2g()), null, 2, null);
        this.measuredSize$delegate = mutableStateOf$default;
        this.targetSizeMap = ScatterMapKt.mutableScatterMapOf();
    }

    public final Transition<S> getTransition$animation() {
        return this.transition;
    }

    @Override // androidx.compose.animation.AnimatedContentTransitionScope
    public Alignment getContentAlignment() {
        return this.contentAlignment;
    }

    public void setContentAlignment(Alignment alignment) {
        this.contentAlignment = alignment;
    }

    public final LayoutDirection getLayoutDirection$animation() {
        return this.layoutDirection;
    }

    public final void setLayoutDirection$animation(LayoutDirection layoutDirection) {
        this.layoutDirection = layoutDirection;
    }

    @Override // androidx.compose.animation.core.Transition.Segment
    public S getInitialState() {
        return this.transition.getSegment().getInitialState();
    }

    @Override // androidx.compose.animation.core.Transition.Segment
    public S getTargetState() {
        return this.transition.getSegment().getTargetState();
    }

    @Override // androidx.compose.animation.AnimatedContentTransitionScope
    public ContentTransform using(ContentTransform $this$using, SizeTransform sizeTransform) {
        $this$using.setSizeTransform$animation(sizeTransform);
        return $this$using;
    }

    @Override // androidx.compose.animation.AnimatedContentTransitionScope
    /* renamed from: slideIntoContainer-mOhB8PU */
    public EnterTransition mo303slideIntoContainermOhB8PU(int towards, FiniteAnimationSpec<IntOffset> finiteAnimationSpec, final Function1<? super Integer, Integer> function1) {
        if (m322isLeftgWo6LJ4(towards)) {
            return EnterExitTransitionKt.slideInHorizontally(finiteAnimationSpec, new Function1<Integer, Integer>() { // from class: androidx.compose.animation.AnimatedContentTransitionScopeImpl$slideIntoContainer$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Integer invoke(Integer num) {
                    return invoke(num.intValue());
                }

                public final Integer invoke(int it) {
                    long arg0$iv;
                    long m321getCurrentSizeYbymL2g;
                    long m320calculateOffsetemnUabE;
                    Function1<Integer, Integer> function12 = function1;
                    arg0$iv = this.m321getCurrentSizeYbymL2g();
                    AnimatedContentTransitionScopeImpl<S> animatedContentTransitionScopeImpl = this;
                    long m7039constructorimpl = IntSize.m7039constructorimpl((it << 32) | (it & 4294967295L));
                    m321getCurrentSizeYbymL2g = this.m321getCurrentSizeYbymL2g();
                    m320calculateOffsetemnUabE = animatedContentTransitionScopeImpl.m320calculateOffsetemnUabE(m7039constructorimpl, m321getCurrentSizeYbymL2g);
                    return function12.invoke(Integer.valueOf(((int) (arg0$iv >> 32)) - IntOffset.m7001getXimpl(m320calculateOffsetemnUabE)));
                }
            });
        }
        if (m323isRightgWo6LJ4(towards)) {
            return EnterExitTransitionKt.slideInHorizontally(finiteAnimationSpec, new Function1<Integer, Integer>() { // from class: androidx.compose.animation.AnimatedContentTransitionScopeImpl$slideIntoContainer$2
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Integer invoke(Integer num) {
                    return invoke(num.intValue());
                }

                public final Integer invoke(int it) {
                    long m321getCurrentSizeYbymL2g;
                    long m320calculateOffsetemnUabE;
                    Function1<Integer, Integer> function12 = function1;
                    AnimatedContentTransitionScopeImpl<S> animatedContentTransitionScopeImpl = this;
                    long m7039constructorimpl = IntSize.m7039constructorimpl((it << 32) | (it & 4294967295L));
                    m321getCurrentSizeYbymL2g = this.m321getCurrentSizeYbymL2g();
                    m320calculateOffsetemnUabE = animatedContentTransitionScopeImpl.m320calculateOffsetemnUabE(m7039constructorimpl, m321getCurrentSizeYbymL2g);
                    return function12.invoke(Integer.valueOf((-IntOffset.m7001getXimpl(m320calculateOffsetemnUabE)) - it));
                }
            });
        }
        if (AnimatedContentTransitionScope.SlideDirection.m308equalsimpl0(towards, AnimatedContentTransitionScope.SlideDirection.Companion.m317getUpDKzdypw())) {
            return EnterExitTransitionKt.slideInVertically(finiteAnimationSpec, new Function1<Integer, Integer>() { // from class: androidx.compose.animation.AnimatedContentTransitionScopeImpl$slideIntoContainer$3
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Integer invoke(Integer num) {
                    return invoke(num.intValue());
                }

                public final Integer invoke(int it) {
                    long arg0$iv;
                    long m321getCurrentSizeYbymL2g;
                    long m320calculateOffsetemnUabE;
                    Function1<Integer, Integer> function12 = function1;
                    arg0$iv = this.m321getCurrentSizeYbymL2g();
                    int i = (int) (arg0$iv & 4294967295L);
                    AnimatedContentTransitionScopeImpl<S> animatedContentTransitionScopeImpl = this;
                    long m7039constructorimpl = IntSize.m7039constructorimpl((it << 32) | (4294967295L & it));
                    m321getCurrentSizeYbymL2g = this.m321getCurrentSizeYbymL2g();
                    m320calculateOffsetemnUabE = animatedContentTransitionScopeImpl.m320calculateOffsetemnUabE(m7039constructorimpl, m321getCurrentSizeYbymL2g);
                    return function12.invoke(Integer.valueOf(i - IntOffset.m7002getYimpl(m320calculateOffsetemnUabE)));
                }
            });
        }
        if (AnimatedContentTransitionScope.SlideDirection.m308equalsimpl0(towards, AnimatedContentTransitionScope.SlideDirection.Companion.m312getDownDKzdypw())) {
            return EnterExitTransitionKt.slideInVertically(finiteAnimationSpec, new Function1<Integer, Integer>() { // from class: androidx.compose.animation.AnimatedContentTransitionScopeImpl$slideIntoContainer$4
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Integer invoke(Integer num) {
                    return invoke(num.intValue());
                }

                public final Integer invoke(int it) {
                    long m321getCurrentSizeYbymL2g;
                    long m320calculateOffsetemnUabE;
                    Function1<Integer, Integer> function12 = function1;
                    AnimatedContentTransitionScopeImpl<S> animatedContentTransitionScopeImpl = this;
                    long m7039constructorimpl = IntSize.m7039constructorimpl((it << 32) | (it & 4294967295L));
                    m321getCurrentSizeYbymL2g = this.m321getCurrentSizeYbymL2g();
                    m320calculateOffsetemnUabE = animatedContentTransitionScopeImpl.m320calculateOffsetemnUabE(m7039constructorimpl, m321getCurrentSizeYbymL2g);
                    return function12.invoke(Integer.valueOf((-IntOffset.m7002getYimpl(m320calculateOffsetemnUabE)) - it));
                }
            });
        }
        return EnterTransition.Companion.getNone();
    }

    /* renamed from: isLeft-gWo6LJ4  reason: not valid java name */
    private final boolean m322isLeftgWo6LJ4(int $this$isLeft) {
        return AnimatedContentTransitionScope.SlideDirection.m308equalsimpl0($this$isLeft, AnimatedContentTransitionScope.SlideDirection.Companion.m314getLeftDKzdypw()) || (AnimatedContentTransitionScope.SlideDirection.m308equalsimpl0($this$isLeft, AnimatedContentTransitionScope.SlideDirection.Companion.m316getStartDKzdypw()) && this.layoutDirection == LayoutDirection.Ltr) || (AnimatedContentTransitionScope.SlideDirection.m308equalsimpl0($this$isLeft, AnimatedContentTransitionScope.SlideDirection.Companion.m313getEndDKzdypw()) && this.layoutDirection == LayoutDirection.Rtl);
    }

    /* renamed from: isRight-gWo6LJ4  reason: not valid java name */
    private final boolean m323isRightgWo6LJ4(int $this$isRight) {
        return AnimatedContentTransitionScope.SlideDirection.m308equalsimpl0($this$isRight, AnimatedContentTransitionScope.SlideDirection.Companion.m315getRightDKzdypw()) || (AnimatedContentTransitionScope.SlideDirection.m308equalsimpl0($this$isRight, AnimatedContentTransitionScope.SlideDirection.Companion.m316getStartDKzdypw()) && this.layoutDirection == LayoutDirection.Rtl) || (AnimatedContentTransitionScope.SlideDirection.m308equalsimpl0($this$isRight, AnimatedContentTransitionScope.SlideDirection.Companion.m313getEndDKzdypw()) && this.layoutDirection == LayoutDirection.Ltr);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: calculateOffset-emnUabE  reason: not valid java name */
    public final long m320calculateOffsetemnUabE(long fullSize, long currentSize) {
        return getContentAlignment().mo3865alignKFBX0sM(fullSize, currentSize, LayoutDirection.Ltr);
    }

    @Override // androidx.compose.animation.AnimatedContentTransitionScope
    /* renamed from: slideOutOfContainer-mOhB8PU */
    public ExitTransition mo304slideOutOfContainermOhB8PU(int towards, FiniteAnimationSpec<IntOffset> finiteAnimationSpec, final Function1<? super Integer, Integer> function1) {
        if (m322isLeftgWo6LJ4(towards)) {
            return EnterExitTransitionKt.slideOutHorizontally(finiteAnimationSpec, new Function1<Integer, Integer>(this) { // from class: androidx.compose.animation.AnimatedContentTransitionScopeImpl$slideOutOfContainer$1
                final /* synthetic */ AnimatedContentTransitionScopeImpl<S> this$0;

                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(1);
                    this.this$0 = this;
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Integer invoke(Integer num) {
                    return invoke(num.intValue());
                }

                public final Integer invoke(int it) {
                    long m320calculateOffsetemnUabE;
                    State state = (State) this.this$0.getTargetSizeMap$animation().get(this.this$0.getTransition$animation().getTargetState());
                    long targetSize = state != null ? ((IntSize) state.getValue()).m7048unboximpl() : IntSize.Companion.m7049getZeroYbymL2g();
                    Function1<Integer, Integer> function12 = function1;
                    m320calculateOffsetemnUabE = this.this$0.m320calculateOffsetemnUabE(IntSize.m7039constructorimpl((it << 32) | (it & 4294967295L)), targetSize);
                    return function12.invoke(Integer.valueOf((-IntOffset.m7001getXimpl(m320calculateOffsetemnUabE)) - it));
                }
            });
        }
        if (m323isRightgWo6LJ4(towards)) {
            return EnterExitTransitionKt.slideOutHorizontally(finiteAnimationSpec, new Function1<Integer, Integer>(this) { // from class: androidx.compose.animation.AnimatedContentTransitionScopeImpl$slideOutOfContainer$2
                final /* synthetic */ AnimatedContentTransitionScopeImpl<S> this$0;

                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(1);
                    this.this$0 = this;
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Integer invoke(Integer num) {
                    return invoke(num.intValue());
                }

                public final Integer invoke(int it) {
                    long m320calculateOffsetemnUabE;
                    State state = (State) this.this$0.getTargetSizeMap$animation().get(this.this$0.getTransition$animation().getTargetState());
                    long targetSize = state != null ? ((IntSize) state.getValue()).m7048unboximpl() : IntSize.Companion.m7049getZeroYbymL2g();
                    Function1<Integer, Integer> function12 = function1;
                    m320calculateOffsetemnUabE = this.this$0.m320calculateOffsetemnUabE(IntSize.m7039constructorimpl((it << 32) | (it & 4294967295L)), targetSize);
                    long value$iv$iv = targetSize;
                    return function12.invoke(Integer.valueOf((-IntOffset.m7001getXimpl(m320calculateOffsetemnUabE)) + ((int) (value$iv$iv >> 32))));
                }
            });
        }
        if (AnimatedContentTransitionScope.SlideDirection.m308equalsimpl0(towards, AnimatedContentTransitionScope.SlideDirection.Companion.m317getUpDKzdypw())) {
            return EnterExitTransitionKt.slideOutVertically(finiteAnimationSpec, new Function1<Integer, Integer>(this) { // from class: androidx.compose.animation.AnimatedContentTransitionScopeImpl$slideOutOfContainer$3
                final /* synthetic */ AnimatedContentTransitionScopeImpl<S> this$0;

                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(1);
                    this.this$0 = this;
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Integer invoke(Integer num) {
                    return invoke(num.intValue());
                }

                public final Integer invoke(int it) {
                    long m320calculateOffsetemnUabE;
                    State state = (State) this.this$0.getTargetSizeMap$animation().get(this.this$0.getTransition$animation().getTargetState());
                    long targetSize = state != null ? ((IntSize) state.getValue()).m7048unboximpl() : IntSize.Companion.m7049getZeroYbymL2g();
                    Function1<Integer, Integer> function12 = function1;
                    m320calculateOffsetemnUabE = this.this$0.m320calculateOffsetemnUabE(IntSize.m7039constructorimpl((it << 32) | (it & 4294967295L)), targetSize);
                    return function12.invoke(Integer.valueOf((-IntOffset.m7002getYimpl(m320calculateOffsetemnUabE)) - it));
                }
            });
        }
        if (AnimatedContentTransitionScope.SlideDirection.m308equalsimpl0(towards, AnimatedContentTransitionScope.SlideDirection.Companion.m312getDownDKzdypw())) {
            return EnterExitTransitionKt.slideOutVertically(finiteAnimationSpec, new Function1<Integer, Integer>(this) { // from class: androidx.compose.animation.AnimatedContentTransitionScopeImpl$slideOutOfContainer$4
                final /* synthetic */ AnimatedContentTransitionScopeImpl<S> this$0;

                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(1);
                    this.this$0 = this;
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Integer invoke(Integer num) {
                    return invoke(num.intValue());
                }

                public final Integer invoke(int it) {
                    long m320calculateOffsetemnUabE;
                    State state = (State) this.this$0.getTargetSizeMap$animation().get(this.this$0.getTransition$animation().getTargetState());
                    long targetSize = state != null ? ((IntSize) state.getValue()).m7048unboximpl() : IntSize.Companion.m7049getZeroYbymL2g();
                    Function1<Integer, Integer> function12 = function1;
                    m320calculateOffsetemnUabE = this.this$0.m320calculateOffsetemnUabE(IntSize.m7039constructorimpl((it << 32) | (it & 4294967295L)), targetSize);
                    long value$iv$iv = targetSize;
                    return function12.invoke(Integer.valueOf((-IntOffset.m7002getYimpl(m320calculateOffsetemnUabE)) + ((int) (value$iv$iv & 4294967295L))));
                }
            });
        }
        return ExitTransition.Companion.getNone();
    }

    /* renamed from: getMeasuredSize-YbymL2g$animation  reason: not valid java name */
    public final long m324getMeasuredSizeYbymL2g$animation() {
        State $this$getValue$iv = this.measuredSize$delegate;
        return ((IntSize) $this$getValue$iv.getValue()).m7048unboximpl();
    }

    /* renamed from: setMeasuredSize-ozmzZPI$animation  reason: not valid java name */
    public final void m325setMeasuredSizeozmzZPI$animation(long j) {
        MutableState $this$setValue$iv = this.measuredSize$delegate;
        $this$setValue$iv.setValue(IntSize.m7036boximpl(j));
    }

    public final MutableScatterMap<S, State<IntSize>> getTargetSizeMap$animation() {
        return this.targetSizeMap;
    }

    public final State<IntSize> getAnimatedSize$animation() {
        return this.animatedSize;
    }

    public final void setAnimatedSize$animation(State<IntSize> state) {
        this.animatedSize = state;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: getCurrentSize-YbymL2g  reason: not valid java name */
    public final long m321getCurrentSizeYbymL2g() {
        State<IntSize> state = this.animatedSize;
        return state != null ? state.getValue().m7048unboximpl() : m324getMeasuredSizeYbymL2g$animation();
    }

    public final Modifier createSizeAnimationModifier$animation(ContentTransform contentTransform, Composer $composer, int $changed) {
        Object value$iv;
        Transition.DeferredAnimation sizeAnimation;
        Modifier.Companion companion;
        ComposerKt.sourceInformationMarkerStart($composer, 93755870, "C(createSizeAnimationModifier)557@27860L40,558@27929L52:AnimatedContent.kt#xbi5r1");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(93755870, $changed, -1, "androidx.compose.animation.AnimatedContentTransitionScopeImpl.createSizeAnimationModifier (AnimatedContent.kt:556)");
        }
        ComposerKt.sourceInformationMarkerStart($composer, -546154068, "CC(remember):AnimatedContent.kt#9igjgp");
        boolean invalid$iv = $composer.changed(this);
        Object it$iv = $composer.rememberedValue();
        boolean z = false;
        if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
            value$iv = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
            $composer.updateRememberedValue(value$iv);
            it$iv = value$iv;
        }
        MutableState shouldAnimateSize$delegate = (MutableState) it$iv;
        ComposerKt.sourceInformationMarkerEnd($composer);
        State sizeTransform = SnapshotStateKt.rememberUpdatedState(contentTransform.getSizeTransform(), $composer, 0);
        if (Intrinsics.areEqual(this.transition.getCurrentState(), this.transition.getTargetState())) {
            createSizeAnimationModifier$lambda$3(shouldAnimateSize$delegate, false);
        } else if (sizeTransform.getValue() != null) {
            createSizeAnimationModifier$lambda$3(shouldAnimateSize$delegate, true);
        }
        if (createSizeAnimationModifier$lambda$2(shouldAnimateSize$delegate)) {
            $composer.startReplaceGroup(249676467);
            ComposerKt.sourceInformation($composer, "569@28486L48,570@28551L143");
            sizeAnimation = androidx.compose.animation.core.TransitionKt.createDeferredAnimation(this.transition, VectorConvertersKt.getVectorConverter(IntSize.Companion), null, $composer, 0, 2);
            ComposerKt.sourceInformationMarkerStart($composer, -546131853, "CC(remember):AnimatedContent.kt#9igjgp");
            boolean invalid$iv2 = $composer.changed(sizeAnimation);
            Object it$iv2 = $composer.rememberedValue();
            if (invalid$iv2 || it$iv2 == Composer.Companion.getEmpty()) {
                SizeTransform sizeTransform2 = (SizeTransform) sizeTransform.getValue();
                if (sizeTransform2 != null && !sizeTransform2.getClip()) {
                    z = true;
                }
                Object value$iv2 = z ? (Modifier) Modifier.Companion : ClipKt.clipToBounds(Modifier.Companion);
                $composer.updateRememberedValue(value$iv2);
                it$iv2 = value$iv2;
            }
            companion = (Modifier) it$iv2;
            ComposerKt.sourceInformationMarkerEnd($composer);
            $composer.endReplaceGroup();
        } else {
            $composer.startReplaceGroup(249942509);
            $composer.endReplaceGroup();
            sizeAnimation = null;
            this.animatedSize = null;
            companion = Modifier.Companion;
        }
        Modifier then = companion.then(new SizeModifierElement(sizeAnimation, sizeTransform, this));
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return then;
    }

    private static final boolean createSizeAnimationModifier$lambda$2(MutableState<Boolean> mutableState) {
        MutableState<Boolean> $this$getValue$iv = mutableState;
        return $this$getValue$iv.getValue().booleanValue();
    }

    private static final void createSizeAnimationModifier$lambda$3(MutableState<Boolean> mutableState, boolean value) {
        mutableState.setValue(Boolean.valueOf(value));
    }

    /* compiled from: AnimatedContent.kt */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0016\u0010\n\u001a\u00020\u000b*\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u000bH\u0016R+\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0005\u001a\u00020\u00038F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b\b\u0010\t\u001a\u0004\b\u0002\u0010\u0006\"\u0004\b\u0007\u0010\u0004¨\u0006\u000e"}, d2 = {"Landroidx/compose/animation/AnimatedContentTransitionScopeImpl$ChildData;", "Landroidx/compose/ui/layout/ParentDataModifier;", "isTarget", "", "(Z)V", "<set-?>", "()Z", "setTarget", "isTarget$delegate", "Landroidx/compose/runtime/MutableState;", "modifyParentData", "", "Landroidx/compose/ui/unit/Density;", "parentData", "animation"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class ChildData implements ParentDataModifier {
        public static final int $stable = 0;
        private final MutableState isTarget$delegate;

        public ChildData(boolean isTarget) {
            MutableState mutableStateOf$default;
            mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(Boolean.valueOf(isTarget), null, 2, null);
            this.isTarget$delegate = mutableStateOf$default;
        }

        public final boolean isTarget() {
            State $this$getValue$iv = this.isTarget$delegate;
            return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
        }

        public final void setTarget(boolean z) {
            MutableState $this$setValue$iv = this.isTarget$delegate;
            $this$setValue$iv.setValue(Boolean.valueOf(z));
        }

        @Override // androidx.compose.ui.layout.ParentDataModifier
        public Object modifyParentData(Density $this$modifyParentData, Object parentData) {
            return this;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: AnimatedContent.kt */
    @Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u0000*\u0004\b\u0001\u0010\u00012\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00010\u00030\u0002BC\u0012\u001e\u0010\u0004\u001a\u001a\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0005R\b\u0012\u0004\u0012\u00028\u00010\b\u0012\u000e\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u000b0\n\u0012\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00010\r¢\u0006\u0002\u0010\u000eJ\u000e\u0010\u0015\u001a\b\u0012\u0004\u0012\u00028\u00010\u0003H\u0016J\u0013\u0010\u0016\u001a\u00020\u00172\b\u0010\u0018\u001a\u0004\u0018\u00010\u0019H\u0096\u0002J\b\u0010\u001a\u001a\u00020\u001bH\u0016J\u0016\u0010\u001c\u001a\u00020\u001d2\f\u0010\u001e\u001a\b\u0012\u0004\u0012\u00028\u00010\u0003H\u0016J\f\u0010\u001f\u001a\u00020\u001d*\u00020 H\u0016R\u0017\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R)\u0010\u0004\u001a\u001a\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0005R\b\u0012\u0004\u0012\u00028\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0019\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u000b0\n¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014¨\u0006!"}, d2 = {"Landroidx/compose/animation/AnimatedContentTransitionScopeImpl$SizeModifierElement;", ExifInterface.LATITUDE_SOUTH, "Landroidx/compose/ui/node/ModifierNodeElement;", "Landroidx/compose/animation/AnimatedContentTransitionScopeImpl$SizeModifierNode;", "sizeAnimation", "Landroidx/compose/animation/core/Transition$DeferredAnimation;", "Landroidx/compose/ui/unit/IntSize;", "Landroidx/compose/animation/core/AnimationVector2D;", "Landroidx/compose/animation/core/Transition;", "sizeTransform", "Landroidx/compose/runtime/State;", "Landroidx/compose/animation/SizeTransform;", "scope", "Landroidx/compose/animation/AnimatedContentTransitionScopeImpl;", "(Landroidx/compose/animation/core/Transition$DeferredAnimation;Landroidx/compose/runtime/State;Landroidx/compose/animation/AnimatedContentTransitionScopeImpl;)V", "getScope", "()Landroidx/compose/animation/AnimatedContentTransitionScopeImpl;", "getSizeAnimation", "()Landroidx/compose/animation/core/Transition$DeferredAnimation;", "getSizeTransform", "()Landroidx/compose/runtime/State;", "create", "equals", "", "other", "", "hashCode", "", "update", "", "node", "inspectableProperties", "Landroidx/compose/ui/platform/InspectorInfo;", "animation"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class SizeModifierElement<S> extends ModifierNodeElement<SizeModifierNode<S>> {
        private final AnimatedContentTransitionScopeImpl<S> scope;
        private final Transition<S>.DeferredAnimation<IntSize, AnimationVector2D> sizeAnimation;
        private final State<SizeTransform> sizeTransform;

        @Override // androidx.compose.ui.node.ModifierNodeElement
        public /* bridge */ /* synthetic */ void update(Modifier.Node node) {
            update((SizeModifierNode) ((SizeModifierNode) node));
        }

        public final Transition<S>.DeferredAnimation<IntSize, AnimationVector2D> getSizeAnimation() {
            return this.sizeAnimation;
        }

        public final State<SizeTransform> getSizeTransform() {
            return this.sizeTransform;
        }

        public final AnimatedContentTransitionScopeImpl<S> getScope() {
            return this.scope;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public SizeModifierElement(Transition<S>.DeferredAnimation<IntSize, AnimationVector2D> deferredAnimation, State<? extends SizeTransform> state, AnimatedContentTransitionScopeImpl<S> animatedContentTransitionScopeImpl) {
            this.sizeAnimation = deferredAnimation;
            this.sizeTransform = state;
            this.scope = animatedContentTransitionScopeImpl;
        }

        @Override // androidx.compose.ui.node.ModifierNodeElement
        public SizeModifierNode<S> create() {
            return new SizeModifierNode<>(this.sizeAnimation, this.sizeTransform, this.scope);
        }

        @Override // androidx.compose.ui.node.ModifierNodeElement
        public int hashCode() {
            int hashCode = this.scope.hashCode() * 31;
            Transition<S>.DeferredAnimation<IntSize, AnimationVector2D> deferredAnimation = this.sizeAnimation;
            return ((hashCode + (deferredAnimation != null ? deferredAnimation.hashCode() : 0)) * 31) + this.sizeTransform.hashCode();
        }

        @Override // androidx.compose.ui.node.ModifierNodeElement
        public boolean equals(Object other) {
            return (other instanceof SizeModifierElement) && Intrinsics.areEqual(((SizeModifierElement) other).sizeAnimation, this.sizeAnimation) && Intrinsics.areEqual(((SizeModifierElement) other).sizeTransform, this.sizeTransform);
        }

        public void update(SizeModifierNode<S> sizeModifierNode) {
            sizeModifierNode.setSizeAnimation(this.sizeAnimation);
            sizeModifierNode.setSizeTransform(this.sizeTransform);
            sizeModifierNode.setScope(this.scope);
        }

        @Override // androidx.compose.ui.node.ModifierNodeElement
        public void inspectableProperties(InspectorInfo $this$inspectableProperties) {
            $this$inspectableProperties.setName("sizeTransform");
            $this$inspectableProperties.getProperties().set("sizeAnimation", this.sizeAnimation);
            $this$inspectableProperties.getProperties().set("sizeTransform", this.sizeTransform);
            $this$inspectableProperties.getProperties().set("scope", this.scope);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: AnimatedContent.kt */
    @Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0014\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0002\u0018\u0000*\u0004\b\u0001\u0010\u00012\u00020\u0002BC\u0012\u001e\u0010\u0003\u001a\u001a\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0004R\b\u0012\u0004\u0012\u00028\u00010\u0007\u0012\u000e\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\t\u0012\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u00028\u00010\f¢\u0006\u0002\u0010\rJ\u001a\u0010\u001c\u001a\u00020\u00052\u0006\u0010\u001d\u001a\u00020\u0005H\u0002ø\u0001\u0000¢\u0006\u0004\b\u001e\u0010\u001fJ\b\u0010 \u001a\u00020!H\u0016J&\u0010\"\u001a\u00020#*\u00020$2\u0006\u0010%\u001a\u00020&2\u0006\u0010'\u001a\u00020(H\u0016ø\u0001\u0000¢\u0006\u0004\b)\u0010*R\u0016\u0010\u000e\u001a\u00020\u0005X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u000fR \u0010\u000b\u001a\b\u0012\u0004\u0012\u00028\u00010\fX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0010\u0010\u0011\"\u0004\b\u0012\u0010\u0013R2\u0010\u0003\u001a\u001a\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0004R\b\u0012\u0004\u0012\u00028\u00010\u0007X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0014\u0010\u0015\"\u0004\b\u0016\u0010\u0017R\"\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\tX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0018\u0010\u0019\"\u0004\b\u001a\u0010\u001b\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006+"}, d2 = {"Landroidx/compose/animation/AnimatedContentTransitionScopeImpl$SizeModifierNode;", ExifInterface.LATITUDE_SOUTH, "Landroidx/compose/animation/LayoutModifierNodeWithPassThroughIntrinsics;", "sizeAnimation", "Landroidx/compose/animation/core/Transition$DeferredAnimation;", "Landroidx/compose/ui/unit/IntSize;", "Landroidx/compose/animation/core/AnimationVector2D;", "Landroidx/compose/animation/core/Transition;", "sizeTransform", "Landroidx/compose/runtime/State;", "Landroidx/compose/animation/SizeTransform;", "scope", "Landroidx/compose/animation/AnimatedContentTransitionScopeImpl;", "(Landroidx/compose/animation/core/Transition$DeferredAnimation;Landroidx/compose/runtime/State;Landroidx/compose/animation/AnimatedContentTransitionScopeImpl;)V", "lastSize", "J", "getScope", "()Landroidx/compose/animation/AnimatedContentTransitionScopeImpl;", "setScope", "(Landroidx/compose/animation/AnimatedContentTransitionScopeImpl;)V", "getSizeAnimation", "()Landroidx/compose/animation/core/Transition$DeferredAnimation;", "setSizeAnimation", "(Landroidx/compose/animation/core/Transition$DeferredAnimation;)V", "getSizeTransform", "()Landroidx/compose/runtime/State;", "setSizeTransform", "(Landroidx/compose/runtime/State;)V", "lastContinuousSizeOrDefault", "default", "lastContinuousSizeOrDefault-mzRDjE0", "(J)J", "onReset", "", "measure", "Landroidx/compose/ui/layout/MeasureResult;", "Landroidx/compose/ui/layout/MeasureScope;", "measurable", "Landroidx/compose/ui/layout/Measurable;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "measure-3p2s80s", "(Landroidx/compose/ui/layout/MeasureScope;Landroidx/compose/ui/layout/Measurable;J)Landroidx/compose/ui/layout/MeasureResult;", "animation"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class SizeModifierNode<S> extends LayoutModifierNodeWithPassThroughIntrinsics {
        private long lastSize;
        private AnimatedContentTransitionScopeImpl<S> scope;
        private Transition<S>.DeferredAnimation<IntSize, AnimationVector2D> sizeAnimation;
        private State<? extends SizeTransform> sizeTransform;

        public final Transition<S>.DeferredAnimation<IntSize, AnimationVector2D> getSizeAnimation() {
            return this.sizeAnimation;
        }

        public final void setSizeAnimation(Transition<S>.DeferredAnimation<IntSize, AnimationVector2D> deferredAnimation) {
            this.sizeAnimation = deferredAnimation;
        }

        public final State<SizeTransform> getSizeTransform() {
            return this.sizeTransform;
        }

        public final void setSizeTransform(State<? extends SizeTransform> state) {
            this.sizeTransform = state;
        }

        public final AnimatedContentTransitionScopeImpl<S> getScope() {
            return this.scope;
        }

        public final void setScope(AnimatedContentTransitionScopeImpl<S> animatedContentTransitionScopeImpl) {
            this.scope = animatedContentTransitionScopeImpl;
        }

        public SizeModifierNode(Transition<S>.DeferredAnimation<IntSize, AnimationVector2D> deferredAnimation, State<? extends SizeTransform> state, AnimatedContentTransitionScopeImpl<S> animatedContentTransitionScopeImpl) {
            long j;
            this.sizeAnimation = deferredAnimation;
            this.sizeTransform = state;
            this.scope = animatedContentTransitionScopeImpl;
            j = AnimatedContentKt.UnspecifiedSize;
            this.lastSize = j;
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* renamed from: lastContinuousSizeOrDefault-mzRDjE0  reason: not valid java name */
        public final long m327lastContinuousSizeOrDefaultmzRDjE0(long j) {
            long j2;
            long j3 = this.lastSize;
            j2 = AnimatedContentKt.UnspecifiedSize;
            return IntSize.m7042equalsimpl0(j3, j2) ? j : this.lastSize;
        }

        @Override // androidx.compose.ui.Modifier.Node
        public void onReset() {
            long j;
            super.onReset();
            j = AnimatedContentKt.UnspecifiedSize;
            this.lastSize = j;
        }

        @Override // androidx.compose.ui.node.LayoutModifierNode
        /* renamed from: measure-3p2s80s  reason: not valid java name */
        public MeasureResult mo328measure3p2s80s(MeasureScope $this$measure_u2d3p2s80s, Measurable measurable, long constraints) {
            final long measuredSize;
            final Placeable placeable = measurable.mo5637measureBRTryo0(constraints);
            if ($this$measure_u2d3p2s80s.isLookingAhead()) {
                int width$iv = placeable.getWidth();
                int height$iv = placeable.getHeight();
                measuredSize = IntSize.m7039constructorimpl((width$iv << 32) | (height$iv & 4294967295L));
            } else if (this.sizeAnimation == null) {
                int width$iv2 = placeable.getWidth();
                int height$iv2 = placeable.getHeight();
                measuredSize = IntSize.m7039constructorimpl((width$iv2 << 32) | (height$iv2 & 4294967295L));
                int width$iv3 = placeable.getWidth();
                int height$iv3 = placeable.getHeight();
                this.lastSize = IntSize.m7039constructorimpl((width$iv3 << 32) | (height$iv3 & 4294967295L));
            } else {
                int width$iv4 = placeable.getWidth();
                int height$iv4 = placeable.getHeight();
                final long currentSize = IntSize.m7039constructorimpl((width$iv4 << 32) | (height$iv4 & 4294967295L));
                Transition<S>.DeferredAnimation<IntSize, AnimationVector2D> deferredAnimation = this.sizeAnimation;
                Intrinsics.checkNotNull(deferredAnimation);
                State size = deferredAnimation.animate(new Function1<Transition.Segment<S>, FiniteAnimationSpec<IntSize>>(this) { // from class: androidx.compose.animation.AnimatedContentTransitionScopeImpl$SizeModifierNode$measure$size$1
                    final /* synthetic */ AnimatedContentTransitionScopeImpl.SizeModifierNode<S> this$0;

                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(1);
                        this.this$0 = this;
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* synthetic */ FiniteAnimationSpec<IntSize> invoke(Object p1) {
                        return invoke((Transition.Segment) ((Transition.Segment) p1));
                    }

                    public final FiniteAnimationSpec<IntSize> invoke(Transition.Segment<S> segment) {
                        long initial;
                        FiniteAnimationSpec<IntSize> mo389createAnimationSpecTemP2vQ;
                        boolean areEqual = Intrinsics.areEqual(segment.getInitialState(), this.this$0.getScope().getInitialState());
                        AnimatedContentTransitionScopeImpl.SizeModifierNode<S> sizeModifierNode = this.this$0;
                        if (areEqual) {
                            initial = sizeModifierNode.m327lastContinuousSizeOrDefaultmzRDjE0(currentSize);
                        } else {
                            State<IntSize> state = sizeModifierNode.getScope().getTargetSizeMap$animation().get(segment.getInitialState());
                            initial = state != null ? state.getValue().m7048unboximpl() : IntSize.Companion.m7049getZeroYbymL2g();
                        }
                        State<IntSize> state2 = this.this$0.getScope().getTargetSizeMap$animation().get(segment.getTargetState());
                        long target = state2 != null ? state2.getValue().m7048unboximpl() : IntSize.Companion.m7049getZeroYbymL2g();
                        SizeTransform value = this.this$0.getSizeTransform().getValue();
                        return (value == null || (mo389createAnimationSpecTemP2vQ = value.mo389createAnimationSpecTemP2vQ(initial, target)) == null) ? AnimationSpecKt.spring$default(0.0f, 400.0f, null, 5, null) : mo389createAnimationSpecTemP2vQ;
                    }
                }, (Function1) ((Function1<S, IntSize>) new Function1<S, IntSize>(this) { // from class: androidx.compose.animation.AnimatedContentTransitionScopeImpl$SizeModifierNode$measure$size$2
                    final /* synthetic */ AnimatedContentTransitionScopeImpl.SizeModifierNode<S> this$0;

                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(1);
                        this.this$0 = this;
                    }

                    /* JADX WARN: Multi-variable type inference failed */
                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* synthetic */ IntSize invoke(Object p1) {
                        return IntSize.m7036boximpl(m329invokeYEO4UFw(p1));
                    }

                    /* renamed from: invoke-YEO4UFw  reason: not valid java name */
                    public final long m329invokeYEO4UFw(S s) {
                        long m327lastContinuousSizeOrDefaultmzRDjE0;
                        boolean areEqual = Intrinsics.areEqual(s, this.this$0.getScope().getInitialState());
                        AnimatedContentTransitionScopeImpl.SizeModifierNode<S> sizeModifierNode = this.this$0;
                        if (areEqual) {
                            m327lastContinuousSizeOrDefaultmzRDjE0 = sizeModifierNode.m327lastContinuousSizeOrDefaultmzRDjE0(currentSize);
                            return m327lastContinuousSizeOrDefaultmzRDjE0;
                        }
                        State<IntSize> state = sizeModifierNode.getScope().getTargetSizeMap$animation().get(s);
                        return state != null ? state.getValue().m7048unboximpl() : IntSize.Companion.m7049getZeroYbymL2g();
                    }
                }));
                this.scope.setAnimatedSize$animation(size);
                long measuredSize2 = size.getValue().m7048unboximpl();
                this.lastSize = size.getValue().m7048unboximpl();
                measuredSize = measuredSize2;
            }
            long value$iv$iv = measuredSize;
            return MeasureScope.layout$default($this$measure_u2d3p2s80s, (int) (value$iv$iv >> 32), (int) (4294967295L & value$iv$iv), null, new Function1<Placeable.PlacementScope, Unit>(this) { // from class: androidx.compose.animation.AnimatedContentTransitionScopeImpl$SizeModifierNode$measure$1
                final /* synthetic */ AnimatedContentTransitionScopeImpl.SizeModifierNode<S> this$0;

                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                    this.this$0 = this;
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(Placeable.PlacementScope placementScope) {
                    invoke2(placementScope);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(Placeable.PlacementScope $this$layout) {
                    Alignment contentAlignment = this.this$0.getScope().getContentAlignment();
                    int width$iv5 = placeable.getWidth();
                    int height$iv5 = placeable.getHeight();
                    long offset = contentAlignment.mo3865alignKFBX0sM(IntSize.m7039constructorimpl((width$iv5 << 32) | (height$iv5 & 4294967295L)), measuredSize, LayoutDirection.Ltr);
                    Placeable.PlacementScope.m5701place70tqf50$default($this$layout, placeable, offset, 0.0f, 2, null);
                }
            }, 4, null);
        }
    }
}
