.class public final Landroidx/compose/animation/core/Transition;
.super Ljava/lang/Object;
.source "Transition.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/compose/animation/core/Transition$DeferredAnimation;,
        Landroidx/compose/animation/core/Transition$Segment;,
        Landroidx/compose/animation/core/Transition$SegmentImpl;,
        Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTransition.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Transition.kt\nandroidx/compose/animation/core/Transition\n+ 2 SnapshotState.kt\nandroidx/compose/runtime/SnapshotStateKt__SnapshotStateKt\n+ 3 SnapshotLongState.kt\nandroidx/compose/runtime/SnapshotLongStateKt__SnapshotLongStateKt\n+ 4 ListUtils.kt\nandroidx/compose/ui/util/ListUtilsKt\n+ 5 Effects.kt\nandroidx/compose/runtime/EffectsKt\n+ 6 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 7 Effects.kt\nandroidx/compose/runtime/EffectsKt$rememberCoroutineScope$1\n+ 8 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,2137:1\n85#2:2138\n113#2,2:2139\n85#2:2141\n113#2,2:2142\n85#2:2150\n113#2,2:2151\n85#2:2153\n113#2,2:2154\n85#2:2174\n78#3:2144\n107#3,2:2145\n78#3:2147\n107#3,2:2148\n102#4,2:2156\n34#4,6:2158\n104#4:2164\n102#4,2:2165\n34#4,6:2167\n104#4:2173\n34#4,6:2175\n34#4,6:2181\n34#4,6:2187\n34#4,6:2193\n34#4,6:2199\n34#4,6:2205\n34#4,6:2211\n34#4,6:2217\n34#4,6:2243\n34#4,6:2249\n34#4,6:2255\n34#4,6:2261\n34#4,6:2267\n34#4,6:2273\n34#4,6:2279\n34#4,6:2285\n34#4,6:2291\n34#4,6:2297\n269#4,3:2303\n34#4,6:2306\n272#4:2312\n34#4,6:2313\n557#5:2223\n554#5,6:2224\n1247#6,3:2230\n1250#6,3:2234\n1247#6,6:2237\n555#7:2233\n1#8:2319\n*S KotlinDebug\n*F\n+ 1 Transition.kt\nandroidx/compose/animation/core/Transition\n*L\n912#1:2138\n912#1:2139,2\n919#1:2141\n919#1:2142,2\n949#1:2150\n949#1:2151,2\n965#1:2153\n965#1:2154,2\n994#1:2174\n926#1:2144\n926#1:2145,2\n946#1:2147\n946#1:2148,2\n983#1:2156,2\n983#1:2158,6\n983#1:2164\n984#1:2165,2\n984#1:2167,6\n984#1:2173\n998#1:2175,6\n999#1:2181,6\n1032#1:2187,6\n1041#1:2193,6\n1079#1:2199,6\n1117#1:2205,6\n1130#1:2211,6\n1164#1:2217,6\n1216#1:2243,6\n1217#1:2249,6\n1232#1:2255,6\n1233#1:2261,6\n1241#1:2267,6\n1242#1:2273,6\n1247#1:2279,6\n1248#1:2285,6\n1258#1:2291,6\n1259#1:2297,6\n1263#1:2303,3\n1263#1:2306,6\n1263#1:2312\n1272#1:2313,6\n1181#1:2223\n1181#1:2224,6\n1181#1:2230,3\n1181#1:2234,3\n1182#1:2237,6\n1181#1:2233\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000l\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\t\n\u0002\u0010 \n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0002\u0008\u0015\n\u0002\u0018\u0002\n\u0002\u0008 \n\u0002\u0010\u0002\n\u0002\u0008\u000e\n\u0002\u0010\u0007\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u000e\u0008\u0007\u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u00020\u0002:\u0008\u0085\u0001\u0086\u0001\u0087\u0001\u0088\u0001B!\u0008\u0011\u0012\u000c\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0004\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0002\u0010\u0007B\u0019\u0008\u0010\u0012\u0006\u0010\u0008\u001a\u00028\u0000\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0002\u0010\tB!\u0008\u0011\u0012\u000c\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00000\n\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0002\u0010\u000bB/\u0008\u0000\u0012\u000c\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0004\u0012\u000c\u0010\u000c\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0000\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0002\u0010\rJ\'\u0010S\u001a\u00020#2\u0018\u0010T\u001a\u0014\u0012\u0002\u0008\u0003\u0012\u0002\u0008\u00030\u0010R\u0008\u0012\u0004\u0012\u00028\u00000\u0000H\u0000\u00a2\u0006\u0002\u0008UJ\u0019\u0010V\u001a\u00020#2\n\u0010W\u001a\u0006\u0012\u0002\u0008\u00030\u0000H\u0000\u00a2\u0006\u0002\u0008XJ\u0017\u0010Y\u001a\u00020Z2\u0006\u0010D\u001a\u00028\u0000H\u0001\u00a2\u0006\u0004\u0008[\u0010\\J\u0008\u0010]\u001a\u00020\u0012H\u0002J\r\u0010^\u001a\u00020ZH\u0000\u00a2\u0006\u0002\u0008_J\u0008\u0010`\u001a\u00020ZH\u0002J\r\u0010a\u001a\u00020ZH\u0000\u00a2\u0006\u0002\u0008bJ\u001d\u0010c\u001a\u00020Z2\u0006\u0010d\u001a\u00020\u00122\u0006\u0010e\u001a\u00020#H\u0000\u00a2\u0006\u0002\u0008fJ\u001d\u0010c\u001a\u00020Z2\u0006\u0010g\u001a\u00020\u00122\u0006\u0010h\u001a\u00020iH\u0000\u00a2\u0006\u0002\u0008fJ\r\u0010j\u001a\u00020ZH\u0000\u00a2\u0006\u0002\u0008kJ\u0015\u0010l\u001a\u00020Z2\u0006\u0010g\u001a\u00020\u0012H\u0000\u00a2\u0006\u0002\u0008mJ\'\u0010n\u001a\u00020Z2\u0018\u0010o\u001a\u0014\u0012\u0002\u0008\u0003\u0012\u0002\u0008\u00030pR\u0008\u0012\u0004\u0012\u00028\u00000\u0000H\u0000\u00a2\u0006\u0002\u0008qJ\'\u0010n\u001a\u00020Z2\u0018\u0010T\u001a\u0014\u0012\u0002\u0008\u0003\u0012\u0002\u0008\u00030\u0010R\u0008\u0012\u0004\u0012\u00028\u00000\u0000H\u0000\u00a2\u0006\u0002\u0008qJ\u0019\u0010r\u001a\u00020#2\n\u0010W\u001a\u0006\u0012\u0002\u0008\u00030\u0000H\u0000\u00a2\u0006\u0002\u0008sJ\u0015\u0010t\u001a\u00020Z2\u0006\u0010u\u001a\u00020iH\u0000\u00a2\u0006\u0002\u0008vJ\u0015\u0010w\u001a\u00020Z2\u0006\u00106\u001a\u00020\u0012H\u0000\u00a2\u0006\u0002\u0008xJ\u0015\u0010y\u001a\u00020Z2\u0006\u0010z\u001a\u00020{H\u0000\u00a2\u0006\u0002\u0008|J\'\u0010}\u001a\u00020Z2\u0006\u0010\u0008\u001a\u00028\u00002\u0006\u0010D\u001a\u00028\u00002\u0006\u00106\u001a\u00020\u0012H\u0007\u00a2\u0006\u0004\u0008~\u0010\u007fJ\t\u0010\u0080\u0001\u001a\u00020\u0006H\u0016J\u000f\u0010\u0081\u0001\u001a\u00020ZH\u0000\u00a2\u0006\u0003\u0008\u0082\u0001J\u0019\u0010\u0083\u0001\u001a\u00020Z2\u0006\u0010D\u001a\u00028\u0000H\u0000\u00a2\u0006\u0005\u0008\u0084\u0001\u0010GR&\u0010\u000e\u001a\u001a\u0012\u0016\u0012\u0014\u0012\u0002\u0008\u0003\u0012\u0002\u0008\u00030\u0010R\u0008\u0012\u0004\u0012\u00028\u00000\u00000\u000fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R+\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u00128B@BX\u0082\u008e\u0002\u00a2\u0006\u0012\n\u0004\u0008\u0018\u0010\u0019\u001a\u0004\u0008\u0014\u0010\u0015\"\u0004\u0008\u0016\u0010\u0017R\u0018\u0010\u001a\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00000\u000fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R)\u0010\u001b\u001a\u001a\u0012\u0016\u0012\u0014\u0012\u0002\u0008\u0003\u0012\u0002\u0008\u00030\u0010R\u0008\u0012\u0004\u0012\u00028\u00000\u00000\u001c8F\u00a2\u0006\u0006\u001a\u0004\u0008\u001d\u0010\u001eR\u0011\u0010\u001f\u001a\u00028\u00008F\u00a2\u0006\u0006\u001a\u0004\u0008 \u0010!R\u001a\u0010\"\u001a\u00020#8GX\u0087\u0004\u00a2\u0006\u000c\u0012\u0004\u0008$\u0010%\u001a\u0004\u0008&\u0010\'R\u0011\u0010(\u001a\u00020#8F\u00a2\u0006\u0006\u001a\u0004\u0008(\u0010\'R+\u0010)\u001a\u00020#2\u0006\u0010\u0011\u001a\u00020#8G@AX\u0086\u008e\u0002\u00a2\u0006\u0012\n\u0004\u0008,\u0010-\u001a\u0004\u0008)\u0010\'\"\u0004\u0008*\u0010+R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008.\u0010/R\u001a\u00100\u001a\u00020\u0012X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00081\u0010\u0015\"\u0004\u00082\u0010\u0017R\u0019\u0010\u000c\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u00008\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00083\u00104R$\u00106\u001a\u00020\u00122\u0006\u00105\u001a\u00020\u00128G@GX\u0086\u000e\u00a2\u0006\u000c\u001a\u0004\u00087\u0010\u0015\"\u0004\u00088\u0010\u0017R7\u0010:\u001a\u0008\u0012\u0004\u0012\u00028\u0000092\u000c\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00028\u0000098F@BX\u0086\u008e\u0002\u00a2\u0006\u0012\n\u0004\u0008?\u0010-\u001a\u0004\u0008;\u0010<\"\u0004\u0008=\u0010>R+\u0010@\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u00128@@@X\u0080\u008e\u0002\u00a2\u0006\u0012\n\u0004\u0008C\u0010\u0019\u001a\u0004\u0008A\u0010\u0015\"\u0004\u0008B\u0010\u0017R+\u0010D\u001a\u00028\u00002\u0006\u0010\u0011\u001a\u00028\u00008F@@X\u0086\u008e\u0002\u00a2\u0006\u0012\n\u0004\u0008H\u0010-\u001a\u0004\u0008E\u0010!\"\u0004\u0008F\u0010GR\u001b\u0010I\u001a\u00020\u00128FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008K\u0010L\u001a\u0004\u0008J\u0010\u0015R\u0014\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001b\u0010M\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00000\u001c8F\u00a2\u0006\u0006\u001a\u0004\u0008N\u0010\u001eR+\u0010O\u001a\u00020#2\u0006\u0010\u0011\u001a\u00020#8B@BX\u0082\u008e\u0002\u00a2\u0006\u0012\n\u0004\u0008R\u0010-\u001a\u0004\u0008P\u0010\'\"\u0004\u0008Q\u0010+\u00a8\u0006\u0089\u0001"
    }
    d2 = {
        "Landroidx/compose/animation/core/Transition;",
        "S",
        "",
        "transitionState",
        "Landroidx/compose/animation/core/TransitionState;",
        "label",
        "",
        "(Landroidx/compose/animation/core/TransitionState;Ljava/lang/String;)V",
        "initialState",
        "(Ljava/lang/Object;Ljava/lang/String;)V",
        "Landroidx/compose/animation/core/MutableTransitionState;",
        "(Landroidx/compose/animation/core/MutableTransitionState;Ljava/lang/String;)V",
        "parentTransition",
        "(Landroidx/compose/animation/core/TransitionState;Landroidx/compose/animation/core/Transition;Ljava/lang/String;)V",
        "_animations",
        "Landroidx/compose/runtime/snapshots/SnapshotStateList;",
        "Landroidx/compose/animation/core/Transition$TransitionAnimationState;",
        "<set-?>",
        "",
        "_playTimeNanos",
        "get_playTimeNanos",
        "()J",
        "set_playTimeNanos",
        "(J)V",
        "_playTimeNanos$delegate",
        "Landroidx/compose/runtime/MutableLongState;",
        "_transitions",
        "animations",
        "",
        "getAnimations",
        "()Ljava/util/List;",
        "currentState",
        "getCurrentState",
        "()Ljava/lang/Object;",
        "hasInitialValueAnimations",
        "",
        "getHasInitialValueAnimations$annotations",
        "()V",
        "getHasInitialValueAnimations",
        "()Z",
        "isRunning",
        "isSeeking",
        "setSeeking$animation_core_release",
        "(Z)V",
        "isSeeking$delegate",
        "Landroidx/compose/runtime/MutableState;",
        "getLabel",
        "()Ljava/lang/String;",
        "lastSeekedTimeNanos",
        "getLastSeekedTimeNanos$animation_core_release",
        "setLastSeekedTimeNanos$animation_core_release",
        "getParentTransition",
        "()Landroidx/compose/animation/core/Transition;",
        "value",
        "playTimeNanos",
        "getPlayTimeNanos",
        "setPlayTimeNanos",
        "Landroidx/compose/animation/core/Transition$Segment;",
        "segment",
        "getSegment",
        "()Landroidx/compose/animation/core/Transition$Segment;",
        "setSegment",
        "(Landroidx/compose/animation/core/Transition$Segment;)V",
        "segment$delegate",
        "startTimeNanos",
        "getStartTimeNanos$animation_core_release",
        "setStartTimeNanos$animation_core_release",
        "startTimeNanos$delegate",
        "targetState",
        "getTargetState",
        "setTargetState$animation_core_release",
        "(Ljava/lang/Object;)V",
        "targetState$delegate",
        "totalDurationNanos",
        "getTotalDurationNanos",
        "totalDurationNanos$delegate",
        "Landroidx/compose/runtime/State;",
        "transitions",
        "getTransitions",
        "updateChildrenNeeded",
        "getUpdateChildrenNeeded",
        "setUpdateChildrenNeeded",
        "updateChildrenNeeded$delegate",
        "addAnimation",
        "animation",
        "addAnimation$animation_core_release",
        "addTransition",
        "transition",
        "addTransition$animation_core_release",
        "animateTo",
        "",
        "animateTo$animation_core_release",
        "(Ljava/lang/Object;Landroidx/compose/runtime/Composer;I)V",
        "calculateTotalDurationNanos",
        "clearInitialAnimations",
        "clearInitialAnimations$animation_core_release",
        "onChildAnimationUpdated",
        "onDisposed",
        "onDisposed$animation_core_release",
        "onFrame",
        "scaledPlayTimeNanos",
        "scaleToEnd",
        "onFrame$animation_core_release",
        "frameTimeNanos",
        "durationScale",
        "",
        "onTransitionEnd",
        "onTransitionEnd$animation_core_release",
        "onTransitionStart",
        "onTransitionStart$animation_core_release",
        "removeAnimation",
        "deferredAnimation",
        "Landroidx/compose/animation/core/Transition$DeferredAnimation;",
        "removeAnimation$animation_core_release",
        "removeTransition",
        "removeTransition$animation_core_release",
        "resetAnimationFraction",
        "fraction",
        "resetAnimationFraction$animation_core_release",
        "seekAnimations",
        "seekAnimations$animation_core_release",
        "setInitialAnimations",
        "animationState",
        "Landroidx/compose/animation/core/SeekableTransitionState$SeekingAnimationState;",
        "setInitialAnimations$animation_core_release",
        "setPlaytimeAfterInitialAndTargetStateEstablished",
        "seek",
        "(Ljava/lang/Object;Ljava/lang/Object;J)V",
        "toString",
        "updateInitialValues",
        "updateInitialValues$animation_core_release",
        "updateTarget",
        "updateTarget$animation_core_release",
        "DeferredAnimation",
        "Segment",
        "SegmentImpl",
        "TransitionAnimationState",
        "animation-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I


# instance fields
.field private final _animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/snapshots/SnapshotStateList<",
            "Landroidx/compose/animation/core/Transition<",
            "TS;>.TransitionAnimationState<**>;>;"
        }
    .end annotation
.end field

.field private final _playTimeNanos$delegate:Landroidx/compose/runtime/MutableLongState;

.field private final _transitions:Landroidx/compose/runtime/snapshots/SnapshotStateList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/snapshots/SnapshotStateList<",
            "Landroidx/compose/animation/core/Transition<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final isSeeking$delegate:Landroidx/compose/runtime/MutableState;

.field private final label:Ljava/lang/String;

.field private lastSeekedTimeNanos:J

.field private final parentTransition:Landroidx/compose/animation/core/Transition;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/animation/core/Transition<",
            "*>;"
        }
    .end annotation
.end field

.field private final segment$delegate:Landroidx/compose/runtime/MutableState;

.field private final startTimeNanos$delegate:Landroidx/compose/runtime/MutableLongState;

.field private final targetState$delegate:Landroidx/compose/runtime/MutableState;

.field private final totalDurationNanos$delegate:Landroidx/compose/runtime/State;

.field private final transitionState:Landroidx/compose/animation/core/TransitionState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/animation/core/TransitionState<",
            "TS;>;"
        }
    .end annotation
.end field

.field private final updateChildrenNeeded$delegate:Landroidx/compose/runtime/MutableState;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroidx/compose/animation/core/MutableTransitionState;Ljava/lang/String;)V
    .locals 2
    .param p1, "transitionState"    # Landroidx/compose/animation/core/MutableTransitionState;
    .param p2, "label"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/animation/core/MutableTransitionState<",
            "TS;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 898
    const-string/jumbo v0, "null cannot be cast to non-null type androidx.compose.animation.core.TransitionState<S of androidx.compose.animation.core.Transition>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v0, p1

    check-cast v0, Landroidx/compose/animation/core/TransitionState;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p2}, Landroidx/compose/animation/core/Transition;-><init>(Landroidx/compose/animation/core/TransitionState;Landroidx/compose/animation/core/Transition;Ljava/lang/String;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroidx/compose/animation/core/MutableTransitionState;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 895
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 897
    const/4 p2, 0x0

    .line 895
    :cond_0
    invoke-direct {p0, p1, p2}, Landroidx/compose/animation/core/Transition;-><init>(Landroidx/compose/animation/core/MutableTransitionState;Ljava/lang/String;)V

    .line 898
    return-void
.end method

.method public constructor <init>(Landroidx/compose/animation/core/TransitionState;Landroidx/compose/animation/core/Transition;Ljava/lang/String;)V
    .locals 5
    .param p1, "transitionState"    # Landroidx/compose/animation/core/TransitionState;
    .param p2, "parentTransition"    # Landroidx/compose/animation/core/Transition;
    .param p3, "label"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/animation/core/TransitionState<",
            "TS;>;",
            "Landroidx/compose/animation/core/Transition<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 876
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 879
    iput-object p1, p0, Landroidx/compose/animation/core/Transition;->transitionState:Landroidx/compose/animation/core/TransitionState;

    .line 880
    iput-object p2, p0, Landroidx/compose/animation/core/Transition;->parentTransition:Landroidx/compose/animation/core/Transition;

    .line 881
    iput-object p3, p0, Landroidx/compose/animation/core/Transition;->label:Ljava/lang/String;

    .line 912
    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-static {v0, v1, v2, v1}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v0

    iput-object v0, p0, Landroidx/compose/animation/core/Transition;->targetState$delegate:Landroidx/compose/runtime/MutableState;

    .line 919
    new-instance v0, Landroidx/compose/animation/core/Transition$SegmentImpl;

    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v4

    invoke-direct {v0, v3, v4}, Landroidx/compose/animation/core/Transition$SegmentImpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v0, v1, v2, v1}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v0

    iput-object v0, p0, Landroidx/compose/animation/core/Transition;->segment$delegate:Landroidx/compose/runtime/MutableState;

    .line 926
    const-wide/16 v3, 0x0

    invoke-static {v3, v4}, Landroidx/compose/runtime/SnapshotLongStateKt;->mutableLongStateOf(J)Landroidx/compose/runtime/MutableLongState;

    move-result-object v0

    iput-object v0, p0, Landroidx/compose/animation/core/Transition;->_playTimeNanos$delegate:Landroidx/compose/runtime/MutableLongState;

    .line 946
    const-wide/high16 v3, -0x8000000000000000L

    invoke-static {v3, v4}, Landroidx/compose/runtime/SnapshotLongStateKt;->mutableLongStateOf(J)Landroidx/compose/runtime/MutableLongState;

    move-result-object v0

    iput-object v0, p0, Landroidx/compose/animation/core/Transition;->startTimeNanos$delegate:Landroidx/compose/runtime/MutableLongState;

    .line 949
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0, v1, v2, v1}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v3

    iput-object v3, p0, Landroidx/compose/animation/core/Transition;->updateChildrenNeeded$delegate:Landroidx/compose/runtime/MutableState;

    .line 951
    invoke-static {}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateListOf()Landroidx/compose/runtime/snapshots/SnapshotStateList;

    move-result-object v3

    iput-object v3, p0, Landroidx/compose/animation/core/Transition;->_animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    .line 952
    invoke-static {}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateListOf()Landroidx/compose/runtime/snapshots/SnapshotStateList;

    move-result-object v3

    iput-object v3, p0, Landroidx/compose/animation/core/Transition;->_transitions:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    .line 965
    invoke-static {v0, v1, v2, v1}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v0

    iput-object v0, p0, Landroidx/compose/animation/core/Transition;->isSeeking$delegate:Landroidx/compose/runtime/MutableState;

    .line 994
    new-instance v0, Landroidx/compose/animation/core/Transition$totalDurationNanos$2;

    invoke-direct {v0, p0}, Landroidx/compose/animation/core/Transition$totalDurationNanos$2;-><init>(Landroidx/compose/animation/core/Transition;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-static {v0}, Landroidx/compose/runtime/SnapshotStateKt;->derivedStateOf(Lkotlin/jvm/functions/Function0;)Landroidx/compose/runtime/State;

    move-result-object v0

    iput-object v0, p0, Landroidx/compose/animation/core/Transition;->totalDurationNanos$delegate:Landroidx/compose/runtime/State;

    .line 1054
    nop

    .line 1055
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->transitionState:Landroidx/compose/animation/core/TransitionState;

    invoke-virtual {v0, p0}, Landroidx/compose/animation/core/TransitionState;->transitionConfigured$animation_core_release(Landroidx/compose/animation/core/Transition;)V

    .line 1056
    nop

    .line 878
    return-void
.end method

.method public synthetic constructor <init>(Landroidx/compose/animation/core/TransitionState;Landroidx/compose/animation/core/Transition;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 878
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 881
    const/4 p3, 0x0

    .line 878
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Landroidx/compose/animation/core/Transition;-><init>(Landroidx/compose/animation/core/TransitionState;Landroidx/compose/animation/core/Transition;Ljava/lang/String;)V

    .line 882
    return-void
.end method

.method public constructor <init>(Landroidx/compose/animation/core/TransitionState;Ljava/lang/String;)V
    .locals 1
    .param p1, "transitionState"    # Landroidx/compose/animation/core/TransitionState;
    .param p2, "label"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/animation/core/TransitionState<",
            "TS;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 887
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Landroidx/compose/animation/core/Transition;-><init>(Landroidx/compose/animation/core/TransitionState;Landroidx/compose/animation/core/Transition;Ljava/lang/String;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroidx/compose/animation/core/TransitionState;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 884
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 886
    const/4 p2, 0x0

    .line 884
    :cond_0
    invoke-direct {p0, p1, p2}, Landroidx/compose/animation/core/Transition;-><init>(Landroidx/compose/animation/core/TransitionState;Ljava/lang/String;)V

    .line 887
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 2
    .param p1, "initialState"    # Ljava/lang/Object;
    .param p2, "label"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 892
    new-instance v0, Landroidx/compose/animation/core/MutableTransitionState;

    invoke-direct {v0, p1}, Landroidx/compose/animation/core/MutableTransitionState;-><init>(Ljava/lang/Object;)V

    check-cast v0, Landroidx/compose/animation/core/TransitionState;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p2}, Landroidx/compose/animation/core/Transition;-><init>(Landroidx/compose/animation/core/TransitionState;Landroidx/compose/animation/core/Transition;Ljava/lang/String;)V

    return-void
.end method

.method public static final synthetic access$calculateTotalDurationNanos(Landroidx/compose/animation/core/Transition;)J
    .locals 2
    .param p0, "$this"    # Landroidx/compose/animation/core/Transition;

    .line 876
    invoke-direct {p0}, Landroidx/compose/animation/core/Transition;->calculateTotalDurationNanos()J

    move-result-wide v0

    return-wide v0
.end method

.method public static final synthetic access$onChildAnimationUpdated(Landroidx/compose/animation/core/Transition;)V
    .locals 0
    .param p0, "$this"    # Landroidx/compose/animation/core/Transition;

    .line 876
    invoke-direct {p0}, Landroidx/compose/animation/core/Transition;->onChildAnimationUpdated()V

    return-void
.end method

.method private final calculateTotalDurationNanos()J
    .locals 11

    .line 997
    const-wide/16 v0, 0x0

    .line 998
    .local v0, "maxDurationNanos":J
    iget-object v2, p0, Landroidx/compose/animation/core/Transition;->_animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v2, Ljava/util/List;

    .local v2, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v3, 0x0

    .line 2175
    .local v3, "$i$f$fastForEach":I
    nop

    .line 2176
    const/4 v4, 0x0

    .local v4, "index$iv":I
    move-object v5, v2

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v5

    :goto_0
    if-ge v4, v5, :cond_0

    .line 2177
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 2178
    .local v6, "item$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Landroidx/compose/animation/core/Transition$TransitionAnimationState;

    .local v7, "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    const/4 v8, 0x0

    .line 998
    .local v8, "$i$a$-fastForEach-Transition$calculateTotalDurationNanos$1":I
    invoke-virtual {v7}, Landroidx/compose/animation/core/Transition$TransitionAnimationState;->getDurationNanos$animation_core_release()J

    move-result-wide v9

    invoke-static {v0, v1, v9, v10}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 2178
    .end local v7    # "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    .end local v8    # "$i$a$-fastForEach-Transition$calculateTotalDurationNanos$1":I
    nop

    .line 2176
    .end local v6    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 2180
    .end local v4    # "index$iv":I
    :cond_0
    nop

    .line 999
    .end local v2    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v3    # "$i$f$fastForEach":I
    iget-object v2, p0, Landroidx/compose/animation/core/Transition;->_transitions:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v2, Ljava/util/List;

    .restart local v2    # "$this$fastForEach$iv":Ljava/util/List;
    const/4 v3, 0x0

    .line 2181
    .restart local v3    # "$i$f$fastForEach":I
    nop

    .line 2182
    const/4 v4, 0x0

    .restart local v4    # "index$iv":I
    move-object v5, v2

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v5

    :goto_1
    if-ge v4, v5, :cond_1

    .line 2183
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 2184
    .restart local v6    # "item$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Landroidx/compose/animation/core/Transition;

    .local v7, "it":Landroidx/compose/animation/core/Transition;
    const/4 v8, 0x0

    .line 1000
    .local v8, "$i$a$-fastForEach-Transition$calculateTotalDurationNanos$2":I
    invoke-direct {v7}, Landroidx/compose/animation/core/Transition;->calculateTotalDurationNanos()J

    move-result-wide v9

    invoke-static {v0, v1, v9, v10}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 1001
    nop

    .line 2184
    .end local v7    # "it":Landroidx/compose/animation/core/Transition;
    .end local v8    # "$i$a$-fastForEach-Transition$calculateTotalDurationNanos$2":I
    nop

    .line 2182
    .end local v6    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 2186
    .end local v4    # "index$iv":I
    :cond_1
    nop

    .line 1002
    .end local v2    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v3    # "$i$f$fastForEach":I
    return-wide v0
.end method

.method public static synthetic getHasInitialValueAnimations$annotations()V
    .locals 0

    return-void
.end method

.method private final getUpdateChildrenNeeded()Z
    .locals 3

    .line 949
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->updateChildrenNeeded$delegate:Landroidx/compose/runtime/MutableState;

    check-cast v0, Landroidx/compose/runtime/State;

    .local v0, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    const/4 v2, 0x0

    .line 2150
    .local v2, "$i$f$getValue":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$i$f$getValue":I
    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 949
    return v0
.end method

.method private final get_playTimeNanos()J
    .locals 3

    .line 926
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_playTimeNanos$delegate:Landroidx/compose/runtime/MutableLongState;

    check-cast v0, Landroidx/compose/runtime/LongState;

    .local v0, "$this$getValue$iv":Landroidx/compose/runtime/LongState;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    const/4 v2, 0x0

    .line 2144
    .local v2, "$i$f$getValue":I
    invoke-interface {v0}, Landroidx/compose/runtime/LongState;->getLongValue()J

    move-result-wide v0

    .line 926
    .end local v0    # "$this$getValue$iv":Landroidx/compose/runtime/LongState;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$i$f$getValue":I
    return-wide v0
.end method

.method private final onChildAnimationUpdated()V
    .locals 11

    .line 1268
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroidx/compose/animation/core/Transition;->setUpdateChildrenNeeded(Z)V

    .line 1269
    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->isSeeking()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1271
    const-wide/16 v0, 0x0

    .line 1272
    .local v0, "maxDurationNanos":J
    iget-object v2, p0, Landroidx/compose/animation/core/Transition;->_animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v2, Ljava/util/List;

    .local v2, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v3, 0x0

    .line 2313
    .local v3, "$i$f$fastForEach":I
    nop

    .line 2314
    const/4 v4, 0x0

    .local v4, "index$iv":I
    move-object v5, v2

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v5

    :goto_0
    if-ge v4, v5, :cond_0

    .line 2315
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 2316
    .local v6, "item$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Landroidx/compose/animation/core/Transition$TransitionAnimationState;

    .local v7, "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    const/4 v8, 0x0

    .line 1273
    .local v8, "$i$a$-fastForEach-Transition$onChildAnimationUpdated$1":I
    invoke-virtual {v7}, Landroidx/compose/animation/core/Transition$TransitionAnimationState;->getDurationNanos$animation_core_release()J

    move-result-wide v9

    invoke-static {v0, v1, v9, v10}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 1274
    iget-wide v9, p0, Landroidx/compose/animation/core/Transition;->lastSeekedTimeNanos:J

    invoke-virtual {v7, v9, v10}, Landroidx/compose/animation/core/Transition$TransitionAnimationState;->seekTo$animation_core_release(J)V

    .line 1275
    nop

    .line 2316
    .end local v7    # "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    .end local v8    # "$i$a$-fastForEach-Transition$onChildAnimationUpdated$1":I
    nop

    .line 2314
    .end local v6    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 2318
    .end local v4    # "index$iv":I
    :cond_0
    nop

    .line 1278
    .end local v2    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v3    # "$i$f$fastForEach":I
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Landroidx/compose/animation/core/Transition;->setUpdateChildrenNeeded(Z)V

    .line 1280
    .end local v0    # "maxDurationNanos":J
    :cond_1
    return-void
.end method

.method private final setSegment(Landroidx/compose/animation/core/Transition$Segment;)V
    .locals 3
    .param p1, "<set-?>"    # Landroidx/compose/animation/core/Transition$Segment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/animation/core/Transition$Segment<",
            "TS;>;)V"
        }
    .end annotation

    .line 919
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->segment$delegate:Landroidx/compose/runtime/MutableState;

    .local v0, "$this$setValue$iv":Landroidx/compose/runtime/MutableState;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    const/4 v2, 0x0

    .line 2142
    .local v2, "$i$f$setValue":I
    invoke-interface {v0, p1}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 2143
    nop

    .line 919
    .end local v0    # "$this$setValue$iv":Landroidx/compose/runtime/MutableState;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$i$f$setValue":I
    return-void
.end method

.method private final setUpdateChildrenNeeded(Z)V
    .locals 4
    .param p1, "<set-?>"    # Z

    .line 949
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->updateChildrenNeeded$delegate:Landroidx/compose/runtime/MutableState;

    .local v0, "$this$setValue$iv":Landroidx/compose/runtime/MutableState;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .local v2, "value$iv":Ljava/lang/Object;
    const/4 v3, 0x0

    .line 2151
    .local v3, "$i$f$setValue":I
    invoke-interface {v0, v2}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 2152
    nop

    .line 949
    .end local v0    # "$this$setValue$iv":Landroidx/compose/runtime/MutableState;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "value$iv":Ljava/lang/Object;
    .end local v3    # "$i$f$setValue":I
    return-void
.end method

.method private final set_playTimeNanos(J)V
    .locals 3
    .param p1, "<set-?>"    # J

    .line 926
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_playTimeNanos$delegate:Landroidx/compose/runtime/MutableLongState;

    .local v0, "$this$setValue$iv":Landroidx/compose/runtime/MutableLongState;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    const/4 v2, 0x0

    .line 2145
    .local v2, "$i$f$setValue":I
    invoke-interface {v0, p1, p2}, Landroidx/compose/runtime/MutableLongState;->setLongValue(J)V

    .line 2146
    nop

    .line 926
    .end local v0    # "$this$setValue$iv":Landroidx/compose/runtime/MutableLongState;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$i$f$setValue":I
    return-void
.end method


# virtual methods
.method public final addAnimation$animation_core_release(Landroidx/compose/animation/core/Transition$TransitionAnimationState;)Z
    .locals 1
    .param p1, "animation"    # Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/animation/core/Transition<",
            "TS;>.TransitionAnimationState<**>;)Z"
        }
    .end annotation

    .line 1139
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public final addTransition$animation_core_release(Landroidx/compose/animation/core/Transition;)Z
    .locals 1
    .param p1, "transition"    # Landroidx/compose/animation/core/Transition;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/animation/core/Transition<",
            "*>;)Z"
        }
    .end annotation

    .line 1134
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_transitions:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public final animateTo$animation_core_release(Ljava/lang/Object;Landroidx/compose/runtime/Composer;I)V
    .locals 17
    .param p1, "targetState"    # Ljava/lang/Object;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;",
            "Landroidx/compose/runtime/Composer;",
            "I)V"
        }
    .end annotation

    .line 1173
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    const v3, -0x59064cff

    move-object/from16 v4, p2

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v4

    .end local p2    # "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "$composer":Landroidx/compose/runtime/Composer;
    const-string v5, "C(animateTo):Transition.kt#pdpnli"

    invoke-static {v4, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v5, p3

    .local v5, "$dirty":I
    and-int/lit8 v6, v2, 0x6

    if-nez v6, :cond_2

    and-int/lit8 v6, v2, 0x8

    if-nez v6, :cond_0

    invoke-interface {v4, v1}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v6

    goto :goto_0

    :cond_0
    invoke-interface {v4, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    :goto_0
    if-eqz v6, :cond_1

    const/4 v6, 0x4

    goto :goto_1

    :cond_1
    const/4 v6, 0x2

    :goto_1
    or-int/2addr v5, v6

    :cond_2
    and-int/lit8 v6, v2, 0x30

    const/16 v7, 0x20

    if-nez v6, :cond_4

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    move v6, v7

    goto :goto_2

    :cond_3
    const/16 v6, 0x10

    :goto_2
    or-int/2addr v5, v6

    :cond_4
    and-int/lit8 v6, v5, 0x13

    const/16 v8, 0x12

    const/4 v10, 0x0

    if-eq v6, v8, :cond_5

    const/4 v6, 0x1

    goto :goto_3

    :cond_5
    move v6, v10

    :goto_3
    and-int/lit8 v8, v5, 0x1

    invoke-interface {v4, v6, v8}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v6

    if-eqz v6, :cond_e

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v6

    if-eqz v6, :cond_6

    const/4 v6, -0x1

    const-string/jumbo v8, "androidx.compose.animation.core.Transition.animateTo (Transition.kt:1172)"

    invoke-static {v3, v5, v6, v8}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 1174
    :cond_6
    invoke-virtual {v0}, Landroidx/compose/animation/core/Transition;->isSeeking()Z

    move-result v3

    if-nez v3, :cond_d

    const v3, 0x6ca32a73

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v3, ""

    invoke-static {v4, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 1175
    invoke-virtual/range {p0 .. p1}, Landroidx/compose/animation/core/Transition;->updateTarget$animation_core_release(Ljava/lang/Object;)V

    .line 1178
    invoke-virtual {v0}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-virtual {v0}, Landroidx/compose/animation/core/Transition;->isRunning()Z

    move-result v3

    if-nez v3, :cond_8

    invoke-direct {v0}, Landroidx/compose/animation/core/Transition;->getUpdateChildrenNeeded()Z

    move-result v3

    if-eqz v3, :cond_7

    goto :goto_4

    .line 1200
    :cond_7
    const v3, 0x6cb9a7bb

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    goto/16 :goto_9

    .line 1178
    :cond_8
    :goto_4
    const v3, 0x6ca6b1ee

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v3, "1180@49957L24,1181@50037L1011,1181@49998L1050"

    invoke-static {v4, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 1181
    move v3, v10

    .local v3, "$changed$iv":I
    const/4 v6, 0x0

    .line 2223
    .local v6, "$i$f$rememberCoroutineScope":I
    const v8, 0x2e20b340

    const-string v11, "CC(rememberCoroutineScope)558@25470L68:Effects.kt#9igjgp"

    invoke-static {v4, v8, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 2224
    nop

    .line 2228
    move-object v8, v4

    .line 2229
    .local v8, "composer$iv":Landroidx/compose/runtime/Composer;
    const v11, -0x38dffd5c

    const-string v12, "CC(remember):Effects.kt#9igjgp"

    invoke-static {v4, v11, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v11, 0x0

    .local v11, "invalid$iv$iv":Z
    move-object v12, v4

    .local v12, "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    const/4 v13, 0x0

    .line 2230
    .local v13, "$i$f$cache":I
    invoke-interface {v12}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v14

    .local v14, "it$iv$iv":Ljava/lang/Object;
    const/4 v15, 0x0

    .line 2231
    .local v15, "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    sget-object v16, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v16 .. v16}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v9

    if-ne v14, v9, :cond_9

    .line 2232
    const/4 v9, 0x0

    .line 2229
    .local v9, "$i$a$-cache-EffectsKt$rememberCoroutineScope$2$iv":I
    const/16 v16, 0x0

    .line 2233
    .local v16, "$i$a$-rememberCoroutineScope-EffectsKt$rememberCoroutineScope$1":I
    sget-object v16, Lkotlin/coroutines/EmptyCoroutineContext;->INSTANCE:Lkotlin/coroutines/EmptyCoroutineContext;

    .line 2229
    .end local v16    # "$i$a$-rememberCoroutineScope-EffectsKt$rememberCoroutineScope$1":I
    move-object/from16 v10, v16

    check-cast v10, Lkotlin/coroutines/CoroutineContext;

    invoke-static {v10, v8}, Landroidx/compose/runtime/EffectsKt;->createCompositionCoroutineScope(Lkotlin/coroutines/CoroutineContext;Landroidx/compose/runtime/Composer;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v9

    .line 2232
    .end local v9    # "$i$a$-cache-EffectsKt$rememberCoroutineScope$2$iv":I
    nop

    .line 2234
    .local v9, "value$iv$iv":Ljava/lang/Object;
    invoke-interface {v12, v9}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 2235
    move-object v14, v9

    .end local v9    # "value$iv$iv":Ljava/lang/Object;
    goto :goto_5

    .line 2236
    :cond_9
    nop

    .line 2230
    .end local v14    # "it$iv$iv":Ljava/lang/Object;
    .end local v15    # "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    :goto_5
    nop

    .line 2229
    .end local v11    # "invalid$iv$iv":Z
    .end local v12    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v13    # "$i$f$cache":I
    check-cast v14, Lkotlinx/coroutines/CoroutineScope;

    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 2223
    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 2229
    nop

    .line 1181
    .end local v3    # "$changed$iv":I
    .end local v6    # "$i$f$rememberCoroutineScope":I
    .end local v8    # "composer$iv":Landroidx/compose/runtime/Composer;
    nop

    .line 1182
    .local v14, "coroutineScope":Lkotlinx/coroutines/CoroutineScope;
    const v3, 0x140580fa

    const-string v6, "CC(remember):Transition.kt#9igjgp"

    invoke-static {v4, v3, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v4, v14}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v3

    and-int/lit8 v6, v5, 0x70

    if-ne v6, v7, :cond_a

    const/4 v9, 0x1

    goto :goto_6

    :cond_a
    const/4 v9, 0x0

    :goto_6
    or-int/2addr v3, v9

    .local v3, "invalid$iv":Z
    move-object v6, v4

    .local v6, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v7, 0x0

    .line 2237
    .local v7, "$i$f$cache":I
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v8

    .local v8, "it$iv":Ljava/lang/Object;
    const/4 v9, 0x0

    .line 2238
    .local v9, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v3, :cond_c

    sget-object v10, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v10}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v10

    if-ne v8, v10, :cond_b

    goto :goto_7

    .line 2242
    :cond_b
    goto :goto_8

    .line 2239
    :cond_c
    :goto_7
    const/4 v10, 0x0

    .line 1182
    .local v10, "$i$a$-cache-Transition$animateTo$1":I
    new-instance v11, Landroidx/compose/animation/core/Transition$animateTo$1$1;

    invoke-direct {v11, v14, v0}, Landroidx/compose/animation/core/Transition$animateTo$1$1;-><init>(Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/animation/core/Transition;)V

    check-cast v11, Lkotlin/jvm/functions/Function1;

    .line 2239
    .end local v10    # "$i$a$-cache-Transition$animateTo$1":I
    nop

    .line 2240
    .local v11, "value$iv":Ljava/lang/Object;
    invoke-interface {v6, v11}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 2241
    move-object v8, v11

    .line 2237
    .end local v8    # "it$iv":Ljava/lang/Object;
    .end local v9    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local v11    # "value$iv":Ljava/lang/Object;
    :goto_8
    nop

    .line 1182
    .end local v3    # "invalid$iv":Z
    .end local v6    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v7    # "$i$f$cache":I
    check-cast v8, Lkotlin/jvm/functions/Function1;

    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    and-int/lit8 v3, v5, 0x70

    invoke-static {v14, v0, v8, v4, v3}, Landroidx/compose/runtime/EffectsKt;->DisposableEffect(Ljava/lang/Object;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V

    .line 1178
    .end local v14    # "coroutineScope":Lkotlinx/coroutines/CoroutineScope;
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 1174
    :goto_9
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    goto :goto_a

    .line 1201
    :cond_d
    const v3, 0x6cb9ce7b

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    :goto_a
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v3

    if-eqz v3, :cond_f

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_b

    .line 1202
    :cond_e
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    :cond_f
    :goto_b
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v3

    if-eqz v3, :cond_10

    new-instance v6, Landroidx/compose/animation/core/Transition$animateTo$2;

    invoke-direct {v6, v0, v1, v2}, Landroidx/compose/animation/core/Transition$animateTo$2;-><init>(Landroidx/compose/animation/core/Transition;Ljava/lang/Object;I)V

    check-cast v6, Lkotlin/jvm/functions/Function2;

    invoke-interface {v3, v6}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_10
    return-void
.end method

.method public final clearInitialAnimations$animation_core_release()V
    .locals 7

    .line 1247
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .local v0, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2279
    .local v1, "$i$f$fastForEach":I
    nop

    .line 2280
    const/4 v2, 0x0

    .local v2, "index$iv":I
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_0
    if-ge v2, v3, :cond_0

    .line 2281
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2282
    .local v4, "item$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Landroidx/compose/animation/core/Transition$TransitionAnimationState;

    .local v5, "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    const/4 v6, 0x0

    .line 1247
    .local v6, "$i$a$-fastForEach-Transition$clearInitialAnimations$1":I
    invoke-virtual {v5}, Landroidx/compose/animation/core/Transition$TransitionAnimationState;->clearInitialAnimation$animation_core_release()V

    .line 2282
    .end local v5    # "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    .end local v6    # "$i$a$-fastForEach-Transition$clearInitialAnimations$1":I
    nop

    .line 2280
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2284
    .end local v2    # "index$iv":I
    :cond_0
    nop

    .line 1248
    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEach":I
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_transitions:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .restart local v0    # "$this$fastForEach$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2285
    .restart local v1    # "$i$f$fastForEach":I
    nop

    .line 2286
    const/4 v2, 0x0

    .restart local v2    # "index$iv":I
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_1
    if-ge v2, v3, :cond_1

    .line 2287
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2288
    .restart local v4    # "item$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Landroidx/compose/animation/core/Transition;

    .local v5, "it":Landroidx/compose/animation/core/Transition;
    const/4 v6, 0x0

    .line 1248
    .local v6, "$i$a$-fastForEach-Transition$clearInitialAnimations$2":I
    invoke-virtual {v5}, Landroidx/compose/animation/core/Transition;->clearInitialAnimations$animation_core_release()V

    .line 2288
    .end local v5    # "it":Landroidx/compose/animation/core/Transition;
    .end local v6    # "$i$a$-fastForEach-Transition$clearInitialAnimations$2":I
    nop

    .line 2286
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 2290
    .end local v2    # "index$iv":I
    :cond_1
    nop

    .line 1249
    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEach":I
    return-void
.end method

.method public final getAnimations()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/compose/animation/core/Transition<",
            "TS;>.TransitionAnimationState<**>;>;"
        }
    .end annotation

    .line 960
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public final getCurrentState()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation

    .line 906
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->transitionState:Landroidx/compose/animation/core/TransitionState;

    invoke-virtual {v0}, Landroidx/compose/animation/core/TransitionState;->getCurrentState()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getHasInitialValueAnimations()Z
    .locals 14

    .line 983
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .local v0, "$this$fastAny$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2156
    .local v1, "$i$f$fastAny":I
    nop

    .line 2157
    move-object v2, v0

    .local v2, "$this$fastForEach$iv$iv":Ljava/util/List;
    const/4 v3, 0x0

    .line 2158
    .local v3, "$i$f$fastForEach":I
    nop

    .line 2159
    const/4 v4, 0x0

    .local v4, "index$iv$iv":I
    move-object v5, v2

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v5

    :goto_0
    const/4 v6, 0x0

    const/4 v7, 0x1

    if-ge v4, v5, :cond_2

    .line 2160
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .line 2161
    .local v8, "item$iv$iv":Ljava/lang/Object;
    move-object v9, v8

    .local v9, "it$iv":Ljava/lang/Object;
    const/4 v10, 0x0

    .line 2157
    .local v10, "$i$a$-fastForEach-ListUtilsKt$fastAny$2$iv":I
    move-object v11, v9

    check-cast v11, Landroidx/compose/animation/core/Transition$TransitionAnimationState;

    .local v11, "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    const/4 v12, 0x0

    .line 983
    .local v12, "$i$a$-fastAny-Transition$hasInitialValueAnimations$1":I
    invoke-virtual {v11}, Landroidx/compose/animation/core/Transition$TransitionAnimationState;->getInitialValueState$animation_core_release()Landroidx/compose/animation/core/SeekableTransitionState$SeekingAnimationState;

    move-result-object v13

    if-eqz v13, :cond_0

    move v11, v7

    goto :goto_1

    :cond_0
    move v11, v6

    .line 2157
    .end local v11    # "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    .end local v12    # "$i$a$-fastAny-Transition$hasInitialValueAnimations$1":I
    :goto_1
    if-eqz v11, :cond_1

    move v0, v7

    goto :goto_2

    .line 2161
    .end local v9    # "it$iv":Ljava/lang/Object;
    .end local v10    # "$i$a$-fastForEach-ListUtilsKt$fastAny$2$iv":I
    :cond_1
    nop

    .line 2159
    .end local v8    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 2163
    .end local v4    # "index$iv$iv":I
    :cond_2
    nop

    .line 2164
    .end local v2    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v3    # "$i$f$fastForEach":I
    move v0, v6

    .line 983
    .end local v0    # "$this$fastAny$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastAny":I
    :goto_2
    if-nez v0, :cond_5

    .line 984
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_transitions:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .restart local v0    # "$this$fastAny$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2165
    .restart local v1    # "$i$f$fastAny":I
    nop

    .line 2166
    move-object v2, v0

    .restart local v2    # "$this$fastForEach$iv$iv":Ljava/util/List;
    const/4 v3, 0x0

    .line 2167
    .restart local v3    # "$i$f$fastForEach":I
    nop

    .line 2168
    const/4 v4, 0x0

    .restart local v4    # "index$iv$iv":I
    move-object v5, v2

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v5

    :goto_3
    if-ge v4, v5, :cond_4

    .line 2169
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .line 2170
    .restart local v8    # "item$iv$iv":Ljava/lang/Object;
    move-object v9, v8

    .restart local v9    # "it$iv":Ljava/lang/Object;
    const/4 v10, 0x0

    .line 2166
    .restart local v10    # "$i$a$-fastForEach-ListUtilsKt$fastAny$2$iv":I
    move-object v11, v9

    check-cast v11, Landroidx/compose/animation/core/Transition;

    .local v11, "it":Landroidx/compose/animation/core/Transition;
    const/4 v12, 0x0

    .line 984
    .local v12, "$i$a$-fastAny-Transition$hasInitialValueAnimations$2":I
    invoke-virtual {v11}, Landroidx/compose/animation/core/Transition;->getHasInitialValueAnimations()Z

    move-result v11

    .line 2166
    .end local v11    # "it":Landroidx/compose/animation/core/Transition;
    .end local v12    # "$i$a$-fastAny-Transition$hasInitialValueAnimations$2":I
    if-eqz v11, :cond_3

    move v0, v7

    goto :goto_4

    .line 2170
    .end local v9    # "it$iv":Ljava/lang/Object;
    .end local v10    # "$i$a$-fastForEach-ListUtilsKt$fastAny$2$iv":I
    :cond_3
    nop

    .line 2168
    .end local v8    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 2172
    .end local v4    # "index$iv$iv":I
    :cond_4
    nop

    .line 2173
    .end local v2    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v3    # "$i$f$fastForEach":I
    move v0, v6

    .line 984
    .end local v0    # "$this$fastAny$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastAny":I
    :goto_4
    if-eqz v0, :cond_6

    :cond_5
    move v6, v7

    :cond_6
    return v6
.end method

.method public final getLabel()Ljava/lang/String;
    .locals 1

    .line 881
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->label:Ljava/lang/String;

    return-object v0
.end method

.method public final getLastSeekedTimeNanos$animation_core_release()J
    .locals 2

    .line 968
    iget-wide v0, p0, Landroidx/compose/animation/core/Transition;->lastSeekedTimeNanos:J

    return-wide v0
.end method

.method public final getParentTransition()Landroidx/compose/animation/core/Transition;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/compose/animation/core/Transition<",
            "*>;"
        }
    .end annotation

    .line 880
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->parentTransition:Landroidx/compose/animation/core/Transition;

    return-object v0
.end method

.method public final getPlayTimeNanos()J
    .locals 2

    .line 936
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->parentTransition:Landroidx/compose/animation/core/Transition;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/compose/animation/core/Transition;->getPlayTimeNanos()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Landroidx/compose/animation/core/Transition;->get_playTimeNanos()J

    move-result-wide v0

    :goto_0
    return-wide v0
.end method

.method public final getSegment()Landroidx/compose/animation/core/Transition$Segment;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/compose/animation/core/Transition$Segment<",
            "TS;>;"
        }
    .end annotation

    .line 919
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->segment$delegate:Landroidx/compose/runtime/MutableState;

    check-cast v0, Landroidx/compose/runtime/State;

    .local v0, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    const/4 v2, 0x0

    .line 2141
    .local v2, "$i$f$getValue":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$i$f$getValue":I
    check-cast v0, Landroidx/compose/animation/core/Transition$Segment;

    .line 919
    return-object v0
.end method

.method public final getStartTimeNanos$animation_core_release()J
    .locals 3

    .line 946
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->startTimeNanos$delegate:Landroidx/compose/runtime/MutableLongState;

    check-cast v0, Landroidx/compose/runtime/LongState;

    .local v0, "$this$getValue$iv":Landroidx/compose/runtime/LongState;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    const/4 v2, 0x0

    .line 2147
    .local v2, "$i$f$getValue":I
    invoke-interface {v0}, Landroidx/compose/runtime/LongState;->getLongValue()J

    move-result-wide v0

    .line 946
    .end local v0    # "$this$getValue$iv":Landroidx/compose/runtime/LongState;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$i$f$getValue":I
    return-wide v0
.end method

.method public final getTargetState()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation

    .line 912
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->targetState$delegate:Landroidx/compose/runtime/MutableState;

    check-cast v0, Landroidx/compose/runtime/State;

    .local v0, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    const/4 v2, 0x0

    .line 2138
    .local v2, "$i$f$getValue":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .line 912
    .end local v0    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$i$f$getValue":I
    return-object v0
.end method

.method public final getTotalDurationNanos()J
    .locals 3

    .line 994
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->totalDurationNanos$delegate:Landroidx/compose/runtime/State;

    .local v0, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    const/4 v2, 0x0

    .line 2174
    .local v2, "$i$f$getValue":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$i$f$getValue":I
    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 994
    return-wide v0
.end method

.method public final getTransitions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/compose/animation/core/Transition<",
            "*>;>;"
        }
    .end annotation

    .line 956
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_transitions:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public final isRunning()Z
    .locals 4

    .line 924
    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getStartTimeNanos$animation_core_release()J

    move-result-wide v0

    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final isSeeking()Z
    .locals 3

    .line 965
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->isSeeking$delegate:Landroidx/compose/runtime/MutableState;

    check-cast v0, Landroidx/compose/runtime/State;

    .local v0, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    const/4 v2, 0x0

    .line 2153
    .local v2, "$i$f$getValue":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$i$f$getValue":I
    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 965
    return v0
.end method

.method public final onDisposed$animation_core_release()V
    .locals 1

    .line 1066
    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->onTransitionEnd$animation_core_release()V

    .line 1067
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->transitionState:Landroidx/compose/animation/core/TransitionState;

    invoke-virtual {v0}, Landroidx/compose/animation/core/TransitionState;->transitionRemoved$animation_core_release()V

    .line 1068
    return-void
.end method

.method public final onFrame$animation_core_release(JF)V
    .locals 10
    .param p1, "frameTimeNanos"    # J
    .param p3, "durationScale"    # F

    .line 1007
    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getStartTimeNanos$animation_core_release()J

    move-result-wide v0

    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 1008
    invoke-virtual {p0, p1, p2}, Landroidx/compose/animation/core/Transition;->onTransitionStart$animation_core_release(J)V

    .line 1011
    :cond_0
    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getStartTimeNanos$animation_core_release()J

    move-result-wide v0

    sub-long v0, p1, v0

    .line 1013
    .local v0, "deltaT":J
    const/4 v2, 0x0

    cmpg-float v3, p3, v2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v3, :cond_1

    move v3, v4

    goto :goto_0

    :cond_1
    move v3, v5

    :goto_0
    if-eqz v3, :cond_2

    .line 1014
    move-wide v6, v0

    goto :goto_1

    .line 1016
    :cond_2
    long-to-double v6, v0

    float-to-double v8, p3

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Lkotlin/math/MathKt;->roundToLong(D)J

    move-result-wide v6

    .line 1013
    :goto_1
    nop

    .line 1012
    nop

    .line 1018
    .local v6, "scaledPlayTimeNanos":J
    invoke-virtual {p0, v6, v7}, Landroidx/compose/animation/core/Transition;->setPlayTimeNanos(J)V

    .line 1019
    cmpg-float v2, p3, v2

    if-nez v2, :cond_3

    goto :goto_2

    :cond_3
    move v4, v5

    :goto_2
    invoke-virtual {p0, v6, v7, v4}, Landroidx/compose/animation/core/Transition;->onFrame$animation_core_release(JZ)V

    .line 1020
    return-void
.end method

.method public final onFrame$animation_core_release(JZ)V
    .locals 10
    .param p1, "scaledPlayTimeNanos"    # J
    .param p3, "scaleToEnd"    # Z

    .line 1023
    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getStartTimeNanos$animation_core_release()J

    move-result-wide v0

    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 1024
    invoke-virtual {p0, p1, p2}, Landroidx/compose/animation/core/Transition;->onTransitionStart$animation_core_release(J)V

    goto :goto_0

    .line 1025
    :cond_0
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->transitionState:Landroidx/compose/animation/core/TransitionState;

    invoke-virtual {v0}, Landroidx/compose/animation/core/TransitionState;->isRunning$animation_core_release()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1026
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->transitionState:Landroidx/compose/animation/core/TransitionState;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/compose/animation/core/TransitionState;->setRunning$animation_core_release(Z)V

    .line 1028
    :cond_1
    :goto_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroidx/compose/animation/core/Transition;->setUpdateChildrenNeeded(Z)V

    .line 1030
    const/4 v0, 0x0

    .local v0, "allFinished":Z
    const/4 v0, 0x1

    .line 1032
    iget-object v1, p0, Landroidx/compose/animation/core/Transition;->_animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v1, Ljava/util/List;

    .local v1, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v2, 0x0

    .line 2187
    .local v2, "$i$f$fastForEach":I
    nop

    .line 2188
    const/4 v3, 0x0

    .local v3, "index$iv":I
    move-object v4, v1

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->size()I

    move-result v4

    :goto_1
    if-ge v3, v4, :cond_4

    .line 2189
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    .line 2190
    .local v5, "item$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Landroidx/compose/animation/core/Transition$TransitionAnimationState;

    .local v6, "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    const/4 v7, 0x0

    .line 1033
    .local v7, "$i$a$-fastForEach-Transition$onFrame$1":I
    invoke-virtual {v6}, Landroidx/compose/animation/core/Transition$TransitionAnimationState;->isFinished$animation_core_release()Z

    move-result v8

    if-nez v8, :cond_2

    .line 1034
    invoke-virtual {v6, p1, p2, p3}, Landroidx/compose/animation/core/Transition$TransitionAnimationState;->onPlayTimeChanged$animation_core_release(JZ)V

    .line 1037
    :cond_2
    invoke-virtual {v6}, Landroidx/compose/animation/core/Transition$TransitionAnimationState;->isFinished$animation_core_release()Z

    move-result v8

    if-nez v8, :cond_3

    .line 1038
    const/4 v0, 0x0

    .line 1040
    :cond_3
    nop

    .line 2190
    .end local v6    # "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    .end local v7    # "$i$a$-fastForEach-Transition$onFrame$1":I
    nop

    .line 2188
    .end local v5    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 2192
    .end local v3    # "index$iv":I
    :cond_4
    nop

    .line 1041
    .end local v1    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v2    # "$i$f$fastForEach":I
    iget-object v1, p0, Landroidx/compose/animation/core/Transition;->_transitions:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v1, Ljava/util/List;

    .restart local v1    # "$this$fastForEach$iv":Ljava/util/List;
    const/4 v2, 0x0

    .line 2193
    .restart local v2    # "$i$f$fastForEach":I
    nop

    .line 2194
    const/4 v3, 0x0

    .restart local v3    # "index$iv":I
    move-object v4, v1

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->size()I

    move-result v4

    :goto_2
    if-ge v3, v4, :cond_7

    .line 2195
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    .line 2196
    .restart local v5    # "item$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Landroidx/compose/animation/core/Transition;

    .local v6, "it":Landroidx/compose/animation/core/Transition;
    const/4 v7, 0x0

    .line 1042
    .local v7, "$i$a$-fastForEach-Transition$onFrame$2":I
    invoke-virtual {v6}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v6}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v9

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 1043
    invoke-virtual {v6, p1, p2, p3}, Landroidx/compose/animation/core/Transition;->onFrame$animation_core_release(JZ)V

    .line 1045
    :cond_5
    invoke-virtual {v6}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v6}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v9

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_6

    .line 1046
    const/4 v0, 0x0

    .line 1048
    :cond_6
    nop

    .line 2196
    .end local v6    # "it":Landroidx/compose/animation/core/Transition;
    .end local v7    # "$i$a$-fastForEach-Transition$onFrame$2":I
    nop

    .line 2194
    .end local v5    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 2198
    .end local v3    # "index$iv":I
    :cond_7
    nop

    .line 1049
    .end local v1    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v2    # "$i$f$fastForEach":I
    if-eqz v0, :cond_8

    .line 1050
    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->onTransitionEnd$animation_core_release()V

    .line 1052
    :cond_8
    return-void
.end method

.method public final onTransitionEnd$animation_core_release()V
    .locals 7

    .line 1073
    const-wide/high16 v0, -0x8000000000000000L

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/Transition;->setStartTimeNanos$animation_core_release(J)V

    .line 1074
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->transitionState:Landroidx/compose/animation/core/TransitionState;

    instance-of v0, v0, Landroidx/compose/animation/core/MutableTransitionState;

    if-eqz v0, :cond_0

    .line 1075
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->transitionState:Landroidx/compose/animation/core/TransitionState;

    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/compose/animation/core/TransitionState;->setCurrentState$animation_core_release(Ljava/lang/Object;)V

    .line 1077
    :cond_0
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/Transition;->setPlayTimeNanos(J)V

    .line 1078
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->transitionState:Landroidx/compose/animation/core/TransitionState;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/compose/animation/core/TransitionState;->setRunning$animation_core_release(Z)V

    .line 1079
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_transitions:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .local v0, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2199
    .local v1, "$i$f$fastForEach":I
    nop

    .line 2200
    const/4 v2, 0x0

    .local v2, "index$iv":I
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_0
    if-ge v2, v3, :cond_1

    .line 2201
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2202
    .local v4, "item$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Landroidx/compose/animation/core/Transition;

    .local v5, "it":Landroidx/compose/animation/core/Transition;
    const/4 v6, 0x0

    .line 1079
    .local v6, "$i$a$-fastForEach-Transition$onTransitionEnd$1":I
    invoke-virtual {v5}, Landroidx/compose/animation/core/Transition;->onTransitionEnd$animation_core_release()V

    .line 2202
    .end local v5    # "it":Landroidx/compose/animation/core/Transition;
    .end local v6    # "$i$a$-fastForEach-Transition$onTransitionEnd$1":I
    nop

    .line 2200
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2204
    .end local v2    # "index$iv":I
    :cond_1
    nop

    .line 1080
    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEach":I
    return-void
.end method

.method public final onTransitionStart$animation_core_release(J)V
    .locals 2
    .param p1, "frameTimeNanos"    # J

    .line 1060
    invoke-virtual {p0, p1, p2}, Landroidx/compose/animation/core/Transition;->setStartTimeNanos$animation_core_release(J)V

    .line 1061
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->transitionState:Landroidx/compose/animation/core/TransitionState;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/compose/animation/core/TransitionState;->setRunning$animation_core_release(Z)V

    .line 1062
    return-void
.end method

.method public final removeAnimation$animation_core_release(Landroidx/compose/animation/core/Transition$DeferredAnimation;)V
    .locals 2
    .param p1, "deferredAnimation"    # Landroidx/compose/animation/core/Transition$DeferredAnimation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/animation/core/Transition<",
            "TS;>.DeferredAnimation<**>;)V"
        }
    .end annotation

    .line 1694
    invoke-virtual {p1}, Landroidx/compose/animation/core/Transition$DeferredAnimation;->getData$animation_core_release()Landroidx/compose/animation/core/Transition$DeferredAnimation$DeferredAnimationData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/compose/animation/core/Transition$DeferredAnimation$DeferredAnimationData;->getAnimation()Landroidx/compose/animation/core/Transition$TransitionAnimationState;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2319
    .local v0, "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    const/4 v1, 0x0

    .line 1694
    .local v1, "$i$a$-let-Transition$removeAnimation$1":I
    invoke-virtual {p0, v0}, Landroidx/compose/animation/core/Transition;->removeAnimation$animation_core_release(Landroidx/compose/animation/core/Transition$TransitionAnimationState;)V

    .line 1695
    .end local v0    # "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    .end local v1    # "$i$a$-let-Transition$removeAnimation$1":I
    :cond_0
    return-void
.end method

.method public final removeAnimation$animation_core_release(Landroidx/compose/animation/core/Transition$TransitionAnimationState;)V
    .locals 1
    .param p1, "animation"    # Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/animation/core/Transition<",
            "TS;>.TransitionAnimationState<**>;)V"
        }
    .end annotation

    .line 1142
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->remove(Ljava/lang/Object;)Z

    .line 1143
    return-void
.end method

.method public final removeTransition$animation_core_release(Landroidx/compose/animation/core/Transition;)Z
    .locals 1
    .param p1, "transition"    # Landroidx/compose/animation/core/Transition;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/animation/core/Transition<",
            "*>;)Z"
        }
    .end annotation

    .line 1136
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_transitions:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public final resetAnimationFraction$animation_core_release(F)V
    .locals 7
    .param p1, "fraction"    # F

    .line 1241
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .local v0, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2267
    .local v1, "$i$f$fastForEach":I
    nop

    .line 2268
    const/4 v2, 0x0

    .local v2, "index$iv":I
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_0
    if-ge v2, v3, :cond_0

    .line 2269
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2270
    .local v4, "item$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Landroidx/compose/animation/core/Transition$TransitionAnimationState;

    .local v5, "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    const/4 v6, 0x0

    .line 1241
    .local v6, "$i$a$-fastForEach-Transition$resetAnimationFraction$1":I
    invoke-virtual {v5, p1}, Landroidx/compose/animation/core/Transition$TransitionAnimationState;->resetAnimationValue$animation_core_release(F)V

    .line 2270
    .end local v5    # "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    .end local v6    # "$i$a$-fastForEach-Transition$resetAnimationFraction$1":I
    nop

    .line 2268
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2272
    .end local v2    # "index$iv":I
    :cond_0
    nop

    .line 1242
    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEach":I
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_transitions:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .restart local v0    # "$this$fastForEach$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2273
    .restart local v1    # "$i$f$fastForEach":I
    nop

    .line 2274
    const/4 v2, 0x0

    .restart local v2    # "index$iv":I
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_1
    if-ge v2, v3, :cond_1

    .line 2275
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2276
    .restart local v4    # "item$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Landroidx/compose/animation/core/Transition;

    .local v5, "it":Landroidx/compose/animation/core/Transition;
    const/4 v6, 0x0

    .line 1242
    .local v6, "$i$a$-fastForEach-Transition$resetAnimationFraction$2":I
    invoke-virtual {v5, p1}, Landroidx/compose/animation/core/Transition;->resetAnimationFraction$animation_core_release(F)V

    .line 2276
    .end local v5    # "it":Landroidx/compose/animation/core/Transition;
    .end local v6    # "$i$a$-fastForEach-Transition$resetAnimationFraction$2":I
    nop

    .line 2274
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 2278
    .end local v2    # "index$iv":I
    :cond_1
    nop

    .line 1243
    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEach":I
    return-void
.end method

.method public final seek(Ljava/lang/Object;Ljava/lang/Object;J)V
    .locals 11
    .param p1, "initialState"    # Ljava/lang/Object;
    .param p2, "targetState"    # Ljava/lang/Object;
    .param p3, "playTimeNanos"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;TS;J)V"
        }
    .end annotation

    .line 1105
    const-wide/high16 v0, -0x8000000000000000L

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/Transition;->setStartTimeNanos$animation_core_release(J)V

    .line 1106
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->transitionState:Landroidx/compose/animation/core/TransitionState;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/compose/animation/core/TransitionState;->setRunning$animation_core_release(Z)V

    .line 1107
    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->isSeeking()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1109
    :cond_0
    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->transitionState:Landroidx/compose/animation/core/TransitionState;

    instance-of v0, v0, Landroidx/compose/animation/core/MutableTransitionState;

    if-eqz v0, :cond_1

    .line 1110
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->transitionState:Landroidx/compose/animation/core/TransitionState;

    invoke-virtual {v0, p1}, Landroidx/compose/animation/core/TransitionState;->setCurrentState$animation_core_release(Ljava/lang/Object;)V

    .line 1112
    :cond_1
    invoke-virtual {p0, p2}, Landroidx/compose/animation/core/Transition;->setTargetState$animation_core_release(Ljava/lang/Object;)V

    .line 1113
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroidx/compose/animation/core/Transition;->setSeeking$animation_core_release(Z)V

    .line 1114
    new-instance v0, Landroidx/compose/animation/core/Transition$SegmentImpl;

    invoke-direct {v0, p1, p2}, Landroidx/compose/animation/core/Transition$SegmentImpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    check-cast v0, Landroidx/compose/animation/core/Transition$Segment;

    invoke-direct {p0, v0}, Landroidx/compose/animation/core/Transition;->setSegment(Landroidx/compose/animation/core/Transition$Segment;)V

    .line 1117
    :cond_2
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_transitions:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .local v0, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2205
    .local v1, "$i$f$fastForEach":I
    nop

    .line 2206
    const/4 v2, 0x0

    .local v2, "index$iv":I
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_0
    if-ge v2, v3, :cond_4

    .line 2207
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2208
    .local v4, "item$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Landroidx/compose/animation/core/Transition;

    .local v5, "it":Landroidx/compose/animation/core/Transition;
    const/4 v6, 0x0

    .line 1119
    .local v6, "$i$a$-fastForEach-Transition$setPlaytimeAfterInitialAndTargetStateEstablished$1":I
    const-string/jumbo v7, "null cannot be cast to non-null type androidx.compose.animation.core.Transition<kotlin.Any>"

    invoke-static {v5, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v7, v5

    .local v7, "it":Landroidx/compose/animation/core/Transition;
    const/4 v8, 0x0

    .line 1120
    .local v8, "$i$a$-let-Transition$setPlaytimeAfterInitialAndTargetStateEstablished$1$1":I
    invoke-virtual {v7}, Landroidx/compose/animation/core/Transition;->isSeeking()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 1121
    nop

    .line 1122
    invoke-virtual {v7}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v9

    .line 1123
    invoke-virtual {v7}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v10

    .line 1124
    nop

    .line 1121
    invoke-virtual {v7, v9, v10, p3, p4}, Landroidx/compose/animation/core/Transition;->seek(Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 1127
    :cond_3
    nop

    .line 1119
    .end local v7    # "it":Landroidx/compose/animation/core/Transition;
    .end local v8    # "$i$a$-let-Transition$setPlaytimeAfterInitialAndTargetStateEstablished$1$1":I
    nop

    .line 1128
    nop

    .line 2208
    .end local v5    # "it":Landroidx/compose/animation/core/Transition;
    .end local v6    # "$i$a$-fastForEach-Transition$setPlaytimeAfterInitialAndTargetStateEstablished$1":I
    nop

    .line 2206
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2210
    .end local v2    # "index$iv":I
    :cond_4
    nop

    .line 1130
    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEach":I
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .restart local v0    # "$this$fastForEach$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2211
    .restart local v1    # "$i$f$fastForEach":I
    nop

    .line 2212
    const/4 v2, 0x0

    .restart local v2    # "index$iv":I
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_1
    if-ge v2, v3, :cond_5

    .line 2213
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2214
    .restart local v4    # "item$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Landroidx/compose/animation/core/Transition$TransitionAnimationState;

    .local v5, "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    const/4 v6, 0x0

    .line 1130
    .local v6, "$i$a$-fastForEach-Transition$setPlaytimeAfterInitialAndTargetStateEstablished$2":I
    invoke-virtual {v5, p3, p4}, Landroidx/compose/animation/core/Transition$TransitionAnimationState;->seekTo$animation_core_release(J)V

    .line 2214
    .end local v5    # "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    .end local v6    # "$i$a$-fastForEach-Transition$setPlaytimeAfterInitialAndTargetStateEstablished$2":I
    nop

    .line 2212
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 2216
    .end local v2    # "index$iv":I
    :cond_5
    nop

    .line 1131
    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEach":I
    iput-wide p3, p0, Landroidx/compose/animation/core/Transition;->lastSeekedTimeNanos:J

    .line 1132
    return-void
.end method

.method public final seekAnimations$animation_core_release(J)V
    .locals 9
    .param p1, "playTimeNanos"    # J

    .line 1209
    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getStartTimeNanos$animation_core_release()J

    move-result-wide v0

    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 1210
    invoke-virtual {p0, p1, p2}, Landroidx/compose/animation/core/Transition;->setStartTimeNanos$animation_core_release(J)V

    .line 1212
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroidx/compose/animation/core/Transition;->setPlayTimeNanos(J)V

    .line 1213
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroidx/compose/animation/core/Transition;->setUpdateChildrenNeeded(Z)V

    .line 1216
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .local v0, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2243
    .local v1, "$i$f$fastForEach":I
    nop

    .line 2244
    const/4 v2, 0x0

    .local v2, "index$iv":I
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_0
    if-ge v2, v3, :cond_1

    .line 2245
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2246
    .local v4, "item$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Landroidx/compose/animation/core/Transition$TransitionAnimationState;

    .local v5, "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    const/4 v6, 0x0

    .line 1216
    .local v6, "$i$a$-fastForEach-Transition$seekAnimations$1":I
    invoke-virtual {v5, p1, p2}, Landroidx/compose/animation/core/Transition$TransitionAnimationState;->seekTo$animation_core_release(J)V

    .line 2246
    .end local v5    # "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    .end local v6    # "$i$a$-fastForEach-Transition$seekAnimations$1":I
    nop

    .line 2244
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2248
    .end local v2    # "index$iv":I
    :cond_1
    nop

    .line 1217
    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEach":I
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_transitions:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .restart local v0    # "$this$fastForEach$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2249
    .restart local v1    # "$i$f$fastForEach":I
    nop

    .line 2250
    const/4 v2, 0x0

    .restart local v2    # "index$iv":I
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_1
    if-ge v2, v3, :cond_3

    .line 2251
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2252
    .restart local v4    # "item$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Landroidx/compose/animation/core/Transition;

    .local v5, "it":Landroidx/compose/animation/core/Transition;
    const/4 v6, 0x0

    .line 1218
    .local v6, "$i$a$-fastForEach-Transition$seekAnimations$2":I
    invoke-virtual {v5}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v5}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v8

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 1219
    invoke-virtual {v5, p1, p2}, Landroidx/compose/animation/core/Transition;->seekAnimations$animation_core_release(J)V

    .line 1221
    :cond_2
    nop

    .line 2252
    .end local v5    # "it":Landroidx/compose/animation/core/Transition;
    .end local v6    # "$i$a$-fastForEach-Transition$seekAnimations$2":I
    nop

    .line 2250
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 2254
    .end local v2    # "index$iv":I
    :cond_3
    nop

    .line 1222
    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEach":I
    return-void
.end method

.method public final setInitialAnimations$animation_core_release(Landroidx/compose/animation/core/SeekableTransitionState$SeekingAnimationState;)V
    .locals 7
    .param p1, "animationState"    # Landroidx/compose/animation/core/SeekableTransitionState$SeekingAnimationState;

    .line 1232
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .local v0, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2255
    .local v1, "$i$f$fastForEach":I
    nop

    .line 2256
    const/4 v2, 0x0

    .local v2, "index$iv":I
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_0
    if-ge v2, v3, :cond_0

    .line 2257
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2258
    .local v4, "item$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Landroidx/compose/animation/core/Transition$TransitionAnimationState;

    .local v5, "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    const/4 v6, 0x0

    .line 1232
    .local v6, "$i$a$-fastForEach-Transition$setInitialAnimations$1":I
    invoke-virtual {v5, p1}, Landroidx/compose/animation/core/Transition$TransitionAnimationState;->setInitialValueAnimation$animation_core_release(Landroidx/compose/animation/core/SeekableTransitionState$SeekingAnimationState;)V

    .line 2258
    .end local v5    # "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    .end local v6    # "$i$a$-fastForEach-Transition$setInitialAnimations$1":I
    nop

    .line 2256
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2260
    .end local v2    # "index$iv":I
    :cond_0
    nop

    .line 1233
    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEach":I
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_transitions:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .restart local v0    # "$this$fastForEach$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2261
    .restart local v1    # "$i$f$fastForEach":I
    nop

    .line 2262
    const/4 v2, 0x0

    .restart local v2    # "index$iv":I
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_1
    if-ge v2, v3, :cond_1

    .line 2263
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2264
    .restart local v4    # "item$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Landroidx/compose/animation/core/Transition;

    .local v5, "it":Landroidx/compose/animation/core/Transition;
    const/4 v6, 0x0

    .line 1233
    .local v6, "$i$a$-fastForEach-Transition$setInitialAnimations$2":I
    invoke-virtual {v5, p1}, Landroidx/compose/animation/core/Transition;->setInitialAnimations$animation_core_release(Landroidx/compose/animation/core/SeekableTransitionState$SeekingAnimationState;)V

    .line 2264
    .end local v5    # "it":Landroidx/compose/animation/core/Transition;
    .end local v6    # "$i$a$-fastForEach-Transition$setInitialAnimations$2":I
    nop

    .line 2262
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 2266
    .end local v2    # "index$iv":I
    :cond_1
    nop

    .line 1234
    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEach":I
    return-void
.end method

.method public final setLastSeekedTimeNanos$animation_core_release(J)V
    .locals 0
    .param p1, "<set-?>"    # J

    .line 968
    iput-wide p1, p0, Landroidx/compose/animation/core/Transition;->lastSeekedTimeNanos:J

    return-void
.end method

.method public final setPlayTimeNanos(J)V
    .locals 1
    .param p1, "value"    # J

    .line 939
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->parentTransition:Landroidx/compose/animation/core/Transition;

    if-nez v0, :cond_0

    .line 940
    invoke-direct {p0, p1, p2}, Landroidx/compose/animation/core/Transition;->set_playTimeNanos(J)V

    .line 942
    :cond_0
    return-void
.end method

.method public final setSeeking$animation_core_release(Z)V
    .locals 4
    .param p1, "<set-?>"    # Z

    .line 965
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->isSeeking$delegate:Landroidx/compose/runtime/MutableState;

    .local v0, "$this$setValue$iv":Landroidx/compose/runtime/MutableState;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .local v2, "value$iv":Ljava/lang/Object;
    const/4 v3, 0x0

    .line 2154
    .local v3, "$i$f$setValue":I
    invoke-interface {v0, v2}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 2155
    nop

    .line 965
    .end local v0    # "$this$setValue$iv":Landroidx/compose/runtime/MutableState;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "value$iv":Ljava/lang/Object;
    .end local v3    # "$i$f$setValue":I
    return-void
.end method

.method public final setStartTimeNanos$animation_core_release(J)V
    .locals 3
    .param p1, "<set-?>"    # J

    .line 946
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->startTimeNanos$delegate:Landroidx/compose/runtime/MutableLongState;

    .local v0, "$this$setValue$iv":Landroidx/compose/runtime/MutableLongState;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    const/4 v2, 0x0

    .line 2148
    .local v2, "$i$f$setValue":I
    invoke-interface {v0, p1, p2}, Landroidx/compose/runtime/MutableLongState;->setLongValue(J)V

    .line 2149
    nop

    .line 946
    .end local v0    # "$this$setValue$iv":Landroidx/compose/runtime/MutableLongState;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$i$f$setValue":I
    return-void
.end method

.method public final setTargetState$animation_core_release(Ljava/lang/Object;)V
    .locals 3
    .param p1, "<set-?>"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .line 912
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->targetState$delegate:Landroidx/compose/runtime/MutableState;

    .local v0, "$this$setValue$iv":Landroidx/compose/runtime/MutableState;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    const/4 v2, 0x0

    .line 2139
    .local v2, "$i$f$setValue":I
    invoke-interface {v0, p1}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 2140
    nop

    .line 912
    .end local v0    # "$this$setValue$iv":Landroidx/compose/runtime/MutableState;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$i$f$setValue":I
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 16

    .line 1263
    invoke-virtual/range {p0 .. p0}, Landroidx/compose/animation/core/Transition;->getAnimations()Ljava/util/List;

    move-result-object v0

    .local v0, "$this$fastFold$iv":Ljava/util/List;
    const-string/jumbo v1, "Transition animation values: "

    .local v1, "initial$iv":Ljava/lang/Object;
    const/4 v2, 0x0

    .line 2303
    .local v2, "$i$f$fastFold":I
    nop

    .line 2304
    const/4 v3, 0x0

    .local v3, "accumulator$iv":Ljava/lang/Object;
    move-object v3, v1

    .line 2305
    move-object v4, v0

    .local v4, "$this$fastForEach$iv$iv":Ljava/util/List;
    const/4 v5, 0x0

    .line 2306
    .local v5, "$i$f$fastForEach":I
    nop

    .line 2307
    const/4 v6, 0x0

    .local v6, "index$iv$iv":I
    move-object v7, v4

    check-cast v7, Ljava/util/Collection;

    invoke-interface {v7}, Ljava/util/Collection;->size()I

    move-result v7

    :goto_0
    if-ge v6, v7, :cond_0

    .line 2308
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .line 2309
    .local v8, "item$iv$iv":Ljava/lang/Object;
    move-object v9, v8

    .local v9, "e$iv":Ljava/lang/Object;
    const/4 v10, 0x0

    .line 2305
    .local v10, "$i$a$-fastForEach-ListUtilsKt$fastFold$2$iv":I
    move-object v11, v9

    check-cast v11, Landroidx/compose/animation/core/Transition$TransitionAnimationState;

    .local v11, "anim":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    move-object v12, v3

    .local v12, "acc":Ljava/lang/String;
    const/4 v13, 0x0

    .line 1263
    .local v13, "$i$a$-fastFold-Transition$toString$1":I
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 2305
    .end local v11    # "anim":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    .end local v12    # "acc":Ljava/lang/String;
    .end local v13    # "$i$a$-fastFold-Transition$toString$1":I
    move-object v3, v11

    .line 2309
    .end local v9    # "e$iv":Ljava/lang/Object;
    .end local v10    # "$i$a$-fastForEach-ListUtilsKt$fastFold$2$iv":I
    nop

    .line 2307
    .end local v8    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 2311
    .end local v6    # "index$iv$iv":I
    :cond_0
    nop

    .line 2312
    .end local v4    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v5    # "$i$f$fastForEach":I
    nop

    .line 1263
    .end local v0    # "$this$fastFold$iv":Ljava/util/List;
    .end local v1    # "initial$iv":Ljava/lang/Object;
    .end local v2    # "$i$f$fastFold":I
    .end local v3    # "accumulator$iv":Ljava/lang/Object;
    return-object v3
.end method

.method public final updateInitialValues$animation_core_release()V
    .locals 7

    .line 1258
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .local v0, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2291
    .local v1, "$i$f$fastForEach":I
    nop

    .line 2292
    const/4 v2, 0x0

    .local v2, "index$iv":I
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_0
    if-ge v2, v3, :cond_0

    .line 2293
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2294
    .local v4, "item$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Landroidx/compose/animation/core/Transition$TransitionAnimationState;

    .local v5, "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    const/4 v6, 0x0

    .line 1258
    .local v6, "$i$a$-fastForEach-Transition$updateInitialValues$1":I
    invoke-virtual {v5}, Landroidx/compose/animation/core/Transition$TransitionAnimationState;->updateInitialValue$animation_core_release()V

    .line 2294
    .end local v5    # "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    .end local v6    # "$i$a$-fastForEach-Transition$updateInitialValues$1":I
    nop

    .line 2292
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2296
    .end local v2    # "index$iv":I
    :cond_0
    nop

    .line 1259
    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEach":I
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_transitions:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .restart local v0    # "$this$fastForEach$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2297
    .restart local v1    # "$i$f$fastForEach":I
    nop

    .line 2298
    const/4 v2, 0x0

    .restart local v2    # "index$iv":I
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_1
    if-ge v2, v3, :cond_1

    .line 2299
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2300
    .restart local v4    # "item$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Landroidx/compose/animation/core/Transition;

    .local v5, "it":Landroidx/compose/animation/core/Transition;
    const/4 v6, 0x0

    .line 1259
    .local v6, "$i$a$-fastForEach-Transition$updateInitialValues$2":I
    invoke-virtual {v5}, Landroidx/compose/animation/core/Transition;->updateInitialValues$animation_core_release()V

    .line 2300
    .end local v5    # "it":Landroidx/compose/animation/core/Transition;
    .end local v6    # "$i$a$-fastForEach-Transition$updateInitialValues$2":I
    nop

    .line 2298
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 2302
    .end local v2    # "index$iv":I
    :cond_1
    nop

    .line 1260
    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEach":I
    return-void
.end method

.method public final updateTarget$animation_core_release(Ljava/lang/Object;)V
    .locals 7
    .param p1, "targetState"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .line 1150
    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1152
    new-instance v0, Landroidx/compose/animation/core/Transition$SegmentImpl;

    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroidx/compose/animation/core/Transition$SegmentImpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    check-cast v0, Landroidx/compose/animation/core/Transition$Segment;

    invoke-direct {p0, v0}, Landroidx/compose/animation/core/Transition;->setSegment(Landroidx/compose/animation/core/Transition$Segment;)V

    .line 1153
    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1154
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->transitionState:Landroidx/compose/animation/core/TransitionState;

    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/compose/animation/core/TransitionState;->setCurrentState$animation_core_release(Ljava/lang/Object;)V

    .line 1156
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/compose/animation/core/Transition;->setTargetState$animation_core_release(Ljava/lang/Object;)V

    .line 1157
    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->isRunning()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1158
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroidx/compose/animation/core/Transition;->setUpdateChildrenNeeded(Z)V

    .line 1164
    :cond_1
    iget-object v0, p0, Landroidx/compose/animation/core/Transition;->_animations:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    check-cast v0, Ljava/util/List;

    .local v0, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 2217
    .local v1, "$i$f$fastForEach":I
    nop

    .line 2218
    const/4 v2, 0x0

    .local v2, "index$iv":I
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_0
    if-ge v2, v3, :cond_2

    .line 2219
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2220
    .local v4, "item$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Landroidx/compose/animation/core/Transition$TransitionAnimationState;

    .local v5, "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    const/4 v6, 0x0

    .line 1164
    .local v6, "$i$a$-fastForEach-Transition$updateTarget$1":I
    invoke-virtual {v5}, Landroidx/compose/animation/core/Transition$TransitionAnimationState;->resetAnimation$animation_core_release()V

    .line 2220
    .end local v5    # "it":Landroidx/compose/animation/core/Transition$TransitionAnimationState;
    .end local v6    # "$i$a$-fastForEach-Transition$updateTarget$1":I
    nop

    .line 2218
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2222
    .end local v2    # "index$iv":I
    :cond_2
    nop

    .line 1166
    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEach":I
    :cond_3
    return-void
.end method
