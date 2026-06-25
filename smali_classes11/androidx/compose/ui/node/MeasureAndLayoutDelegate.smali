.class public final Landroidx/compose/ui/node/MeasureAndLayoutDelegate;
.super Ljava/lang/Object;
.source "MeasureAndLayoutDelegate.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;,
        Landroidx/compose/ui/node/MeasureAndLayoutDelegate$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nMeasureAndLayoutDelegate.kt\nKotlin\n*S Kotlin\n*F\n+ 1 MeasureAndLayoutDelegate.kt\nandroidx/compose/ui/node/MeasureAndLayoutDelegate\n+ 2 MutableVector.kt\nandroidx/compose/runtime/collection/MutableVectorKt\n+ 3 InlineClassHelper.kt\nandroidx/compose/ui/internal/InlineClassHelperKt\n+ 4 DepthSortedSet.kt\nandroidx/compose/ui/node/DepthSortedSetsForDifferentPasses\n+ 5 DepthSortedSet.kt\nandroidx/compose/ui/node/DepthSortedSet\n+ 6 LayoutNode.kt\nandroidx/compose/ui/node/LayoutNode\n+ 7 MutableVector.kt\nandroidx/compose/runtime/collection/MutableVector\n*L\n1#1,756:1\n487#1:778\n488#1:782\n490#1,10:784\n501#1,6:801\n487#1:807\n488#1:811\n490#1,17:813\n487#1:845\n488#1:849\n490#1:851\n491#1,16:857\n1101#2:757\n1083#2,2:758\n1101#2:760\n1083#2,2:761\n102#3,5:763\n102#3,5:768\n56#3,5:773\n102#3,3:779\n106#3:783\n102#3,3:808\n106#3:812\n102#3,5:840\n102#3,3:846\n106#3:850\n102#3,5:852\n102#3,5:883\n102#3,5:888\n102#3,5:893\n56#3,5:919\n102#3,5:924\n189#4,2:794\n191#4,4:797\n107#5:796\n207#6:830\n207#6:873\n207#6:929\n423#7,9:831\n423#7,9:874\n641#7,2:898\n423#7,9:900\n519#7:909\n423#7,9:910\n423#7,9:930\n*S KotlinDebug\n*F\n+ 1 MeasureAndLayoutDelegate.kt\nandroidx/compose/ui/node/MeasureAndLayoutDelegate\n*L\n384#1:778\n384#1:782\n384#1:784,10\n384#1:801,6\n405#1:807\n405#1:811\n405#1:813,17\n446#1:845\n446#1:849\n446#1:851\n446#1:857,16\n65#1:757\n65#1:758,2\n86#1:760\n86#1:761,2\n73#1:763,5\n93#1:768,5\n127#1:773,5\n384#1:779,3\n384#1:783\n405#1:808,3\n405#1:812\n445#1:840,5\n446#1:846,3\n446#1:850\n446#1:852,5\n487#1:883,5\n490#1:888,5\n491#1:893,5\n647#1:919,5\n652#1:924,5\n386#1:794,2\n386#1:797,4\n386#1:796\n425#1:830\n475#1:873\n672#1:929\n425#1:831,9\n475#1:874,9\n509#1:898,2\n513#1:900,9\n597#1:909\n598#1:910,9\n672#1:930,9\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\\\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\n\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0010\u0002\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0008\u001b\u0008\u0000\u0018\u00002\u00020\u0001:\u0001VB\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0008\u0010+\u001a\u00020,H\u0002J\u0010\u0010-\u001a\u00020,2\u0008\u0008\u0002\u0010.\u001a\u00020\u0008J\"\u0010/\u001a\u00020\u00082\u0006\u00100\u001a\u00020\u00032\u0008\u00101\u001a\u0004\u0018\u00010!H\u0002\u00f8\u0001\u0000\u00a2\u0006\u0002\u00082J\"\u00103\u001a\u00020\u00082\u0006\u00100\u001a\u00020\u00032\u0008\u00101\u001a\u0004\u0018\u00010!H\u0002\u00f8\u0001\u0000\u00a2\u0006\u0002\u00084J\u0008\u00105\u001a\u00020,H\u0002J\u0010\u00106\u001a\u00020,2\u0006\u00100\u001a\u00020\u0003H\u0002J\u0016\u00107\u001a\u00020,2\u0006\u00100\u001a\u00020\u00032\u0006\u00108\u001a\u00020\u0008J\u0018\u00109\u001a\u00020,2\u0006\u00100\u001a\u00020\u00032\u0006\u00108\u001a\u00020\u0008H\u0002J\u0018\u0010:\u001a\u00020\u00082\u0010\u0008\u0002\u0010;\u001a\n\u0012\u0004\u0012\u00020,\u0018\u00010<J \u0010:\u001a\u00020,2\u0006\u00100\u001a\u00020\u00032\u0006\u00101\u001a\u00020!\u00f8\u0001\u0000\u00a2\u0006\u0004\u0008=\u0010>J\u0006\u0010?\u001a\u00020,J\u000e\u0010@\u001a\u00020,2\u0006\u0010A\u001a\u00020\u0003J\u0018\u0010B\u001a\u00020,2\u0006\u0010A\u001a\u00020\u00032\u0006\u00108\u001a\u00020\u0008H\u0002J\u001f\u0010C\u001a\u00020,2\u0006\u0010D\u001a\u00020\u00082\u000c\u0010E\u001a\u0008\u0012\u0004\u0012\u00020,0<H\u0082\u0008J\u000e\u0010F\u001a\u00020,2\u0006\u0010G\u001a\u00020\u0019J$\u0010H\u001a\u00020\u00082\u0006\u00100\u001a\u00020\u00032\u0008\u0008\u0002\u00108\u001a\u00020\u00082\u0008\u0008\u0002\u0010I\u001a\u00020\u0008H\u0002J\u0010\u0010J\u001a\u00020,2\u0006\u00100\u001a\u00020\u0003H\u0002J\u0018\u0010K\u001a\u00020,2\u0006\u00100\u001a\u00020\u00032\u0006\u00108\u001a\u00020\u0008H\u0002J\u0018\u0010L\u001a\u00020\u00082\u0006\u00100\u001a\u00020\u00032\u0008\u0008\u0002\u0010M\u001a\u00020\u0008J\u0018\u0010N\u001a\u00020\u00082\u0006\u00100\u001a\u00020\u00032\u0008\u0008\u0002\u0010M\u001a\u00020\u0008J\u000e\u0010O\u001a\u00020,2\u0006\u00100\u001a\u00020\u0003J\u0018\u0010P\u001a\u00020\u00082\u0006\u00100\u001a\u00020\u00032\u0008\u0008\u0002\u0010M\u001a\u00020\u0008J\u0018\u0010Q\u001a\u00020\u00082\u0006\u00100\u001a\u00020\u00032\u0008\u0008\u0002\u0010M\u001a\u00020\u0008J\u0018\u0010R\u001a\u00020,2\u0006\u00101\u001a\u00020!\u00f8\u0001\u0000\u00a2\u0006\u0004\u0008S\u0010TJ\u0014\u0010U\u001a\u00020\u0008*\u00020\u00032\u0006\u00108\u001a\u00020\u0008H\u0002R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\t\u001a\u00020\u0008X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\n\u0010\u000b\"\u0004\u0008\u000c\u0010\rR\u0011\u0010\u000e\u001a\u00020\u00088F\u00a2\u0006\u0006\u001a\u0004\u0008\u000f\u0010\u000bR\u0011\u0010\u0010\u001a\u00020\u00088F\u00a2\u0006\u0006\u001a\u0004\u0008\u0011\u0010\u000bR \u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0012\u001a\u00020\u00138F@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016R\u0014\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\u00190\u0018X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u001bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u001c\u001a\u0008\u0012\u0004\u0012\u00020\u001d0\u0018X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u001fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010 \u001a\u0004\u0018\u00010!X\u0082\u000e\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0002\n\u0000R\u0018\u0010\"\u001a\u00020\u0008*\u00020\u00038BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008#\u0010$R\u0018\u0010%\u001a\u00020\u0008*\u00020\u00038BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008&\u0010$R\u0018\u0010\'\u001a\u00020\u0008*\u00020\u00038BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008(\u0010$R\u0018\u0010)\u001a\u00020\u0008*\u00020\u00038BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008*\u0010$\u0082\u0002\u000b\n\u0005\u0008\u00a1\u001e0\u0001\n\u0002\u0008!\u00a8\u0006W"
    }
    d2 = {
        "Landroidx/compose/ui/node/MeasureAndLayoutDelegate;",
        "",
        "root",
        "Landroidx/compose/ui/node/LayoutNode;",
        "(Landroidx/compose/ui/node/LayoutNode;)V",
        "consistencyChecker",
        "Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;",
        "duringFullMeasureLayoutPass",
        "",
        "duringMeasureLayout",
        "getDuringMeasureLayout$ui_release",
        "()Z",
        "setDuringMeasureLayout$ui_release",
        "(Z)V",
        "hasPendingMeasureOrLayout",
        "getHasPendingMeasureOrLayout",
        "hasPendingOnPositionedCallbacks",
        "getHasPendingOnPositionedCallbacks",
        "<set-?>",
        "",
        "measureIteration",
        "getMeasureIteration",
        "()J",
        "onLayoutCompletedListeners",
        "Landroidx/compose/runtime/collection/MutableVector;",
        "Landroidx/compose/ui/node/Owner$OnLayoutCompletedListener;",
        "onPositionedDispatcher",
        "Landroidx/compose/ui/node/OnPositionedDispatcher;",
        "postponedMeasureRequests",
        "Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;",
        "relayoutNodes",
        "Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;",
        "rootConstraints",
        "Landroidx/compose/ui/unit/Constraints;",
        "canAffectParent",
        "getCanAffectParent",
        "(Landroidx/compose/ui/node/LayoutNode;)Z",
        "canAffectParentInLookahead",
        "getCanAffectParentInLookahead",
        "measureAffectsParent",
        "getMeasureAffectsParent",
        "measureAffectsParentLookahead",
        "getMeasureAffectsParentLookahead",
        "callOnLayoutCompletedListeners",
        "",
        "dispatchOnPositionedCallbacks",
        "forceDispatch",
        "doLookaheadRemeasure",
        "layoutNode",
        "constraints",
        "doLookaheadRemeasure-sdFAvZA",
        "doRemeasure",
        "doRemeasure-sdFAvZA",
        "drainPostponedMeasureRequests",
        "ensureSubtreeLookaheadReplaced",
        "forceMeasureTheSubtree",
        "affectsLookahead",
        "forceMeasureTheSubtreeInternal",
        "measureAndLayout",
        "onLayout",
        "Lkotlin/Function0;",
        "measureAndLayout-0kLqBqw",
        "(Landroidx/compose/ui/node/LayoutNode;J)V",
        "measureOnly",
        "onNodeDetached",
        "node",
        "onlyRemeasureIfScheduled",
        "performMeasureAndLayout",
        "fullPass",
        "block",
        "registerOnLayoutCompletedListener",
        "listener",
        "remeasureAndRelayoutIfNeeded",
        "relayoutNeeded",
        "remeasureLookaheadRootsInSubtree",
        "remeasureOnly",
        "requestLookaheadRelayout",
        "forced",
        "requestLookaheadRemeasure",
        "requestOnPositionedCallback",
        "requestRelayout",
        "requestRemeasure",
        "updateRootConstraints",
        "updateRootConstraints-BRTryo0",
        "(J)V",
        "measurePending",
        "PostponedRequest",
        "ui_release"
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
.field private final consistencyChecker:Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;

.field private duringFullMeasureLayoutPass:Z

.field private duringMeasureLayout:Z

.field private measureIteration:J

.field private final onLayoutCompletedListeners:Landroidx/compose/runtime/collection/MutableVector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/collection/MutableVector<",
            "Landroidx/compose/ui/node/Owner$OnLayoutCompletedListener;",
            ">;"
        }
    .end annotation
.end field

.field private final onPositionedDispatcher:Landroidx/compose/ui/node/OnPositionedDispatcher;

.field private final postponedMeasureRequests:Landroidx/compose/runtime/collection/MutableVector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/collection/MutableVector<",
            "Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

.field private final root:Landroidx/compose/ui/node/LayoutNode;

.field private rootConstraints:Landroidx/compose/ui/unit/Constraints;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroidx/compose/ui/node/LayoutNode;)V
    .locals 6
    .param p1, "root"    # Landroidx/compose/ui/node/LayoutNode;

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    .line 43
    new-instance v0, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    sget-object v1, Landroidx/compose/ui/node/Owner;->Companion:Landroidx/compose/ui/node/Owner$Companion;

    invoke-virtual {v1}, Landroidx/compose/ui/node/Owner$Companion;->getEnableExtraAssertions()Z

    move-result v1

    invoke-direct {v0, v1}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;-><init>(Z)V

    iput-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    .line 62
    new-instance v0, Landroidx/compose/ui/node/OnPositionedDispatcher;

    invoke-direct {v0}, Landroidx/compose/ui/node/OnPositionedDispatcher;-><init>()V

    iput-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->onPositionedDispatcher:Landroidx/compose/ui/node/OnPositionedDispatcher;

    .line 65
    const/4 v0, 0x0

    .line 757
    .local v0, "$i$f$mutableVectorOf":I
    nop

    .line 758
    const/16 v1, 0x10

    .local v1, "capacity$iv$iv":I
    const/4 v2, 0x0

    .line 759
    .local v2, "$i$f$MutableVector":I
    new-instance v3, Landroidx/compose/runtime/collection/MutableVector;

    new-array v4, v1, [Landroidx/compose/ui/node/Owner$OnLayoutCompletedListener;

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5}, Landroidx/compose/runtime/collection/MutableVector;-><init>([Ljava/lang/Object;I)V

    .line 757
    .end local v1    # "capacity$iv$iv":I
    .end local v2    # "$i$f$MutableVector":I
    nop

    .line 65
    .end local v0    # "$i$f$mutableVectorOf":I
    iput-object v3, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->onLayoutCompletedListeners:Landroidx/compose/runtime/collection/MutableVector;

    .line 71
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->measureIteration:J

    .line 86
    const/4 v0, 0x0

    .line 760
    .restart local v0    # "$i$f$mutableVectorOf":I
    nop

    .line 761
    const/16 v1, 0x10

    .restart local v1    # "capacity$iv$iv":I
    const/4 v2, 0x0

    .line 762
    .restart local v2    # "$i$f$MutableVector":I
    new-instance v3, Landroidx/compose/runtime/collection/MutableVector;

    new-array v4, v1, [Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;

    invoke-direct {v3, v4, v5}, Landroidx/compose/runtime/collection/MutableVector;-><init>([Ljava/lang/Object;I)V

    .line 760
    .end local v1    # "capacity$iv$iv":I
    .end local v2    # "$i$f$MutableVector":I
    nop

    .line 86
    .end local v0    # "$i$f$mutableVectorOf":I
    iput-object v3, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->postponedMeasureRequests:Landroidx/compose/runtime/collection/MutableVector;

    .line 106
    sget-object v0, Landroidx/compose/ui/node/Owner;->Companion:Landroidx/compose/ui/node/Owner$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/node/Owner$Companion;->getEnableExtraAssertions()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 107
    new-instance v0, Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;

    .line 108
    iget-object v1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    .line 109
    iget-object v2, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    .line 110
    iget-object v3, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->postponedMeasureRequests:Landroidx/compose/runtime/collection/MutableVector;

    invoke-virtual {v3}, Landroidx/compose/runtime/collection/MutableVector;->asMutableList()Ljava/util/List;

    move-result-object v3

    .line 107
    invoke-direct {v0, v1, v2, v3}, Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;-><init>(Landroidx/compose/ui/node/LayoutNode;Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;Ljava/util/List;)V

    goto :goto_0

    .line 113
    :cond_0
    const/4 v0, 0x0

    .line 106
    :goto_0
    iput-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->consistencyChecker:Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;

    .line 41
    return-void
.end method

.method public static final synthetic access$getRoot$p(Landroidx/compose/ui/node/MeasureAndLayoutDelegate;)Landroidx/compose/ui/node/LayoutNode;
    .locals 1
    .param p0, "$this"    # Landroidx/compose/ui/node/MeasureAndLayoutDelegate;

    .line 41
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    return-object v0
.end method

.method private final callOnLayoutCompletedListeners()V
    .locals 7

    .line 513
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->onLayoutCompletedListeners:Landroidx/compose/runtime/collection/MutableVector;

    .local v0, "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v1, 0x0

    .line 900
    .local v1, "$i$f$forEach":I
    nop

    .line 901
    const/4 v2, 0x0

    .line 902
    .local v2, "i$iv":I
    iget-object v3, v0, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    .line 903
    .local v3, "content$iv":[Ljava/lang/Object;
    invoke-virtual {v0}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v4

    .line 904
    .local v4, "size$iv":I
    :goto_0
    if-ge v2, v4, :cond_0

    .line 905
    aget-object v5, v3, v2

    check-cast v5, Landroidx/compose/ui/node/Owner$OnLayoutCompletedListener;

    .local v5, "it":Landroidx/compose/ui/node/Owner$OnLayoutCompletedListener;
    const/4 v6, 0x0

    .line 513
    .local v6, "$i$a$-forEach-MeasureAndLayoutDelegate$callOnLayoutCompletedListeners$1":I
    invoke-interface {v5}, Landroidx/compose/ui/node/Owner$OnLayoutCompletedListener;->onLayoutComplete()V

    .line 905
    .end local v5    # "it":Landroidx/compose/ui/node/Owner$OnLayoutCompletedListener;
    .end local v6    # "$i$a$-forEach-MeasureAndLayoutDelegate$callOnLayoutCompletedListeners$1":I
    nop

    .line 906
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 908
    :cond_0
    nop

    .line 514
    .end local v0    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v1    # "$i$f$forEach":I
    .end local v2    # "i$iv":I
    .end local v3    # "content$iv":[Ljava/lang/Object;
    .end local v4    # "size$iv":I
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->onLayoutCompletedListeners:Landroidx/compose/runtime/collection/MutableVector;

    invoke-virtual {v0}, Landroidx/compose/runtime/collection/MutableVector;->clear()V

    .line 515
    return-void
.end method

.method public static synthetic dispatchOnPositionedCallbacks$default(Landroidx/compose/ui/node/MeasureAndLayoutDelegate;ZILjava/lang/Object;)V
    .locals 0

    .line 719
    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    :cond_0
    invoke-virtual {p0, p1}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->dispatchOnPositionedCallbacks(Z)V

    return-void
.end method

.method private final doLookaheadRemeasure-sdFAvZA(Landroidx/compose/ui/node/LayoutNode;Landroidx/compose/ui/unit/Constraints;)Z
    .locals 10
    .param p1, "layoutNode"    # Landroidx/compose/ui/node/LayoutNode;
    .param p2, "constraints"    # Landroidx/compose/ui/unit/Constraints;

    .line 340
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadRoot$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 342
    :cond_0
    const/4 v0, 0x1

    const/4 v2, 0x0

    if-eqz p2, :cond_1

    .line 343
    invoke-virtual {p1, p2}, Landroidx/compose/ui/node/LayoutNode;->lookaheadRemeasure-_Sx5XlM$ui_release(Landroidx/compose/ui/unit/Constraints;)Z

    move-result v3

    goto :goto_0

    .line 345
    :cond_1
    invoke-static {p1, v2, v0, v2}, Landroidx/compose/ui/node/LayoutNode;->lookaheadRemeasure-_Sx5XlM$ui_release$default(Landroidx/compose/ui/node/LayoutNode;Landroidx/compose/ui/unit/Constraints;ILjava/lang/Object;)Z

    move-result v3

    .line 342
    :goto_0
    nop

    .line 341
    nop

    .line 348
    .local v3, "lookaheadSizeChanged":Z
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getParent$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v4

    .line 349
    .local v4, "parent":Landroidx/compose/ui/node/LayoutNode;
    if-eqz v3, :cond_4

    if-eqz v4, :cond_4

    .line 350
    invoke-virtual {v4}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadRoot$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v5

    if-nez v5, :cond_2

    .line 351
    const/4 v8, 0x3

    const/4 v9, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v4 .. v9}, Landroidx/compose/ui/node/LayoutNode;->requestRemeasure$ui_release$default(Landroidx/compose/ui/node/LayoutNode;ZZZILjava/lang/Object;)V

    goto :goto_1

    .line 352
    :cond_2
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getMeasuredByParentInLookahead$ui_release()Landroidx/compose/ui/node/LayoutNode$UsageByParent;

    move-result-object v5

    sget-object v6, Landroidx/compose/ui/node/LayoutNode$UsageByParent;->InMeasureBlock:Landroidx/compose/ui/node/LayoutNode$UsageByParent;

    if-ne v5, v6, :cond_3

    .line 353
    const/4 v8, 0x3

    const/4 v9, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v4 .. v9}, Landroidx/compose/ui/node/LayoutNode;->requestLookaheadRemeasure$ui_release$default(Landroidx/compose/ui/node/LayoutNode;ZZZILjava/lang/Object;)V

    goto :goto_1

    .line 354
    :cond_3
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getMeasuredByParentInLookahead$ui_release()Landroidx/compose/ui/node/LayoutNode$UsageByParent;

    move-result-object v5

    sget-object v6, Landroidx/compose/ui/node/LayoutNode$UsageByParent;->InLayoutBlock:Landroidx/compose/ui/node/LayoutNode$UsageByParent;

    if-ne v5, v6, :cond_4

    .line 355
    invoke-static {v4, v1, v0, v2}, Landroidx/compose/ui/node/LayoutNode;->requestLookaheadRelayout$ui_release$default(Landroidx/compose/ui/node/LayoutNode;ZILjava/lang/Object;)V

    .line 358
    :cond_4
    :goto_1
    return v3
.end method

.method private final doRemeasure-sdFAvZA(Landroidx/compose/ui/node/LayoutNode;Landroidx/compose/ui/unit/Constraints;)Z
    .locals 9
    .param p1, "layoutNode"    # Landroidx/compose/ui/node/LayoutNode;
    .param p2, "constraints"    # Landroidx/compose/ui/unit/Constraints;

    .line 363
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    .line 364
    invoke-virtual {p1, p2}, Landroidx/compose/ui/node/LayoutNode;->remeasure-_Sx5XlM$ui_release(Landroidx/compose/ui/unit/Constraints;)Z

    move-result v2

    goto :goto_0

    .line 366
    :cond_0
    invoke-static {p1, v1, v0, v1}, Landroidx/compose/ui/node/LayoutNode;->remeasure-_Sx5XlM$ui_release$default(Landroidx/compose/ui/node/LayoutNode;Landroidx/compose/ui/unit/Constraints;ILjava/lang/Object;)Z

    move-result v2

    .line 363
    :goto_0
    nop

    .line 362
    nop

    .line 368
    .local v2, "sizeChanged":Z
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getParent$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v3

    .line 369
    .local v3, "parent":Landroidx/compose/ui/node/LayoutNode;
    if-eqz v2, :cond_2

    if-eqz v3, :cond_2

    .line 370
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getMeasuredByParent$ui_release()Landroidx/compose/ui/node/LayoutNode$UsageByParent;

    move-result-object v4

    sget-object v5, Landroidx/compose/ui/node/LayoutNode$UsageByParent;->InMeasureBlock:Landroidx/compose/ui/node/LayoutNode$UsageByParent;

    if-ne v4, v5, :cond_1

    .line 371
    const/4 v7, 0x3

    const/4 v8, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v3 .. v8}, Landroidx/compose/ui/node/LayoutNode;->requestRemeasure$ui_release$default(Landroidx/compose/ui/node/LayoutNode;ZZZILjava/lang/Object;)V

    goto :goto_1

    .line 372
    :cond_1
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getMeasuredByParent$ui_release()Landroidx/compose/ui/node/LayoutNode$UsageByParent;

    move-result-object v4

    sget-object v5, Landroidx/compose/ui/node/LayoutNode$UsageByParent;->InLayoutBlock:Landroidx/compose/ui/node/LayoutNode$UsageByParent;

    if-ne v4, v5, :cond_2

    .line 373
    const/4 v4, 0x0

    invoke-static {v3, v4, v0, v1}, Landroidx/compose/ui/node/LayoutNode;->requestRelayout$ui_release$default(Landroidx/compose/ui/node/LayoutNode;ZILjava/lang/Object;)V

    .line 376
    :cond_2
    :goto_1
    return v2
.end method

.method private final drainPostponedMeasureRequests()V
    .locals 21

    .line 597
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->postponedMeasureRequests:Landroidx/compose/runtime/collection/MutableVector;

    .local v1, "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v2, 0x0

    .line 909
    .local v2, "$i$f$isNotEmpty":I
    invoke-virtual {v1}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 597
    .end local v1    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v2    # "$i$f$isNotEmpty":I
    :goto_0
    if-eqz v3, :cond_4

    .line 598
    iget-object v1, v0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->postponedMeasureRequests:Landroidx/compose/runtime/collection/MutableVector;

    .restart local v1    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v2, 0x0

    .line 910
    .local v2, "$i$f$forEach":I
    nop

    .line 911
    const/4 v3, 0x0

    .line 912
    .local v3, "i$iv":I
    iget-object v4, v1, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    .line 913
    .local v4, "content$iv":[Ljava/lang/Object;
    invoke-virtual {v1}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v5

    .line 914
    .local v5, "size$iv":I
    :goto_1
    if-ge v3, v5, :cond_3

    .line 915
    aget-object v6, v4, v3

    check-cast v6, Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;

    .local v6, "request":Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;
    const/4 v7, 0x0

    .line 599
    .local v7, "$i$a$-forEach-MeasureAndLayoutDelegate$drainPostponedMeasureRequests$1":I
    invoke-virtual {v6}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;->getNode()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v8

    invoke-virtual {v8}, Landroidx/compose/ui/node/LayoutNode;->isAttached()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 600
    invoke-virtual {v6}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;->isLookahead()Z

    move-result v8

    if-nez v8, :cond_1

    .line 601
    invoke-virtual {v6}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;->getNode()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v9

    .line 602
    invoke-virtual {v6}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;->isForced()Z

    move-result v10

    .line 601
    nop

    .line 603
    nop

    .line 601
    const/4 v13, 0x2

    const/4 v14, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static/range {v9 .. v14}, Landroidx/compose/ui/node/LayoutNode;->requestRemeasure$ui_release$default(Landroidx/compose/ui/node/LayoutNode;ZZZILjava/lang/Object;)V

    goto :goto_2

    .line 606
    :cond_1
    invoke-virtual {v6}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;->getNode()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v15

    .line 607
    invoke-virtual {v6}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;->isForced()Z

    move-result v16

    .line 606
    nop

    .line 608
    nop

    .line 606
    const/16 v19, 0x2

    const/16 v20, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-static/range {v15 .. v20}, Landroidx/compose/ui/node/LayoutNode;->requestLookaheadRemeasure$ui_release$default(Landroidx/compose/ui/node/LayoutNode;ZZZILjava/lang/Object;)V

    .line 612
    :cond_2
    :goto_2
    nop

    .line 915
    .end local v6    # "request":Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;
    .end local v7    # "$i$a$-forEach-MeasureAndLayoutDelegate$drainPostponedMeasureRequests$1":I
    nop

    .line 916
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 918
    :cond_3
    nop

    .line 613
    .end local v1    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v2    # "$i$f$forEach":I
    .end local v3    # "i$iv":I
    .end local v4    # "content$iv":[Ljava/lang/Object;
    .end local v5    # "size$iv":I
    iget-object v1, v0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->postponedMeasureRequests:Landroidx/compose/runtime/collection/MutableVector;

    invoke-virtual {v1}, Landroidx/compose/runtime/collection/MutableVector;->clear()V

    .line 615
    :cond_4
    return-void
.end method

.method private final ensureSubtreeLookaheadReplaced(Landroidx/compose/ui/node/LayoutNode;)V
    .locals 12
    .param p1, "layoutNode"    # Landroidx/compose/ui/node/LayoutNode;

    .line 475
    move-object v0, p1

    .local v0, "this_$iv":Landroidx/compose/ui/node/LayoutNode;
    const/4 v1, 0x0

    .line 873
    .local v1, "$i$f$forEachChild":I
    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->get_children$ui_release()Landroidx/compose/runtime/collection/MutableVector;

    move-result-object v2

    .local v2, "this_$iv$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v3, 0x0

    .line 874
    .local v3, "$i$f$forEach":I
    nop

    .line 875
    const/4 v4, 0x0

    .line 876
    .local v4, "i$iv$iv":I
    iget-object v5, v2, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    .line 877
    .local v5, "content$iv$iv":[Ljava/lang/Object;
    invoke-virtual {v2}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v6

    .line 878
    .local v6, "size$iv$iv":I
    :goto_0
    if-ge v4, v6, :cond_2

    .line 879
    aget-object v7, v5, v4

    check-cast v7, Landroidx/compose/ui/node/LayoutNode;

    .local v7, "it":Landroidx/compose/ui/node/LayoutNode;
    const/4 v8, 0x0

    .line 476
    .local v8, "$i$a$-forEachChild-MeasureAndLayoutDelegate$ensureSubtreeLookaheadReplaced$1":I
    invoke-virtual {v7}, Landroidx/compose/ui/node/LayoutNode;->isPlacedInLookahead()Ljava/lang/Boolean;

    move-result-object v9

    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-static {v9, v11}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-virtual {v7}, Landroidx/compose/ui/node/LayoutNode;->isDeactivated()Z

    move-result v9

    if-nez v9, :cond_1

    .line 477
    iget-object v9, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v9, v7, v10}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->contains(Landroidx/compose/ui/node/LayoutNode;Z)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 479
    invoke-virtual {v7}, Landroidx/compose/ui/node/LayoutNode;->lookaheadReplace$ui_release()V

    .line 481
    :cond_0
    invoke-direct {p0, v7}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->ensureSubtreeLookaheadReplaced(Landroidx/compose/ui/node/LayoutNode;)V

    .line 483
    :cond_1
    nop

    .line 879
    .end local v7    # "it":Landroidx/compose/ui/node/LayoutNode;
    .end local v8    # "$i$a$-forEachChild-MeasureAndLayoutDelegate$ensureSubtreeLookaheadReplaced$1":I
    nop

    .line 880
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 882
    :cond_2
    nop

    .line 873
    .end local v2    # "this_$iv$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v3    # "$i$f$forEach":I
    .end local v4    # "i$iv$iv":I
    .end local v5    # "content$iv$iv":[Ljava/lang/Object;
    .end local v6    # "size$iv$iv":I
    nop

    .line 484
    .end local v0    # "this_$iv":Landroidx/compose/ui/node/LayoutNode;
    .end local v1    # "$i$f$forEachChild":I
    return-void
.end method

.method private final forceMeasureTheSubtreeInternal(Landroidx/compose/ui/node/LayoutNode;Z)V
    .locals 11
    .param p1, "layoutNode"    # Landroidx/compose/ui/node/LayoutNode;
    .param p2, "affectsLookahead"    # Z

    .line 672
    move-object v0, p1

    .local v0, "this_$iv":Landroidx/compose/ui/node/LayoutNode;
    const/4 v1, 0x0

    .line 929
    .local v1, "$i$f$forEachChild":I
    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->get_children$ui_release()Landroidx/compose/runtime/collection/MutableVector;

    move-result-object v2

    .local v2, "this_$iv$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v3, 0x0

    .line 930
    .local v3, "$i$f$forEach":I
    nop

    .line 931
    const/4 v4, 0x0

    .line 932
    .local v4, "i$iv$iv":I
    iget-object v5, v2, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    .line 933
    .local v5, "content$iv$iv":[Ljava/lang/Object;
    invoke-virtual {v2}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v6

    .line 934
    .local v6, "size$iv$iv":I
    :goto_0
    if-ge v4, v6, :cond_5

    .line 935
    aget-object v7, v5, v4

    check-cast v7, Landroidx/compose/ui/node/LayoutNode;

    .local v7, "child":Landroidx/compose/ui/node/LayoutNode;
    const/4 v8, 0x0

    .line 674
    .local v8, "$i$a$-forEachChild-MeasureAndLayoutDelegate$forceMeasureTheSubtreeInternal$1":I
    nop

    .line 675
    if-nez p2, :cond_0

    invoke-direct {p0, v7}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->getMeasureAffectsParent(Landroidx/compose/ui/node/LayoutNode;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 676
    :cond_0
    if-eqz p2, :cond_4

    invoke-direct {p0, v7}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->getMeasureAffectsParentLookahead(Landroidx/compose/ui/node/LayoutNode;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 682
    :cond_1
    invoke-static {v7}, Landroidx/compose/ui/node/LayoutNodeLayoutDelegateKt;->isOutMostLookaheadRoot(Landroidx/compose/ui/node/LayoutNode;)Z

    move-result v9

    if-eqz v9, :cond_3

    if-nez p2, :cond_3

    .line 687
    invoke-virtual {v7}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadMeasurePending$ui_release()Z

    move-result v9

    const/4 v10, 0x1

    if-eqz v9, :cond_2

    iget-object v9, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v9, v7, v10}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->contains(Landroidx/compose/ui/node/LayoutNode;Z)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 688
    const/4 v9, 0x0

    invoke-direct {p0, v7, v10, v9}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->remeasureAndRelayoutIfNeeded(Landroidx/compose/ui/node/LayoutNode;ZZ)Z

    goto :goto_1

    .line 690
    :cond_2
    invoke-virtual {p0, v7, v10}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->forceMeasureTheSubtree(Landroidx/compose/ui/node/LayoutNode;Z)V

    .line 694
    :cond_3
    :goto_1
    invoke-direct {p0, v7, p2}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->onlyRemeasureIfScheduled(Landroidx/compose/ui/node/LayoutNode;Z)V

    .line 699
    invoke-direct {p0, v7, p2}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->measurePending(Landroidx/compose/ui/node/LayoutNode;Z)Z

    move-result v9

    if-nez v9, :cond_4

    .line 701
    invoke-direct {p0, v7, p2}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->forceMeasureTheSubtreeInternal(Landroidx/compose/ui/node/LayoutNode;Z)V

    .line 704
    :cond_4
    nop

    .line 935
    .end local v7    # "child":Landroidx/compose/ui/node/LayoutNode;
    .end local v8    # "$i$a$-forEachChild-MeasureAndLayoutDelegate$forceMeasureTheSubtreeInternal$1":I
    nop

    .line 936
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 938
    :cond_5
    nop

    .line 929
    .end local v2    # "this_$iv$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v3    # "$i$f$forEach":I
    .end local v4    # "i$iv$iv":I
    .end local v5    # "content$iv$iv":[Ljava/lang/Object;
    .end local v6    # "size$iv$iv":I
    nop

    .line 709
    .end local v0    # "this_$iv":Landroidx/compose/ui/node/LayoutNode;
    .end local v1    # "$i$f$forEachChild":I
    invoke-direct {p0, p1, p2}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->onlyRemeasureIfScheduled(Landroidx/compose/ui/node/LayoutNode;Z)V

    .line 710
    return-void
.end method

.method private final getCanAffectParent(Landroidx/compose/ui/node/LayoutNode;)Z
    .locals 1
    .param p1, "$this$canAffectParent"    # Landroidx/compose/ui/node/LayoutNode;

    .line 741
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getMeasurePending$ui_release()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->getMeasureAffectsParent(Landroidx/compose/ui/node/LayoutNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private final getCanAffectParentInLookahead(Landroidx/compose/ui/node/LayoutNode;)Z
    .locals 1
    .param p1, "$this$canAffectParentInLookahead"    # Landroidx/compose/ui/node/LayoutNode;

    .line 744
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadMeasurePending$ui_release()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->getMeasureAffectsParentLookahead(Landroidx/compose/ui/node/LayoutNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private final getMeasureAffectsParent(Landroidx/compose/ui/node/LayoutNode;)Z
    .locals 2
    .param p1, "$this$measureAffectsParent"    # Landroidx/compose/ui/node/LayoutNode;

    .line 737
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getMeasuredByParent$ui_release()Landroidx/compose/ui/node/LayoutNode$UsageByParent;

    move-result-object v0

    sget-object v1, Landroidx/compose/ui/node/LayoutNode$UsageByParent;->InMeasureBlock:Landroidx/compose/ui/node/LayoutNode$UsageByParent;

    if-eq v0, v1, :cond_1

    .line 738
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLayoutDelegate$ui_release()Landroidx/compose/ui/node/LayoutNodeLayoutDelegate;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNodeLayoutDelegate;->getAlignmentLinesOwner$ui_release()Landroidx/compose/ui/node/AlignmentLinesOwner;

    move-result-object v0

    invoke-interface {v0}, Landroidx/compose/ui/node/AlignmentLinesOwner;->getAlignmentLines()Landroidx/compose/ui/node/AlignmentLines;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/compose/ui/node/AlignmentLines;->getRequired$ui_release()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private final getMeasureAffectsParentLookahead(Landroidx/compose/ui/node/LayoutNode;)Z
    .locals 3
    .param p1, "$this$measureAffectsParentLookahead"    # Landroidx/compose/ui/node/LayoutNode;

    .line 748
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getMeasuredByParentInLookahead$ui_release()Landroidx/compose/ui/node/LayoutNode$UsageByParent;

    move-result-object v0

    sget-object v1, Landroidx/compose/ui/node/LayoutNode$UsageByParent;->InMeasureBlock:Landroidx/compose/ui/node/LayoutNode$UsageByParent;

    const/4 v2, 0x1

    if-eq v0, v1, :cond_2

    .line 749
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLayoutDelegate$ui_release()Landroidx/compose/ui/node/LayoutNodeLayoutDelegate;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNodeLayoutDelegate;->getLookaheadAlignmentLinesOwner$ui_release()Landroidx/compose/ui/node/AlignmentLinesOwner;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroidx/compose/ui/node/AlignmentLinesOwner;->getAlignmentLines()Landroidx/compose/ui/node/AlignmentLines;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/compose/ui/node/AlignmentLines;->getRequired$ui_release()Z

    move-result v0

    if-ne v0, v2, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    move v2, v1

    goto :goto_2

    :cond_2
    :goto_1
    nop

    :goto_2
    return v2
.end method

.method public static synthetic measureAndLayout$default(Landroidx/compose/ui/node/MeasureAndLayoutDelegate;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)Z
    .locals 0

    .line 382
    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    :cond_0
    invoke-virtual {p0, p1}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->measureAndLayout(Lkotlin/jvm/functions/Function0;)Z

    move-result p0

    return p0
.end method

.method private final measurePending(Landroidx/compose/ui/node/LayoutNode;Z)Z
    .locals 1
    .param p1, "$this$measurePending"    # Landroidx/compose/ui/node/LayoutNode;
    .param p2, "affectsLookahead"    # Z

    .line 752
    if-eqz p2, :cond_0

    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadMeasurePending$ui_release()Z

    move-result v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getMeasurePending$ui_release()Z

    move-result v0

    :goto_0
    return v0
.end method

.method private final onlyRemeasureIfScheduled(Landroidx/compose/ui/node/LayoutNode;Z)V
    .locals 1
    .param p1, "node"    # Landroidx/compose/ui/node/LayoutNode;
    .param p2, "affectsLookahead"    # Z

    .line 660
    nop

    .line 661
    invoke-direct {p0, p1, p2}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->measurePending(Landroidx/compose/ui/node/LayoutNode;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v0, p1, p2}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->contains(Landroidx/compose/ui/node/LayoutNode;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 667
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->remeasureAndRelayoutIfNeeded(Landroidx/compose/ui/node/LayoutNode;ZZ)Z

    .line 669
    :cond_0
    return-void
.end method

.method private final performMeasureAndLayout(ZLkotlin/jvm/functions/Function0;)V
    .locals 5
    .param p1, "fullPass"    # Z
    .param p2, "block"    # Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 487
    .local v0, "$i$f$performMeasureAndLayout":I
    iget-object v1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-virtual {v1}, Landroidx/compose/ui/node/LayoutNode;->isAttached()Z

    move-result v1

    .local v1, "value$iv":Z
    const/4 v2, 0x0

    .line 883
    .local v2, "$i$f$requirePrecondition":I
    nop

    .line 884
    if-nez v1, :cond_0

    .line 885
    const/4 v3, 0x0

    .line 488
    .local v3, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$1":I
    nop

    .line 885
    .end local v3    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$1":I
    const-string/jumbo v3, "performMeasureAndLayout called with unattached root"

    invoke-static {v3}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 887
    :cond_0
    nop

    .line 490
    .end local v1    # "value$iv":Z
    .end local v2    # "$i$f$requirePrecondition":I
    iget-object v1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-virtual {v1}, Landroidx/compose/ui/node/LayoutNode;->isPlaced()Z

    move-result v1

    .restart local v1    # "value$iv":Z
    const/4 v2, 0x0

    .line 888
    .restart local v2    # "$i$f$requirePrecondition":I
    nop

    .line 889
    if-nez v1, :cond_1

    .line 890
    const/4 v3, 0x0

    .line 490
    .local v3, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$2":I
    nop

    .line 890
    .end local v3    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$2":I
    const-string/jumbo v3, "performMeasureAndLayout called with unplaced root"

    invoke-static {v3}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 892
    :cond_1
    nop

    .line 491
    .end local v1    # "value$iv":Z
    .end local v2    # "$i$f$requirePrecondition":I
    iget-boolean v1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    .restart local v1    # "value$iv":Z
    const/4 v3, 0x0

    .line 893
    .local v3, "$i$f$requirePrecondition":I
    nop

    .line 894
    if-nez v1, :cond_2

    .line 895
    const/4 v4, 0x0

    .line 492
    .local v4, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$3":I
    nop

    .line 895
    .end local v4    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$3":I
    const-string/jumbo v4, "performMeasureAndLayout called during measure layout"

    invoke-static {v4}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 897
    :cond_2
    nop

    .line 495
    .end local v1    # "value$iv":Z
    .end local v3    # "$i$f$requirePrecondition":I
    iget-object v1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->rootConstraints:Landroidx/compose/ui/unit/Constraints;

    if-eqz v1, :cond_3

    .line 496
    iput-boolean v2, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    .line 497
    iput-boolean p1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    .line 498
    nop

    .line 499
    const/4 v1, 0x0

    :try_start_0
    invoke-interface {p2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 501
    iput-boolean v1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    .line 502
    iput-boolean v1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    .line 503
    nop

    .line 504
    iget-object v1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->consistencyChecker:Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;->assertConsistent()V

    goto :goto_0

    .line 501
    :catchall_0
    move-exception v2

    iput-boolean v1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    .line 502
    iput-boolean v1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    throw v2

    .line 506
    :cond_3
    :goto_0
    return-void
.end method

.method private final remeasureAndRelayoutIfNeeded(Landroidx/compose/ui/node/LayoutNode;ZZ)Z
    .locals 5
    .param p1, "layoutNode"    # Landroidx/compose/ui/node/LayoutNode;
    .param p2, "affectsLookahead"    # Z
    .param p3, "relayoutNeeded"    # Z

    .line 537
    const/4 v0, 0x0

    .line 538
    .local v0, "sizeChanged":Z
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isDeactivated()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 540
    return v2

    .line 542
    :cond_0
    nop

    .line 543
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isPlaced()Z

    move-result v1

    const/4 v3, 0x1

    if-nez v1, :cond_1

    .line 544
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isPlacedByParent()Z

    move-result v1

    if-nez v1, :cond_1

    .line 545
    invoke-direct {p0, p1}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->getCanAffectParent(Landroidx/compose/ui/node/LayoutNode;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 546
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isPlacedInLookahead()Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 547
    invoke-direct {p0, p1}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->getCanAffectParentInLookahead(Landroidx/compose/ui/node/LayoutNode;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 548
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getAlignmentLinesRequired$ui_release()Z

    move-result v1

    if-eqz v1, :cond_c

    .line 550
    :cond_1
    iget-object v1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    if-ne p1, v1, :cond_2

    iget-object v1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->rootConstraints:Landroidx/compose/ui/unit/Constraints;

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    .line 551
    .local v1, "constraints":Landroidx/compose/ui/unit/Constraints;
    :goto_0
    if-eqz p2, :cond_5

    .line 553
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadMeasurePending$ui_release()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 554
    invoke-direct {p0, p1, v1}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->doLookaheadRemeasure-sdFAvZA(Landroidx/compose/ui/node/LayoutNode;Landroidx/compose/ui/unit/Constraints;)Z

    move-result v0

    .line 556
    :cond_3
    if-eqz p3, :cond_b

    .line 557
    nop

    .line 558
    if-nez v0, :cond_4

    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadLayoutPending$ui_release()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 559
    :cond_4
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isPlacedInLookahead()Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 561
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->lookaheadReplace$ui_release()V

    goto :goto_5

    .line 565
    :cond_5
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getMeasurePending$ui_release()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 566
    invoke-direct {p0, p1, v1}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->doRemeasure-sdFAvZA(Landroidx/compose/ui/node/LayoutNode;Landroidx/compose/ui/unit/Constraints;)Z

    move-result v0

    .line 568
    :cond_6
    if-eqz p3, :cond_b

    .line 569
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLayoutPending$ui_release()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 571
    iget-object v4, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    if-eq p1, v4, :cond_9

    .line 572
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getParent$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v4

    if-eqz v4, :cond_7

    invoke-virtual {v4}, Landroidx/compose/ui/node/LayoutNode;->isPlaced()Z

    move-result v4

    if-ne v4, v3, :cond_7

    move v4, v3

    goto :goto_1

    :cond_7
    move v4, v2

    :goto_1
    if-eqz v4, :cond_8

    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isPlacedByParent()Z

    move-result v4

    if-eqz v4, :cond_8

    goto :goto_2

    :cond_8
    move v3, v2

    goto :goto_3

    :cond_9
    :goto_2
    nop

    .line 570
    :goto_3
    nop

    .line 573
    .local v3, "isPlacedByPlacedParent":Z
    if-eqz v3, :cond_b

    .line 574
    iget-object v4, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    if-ne p1, v4, :cond_a

    .line 575
    invoke-virtual {p1, v2, v2}, Landroidx/compose/ui/node/LayoutNode;->place$ui_release(II)V

    goto :goto_4

    .line 577
    :cond_a
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->replace$ui_release()V

    .line 579
    :goto_4
    iget-object v2, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->onPositionedDispatcher:Landroidx/compose/ui/node/OnPositionedDispatcher;

    invoke-virtual {v2, p1}, Landroidx/compose/ui/node/OnPositionedDispatcher;->onNodePositioned(Landroidx/compose/ui/node/LayoutNode;)V

    .line 585
    invoke-static {p1}, Landroidx/compose/ui/node/LayoutNodeKt;->requireOwner(Landroidx/compose/ui/node/LayoutNode;)Landroidx/compose/ui/node/Owner;

    move-result-object v2

    invoke-interface {v2}, Landroidx/compose/ui/node/Owner;->getRectManager()Landroidx/compose/ui/spatial/RectManager;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroidx/compose/ui/spatial/RectManager;->invalidateCallbacksFor(Landroidx/compose/ui/node/LayoutNode;)V

    .line 586
    iget-object v2, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->consistencyChecker:Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;

    if-eqz v2, :cond_b

    invoke-virtual {v2}, Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;->assertConsistent()V

    .line 591
    .end local v3    # "isPlacedByPlacedParent":Z
    :cond_b
    :goto_5
    invoke-direct {p0}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->drainPostponedMeasureRequests()V

    .line 593
    .end local v1    # "constraints":Landroidx/compose/ui/unit/Constraints;
    :cond_c
    return v0
.end method

.method static synthetic remeasureAndRelayoutIfNeeded$default(Landroidx/compose/ui/node/MeasureAndLayoutDelegate;Landroidx/compose/ui/node/LayoutNode;ZZILjava/lang/Object;)Z
    .locals 1

    .line 532
    and-int/lit8 p5, p4, 0x2

    const/4 v0, 0x1

    if-eqz p5, :cond_0

    .line 534
    move p2, v0

    .line 532
    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    .line 535
    move p3, v0

    .line 532
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->remeasureAndRelayoutIfNeeded(Landroidx/compose/ui/node/LayoutNode;ZZ)Z

    move-result p0

    return p0
.end method

.method private final remeasureLookaheadRootsInSubtree(Landroidx/compose/ui/node/LayoutNode;)V
    .locals 10
    .param p1, "layoutNode"    # Landroidx/compose/ui/node/LayoutNode;

    .line 425
    move-object v0, p1

    .local v0, "this_$iv":Landroidx/compose/ui/node/LayoutNode;
    const/4 v1, 0x0

    .line 830
    .local v1, "$i$f$forEachChild":I
    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->get_children$ui_release()Landroidx/compose/runtime/collection/MutableVector;

    move-result-object v2

    .local v2, "this_$iv$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v3, 0x0

    .line 831
    .local v3, "$i$f$forEach":I
    nop

    .line 832
    const/4 v4, 0x0

    .line 833
    .local v4, "i$iv$iv":I
    iget-object v5, v2, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    .line 834
    .local v5, "content$iv$iv":[Ljava/lang/Object;
    invoke-virtual {v2}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v6

    .line 835
    .local v6, "size$iv$iv":I
    :goto_0
    if-ge v4, v6, :cond_2

    .line 836
    aget-object v7, v5, v4

    check-cast v7, Landroidx/compose/ui/node/LayoutNode;

    .local v7, "it":Landroidx/compose/ui/node/LayoutNode;
    const/4 v8, 0x0

    .line 426
    .local v8, "$i$a$-forEachChild-MeasureAndLayoutDelegate$remeasureLookaheadRootsInSubtree$1":I
    invoke-direct {p0, v7}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->getMeasureAffectsParent(Landroidx/compose/ui/node/LayoutNode;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 427
    invoke-static {v7}, Landroidx/compose/ui/node/LayoutNodeLayoutDelegateKt;->isOutMostLookaheadRoot(Landroidx/compose/ui/node/LayoutNode;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 430
    const/4 v9, 0x1

    invoke-direct {p0, v7, v9}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->remeasureOnly(Landroidx/compose/ui/node/LayoutNode;Z)V

    goto :goto_1

    .line 433
    :cond_0
    invoke-direct {p0, v7}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->remeasureLookaheadRootsInSubtree(Landroidx/compose/ui/node/LayoutNode;)V

    .line 436
    :cond_1
    :goto_1
    nop

    .line 836
    .end local v7    # "it":Landroidx/compose/ui/node/LayoutNode;
    .end local v8    # "$i$a$-forEachChild-MeasureAndLayoutDelegate$remeasureLookaheadRootsInSubtree$1":I
    nop

    .line 837
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 839
    :cond_2
    nop

    .line 830
    .end local v2    # "this_$iv$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v3    # "$i$f$forEach":I
    .end local v4    # "i$iv$iv":I
    .end local v5    # "content$iv$iv":[Ljava/lang/Object;
    .end local v6    # "size$iv$iv":I
    nop

    .line 437
    .end local v0    # "this_$iv":Landroidx/compose/ui/node/LayoutNode;
    .end local v1    # "$i$f$forEachChild":I
    return-void
.end method

.method private final remeasureOnly(Landroidx/compose/ui/node/LayoutNode;Z)V
    .locals 1
    .param p1, "layoutNode"    # Landroidx/compose/ui/node/LayoutNode;
    .param p2, "affectsLookahead"    # Z

    .line 622
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isDeactivated()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 623
    return-void

    .line 625
    :cond_0
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    if-ne p1, v0, :cond_1

    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->rootConstraints:Landroidx/compose/ui/unit/Constraints;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 626
    .local v0, "constraints":Landroidx/compose/ui/unit/Constraints;
    :goto_0
    if-eqz p2, :cond_2

    .line 627
    invoke-direct {p0, p1, v0}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->doLookaheadRemeasure-sdFAvZA(Landroidx/compose/ui/node/LayoutNode;Landroidx/compose/ui/unit/Constraints;)Z

    goto :goto_1

    .line 629
    :cond_2
    invoke-direct {p0, p1, v0}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->doRemeasure-sdFAvZA(Landroidx/compose/ui/node/LayoutNode;Landroidx/compose/ui/unit/Constraints;)Z

    .line 631
    :goto_1
    return-void
.end method

.method public static synthetic requestLookaheadRelayout$default(Landroidx/compose/ui/node/MeasureAndLayoutDelegate;Landroidx/compose/ui/node/LayoutNode;ZILjava/lang/Object;)Z
    .locals 0

    .line 233
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    :cond_0
    invoke-virtual {p0, p1, p2}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->requestLookaheadRelayout(Landroidx/compose/ui/node/LayoutNode;Z)Z

    move-result p0

    return p0
.end method

.method public static synthetic requestLookaheadRemeasure$default(Landroidx/compose/ui/node/MeasureAndLayoutDelegate;Landroidx/compose/ui/node/LayoutNode;ZILjava/lang/Object;)Z
    .locals 0

    .line 126
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    :cond_0
    invoke-virtual {p0, p1, p2}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->requestLookaheadRemeasure(Landroidx/compose/ui/node/LayoutNode;Z)Z

    move-result p0

    return p0
.end method

.method public static synthetic requestRelayout$default(Landroidx/compose/ui/node/MeasureAndLayoutDelegate;Landroidx/compose/ui/node/LayoutNode;ZILjava/lang/Object;)Z
    .locals 0

    .line 291
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    :cond_0
    invoke-virtual {p0, p1, p2}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->requestRelayout(Landroidx/compose/ui/node/LayoutNode;Z)Z

    move-result p0

    return p0
.end method

.method public static synthetic requestRemeasure$default(Landroidx/compose/ui/node/MeasureAndLayoutDelegate;Landroidx/compose/ui/node/LayoutNode;ZILjava/lang/Object;)Z
    .locals 0

    .line 184
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    :cond_0
    invoke-virtual {p0, p1, p2}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->requestRemeasure(Landroidx/compose/ui/node/LayoutNode;Z)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final dispatchOnPositionedCallbacks(Z)V
    .locals 2
    .param p1, "forceDispatch"    # Z

    .line 720
    if-eqz p1, :cond_0

    .line 721
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->onPositionedDispatcher:Landroidx/compose/ui/node/OnPositionedDispatcher;

    iget-object v1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-virtual {v0, v1}, Landroidx/compose/ui/node/OnPositionedDispatcher;->onRootNodePositioned(Landroidx/compose/ui/node/LayoutNode;)V

    .line 723
    :cond_0
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->onPositionedDispatcher:Landroidx/compose/ui/node/OnPositionedDispatcher;

    invoke-virtual {v0}, Landroidx/compose/ui/node/OnPositionedDispatcher;->dispatch()V

    .line 724
    return-void
.end method

.method public final forceMeasureTheSubtree(Landroidx/compose/ui/node/LayoutNode;Z)V
    .locals 3
    .param p1, "layoutNode"    # Landroidx/compose/ui/node/LayoutNode;
    .param p2, "affectsLookahead"    # Z

    .line 642
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v0, p2}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->isEmpty(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 643
    return-void

    .line 647
    :cond_0
    iget-boolean v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    .local v0, "value$iv":Z
    const/4 v1, 0x0

    .line 919
    .local v1, "$i$f$checkPrecondition":I
    nop

    .line 920
    if-nez v0, :cond_1

    .line 921
    const/4 v2, 0x0

    .line 648
    .local v2, "$i$a$-checkPrecondition-MeasureAndLayoutDelegate$forceMeasureTheSubtree$1":I
    nop

    .line 921
    .end local v2    # "$i$a$-checkPrecondition-MeasureAndLayoutDelegate$forceMeasureTheSubtree$1":I
    const-string v2, "forceMeasureTheSubtree should be executed during the measureAndLayout pass"

    invoke-static {v2}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalStateException(Ljava/lang/String;)V

    .line 923
    :cond_1
    nop

    .line 652
    .end local v0    # "value$iv":Z
    .end local v1    # "$i$f$checkPrecondition":I
    invoke-direct {p0, p1, p2}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->measurePending(Landroidx/compose/ui/node/LayoutNode;Z)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .restart local v0    # "value$iv":Z
    const/4 v1, 0x0

    .line 924
    .local v1, "$i$f$requirePrecondition":I
    nop

    .line 925
    if-nez v0, :cond_2

    .line 926
    const/4 v2, 0x0

    .line 653
    .local v2, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$forceMeasureTheSubtree$2":I
    nop

    .line 926
    .end local v2    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$forceMeasureTheSubtree$2":I
    const-string/jumbo v2, "node not yet measured"

    invoke-static {v2}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 928
    :cond_2
    nop

    .line 656
    .end local v0    # "value$iv":Z
    .end local v1    # "$i$f$requirePrecondition":I
    invoke-direct {p0, p1, p2}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->forceMeasureTheSubtreeInternal(Landroidx/compose/ui/node/LayoutNode;Z)V

    .line 657
    return-void
.end method

.method public final getDuringMeasureLayout$ui_release()Z
    .locals 1

    .line 54
    iget-boolean v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    return v0
.end method

.method public final getHasPendingMeasureOrLayout()Z
    .locals 1

    .line 47
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v0}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->isNotEmpty()Z

    move-result v0

    return v0
.end method

.method public final getHasPendingOnPositionedCallbacks()Z
    .locals 1

    .line 51
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->onPositionedDispatcher:Landroidx/compose/ui/node/OnPositionedDispatcher;

    invoke-virtual {v0}, Landroidx/compose/ui/node/OnPositionedDispatcher;->isNotEmpty()Z

    move-result v0

    return v0
.end method

.method public final getMeasureIteration()J
    .locals 3

    .line 73
    iget-boolean v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    .local v0, "value$iv":Z
    const/4 v1, 0x0

    .line 763
    .local v1, "$i$f$requirePrecondition":I
    nop

    .line 764
    if-nez v0, :cond_0

    .line 765
    const/4 v2, 0x0

    .line 74
    .local v2, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$measureIteration$1":I
    nop

    .line 765
    .end local v2    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$measureIteration$1":I
    const-string/jumbo v2, "measureIteration should be only used during the measure/layout pass"

    invoke-static {v2}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 767
    :cond_0
    nop

    .line 76
    .end local v0    # "value$iv":Z
    .end local v1    # "$i$f$requirePrecondition":I
    iget-wide v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->measureIteration:J

    return-wide v0
.end method

.method public final measureAndLayout(Lkotlin/jvm/functions/Function0;)Z
    .locals 18
    .param p1, "onLayout"    # Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)Z"
        }
    .end annotation

    .line 383
    move-object/from16 v1, p0

    const/4 v2, 0x0

    .line 384
    .local v2, "rootNodeResized":Z
    const/4 v7, 0x1

    .local v7, "fullPass$iv":Z
    move-object/from16 v8, p0

    .local v8, "this_$iv":Landroidx/compose/ui/node/MeasureAndLayoutDelegate;
    const/4 v9, 0x0

    .line 778
    .local v9, "$i$f$performMeasureAndLayout":I
    iget-object v0, v8, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->isAttached()Z

    move-result v0

    .local v0, "value$iv$iv":Z
    const/4 v3, 0x0

    .line 779
    .local v3, "$i$f$requirePrecondition":I
    nop

    .line 780
    if-nez v0, :cond_0

    .line 781
    const/4 v4, 0x0

    .line 782
    .local v4, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$1$iv":I
    nop

    .line 781
    .end local v4    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$1$iv":I
    const-string/jumbo v4, "performMeasureAndLayout called with unattached root"

    invoke-static {v4}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 783
    :cond_0
    nop

    .line 784
    .end local v0    # "value$iv$iv":Z
    .end local v3    # "$i$f$requirePrecondition":I
    iget-object v0, v8, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->isPlaced()Z

    move-result v0

    .restart local v0    # "value$iv$iv":Z
    const/4 v3, 0x0

    .line 779
    .restart local v3    # "$i$f$requirePrecondition":I
    nop

    .line 780
    if-nez v0, :cond_1

    .line 781
    const/4 v4, 0x0

    .line 784
    .local v4, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$2$iv":I
    nop

    .line 781
    .end local v4    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$2$iv":I
    const-string/jumbo v4, "performMeasureAndLayout called with unplaced root"

    invoke-static {v4}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 783
    :cond_1
    nop

    .line 785
    .end local v0    # "value$iv$iv":Z
    .end local v3    # "$i$f$requirePrecondition":I
    iget-boolean v0, v8, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    const/4 v10, 0x1

    xor-int/2addr v0, v10

    .restart local v0    # "value$iv$iv":Z
    const/4 v3, 0x0

    .line 779
    .restart local v3    # "$i$f$requirePrecondition":I
    nop

    .line 780
    if-nez v0, :cond_2

    .line 781
    const/4 v4, 0x0

    .line 786
    .local v4, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$3$iv":I
    nop

    .line 781
    .end local v4    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$3$iv":I
    const-string/jumbo v4, "performMeasureAndLayout called during measure layout"

    invoke-static {v4}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 783
    :cond_2
    nop

    .line 789
    .end local v0    # "value$iv$iv":Z
    .end local v3    # "$i$f$requirePrecondition":I
    iget-object v0, v8, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->rootConstraints:Landroidx/compose/ui/unit/Constraints;

    if-eqz v0, :cond_8

    .line 790
    iput-boolean v10, v8, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    .line 791
    iput-boolean v7, v8, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    .line 792
    nop

    .line 793
    const/4 v0, 0x0

    .line 385
    .local v0, "$i$a$-performMeasureAndLayout-MeasureAndLayoutDelegate$measureAndLayout$1":I
    const/4 v11, 0x0

    :try_start_0
    iget-object v3, v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v3}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->isNotEmpty()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 386
    iget-object v3, v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-object v12, v3

    .local v12, "this_$iv":Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;
    const/4 v3, 0x0

    move v13, v3

    move v14, v2

    .line 794
    .end local v2    # "rootNodeResized":Z
    .local v13, "$i$f$popEach":I
    .local v14, "rootNodeResized":Z
    :goto_0
    :try_start_1
    invoke-virtual {v12}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->isNotEmpty()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 795
    invoke-static {v12}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->access$getLookaheadSet$p(Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;)Landroidx/compose/ui/node/DepthSortedSet;

    move-result-object v2

    .local v2, "this_$iv$iv":Landroidx/compose/ui/node/DepthSortedSet;
    const/4 v3, 0x0

    .line 796
    .local v3, "$i$f$isNotEmpty":I
    invoke-virtual {v2}, Landroidx/compose/ui/node/DepthSortedSet;->isEmpty()Z

    move-result v4

    .line 795
    .end local v2    # "this_$iv$iv":Landroidx/compose/ui/node/DepthSortedSet;
    .end local v3    # "$i$f$isNotEmpty":I
    xor-int/lit8 v2, v4, 0x1

    move v15, v2

    .line 797
    .local v15, "affectsLookahead$iv":Z
    if-eqz v15, :cond_3

    invoke-static {v12}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->access$getLookaheadSet$p(Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;)Landroidx/compose/ui/node/DepthSortedSet;

    move-result-object v2

    goto :goto_1

    :cond_3
    invoke-static {v12}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->access$getSet$p(Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;)Landroidx/compose/ui/node/DepthSortedSet;

    move-result-object v2

    :goto_1
    invoke-virtual {v2}, Landroidx/compose/ui/node/DepthSortedSet;->pop()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v2

    move-object/from16 v16, v2

    .line 798
    .local v16, "node$iv":Landroidx/compose/ui/node/LayoutNode;
    nop

    .local v2, "layoutNode":Landroidx/compose/ui/node/LayoutNode;
    move v3, v15

    .local v3, "affectsLookahead":Z
    const/16 v17, 0x0

    .line 387
    .local v17, "$i$a$-popEach-MeasureAndLayoutDelegate$measureAndLayout$1$1":I
    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->remeasureAndRelayoutIfNeeded$default(Landroidx/compose/ui/node/MeasureAndLayoutDelegate;Landroidx/compose/ui/node/LayoutNode;ZZILjava/lang/Object;)Z

    move-result v4

    .line 388
    .local v4, "sizeChanged":Z
    invoke-static/range {p0 .. p0}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->access$getRoot$p(Landroidx/compose/ui/node/MeasureAndLayoutDelegate;)Landroidx/compose/ui/node/LayoutNode;

    move-result-object v1

    if-ne v2, v1, :cond_4

    if-eqz v4, :cond_4

    .line 389
    const/4 v14, 0x1

    .line 391
    :cond_4
    nop

    .line 798
    .end local v2    # "layoutNode":Landroidx/compose/ui/node/LayoutNode;
    .end local v3    # "affectsLookahead":Z
    .end local v4    # "sizeChanged":Z
    .end local v17    # "$i$a$-popEach-MeasureAndLayoutDelegate$measureAndLayout$1$1":I
    move-object/from16 v1, p0

    .end local v15    # "affectsLookahead$iv":Z
    .end local v16    # "node$iv":Landroidx/compose/ui/node/LayoutNode;
    goto :goto_0

    .line 800
    :cond_5
    nop

    .line 392
    .end local v12    # "this_$iv":Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;
    .end local v13    # "$i$f$popEach":I
    if-eqz p1, :cond_6

    invoke-interface/range {p1 .. p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 394
    :cond_6
    move v2, v14

    goto :goto_2

    .line 801
    .end local v0    # "$i$a$-performMeasureAndLayout-MeasureAndLayoutDelegate$measureAndLayout$1":I
    :catchall_0
    move-exception v0

    move v2, v14

    goto :goto_3

    .line 394
    .end local v14    # "rootNodeResized":Z
    .restart local v0    # "$i$a$-performMeasureAndLayout-MeasureAndLayoutDelegate$measureAndLayout$1":I
    .local v2, "rootNodeResized":Z
    :cond_7
    :goto_2
    nop

    .line 793
    .end local v0    # "$i$a$-performMeasureAndLayout-MeasureAndLayoutDelegate$measureAndLayout$1":I
    nop

    .line 801
    iput-boolean v11, v8, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    .line 802
    iput-boolean v11, v8, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    .line 803
    nop

    .line 804
    iget-object v0, v8, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->consistencyChecker:Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;

    if-eqz v0, :cond_8

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;->assertConsistent()V

    goto :goto_4

    .line 801
    :catchall_1
    move-exception v0

    :goto_3
    iput-boolean v11, v8, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    .line 802
    iput-boolean v11, v8, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    throw v0

    .line 806
    :cond_8
    :goto_4
    nop

    .line 395
    .end local v7    # "fullPass$iv":Z
    .end local v8    # "this_$iv":Landroidx/compose/ui/node/MeasureAndLayoutDelegate;
    .end local v9    # "$i$f$performMeasureAndLayout":I
    invoke-direct/range {p0 .. p0}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->callOnLayoutCompletedListeners()V

    .line 396
    return v2
.end method

.method public final measureAndLayout-0kLqBqw(Landroidx/compose/ui/node/LayoutNode;J)V
    .locals 8
    .param p1, "layoutNode"    # Landroidx/compose/ui/node/LayoutNode;
    .param p2, "constraints"    # J

    .line 440
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isDeactivated()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 443
    return-void

    .line 445
    :cond_0
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    .local v0, "value$iv":Z
    const/4 v2, 0x0

    .line 840
    .local v2, "$i$f$requirePrecondition":I
    nop

    .line 841
    if-nez v0, :cond_1

    .line 842
    const/4 v3, 0x0

    .line 445
    .local v3, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$measureAndLayout$2":I
    nop

    .line 842
    .end local v3    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$measureAndLayout$2":I
    const-string/jumbo v3, "measureAndLayout called on root"

    invoke-static {v3}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 844
    :cond_1
    nop

    .line 446
    .end local v0    # "value$iv":Z
    .end local v2    # "$i$f$requirePrecondition":I
    const/4 v0, 0x0

    .local v0, "fullPass$iv":Z
    move-object v2, p0

    .local v2, "this_$iv":Landroidx/compose/ui/node/MeasureAndLayoutDelegate;
    const/4 v3, 0x0

    .line 845
    .local v3, "$i$f$performMeasureAndLayout":I
    iget-object v4, v2, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-virtual {v4}, Landroidx/compose/ui/node/LayoutNode;->isAttached()Z

    move-result v4

    .local v4, "value$iv$iv":Z
    const/4 v5, 0x0

    .line 846
    .local v5, "$i$f$requirePrecondition":I
    nop

    .line 847
    if-nez v4, :cond_2

    .line 848
    const/4 v6, 0x0

    .line 849
    .local v6, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$1$iv":I
    nop

    .line 848
    .end local v6    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$1$iv":I
    const-string/jumbo v6, "performMeasureAndLayout called with unattached root"

    invoke-static {v6}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 850
    :cond_2
    nop

    .line 851
    .end local v4    # "value$iv$iv":Z
    .end local v5    # "$i$f$requirePrecondition":I
    iget-object v4, v2, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-virtual {v4}, Landroidx/compose/ui/node/LayoutNode;->isPlaced()Z

    move-result v4

    .restart local v4    # "value$iv$iv":Z
    const/4 v5, 0x0

    .line 852
    .restart local v5    # "$i$f$requirePrecondition":I
    nop

    .line 853
    if-nez v4, :cond_3

    .line 854
    const/4 v6, 0x0

    .line 851
    .local v6, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$2$iv":I
    nop

    .line 854
    .end local v6    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$2$iv":I
    const-string/jumbo v6, "performMeasureAndLayout called with unplaced root"

    invoke-static {v6}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 856
    :cond_3
    nop

    .line 857
    .end local v4    # "value$iv$iv":Z
    .end local v5    # "$i$f$requirePrecondition":I
    iget-boolean v4, v2, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    xor-int/2addr v4, v1

    .restart local v4    # "value$iv$iv":Z
    const/4 v5, 0x0

    .line 852
    .restart local v5    # "$i$f$requirePrecondition":I
    nop

    .line 853
    if-nez v4, :cond_4

    .line 854
    const/4 v6, 0x0

    .line 858
    .local v6, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$3$iv":I
    nop

    .line 854
    .end local v6    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$3$iv":I
    const-string/jumbo v6, "performMeasureAndLayout called during measure layout"

    invoke-static {v6}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 856
    :cond_4
    nop

    .line 861
    .end local v4    # "value$iv$iv":Z
    .end local v5    # "$i$f$requirePrecondition":I
    iget-object v4, v2, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->rootConstraints:Landroidx/compose/ui/unit/Constraints;

    if-eqz v4, :cond_8

    .line 862
    iput-boolean v1, v2, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    .line 863
    iput-boolean v0, v2, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    .line 864
    nop

    .line 865
    const/4 v4, 0x0

    .line 447
    .local v4, "$i$a$-performMeasureAndLayout-MeasureAndLayoutDelegate$measureAndLayout$3":I
    const/4 v5, 0x0

    :try_start_0
    iget-object v6, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v6, p1}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->remove(Landroidx/compose/ui/node/LayoutNode;)Z

    .line 450
    invoke-static {p2, p3}, Landroidx/compose/ui/unit/Constraints;->box-impl(J)Landroidx/compose/ui/unit/Constraints;

    move-result-object v6

    invoke-direct {p0, p1, v6}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->doLookaheadRemeasure-sdFAvZA(Landroidx/compose/ui/node/LayoutNode;Landroidx/compose/ui/unit/Constraints;)Z

    move-result v6

    .line 451
    .local v6, "lookaheadSizeChanged":Z
    nop

    .line 452
    if-nez v6, :cond_5

    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadLayoutPending$ui_release()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 453
    :cond_5
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isPlacedInLookahead()Ljava/lang/Boolean;

    move-result-object v7

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v7, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 455
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->lookaheadReplace$ui_release()V

    .line 461
    :cond_6
    invoke-direct {p0, p1}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->ensureSubtreeLookaheadReplaced(Landroidx/compose/ui/node/LayoutNode;)V

    .line 463
    invoke-static {p2, p3}, Landroidx/compose/ui/unit/Constraints;->box-impl(J)Landroidx/compose/ui/unit/Constraints;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->doRemeasure-sdFAvZA(Landroidx/compose/ui/node/LayoutNode;Landroidx/compose/ui/unit/Constraints;)Z

    .line 464
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLayoutPending$ui_release()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isPlaced()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 465
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->replace$ui_release()V

    .line 466
    iget-object v1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->onPositionedDispatcher:Landroidx/compose/ui/node/OnPositionedDispatcher;

    invoke-virtual {v1, p1}, Landroidx/compose/ui/node/OnPositionedDispatcher;->onNodePositioned(Landroidx/compose/ui/node/LayoutNode;)V

    .line 469
    :cond_7
    invoke-direct {p0}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->drainPostponedMeasureRequests()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 470
    nop

    .line 865
    .end local v4    # "$i$a$-performMeasureAndLayout-MeasureAndLayoutDelegate$measureAndLayout$3":I
    .end local v6    # "lookaheadSizeChanged":Z
    nop

    .line 867
    iput-boolean v5, v2, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    .line 868
    iput-boolean v5, v2, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    .line 869
    nop

    .line 870
    iget-object v1, v2, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->consistencyChecker:Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;

    if-eqz v1, :cond_8

    invoke-virtual {v1}, Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;->assertConsistent()V

    goto :goto_0

    .line 867
    :catchall_0
    move-exception v1

    iput-boolean v5, v2, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    .line 868
    iput-boolean v5, v2, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    throw v1

    .line 872
    :cond_8
    :goto_0
    nop

    .line 471
    .end local v0    # "fullPass$iv":Z
    .end local v2    # "this_$iv":Landroidx/compose/ui/node/MeasureAndLayoutDelegate;
    .end local v3    # "$i$f$performMeasureAndLayout":I
    invoke-direct {p0}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->callOnLayoutCompletedListeners()V

    .line 472
    return-void
.end method

.method public final measureOnly()V
    .locals 8

    .line 404
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v0}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->isNotEmpty()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 405
    const/4 v0, 0x0

    .local v0, "fullPass$iv":Z
    move-object v1, p0

    .local v1, "this_$iv":Landroidx/compose/ui/node/MeasureAndLayoutDelegate;
    const/4 v2, 0x0

    .line 807
    .local v2, "$i$f$performMeasureAndLayout":I
    iget-object v3, v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-virtual {v3}, Landroidx/compose/ui/node/LayoutNode;->isAttached()Z

    move-result v3

    .local v3, "value$iv$iv":Z
    const/4 v4, 0x0

    .line 808
    .local v4, "$i$f$requirePrecondition":I
    nop

    .line 809
    if-nez v3, :cond_0

    .line 810
    const/4 v5, 0x0

    .line 811
    .local v5, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$1$iv":I
    nop

    .line 810
    .end local v5    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$1$iv":I
    const-string/jumbo v5, "performMeasureAndLayout called with unattached root"

    invoke-static {v5}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 812
    :cond_0
    nop

    .line 813
    .end local v3    # "value$iv$iv":Z
    .end local v4    # "$i$f$requirePrecondition":I
    iget-object v3, v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-virtual {v3}, Landroidx/compose/ui/node/LayoutNode;->isPlaced()Z

    move-result v3

    .restart local v3    # "value$iv$iv":Z
    const/4 v4, 0x0

    .line 808
    .restart local v4    # "$i$f$requirePrecondition":I
    nop

    .line 809
    if-nez v3, :cond_1

    .line 810
    const/4 v5, 0x0

    .line 813
    .local v5, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$2$iv":I
    nop

    .line 810
    .end local v5    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$2$iv":I
    const-string/jumbo v5, "performMeasureAndLayout called with unplaced root"

    invoke-static {v5}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 812
    :cond_1
    nop

    .line 814
    .end local v3    # "value$iv$iv":Z
    .end local v4    # "$i$f$requirePrecondition":I
    iget-boolean v3, v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    const/4 v4, 0x1

    xor-int/2addr v3, v4

    .restart local v3    # "value$iv$iv":Z
    const/4 v5, 0x0

    .line 808
    .local v5, "$i$f$requirePrecondition":I
    nop

    .line 809
    if-nez v3, :cond_2

    .line 810
    const/4 v6, 0x0

    .line 815
    .local v6, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$3$iv":I
    nop

    .line 810
    .end local v6    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$performMeasureAndLayout$3$iv":I
    const-string/jumbo v6, "performMeasureAndLayout called during measure layout"

    invoke-static {v6}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 812
    :cond_2
    nop

    .line 818
    .end local v3    # "value$iv$iv":Z
    .end local v5    # "$i$f$requirePrecondition":I
    iget-object v3, v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->rootConstraints:Landroidx/compose/ui/unit/Constraints;

    if-eqz v3, :cond_5

    .line 819
    iput-boolean v4, v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    .line 820
    iput-boolean v0, v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    .line 821
    nop

    .line 822
    const/4 v3, 0x0

    .line 406
    .local v3, "$i$a$-performMeasureAndLayout-MeasureAndLayoutDelegate$measureOnly$1":I
    const/4 v5, 0x0

    :try_start_0
    iget-object v6, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v6, v4}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->isEmpty(Z)Z

    move-result v6

    if-nez v6, :cond_4

    .line 407
    iget-object v6, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-virtual {v6}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadRoot$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 416
    iget-object v7, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    .line 407
    if-eqz v6, :cond_3

    .line 411
    :try_start_1
    invoke-direct {p0, v7, v4}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->remeasureOnly(Landroidx/compose/ui/node/LayoutNode;Z)V

    goto :goto_0

    .line 416
    :cond_3
    invoke-direct {p0, v7}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->remeasureLookaheadRootsInSubtree(Landroidx/compose/ui/node/LayoutNode;)V

    .line 419
    :cond_4
    :goto_0
    iget-object v4, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-direct {p0, v4, v5}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->remeasureOnly(Landroidx/compose/ui/node/LayoutNode;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 420
    nop

    .line 822
    .end local v3    # "$i$a$-performMeasureAndLayout-MeasureAndLayoutDelegate$measureOnly$1":I
    nop

    .line 824
    iput-boolean v5, v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    .line 825
    iput-boolean v5, v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    .line 826
    nop

    .line 827
    iget-object v3, v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->consistencyChecker:Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;

    if-eqz v3, :cond_5

    invoke-virtual {v3}, Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;->assertConsistent()V

    goto :goto_1

    .line 824
    :catchall_0
    move-exception v3

    iput-boolean v5, v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    .line 825
    iput-boolean v5, v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    throw v3

    .line 829
    :cond_5
    :goto_1
    nop

    .line 422
    .end local v0    # "fullPass$iv":Z
    .end local v1    # "this_$iv":Landroidx/compose/ui/node/MeasureAndLayoutDelegate;
    .end local v2    # "$i$f$performMeasureAndLayout":I
    :cond_6
    return-void
.end method

.method public final onNodeDetached(Landroidx/compose/ui/node/LayoutNode;)V
    .locals 1
    .param p1, "node"    # Landroidx/compose/ui/node/LayoutNode;

    .line 731
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v0, p1}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->remove(Landroidx/compose/ui/node/LayoutNode;)Z

    .line 732
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->onPositionedDispatcher:Landroidx/compose/ui/node/OnPositionedDispatcher;

    invoke-virtual {v0, p1}, Landroidx/compose/ui/node/OnPositionedDispatcher;->remove(Landroidx/compose/ui/node/LayoutNode;)V

    .line 733
    return-void
.end method

.method public final registerOnLayoutCompletedListener(Landroidx/compose/ui/node/Owner$OnLayoutCompletedListener;)V
    .locals 2
    .param p1, "listener"    # Landroidx/compose/ui/node/Owner$OnLayoutCompletedListener;

    .line 509
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->onLayoutCompletedListeners:Landroidx/compose/runtime/collection/MutableVector;

    .local v0, "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v1, 0x0

    .line 898
    .local v1, "$i$f$plusAssign":I
    invoke-virtual {v0, p1}, Landroidx/compose/runtime/collection/MutableVector;->add(Ljava/lang/Object;)Z

    .line 899
    nop

    .line 510
    .end local v0    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v1    # "$i$f$plusAssign":I
    return-void
.end method

.method public final requestLookaheadRelayout(Landroidx/compose/ui/node/LayoutNode;Z)Z
    .locals 5
    .param p1, "layoutNode"    # Landroidx/compose/ui/node/LayoutNode;
    .param p2, "forced"    # Z

    .line 234
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLayoutState$ui_release()Landroidx/compose/ui/node/LayoutNode$LayoutState;

    move-result-object v0

    sget-object v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode$LayoutState;->ordinal()I

    move-result v0

    aget v0, v1, v0

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    .line 279
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    .line 246
    :pswitch_0
    nop

    .line 247
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadMeasurePending$ui_release()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadLayoutPending$ui_release()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 248
    :cond_0
    if-nez p2, :cond_2

    .line 253
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->consistencyChecker:Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;->assertConsistent()V

    .line 254
    :cond_1
    goto/16 :goto_5

    .line 258
    :cond_2
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->markLookaheadLayoutPending$ui_release()V

    .line 259
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->markLayoutPending$ui_release()V

    .line 262
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isDeactivated()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 263
    goto/16 :goto_5

    .line 265
    :cond_3
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getParent$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v0

    .line 266
    .local v0, "parent":Landroidx/compose/ui/node/LayoutNode;
    nop

    .line 267
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isPlacedInLookahead()Ljava/lang/Boolean;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 268
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadMeasurePending$ui_release()Z

    move-result v2

    if-ne v2, v3, :cond_4

    move v2, v3

    goto :goto_0

    :cond_4
    move v2, v1

    :goto_0
    if-nez v2, :cond_6

    .line 269
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadLayoutPending$ui_release()Z

    move-result v2

    if-ne v2, v3, :cond_5

    move v2, v3

    goto :goto_1

    :cond_5
    move v2, v1

    :goto_1
    if-nez v2, :cond_6

    .line 271
    iget-object v2, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v2, p1, v3}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->add(Landroidx/compose/ui/node/LayoutNode;Z)V

    goto :goto_4

    .line 273
    :cond_6
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isPlaced()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 274
    if-eqz v0, :cond_7

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->getLayoutPending$ui_release()Z

    move-result v2

    if-ne v2, v3, :cond_7

    move v2, v3

    goto :goto_2

    :cond_7
    move v2, v1

    :goto_2
    if-nez v2, :cond_9

    .line 275
    if-eqz v0, :cond_8

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->getMeasurePending$ui_release()Z

    move-result v2

    if-ne v2, v3, :cond_8

    move v2, v3

    goto :goto_3

    :cond_8
    move v2, v1

    :goto_3
    if-nez v2, :cond_9

    .line 277
    iget-object v2, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v2, p1, v1}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->add(Landroidx/compose/ui/node/LayoutNode;Z)V

    .line 279
    :cond_9
    :goto_4
    iget-boolean v2, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    if-nez v2, :cond_a

    move v1, v3

    goto :goto_5

    .end local v0    # "parent":Landroidx/compose/ui/node/LayoutNode;
    :cond_a
    goto :goto_5

    .line 240
    :pswitch_1
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->consistencyChecker:Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;->assertConsistent()V

    .line 241
    :cond_b
    nop

    .line 283
    :goto_5
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final requestLookaheadRemeasure(Landroidx/compose/ui/node/LayoutNode;Z)Z
    .locals 5
    .param p1, "layoutNode"    # Landroidx/compose/ui/node/LayoutNode;
    .param p2, "forced"    # Z

    .line 127
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadRoot$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .local v0, "value$iv":Z
    :goto_0
    const/4 v3, 0x0

    .line 773
    .local v3, "$i$f$checkPrecondition":I
    nop

    .line 774
    if-nez v0, :cond_1

    .line 775
    const/4 v4, 0x0

    .line 128
    .local v4, "$i$a$-checkPrecondition-MeasureAndLayoutDelegate$requestLookaheadRemeasure$1":I
    nop

    .line 129
    nop

    .line 775
    .end local v4    # "$i$a$-checkPrecondition-MeasureAndLayoutDelegate$requestLookaheadRemeasure$1":I
    const-string v4, "Error: requestLookaheadRemeasure cannot be called on a node outside LookaheadScope"

    invoke-static {v4}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalStateException(Ljava/lang/String;)V

    .line 777
    :cond_1
    nop

    .line 131
    .end local v0    # "value$iv":Z
    .end local v3    # "$i$f$checkPrecondition":I
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLayoutState$ui_release()Landroidx/compose/ui/node/LayoutNode$LayoutState;

    move-result-object v0

    sget-object v3, Landroidx/compose/ui/node/MeasureAndLayoutDelegate$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode$LayoutState;->ordinal()I

    move-result v0

    aget v0, v3, v0

    packed-switch v0, :pswitch_data_0

    .line 171
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    .line 149
    :pswitch_0
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadMeasurePending$ui_release()Z

    move-result v0

    if-eqz v0, :cond_2

    if-nez p2, :cond_2

    .line 150
    move v1, v2

    goto/16 :goto_4

    .line 152
    :cond_2
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->markLookaheadMeasurePending$ui_release()V

    .line 153
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->markMeasurePending$ui_release()V

    .line 156
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isDeactivated()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 157
    move v1, v2

    goto/16 :goto_4

    .line 159
    :cond_3
    nop

    .line 160
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isPlacedInLookahead()Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 161
    invoke-direct {p0, p1}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->getCanAffectParentInLookahead(Landroidx/compose/ui/node/LayoutNode;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 162
    :cond_4
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getParent$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadMeasurePending$ui_release()Z

    move-result v0

    if-ne v0, v1, :cond_5

    move v0, v1

    goto :goto_1

    :cond_5
    move v0, v2

    :goto_1
    if-nez v0, :cond_6

    .line 164
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v0, p1, v1}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->add(Landroidx/compose/ui/node/LayoutNode;Z)V

    goto :goto_3

    .line 166
    :cond_6
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isPlaced()Z

    move-result v0

    if-nez v0, :cond_7

    invoke-direct {p0, p1}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->getCanAffectParent(Landroidx/compose/ui/node/LayoutNode;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 167
    :cond_7
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getParent$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v0

    if-eqz v0, :cond_8

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->getMeasurePending$ui_release()Z

    move-result v0

    if-ne v0, v1, :cond_8

    move v0, v1

    goto :goto_2

    :cond_8
    move v0, v2

    :goto_2
    if-nez v0, :cond_9

    .line 169
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v0, p1, v2}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->add(Landroidx/compose/ui/node/LayoutNode;Z)V

    .line 171
    :cond_9
    :goto_3
    iget-boolean v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    if-nez v0, :cond_a

    goto :goto_4

    :cond_a
    move v1, v2

    goto :goto_4

    .line 142
    :pswitch_1
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->postponedMeasureRequests:Landroidx/compose/runtime/collection/MutableVector;

    .line 143
    new-instance v3, Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;

    invoke-direct {v3, p1, v1, p2}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;-><init>(Landroidx/compose/ui/node/LayoutNode;ZZ)V

    .line 142
    invoke-virtual {v0, v3}, Landroidx/compose/runtime/collection/MutableVector;->add(Ljava/lang/Object;)Z

    .line 145
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->consistencyChecker:Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;->assertConsistent()V

    .line 146
    :cond_b
    move v1, v2

    goto :goto_4

    .line 135
    :pswitch_2
    move v1, v2

    .line 131
    :goto_4
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final requestOnPositionedCallback(Landroidx/compose/ui/node/LayoutNode;)V
    .locals 1
    .param p1, "layoutNode"    # Landroidx/compose/ui/node/LayoutNode;

    .line 335
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->onPositionedDispatcher:Landroidx/compose/ui/node/OnPositionedDispatcher;

    invoke-virtual {v0, p1}, Landroidx/compose/ui/node/OnPositionedDispatcher;->onNodePositioned(Landroidx/compose/ui/node/LayoutNode;)V

    .line 336
    return-void
.end method

.method public final requestRelayout(Landroidx/compose/ui/node/LayoutNode;Z)Z
    .locals 4
    .param p1, "layoutNode"    # Landroidx/compose/ui/node/LayoutNode;
    .param p2, "forced"    # Z

    .line 292
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLayoutState$ui_release()Landroidx/compose/ui/node/LayoutNode$LayoutState;

    move-result-object v0

    sget-object v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode$LayoutState;->ordinal()I

    move-result v0

    aget v0, v1, v0

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    .line 326
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    .line 303
    :pswitch_0
    nop

    .line 304
    if-nez p2, :cond_2

    .line 305
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isPlaced()Z

    move-result v0

    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isPlacedByParent()Z

    move-result v2

    if-ne v0, v2, :cond_2

    .line 306
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getMeasurePending$ui_release()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLayoutPending$ui_release()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 310
    :cond_0
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->consistencyChecker:Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;->assertConsistent()V

    .line 311
    :cond_1
    goto :goto_2

    .line 313
    :cond_2
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->markLayoutPending$ui_release()V

    .line 316
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isDeactivated()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 317
    goto :goto_2

    .line 319
    :cond_3
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isPlacedByParent()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 320
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getParent$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v0

    .line 321
    .local v0, "parent":Landroidx/compose/ui/node/LayoutNode;
    const/4 v2, 0x1

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->getLayoutPending$ui_release()Z

    move-result v3

    if-ne v3, v2, :cond_4

    move v3, v2

    goto :goto_0

    :cond_4
    move v3, v1

    :goto_0
    if-nez v3, :cond_6

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->getMeasurePending$ui_release()Z

    move-result v3

    if-ne v3, v2, :cond_5

    move v3, v2

    goto :goto_1

    :cond_5
    move v3, v1

    :goto_1
    if-nez v3, :cond_6

    .line 322
    iget-object v3, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v3, p1, v1}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->add(Landroidx/compose/ui/node/LayoutNode;Z)V

    .line 324
    :cond_6
    iget-boolean v3, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    if-nez v3, :cond_7

    move v1, v2

    goto :goto_2

    .end local v0    # "parent":Landroidx/compose/ui/node/LayoutNode;
    :cond_7
    goto :goto_2

    .line 326
    :cond_8
    goto :goto_2

    .line 299
    :pswitch_1
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->consistencyChecker:Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;->assertConsistent()V

    .line 300
    :cond_9
    nop

    .line 331
    :goto_2
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final requestRemeasure(Landroidx/compose/ui/node/LayoutNode;Z)Z
    .locals 3
    .param p1, "layoutNode"    # Landroidx/compose/ui/node/LayoutNode;
    .param p2, "forced"    # Z

    .line 185
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getLayoutState$ui_release()Landroidx/compose/ui/node/LayoutNode$LayoutState;

    move-result-object v0

    sget-object v1, Landroidx/compose/ui/node/MeasureAndLayoutDelegate$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode$LayoutState;->ordinal()I

    move-result v0

    aget v0, v1, v0

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    .line 220
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    .line 205
    :pswitch_0
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getMeasurePending$ui_release()Z

    move-result v0

    if-eqz v0, :cond_0

    if-nez p2, :cond_0

    .line 206
    goto :goto_2

    .line 208
    :cond_0
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->markMeasurePending$ui_release()V

    .line 211
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isDeactivated()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 212
    goto :goto_2

    .line 214
    :cond_1
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->isPlaced()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-direct {p0, p1}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->getCanAffectParent(Landroidx/compose/ui/node/LayoutNode;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 220
    :cond_2
    goto :goto_2

    .line 215
    :cond_3
    :goto_0
    invoke-virtual {p1}, Landroidx/compose/ui/node/LayoutNode;->getParent$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v0

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->getMeasurePending$ui_release()Z

    move-result v0

    if-ne v0, v2, :cond_4

    move v0, v2

    goto :goto_1

    :cond_4
    move v0, v1

    :goto_1
    if-nez v0, :cond_5

    .line 216
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    invoke-virtual {v0, p1, v1}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->add(Landroidx/compose/ui/node/LayoutNode;Z)V

    .line 218
    :cond_5
    iget-boolean v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringFullMeasureLayoutPass:Z

    if-nez v0, :cond_7

    move v1, v2

    goto :goto_2

    .line 198
    :pswitch_1
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->postponedMeasureRequests:Landroidx/compose/runtime/collection/MutableVector;

    .line 199
    new-instance v2, Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;

    invoke-direct {v2, p1, v1, p2}, Landroidx/compose/ui/node/MeasureAndLayoutDelegate$PostponedRequest;-><init>(Landroidx/compose/ui/node/LayoutNode;ZZ)V

    .line 198
    invoke-virtual {v0, v2}, Landroidx/compose/runtime/collection/MutableVector;->add(Ljava/lang/Object;)Z

    .line 201
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->consistencyChecker:Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutTreeConsistencyChecker;->assertConsistent()V

    .line 202
    :cond_6
    goto :goto_2

    .line 192
    :pswitch_2
    nop

    .line 225
    :cond_7
    :goto_2
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final setDuringMeasureLayout$ui_release(Z)V
    .locals 0
    .param p1, "<set-?>"    # Z

    .line 54
    iput-boolean p1, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    return-void
.end method

.method public final updateRootConstraints-BRTryo0(J)V
    .locals 5
    .param p1, "constraints"    # J

    .line 92
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->rootConstraints:Landroidx/compose/ui/unit/Constraints;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroidx/compose/ui/unit/Constraints;->unbox-impl()J

    move-result-wide v2

    invoke-static {v2, v3, p1, p2}, Landroidx/compose/ui/unit/Constraints;->equals-impl0(JJ)Z

    move-result v0

    :goto_0
    if-nez v0, :cond_4

    .line 93
    iget-boolean v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->duringMeasureLayout:Z

    const/4 v2, 0x1

    xor-int/2addr v0, v2

    .local v0, "value$iv":Z
    const/4 v3, 0x0

    .line 768
    .local v3, "$i$f$requirePrecondition":I
    nop

    .line 769
    if-nez v0, :cond_1

    .line 770
    const/4 v4, 0x0

    .line 94
    .local v4, "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$updateRootConstraints$1":I
    nop

    .line 770
    .end local v4    # "$i$a$-requirePrecondition-MeasureAndLayoutDelegate$updateRootConstraints$1":I
    const-string/jumbo v4, "updateRootConstraints called while measuring"

    invoke-static {v4}, Landroidx/compose/ui/internal/InlineClassHelperKt;->throwIllegalArgumentException(Ljava/lang/String;)V

    .line 772
    :cond_1
    nop

    .line 96
    .end local v0    # "value$iv":Z
    .end local v3    # "$i$f$requirePrecondition":I
    invoke-static {p1, p2}, Landroidx/compose/ui/unit/Constraints;->box-impl(J)Landroidx/compose/ui/unit/Constraints;

    move-result-object v0

    iput-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->rootConstraints:Landroidx/compose/ui/unit/Constraints;

    .line 97
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadRoot$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 98
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->markLookaheadMeasurePending$ui_release()V

    .line 100
    :cond_2
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->markMeasurePending$ui_release()V

    .line 101
    iget-object v0, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->relayoutNodes:Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;

    iget-object v3, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    iget-object v4, p0, Landroidx/compose/ui/node/MeasureAndLayoutDelegate;->root:Landroidx/compose/ui/node/LayoutNode;

    invoke-virtual {v4}, Landroidx/compose/ui/node/LayoutNode;->getLookaheadRoot$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v4

    if-eqz v4, :cond_3

    move v1, v2

    :cond_3
    invoke-virtual {v0, v3, v1}, Landroidx/compose/ui/node/DepthSortedSetsForDifferentPasses;->add(Landroidx/compose/ui/node/LayoutNode;Z)V

    .line 103
    :cond_4
    return-void
.end method
