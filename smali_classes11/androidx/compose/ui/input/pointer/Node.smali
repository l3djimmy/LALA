.class public final Landroidx/compose/ui/input/pointer/Node;
.super Landroidx/compose/ui/input/pointer/NodeParent;
.source "HitPathTracker.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nHitPathTracker.kt\nKotlin\n*S Kotlin\n*F\n+ 1 HitPathTracker.kt\nandroidx/compose/ui/input/pointer/Node\n+ 2 MutableVector.kt\nandroidx/compose/runtime/collection/MutableVector\n+ 3 NodeKind.kt\nandroidx/compose/ui/node/Nodes\n+ 4 DelegatableNode.kt\nandroidx/compose/ui/node/DelegatableNodeKt\n+ 5 Modifier.kt\nandroidx/compose/ui/Modifier$Node\n+ 6 DelegatingNode.kt\nandroidx/compose/ui/node/DelegatingNode\n+ 7 MutableVector.kt\nandroidx/compose/runtime/collection/MutableVectorKt\n+ 8 Offset.kt\nandroidx/compose/ui/geometry/Offset\n+ 9 ListUtils.kt\nandroidx/compose/ui/util/ListUtilsKt\n+ 10 PointerIdArray.kt\nandroidx/compose/ui/input/pointer/util/PointerIdArray\n*L\n1#1,643:1\n588#1,5:653\n595#1:755\n588#1,5:756\n595#1:814\n423#2,9:644\n423#2,9:702\n423#2,9:805\n423#2,9:878\n95#3:658\n95#3:711\n95#3:761\n95#3:815\n95#3:887\n437#4,6:659\n447#4,2:666\n449#4,8:671\n457#4,9:682\n466#4,8:694\n437#4,6:712\n447#4,2:719\n449#4,8:724\n457#4,9:735\n466#4,8:747\n437#4,6:762\n447#4,2:769\n449#4,8:774\n457#4,9:785\n466#4,8:797\n437#4,6:816\n447#4,2:823\n449#4,8:828\n457#4,9:839\n466#4,8:851\n437#4,6:888\n447#4,2:895\n449#4,8:900\n457#4,9:911\n466#4,8:923\n246#5:665\n246#5:718\n246#5:768\n246#5:822\n246#5:894\n240#6,3:668\n243#6,3:691\n240#6,3:721\n243#6,3:744\n240#6,3:771\n243#6,3:794\n240#6,3:825\n243#6,3:848\n240#6,3:897\n243#6,3:920\n1101#7:679\n1083#7,2:680\n1101#7:732\n1083#7,2:733\n1101#7:782\n1083#7,2:783\n1101#7:836\n1083#7,2:837\n1101#7:908\n1083#7,2:909\n111#8,2:859\n111#8,2:865\n34#9,4:861\n39#9:867\n117#9,2:869\n34#9,6:871\n119#9:877\n34#9,4:931\n39#9:936\n40#10:868\n67#10:935\n*S KotlinDebug\n*F\n+ 1 HitPathTracker.kt\nandroidx/compose/ui/input/pointer/Node\n*L\n365#1:653,5\n365#1:755\n404#1:756,5\n404#1:814\n350#1:644,9\n376#1:702,9\n414#1:805,9\n605#1:878,9\n370#1:658\n390#1:711\n408#1:761\n442#1:815\n606#1:887\n370#1:659,6\n370#1:666,2\n370#1:671,8\n370#1:682,9\n370#1:694,8\n390#1:712,6\n390#1:719,2\n390#1:724,8\n390#1:735,9\n390#1:747,8\n408#1:762,6\n408#1:769,2\n408#1:774,8\n408#1:785,9\n408#1:797,8\n442#1:816,6\n442#1:823,2\n442#1:828,8\n442#1:839,9\n442#1:851,8\n606#1:888,6\n606#1:895,2\n606#1:900,8\n606#1:911,9\n606#1:923,8\n370#1:665\n390#1:718\n408#1:768\n442#1:822\n606#1:894\n370#1:668,3\n370#1:691,3\n390#1:721,3\n390#1:744,3\n408#1:771,3\n408#1:794,3\n442#1:825,3\n442#1:848,3\n606#1:897,3\n606#1:920,3\n370#1:679\n370#1:680,2\n390#1:732\n390#1:733,2\n408#1:782\n408#1:783,2\n442#1:836\n442#1:837,2\n606#1:908\n606#1:909,2\n459#1:859,2\n469#1:865,2\n464#1:861,4\n464#1:867\n518#1:869,2\n518#1:871,6\n518#1:877\n620#1:931,4\n620#1:936\n504#1:868\n631#1:935\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000d\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J.\u0010\u0016\u001a\u00020\u00082\u000c\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u00132\u0006\u0010\u0018\u001a\u00020\u00062\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u0008H\u0016J\u0010\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u0019\u001a\u00020\u001aH\u0016J\u0008\u0010\u001e\u001a\u00020\u001dH\u0002J\u0008\u0010\u001f\u001a\u00020\u001dH\u0016J\u0010\u0010 \u001a\u00020\u00082\u0006\u0010\u0019\u001a\u00020\u001aH\u0016J\u0017\u0010!\u001a\u00020\u00082\u000c\u0010\"\u001a\u0008\u0012\u0004\u0012\u00020\u001d0#H\u0082\u0008J.\u0010$\u001a\u00020\u00082\u000c\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u00132\u0006\u0010\u0018\u001a\u00020\u00062\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u0008H\u0016J\u001a\u0010%\u001a\u00020\u00082\u0008\u0010&\u001a\u0004\u0018\u00010\r2\u0006\u0010\'\u001a\u00020\rH\u0002J\u0006\u0010(\u001a\u00020\u001dJ\u001e\u0010)\u001a\u00020\u001d2\u0006\u0010*\u001a\u00020+2\u000c\u0010,\u001a\u0008\u0012\u0004\u0012\u00020\u00000-H\u0016J\u0008\u0010.\u001a\u00020/H\u0016R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0010\u0010\u000c\u001a\u0004\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u000e\u001a\u00020\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011R\u0014\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u0013X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u00060"
    }
    d2 = {
        "Landroidx/compose/ui/input/pointer/Node;",
        "Landroidx/compose/ui/input/pointer/NodeParent;",
        "modifierNode",
        "Landroidx/compose/ui/Modifier$Node;",
        "(Landroidx/compose/ui/Modifier$Node;)V",
        "coordinates",
        "Landroidx/compose/ui/layout/LayoutCoordinates;",
        "hasExited",
        "",
        "isIn",
        "getModifierNode",
        "()Landroidx/compose/ui/Modifier$Node;",
        "pointerEvent",
        "Landroidx/compose/ui/input/pointer/PointerEvent;",
        "pointerIds",
        "Landroidx/compose/ui/input/pointer/util/PointerIdArray;",
        "getPointerIds",
        "()Landroidx/compose/ui/input/pointer/util/PointerIdArray;",
        "relevantChanges",
        "Landroidx/collection/LongSparseArray;",
        "Landroidx/compose/ui/input/pointer/PointerInputChange;",
        "wasIn",
        "buildCache",
        "changes",
        "parentCoordinates",
        "internalPointerEvent",
        "Landroidx/compose/ui/input/pointer/InternalPointerEvent;",
        "isInBounds",
        "cleanUpHits",
        "",
        "clearCache",
        "dispatchCancel",
        "dispatchFinalEventPass",
        "dispatchIfNeeded",
        "block",
        "Lkotlin/Function0;",
        "dispatchMainEventPass",
        "hasPositionChanged",
        "oldEvent",
        "newEvent",
        "markIsIn",
        "removeInvalidPointerIdsAndChanges",
        "pointerIdValue",
        "",
        "hitNodes",
        "Landroidx/collection/MutableObjectList;",
        "toString",
        "",
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
.field private coordinates:Landroidx/compose/ui/layout/LayoutCoordinates;

.field private hasExited:Z

.field private isIn:Z

.field private final modifierNode:Landroidx/compose/ui/Modifier$Node;

.field private pointerEvent:Landroidx/compose/ui/input/pointer/PointerEvent;

.field private final pointerIds:Landroidx/compose/ui/input/pointer/util/PointerIdArray;

.field private final relevantChanges:Landroidx/collection/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/LongSparseArray<",
            "Landroidx/compose/ui/input/pointer/PointerInputChange;",
            ">;"
        }
    .end annotation
.end field

.field private wasIn:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Landroidx/compose/ui/input/pointer/Node;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroidx/compose/ui/Modifier$Node;)V
    .locals 2
    .param p1, "modifierNode"    # Landroidx/compose/ui/Modifier$Node;

    .line 317
    invoke-direct {p0}, Landroidx/compose/ui/input/pointer/NodeParent;-><init>()V

    iput-object p1, p0, Landroidx/compose/ui/input/pointer/Node;->modifierNode:Landroidx/compose/ui/Modifier$Node;

    .line 322
    new-instance v0, Landroidx/compose/ui/input/pointer/util/PointerIdArray;

    invoke-direct {v0}, Landroidx/compose/ui/input/pointer/util/PointerIdArray;-><init>()V

    iput-object v0, p0, Landroidx/compose/ui/input/pointer/Node;->pointerIds:Landroidx/compose/ui/input/pointer/util/PointerIdArray;

    .line 332
    new-instance v0, Landroidx/collection/LongSparseArray;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroidx/collection/LongSparseArray;-><init>(I)V

    iput-object v0, p0, Landroidx/compose/ui/input/pointer/Node;->relevantChanges:Landroidx/collection/LongSparseArray;

    .line 336
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/compose/ui/input/pointer/Node;->isIn:Z

    .line 337
    iput-boolean v0, p0, Landroidx/compose/ui/input/pointer/Node;->hasExited:Z

    .line 317
    return-void
.end method

.method private final clearCache()V
    .locals 1

    .line 577
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/Node;->relevantChanges:Landroidx/collection/LongSparseArray;

    invoke-virtual {v0}, Landroidx/collection/LongSparseArray;->clear()V

    .line 578
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/compose/ui/input/pointer/Node;->coordinates:Landroidx/compose/ui/layout/LayoutCoordinates;

    .line 579
    return-void
.end method

.method private final dispatchIfNeeded(Lkotlin/jvm/functions/Function0;)Z
    .locals 3
    .param p1, "block"    # Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    .line 588
    .local v0, "$i$f$dispatchIfNeeded":I
    iget-object v1, p0, Landroidx/compose/ui/input/pointer/Node;->relevantChanges:Landroidx/collection/LongSparseArray;

    invoke-virtual {v1}, Landroidx/collection/LongSparseArray;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return v2

    .line 590
    :cond_0
    iget-object v1, p0, Landroidx/compose/ui/input/pointer/Node;->modifierNode:Landroidx/compose/ui/Modifier$Node;

    invoke-virtual {v1}, Landroidx/compose/ui/Modifier$Node;->isAttached()Z

    move-result v1

    if-nez v1, :cond_1

    return v2

    .line 592
    :cond_1
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 595
    const/4 v1, 0x1

    return v1
.end method

.method private final hasPositionChanged(Landroidx/compose/ui/input/pointer/PointerEvent;Landroidx/compose/ui/input/pointer/PointerEvent;)Z
    .locals 9
    .param p1, "oldEvent"    # Landroidx/compose/ui/input/pointer/PointerEvent;
    .param p2, "newEvent"    # Landroidx/compose/ui/input/pointer/PointerEvent;

    .line 557
    const/4 v0, 0x1

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Landroidx/compose/ui/input/pointer/PointerEvent;->getChanges()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p2}, Landroidx/compose/ui/input/pointer/PointerEvent;->getChanges()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eq v1, v2, :cond_0

    goto :goto_1

    .line 560
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p2}, Landroidx/compose/ui/input/pointer/PointerEvent;->getChanges()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    :goto_0
    if-ge v1, v2, :cond_2

    .line 561
    invoke-virtual {p1}, Landroidx/compose/ui/input/pointer/PointerEvent;->getChanges()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/compose/ui/input/pointer/PointerInputChange;

    .line 562
    .local v3, "old":Landroidx/compose/ui/input/pointer/PointerInputChange;
    invoke-virtual {p2}, Landroidx/compose/ui/input/pointer/PointerEvent;->getChanges()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/compose/ui/input/pointer/PointerInputChange;

    .line 563
    .local v4, "current":Landroidx/compose/ui/input/pointer/PointerInputChange;
    invoke-virtual {v3}, Landroidx/compose/ui/input/pointer/PointerInputChange;->getPosition-F1C5BW0()J

    move-result-wide v5

    invoke-virtual {v4}, Landroidx/compose/ui/input/pointer/PointerInputChange;->getPosition-F1C5BW0()J

    move-result-wide v7

    invoke-static {v5, v6, v7, v8}, Landroidx/compose/ui/geometry/Offset;->equals-impl0(JJ)Z

    move-result v5

    if-nez v5, :cond_1

    .line 564
    return v0

    .line 560
    .end local v3    # "old":Landroidx/compose/ui/input/pointer/PointerInputChange;
    .end local v4    # "current":Landroidx/compose/ui/input/pointer/PointerInputChange;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 567
    .end local v1    # "i":I
    :cond_2
    const/4 v0, 0x0

    return v0

    .line 558
    :cond_3
    :goto_1
    return v0
.end method


# virtual methods
.method public buildCache(Landroidx/collection/LongSparseArray;Landroidx/compose/ui/layout/LayoutCoordinates;Landroidx/compose/ui/input/pointer/InternalPointerEvent;Z)Z
    .locals 42
    .param p1, "changes"    # Landroidx/collection/LongSparseArray;
    .param p2, "parentCoordinates"    # Landroidx/compose/ui/layout/LayoutCoordinates;
    .param p3, "internalPointerEvent"    # Landroidx/compose/ui/input/pointer/InternalPointerEvent;
    .param p4, "isInBounds"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/collection/LongSparseArray<",
            "Landroidx/compose/ui/input/pointer/PointerInputChange;",
            ">;",
            "Landroidx/compose/ui/layout/LayoutCoordinates;",
            "Landroidx/compose/ui/input/pointer/InternalPointerEvent;",
            "Z)Z"
        }
    .end annotation

    .line 437
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-super/range {p0 .. p4}, Landroidx/compose/ui/input/pointer/NodeParent;->buildCache(Landroidx/collection/LongSparseArray;Landroidx/compose/ui/layout/LayoutCoordinates;Landroidx/compose/ui/input/pointer/InternalPointerEvent;Z)Z

    move-result v4

    .line 436
    nop

    .line 440
    .local v4, "childChanged":Z
    iget-object v5, v0, Landroidx/compose/ui/input/pointer/Node;->modifierNode:Landroidx/compose/ui/Modifier$Node;

    invoke-virtual {v5}, Landroidx/compose/ui/Modifier$Node;->isAttached()Z

    move-result v5

    const/4 v6, 0x1

    if-nez v5, :cond_0

    return v6

    .line 442
    :cond_0
    iget-object v5, v0, Landroidx/compose/ui/input/pointer/Node;->modifierNode:Landroidx/compose/ui/Modifier$Node;

    const/4 v7, 0x0

    .line 815
    .local v7, "$i$f$getPointerInput-OLwlOKw":I
    const/16 v8, 0x10

    invoke-static {v8}, Landroidx/compose/ui/node/NodeKind;->constructor-impl(I)I

    move-result v7

    .line 442
    .end local v7    # "$i$f$getPointerInput-OLwlOKw":I
    nop

    .local v5, "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .local v7, "kind$iv":I
    const/4 v8, 0x0

    .line 816
    .local v8, "$i$f$dispatchForKind-6rFNWt0":I
    const/4 v9, 0x0

    .line 817
    .local v9, "stack$iv":Ljava/lang/Object;
    const/4 v10, 0x0

    .local v10, "node$iv":Ljava/lang/Object;
    move-object v10, v5

    .line 818
    :goto_0
    const/4 v11, 0x0

    if-eqz v10, :cond_d

    .line 819
    instance-of v12, v10, Landroidx/compose/ui/node/PointerInputModifierNode;

    if-eqz v12, :cond_1

    .line 820
    move-object v11, v10

    check-cast v11, Landroidx/compose/ui/node/PointerInputModifierNode;

    .local v11, "it":Landroidx/compose/ui/node/PointerInputModifierNode;
    const/4 v12, 0x0

    .line 442
    .local v12, "$i$a$-dispatchForKind-6rFNWt0-Node$buildCache$1":I
    invoke-static {v11}, Landroidx/compose/ui/node/PointerInputModifierNodeKt;->getLayoutCoordinates(Landroidx/compose/ui/node/PointerInputModifierNode;)Landroidx/compose/ui/layout/LayoutCoordinates;

    move-result-object v13

    iput-object v13, v0, Landroidx/compose/ui/input/pointer/Node;->coordinates:Landroidx/compose/ui/layout/LayoutCoordinates;

    .line 820
    .end local v11    # "it":Landroidx/compose/ui/node/PointerInputModifierNode;
    .end local v12    # "$i$a$-dispatchForKind-6rFNWt0-Node$buildCache$1":I
    move/from16 v21, v4

    move-object/from16 v22, v5

    goto/16 :goto_6

    .line 821
    :cond_1
    move-object v12, v10

    .local v12, "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    const/4 v13, 0x0

    .line 822
    .local v13, "$i$f$isKind-H91voCI$ui_release":I
    invoke-virtual {v12}, Landroidx/compose/ui/Modifier$Node;->getKindSet$ui_release()I

    move-result v14

    and-int/2addr v14, v7

    if-eqz v14, :cond_2

    move v12, v6

    goto :goto_1

    :cond_2
    move v12, v11

    .line 821
    .end local v12    # "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v13    # "$i$f$isKind-H91voCI$ui_release":I
    :goto_1
    if-eqz v12, :cond_b

    instance-of v12, v10, Landroidx/compose/ui/node/DelegatingNode;

    if-eqz v12, :cond_b

    .line 823
    const/4 v12, 0x0

    .line 824
    .local v12, "count$iv":I
    move-object v13, v10

    check-cast v13, Landroidx/compose/ui/node/DelegatingNode;

    .local v13, "this_$iv$iv":Landroidx/compose/ui/node/DelegatingNode;
    const/4 v14, 0x0

    .line 825
    .local v14, "$i$f$forEachImmediateDelegate$ui_release":I
    invoke-virtual {v13}, Landroidx/compose/ui/node/DelegatingNode;->getDelegate$ui_release()Landroidx/compose/ui/Modifier$Node;

    move-result-object v15

    .line 826
    .local v15, "node$iv$iv":Landroidx/compose/ui/Modifier$Node;
    :goto_2
    if-eqz v15, :cond_a

    .line 827
    move-object/from16 v16, v15

    .local v16, "next$iv":Landroidx/compose/ui/Modifier$Node;
    const/16 v17, 0x0

    .line 828
    .local v17, "$i$a$-forEachImmediateDelegate$ui_release-DelegatableNodeKt$dispatchForKind$1$iv":I
    move-object/from16 v18, v16

    .local v18, "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    const/16 v19, 0x0

    .line 822
    .local v19, "$i$f$isKind-H91voCI$ui_release":I
    invoke-virtual/range {v18 .. v18}, Landroidx/compose/ui/Modifier$Node;->getKindSet$ui_release()I

    move-result v20

    and-int v20, v20, v7

    if-eqz v20, :cond_3

    move/from16 v18, v6

    goto :goto_3

    :cond_3
    move/from16 v18, v11

    .line 828
    .end local v18    # "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v19    # "$i$f$isKind-H91voCI$ui_release":I
    :goto_3
    if-eqz v18, :cond_9

    .line 829
    add-int/lit8 v12, v12, 0x1

    .line 830
    if-ne v12, v6, :cond_4

    .line 831
    move-object/from16 v10, v16

    move/from16 v21, v4

    move-object/from16 v22, v5

    move-object/from16 v5, v16

    goto :goto_5

    .line 835
    :cond_4
    if-nez v9, :cond_5

    const/16 v18, 0x0

    .line 836
    .local v18, "$i$f$mutableVectorOf":I
    nop

    .line 837
    const/16 v6, 0x10

    .local v6, "capacity$iv$iv$iv":I
    const/16 v20, 0x0

    .line 838
    .local v20, "$i$f$MutableVector":I
    move/from16 v21, v4

    .end local v4    # "childChanged":Z
    .local v21, "childChanged":Z
    new-instance v4, Landroidx/compose/runtime/collection/MutableVector;

    move-object/from16 v22, v5

    .end local v5    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .local v22, "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    new-array v5, v6, [Landroidx/compose/ui/Modifier$Node;

    invoke-direct {v4, v5, v11}, Landroidx/compose/runtime/collection/MutableVector;-><init>([Ljava/lang/Object;I)V

    .line 836
    .end local v6    # "capacity$iv$iv$iv":I
    .end local v20    # "$i$f$MutableVector":I
    goto :goto_4

    .line 835
    .end local v18    # "$i$f$mutableVectorOf":I
    .end local v21    # "childChanged":Z
    .end local v22    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v4    # "childChanged":Z
    .restart local v5    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    :cond_5
    move/from16 v21, v4

    move-object/from16 v22, v5

    .end local v4    # "childChanged":Z
    .end local v5    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v21    # "childChanged":Z
    .restart local v22    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    move-object v4, v9

    :goto_4
    move-object v9, v4

    .line 839
    move-object v4, v10

    .line 840
    .local v4, "theNode$iv":Landroidx/compose/ui/Modifier$Node;
    if-eqz v4, :cond_7

    .line 841
    if-eqz v9, :cond_6

    invoke-virtual {v9, v4}, Landroidx/compose/runtime/collection/MutableVector;->add(Ljava/lang/Object;)Z

    .line 842
    :cond_6
    const/4 v5, 0x0

    move-object v10, v5

    .line 844
    :cond_7
    if-eqz v9, :cond_8

    move-object/from16 v5, v16

    .end local v16    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .local v5, "next$iv":Landroidx/compose/ui/Modifier$Node;
    invoke-virtual {v9, v5}, Landroidx/compose/runtime/collection/MutableVector;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .end local v5    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v16    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    :cond_8
    move-object/from16 v5, v16

    .end local v16    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v5    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    goto :goto_5

    .line 828
    .end local v21    # "childChanged":Z
    .end local v22    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .local v4, "childChanged":Z
    .local v5, "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v16    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    :cond_9
    move/from16 v21, v4

    move-object/from16 v22, v5

    move-object/from16 v5, v16

    .line 847
    .end local v4    # "childChanged":Z
    .end local v16    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .local v5, "next$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v21    # "childChanged":Z
    .restart local v22    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    :goto_5
    nop

    .line 827
    .end local v5    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v17    # "$i$a$-forEachImmediateDelegate$ui_release-DelegatableNodeKt$dispatchForKind$1$iv":I
    nop

    .line 848
    invoke-virtual {v15}, Landroidx/compose/ui/Modifier$Node;->getChild$ui_release()Landroidx/compose/ui/Modifier$Node;

    move-result-object v15

    move/from16 v4, v21

    move-object/from16 v5, v22

    const/4 v6, 0x1

    goto :goto_2

    .line 850
    .end local v21    # "childChanged":Z
    .end local v22    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v4    # "childChanged":Z
    .local v5, "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    :cond_a
    move/from16 v21, v4

    move-object/from16 v22, v5

    .line 851
    .end local v4    # "childChanged":Z
    .end local v5    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v13    # "this_$iv$iv":Landroidx/compose/ui/node/DelegatingNode;
    .end local v14    # "$i$f$forEachImmediateDelegate$ui_release":I
    .end local v15    # "node$iv$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v21    # "childChanged":Z
    .restart local v22    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    const/4 v4, 0x1

    if-ne v12, v4, :cond_c

    .line 853
    move/from16 v4, v21

    move-object/from16 v5, v22

    const/4 v6, 0x1

    goto/16 :goto_0

    .line 821
    .end local v12    # "count$iv":I
    .end local v21    # "childChanged":Z
    .end local v22    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v4    # "childChanged":Z
    .restart local v5    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    :cond_b
    move/from16 v21, v4

    move-object/from16 v22, v5

    .line 856
    .end local v4    # "childChanged":Z
    .end local v5    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v21    # "childChanged":Z
    .restart local v22    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    :cond_c
    :goto_6
    invoke-static {v9}, Landroidx/compose/ui/node/DelegatableNodeKt;->access$pop(Landroidx/compose/runtime/collection/MutableVector;)Landroidx/compose/ui/Modifier$Node;

    move-result-object v10

    move/from16 v4, v21

    move-object/from16 v5, v22

    const/4 v6, 0x1

    goto/16 :goto_0

    .line 858
    .end local v21    # "childChanged":Z
    .end local v22    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v4    # "childChanged":Z
    .restart local v5    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    :cond_d
    move/from16 v21, v4

    move-object/from16 v22, v5

    .line 448
    .end local v4    # "childChanged":Z
    .end local v5    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v7    # "kind$iv":I
    .end local v8    # "$i$f$dispatchForKind-6rFNWt0":I
    .end local v9    # "stack$iv":Ljava/lang/Object;
    .end local v10    # "node$iv":Ljava/lang/Object;
    .restart local v21    # "childChanged":Z
    iget-object v4, v0, Landroidx/compose/ui/input/pointer/Node;->coordinates:Landroidx/compose/ui/layout/LayoutCoordinates;

    if-nez v4, :cond_e

    const/16 v19, 0x1

    return v19

    .line 451
    :cond_e
    const/4 v4, 0x0

    .local v4, "j":I
    invoke-virtual {v1}, Landroidx/collection/LongSparseArray;->size()I

    move-result v5

    :goto_7
    if-ge v4, v5, :cond_16

    .line 452
    invoke-virtual {v1, v4}, Landroidx/collection/LongSparseArray;->keyAt(I)J

    move-result-wide v6

    .line 453
    .local v6, "keyValue":J
    invoke-virtual {v1, v4}, Landroidx/collection/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v22, v8

    check-cast v22, Landroidx/compose/ui/input/pointer/PointerInputChange;

    .line 455
    .local v22, "change":Landroidx/compose/ui/input/pointer/PointerInputChange;
    iget-object v8, v0, Landroidx/compose/ui/input/pointer/Node;->pointerIds:Landroidx/compose/ui/input/pointer/util/PointerIdArray;

    invoke-virtual {v8, v6, v7}, Landroidx/compose/ui/input/pointer/util/PointerIdArray;->contains(J)Z

    move-result v8

    if-eqz v8, :cond_15

    .line 456
    invoke-virtual/range {v22 .. v22}, Landroidx/compose/ui/input/pointer/PointerInputChange;->getPreviousPosition-F1C5BW0()J

    move-result-wide v8

    .line 457
    .local v8, "prevPosition":J
    invoke-virtual/range {v22 .. v22}, Landroidx/compose/ui/input/pointer/PointerInputChange;->getPosition-F1C5BW0()J

    move-result-wide v12

    .line 459
    .local v12, "currentPosition":J
    const/4 v10, 0x0

    .line 859
    .local v10, "$i$f$isValid-impl":I
    const-wide v14, 0x7fffffff7fffffffL

    and-long v16, v8, v14

    .line 860
    .local v16, "v$iv":J
    const-wide v23, 0x7fffff007fffffL

    add-long v25, v16, v23

    const-wide v27, -0x7fffffff80000000L    # -1.0609978955E-314

    and-long v25, v25, v27

    const-wide/16 v29, 0x0

    cmp-long v18, v25, v29

    if-nez v18, :cond_f

    const/4 v10, 0x1

    goto :goto_8

    :cond_f
    move v10, v11

    .line 459
    .end local v10    # "$i$f$isValid-impl":I
    .end local v16    # "v$iv":J
    :goto_8
    if-eqz v10, :cond_14

    const/4 v10, 0x0

    .line 859
    .restart local v10    # "$i$f$isValid-impl":I
    and-long v16, v12, v14

    .line 860
    .restart local v16    # "v$iv":J
    add-long v25, v16, v23

    and-long v25, v25, v27

    cmp-long v18, v25, v29

    if-nez v18, :cond_10

    const/4 v10, 0x1

    goto :goto_9

    :cond_10
    move v10, v11

    .line 459
    .end local v10    # "$i$f$isValid-impl":I
    .end local v16    # "v$iv":J
    :goto_9
    if-eqz v10, :cond_14

    .line 462
    new-instance v10, Ljava/util/ArrayList;

    invoke-virtual/range {v22 .. v22}, Landroidx/compose/ui/input/pointer/PointerInputChange;->getHistorical()Ljava/util/List;

    move-result-object v16

    move-wide/from16 v17, v14

    invoke-interface/range {v16 .. v16}, Ljava/util/List;->size()I

    move-result v14

    invoke-direct {v10, v14}, Ljava/util/ArrayList;-><init>(I)V

    .line 464
    .local v10, "historical":Ljava/util/ArrayList;
    invoke-virtual/range {v22 .. v22}, Landroidx/compose/ui/input/pointer/PointerInputChange;->getHistorical()Ljava/util/List;

    move-result-object v14

    .local v14, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v15, 0x0

    .line 861
    .local v15, "$i$f$fastForEach":I
    nop

    .line 862
    const/16 v16, 0x0

    .local v16, "index$iv":I
    move-object/from16 v20, v14

    check-cast v20, Ljava/util/Collection;

    invoke-interface/range {v20 .. v20}, Ljava/util/Collection;->size()I

    move-result v11

    move/from16 v20, v4

    move/from16 v4, v16

    .end local v16    # "index$iv":I
    .local v4, "index$iv":I
    .local v20, "j":I
    :goto_a
    if-ge v4, v11, :cond_13

    .line 863
    invoke-interface {v14, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    .line 864
    .local v16, "item$iv":Ljava/lang/Object;
    move-object/from16 v25, v16

    check-cast v25, Landroidx/compose/ui/input/pointer/HistoricalChange;

    .local v25, "it":Landroidx/compose/ui/input/pointer/HistoricalChange;
    const/16 v26, 0x0

    .line 465
    .local v26, "$i$a$-fastForEach-Node$buildCache$2":I
    move/from16 v31, v4

    move/from16 v41, v5

    .end local v4    # "index$iv":I
    .local v31, "index$iv":I
    invoke-virtual/range {v25 .. v25}, Landroidx/compose/ui/input/pointer/HistoricalChange;->getPosition-F1C5BW0()J

    move-result-wide v4

    .line 469
    .local v4, "historicalPosition":J
    const/16 v32, 0x0

    .line 865
    .local v32, "$i$f$isValid-impl":I
    and-long v33, v4, v17

    .line 866
    .local v33, "v$iv":J
    add-long v35, v33, v23

    and-long v35, v35, v27

    cmp-long v35, v35, v29

    if-nez v35, :cond_11

    const/16 v32, 0x1

    goto :goto_b

    :cond_11
    const/16 v32, 0x0

    .line 469
    .end local v32    # "$i$f$isValid-impl":I
    .end local v33    # "v$iv":J
    :goto_b
    if-eqz v32, :cond_12

    .line 470
    nop

    .line 471
    new-instance v33, Landroidx/compose/ui/input/pointer/HistoricalChange;

    .line 472
    invoke-virtual/range {v25 .. v25}, Landroidx/compose/ui/input/pointer/HistoricalChange;->getUptimeMillis()J

    move-result-wide v34

    .line 473
    move/from16 v32, v11

    iget-object v11, v0, Landroidx/compose/ui/input/pointer/Node;->coordinates:Landroidx/compose/ui/layout/LayoutCoordinates;

    invoke-static {v11}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 474
    nop

    .line 475
    nop

    .line 473
    invoke-interface {v11, v2, v4, v5}, Landroidx/compose/ui/layout/LayoutCoordinates;->localPositionOf-R5De75A(Landroidx/compose/ui/layout/LayoutCoordinates;J)J

    move-result-wide v36

    .line 477
    invoke-virtual/range {v25 .. v25}, Landroidx/compose/ui/input/pointer/HistoricalChange;->getOriginalEventPosition-F1C5BW0$ui_release()J

    move-result-wide v38

    .line 471
    const/16 v40, 0x0

    invoke-direct/range {v33 .. v40}, Landroidx/compose/ui/input/pointer/HistoricalChange;-><init>(JJJLkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 470
    move-object/from16 v11, v33

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_c

    .line 469
    :cond_12
    move/from16 v32, v11

    .line 481
    :goto_c
    nop

    .line 864
    .end local v4    # "historicalPosition":J
    .end local v25    # "it":Landroidx/compose/ui/input/pointer/HistoricalChange;
    .end local v26    # "$i$a$-fastForEach-Node$buildCache$2":I
    nop

    .line 862
    .end local v16    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v4, v31, 0x1

    move/from16 v11, v32

    move/from16 v5, v41

    .end local v31    # "index$iv":I
    .local v4, "index$iv":I
    goto :goto_a

    :cond_13
    move/from16 v31, v4

    move/from16 v41, v5

    .line 867
    .end local v4    # "index$iv":I
    nop

    .line 483
    .end local v14    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v15    # "$i$f$fastForEach":I
    iget-object v4, v0, Landroidx/compose/ui/input/pointer/Node;->relevantChanges:Landroidx/collection/LongSparseArray;

    .line 484
    nop

    .line 487
    iget-object v5, v0, Landroidx/compose/ui/input/pointer/Node;->coordinates:Landroidx/compose/ui/layout/LayoutCoordinates;

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v5, v2, v8, v9}, Landroidx/compose/ui/layout/LayoutCoordinates;->localPositionOf-R5De75A(Landroidx/compose/ui/layout/LayoutCoordinates;J)J

    move-result-wide v32

    .line 489
    iget-object v5, v0, Landroidx/compose/ui/input/pointer/Node;->coordinates:Landroidx/compose/ui/layout/LayoutCoordinates;

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v5, v2, v12, v13}, Landroidx/compose/ui/layout/LayoutCoordinates;->localPositionOf-R5De75A(Landroidx/compose/ui/layout/LayoutCoordinates;J)J

    move-result-wide v27

    .line 485
    nop

    .line 489
    nop

    .line 485
    nop

    .line 487
    nop

    .line 485
    nop

    .line 490
    move-object/from16 v36, v10

    check-cast v36, Ljava/util/List;

    .line 485
    const/16 v39, 0x2db

    const/16 v40, 0x0

    const-wide/16 v23, 0x0

    const-wide/16 v25, 0x0

    const/16 v29, 0x0

    const-wide/16 v30, 0x0

    const/16 v34, 0x0

    const/16 v35, 0x0

    const-wide/16 v37, 0x0

    invoke-static/range {v22 .. v40}, Landroidx/compose/ui/input/pointer/PointerInputChange;->copy-OHpmEuE$default(Landroidx/compose/ui/input/pointer/PointerInputChange;JJJZJJZILjava/util/List;JILjava/lang/Object;)Landroidx/compose/ui/input/pointer/PointerInputChange;

    move-result-object v5

    .line 483
    invoke-virtual {v4, v6, v7, v5}, Landroidx/collection/LongSparseArray;->put(JLjava/lang/Object;)V

    goto :goto_d

    .line 459
    .end local v10    # "historical":Ljava/util/ArrayList;
    .end local v20    # "j":I
    .local v4, "j":I
    :cond_14
    move/from16 v20, v4

    move/from16 v41, v5

    .end local v4    # "j":I
    .restart local v20    # "j":I
    goto :goto_d

    .line 455
    .end local v8    # "prevPosition":J
    .end local v12    # "currentPosition":J
    .end local v20    # "j":I
    .restart local v4    # "j":I
    :cond_15
    move/from16 v20, v4

    move/from16 v41, v5

    .line 451
    .end local v4    # "j":I
    .end local v6    # "keyValue":J
    .end local v22    # "change":Landroidx/compose/ui/input/pointer/PointerInputChange;
    .restart local v20    # "j":I
    :goto_d
    add-int/lit8 v4, v20, 0x1

    move/from16 v5, v41

    const/4 v11, 0x0

    .end local v20    # "j":I
    .restart local v4    # "j":I
    goto/16 :goto_7

    :cond_16
    move/from16 v20, v4

    .line 497
    .end local v4    # "j":I
    iget-object v4, v0, Landroidx/compose/ui/input/pointer/Node;->relevantChanges:Landroidx/collection/LongSparseArray;

    invoke-virtual {v4}, Landroidx/collection/LongSparseArray;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_17

    .line 498
    iget-object v4, v0, Landroidx/compose/ui/input/pointer/Node;->pointerIds:Landroidx/compose/ui/input/pointer/util/PointerIdArray;

    invoke-virtual {v4}, Landroidx/compose/ui/input/pointer/util/PointerIdArray;->clear()V

    .line 499
    invoke-virtual {v0}, Landroidx/compose/ui/input/pointer/Node;->getChildren()Landroidx/compose/runtime/collection/MutableVector;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/compose/runtime/collection/MutableVector;->clear()V

    .line 500
    const/16 v19, 0x1

    return v19

    .line 504
    :cond_17
    const/16 v19, 0x1

    iget-object v4, v0, Landroidx/compose/ui/input/pointer/Node;->pointerIds:Landroidx/compose/ui/input/pointer/util/PointerIdArray;

    .local v4, "this_$iv":Landroidx/compose/ui/input/pointer/util/PointerIdArray;
    const/4 v5, 0x0

    .line 868
    .local v5, "$i$f$getLastIndex":I
    invoke-virtual {v4}, Landroidx/compose/ui/input/pointer/util/PointerIdArray;->getSize()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    .line 504
    .end local v4    # "this_$iv":Landroidx/compose/ui/input/pointer/util/PointerIdArray;
    .end local v5    # "$i$f$getLastIndex":I
    nop

    .local v6, "i":I
    :goto_e
    const/4 v4, -0x1

    if-ge v4, v6, :cond_19

    .line 505
    iget-object v4, v0, Landroidx/compose/ui/input/pointer/Node;->pointerIds:Landroidx/compose/ui/input/pointer/util/PointerIdArray;

    invoke-virtual {v4, v6}, Landroidx/compose/ui/input/pointer/util/PointerIdArray;->get-_I2yYro(I)J

    move-result-wide v4

    .line 506
    .local v4, "pointerId":J
    invoke-virtual {v1, v4, v5}, Landroidx/collection/LongSparseArray;->containsKey(J)Z

    move-result v7

    if-nez v7, :cond_18

    .line 507
    iget-object v7, v0, Landroidx/compose/ui/input/pointer/Node;->pointerIds:Landroidx/compose/ui/input/pointer/util/PointerIdArray;

    invoke-virtual {v7, v6}, Landroidx/compose/ui/input/pointer/util/PointerIdArray;->removeAt(I)Z

    .line 504
    .end local v4    # "pointerId":J
    :cond_18
    add-int/lit8 v6, v6, -0x1

    goto :goto_e

    .line 511
    .end local v6    # "i":I
    :cond_19
    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, v0, Landroidx/compose/ui/input/pointer/Node;->relevantChanges:Landroidx/collection/LongSparseArray;

    invoke-virtual {v5}, Landroidx/collection/LongSparseArray;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 512
    .local v4, "changesList":Ljava/util/ArrayList;
    const/4 v5, 0x0

    .local v5, "i":I
    iget-object v6, v0, Landroidx/compose/ui/input/pointer/Node;->relevantChanges:Landroidx/collection/LongSparseArray;

    invoke-virtual {v6}, Landroidx/collection/LongSparseArray;->size()I

    move-result v6

    :goto_f
    if-ge v5, v6, :cond_1a

    .line 513
    iget-object v7, v0, Landroidx/compose/ui/input/pointer/Node;->relevantChanges:Landroidx/collection/LongSparseArray;

    invoke-virtual {v7, v5}, Landroidx/collection/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 512
    add-int/lit8 v5, v5, 0x1

    goto :goto_f

    .line 515
    .end local v5    # "i":I
    :cond_1a
    new-instance v5, Landroidx/compose/ui/input/pointer/PointerEvent;

    move-object v6, v4

    check-cast v6, Ljava/util/List;

    invoke-direct {v5, v6, v3}, Landroidx/compose/ui/input/pointer/PointerEvent;-><init>(Ljava/util/List;Landroidx/compose/ui/input/pointer/InternalPointerEvent;)V

    .line 518
    .local v5, "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    invoke-virtual {v5}, Landroidx/compose/ui/input/pointer/PointerEvent;->getChanges()Ljava/util/List;

    move-result-object v6

    .local v6, "$this$fastFirstOrNull$iv":Ljava/util/List;
    const/4 v7, 0x0

    .line 869
    .local v7, "$i$f$fastFirstOrNull":I
    nop

    .line 870
    move-object v8, v6

    .local v8, "$this$fastForEach$iv$iv":Ljava/util/List;
    const/4 v9, 0x0

    .line 871
    .local v9, "$i$f$fastForEach":I
    nop

    .line 872
    const/4 v10, 0x0

    .local v10, "index$iv$iv":I
    move-object v11, v8

    check-cast v11, Ljava/util/Collection;

    invoke-interface {v11}, Ljava/util/Collection;->size()I

    move-result v11

    :goto_10
    if-ge v10, v11, :cond_1c

    .line 873
    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    .line 874
    .local v12, "item$iv$iv":Ljava/lang/Object;
    move-object v13, v12

    .local v13, "it$iv":Ljava/lang/Object;
    const/4 v14, 0x0

    .line 870
    .local v14, "$i$a$-fastForEach-ListUtilsKt$fastFirstOrNull$2$iv":I
    move-object v15, v13

    check-cast v15, Landroidx/compose/ui/input/pointer/PointerInputChange;

    .local v15, "it":Landroidx/compose/ui/input/pointer/PointerInputChange;
    const/16 v16, 0x0

    .line 518
    .local v16, "$i$a$-fastFirstOrNull-Node$buildCache$activeHoverChange$1":I
    invoke-virtual {v15}, Landroidx/compose/ui/input/pointer/PointerInputChange;->getId-J3iCeTQ()J

    move-result-wide v1

    invoke-virtual {v3, v1, v2}, Landroidx/compose/ui/input/pointer/InternalPointerEvent;->activeHoverEvent-0FcD4WY(J)Z

    move-result v1

    .line 870
    .end local v15    # "it":Landroidx/compose/ui/input/pointer/PointerInputChange;
    .end local v16    # "$i$a$-fastFirstOrNull-Node$buildCache$activeHoverChange$1":I
    if-eqz v1, :cond_1b

    goto :goto_11

    .line 874
    .end local v13    # "it$iv":Ljava/lang/Object;
    .end local v14    # "$i$a$-fastForEach-ListUtilsKt$fastFirstOrNull$2$iv":I
    :cond_1b
    nop

    .line 872
    .end local v12    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    goto :goto_10

    .line 876
    .end local v10    # "index$iv$iv":I
    :cond_1c
    nop

    .line 877
    .end local v8    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v9    # "$i$f$fastForEach":I
    const/4 v13, 0x0

    .line 518
    .end local v6    # "$this$fastFirstOrNull$iv":Ljava/util/List;
    .end local v7    # "$i$f$fastFirstOrNull":I
    :goto_11
    check-cast v13, Landroidx/compose/ui/input/pointer/PointerInputChange;

    .line 517
    nop

    .line 520
    .local v13, "activeHoverChange":Landroidx/compose/ui/input/pointer/PointerInputChange;
    if-eqz v13, :cond_25

    .line 521
    if-nez p4, :cond_1d

    .line 522
    const/4 v1, 0x0

    iput-boolean v1, v0, Landroidx/compose/ui/input/pointer/Node;->isIn:Z

    const/16 v19, 0x1

    goto :goto_13

    .line 523
    :cond_1d
    const/4 v1, 0x0

    iget-boolean v2, v0, Landroidx/compose/ui/input/pointer/Node;->isIn:Z

    if-nez v2, :cond_20

    invoke-virtual {v13}, Landroidx/compose/ui/input/pointer/PointerInputChange;->getPressed()Z

    move-result v2

    if-nez v2, :cond_1f

    invoke-virtual {v13}, Landroidx/compose/ui/input/pointer/PointerInputChange;->getPreviousPressed()Z

    move-result v2

    if-eqz v2, :cond_1e

    goto :goto_12

    :cond_1e
    const/16 v19, 0x1

    goto :goto_13

    .line 525
    :cond_1f
    :goto_12
    iget-object v2, v0, Landroidx/compose/ui/input/pointer/Node;->coordinates:Landroidx/compose/ui/layout/LayoutCoordinates;

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v2}, Landroidx/compose/ui/layout/LayoutCoordinates;->getSize-YbymL2g()J

    move-result-wide v6

    .line 527
    .local v6, "size":J
    invoke-static {v13, v6, v7}, Landroidx/compose/ui/input/pointer/PointerEventKt;->isOutOfBounds-O0kMr_c(Landroidx/compose/ui/input/pointer/PointerInputChange;J)Z

    move-result v2

    const/16 v19, 0x1

    xor-int/lit8 v2, v2, 0x1

    iput-boolean v2, v0, Landroidx/compose/ui/input/pointer/Node;->isIn:Z

    goto :goto_13

    .line 523
    .end local v6    # "size":J
    :cond_20
    const/16 v19, 0x1

    .line 529
    :goto_13
    nop

    .line 530
    iget-boolean v2, v0, Landroidx/compose/ui/input/pointer/Node;->isIn:Z

    iget-boolean v6, v0, Landroidx/compose/ui/input/pointer/Node;->wasIn:Z

    if-eq v2, v6, :cond_23

    .line 531
    invoke-virtual {v5}, Landroidx/compose/ui/input/pointer/PointerEvent;->getType-7fucELk()I

    move-result v2

    sget-object v6, Landroidx/compose/ui/input/pointer/PointerEventType;->Companion:Landroidx/compose/ui/input/pointer/PointerEventType$Companion;

    invoke-virtual {v6}, Landroidx/compose/ui/input/pointer/PointerEventType$Companion;->getMove-7fucELk()I

    move-result v6

    invoke-static {v2, v6}, Landroidx/compose/ui/input/pointer/PointerEventType;->equals-impl0(II)Z

    move-result v2

    if-nez v2, :cond_21

    .line 532
    invoke-virtual {v5}, Landroidx/compose/ui/input/pointer/PointerEvent;->getType-7fucELk()I

    move-result v2

    sget-object v6, Landroidx/compose/ui/input/pointer/PointerEventType;->Companion:Landroidx/compose/ui/input/pointer/PointerEventType$Companion;

    invoke-virtual {v6}, Landroidx/compose/ui/input/pointer/PointerEventType$Companion;->getEnter-7fucELk()I

    move-result v6

    invoke-static {v2, v6}, Landroidx/compose/ui/input/pointer/PointerEventType;->equals-impl0(II)Z

    move-result v2

    if-nez v2, :cond_21

    .line 533
    invoke-virtual {v5}, Landroidx/compose/ui/input/pointer/PointerEvent;->getType-7fucELk()I

    move-result v2

    sget-object v6, Landroidx/compose/ui/input/pointer/PointerEventType;->Companion:Landroidx/compose/ui/input/pointer/PointerEventType$Companion;

    invoke-virtual {v6}, Landroidx/compose/ui/input/pointer/PointerEventType$Companion;->getExit-7fucELk()I

    move-result v6

    invoke-static {v2, v6}, Landroidx/compose/ui/input/pointer/PointerEventType;->equals-impl0(II)Z

    move-result v2

    if-eqz v2, :cond_23

    .line 535
    :cond_21
    nop

    .line 536
    iget-boolean v2, v0, Landroidx/compose/ui/input/pointer/Node;->isIn:Z

    if-eqz v2, :cond_22

    .line 537
    sget-object v2, Landroidx/compose/ui/input/pointer/PointerEventType;->Companion:Landroidx/compose/ui/input/pointer/PointerEventType$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/input/pointer/PointerEventType$Companion;->getEnter-7fucELk()I

    move-result v2

    goto :goto_14

    .line 539
    :cond_22
    sget-object v2, Landroidx/compose/ui/input/pointer/PointerEventType;->Companion:Landroidx/compose/ui/input/pointer/PointerEventType$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/input/pointer/PointerEventType$Companion;->getExit-7fucELk()I

    move-result v2

    .line 535
    :goto_14
    invoke-virtual {v5, v2}, Landroidx/compose/ui/input/pointer/PointerEvent;->setType-EhbLWgg$ui_release(I)V

    goto :goto_15

    .line 541
    :cond_23
    invoke-virtual {v5}, Landroidx/compose/ui/input/pointer/PointerEvent;->getType-7fucELk()I

    move-result v2

    sget-object v6, Landroidx/compose/ui/input/pointer/PointerEventType;->Companion:Landroidx/compose/ui/input/pointer/PointerEventType$Companion;

    invoke-virtual {v6}, Landroidx/compose/ui/input/pointer/PointerEventType$Companion;->getEnter-7fucELk()I

    move-result v6

    invoke-static {v2, v6}, Landroidx/compose/ui/input/pointer/PointerEventType;->equals-impl0(II)Z

    move-result v2

    if-eqz v2, :cond_24

    iget-boolean v2, v0, Landroidx/compose/ui/input/pointer/Node;->wasIn:Z

    if-eqz v2, :cond_24

    iget-boolean v2, v0, Landroidx/compose/ui/input/pointer/Node;->hasExited:Z

    if-nez v2, :cond_24

    .line 542
    sget-object v2, Landroidx/compose/ui/input/pointer/PointerEventType;->Companion:Landroidx/compose/ui/input/pointer/PointerEventType$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/input/pointer/PointerEventType$Companion;->getMove-7fucELk()I

    move-result v2

    invoke-virtual {v5, v2}, Landroidx/compose/ui/input/pointer/PointerEvent;->setType-EhbLWgg$ui_release(I)V

    goto :goto_15

    .line 543
    :cond_24
    invoke-virtual {v5}, Landroidx/compose/ui/input/pointer/PointerEvent;->getType-7fucELk()I

    move-result v2

    sget-object v6, Landroidx/compose/ui/input/pointer/PointerEventType;->Companion:Landroidx/compose/ui/input/pointer/PointerEventType$Companion;

    invoke-virtual {v6}, Landroidx/compose/ui/input/pointer/PointerEventType$Companion;->getExit-7fucELk()I

    move-result v6

    invoke-static {v2, v6}, Landroidx/compose/ui/input/pointer/PointerEventType;->equals-impl0(II)Z

    move-result v2

    if-eqz v2, :cond_26

    iget-boolean v2, v0, Landroidx/compose/ui/input/pointer/Node;->isIn:Z

    if-eqz v2, :cond_26

    invoke-virtual {v13}, Landroidx/compose/ui/input/pointer/PointerInputChange;->getPressed()Z

    move-result v2

    if-eqz v2, :cond_26

    .line 544
    sget-object v2, Landroidx/compose/ui/input/pointer/PointerEventType;->Companion:Landroidx/compose/ui/input/pointer/PointerEventType$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/input/pointer/PointerEventType$Companion;->getMove-7fucELk()I

    move-result v2

    invoke-virtual {v5, v2}, Landroidx/compose/ui/input/pointer/PointerEvent;->setType-EhbLWgg$ui_release(I)V

    goto :goto_15

    .line 520
    :cond_25
    const/4 v1, 0x0

    const/16 v19, 0x1

    .line 549
    :cond_26
    :goto_15
    if-nez v21, :cond_28

    .line 550
    invoke-virtual {v5}, Landroidx/compose/ui/input/pointer/PointerEvent;->getType-7fucELk()I

    move-result v2

    sget-object v6, Landroidx/compose/ui/input/pointer/PointerEventType;->Companion:Landroidx/compose/ui/input/pointer/PointerEventType$Companion;

    invoke-virtual {v6}, Landroidx/compose/ui/input/pointer/PointerEventType$Companion;->getMove-7fucELk()I

    move-result v6

    invoke-static {v2, v6}, Landroidx/compose/ui/input/pointer/PointerEventType;->equals-impl0(II)Z

    move-result v2

    if-eqz v2, :cond_28

    .line 551
    iget-object v2, v0, Landroidx/compose/ui/input/pointer/Node;->pointerEvent:Landroidx/compose/ui/input/pointer/PointerEvent;

    invoke-direct {v0, v2, v5}, Landroidx/compose/ui/input/pointer/Node;->hasPositionChanged(Landroidx/compose/ui/input/pointer/PointerEvent;Landroidx/compose/ui/input/pointer/PointerEvent;)Z

    move-result v2

    if-eqz v2, :cond_27

    goto :goto_16

    :cond_27
    move v6, v1

    goto :goto_17

    :cond_28
    :goto_16
    move/from16 v6, v19

    .line 548
    :goto_17
    nop

    .line 552
    .local v6, "changed":Z
    iput-object v5, v0, Landroidx/compose/ui/input/pointer/Node;->pointerEvent:Landroidx/compose/ui/input/pointer/PointerEvent;

    .line 553
    return v6
.end method

.method public cleanUpHits(Landroidx/compose/ui/input/pointer/InternalPointerEvent;)V
    .locals 18
    .param p1, "internalPointerEvent"    # Landroidx/compose/ui/input/pointer/InternalPointerEvent;

    .line 614
    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Landroidx/compose/ui/input/pointer/NodeParent;->cleanUpHits(Landroidx/compose/ui/input/pointer/InternalPointerEvent;)V

    .line 616
    iget-object v1, v0, Landroidx/compose/ui/input/pointer/Node;->pointerEvent:Landroidx/compose/ui/input/pointer/PointerEvent;

    if-nez v1, :cond_0

    return-void

    .line 618
    .local v1, "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    :cond_0
    iget-boolean v2, v0, Landroidx/compose/ui/input/pointer/Node;->isIn:Z

    iput-boolean v2, v0, Landroidx/compose/ui/input/pointer/Node;->wasIn:Z

    .line 620
    invoke-virtual {v1}, Landroidx/compose/ui/input/pointer/PointerEvent;->getChanges()Ljava/util/List;

    move-result-object v2

    .local v2, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v3, 0x0

    .line 931
    .local v3, "$i$f$fastForEach":I
    nop

    .line 932
    const/4 v4, 0x0

    .local v4, "index$iv":I
    move-object v5, v2

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v5

    :goto_0
    const/4 v6, 0x0

    if-ge v4, v5, :cond_5

    .line 933
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    .line 934
    .local v7, "item$iv":Ljava/lang/Object;
    move-object v8, v7

    check-cast v8, Landroidx/compose/ui/input/pointer/PointerInputChange;

    .local v8, "change":Landroidx/compose/ui/input/pointer/PointerInputChange;
    const/4 v9, 0x0

    .line 624
    .local v9, "$i$a$-fastForEach-Node$cleanUpHits$1":I
    invoke-virtual {v8}, Landroidx/compose/ui/input/pointer/PointerInputChange;->getPressed()Z

    move-result v10

    const/4 v11, 0x1

    xor-int/2addr v10, v11

    .line 625
    .local v10, "released":Z
    invoke-virtual {v8}, Landroidx/compose/ui/input/pointer/PointerInputChange;->getId-J3iCeTQ()J

    move-result-wide v12

    move-object/from16 v14, p1

    invoke-virtual {v14, v12, v13}, Landroidx/compose/ui/input/pointer/InternalPointerEvent;->activeHoverEvent-0FcD4WY(J)Z

    move-result v12

    xor-int/2addr v12, v11

    .line 626
    .local v12, "nonHoverEventStream":Z
    iget-boolean v13, v0, Landroidx/compose/ui/input/pointer/Node;->isIn:Z

    xor-int/2addr v13, v11

    .line 628
    .local v13, "outsideArea":Z
    if-eqz v10, :cond_1

    if-nez v12, :cond_2

    :cond_1
    if-eqz v10, :cond_3

    if-eqz v13, :cond_3

    :cond_2
    move v6, v11

    .line 630
    .local v6, "removePointerId":Z
    :cond_3
    if-eqz v6, :cond_4

    .line 631
    iget-object v11, v0, Landroidx/compose/ui/input/pointer/Node;->pointerIds:Landroidx/compose/ui/input/pointer/util/PointerIdArray;

    move-object v15, v1

    move-object/from16 v16, v2

    .end local v1    # "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    .end local v2    # "$this$fastForEach$iv":Ljava/util/List;
    .local v11, "this_$iv":Landroidx/compose/ui/input/pointer/util/PointerIdArray;
    .local v15, "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    .local v16, "$this$fastForEach$iv":Ljava/util/List;
    invoke-virtual {v8}, Landroidx/compose/ui/input/pointer/PointerInputChange;->getId-J3iCeTQ()J

    move-result-wide v1

    .local v1, "pointerId$iv":J
    const/16 v17, 0x0

    .line 935
    .local v17, "$i$f$remove-0FcD4WY":I
    invoke-virtual {v11, v1, v2}, Landroidx/compose/ui/input/pointer/util/PointerIdArray;->remove(J)Z

    .end local v1    # "pointerId$iv":J
    .end local v11    # "this_$iv":Landroidx/compose/ui/input/pointer/util/PointerIdArray;
    .end local v17    # "$i$f$remove-0FcD4WY":I
    goto :goto_1

    .line 630
    .end local v15    # "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    .end local v16    # "$this$fastForEach$iv":Ljava/util/List;
    .local v1, "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    .restart local v2    # "$this$fastForEach$iv":Ljava/util/List;
    :cond_4
    move-object v15, v1

    move-object/from16 v16, v2

    .line 633
    .end local v1    # "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    .end local v2    # "$this$fastForEach$iv":Ljava/util/List;
    .restart local v15    # "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    .restart local v16    # "$this$fastForEach$iv":Ljava/util/List;
    :goto_1
    nop

    .line 934
    .end local v6    # "removePointerId":Z
    .end local v8    # "change":Landroidx/compose/ui/input/pointer/PointerInputChange;
    .end local v9    # "$i$a$-fastForEach-Node$cleanUpHits$1":I
    .end local v10    # "released":Z
    .end local v12    # "nonHoverEventStream":Z
    .end local v13    # "outsideArea":Z
    nop

    .line 932
    .end local v7    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v4, v4, 0x1

    move-object v1, v15

    move-object/from16 v2, v16

    goto :goto_0

    .end local v15    # "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    .end local v16    # "$this$fastForEach$iv":Ljava/util/List;
    .restart local v1    # "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    .restart local v2    # "$this$fastForEach$iv":Ljava/util/List;
    :cond_5
    move-object v15, v1

    move-object/from16 v16, v2

    .line 936
    .end local v1    # "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    .end local v2    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v4    # "index$iv":I
    .restart local v15    # "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    .restart local v16    # "$this$fastForEach$iv":Ljava/util/List;
    nop

    .line 635
    .end local v3    # "$i$f$fastForEach":I
    .end local v16    # "$this$fastForEach$iv":Ljava/util/List;
    iput-boolean v6, v0, Landroidx/compose/ui/input/pointer/Node;->isIn:Z

    .line 636
    invoke-virtual {v15}, Landroidx/compose/ui/input/pointer/PointerEvent;->getType-7fucELk()I

    move-result v1

    sget-object v2, Landroidx/compose/ui/input/pointer/PointerEventType;->Companion:Landroidx/compose/ui/input/pointer/PointerEventType$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/input/pointer/PointerEventType$Companion;->getExit-7fucELk()I

    move-result v2

    invoke-static {v1, v2}, Landroidx/compose/ui/input/pointer/PointerEventType;->equals-impl0(II)Z

    move-result v1

    iput-boolean v1, v0, Landroidx/compose/ui/input/pointer/Node;->hasExited:Z

    .line 637
    return-void
.end method

.method public dispatchCancel()V
    .locals 17

    .line 605
    invoke-virtual/range {p0 .. p0}, Landroidx/compose/ui/input/pointer/Node;->getChildren()Landroidx/compose/runtime/collection/MutableVector;

    move-result-object v0

    .local v0, "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v1, 0x0

    .line 878
    .local v1, "$i$f$forEach":I
    nop

    .line 879
    const/4 v2, 0x0

    .line 880
    .local v2, "i$iv":I
    iget-object v3, v0, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    .line 881
    .local v3, "content$iv":[Ljava/lang/Object;
    invoke-virtual {v0}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v4

    .line 882
    .local v4, "size$iv":I
    :goto_0
    if-ge v2, v4, :cond_0

    .line 883
    aget-object v5, v3, v2

    check-cast v5, Landroidx/compose/ui/input/pointer/Node;

    .local v5, "it":Landroidx/compose/ui/input/pointer/Node;
    const/4 v6, 0x0

    .line 605
    .local v6, "$i$a$-forEach-Node$dispatchCancel$1":I
    invoke-virtual {v5}, Landroidx/compose/ui/input/pointer/Node;->dispatchCancel()V

    .line 883
    .end local v5    # "it":Landroidx/compose/ui/input/pointer/Node;
    .end local v6    # "$i$a$-forEach-Node$dispatchCancel$1":I
    nop

    .line 884
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 886
    :cond_0
    nop

    .line 606
    .end local v0    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v1    # "$i$f$forEach":I
    .end local v2    # "i$iv":I
    .end local v3    # "content$iv":[Ljava/lang/Object;
    .end local v4    # "size$iv":I
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/compose/ui/input/pointer/Node;->modifierNode:Landroidx/compose/ui/Modifier$Node;

    const/4 v2, 0x0

    .line 887
    .local v2, "$i$f$getPointerInput-OLwlOKw":I
    const/16 v3, 0x10

    invoke-static {v3}, Landroidx/compose/ui/node/NodeKind;->constructor-impl(I)I

    move-result v2

    .line 606
    .end local v2    # "$i$f$getPointerInput-OLwlOKw":I
    nop

    .local v1, "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .local v2, "kind$iv":I
    const/4 v3, 0x0

    .line 888
    .local v3, "$i$f$dispatchForKind-6rFNWt0":I
    const/4 v4, 0x0

    .line 889
    .local v4, "stack$iv":Ljava/lang/Object;
    const/4 v5, 0x0

    .local v5, "node$iv":Ljava/lang/Object;
    move-object v5, v1

    .line 890
    :goto_1
    if-eqz v5, :cond_b

    .line 891
    instance-of v6, v5, Landroidx/compose/ui/node/PointerInputModifierNode;

    if-eqz v6, :cond_1

    .line 892
    move-object v6, v5

    check-cast v6, Landroidx/compose/ui/node/PointerInputModifierNode;

    .local v6, "it":Landroidx/compose/ui/node/PointerInputModifierNode;
    const/4 v7, 0x0

    .line 606
    .local v7, "$i$a$-dispatchForKind-6rFNWt0-Node$dispatchCancel$2":I
    invoke-interface {v6}, Landroidx/compose/ui/node/PointerInputModifierNode;->onCancelPointerInput()V

    .line 892
    .end local v6    # "it":Landroidx/compose/ui/node/PointerInputModifierNode;
    .end local v7    # "$i$a$-dispatchForKind-6rFNWt0-Node$dispatchCancel$2":I
    goto/16 :goto_7

    .line 893
    :cond_1
    move-object v6, v5

    .local v6, "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    const/4 v7, 0x0

    .line 894
    .local v7, "$i$f$isKind-H91voCI$ui_release":I
    invoke-virtual {v6}, Landroidx/compose/ui/Modifier$Node;->getKindSet$ui_release()I

    move-result v8

    and-int/2addr v8, v2

    const/4 v9, 0x0

    const/4 v10, 0x1

    if-eqz v8, :cond_2

    move v6, v10

    goto :goto_2

    :cond_2
    move v6, v9

    .line 893
    .end local v6    # "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v7    # "$i$f$isKind-H91voCI$ui_release":I
    :goto_2
    if-eqz v6, :cond_a

    instance-of v6, v5, Landroidx/compose/ui/node/DelegatingNode;

    if-eqz v6, :cond_a

    .line 895
    const/4 v6, 0x0

    .line 896
    .local v6, "count$iv":I
    move-object v7, v5

    check-cast v7, Landroidx/compose/ui/node/DelegatingNode;

    .local v7, "this_$iv$iv":Landroidx/compose/ui/node/DelegatingNode;
    const/4 v8, 0x0

    .line 897
    .local v8, "$i$f$forEachImmediateDelegate$ui_release":I
    invoke-virtual {v7}, Landroidx/compose/ui/node/DelegatingNode;->getDelegate$ui_release()Landroidx/compose/ui/Modifier$Node;

    move-result-object v11

    .line 898
    .local v11, "node$iv$iv":Landroidx/compose/ui/Modifier$Node;
    :goto_3
    if-eqz v11, :cond_9

    .line 899
    move-object v12, v11

    .local v12, "next$iv":Landroidx/compose/ui/Modifier$Node;
    const/4 v13, 0x0

    .line 900
    .local v13, "$i$a$-forEachImmediateDelegate$ui_release-DelegatableNodeKt$dispatchForKind$1$iv":I
    move-object v14, v12

    .local v14, "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    const/4 v15, 0x0

    .line 894
    .local v15, "$i$f$isKind-H91voCI$ui_release":I
    invoke-virtual {v14}, Landroidx/compose/ui/Modifier$Node;->getKindSet$ui_release()I

    move-result v16

    and-int v16, v16, v2

    if-eqz v16, :cond_3

    move v14, v10

    goto :goto_4

    :cond_3
    move v14, v9

    .line 900
    .end local v14    # "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v15    # "$i$f$isKind-H91voCI$ui_release":I
    :goto_4
    if-eqz v14, :cond_8

    .line 901
    add-int/lit8 v6, v6, 0x1

    .line 902
    if-ne v6, v10, :cond_4

    .line 903
    move-object v5, v12

    goto :goto_6

    .line 907
    :cond_4
    if-nez v4, :cond_5

    const/4 v14, 0x0

    .line 908
    .local v14, "$i$f$mutableVectorOf":I
    nop

    .line 909
    const/16 v15, 0x10

    .local v15, "capacity$iv$iv$iv":I
    const/16 v16, 0x0

    .line 910
    .local v16, "$i$f$MutableVector":I
    new-instance v10, Landroidx/compose/runtime/collection/MutableVector;

    new-array v0, v15, [Landroidx/compose/ui/Modifier$Node;

    invoke-direct {v10, v0, v9}, Landroidx/compose/runtime/collection/MutableVector;-><init>([Ljava/lang/Object;I)V

    .line 908
    .end local v15    # "capacity$iv$iv$iv":I
    .end local v16    # "$i$f$MutableVector":I
    goto :goto_5

    .line 907
    .end local v14    # "$i$f$mutableVectorOf":I
    :cond_5
    move-object v10, v4

    :goto_5
    move-object v4, v10

    .line 911
    move-object v0, v5

    .line 912
    .local v0, "theNode$iv":Landroidx/compose/ui/Modifier$Node;
    if-eqz v0, :cond_7

    .line 913
    if-eqz v4, :cond_6

    invoke-virtual {v4, v0}, Landroidx/compose/runtime/collection/MutableVector;->add(Ljava/lang/Object;)Z

    .line 914
    :cond_6
    const/4 v5, 0x0

    .line 916
    :cond_7
    if-eqz v4, :cond_8

    invoke-virtual {v4, v12}, Landroidx/compose/runtime/collection/MutableVector;->add(Ljava/lang/Object;)Z

    .line 919
    .end local v0    # "theNode$iv":Landroidx/compose/ui/Modifier$Node;
    :cond_8
    :goto_6
    nop

    .line 899
    .end local v12    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v13    # "$i$a$-forEachImmediateDelegate$ui_release-DelegatableNodeKt$dispatchForKind$1$iv":I
    nop

    .line 920
    invoke-virtual {v11}, Landroidx/compose/ui/Modifier$Node;->getChild$ui_release()Landroidx/compose/ui/Modifier$Node;

    move-result-object v11

    const/4 v10, 0x1

    move-object/from16 v0, p0

    goto :goto_3

    .line 922
    :cond_9
    nop

    .line 923
    .end local v7    # "this_$iv$iv":Landroidx/compose/ui/node/DelegatingNode;
    .end local v8    # "$i$f$forEachImmediateDelegate$ui_release":I
    .end local v11    # "node$iv$iv":Landroidx/compose/ui/Modifier$Node;
    const/4 v0, 0x1

    if-ne v6, v0, :cond_a

    .line 925
    move-object/from16 v0, p0

    goto :goto_1

    .line 928
    .end local v6    # "count$iv":I
    :cond_a
    :goto_7
    invoke-static {v4}, Landroidx/compose/ui/node/DelegatableNodeKt;->access$pop(Landroidx/compose/runtime/collection/MutableVector;)Landroidx/compose/ui/Modifier$Node;

    move-result-object v5

    move-object/from16 v0, p0

    goto :goto_1

    .line 930
    :cond_b
    nop

    .line 607
    .end local v1    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v2    # "kind$iv":I
    .end local v3    # "$i$f$dispatchForKind-6rFNWt0":I
    .end local v4    # "stack$iv":Ljava/lang/Object;
    .end local v5    # "node$iv":Ljava/lang/Object;
    return-void
.end method

.method public dispatchFinalEventPass(Landroidx/compose/ui/input/pointer/InternalPointerEvent;)Z
    .locals 25
    .param p1, "internalPointerEvent"    # Landroidx/compose/ui/input/pointer/InternalPointerEvent;

    .line 404
    move-object/from16 v0, p0

    move-object/from16 v1, p0

    .local v1, "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    const/4 v2, 0x0

    .line 756
    .local v2, "$i$f$dispatchIfNeeded":I
    iget-object v3, v1, Landroidx/compose/ui/input/pointer/Node;->relevantChanges:Landroidx/collection/LongSparseArray;

    invoke-virtual {v3}, Landroidx/collection/LongSparseArray;->isEmpty()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    move-object/from16 v13, p1

    goto/16 :goto_9

    .line 758
    :cond_0
    iget-object v3, v1, Landroidx/compose/ui/input/pointer/Node;->modifierNode:Landroidx/compose/ui/Modifier$Node;

    invoke-virtual {v3}, Landroidx/compose/ui/Modifier$Node;->isAttached()Z

    move-result v3

    if-nez v3, :cond_1

    move-object/from16 v13, p1

    goto/16 :goto_9

    .line 760
    :cond_1
    const/4 v3, 0x0

    .line 405
    .local v3, "$i$a$-dispatchIfNeeded-Node$dispatchFinalEventPass$result$1":I
    iget-object v5, v0, Landroidx/compose/ui/input/pointer/Node;->pointerEvent:Landroidx/compose/ui/input/pointer/PointerEvent;

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 406
    .local v5, "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    iget-object v6, v0, Landroidx/compose/ui/input/pointer/Node;->coordinates:Landroidx/compose/ui/layout/LayoutCoordinates;

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v6}, Landroidx/compose/ui/layout/LayoutCoordinates;->getSize-YbymL2g()J

    move-result-wide v6

    .line 408
    .local v6, "size":J
    iget-object v8, v0, Landroidx/compose/ui/input/pointer/Node;->modifierNode:Landroidx/compose/ui/Modifier$Node;

    const/4 v9, 0x0

    .line 761
    .local v9, "$i$f$getPointerInput-OLwlOKw":I
    const/16 v10, 0x10

    invoke-static {v10}, Landroidx/compose/ui/node/NodeKind;->constructor-impl(I)I

    move-result v9

    .line 408
    .end local v9    # "$i$f$getPointerInput-OLwlOKw":I
    nop

    .local v8, "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .local v9, "kind$iv":I
    const/4 v10, 0x0

    .line 762
    .local v10, "$i$f$dispatchForKind-6rFNWt0":I
    const/4 v11, 0x0

    .line 763
    .local v11, "stack$iv":Ljava/lang/Object;
    const/4 v12, 0x0

    .local v12, "node$iv":Ljava/lang/Object;
    move-object v12, v8

    .line 764
    :goto_0
    const/4 v13, 0x1

    if-eqz v12, :cond_e

    .line 765
    instance-of v14, v12, Landroidx/compose/ui/node/PointerInputModifierNode;

    if-eqz v14, :cond_2

    .line 766
    move-object v13, v12

    check-cast v13, Landroidx/compose/ui/node/PointerInputModifierNode;

    .local v13, "it":Landroidx/compose/ui/node/PointerInputModifierNode;
    const/4 v14, 0x0

    .line 409
    .local v14, "$i$a$-dispatchForKind-6rFNWt0-Node$dispatchFinalEventPass$result$1$1":I
    sget-object v15, Landroidx/compose/ui/input/pointer/PointerEventPass;->Final:Landroidx/compose/ui/input/pointer/PointerEventPass;

    invoke-interface {v13, v5, v15, v6, v7}, Landroidx/compose/ui/node/PointerInputModifierNode;->onPointerEvent-H0pRuoY(Landroidx/compose/ui/input/pointer/PointerEvent;Landroidx/compose/ui/input/pointer/PointerEventPass;J)V

    .line 410
    nop

    .line 766
    .end local v13    # "it":Landroidx/compose/ui/node/PointerInputModifierNode;
    .end local v14    # "$i$a$-dispatchForKind-6rFNWt0-Node$dispatchFinalEventPass$result$1$1":I
    move-object/from16 v23, v1

    move/from16 v24, v2

    goto/16 :goto_6

    .line 767
    :cond_2
    move-object v14, v12

    .local v14, "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    const/4 v15, 0x0

    .line 768
    .local v15, "$i$f$isKind-H91voCI$ui_release":I
    invoke-virtual {v14}, Landroidx/compose/ui/Modifier$Node;->getKindSet$ui_release()I

    move-result v16

    and-int v16, v16, v9

    if-eqz v16, :cond_3

    move v14, v13

    goto :goto_1

    :cond_3
    move v14, v4

    .line 767
    .end local v14    # "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v15    # "$i$f$isKind-H91voCI$ui_release":I
    :goto_1
    if-eqz v14, :cond_c

    instance-of v14, v12, Landroidx/compose/ui/node/DelegatingNode;

    if-eqz v14, :cond_c

    .line 769
    const/4 v14, 0x0

    .line 770
    .local v14, "count$iv":I
    move-object v15, v12

    check-cast v15, Landroidx/compose/ui/node/DelegatingNode;

    .local v15, "this_$iv$iv":Landroidx/compose/ui/node/DelegatingNode;
    const/16 v16, 0x0

    .line 771
    .local v16, "$i$f$forEachImmediateDelegate$ui_release":I
    invoke-virtual {v15}, Landroidx/compose/ui/node/DelegatingNode;->getDelegate$ui_release()Landroidx/compose/ui/Modifier$Node;

    move-result-object v17

    .line 772
    .local v17, "node$iv$iv":Landroidx/compose/ui/Modifier$Node;
    :goto_2
    if-eqz v17, :cond_b

    .line 773
    move-object/from16 v18, v17

    .local v18, "next$iv":Landroidx/compose/ui/Modifier$Node;
    const/16 v19, 0x0

    .line 774
    .local v19, "$i$a$-forEachImmediateDelegate$ui_release-DelegatableNodeKt$dispatchForKind$1$iv":I
    move-object/from16 v20, v18

    .local v20, "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    const/16 v21, 0x0

    .line 768
    .local v21, "$i$f$isKind-H91voCI$ui_release":I
    invoke-virtual/range {v20 .. v20}, Landroidx/compose/ui/Modifier$Node;->getKindSet$ui_release()I

    move-result v22

    and-int v22, v22, v9

    if-eqz v22, :cond_4

    move/from16 v20, v13

    goto :goto_3

    :cond_4
    move/from16 v20, v4

    .line 774
    .end local v20    # "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v21    # "$i$f$isKind-H91voCI$ui_release":I
    :goto_3
    if-eqz v20, :cond_a

    .line 775
    add-int/lit8 v14, v14, 0x1

    .line 776
    if-ne v14, v13, :cond_5

    .line 777
    move-object/from16 v12, v18

    move-object/from16 v23, v1

    move/from16 v24, v2

    move-object/from16 v2, v18

    goto :goto_5

    .line 781
    :cond_5
    if-nez v11, :cond_6

    const/16 v20, 0x0

    .line 782
    .local v20, "$i$f$mutableVectorOf":I
    nop

    .line 783
    const/16 v13, 0x10

    .local v13, "capacity$iv$iv$iv":I
    const/16 v22, 0x0

    .line 784
    .local v22, "$i$f$MutableVector":I
    move-object/from16 v23, v1

    .end local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .local v23, "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    new-instance v1, Landroidx/compose/runtime/collection/MutableVector;

    move/from16 v24, v2

    .end local v2    # "$i$f$dispatchIfNeeded":I
    .local v24, "$i$f$dispatchIfNeeded":I
    new-array v2, v13, [Landroidx/compose/ui/Modifier$Node;

    invoke-direct {v1, v2, v4}, Landroidx/compose/runtime/collection/MutableVector;-><init>([Ljava/lang/Object;I)V

    .line 782
    .end local v13    # "capacity$iv$iv$iv":I
    .end local v22    # "$i$f$MutableVector":I
    goto :goto_4

    .line 781
    .end local v20    # "$i$f$mutableVectorOf":I
    .end local v23    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v24    # "$i$f$dispatchIfNeeded":I
    .restart local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v2    # "$i$f$dispatchIfNeeded":I
    :cond_6
    move-object/from16 v23, v1

    move/from16 v24, v2

    .end local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v2    # "$i$f$dispatchIfNeeded":I
    .restart local v23    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v24    # "$i$f$dispatchIfNeeded":I
    move-object v1, v11

    :goto_4
    move-object v11, v1

    .line 785
    move-object v1, v12

    .line 786
    .local v1, "theNode$iv":Landroidx/compose/ui/Modifier$Node;
    if-eqz v1, :cond_8

    .line 787
    if-eqz v11, :cond_7

    invoke-virtual {v11, v1}, Landroidx/compose/runtime/collection/MutableVector;->add(Ljava/lang/Object;)Z

    .line 788
    :cond_7
    const/4 v2, 0x0

    move-object v12, v2

    .line 790
    :cond_8
    if-eqz v11, :cond_9

    move-object/from16 v2, v18

    .end local v18    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .local v2, "next$iv":Landroidx/compose/ui/Modifier$Node;
    invoke-virtual {v11, v2}, Landroidx/compose/runtime/collection/MutableVector;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .end local v2    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v18    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    :cond_9
    move-object/from16 v2, v18

    .end local v18    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v2    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    goto :goto_5

    .line 774
    .end local v23    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v24    # "$i$f$dispatchIfNeeded":I
    .local v1, "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .local v2, "$i$f$dispatchIfNeeded":I
    .restart local v18    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    :cond_a
    move-object/from16 v23, v1

    move/from16 v24, v2

    move-object/from16 v2, v18

    .line 793
    .end local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v18    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .local v2, "next$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v23    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v24    # "$i$f$dispatchIfNeeded":I
    :goto_5
    nop

    .line 773
    .end local v2    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v19    # "$i$a$-forEachImmediateDelegate$ui_release-DelegatableNodeKt$dispatchForKind$1$iv":I
    nop

    .line 794
    invoke-virtual/range {v17 .. v17}, Landroidx/compose/ui/Modifier$Node;->getChild$ui_release()Landroidx/compose/ui/Modifier$Node;

    move-result-object v17

    move-object/from16 v1, v23

    move/from16 v2, v24

    const/4 v13, 0x1

    goto :goto_2

    .line 796
    .end local v23    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v24    # "$i$f$dispatchIfNeeded":I
    .restart local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .local v2, "$i$f$dispatchIfNeeded":I
    :cond_b
    move-object/from16 v23, v1

    move/from16 v24, v2

    .line 797
    .end local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v2    # "$i$f$dispatchIfNeeded":I
    .end local v15    # "this_$iv$iv":Landroidx/compose/ui/node/DelegatingNode;
    .end local v16    # "$i$f$forEachImmediateDelegate$ui_release":I
    .end local v17    # "node$iv$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v23    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v24    # "$i$f$dispatchIfNeeded":I
    const/4 v1, 0x1

    if-ne v14, v1, :cond_d

    .line 799
    move-object/from16 v1, v23

    move/from16 v2, v24

    goto/16 :goto_0

    .line 767
    .end local v14    # "count$iv":I
    .end local v23    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v24    # "$i$f$dispatchIfNeeded":I
    .restart local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v2    # "$i$f$dispatchIfNeeded":I
    :cond_c
    move-object/from16 v23, v1

    move/from16 v24, v2

    .line 802
    .end local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v2    # "$i$f$dispatchIfNeeded":I
    .restart local v23    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v24    # "$i$f$dispatchIfNeeded":I
    :cond_d
    :goto_6
    invoke-static {v11}, Landroidx/compose/ui/node/DelegatableNodeKt;->access$pop(Landroidx/compose/runtime/collection/MutableVector;)Landroidx/compose/ui/Modifier$Node;

    move-result-object v12

    move-object/from16 v1, v23

    move/from16 v2, v24

    goto/16 :goto_0

    .line 804
    .end local v23    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v24    # "$i$f$dispatchIfNeeded":I
    .restart local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v2    # "$i$f$dispatchIfNeeded":I
    :cond_e
    move-object/from16 v23, v1

    move/from16 v24, v2

    move v1, v13

    .line 413
    .end local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v2    # "$i$f$dispatchIfNeeded":I
    .end local v8    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v9    # "kind$iv":I
    .end local v10    # "$i$f$dispatchForKind-6rFNWt0":I
    .end local v11    # "stack$iv":Ljava/lang/Object;
    .end local v12    # "node$iv":Ljava/lang/Object;
    .restart local v23    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v24    # "$i$f$dispatchIfNeeded":I
    iget-object v2, v0, Landroidx/compose/ui/input/pointer/Node;->modifierNode:Landroidx/compose/ui/Modifier$Node;

    invoke-virtual {v2}, Landroidx/compose/ui/Modifier$Node;->isAttached()Z

    move-result v2

    if-eqz v2, :cond_10

    .line 414
    invoke-virtual {v0}, Landroidx/compose/ui/input/pointer/Node;->getChildren()Landroidx/compose/runtime/collection/MutableVector;

    move-result-object v2

    .local v2, "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v4, 0x0

    .line 805
    .local v4, "$i$f$forEach":I
    nop

    .line 806
    const/4 v8, 0x0

    .line 807
    .local v8, "i$iv":I
    iget-object v9, v2, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    .line 808
    .local v9, "content$iv":[Ljava/lang/Object;
    invoke-virtual {v2}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v10

    .line 809
    .local v10, "size$iv":I
    :goto_7
    if-ge v8, v10, :cond_f

    .line 810
    aget-object v11, v9, v8

    check-cast v11, Landroidx/compose/ui/input/pointer/Node;

    .local v11, "it":Landroidx/compose/ui/input/pointer/Node;
    const/4 v12, 0x0

    .line 414
    .local v12, "$i$a$-forEach-Node$dispatchFinalEventPass$result$1$2":I
    move-object/from16 v13, p1

    invoke-virtual {v11, v13}, Landroidx/compose/ui/input/pointer/Node;->dispatchFinalEventPass(Landroidx/compose/ui/input/pointer/InternalPointerEvent;)Z

    .line 810
    .end local v11    # "it":Landroidx/compose/ui/input/pointer/Node;
    .end local v12    # "$i$a$-forEach-Node$dispatchFinalEventPass$result$1$2":I
    nop

    .line 811
    add-int/lit8 v8, v8, 0x1

    goto :goto_7

    .line 813
    :cond_f
    move-object/from16 v13, p1

    goto :goto_8

    .line 413
    .end local v2    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v4    # "$i$f$forEach":I
    .end local v8    # "i$iv":I
    .end local v9    # "content$iv":[Ljava/lang/Object;
    .end local v10    # "size$iv":I
    :cond_10
    move-object/from16 v13, p1

    .line 416
    :goto_8
    nop

    .line 760
    .end local v3    # "$i$a$-dispatchIfNeeded-Node$dispatchFinalEventPass$result$1":I
    .end local v5    # "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    .end local v6    # "size":J
    nop

    .line 814
    move v4, v1

    .line 404
    .end local v23    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v24    # "$i$f$dispatchIfNeeded":I
    :goto_9
    nop

    .line 417
    .local v4, "result":Z
    invoke-virtual/range {p0 .. p1}, Landroidx/compose/ui/input/pointer/Node;->cleanUpHits(Landroidx/compose/ui/input/pointer/InternalPointerEvent;)V

    .line 418
    invoke-direct {v0}, Landroidx/compose/ui/input/pointer/Node;->clearCache()V

    .line 419
    return v4
.end method

.method public dispatchMainEventPass(Landroidx/collection/LongSparseArray;Landroidx/compose/ui/layout/LayoutCoordinates;Landroidx/compose/ui/input/pointer/InternalPointerEvent;Z)Z
    .locals 27
    .param p1, "changes"    # Landroidx/collection/LongSparseArray;
    .param p2, "parentCoordinates"    # Landroidx/compose/ui/layout/LayoutCoordinates;
    .param p3, "internalPointerEvent"    # Landroidx/compose/ui/input/pointer/InternalPointerEvent;
    .param p4, "isInBounds"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/collection/LongSparseArray<",
            "Landroidx/compose/ui/input/pointer/PointerInputChange;",
            ">;",
            "Landroidx/compose/ui/layout/LayoutCoordinates;",
            "Landroidx/compose/ui/input/pointer/InternalPointerEvent;",
            "Z)Z"
        }
    .end annotation

    .line 365
    move-object/from16 v0, p0

    move-object/from16 v1, p0

    .local v1, "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    const/4 v2, 0x0

    .line 653
    .local v2, "$i$f$dispatchIfNeeded":I
    iget-object v3, v1, Landroidx/compose/ui/input/pointer/Node;->relevantChanges:Landroidx/collection/LongSparseArray;

    invoke-virtual {v3}, Landroidx/collection/LongSparseArray;->isEmpty()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    move-object/from16 v15, p3

    move v1, v4

    move/from16 v4, p4

    goto/16 :goto_11

    .line 655
    :cond_0
    iget-object v3, v1, Landroidx/compose/ui/input/pointer/Node;->modifierNode:Landroidx/compose/ui/Modifier$Node;

    invoke-virtual {v3}, Landroidx/compose/ui/Modifier$Node;->isAttached()Z

    move-result v3

    if-nez v3, :cond_1

    move-object/from16 v15, p3

    move v1, v4

    move/from16 v4, p4

    goto/16 :goto_11

    .line 657
    :cond_1
    const/4 v3, 0x0

    .line 366
    .local v3, "$i$a$-dispatchIfNeeded-Node$dispatchMainEventPass$1":I
    iget-object v5, v0, Landroidx/compose/ui/input/pointer/Node;->pointerEvent:Landroidx/compose/ui/input/pointer/PointerEvent;

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 367
    .local v5, "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    iget-object v6, v0, Landroidx/compose/ui/input/pointer/Node;->coordinates:Landroidx/compose/ui/layout/LayoutCoordinates;

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v6}, Landroidx/compose/ui/layout/LayoutCoordinates;->getSize-YbymL2g()J

    move-result-wide v6

    .line 370
    .local v6, "size":J
    iget-object v8, v0, Landroidx/compose/ui/input/pointer/Node;->modifierNode:Landroidx/compose/ui/Modifier$Node;

    const/4 v9, 0x0

    .line 658
    .local v9, "$i$f$getPointerInput-OLwlOKw":I
    const/16 v10, 0x10

    invoke-static {v10}, Landroidx/compose/ui/node/NodeKind;->constructor-impl(I)I

    move-result v9

    .line 370
    .end local v9    # "$i$f$getPointerInput-OLwlOKw":I
    nop

    .local v8, "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .local v9, "kind$iv":I
    const/4 v11, 0x0

    .line 659
    .local v11, "$i$f$dispatchForKind-6rFNWt0":I
    const/4 v12, 0x0

    .line 660
    .local v12, "stack$iv":Ljava/lang/Object;
    const/4 v13, 0x0

    .local v13, "node$iv":Ljava/lang/Object;
    move-object v13, v8

    .line 661
    :goto_0
    const/4 v14, 0x1

    if-eqz v13, :cond_e

    .line 662
    instance-of v15, v13, Landroidx/compose/ui/node/PointerInputModifierNode;

    if-eqz v15, :cond_2

    .line 663
    move-object v14, v13

    check-cast v14, Landroidx/compose/ui/node/PointerInputModifierNode;

    .local v14, "it":Landroidx/compose/ui/node/PointerInputModifierNode;
    const/4 v15, 0x0

    .line 371
    .local v15, "$i$a$-dispatchForKind-6rFNWt0-Node$dispatchMainEventPass$1$1":I
    move/from16 v16, v10

    sget-object v10, Landroidx/compose/ui/input/pointer/PointerEventPass;->Initial:Landroidx/compose/ui/input/pointer/PointerEventPass;

    invoke-interface {v14, v5, v10, v6, v7}, Landroidx/compose/ui/node/PointerInputModifierNode;->onPointerEvent-H0pRuoY(Landroidx/compose/ui/input/pointer/PointerEvent;Landroidx/compose/ui/input/pointer/PointerEventPass;J)V

    .line 372
    nop

    .line 663
    .end local v14    # "it":Landroidx/compose/ui/node/PointerInputModifierNode;
    .end local v15    # "$i$a$-dispatchForKind-6rFNWt0-Node$dispatchMainEventPass$1$1":I
    move-object/from16 v24, v1

    move/from16 v25, v2

    goto/16 :goto_6

    .line 664
    :cond_2
    move/from16 v16, v10

    move-object v10, v13

    .local v10, "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    const/4 v15, 0x0

    .line 665
    .local v15, "$i$f$isKind-H91voCI$ui_release":I
    invoke-virtual {v10}, Landroidx/compose/ui/Modifier$Node;->getKindSet$ui_release()I

    move-result v17

    and-int v17, v17, v9

    if-eqz v17, :cond_3

    move v10, v14

    goto :goto_1

    :cond_3
    move v10, v4

    .line 664
    .end local v10    # "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v15    # "$i$f$isKind-H91voCI$ui_release":I
    :goto_1
    if-eqz v10, :cond_c

    instance-of v10, v13, Landroidx/compose/ui/node/DelegatingNode;

    if-eqz v10, :cond_c

    .line 666
    const/4 v10, 0x0

    .line 667
    .local v10, "count$iv":I
    move-object v15, v13

    check-cast v15, Landroidx/compose/ui/node/DelegatingNode;

    .local v15, "this_$iv$iv":Landroidx/compose/ui/node/DelegatingNode;
    const/16 v17, 0x0

    .line 668
    .local v17, "$i$f$forEachImmediateDelegate$ui_release":I
    invoke-virtual {v15}, Landroidx/compose/ui/node/DelegatingNode;->getDelegate$ui_release()Landroidx/compose/ui/Modifier$Node;

    move-result-object v18

    .line 669
    .local v18, "node$iv$iv":Landroidx/compose/ui/Modifier$Node;
    :goto_2
    if-eqz v18, :cond_b

    .line 670
    move-object/from16 v19, v18

    .local v19, "next$iv":Landroidx/compose/ui/Modifier$Node;
    const/16 v20, 0x0

    .line 671
    .local v20, "$i$a$-forEachImmediateDelegate$ui_release-DelegatableNodeKt$dispatchForKind$1$iv":I
    move-object/from16 v21, v19

    .local v21, "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    const/16 v22, 0x0

    .line 665
    .local v22, "$i$f$isKind-H91voCI$ui_release":I
    invoke-virtual/range {v21 .. v21}, Landroidx/compose/ui/Modifier$Node;->getKindSet$ui_release()I

    move-result v23

    and-int v23, v23, v9

    if-eqz v23, :cond_4

    move/from16 v21, v14

    goto :goto_3

    :cond_4
    move/from16 v21, v4

    .line 671
    .end local v21    # "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v22    # "$i$f$isKind-H91voCI$ui_release":I
    :goto_3
    if-eqz v21, :cond_a

    .line 672
    add-int/lit8 v10, v10, 0x1

    .line 673
    if-ne v10, v14, :cond_5

    .line 674
    move-object/from16 v13, v19

    move-object/from16 v24, v1

    move/from16 v25, v2

    move-object/from16 v2, v19

    goto :goto_5

    .line 678
    :cond_5
    if-nez v12, :cond_6

    const/16 v21, 0x0

    .line 679
    .local v21, "$i$f$mutableVectorOf":I
    nop

    .line 680
    const/16 v14, 0x10

    .local v14, "capacity$iv$iv$iv":I
    const/16 v23, 0x0

    .line 681
    .local v23, "$i$f$MutableVector":I
    move-object/from16 v24, v1

    .end local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .local v24, "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    new-instance v1, Landroidx/compose/runtime/collection/MutableVector;

    move/from16 v25, v2

    .end local v2    # "$i$f$dispatchIfNeeded":I
    .local v25, "$i$f$dispatchIfNeeded":I
    new-array v2, v14, [Landroidx/compose/ui/Modifier$Node;

    invoke-direct {v1, v2, v4}, Landroidx/compose/runtime/collection/MutableVector;-><init>([Ljava/lang/Object;I)V

    .line 679
    .end local v14    # "capacity$iv$iv$iv":I
    .end local v23    # "$i$f$MutableVector":I
    goto :goto_4

    .line 678
    .end local v21    # "$i$f$mutableVectorOf":I
    .end local v24    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v25    # "$i$f$dispatchIfNeeded":I
    .restart local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v2    # "$i$f$dispatchIfNeeded":I
    :cond_6
    move-object/from16 v24, v1

    move/from16 v25, v2

    .end local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v2    # "$i$f$dispatchIfNeeded":I
    .restart local v24    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v25    # "$i$f$dispatchIfNeeded":I
    move-object v1, v12

    :goto_4
    move-object v12, v1

    .line 682
    move-object v1, v13

    .line 683
    .local v1, "theNode$iv":Landroidx/compose/ui/Modifier$Node;
    if-eqz v1, :cond_8

    .line 684
    if-eqz v12, :cond_7

    invoke-virtual {v12, v1}, Landroidx/compose/runtime/collection/MutableVector;->add(Ljava/lang/Object;)Z

    .line 685
    :cond_7
    const/4 v2, 0x0

    move-object v13, v2

    .line 687
    :cond_8
    if-eqz v12, :cond_9

    move-object/from16 v2, v19

    .end local v19    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .local v2, "next$iv":Landroidx/compose/ui/Modifier$Node;
    invoke-virtual {v12, v2}, Landroidx/compose/runtime/collection/MutableVector;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .end local v2    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v19    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    :cond_9
    move-object/from16 v2, v19

    .end local v19    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v2    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    goto :goto_5

    .line 671
    .end local v24    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v25    # "$i$f$dispatchIfNeeded":I
    .local v1, "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .local v2, "$i$f$dispatchIfNeeded":I
    .restart local v19    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    :cond_a
    move-object/from16 v24, v1

    move/from16 v25, v2

    move-object/from16 v2, v19

    .line 690
    .end local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v19    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .local v2, "next$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v24    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v25    # "$i$f$dispatchIfNeeded":I
    :goto_5
    nop

    .line 670
    .end local v2    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v20    # "$i$a$-forEachImmediateDelegate$ui_release-DelegatableNodeKt$dispatchForKind$1$iv":I
    nop

    .line 691
    invoke-virtual/range {v18 .. v18}, Landroidx/compose/ui/Modifier$Node;->getChild$ui_release()Landroidx/compose/ui/Modifier$Node;

    move-result-object v18

    move-object/from16 v1, v24

    move/from16 v2, v25

    const/4 v14, 0x1

    goto :goto_2

    .line 693
    .end local v24    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v25    # "$i$f$dispatchIfNeeded":I
    .restart local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .local v2, "$i$f$dispatchIfNeeded":I
    :cond_b
    move-object/from16 v24, v1

    move/from16 v25, v2

    .line 694
    .end local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v2    # "$i$f$dispatchIfNeeded":I
    .end local v15    # "this_$iv$iv":Landroidx/compose/ui/node/DelegatingNode;
    .end local v17    # "$i$f$forEachImmediateDelegate$ui_release":I
    .end local v18    # "node$iv$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v24    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v25    # "$i$f$dispatchIfNeeded":I
    const/4 v1, 0x1

    if-ne v10, v1, :cond_d

    .line 696
    move/from16 v10, v16

    move-object/from16 v1, v24

    move/from16 v2, v25

    goto/16 :goto_0

    .line 664
    .end local v10    # "count$iv":I
    .end local v24    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v25    # "$i$f$dispatchIfNeeded":I
    .restart local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v2    # "$i$f$dispatchIfNeeded":I
    :cond_c
    move-object/from16 v24, v1

    move/from16 v25, v2

    .line 699
    .end local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v2    # "$i$f$dispatchIfNeeded":I
    .restart local v24    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v25    # "$i$f$dispatchIfNeeded":I
    :cond_d
    :goto_6
    invoke-static {v12}, Landroidx/compose/ui/node/DelegatableNodeKt;->access$pop(Landroidx/compose/runtime/collection/MutableVector;)Landroidx/compose/ui/Modifier$Node;

    move-result-object v13

    move/from16 v10, v16

    move-object/from16 v1, v24

    move/from16 v2, v25

    goto/16 :goto_0

    .line 701
    .end local v24    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v25    # "$i$f$dispatchIfNeeded":I
    .restart local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v2    # "$i$f$dispatchIfNeeded":I
    :cond_e
    move-object/from16 v24, v1

    move/from16 v25, v2

    move/from16 v16, v10

    .line 375
    .end local v1    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v2    # "$i$f$dispatchIfNeeded":I
    .end local v8    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v9    # "kind$iv":I
    .end local v11    # "$i$f$dispatchForKind-6rFNWt0":I
    .end local v12    # "stack$iv":Ljava/lang/Object;
    .end local v13    # "node$iv":Ljava/lang/Object;
    .restart local v24    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .restart local v25    # "$i$f$dispatchIfNeeded":I
    iget-object v1, v0, Landroidx/compose/ui/input/pointer/Node;->modifierNode:Landroidx/compose/ui/Modifier$Node;

    invoke-virtual {v1}, Landroidx/compose/ui/Modifier$Node;->isAttached()Z

    move-result v1

    if-eqz v1, :cond_10

    .line 376
    invoke-virtual {v0}, Landroidx/compose/ui/input/pointer/Node;->getChildren()Landroidx/compose/runtime/collection/MutableVector;

    move-result-object v1

    .local v1, "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v2, 0x0

    .line 702
    .local v2, "$i$f$forEach":I
    nop

    .line 703
    const/4 v8, 0x0

    .line 704
    .local v8, "i$iv":I
    iget-object v9, v1, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    .line 705
    .local v9, "content$iv":[Ljava/lang/Object;
    invoke-virtual {v1}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v10

    .line 706
    .local v10, "size$iv":I
    :goto_7
    if-ge v8, v10, :cond_f

    .line 707
    aget-object v11, v9, v8

    check-cast v11, Landroidx/compose/ui/input/pointer/Node;

    .local v11, "it":Landroidx/compose/ui/input/pointer/Node;
    const/4 v12, 0x0

    .line 377
    .local v12, "$i$a$-forEach-Node$dispatchMainEventPass$1$2":I
    nop

    .line 380
    iget-object v13, v0, Landroidx/compose/ui/input/pointer/Node;->relevantChanges:Landroidx/collection/LongSparseArray;

    .line 381
    iget-object v14, v0, Landroidx/compose/ui/input/pointer/Node;->coordinates:Landroidx/compose/ui/layout/LayoutCoordinates;

    invoke-static {v14}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 382
    nop

    .line 383
    nop

    .line 377
    move-object/from16 v15, p3

    move/from16 v4, p4

    invoke-virtual {v11, v13, v14, v15, v4}, Landroidx/compose/ui/input/pointer/Node;->dispatchMainEventPass(Landroidx/collection/LongSparseArray;Landroidx/compose/ui/layout/LayoutCoordinates;Landroidx/compose/ui/input/pointer/InternalPointerEvent;Z)Z

    .line 385
    nop

    .line 707
    .end local v11    # "it":Landroidx/compose/ui/input/pointer/Node;
    .end local v12    # "$i$a$-forEach-Node$dispatchMainEventPass$1$2":I
    nop

    .line 708
    add-int/lit8 v8, v8, 0x1

    const/4 v4, 0x0

    goto :goto_7

    .line 710
    :cond_f
    move-object/from16 v15, p3

    move/from16 v4, p4

    goto :goto_8

    .line 375
    .end local v1    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v2    # "$i$f$forEach":I
    .end local v8    # "i$iv":I
    .end local v9    # "content$iv":[Ljava/lang/Object;
    .end local v10    # "size$iv":I
    :cond_10
    move-object/from16 v15, p3

    move/from16 v4, p4

    .line 388
    :goto_8
    iget-object v1, v0, Landroidx/compose/ui/input/pointer/Node;->modifierNode:Landroidx/compose/ui/Modifier$Node;

    invoke-virtual {v1}, Landroidx/compose/ui/Modifier$Node;->isAttached()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 390
    iget-object v1, v0, Landroidx/compose/ui/input/pointer/Node;->modifierNode:Landroidx/compose/ui/Modifier$Node;

    const/4 v2, 0x0

    .line 711
    .local v2, "$i$f$getPointerInput-OLwlOKw":I
    invoke-static/range {v16 .. v16}, Landroidx/compose/ui/node/NodeKind;->constructor-impl(I)I

    move-result v2

    .line 390
    .end local v2    # "$i$f$getPointerInput-OLwlOKw":I
    nop

    .local v1, "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .local v2, "kind$iv":I
    const/4 v8, 0x0

    .line 712
    .local v8, "$i$f$dispatchForKind-6rFNWt0":I
    const/4 v9, 0x0

    .line 713
    .local v9, "stack$iv":Ljava/lang/Object;
    const/4 v10, 0x0

    .local v10, "node$iv":Ljava/lang/Object;
    move-object v10, v1

    .line 714
    :goto_9
    if-eqz v10, :cond_1d

    .line 715
    instance-of v11, v10, Landroidx/compose/ui/node/PointerInputModifierNode;

    if-eqz v11, :cond_11

    .line 716
    move-object v11, v10

    check-cast v11, Landroidx/compose/ui/node/PointerInputModifierNode;

    .local v11, "it":Landroidx/compose/ui/node/PointerInputModifierNode;
    const/4 v12, 0x0

    .line 391
    .local v12, "$i$a$-dispatchForKind-6rFNWt0-Node$dispatchMainEventPass$1$3":I
    sget-object v13, Landroidx/compose/ui/input/pointer/PointerEventPass;->Main:Landroidx/compose/ui/input/pointer/PointerEventPass;

    invoke-interface {v11, v5, v13, v6, v7}, Landroidx/compose/ui/node/PointerInputModifierNode;->onPointerEvent-H0pRuoY(Landroidx/compose/ui/input/pointer/PointerEvent;Landroidx/compose/ui/input/pointer/PointerEventPass;J)V

    .line 392
    nop

    .line 716
    .end local v11    # "it":Landroidx/compose/ui/node/PointerInputModifierNode;
    .end local v12    # "$i$a$-dispatchForKind-6rFNWt0-Node$dispatchMainEventPass$1$3":I
    move-object/from16 v21, v1

    move/from16 v23, v2

    const/4 v0, 0x0

    const/4 v1, 0x1

    goto/16 :goto_f

    .line 717
    :cond_11
    move-object v11, v10

    .local v11, "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    const/4 v12, 0x0

    .line 718
    .local v12, "$i$f$isKind-H91voCI$ui_release":I
    invoke-virtual {v11}, Landroidx/compose/ui/Modifier$Node;->getKindSet$ui_release()I

    move-result v13

    and-int/2addr v13, v2

    if-eqz v13, :cond_12

    const/4 v11, 0x1

    goto :goto_a

    :cond_12
    const/4 v11, 0x0

    .line 717
    .end local v11    # "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v12    # "$i$f$isKind-H91voCI$ui_release":I
    :goto_a
    if-eqz v11, :cond_1b

    instance-of v11, v10, Landroidx/compose/ui/node/DelegatingNode;

    if-eqz v11, :cond_1b

    .line 719
    const/4 v11, 0x0

    .line 720
    .local v11, "count$iv":I
    move-object v12, v10

    check-cast v12, Landroidx/compose/ui/node/DelegatingNode;

    .local v12, "this_$iv$iv":Landroidx/compose/ui/node/DelegatingNode;
    const/4 v13, 0x0

    .line 721
    .local v13, "$i$f$forEachImmediateDelegate$ui_release":I
    invoke-virtual {v12}, Landroidx/compose/ui/node/DelegatingNode;->getDelegate$ui_release()Landroidx/compose/ui/Modifier$Node;

    move-result-object v14

    .line 722
    .local v14, "node$iv$iv":Landroidx/compose/ui/Modifier$Node;
    :goto_b
    if-eqz v14, :cond_1a

    .line 723
    move-object/from16 v16, v14

    .local v16, "next$iv":Landroidx/compose/ui/Modifier$Node;
    const/16 v18, 0x0

    .line 724
    .local v18, "$i$a$-forEachImmediateDelegate$ui_release-DelegatableNodeKt$dispatchForKind$1$iv":I
    move-object/from16 v19, v16

    .local v19, "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    const/16 v20, 0x0

    .line 718
    .local v20, "$i$f$isKind-H91voCI$ui_release":I
    invoke-virtual/range {v19 .. v19}, Landroidx/compose/ui/Modifier$Node;->getKindSet$ui_release()I

    move-result v21

    and-int v21, v21, v2

    if-eqz v21, :cond_13

    const/16 v19, 0x1

    goto :goto_c

    :cond_13
    const/16 v19, 0x0

    .line 724
    .end local v19    # "this_$iv$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v20    # "$i$f$isKind-H91voCI$ui_release":I
    :goto_c
    if-eqz v19, :cond_19

    .line 725
    add-int/lit8 v11, v11, 0x1

    .line 726
    const/4 v0, 0x1

    if-ne v11, v0, :cond_14

    .line 727
    move-object/from16 v10, v16

    move-object/from16 v21, v1

    move/from16 v23, v2

    move-object/from16 v2, v16

    const/4 v0, 0x0

    goto :goto_e

    .line 731
    :cond_14
    if-nez v9, :cond_15

    const/4 v0, 0x0

    .line 732
    .local v0, "$i$f$mutableVectorOf":I
    nop

    .line 733
    move/from16 v19, v0

    .end local v0    # "$i$f$mutableVectorOf":I
    .local v19, "$i$f$mutableVectorOf":I
    const/16 v0, 0x10

    .local v0, "capacity$iv$iv$iv":I
    const/16 v20, 0x0

    .line 734
    .local v20, "$i$f$MutableVector":I
    move-object/from16 v21, v1

    .end local v1    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .local v21, "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    new-instance v1, Landroidx/compose/runtime/collection/MutableVector;

    move/from16 v23, v2

    .end local v2    # "kind$iv":I
    .local v23, "kind$iv":I
    new-array v2, v0, [Landroidx/compose/ui/Modifier$Node;

    move/from16 v26, v0

    const/4 v0, 0x0

    .end local v0    # "capacity$iv$iv$iv":I
    .local v26, "capacity$iv$iv$iv":I
    invoke-direct {v1, v2, v0}, Landroidx/compose/runtime/collection/MutableVector;-><init>([Ljava/lang/Object;I)V

    .line 732
    .end local v20    # "$i$f$MutableVector":I
    .end local v26    # "capacity$iv$iv$iv":I
    goto :goto_d

    .line 731
    .end local v19    # "$i$f$mutableVectorOf":I
    .end local v21    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v23    # "kind$iv":I
    .restart local v1    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v2    # "kind$iv":I
    :cond_15
    move-object/from16 v21, v1

    move/from16 v23, v2

    const/4 v0, 0x0

    .end local v1    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v2    # "kind$iv":I
    .restart local v21    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v23    # "kind$iv":I
    move-object v1, v9

    :goto_d
    move-object v9, v1

    .line 735
    move-object v1, v10

    .line 736
    .local v1, "theNode$iv":Landroidx/compose/ui/Modifier$Node;
    if-eqz v1, :cond_17

    .line 737
    if-eqz v9, :cond_16

    invoke-virtual {v9, v1}, Landroidx/compose/runtime/collection/MutableVector;->add(Ljava/lang/Object;)Z

    .line 738
    :cond_16
    const/4 v2, 0x0

    move-object v10, v2

    .line 740
    :cond_17
    if-eqz v9, :cond_18

    move-object/from16 v2, v16

    .end local v16    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .local v2, "next$iv":Landroidx/compose/ui/Modifier$Node;
    invoke-virtual {v9, v2}, Landroidx/compose/runtime/collection/MutableVector;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .end local v2    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v16    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    :cond_18
    move-object/from16 v2, v16

    .end local v16    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v2    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    goto :goto_e

    .line 724
    .end local v21    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v23    # "kind$iv":I
    .local v1, "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .local v2, "kind$iv":I
    .restart local v16    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    :cond_19
    move-object/from16 v21, v1

    move/from16 v23, v2

    move-object/from16 v2, v16

    const/4 v0, 0x0

    .line 743
    .end local v1    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v16    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .local v2, "next$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v21    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v23    # "kind$iv":I
    :goto_e
    nop

    .line 723
    .end local v2    # "next$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v18    # "$i$a$-forEachImmediateDelegate$ui_release-DelegatableNodeKt$dispatchForKind$1$iv":I
    nop

    .line 744
    invoke-virtual {v14}, Landroidx/compose/ui/Modifier$Node;->getChild$ui_release()Landroidx/compose/ui/Modifier$Node;

    move-result-object v14

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v23

    goto :goto_b

    .line 746
    .end local v21    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v23    # "kind$iv":I
    .restart local v1    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .local v2, "kind$iv":I
    :cond_1a
    move-object/from16 v21, v1

    move/from16 v23, v2

    const/4 v0, 0x0

    .line 747
    .end local v1    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v2    # "kind$iv":I
    .end local v12    # "this_$iv$iv":Landroidx/compose/ui/node/DelegatingNode;
    .end local v13    # "$i$f$forEachImmediateDelegate$ui_release":I
    .end local v14    # "node$iv$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v21    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v23    # "kind$iv":I
    const/4 v1, 0x1

    if-ne v11, v1, :cond_1c

    .line 749
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v23

    goto/16 :goto_9

    .line 717
    .end local v11    # "count$iv":I
    .end local v21    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v23    # "kind$iv":I
    .restart local v1    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v2    # "kind$iv":I
    :cond_1b
    move-object/from16 v21, v1

    move/from16 v23, v2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 752
    .end local v1    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v2    # "kind$iv":I
    .restart local v21    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v23    # "kind$iv":I
    :cond_1c
    :goto_f
    invoke-static {v9}, Landroidx/compose/ui/node/DelegatableNodeKt;->access$pop(Landroidx/compose/runtime/collection/MutableVector;)Landroidx/compose/ui/Modifier$Node;

    move-result-object v10

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v23

    goto/16 :goto_9

    .line 754
    .end local v21    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v23    # "kind$iv":I
    .restart local v1    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v2    # "kind$iv":I
    :cond_1d
    move-object/from16 v21, v1

    move/from16 v23, v2

    const/4 v1, 0x1

    .end local v1    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v2    # "kind$iv":I
    .restart local v21    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .restart local v23    # "kind$iv":I
    goto :goto_10

    .line 388
    .end local v8    # "$i$f$dispatchForKind-6rFNWt0":I
    .end local v9    # "stack$iv":Ljava/lang/Object;
    .end local v10    # "node$iv":Ljava/lang/Object;
    .end local v21    # "$this$dispatchForKind_u2d6rFNWt0$iv":Landroidx/compose/ui/Modifier$Node;
    .end local v23    # "kind$iv":I
    :cond_1e
    const/4 v1, 0x1

    .line 394
    :goto_10
    nop

    .line 657
    .end local v3    # "$i$a$-dispatchIfNeeded-Node$dispatchMainEventPass$1":I
    .end local v5    # "event":Landroidx/compose/ui/input/pointer/PointerEvent;
    .end local v6    # "size":J
    nop

    .line 755
    nop

    .line 365
    .end local v24    # "this_$iv":Landroidx/compose/ui/input/pointer/Node;
    .end local v25    # "$i$f$dispatchIfNeeded":I
    :goto_11
    return v1
.end method

.method public final getModifierNode()Landroidx/compose/ui/Modifier$Node;
    .locals 1

    .line 317
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/Node;->modifierNode:Landroidx/compose/ui/Modifier$Node;

    return-object v0
.end method

.method public final getPointerIds()Landroidx/compose/ui/input/pointer/util/PointerIdArray;
    .locals 1

    .line 322
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/Node;->pointerIds:Landroidx/compose/ui/input/pointer/util/PointerIdArray;

    return-object v0
.end method

.method public final markIsIn()V
    .locals 1

    .line 610
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/compose/ui/input/pointer/Node;->isIn:Z

    .line 611
    return-void
.end method

.method public removeInvalidPointerIdsAndChanges(JLandroidx/collection/MutableObjectList;)V
    .locals 7
    .param p1, "pointerIdValue"    # J
    .param p3, "hitNodes"    # Landroidx/collection/MutableObjectList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Landroidx/collection/MutableObjectList<",
            "Landroidx/compose/ui/input/pointer/Node;",
            ">;)V"
        }
    .end annotation

    .line 343
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/Node;->pointerIds:Landroidx/compose/ui/input/pointer/util/PointerIdArray;

    invoke-virtual {v0, p1, p2}, Landroidx/compose/ui/input/pointer/util/PointerIdArray;->contains(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 344
    invoke-virtual {p3, p0}, Landroidx/collection/MutableObjectList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 345
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/Node;->pointerIds:Landroidx/compose/ui/input/pointer/util/PointerIdArray;

    invoke-virtual {v0, p1, p2}, Landroidx/compose/ui/input/pointer/util/PointerIdArray;->remove(J)Z

    .line 346
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/Node;->relevantChanges:Landroidx/collection/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroidx/collection/LongSparseArray;->remove(J)V

    .line 350
    :cond_0
    invoke-virtual {p0}, Landroidx/compose/ui/input/pointer/Node;->getChildren()Landroidx/compose/runtime/collection/MutableVector;

    move-result-object v0

    .local v0, "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v1, 0x0

    .line 644
    .local v1, "$i$f$forEach":I
    nop

    .line 645
    const/4 v2, 0x0

    .line 646
    .local v2, "i$iv":I
    iget-object v3, v0, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    .line 647
    .local v3, "content$iv":[Ljava/lang/Object;
    invoke-virtual {v0}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v4

    .line 648
    .local v4, "size$iv":I
    :goto_0
    if-ge v2, v4, :cond_1

    .line 649
    aget-object v5, v3, v2

    check-cast v5, Landroidx/compose/ui/input/pointer/Node;

    .local v5, "it":Landroidx/compose/ui/input/pointer/Node;
    const/4 v6, 0x0

    .line 350
    .local v6, "$i$a$-forEach-Node$removeInvalidPointerIdsAndChanges$1":I
    invoke-virtual {v5, p1, p2, p3}, Landroidx/compose/ui/input/pointer/Node;->removeInvalidPointerIdsAndChanges(JLandroidx/collection/MutableObjectList;)V

    .line 649
    .end local v5    # "it":Landroidx/compose/ui/input/pointer/Node;
    .end local v6    # "$i$a$-forEach-Node$removeInvalidPointerIdsAndChanges$1":I
    nop

    .line 650
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 652
    :cond_1
    nop

    .line 351
    .end local v0    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v1    # "$i$f$forEach":I
    .end local v2    # "i$iv":I
    .end local v3    # "content$iv":[Ljava/lang/Object;
    .end local v4    # "size$iv":I
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 640
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Node(modifierNode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/compose/ui/input/pointer/Node;->modifierNode:Landroidx/compose/ui/Modifier$Node;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", children="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/compose/ui/input/pointer/Node;->getChildren()Landroidx/compose/runtime/collection/MutableVector;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", pointerIds="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/compose/ui/input/pointer/Node;->pointerIds:Landroidx/compose/ui/input/pointer/util/PointerIdArray;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
