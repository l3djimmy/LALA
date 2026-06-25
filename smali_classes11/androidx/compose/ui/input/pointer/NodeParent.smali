.class public Landroidx/compose/ui/input/pointer/NodeParent;
.super Ljava/lang/Object;
.source "HitPathTracker.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nHitPathTracker.kt\nKotlin\n*S Kotlin\n*F\n+ 1 HitPathTracker.kt\nandroidx/compose/ui/input/pointer/NodeParent\n+ 2 MutableVector.kt\nandroidx/compose/runtime/collection/MutableVectorKt\n+ 3 MutableVector.kt\nandroidx/compose/runtime/collection/MutableVector\n*L\n1#1,643:1\n1101#2:644\n1083#2,2:645\n423#3,9:647\n423#3,9:656\n423#3,9:665\n423#3,9:674\n472#3:683\n423#3,9:684\n44#3:693\n472#3:694\n*S KotlinDebug\n*F\n+ 1 HitPathTracker.kt\nandroidx/compose/ui/input/pointer/NodeParent\n*L\n189#1:644\n189#1:645,2\n201#1:647,9\n228#1:656,9\n248#1:665,9\n257#1:674,9\n274#1:683\n298#1:684,9\n302#1:693\n303#1:694\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000R\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\u0008\u0010\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J.\u0010\n\u001a\u00020\u000b2\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\r2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u000bH\u0016J\u0010\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0011\u001a\u00020\u0012H\u0016J\u0006\u0010\u0016\u001a\u00020\u0015J\u0008\u0010\u0017\u001a\u00020\u0015H\u0016J\u0010\u0010\u0018\u001a\u00020\u000b2\u0006\u0010\u0011\u001a\u00020\u0012H\u0016J.\u0010\u0019\u001a\u00020\u000b2\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\r2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u000bH\u0016J\u001e\u0010\u001a\u001a\u00020\u00152\u0006\u0010\u001b\u001a\u00020\u001c2\u000c\u0010\u001d\u001a\u0008\u0012\u0004\u0012\u00020\u00050\tH\u0016J\u0010\u0010\u001e\u001a\u00020\u00152\u0006\u0010\u001f\u001a\u00020 H\u0016R\u0017\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u0014\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00000\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006!"
    }
    d2 = {
        "Landroidx/compose/ui/input/pointer/NodeParent;",
        "",
        "()V",
        "children",
        "Landroidx/compose/runtime/collection/MutableVector;",
        "Landroidx/compose/ui/input/pointer/Node;",
        "getChildren",
        "()Landroidx/compose/runtime/collection/MutableVector;",
        "removeMatchingPointerInputModifierNodeList",
        "Landroidx/collection/MutableObjectList;",
        "buildCache",
        "",
        "changes",
        "Landroidx/collection/LongSparseArray;",
        "Landroidx/compose/ui/input/pointer/PointerInputChange;",
        "parentCoordinates",
        "Landroidx/compose/ui/layout/LayoutCoordinates;",
        "internalPointerEvent",
        "Landroidx/compose/ui/input/pointer/InternalPointerEvent;",
        "isInBounds",
        "cleanUpHits",
        "",
        "clear",
        "dispatchCancel",
        "dispatchFinalEventPass",
        "dispatchMainEventPass",
        "removeInvalidPointerIdsAndChanges",
        "pointerIdValue",
        "",
        "hitNodes",
        "removePointerInputModifierNode",
        "pointerInputModifierNode",
        "Landroidx/compose/ui/Modifier$Node;",
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
.field private final children:Landroidx/compose/runtime/collection/MutableVector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/collection/MutableVector<",
            "Landroidx/compose/ui/input/pointer/Node;",
            ">;"
        }
    .end annotation
.end field

.field private final removeMatchingPointerInputModifierNodeList:Landroidx/collection/MutableObjectList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/MutableObjectList<",
            "Landroidx/compose/ui/input/pointer/NodeParent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Landroidx/compose/ui/input/pointer/NodeParent;->$stable:I

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 189
    const/4 v0, 0x0

    .line 644
    .local v0, "$i$f$mutableVectorOf":I
    nop

    .line 645
    const/16 v1, 0x10

    .local v1, "capacity$iv$iv":I
    const/4 v2, 0x0

    .line 646
    .local v2, "$i$f$MutableVector":I
    new-instance v3, Landroidx/compose/runtime/collection/MutableVector;

    new-array v4, v1, [Landroidx/compose/ui/input/pointer/Node;

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5}, Landroidx/compose/runtime/collection/MutableVector;-><init>([Ljava/lang/Object;I)V

    .line 644
    .end local v1    # "capacity$iv$iv":I
    .end local v2    # "$i$f$MutableVector":I
    nop

    .line 189
    .end local v0    # "$i$f$mutableVectorOf":I
    iput-object v3, p0, Landroidx/compose/ui/input/pointer/NodeParent;->children:Landroidx/compose/runtime/collection/MutableVector;

    .line 192
    new-instance v0, Landroidx/collection/MutableObjectList;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Landroidx/collection/MutableObjectList;-><init>(I)V

    iput-object v0, p0, Landroidx/compose/ui/input/pointer/NodeParent;->removeMatchingPointerInputModifierNodeList:Landroidx/collection/MutableObjectList;

    .line 188
    return-void
.end method


# virtual methods
.method public buildCache(Landroidx/collection/LongSparseArray;Landroidx/compose/ui/layout/LayoutCoordinates;Landroidx/compose/ui/input/pointer/InternalPointerEvent;Z)Z
    .locals 9
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

    .line 200
    const/4 v0, 0x0

    .line 201
    .local v0, "changed":Z
    iget-object v1, p0, Landroidx/compose/ui/input/pointer/NodeParent;->children:Landroidx/compose/runtime/collection/MutableVector;

    .local v1, "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v2, 0x0

    .line 647
    .local v2, "$i$f$forEach":I
    nop

    .line 648
    const/4 v3, 0x0

    .line 649
    .local v3, "i$iv":I
    iget-object v4, v1, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    .line 650
    .local v4, "content$iv":[Ljava/lang/Object;
    invoke-virtual {v1}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v5

    .line 651
    .local v5, "size$iv":I
    :goto_0
    if-ge v3, v5, :cond_2

    .line 652
    aget-object v6, v4, v3

    check-cast v6, Landroidx/compose/ui/input/pointer/Node;

    .local v6, "it":Landroidx/compose/ui/input/pointer/Node;
    const/4 v7, 0x0

    .line 202
    .local v7, "$i$a$-forEach-NodeParent$buildCache$1":I
    nop

    .line 203
    invoke-virtual {v6, p1, p2, p3, p4}, Landroidx/compose/ui/input/pointer/Node;->buildCache(Landroidx/collection/LongSparseArray;Landroidx/compose/ui/layout/LayoutCoordinates;Landroidx/compose/ui/input/pointer/InternalPointerEvent;Z)Z

    move-result v8

    if-nez v8, :cond_1

    .line 204
    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v8, 0x0

    goto :goto_2

    :cond_1
    :goto_1
    const/4 v8, 0x1

    .line 202
    :goto_2
    move v0, v8

    .line 205
    nop

    .line 652
    .end local v6    # "it":Landroidx/compose/ui/input/pointer/Node;
    .end local v7    # "$i$a$-forEach-NodeParent$buildCache$1":I
    nop

    .line 653
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 655
    :cond_2
    nop

    .line 206
    .end local v1    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v2    # "$i$f$forEach":I
    .end local v3    # "i$iv":I
    .end local v4    # "content$iv":[Ljava/lang/Object;
    .end local v5    # "size$iv":I
    return v0
.end method

.method public cleanUpHits(Landroidx/compose/ui/input/pointer/InternalPointerEvent;)V
    .locals 4
    .param p1, "internalPointerEvent"    # Landroidx/compose/ui/input/pointer/InternalPointerEvent;

    .line 302
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/NodeParent;->children:Landroidx/compose/runtime/collection/MutableVector;

    .local v0, "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v1, 0x0

    .line 693
    .local v1, "$i$f$getLastIndex":I
    invoke-virtual {v0}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    .line 302
    .end local v0    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v1    # "$i$f$getLastIndex":I
    nop

    .local v2, "i":I
    :goto_0
    const/4 v0, -0x1

    if-ge v0, v2, :cond_1

    .line 303
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/NodeParent;->children:Landroidx/compose/runtime/collection/MutableVector;

    .restart local v0    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v1, 0x0

    .line 694
    .local v1, "$i$f$get":I
    iget-object v3, v0, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    aget-object v0, v3, v2

    .line 303
    .end local v0    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v1    # "$i$f$get":I
    check-cast v0, Landroidx/compose/ui/input/pointer/Node;

    .line 304
    .local v0, "child":Landroidx/compose/ui/input/pointer/Node;
    invoke-virtual {v0}, Landroidx/compose/ui/input/pointer/Node;->getPointerIds()Landroidx/compose/ui/input/pointer/util/PointerIdArray;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/compose/ui/input/pointer/util/PointerIdArray;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 305
    iget-object v1, p0, Landroidx/compose/ui/input/pointer/NodeParent;->children:Landroidx/compose/runtime/collection/MutableVector;

    invoke-virtual {v1, v2}, Landroidx/compose/runtime/collection/MutableVector;->removeAt(I)Ljava/lang/Object;

    .line 302
    .end local v0    # "child":Landroidx/compose/ui/input/pointer/Node;
    :cond_0
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 308
    .end local v2    # "i":I
    :cond_1
    return-void
.end method

.method public final clear()V
    .locals 1

    .line 291
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/NodeParent;->children:Landroidx/compose/runtime/collection/MutableVector;

    invoke-virtual {v0}, Landroidx/compose/runtime/collection/MutableVector;->clear()V

    .line 292
    return-void
.end method

.method public dispatchCancel()V
    .locals 7

    .line 257
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/NodeParent;->children:Landroidx/compose/runtime/collection/MutableVector;

    .local v0, "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v1, 0x0

    .line 674
    .local v1, "$i$f$forEach":I
    nop

    .line 675
    const/4 v2, 0x0

    .line 676
    .local v2, "i$iv":I
    iget-object v3, v0, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    .line 677
    .local v3, "content$iv":[Ljava/lang/Object;
    invoke-virtual {v0}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v4

    .line 678
    .local v4, "size$iv":I
    :goto_0
    if-ge v2, v4, :cond_0

    .line 679
    aget-object v5, v3, v2

    check-cast v5, Landroidx/compose/ui/input/pointer/Node;

    .local v5, "it":Landroidx/compose/ui/input/pointer/Node;
    const/4 v6, 0x0

    .line 257
    .local v6, "$i$a$-forEach-NodeParent$dispatchCancel$1":I
    invoke-virtual {v5}, Landroidx/compose/ui/input/pointer/Node;->dispatchCancel()V

    .line 679
    .end local v5    # "it":Landroidx/compose/ui/input/pointer/Node;
    .end local v6    # "$i$a$-forEach-NodeParent$dispatchCancel$1":I
    nop

    .line 680
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 682
    :cond_0
    nop

    .line 258
    .end local v0    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v1    # "$i$f$forEach":I
    .end local v2    # "i$iv":I
    .end local v3    # "content$iv":[Ljava/lang/Object;
    .end local v4    # "size$iv":I
    return-void
.end method

.method public dispatchFinalEventPass(Landroidx/compose/ui/input/pointer/InternalPointerEvent;)Z
    .locals 9
    .param p1, "internalPointerEvent"    # Landroidx/compose/ui/input/pointer/InternalPointerEvent;

    .line 247
    const/4 v0, 0x0

    .line 248
    .local v0, "dispatched":Z
    iget-object v1, p0, Landroidx/compose/ui/input/pointer/NodeParent;->children:Landroidx/compose/runtime/collection/MutableVector;

    .local v1, "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v2, 0x0

    .line 665
    .local v2, "$i$f$forEach":I
    nop

    .line 666
    const/4 v3, 0x0

    .line 667
    .local v3, "i$iv":I
    iget-object v4, v1, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    .line 668
    .local v4, "content$iv":[Ljava/lang/Object;
    invoke-virtual {v1}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v5

    .line 669
    .local v5, "size$iv":I
    :goto_0
    if-ge v3, v5, :cond_2

    .line 670
    aget-object v6, v4, v3

    check-cast v6, Landroidx/compose/ui/input/pointer/Node;

    .local v6, "it":Landroidx/compose/ui/input/pointer/Node;
    const/4 v7, 0x0

    .line 249
    .local v7, "$i$a$-forEach-NodeParent$dispatchFinalEventPass$1":I
    invoke-virtual {v6, p1}, Landroidx/compose/ui/input/pointer/Node;->dispatchFinalEventPass(Landroidx/compose/ui/input/pointer/InternalPointerEvent;)Z

    move-result v8

    if-nez v8, :cond_1

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v8, 0x0

    goto :goto_2

    :cond_1
    :goto_1
    const/4 v8, 0x1

    :goto_2
    move v0, v8

    .line 250
    nop

    .line 670
    .end local v6    # "it":Landroidx/compose/ui/input/pointer/Node;
    .end local v7    # "$i$a$-forEach-NodeParent$dispatchFinalEventPass$1":I
    nop

    .line 671
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 673
    :cond_2
    nop

    .line 251
    .end local v1    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v2    # "$i$f$forEach":I
    .end local v3    # "i$iv":I
    .end local v4    # "content$iv":[Ljava/lang/Object;
    .end local v5    # "size$iv":I
    invoke-virtual {p0, p1}, Landroidx/compose/ui/input/pointer/NodeParent;->cleanUpHits(Landroidx/compose/ui/input/pointer/InternalPointerEvent;)V

    .line 252
    return v0
.end method

.method public dispatchMainEventPass(Landroidx/collection/LongSparseArray;Landroidx/compose/ui/layout/LayoutCoordinates;Landroidx/compose/ui/input/pointer/InternalPointerEvent;Z)Z
    .locals 9
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

    .line 227
    const/4 v0, 0x0

    .line 228
    .local v0, "dispatched":Z
    iget-object v1, p0, Landroidx/compose/ui/input/pointer/NodeParent;->children:Landroidx/compose/runtime/collection/MutableVector;

    .local v1, "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v2, 0x0

    .line 656
    .local v2, "$i$f$forEach":I
    nop

    .line 657
    const/4 v3, 0x0

    .line 658
    .local v3, "i$iv":I
    iget-object v4, v1, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    .line 659
    .local v4, "content$iv":[Ljava/lang/Object;
    invoke-virtual {v1}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v5

    .line 660
    .local v5, "size$iv":I
    :goto_0
    if-ge v3, v5, :cond_2

    .line 661
    aget-object v6, v4, v3

    check-cast v6, Landroidx/compose/ui/input/pointer/Node;

    .local v6, "it":Landroidx/compose/ui/input/pointer/Node;
    const/4 v7, 0x0

    .line 229
    .local v7, "$i$a$-forEach-NodeParent$dispatchMainEventPass$1":I
    nop

    .line 230
    nop

    .line 231
    nop

    .line 232
    nop

    .line 233
    nop

    .line 234
    nop

    .line 230
    invoke-virtual {v6, p1, p2, p3, p4}, Landroidx/compose/ui/input/pointer/Node;->dispatchMainEventPass(Landroidx/collection/LongSparseArray;Landroidx/compose/ui/layout/LayoutCoordinates;Landroidx/compose/ui/input/pointer/InternalPointerEvent;Z)Z

    move-result v8

    if-nez v8, :cond_1

    .line 235
    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v8, 0x0

    goto :goto_2

    :cond_1
    :goto_1
    const/4 v8, 0x1

    .line 229
    :goto_2
    move v0, v8

    .line 236
    nop

    .line 661
    .end local v6    # "it":Landroidx/compose/ui/input/pointer/Node;
    .end local v7    # "$i$a$-forEach-NodeParent$dispatchMainEventPass$1":I
    nop

    .line 662
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 664
    :cond_2
    nop

    .line 237
    .end local v1    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v2    # "$i$f$forEach":I
    .end local v3    # "i$iv":I
    .end local v4    # "content$iv":[Ljava/lang/Object;
    .end local v5    # "size$iv":I
    return v0
.end method

.method public final getChildren()Landroidx/compose/runtime/collection/MutableVector;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/compose/runtime/collection/MutableVector<",
            "Landroidx/compose/ui/input/pointer/Node;",
            ">;"
        }
    .end annotation

    .line 189
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/NodeParent;->children:Landroidx/compose/runtime/collection/MutableVector;

    return-object v0
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

    .line 298
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/NodeParent;->children:Landroidx/compose/runtime/collection/MutableVector;

    .local v0, "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v1, 0x0

    .line 684
    .local v1, "$i$f$forEach":I
    nop

    .line 685
    const/4 v2, 0x0

    .line 686
    .local v2, "i$iv":I
    iget-object v3, v0, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    .line 687
    .local v3, "content$iv":[Ljava/lang/Object;
    invoke-virtual {v0}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v4

    .line 688
    .local v4, "size$iv":I
    :goto_0
    if-ge v2, v4, :cond_0

    .line 689
    aget-object v5, v3, v2

    check-cast v5, Landroidx/compose/ui/input/pointer/Node;

    .local v5, "it":Landroidx/compose/ui/input/pointer/Node;
    const/4 v6, 0x0

    .line 298
    .local v6, "$i$a$-forEach-NodeParent$removeInvalidPointerIdsAndChanges$1":I
    invoke-virtual {v5, p1, p2, p3}, Landroidx/compose/ui/input/pointer/Node;->removeInvalidPointerIdsAndChanges(JLandroidx/collection/MutableObjectList;)V

    .line 689
    .end local v5    # "it":Landroidx/compose/ui/input/pointer/Node;
    .end local v6    # "$i$a$-forEach-NodeParent$removeInvalidPointerIdsAndChanges$1":I
    nop

    .line 690
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 692
    :cond_0
    nop

    .line 299
    .end local v0    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v1    # "$i$f$forEach":I
    .end local v2    # "i$iv":I
    .end local v3    # "content$iv":[Ljava/lang/Object;
    .end local v4    # "size$iv":I
    return-void
.end method

.method public removePointerInputModifierNode(Landroidx/compose/ui/Modifier$Node;)V
    .locals 5
    .param p1, "pointerInputModifierNode"    # Landroidx/compose/ui/Modifier$Node;

    .line 261
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/NodeParent;->removeMatchingPointerInputModifierNodeList:Landroidx/collection/MutableObjectList;

    invoke-virtual {v0}, Landroidx/collection/MutableObjectList;->clear()V

    .line 264
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/NodeParent;->removeMatchingPointerInputModifierNodeList:Landroidx/collection/MutableObjectList;

    invoke-virtual {v0, p0}, Landroidx/collection/MutableObjectList;->add(Ljava/lang/Object;)Z

    .line 266
    :cond_0
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/NodeParent;->removeMatchingPointerInputModifierNodeList:Landroidx/collection/MutableObjectList;

    invoke-virtual {v0}, Landroidx/collection/MutableObjectList;->isNotEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 268
    iget-object v0, p0, Landroidx/compose/ui/input/pointer/NodeParent;->removeMatchingPointerInputModifierNodeList:Landroidx/collection/MutableObjectList;

    .line 269
    iget-object v1, p0, Landroidx/compose/ui/input/pointer/NodeParent;->removeMatchingPointerInputModifierNodeList:Landroidx/collection/MutableObjectList;

    invoke-virtual {v1}, Landroidx/collection/MutableObjectList;->getSize()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .line 268
    invoke-virtual {v0, v1}, Landroidx/collection/MutableObjectList;->removeAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/compose/ui/input/pointer/NodeParent;

    .line 267
    nop

    .line 272
    .local v0, "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    const/4 v1, 0x0

    .line 273
    .local v1, "index":I
    :goto_0
    iget-object v2, v0, Landroidx/compose/ui/input/pointer/NodeParent;->children:Landroidx/compose/runtime/collection/MutableVector;

    invoke-virtual {v2}, Landroidx/compose/runtime/collection/MutableVector;->getSize()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 274
    iget-object v2, v0, Landroidx/compose/ui/input/pointer/NodeParent;->children:Landroidx/compose/runtime/collection/MutableVector;

    .local v2, "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    const/4 v3, 0x0

    .line 683
    .local v3, "$i$f$get":I
    iget-object v4, v2, Landroidx/compose/runtime/collection/MutableVector;->content:[Ljava/lang/Object;

    aget-object v2, v4, v1

    .line 274
    .end local v2    # "this_$iv":Landroidx/compose/runtime/collection/MutableVector;
    .end local v3    # "$i$f$get":I
    check-cast v2, Landroidx/compose/ui/input/pointer/Node;

    .line 276
    .local v2, "child":Landroidx/compose/ui/input/pointer/Node;
    invoke-virtual {v2}, Landroidx/compose/ui/input/pointer/Node;->getModifierNode()Landroidx/compose/ui/Modifier$Node;

    move-result-object v3

    invoke-static {v3, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 277
    iget-object v3, v0, Landroidx/compose/ui/input/pointer/NodeParent;->children:Landroidx/compose/runtime/collection/MutableVector;

    invoke-virtual {v3, v2}, Landroidx/compose/runtime/collection/MutableVector;->remove(Ljava/lang/Object;)Z

    .line 278
    invoke-virtual {v2}, Landroidx/compose/ui/input/pointer/Node;->dispatchCancel()V

    goto :goto_0

    .line 282
    :cond_1
    iget-object v3, p0, Landroidx/compose/ui/input/pointer/NodeParent;->removeMatchingPointerInputModifierNodeList:Landroidx/collection/MutableObjectList;

    invoke-virtual {v3, v2}, Landroidx/collection/MutableObjectList;->add(Ljava/lang/Object;)Z

    .line 283
    nop

    .end local v2    # "child":Landroidx/compose/ui/input/pointer/Node;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 287
    .end local v0    # "parent":Landroidx/compose/ui/input/pointer/NodeParent;
    .end local v1    # "index":I
    :cond_2
    return-void
.end method
