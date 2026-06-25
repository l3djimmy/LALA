.class public final Landroidx/compose/ui/input/pointer/HitPathTracker;
.super Ljava/lang/Object;
.source "HitPathTracker.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nHitPathTracker.kt\nKotlin\n*S Kotlin\n*F\n+ 1 HitPathTracker.kt\nandroidx/compose/ui/input/pointer/HitPathTracker\n+ 2 MutableVector.kt\nandroidx/compose/runtime/collection/MutableVector\n+ 3 PointerIdArray.kt\nandroidx/compose/ui/input/pointer/util/PointerIdArray\n+ 4 LongObjectMap.kt\nandroidx/collection/MutableLongObjectMap\n+ 5 ObjectList.kt\nandroidx/collection/ObjectListKt\n+ 6 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 7 LongObjectMap.kt\nandroidx/collection/LongObjectMap\n+ 8 ScatterMap.kt\nandroidx/collection/ScatterMapKt\n*L\n1#1,643:1\n347#2,8:644\n128#3:652\n128#3:657\n679#4:653\n679#4:658\n1516#5:654\n1516#5:659\n1#6:655\n1#6:656\n1#6:660\n382#7,4:661\n354#7,6:665\n364#7,3:672\n367#7,9:676\n386#7:685\n1399#8:671\n1270#8:675\n*S KotlinDebug\n*F\n+ 1 HitPathTracker.kt\nandroidx/compose/ui/input/pointer/HitPathTracker\n*L\n83#1:644,8\n87#1:652\n102#1:657\n90#1:653\n105#1:658\n91#1:654\n105#1:659\n90#1:655\n105#1:660\n115#1:661,4\n115#1:665,6\n115#1:672,3\n115#1:676,9\n115#1:685\n115#1:671\n115#1:675\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000V\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0004\u0008\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J0\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u000c\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u00130\u00122\u0008\u0008\u0002\u0010\u0014\u001a\u00020\u0015\u00f8\u0001\u0000\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0006\u0010\u0018\u001a\u00020\u000eJ\u0018\u0010\u0019\u001a\u00020\u00152\u0006\u0010\u001a\u001a\u00020\u001b2\u0008\u0008\u0002\u0010\u001c\u001a\u00020\u0015J\u0006\u0010\u001d\u001a\u00020\u000eJ\u001e\u0010\u001e\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u001f2\u000c\u0010 \u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007H\u0002J\u0010\u0010!\u001a\u00020\u000e2\u0006\u0010\"\u001a\u00020\u0013H\u0002R\u001a\u0010\u0005\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00080\u00070\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\t\u001a\u00020\nX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\u0008\u00a1\u001e0\u0001\u00a8\u0006#"
    }
    d2 = {
        "Landroidx/compose/ui/input/pointer/HitPathTracker;",
        "",
        "rootCoordinates",
        "Landroidx/compose/ui/layout/LayoutCoordinates;",
        "(Landroidx/compose/ui/layout/LayoutCoordinates;)V",
        "hitPointerIdsAndNodes",
        "Landroidx/collection/MutableLongObjectMap;",
        "Landroidx/collection/MutableObjectList;",
        "Landroidx/compose/ui/input/pointer/Node;",
        "root",
        "Landroidx/compose/ui/input/pointer/NodeParent;",
        "getRoot$ui_release",
        "()Landroidx/compose/ui/input/pointer/NodeParent;",
        "addHitPath",
        "",
        "pointerId",
        "Landroidx/compose/ui/input/pointer/PointerId;",
        "pointerInputNodes",
        "",
        "Landroidx/compose/ui/Modifier$Node;",
        "prunePointerIdsAndChangesNotInNodesList",
        "",
        "addHitPath-QJqDSyo",
        "(JLjava/util/List;Z)V",
        "clearPreviouslyHitModifierNodeCache",
        "dispatchChanges",
        "internalPointerEvent",
        "Landroidx/compose/ui/input/pointer/InternalPointerEvent;",
        "isInBounds",
        "processCancel",
        "removeInvalidPointerIdsAndChanges",
        "",
        "hitNodes",
        "removePointerInputModifierNode",
        "pointerInputNode",
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
.field private final hitPointerIdsAndNodes:Landroidx/collection/MutableLongObjectMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/MutableLongObjectMap<",
            "Landroidx/collection/MutableObjectList<",
            "Landroidx/compose/ui/input/pointer/Node;",
            ">;>;"
        }
    .end annotation
.end field

.field private final root:Landroidx/compose/ui/input/pointer/NodeParent;

.field private final rootCoordinates:Landroidx/compose/ui/layout/LayoutCoordinates;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Landroidx/compose/ui/input/pointer/HitPathTracker;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroidx/compose/ui/layout/LayoutCoordinates;)V
    .locals 2
    .param p1, "rootCoordinates"    # Landroidx/compose/ui/layout/LayoutCoordinates;

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/compose/ui/input/pointer/HitPathTracker;->rootCoordinates:Landroidx/compose/ui/layout/LayoutCoordinates;

    .line 46
    new-instance v0, Landroidx/compose/ui/input/pointer/NodeParent;

    invoke-direct {v0}, Landroidx/compose/ui/input/pointer/NodeParent;-><init>()V

    iput-object v0, p0, Landroidx/compose/ui/input/pointer/HitPathTracker;->root:Landroidx/compose/ui/input/pointer/NodeParent;

    .line 48
    new-instance v0, Landroidx/collection/MutableLongObjectMap;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Landroidx/collection/MutableLongObjectMap;-><init>(I)V

    iput-object v0, p0, Landroidx/compose/ui/input/pointer/HitPathTracker;->hitPointerIdsAndNodes:Landroidx/collection/MutableLongObjectMap;

    .line 43
    return-void
.end method

.method public static final synthetic access$removePointerInputModifierNode(Landroidx/compose/ui/input/pointer/HitPathTracker;Landroidx/compose/ui/Modifier$Node;)V
    .locals 0
    .param p0, "$this"    # Landroidx/compose/ui/input/pointer/HitPathTracker;
    .param p1, "pointerInputNode"    # Landroidx/compose/ui/Modifier$Node;

    .line 43
    invoke-direct {p0, p1}, Landroidx/compose/ui/input/pointer/HitPathTracker;->removePointerInputModifierNode(Landroidx/compose/ui/Modifier$Node;)V

    return-void
.end method

.method public static synthetic addHitPath-QJqDSyo$default(Landroidx/compose/ui/input/pointer/HitPathTracker;JLjava/util/List;ZILjava/lang/Object;)V
    .locals 0

    .line 64
    and-int/lit8 p5, p5, 0x4

    if-eqz p5, :cond_0

    .line 67
    const/4 p4, 0x0

    .line 64
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/compose/ui/input/pointer/HitPathTracker;->addHitPath-QJqDSyo(JLjava/util/List;Z)V

    return-void
.end method

.method public static synthetic dispatchChanges$default(Landroidx/compose/ui/input/pointer/HitPathTracker;Landroidx/compose/ui/input/pointer/InternalPointerEvent;ZILjava/lang/Object;)Z
    .locals 0

    .line 139
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 141
    const/4 p2, 0x1

    .line 139
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroidx/compose/ui/input/pointer/HitPathTracker;->dispatchChanges(Landroidx/compose/ui/input/pointer/InternalPointerEvent;Z)Z

    move-result p0

    return p0
.end method

.method private final removeInvalidPointerIdsAndChanges(JLandroidx/collection/MutableObjectList;)V
    .locals 1
    .param p1, "pointerId"    # J
    .param p3, "hitNodes"    # Landroidx/collection/MutableObjectList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Landroidx/collection/MutableObjectList<",
            "Landroidx/compose/ui/input/pointer/Node;",
            ">;)V"
        }
    .end annotation

    .line 130
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/HitPathTracker;->root:Landroidx/compose/ui/input/pointer/NodeParent;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/compose/ui/input/pointer/NodeParent;->removeInvalidPointerIdsAndChanges(JLandroidx/collection/MutableObjectList;)V

    .line 131
    return-void
.end method

.method private final removePointerInputModifierNode(Landroidx/compose/ui/Modifier$Node;)V
    .locals 1
    .param p1, "pointerInputNode"    # Landroidx/compose/ui/Modifier$Node;

    .line 122
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/HitPathTracker;->root:Landroidx/compose/ui/input/pointer/NodeParent;

    invoke-virtual {v0, p1}, Landroidx/compose/ui/input/pointer/NodeParent;->removePointerInputModifierNode(Landroidx/compose/ui/Modifier$Node;)V

    .line 123
    return-void
.end method


# virtual methods
.method public final addHitPath-QJqDSyo(JLjava/util/List;Z)V
    .locals 24
    .param p1, "pointerId"    # J
    .param p3, "pointerInputNodes"    # Ljava/util/List;
    .param p4, "prunePointerIdsAndChangesNotInNodesList"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "+",
            "Landroidx/compose/ui/Modifier$Node;",
            ">;Z)V"
        }
    .end annotation

    .line 69
    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move-object/from16 v3, p3

    iget-object v4, v0, Landroidx/compose/ui/input/pointer/HitPathTracker;->root:Landroidx/compose/ui/input/pointer/NodeParent;

    .line 70
    .local v4, "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    iget-object v5, v0, Landroidx/compose/ui/input/pointer/HitPathTracker;->hitPointerIdsAndNodes:Landroidx/collection/MutableLongObjectMap;

    invoke-virtual {v5}, Landroidx/collection/MutableLongObjectMap;->clear()V

    .line 71
    const/4 v5, 0x1

    .line 73
    .local v5, "merging":Z
    const/4 v6, 0x0

    .local v6, "i":I
    move-object v7, v3

    check-cast v7, Ljava/util/Collection;

    invoke-interface {v7}, Ljava/util/Collection;->size()I

    move-result v7

    :goto_0
    if-ge v6, v7, :cond_7

    .line 74
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/compose/ui/Modifier$Node;

    .line 77
    .local v10, "pointerInputNode":Landroidx/compose/ui/Modifier$Node;
    invoke-virtual {v10}, Landroidx/compose/ui/Modifier$Node;->isAttached()Z

    move-result v11

    if-eqz v11, :cond_6

    .line 78
    new-instance v11, Landroidx/compose/ui/input/pointer/HitPathTracker$addHitPath$1;

    invoke-direct {v11, v0, v10}, Landroidx/compose/ui/input/pointer/HitPathTracker$addHitPath$1;-><init>(Landroidx/compose/ui/input/pointer/HitPathTracker;Landroidx/compose/ui/Modifier$Node;)V

    check-cast v11, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v10, v11}, Landroidx/compose/ui/Modifier$Node;->setDetachedListener$ui_release(Lkotlin/jvm/functions/Function0;)V

    .line 82
    const/4 v11, 0x0

    if-eqz v5, :cond_4

    .line 83
    invoke-virtual {v4}, Landroidx/compose/ui/input/pointer/NodeParent;->getChildren()Landroidx/compose/runtime/collection/MutableVector;

    move-result-object v12

    .local v12, "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v13, 0x0

    .line 644
    .local v13, "$i$f$firstOrNull":I
    nop

    .line 645
    iget-object v14, v12, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    .line 646
    .local v14, "content$iv":[Ljava/lang/Object;
    invoke-virtual {v12}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v15

    .line 647
    .local v15, "size$iv":I
    const/16 v16, 0x0

    move/from16 v8, v16

    .local v8, "i$iv":I
    :goto_1
    if-ge v8, v15, :cond_1

    .line 648
    aget-object v16, v14, v8

    .line 649
    .local v16, "item$iv":Ljava/lang/Object;
    move-object/from16 v17, v16

    check-cast v17, Landroidx/compose/ui/input/pointer/Node;

    .local v17, "it":Landroidx/compose/ui/input/pointer/Node;
    const/16 v18, 0x0

    .line 83
    .local v18, "$i$a$-firstOrNull-HitPathTracker$addHitPath$node$1":I
    invoke-virtual/range {v17 .. v17}, Landroidx/compose/ui/input/pointer/Node;->getModifierNode()Landroidx/compose/ui/Modifier$Node;

    move-result-object v9

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    .line 649
    .end local v17    # "it":Landroidx/compose/ui/input/pointer/Node;
    .end local v18    # "$i$a$-firstOrNull-HitPathTracker$addHitPath$node$1":I
    if-eqz v9, :cond_0

    goto :goto_2

    .line 647
    .end local v16    # "item$iv":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 651
    .end local v8    # "i$iv":I
    :cond_1
    move-object/from16 v16, v11

    .line 83
    .end local v12    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v13    # "$i$f$firstOrNull":I
    .end local v14    # "content$iv":[Ljava/lang/Object;
    .end local v15    # "size$iv":I
    :goto_2
    move-object/from16 v8, v16

    check-cast v8, Landroidx/compose/ui/input/pointer/Node;

    .line 85
    .local v8, "node":Landroidx/compose/ui/input/pointer/Node;
    if-eqz v8, :cond_3

    .line 86
    invoke-virtual {v8}, Landroidx/compose/ui/input/pointer/Node;->markIsIn()V

    .line 87
    invoke-virtual {v8}, Landroidx/compose/ui/input/pointer/Node;->getPointerIds()Landroidx/compose/ui/input/pointer/util/PointerIdArray;

    move-result-object v9

    .local v9, "this_$iv":Landroidx/compose/ui/input/pointer/util/PointerIdArray;
    const/4 v12, 0x0

    .line 652
    .local v12, "$i$f$add-0FcD4WY":I
    invoke-virtual {v9, v1, v2}, Landroidx/compose/ui/input/pointer/util/PointerIdArray;->add(J)Z

    .line 90
    .end local v9    # "this_$iv":Landroidx/compose/ui/input/pointer/util/PointerIdArray;
    .end local v12    # "$i$f$add-0FcD4WY":I
    iget-object v9, v0, Landroidx/compose/ui/input/pointer/HitPathTracker;->hitPointerIdsAndNodes:Landroidx/collection/MutableLongObjectMap;

    .local v9, "this_$iv":Landroidx/collection/MutableLongObjectMap;
    move-wide/from16 v12, p1

    .local v12, "key$iv":J
    const/4 v14, 0x0

    .line 653
    .local v14, "$i$f$getOrPut":I
    invoke-virtual {v9, v12, v13}, Landroidx/collection/MutableLongObjectMap;->get(J)Ljava/lang/Object;

    move-result-object v15

    if-nez v15, :cond_2

    const/4 v15, 0x0

    .line 91
    .local v15, "$i$a$-getOrPut-HitPathTracker$addHitPath$mutableObjectList$1":I
    const/16 v16, 0x0

    .line 654
    .local v16, "$i$f$mutableObjectListOf":I
    new-instance v3, Landroidx/collection/MutableObjectList;

    move-object/from16 v17, v4

    move/from16 v18, v5

    const/4 v4, 0x0

    const/4 v5, 0x1

    .end local v4    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .end local v5    # "merging":Z
    .local v17, "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .local v18, "merging":Z
    invoke-direct {v3, v4, v5, v11}, Landroidx/collection/MutableObjectList;-><init>(IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 91
    .end local v16    # "$i$f$mutableObjectListOf":I
    nop

    .line 653
    .end local v15    # "$i$a$-getOrPut-HitPathTracker$addHitPath$mutableObjectList$1":I
    move-object v4, v3

    .line 655
    .local v4, "it$iv":Ljava/lang/Object;
    const/4 v5, 0x0

    .line 653
    .local v5, "$i$a$-also-MutableLongObjectMap$getOrPut$1$iv":I
    invoke-virtual {v9, v12, v13, v4}, Landroidx/collection/MutableLongObjectMap;->set(JLjava/lang/Object;)V

    move-object v15, v3

    .end local v4    # "it$iv":Ljava/lang/Object;
    .end local v5    # "$i$a$-also-MutableLongObjectMap$getOrPut$1$iv":I
    goto :goto_3

    .end local v17    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .end local v18    # "merging":Z
    .local v4, "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .local v5, "merging":Z
    :cond_2
    move-object/from16 v17, v4

    move/from16 v18, v5

    .line 90
    .end local v4    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .end local v5    # "merging":Z
    .end local v9    # "this_$iv":Landroidx/collection/MutableLongObjectMap;
    .end local v12    # "key$iv":J
    .end local v14    # "$i$f$getOrPut":I
    .restart local v17    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .restart local v18    # "merging":Z
    :goto_3
    check-cast v15, Landroidx/collection/MutableObjectList;

    .line 89
    nop

    .line 94
    .local v15, "mutableObjectList":Landroidx/collection/MutableObjectList;
    invoke-virtual {v15, v8}, Landroidx/collection/MutableObjectList;->add(Ljava/lang/Object;)Z

    .line 95
    move-object v3, v8

    check-cast v3, Landroidx/compose/ui/input/pointer/NodeParent;

    .line 96
    .end local v17    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .local v3, "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    move-object v4, v3

    move/from16 v5, v18

    goto :goto_5

    .line 98
    .end local v3    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .end local v15    # "mutableObjectList":Landroidx/collection/MutableObjectList;
    .end local v18    # "merging":Z
    .restart local v4    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .restart local v5    # "merging":Z
    :cond_3
    move-object/from16 v17, v4

    move/from16 v18, v5

    .end local v4    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .end local v5    # "merging":Z
    .restart local v17    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .restart local v18    # "merging":Z
    const/4 v5, 0x0

    .end local v18    # "merging":Z
    .restart local v5    # "merging":Z
    goto :goto_4

    .line 82
    .end local v8    # "node":Landroidx/compose/ui/input/pointer/Node;
    .end local v17    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .restart local v4    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    :cond_4
    move-object/from16 v17, v4

    move/from16 v18, v5

    .line 102
    .end local v4    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .restart local v17    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    :goto_4
    new-instance v3, Landroidx/compose/ui/input/pointer/Node;

    invoke-direct {v3, v10}, Landroidx/compose/ui/input/pointer/Node;-><init>(Landroidx/compose/ui/Modifier$Node;)V

    move-object v4, v3

    .line 656
    .local v4, "$this$addHitPath_QJqDSyo_u24lambda_u242":Landroidx/compose/ui/input/pointer/Node;
    const/4 v8, 0x0

    .line 102
    .local v8, "$i$a$-apply-HitPathTracker$addHitPath$node$2":I
    invoke-virtual {v4}, Landroidx/compose/ui/input/pointer/Node;->getPointerIds()Landroidx/compose/ui/input/pointer/util/PointerIdArray;

    move-result-object v9

    .local v9, "this_$iv":Landroidx/compose/ui/input/pointer/util/PointerIdArray;
    const/4 v12, 0x0

    .line 657
    .local v12, "$i$f$add-0FcD4WY":I
    invoke-virtual {v9, v1, v2}, Landroidx/compose/ui/input/pointer/util/PointerIdArray;->add(J)Z

    .line 102
    .end local v9    # "this_$iv":Landroidx/compose/ui/input/pointer/util/PointerIdArray;
    .end local v12    # "$i$f$add-0FcD4WY":I
    nop

    .line 105
    .end local v4    # "$this$addHitPath_QJqDSyo_u24lambda_u242":Landroidx/compose/ui/input/pointer/Node;
    .end local v8    # "$i$a$-apply-HitPathTracker$addHitPath$node$2":I
    .local v3, "node":Landroidx/compose/ui/input/pointer/Node;
    iget-object v4, v0, Landroidx/compose/ui/input/pointer/HitPathTracker;->hitPointerIdsAndNodes:Landroidx/collection/MutableLongObjectMap;

    .local v4, "this_$iv":Landroidx/collection/MutableLongObjectMap;
    move-wide/from16 v8, p1

    .local v8, "key$iv":J
    const/4 v12, 0x0

    .line 658
    .local v12, "$i$f$getOrPut":I
    invoke-virtual {v4, v8, v9}, Landroidx/collection/MutableLongObjectMap;->get(J)Ljava/lang/Object;

    move-result-object v13

    if-nez v13, :cond_5

    const/4 v13, 0x0

    .line 105
    .local v13, "$i$a$-getOrPut-HitPathTracker$addHitPath$mutableObjectList$2":I
    const/4 v14, 0x0

    .line 659
    .local v14, "$i$f$mutableObjectListOf":I
    new-instance v15, Landroidx/collection/MutableObjectList;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v15, v1, v2, v11}, Landroidx/collection/MutableObjectList;-><init>(IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 105
    .end local v14    # "$i$f$mutableObjectListOf":I
    nop

    .line 658
    .end local v13    # "$i$a$-getOrPut-HitPathTracker$addHitPath$mutableObjectList$2":I
    move-object v1, v15

    .line 660
    .local v1, "it$iv":Ljava/lang/Object;
    const/4 v2, 0x0

    .line 658
    .local v2, "$i$a$-also-MutableLongObjectMap$getOrPut$1$iv":I
    invoke-virtual {v4, v8, v9, v1}, Landroidx/collection/MutableLongObjectMap;->set(JLjava/lang/Object;)V

    move-object v13, v15

    .line 105
    .end local v1    # "it$iv":Ljava/lang/Object;
    .end local v2    # "$i$a$-also-MutableLongObjectMap$getOrPut$1$iv":I
    .end local v4    # "this_$iv":Landroidx/collection/MutableLongObjectMap;
    .end local v8    # "key$iv":J
    .end local v12    # "$i$f$getOrPut":I
    :cond_5
    check-cast v13, Landroidx/collection/MutableObjectList;

    .line 104
    nop

    .line 107
    .local v13, "mutableObjectList":Landroidx/collection/MutableObjectList;
    invoke-virtual {v13, v3}, Landroidx/collection/MutableObjectList;->add(Ljava/lang/Object;)Z

    .line 109
    invoke-virtual/range {v17 .. v17}, Landroidx/compose/ui/input/pointer/NodeParent;->getChildren()Landroidx/compose/runtime/collection/MutableVector;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroidx/compose/runtime/collection/MutableVector;->add(Ljava/lang/Object;)Z

    .line 110
    move-object v1, v3

    check-cast v1, Landroidx/compose/ui/input/pointer/NodeParent;

    move-object v4, v1

    .end local v17    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .local v1, "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    goto :goto_5

    .line 77
    .end local v1    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .end local v3    # "node":Landroidx/compose/ui/input/pointer/Node;
    .end local v13    # "mutableObjectList":Landroidx/collection/MutableObjectList;
    .local v4, "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    :cond_6
    move-object/from16 v17, v4

    move/from16 v18, v5

    .line 73
    .end local v10    # "pointerInputNode":Landroidx/compose/ui/Modifier$Node;
    :goto_5
    add-int/lit8 v6, v6, 0x1

    move-wide/from16 v1, p1

    move-object/from16 v3, p3

    goto/16 :goto_0

    :cond_7
    move-object/from16 v17, v4

    move/from16 v18, v5

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 114
    .end local v4    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .end local v5    # "merging":Z
    .end local v6    # "i":I
    .restart local v17    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .restart local v18    # "merging":Z
    if-eqz p4, :cond_f

    .line 115
    iget-object v3, v0, Landroidx/compose/ui/input/pointer/HitPathTracker;->hitPointerIdsAndNodes:Landroidx/collection/MutableLongObjectMap;

    check-cast v3, Landroidx/collection/LongObjectMap;

    .local v3, "this_$iv":Landroidx/collection/LongObjectMap;
    const/4 v4, 0x0

    .line 661
    .local v4, "$i$f$forEach":I
    iget-object v5, v3, Landroidx/collection/LongObjectMap;->keys:[J

    .line 662
    .local v5, "k$iv":[J
    iget-object v6, v3, Landroidx/collection/LongObjectMap;->values:[Ljava/lang/Object;

    .line 664
    .local v6, "v$iv":[Ljava/lang/Object;
    move-object v7, v3

    .local v7, "this_$iv$iv":Landroidx/collection/LongObjectMap;
    const/4 v8, 0x0

    .line 665
    .local v8, "$i$f$forEachIndexed":I
    iget-object v9, v7, Landroidx/collection/LongObjectMap;->metadata:[J

    .line 666
    .local v9, "m$iv$iv":[J
    array-length v10, v9

    add-int/lit8 v10, v10, -0x2

    .line 668
    .local v10, "lastIndex$iv$iv":I
    const/4 v11, 0x0

    .local v11, "i$iv$iv":I
    if-gt v11, v10, :cond_c

    .line 669
    :goto_6
    aget-wide v12, v9, v11

    .line 670
    .local v12, "slot$iv$iv":J
    move-wide v14, v12

    .local v14, "$this$maskEmptyOrDeleted$iv$iv$iv":J
    const/16 v16, 0x0

    .line 671
    .local v16, "$i$f$maskEmptyOrDeleted":I
    not-long v1, v14

    const/16 v19, 0x7

    shl-long v1, v1, v19

    and-long/2addr v1, v14

    const-wide v19, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    and-long v1, v1, v19

    .line 670
    .end local v14    # "$this$maskEmptyOrDeleted$iv$iv$iv":J
    .end local v16    # "$i$f$maskEmptyOrDeleted":I
    cmp-long v1, v1, v19

    if-eqz v1, :cond_b

    .line 672
    sub-int v1, v11, v10

    not-int v1, v1

    ushr-int/lit8 v1, v1, 0x1f

    const/16 v2, 0x8

    rsub-int/lit8 v1, v1, 0x8

    .line 673
    .local v1, "bitCount$iv$iv":I
    const/4 v14, 0x0

    .local v14, "j$iv$iv":I
    :goto_7
    if-ge v14, v1, :cond_a

    .line 674
    const-wide/16 v15, 0xff

    and-long/2addr v15, v12

    .local v15, "value$iv$iv$iv":J
    const/16 v19, 0x0

    .line 675
    .local v19, "$i$f$isFull":I
    const-wide/16 v20, 0x80

    cmp-long v20, v15, v20

    if-gez v20, :cond_8

    const/4 v15, 0x1

    goto :goto_8

    :cond_8
    const/4 v15, 0x0

    .line 674
    .end local v15    # "value$iv$iv$iv":J
    .end local v19    # "$i$f$isFull":I
    :goto_8
    if-eqz v15, :cond_9

    .line 676
    shl-int/lit8 v15, v11, 0x3

    add-int/2addr v15, v14

    .line 677
    .local v15, "index$iv$iv":I
    move/from16 v16, v15

    .local v16, "index$iv":I
    const/16 v19, 0x0

    .line 664
    .local v19, "$i$a$-forEachIndexed-LongObjectMap$forEach$1$iv":I
    move/from16 v21, v2

    move-object/from16 v20, v3

    .end local v3    # "this_$iv":Landroidx/collection/LongObjectMap;
    .local v20, "this_$iv":Landroidx/collection/LongObjectMap;
    aget-wide v2, v5, v16

    .local v2, "key":J
    aget-object v22, v6, v16

    move/from16 v23, v4

    .end local v4    # "$i$f$forEach":I
    .local v23, "$i$f$forEach":I
    move-object/from16 v4, v22

    check-cast v4, Landroidx/collection/MutableObjectList;

    .local v4, "value":Landroidx/collection/MutableObjectList;
    const/16 v22, 0x0

    .line 116
    .local v22, "$i$a$-forEach-HitPathTracker$addHitPath$2":I
    invoke-direct {v0, v2, v3, v4}, Landroidx/compose/ui/input/pointer/HitPathTracker;->removeInvalidPointerIdsAndChanges(JLandroidx/collection/MutableObjectList;)V

    .line 117
    nop

    .line 664
    .end local v2    # "key":J
    .end local v4    # "value":Landroidx/collection/MutableObjectList;
    .end local v22    # "$i$a$-forEach-HitPathTracker$addHitPath$2":I
    nop

    .line 677
    .end local v16    # "index$iv":I
    .end local v19    # "$i$a$-forEachIndexed-LongObjectMap$forEach$1$iv":I
    goto :goto_9

    .line 674
    .end local v15    # "index$iv$iv":I
    .end local v20    # "this_$iv":Landroidx/collection/LongObjectMap;
    .end local v23    # "$i$f$forEach":I
    .restart local v3    # "this_$iv":Landroidx/collection/LongObjectMap;
    .local v4, "$i$f$forEach":I
    :cond_9
    move/from16 v21, v2

    move-object/from16 v20, v3

    move/from16 v23, v4

    .line 679
    .end local v3    # "this_$iv":Landroidx/collection/LongObjectMap;
    .end local v4    # "$i$f$forEach":I
    .restart local v20    # "this_$iv":Landroidx/collection/LongObjectMap;
    .restart local v23    # "$i$f$forEach":I
    :goto_9
    shr-long v12, v12, v21

    .line 673
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v3, v20

    move/from16 v2, v21

    move/from16 v4, v23

    goto :goto_7

    .end local v20    # "this_$iv":Landroidx/collection/LongObjectMap;
    .end local v23    # "$i$f$forEach":I
    .restart local v3    # "this_$iv":Landroidx/collection/LongObjectMap;
    .restart local v4    # "$i$f$forEach":I
    :cond_a
    move/from16 v21, v2

    move-object/from16 v20, v3

    move/from16 v23, v4

    .line 681
    .end local v3    # "this_$iv":Landroidx/collection/LongObjectMap;
    .end local v4    # "$i$f$forEach":I
    .end local v14    # "j$iv$iv":I
    .restart local v20    # "this_$iv":Landroidx/collection/LongObjectMap;
    .restart local v23    # "$i$f$forEach":I
    if-ne v1, v2, :cond_e

    goto :goto_a

    .line 670
    .end local v1    # "bitCount$iv$iv":I
    .end local v20    # "this_$iv":Landroidx/collection/LongObjectMap;
    .end local v23    # "$i$f$forEach":I
    .restart local v3    # "this_$iv":Landroidx/collection/LongObjectMap;
    .restart local v4    # "$i$f$forEach":I
    :cond_b
    move-object/from16 v20, v3

    move/from16 v23, v4

    .line 668
    .end local v3    # "this_$iv":Landroidx/collection/LongObjectMap;
    .end local v4    # "$i$f$forEach":I
    .end local v12    # "slot$iv$iv":J
    .restart local v20    # "this_$iv":Landroidx/collection/LongObjectMap;
    .restart local v23    # "$i$f$forEach":I
    :goto_a
    if-eq v11, v10, :cond_d

    add-int/lit8 v11, v11, 0x1

    move-object/from16 v3, v20

    move/from16 v4, v23

    const/4 v1, 0x0

    const/4 v2, 0x1

    goto :goto_6

    .end local v20    # "this_$iv":Landroidx/collection/LongObjectMap;
    .end local v23    # "$i$f$forEach":I
    .restart local v3    # "this_$iv":Landroidx/collection/LongObjectMap;
    .restart local v4    # "$i$f$forEach":I
    :cond_c
    move-object/from16 v20, v3

    move/from16 v23, v4

    .line 684
    .end local v3    # "this_$iv":Landroidx/collection/LongObjectMap;
    .end local v4    # "$i$f$forEach":I
    .end local v11    # "i$iv$iv":I
    .restart local v20    # "this_$iv":Landroidx/collection/LongObjectMap;
    .restart local v23    # "$i$f$forEach":I
    :cond_d
    nop

    .line 685
    .end local v7    # "this_$iv$iv":Landroidx/collection/LongObjectMap;
    .end local v8    # "$i$f$forEachIndexed":I
    .end local v9    # "m$iv$iv":[J
    .end local v10    # "lastIndex$iv$iv":I
    :cond_e
    nop

    .line 119
    .end local v5    # "k$iv":[J
    .end local v6    # "v$iv":[Ljava/lang/Object;
    .end local v20    # "this_$iv":Landroidx/collection/LongObjectMap;
    .end local v23    # "$i$f$forEach":I
    :cond_f
    return-void
.end method

.method public final clearPreviouslyHitModifierNodeCache()V
    .locals 1

    .line 166
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/HitPathTracker;->root:Landroidx/compose/ui/input/pointer/NodeParent;

    invoke-virtual {v0}, Landroidx/compose/ui/input/pointer/NodeParent;->clear()V

    .line 167
    return-void
.end method

.method public final dispatchChanges(Landroidx/compose/ui/input/pointer/InternalPointerEvent;Z)Z
    .locals 5
    .param p1, "internalPointerEvent"    # Landroidx/compose/ui/input/pointer/InternalPointerEvent;
    .param p2, "isInBounds"    # Z

    .line 144
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/HitPathTracker;->root:Landroidx/compose/ui/input/pointer/NodeParent;

    .line 145
    invoke-virtual {p1}, Landroidx/compose/ui/input/pointer/InternalPointerEvent;->getChanges()Landroidx/collection/LongSparseArray;

    move-result-object v1

    .line 146
    iget-object v2, p0, Landroidx/compose/ui/input/pointer/HitPathTracker;->rootCoordinates:Landroidx/compose/ui/layout/LayoutCoordinates;

    .line 147
    nop

    .line 148
    nop

    .line 144
    invoke-virtual {v0, v1, v2, p1, p2}, Landroidx/compose/ui/input/pointer/NodeParent;->buildCache(Landroidx/collection/LongSparseArray;Landroidx/compose/ui/layout/LayoutCoordinates;Landroidx/compose/ui/input/pointer/InternalPointerEvent;Z)Z

    move-result v0

    .line 143
    nop

    .line 150
    .local v0, "changed":Z
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 151
    return v1

    .line 154
    :cond_0
    iget-object v2, p0, Landroidx/compose/ui/input/pointer/HitPathTracker;->root:Landroidx/compose/ui/input/pointer/NodeParent;

    .line 155
    invoke-virtual {p1}, Landroidx/compose/ui/input/pointer/InternalPointerEvent;->getChanges()Landroidx/collection/LongSparseArray;

    move-result-object v3

    .line 156
    iget-object v4, p0, Landroidx/compose/ui/input/pointer/HitPathTracker;->rootCoordinates:Landroidx/compose/ui/layout/LayoutCoordinates;

    .line 157
    nop

    .line 158
    nop

    .line 154
    invoke-virtual {v2, v3, v4, p1, p2}, Landroidx/compose/ui/input/pointer/NodeParent;->dispatchMainEventPass(Landroidx/collection/LongSparseArray;Landroidx/compose/ui/layout/LayoutCoordinates;Landroidx/compose/ui/input/pointer/InternalPointerEvent;Z)Z

    move-result v2

    .line 153
    nop

    .line 160
    .local v2, "dispatchHit":Z
    iget-object v3, p0, Landroidx/compose/ui/input/pointer/HitPathTracker;->root:Landroidx/compose/ui/input/pointer/NodeParent;

    invoke-virtual {v3, p1}, Landroidx/compose/ui/input/pointer/NodeParent;->dispatchFinalEventPass(Landroidx/compose/ui/input/pointer/InternalPointerEvent;)Z

    move-result v3

    if-nez v3, :cond_1

    if-eqz v2, :cond_2

    :cond_1
    const/4 v1, 0x1

    .line 162
    .end local v2    # "dispatchHit":Z
    .local v1, "dispatchHit":Z
    :cond_2
    return v1
.end method

.method public final getRoot$ui_release()Landroidx/compose/ui/input/pointer/NodeParent;
    .locals 1

    .line 46
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/HitPathTracker;->root:Landroidx/compose/ui/input/pointer/NodeParent;

    return-object v0
.end method

.method public final processCancel()V
    .locals 1

    .line 176
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/HitPathTracker;->root:Landroidx/compose/ui/input/pointer/NodeParent;

    invoke-virtual {v0}, Landroidx/compose/ui/input/pointer/NodeParent;->dispatchCancel()V

    .line 177
    invoke-virtual {p0}, Landroidx/compose/ui/input/pointer/HitPathTracker;->clearPreviouslyHitModifierNodeCache()V

    .line 178
    return-void
.end method
