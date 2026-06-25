.class public final Landroidx/compose/ui/spatial/ThrottledCallbacksKt;
.super Ljava/lang/Object;
.source "ThrottledCallbacks.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nThrottledCallbacks.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ThrottledCallbacks.kt\nandroidx/compose/ui/spatial/ThrottledCallbacksKt\n+ 2 NodeKind.kt\nandroidx/compose/ui/node/Nodes\n*L\n1#1,488:1\n83#2:489\n*S KotlinDebug\n*F\n+ 1 ThrottledCallbacks.kt\nandroidx/compose/ui/spatial/ThrottledCallbacksKt\n*L\n459#1:489\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u001aF\u0010\u0000\u001a\u0004\u0018\u00010\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\u00082\u0008\u0010\n\u001a\u0004\u0018\u00010\u000bH\u0000\u00f8\u0001\u0000\u00a2\u0006\u0004\u0008\u000c\u0010\r\u0082\u0002\u0007\n\u0005\u0008\u00a1\u001e0\u0001\u00a8\u0006\u000e"
    }
    d2 = {
        "rectInfoFor",
        "Landroidx/compose/ui/spatial/RelativeLayoutBounds;",
        "node",
        "Landroidx/compose/ui/node/DelegatableNode;",
        "topLeft",
        "",
        "bottomRight",
        "windowOffset",
        "Landroidx/compose/ui/unit/IntOffset;",
        "screenOffset",
        "viewToWindowMatrix",
        "Landroidx/compose/ui/graphics/Matrix;",
        "rectInfoFor-Q-MZNJw",
        "(Landroidx/compose/ui/node/DelegatableNode;JJJJ[F)Landroidx/compose/ui/spatial/RelativeLayoutBounds;",
        "ui_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final rectInfoFor-Q-MZNJw(Landroidx/compose/ui/node/DelegatableNode;JJJJ[F)Landroidx/compose/ui/spatial/RelativeLayoutBounds;
    .locals 16
    .param p0, "node"    # Landroidx/compose/ui/node/DelegatableNode;
    .param p1, "topLeft"    # J
    .param p3, "bottomRight"    # J
    .param p5, "windowOffset"    # J
    .param p7, "screenOffset"    # J
    .param p9, "viewToWindowMatrix"    # [F

    .line 459
    const/4 v0, 0x0

    .line 489
    .local v0, "$i$f$getLayout-OLwlOKw":I
    const/4 v1, 0x2

    invoke-static {v1}, Landroidx/compose/ui/node/NodeKind;->constructor-impl(I)I

    move-result v0

    .line 459
    .end local v0    # "$i$f$getLayout-OLwlOKw":I
    move-object/from16 v12, p0

    invoke-static {v12, v0}, Landroidx/compose/ui/node/DelegatableNodeKt;->requireCoordinator-64DMado(Landroidx/compose/ui/node/DelegatableNode;I)Landroidx/compose/ui/node/NodeCoordinator;

    move-result-object v0

    .line 460
    .local v0, "coordinator":Landroidx/compose/ui/node/NodeCoordinator;
    invoke-static {v12}, Landroidx/compose/ui/node/DelegatableNodeKt;->requireLayoutNode(Landroidx/compose/ui/node/DelegatableNode;)Landroidx/compose/ui/node/LayoutNode;

    move-result-object v14

    .line 461
    .local v14, "layoutNode":Landroidx/compose/ui/node/LayoutNode;
    invoke-virtual {v14}, Landroidx/compose/ui/node/LayoutNode;->isPlaced()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    return-object v3

    .line 467
    :cond_0
    invoke-virtual {v14}, Landroidx/compose/ui/node/LayoutNode;->getOuterCoordinator$ui_release()Landroidx/compose/ui/node/NodeCoordinator;

    move-result-object v2

    const/4 v4, 0x0

    if-eq v2, v0, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    move v2, v4

    :goto_0
    move v15, v2

    .line 468
    .local v15, "needsTransform":Z
    if-eqz v15, :cond_2

    .line 469
    invoke-virtual {v14}, Landroidx/compose/ui/node/LayoutNode;->getOuterCoordinator$ui_release()Landroidx/compose/ui/node/NodeCoordinator;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/ui/node/NodeCoordinator;->getCoordinates()Landroidx/compose/ui/layout/LayoutCoordinates;

    move-result-object v2

    move-object v5, v0

    check-cast v5, Landroidx/compose/ui/layout/LayoutCoordinates;

    invoke-static {v2, v5, v4, v1, v3}, Landroidx/compose/ui/layout/LayoutCoordinates;->localBoundingBoxOf$default(Landroidx/compose/ui/layout/LayoutCoordinates;Landroidx/compose/ui/layout/LayoutCoordinates;ZILjava/lang/Object;)Landroidx/compose/ui/geometry/Rect;

    move-result-object v1

    .line 470
    .local v1, "transformed":Landroidx/compose/ui/geometry/Rect;
    new-instance v2, Landroidx/compose/ui/spatial/RelativeLayoutBounds;

    .line 471
    invoke-virtual {v1}, Landroidx/compose/ui/geometry/Rect;->getTopLeft-F1C5BW0()J

    move-result-wide v3

    invoke-static {v3, v4}, Landroidx/compose/ui/unit/IntOffsetKt;->round-k-4lQ0M(J)J

    move-result-wide v3

    .line 472
    invoke-virtual {v1}, Landroidx/compose/ui/geometry/Rect;->getBottomRight-F1C5BW0()J

    move-result-wide v5

    invoke-static {v5, v6}, Landroidx/compose/ui/unit/IntOffsetKt;->round-k-4lQ0M(J)J

    move-result-wide v5

    .line 473
    nop

    .line 474
    nop

    .line 475
    nop

    .line 476
    nop

    .line 470
    const/4 v13, 0x0

    move-wide/from16 v7, p5

    move-wide/from16 v9, p7

    move-object/from16 v11, p9

    invoke-direct/range {v2 .. v13}, Landroidx/compose/ui/spatial/RelativeLayoutBounds;-><init>(JJJJ[FLandroidx/compose/ui/node/DelegatableNode;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .end local v1    # "transformed":Landroidx/compose/ui/geometry/Rect;
    goto :goto_1

    .line 479
    :cond_2
    new-instance v2, Landroidx/compose/ui/spatial/RelativeLayoutBounds;

    .line 480
    nop

    .line 481
    nop

    .line 482
    nop

    .line 483
    nop

    .line 484
    nop

    .line 485
    nop

    .line 479
    const/4 v13, 0x0

    move-object/from16 v12, p0

    move-wide/from16 v3, p1

    move-wide/from16 v5, p3

    move-wide/from16 v7, p5

    move-wide/from16 v9, p7

    move-object/from16 v11, p9

    invoke-direct/range {v2 .. v13}, Landroidx/compose/ui/spatial/RelativeLayoutBounds;-><init>(JJJJ[FLandroidx/compose/ui/node/DelegatableNode;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 468
    :goto_1
    return-object v2
.end method
