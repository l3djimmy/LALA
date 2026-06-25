.class public final Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;
.super Ljava/lang/Object;
.source "PdfRendererCompose.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPdfRendererCompose.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PdfRendererCompose.kt\ncom/rajat/pdfviewer/compose/PdfRendererComposeKt\n+ 2 CompositionLocal.kt\nandroidx/compose/runtime/CompositionLocal\n+ 3 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 4 SnapshotState.kt\nandroidx/compose/runtime/SnapshotStateKt__SnapshotStateKt\n*L\n1#1,129:1\n75#2:130\n75#2:131\n1247#3,6:132\n1247#3,6:138\n1247#3,6:144\n1247#3,6:150\n1247#3,6:156\n1247#3,6:162\n1247#3,6:168\n85#4:174\n113#4,2:175\n85#4:177\n113#4,2:178\n*S KotlinDebug\n*F\n+ 1 PdfRendererCompose.kt\ncom/rajat/pdfviewer/compose/PdfRendererComposeKt\n*L\n31#1:130\n37#1:131\n39#1:132,6\n42#1:138,6\n43#1:144,6\n50#1:150,6\n53#1:156,6\n86#1:162,6\n94#1:168,6\n42#1:174\n42#1:175,2\n50#1:177\n50#1:178,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000T\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\u001a\u0083\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t2\u0008\u0008\u0002\u0010\n\u001a\u00020\u000b2\u0008\u0008\u0002\u0010\u000c\u001a\u00020\r2\n\u0008\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\n\u0008\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112\n\u0008\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00132\u0016\u0008\u0002\u0010\u0014\u001a\u0010\u0012\u0004\u0012\u00020\u0016\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u0015H\u0007\u00a2\u0006\u0002\u0010\u0017\u00a8\u0006\u0018\u00b2\u0006\u000c\u0010\u0019\u001a\u0004\u0018\u00010\u001aX\u008a\u008e\u0002\u00b2\u0006\n\u0010\u001b\u001a\u00020\u001cX\u008a\u008e\u0002"
    }
    d2 = {
        "PdfRendererViewCompose",
        "",
        "source",
        "Lcom/rajat/pdfviewer/util/PdfSource;",
        "modifier",
        "Landroidx/compose/ui/Modifier;",
        "headers",
        "Lcom/rajat/pdfviewer/HeaderData;",
        "cacheStrategy",
        "Lcom/rajat/pdfviewer/util/CacheStrategy;",
        "maxZoomScale",
        "",
        "lifecycleOwner",
        "Landroidx/lifecycle/LifecycleOwner;",
        "jumpToPage",
        "",
        "statusCallBack",
        "Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;",
        "zoomListener",
        "Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;",
        "onReady",
        "Lkotlin/Function1;",
        "Lcom/rajat/pdfviewer/PdfRendererView;",
        "(Lcom/rajat/pdfviewer/util/PdfSource;Landroidx/compose/ui/Modifier;Lcom/rajat/pdfviewer/HeaderData;Lcom/rajat/pdfviewer/util/CacheStrategy;FLandroidx/lifecycle/LifecycleOwner;Ljava/lang/Integer;Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V",
        "pdfViewer_release",
        "resolvedFile",
        "Ljava/io/File;",
        "hasInit",
        ""
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final PdfRendererViewCompose(Lcom/rajat/pdfviewer/util/PdfSource;Landroidx/compose/ui/Modifier;Lcom/rajat/pdfviewer/HeaderData;Lcom/rajat/pdfviewer/util/CacheStrategy;FLandroidx/lifecycle/LifecycleOwner;Ljava/lang/Integer;Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V
    .locals 28
    .param p0, "source"    # Lcom/rajat/pdfviewer/util/PdfSource;
    .param p1, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p2, "headers"    # Lcom/rajat/pdfviewer/HeaderData;
    .param p3, "cacheStrategy"    # Lcom/rajat/pdfviewer/util/CacheStrategy;
    .param p4, "maxZoomScale"    # F
    .param p5, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;
    .param p6, "jumpToPage"    # Ljava/lang/Integer;
    .param p7, "statusCallBack"    # Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    .param p8, "zoomListener"    # Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    .param p9, "onReady"    # Lkotlin/jvm/functions/Function1;
    .param p10, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p11, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/util/PdfSource;",
            "Landroidx/compose/ui/Modifier;",
            "Lcom/rajat/pdfviewer/HeaderData;",
            "Lcom/rajat/pdfviewer/util/CacheStrategy;",
            "F",
            "Landroidx/lifecycle/LifecycleOwner;",
            "Ljava/lang/Integer;",
            "Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;",
            "Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/rajat/pdfviewer/PdfRendererView;",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "II)V"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p7

    move-object/from16 v2, p8

    move/from16 v11, p11

    move/from16 v12, p12

    const-string/jumbo v3, "source"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    const v3, 0x793bdcb1

    move-object/from16 v4, p10

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v4

    .end local p10    # "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "$composer":Landroidx/compose/runtime/Composer;
    const-string v5, "C(PdfRendererViewCompose)P(7,5,1!1,4,3!1,8,9)36@1485L7,37@1523L39,38@1584L51,41@1693L48,42@1769L143,42@1746L166,49@1972L42,52@2097L1129,85@3263L275,93@3557L1305,84@3232L1699:PdfRendererCompose.kt#jq4ckl"

    invoke-static {v4, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v5, p11

    .local v5, "$dirty":I
    and-int/lit8 v6, v12, 0x1

    if-eqz v6, :cond_0

    or-int/lit8 v5, v5, 0x6

    goto :goto_2

    :cond_0
    and-int/lit8 v6, v11, 0x6

    if-nez v6, :cond_3

    and-int/lit8 v6, v11, 0x8

    if-nez v6, :cond_1

    invoke-interface {v4, v1}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v6

    goto :goto_0

    :cond_1
    invoke-interface {v4, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    :goto_0
    if-eqz v6, :cond_2

    const/4 v6, 0x4

    goto :goto_1

    :cond_2
    const/4 v6, 0x2

    :goto_1
    or-int/2addr v5, v6

    :cond_3
    :goto_2
    and-int/lit8 v6, v12, 0x2

    if-eqz v6, :cond_4

    or-int/lit8 v5, v5, 0x30

    move-object/from16 v9, p1

    goto :goto_4

    :cond_4
    and-int/lit8 v9, v11, 0x30

    if-nez v9, :cond_6

    move-object/from16 v9, p1

    invoke-interface {v4, v9}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    const/16 v10, 0x20

    goto :goto_3

    :cond_5
    const/16 v10, 0x10

    :goto_3
    or-int/2addr v5, v10

    goto :goto_4

    :cond_6
    move-object/from16 v9, p1

    :goto_4
    and-int/lit16 v10, v11, 0x180

    if-nez v10, :cond_9

    and-int/lit8 v10, v12, 0x4

    if-nez v10, :cond_7

    move-object/from16 v10, p2

    invoke-interface {v4, v10}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_8

    const/16 v13, 0x100

    goto :goto_5

    :cond_7
    move-object/from16 v10, p2

    :cond_8
    const/16 v13, 0x80

    :goto_5
    or-int/2addr v5, v13

    goto :goto_6

    :cond_9
    move-object/from16 v10, p2

    :goto_6
    and-int/lit8 v13, v12, 0x8

    if-eqz v13, :cond_a

    or-int/lit16 v5, v5, 0xc00

    goto :goto_9

    :cond_a
    and-int/lit16 v14, v11, 0xc00

    if-nez v14, :cond_d

    if-nez p3, :cond_b

    const/4 v14, -0x1

    goto :goto_7

    :cond_b
    move-object/from16 v14, p3

    check-cast v14, Ljava/lang/Enum;

    invoke-virtual {v14}, Ljava/lang/Enum;->ordinal()I

    move-result v14

    :goto_7
    invoke-interface {v4, v14}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v14

    if-eqz v14, :cond_c

    const/16 v14, 0x800

    goto :goto_8

    :cond_c
    const/16 v14, 0x400

    :goto_8
    or-int/2addr v5, v14

    :cond_d
    :goto_9
    and-int/lit8 v14, v12, 0x10

    if-eqz v14, :cond_e

    or-int/lit16 v5, v5, 0x6000

    move/from16 v8, p4

    goto :goto_b

    :cond_e
    and-int/lit16 v8, v11, 0x6000

    if-nez v8, :cond_10

    move/from16 v8, p4

    invoke-interface {v4, v8}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v18

    if-eqz v18, :cond_f

    const/16 v18, 0x4000

    goto :goto_a

    :cond_f
    const/16 v18, 0x2000

    :goto_a
    or-int v5, v5, v18

    goto :goto_b

    :cond_10
    move/from16 v8, p4

    :goto_b
    const/high16 v18, 0x30000

    and-int v18, v11, v18

    if-nez v18, :cond_13

    and-int/lit8 v18, v12, 0x20

    if-nez v18, :cond_11

    move-object/from16 v7, p5

    invoke-interface {v4, v7}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_12

    const/high16 v19, 0x20000

    goto :goto_c

    :cond_11
    move-object/from16 v7, p5

    :cond_12
    const/high16 v19, 0x10000

    :goto_c
    or-int v5, v5, v19

    goto :goto_d

    :cond_13
    move-object/from16 v7, p5

    :goto_d
    and-int/lit8 v19, v12, 0x40

    const/high16 v20, 0x180000

    if-eqz v19, :cond_14

    or-int v5, v5, v20

    move-object/from16 v3, p6

    goto :goto_f

    :cond_14
    and-int v20, v11, v20

    if-nez v20, :cond_16

    move-object/from16 v3, p6

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_15

    const/high16 v21, 0x100000

    goto :goto_e

    :cond_15
    const/high16 v21, 0x80000

    :goto_e
    or-int v5, v5, v21

    goto :goto_f

    :cond_16
    move-object/from16 v3, p6

    :goto_f
    and-int/lit16 v15, v12, 0x80

    const/high16 v22, 0xc00000

    if-eqz v15, :cond_17

    :goto_10
    or-int v5, v5, v22

    goto :goto_12

    :cond_17
    and-int v22, v11, v22

    if-nez v22, :cond_1a

    const/high16 v22, 0x1000000

    and-int v22, v11, v22

    if-nez v22, :cond_18

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v22

    goto :goto_11

    :cond_18
    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v22

    :goto_11
    if-eqz v22, :cond_19

    const/high16 v22, 0x800000

    goto :goto_10

    :cond_19
    const/high16 v22, 0x400000

    goto :goto_10

    :cond_1a
    :goto_12
    and-int/lit16 v0, v12, 0x100

    move/from16 v22, v0

    const/high16 v23, 0x8000000

    const/high16 v24, 0x6000000

    if-eqz v22, :cond_1b

    :goto_13
    or-int v5, v5, v24

    goto :goto_15

    :cond_1b
    and-int v24, v11, v24

    if-nez v24, :cond_1e

    and-int v24, v11, v23

    if-nez v24, :cond_1c

    invoke-interface {v4, v2}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v24

    goto :goto_14

    :cond_1c
    invoke-interface {v4, v2}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v24

    :goto_14
    if-eqz v24, :cond_1d

    const/high16 v24, 0x4000000

    goto :goto_13

    :cond_1d
    const/high16 v24, 0x2000000

    goto :goto_13

    :cond_1e
    :goto_15
    and-int/lit16 v0, v12, 0x200

    const/high16 v25, 0x30000000

    if-eqz v0, :cond_1f

    or-int v5, v5, v25

    move/from16 v25, v0

    move-object/from16 v0, p9

    goto :goto_17

    :cond_1f
    and-int v25, v11, v25

    if-nez v25, :cond_21

    move/from16 v25, v0

    move-object/from16 v0, p9

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_20

    const/high16 v26, 0x20000000

    goto :goto_16

    :cond_20
    const/high16 v26, 0x10000000

    :goto_16
    or-int v5, v5, v26

    goto :goto_17

    :cond_21
    move/from16 v25, v0

    move-object/from16 v0, p9

    :goto_17
    const v26, 0x12492493

    and-int v0, v5, v26

    const v2, 0x12492492

    if-ne v0, v2, :cond_23

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->getSkipping()Z

    move-result v0

    if-nez v0, :cond_22

    goto :goto_18

    .line 85
    :cond_22
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move-object v13, v4

    move v14, v5

    move-object v6, v7

    move v5, v8

    move-object v2, v9

    move-object/from16 v4, p3

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object v7, v3

    move-object v3, v10

    move-object/from16 v10, p9

    goto/16 :goto_41

    .line 36
    :cond_23
    :goto_18
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v0, "30@1246L7"

    invoke-static {v4, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, v11, 0x1

    const/4 v2, 0x1

    if-eqz v0, :cond_27

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v0

    if-eqz v0, :cond_24

    goto :goto_19

    .line 35
    :cond_24
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v0, v12, 0x4

    if-eqz v0, :cond_25

    and-int/lit16 v5, v5, -0x381

    :cond_25
    and-int/lit8 v0, v12, 0x20

    if-eqz v0, :cond_26

    const v0, -0x70001

    and-int/2addr v0, v5

    move-object/from16 v2, p7

    move-object/from16 v5, p8

    move v13, v0

    move v6, v8

    move-object/from16 v0, p3

    move-object/from16 v8, p9

    .end local v5    # "$dirty":I
    .local v0, "$dirty":I
    goto/16 :goto_1f

    .end local v0    # "$dirty":I
    .restart local v5    # "$dirty":I
    :cond_26
    move-object/from16 v0, p3

    move-object/from16 v2, p7

    move v13, v5

    move v6, v8

    move-object/from16 v5, p8

    move-object/from16 v8, p9

    goto/16 :goto_1f

    .line 36
    :cond_27
    :goto_19
    if-eqz v6, :cond_28

    .line 27
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    move-object v9, v0

    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local v9, "modifier":Landroidx/compose/ui/Modifier;
    :cond_28
    and-int/lit8 v0, v12, 0x4

    if-eqz v0, :cond_29

    .line 28
    new-instance v0, Lcom/rajat/pdfviewer/HeaderData;

    const/4 v6, 0x0

    invoke-direct {v0, v6, v2, v6}, Lcom/rajat/pdfviewer/HeaderData;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .end local p2    # "headers":Lcom/rajat/pdfviewer/HeaderData;
    .local v0, "headers":Lcom/rajat/pdfviewer/HeaderData;
    and-int/lit16 v5, v5, -0x381

    move-object v10, v0

    .end local v0    # "headers":Lcom/rajat/pdfviewer/HeaderData;
    .local v10, "headers":Lcom/rajat/pdfviewer/HeaderData;
    :cond_29
    if-eqz v13, :cond_2a

    .line 29
    sget-object v0, Lcom/rajat/pdfviewer/util/CacheStrategy;->MAXIMIZE_PERFORMANCE:Lcom/rajat/pdfviewer/util/CacheStrategy;

    .end local p3    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .local v0, "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    goto :goto_1a

    .line 28
    .end local v0    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .restart local p3    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    :cond_2a
    move-object/from16 v0, p3

    .line 29
    .end local p3    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .restart local v0    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    :goto_1a
    if-eqz v14, :cond_2b

    .line 30
    const/high16 v6, 0x40400000    # 3.0f

    .end local p4    # "maxZoomScale":F
    .local v6, "maxZoomScale":F
    goto :goto_1b

    .line 29
    .end local v6    # "maxZoomScale":F
    .restart local p4    # "maxZoomScale":F
    :cond_2b
    move v6, v8

    .line 30
    .end local p4    # "maxZoomScale":F
    .restart local v6    # "maxZoomScale":F
    :goto_1b
    and-int/lit8 v8, v12, 0x20

    if-eqz v8, :cond_2c

    .line 31
    invoke-static {}, Landroidx/lifecycle/compose/LocalLifecycleOwnerKt;->getLocalLifecycleOwner()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v8

    check-cast v8, Landroidx/compose/runtime/CompositionLocal;

    .local v8, "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    const/4 v13, 0x0

    .local v13, "$changed$iv":I
    const/4 v14, 0x0

    .line 130
    .local v14, "$i$f$getCurrent":I
    const v2, 0x789c5f52

    move-object/from16 p1, v0

    .end local v0    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .local p1, "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    const-string v0, "CC(<get-current>):CompositionLocal.kt#9igjgp"

    invoke-static {v4, v2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v4, v8}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .end local v8    # "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    .end local v13    # "$changed$iv":I
    .end local v14    # "$i$f$getCurrent":I
    check-cast v0, Landroidx/lifecycle/LifecycleOwner;

    .end local p5    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .local v0, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    const v2, -0x70001

    and-int/2addr v5, v2

    move-object v7, v0

    goto :goto_1c

    .line 30
    .end local p1    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .local v0, "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .restart local p5    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    :cond_2c
    move-object/from16 p1, v0

    .line 130
    .end local v0    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .end local p5    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .local v7, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local p1    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    :goto_1c
    if-eqz v19, :cond_2d

    .line 32
    const/4 v0, 0x0

    move-object v3, v0

    .end local p6    # "jumpToPage":Ljava/lang/Integer;
    .local v3, "jumpToPage":Ljava/lang/Integer;
    :cond_2d
    if-eqz v15, :cond_2e

    .line 33
    const/4 v0, 0x0

    .end local p7    # "statusCallBack":Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    .local v0, "statusCallBack":Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    goto :goto_1d

    .line 32
    .end local v0    # "statusCallBack":Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    .restart local p7    # "statusCallBack":Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    :cond_2e
    move-object/from16 v0, p7

    .line 33
    .end local p7    # "statusCallBack":Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    .restart local v0    # "statusCallBack":Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    :goto_1d
    if-eqz v22, :cond_2f

    .line 34
    const/4 v2, 0x0

    .end local p8    # "zoomListener":Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    .local v2, "zoomListener":Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    goto :goto_1e

    .line 33
    .end local v2    # "zoomListener":Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    .restart local p8    # "zoomListener":Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    :cond_2f
    move-object/from16 v2, p8

    .line 34
    .end local p8    # "zoomListener":Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    .restart local v2    # "zoomListener":Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    :goto_1e
    if-eqz v25, :cond_30

    .line 35
    const/4 v8, 0x0

    move v13, v5

    move-object v5, v2

    move-object v2, v0

    move-object/from16 v0, p1

    .end local p9    # "onReady":Lkotlin/jvm/functions/Function1;
    .local v8, "onReady":Lkotlin/jvm/functions/Function1;
    goto :goto_1f

    .line 34
    .end local v8    # "onReady":Lkotlin/jvm/functions/Function1;
    .restart local p9    # "onReady":Lkotlin/jvm/functions/Function1;
    :cond_30
    move-object/from16 v8, p9

    move v13, v5

    move-object v5, v2

    move-object v2, v0

    move-object/from16 v0, p1

    .line 35
    .end local p1    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .end local p9    # "onReady":Lkotlin/jvm/functions/Function1;
    .local v0, "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .local v2, "statusCallBack":Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    .local v5, "zoomListener":Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    .restart local v8    # "onReady":Lkotlin/jvm/functions/Function1;
    .local v13, "$dirty":I
    :goto_1f
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v14

    if-eqz v14, :cond_31

    const-string v14, "com.rajat.pdfviewer.compose.PdfRendererViewCompose (PdfRendererCompose.kt:35)"

    move-object/from16 p8, v0

    const v0, 0x793bdcb1

    const/4 v15, -0x1

    .end local v0    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .local p8, "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    invoke-static {v0, v13, v15, v14}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    goto :goto_20

    .end local p8    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .restart local v0    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    :cond_31
    move-object/from16 p8, v0

    .line 37
    .end local v0    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .restart local p8    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    :goto_20
    invoke-static {}, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->getLocalContext()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v0

    check-cast v0, Landroidx/compose/runtime/CompositionLocal;

    .local v0, "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    const/4 v14, 0x0

    .local v14, "$changed$iv":I
    const/4 v15, 0x0

    .line 131
    .local v15, "$i$f$getCurrent":I
    const v11, 0x789c5f52

    const-string v12, "CC(<get-current>):CompositionLocal.kt#9igjgp"

    invoke-static {v4, v11, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v11

    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 37
    .end local v0    # "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    .end local v14    # "$changed$iv":I
    .end local v15    # "$i$f$getCurrent":I
    move-object v0, v11

    check-cast v0, Landroid/content/Context;

    .line 38
    .local v0, "context":Landroid/content/Context;
    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x1

    invoke-static {v12, v4, v11, v14}, Landroidx/compose/ui/platform/NestedScrollInteropConnectionKt;->rememberNestedScrollInteropConnection(Landroid/view/View;Landroidx/compose/runtime/Composer;II)Landroidx/compose/ui/input/nestedscroll/NestedScrollConnection;

    move-result-object v15

    .local v15, "nestedScrollInterop":Landroidx/compose/ui/input/nestedscroll/NestedScrollConnection;
    const v12, 0x6e3c21fe

    invoke-interface {v4, v12}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v12, "CC(remember):PdfRendererCompose.kt#9igjgp"

    invoke-static {v4, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 39
    move/from16 v19, v11

    .local v19, "invalid$iv":Z
    move-object/from16 p1, v4

    .local p1, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/16 v20, 0x0

    .line 132
    .local v20, "$i$f$cache":I
    move/from16 p2, v11

    invoke-interface/range {p1 .. p1}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v11

    .local v11, "it$iv":Ljava/lang/Object;
    const/16 v21, 0x0

    .line 133
    .local v21, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v22, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v22 .. v22}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v14

    if-ne v11, v14, :cond_32

    .line 134
    const/4 v14, 0x0

    .line 39
    .local v14, "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$pdfViewRef$1":I
    move-object/from16 p3, v11

    move/from16 p4, v14

    const/4 v11, 0x2

    const/4 v14, 0x0

    .end local v11    # "it$iv":Ljava/lang/Object;
    .end local v14    # "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$pdfViewRef$1":I
    .local p3, "it$iv":Ljava/lang/Object;
    .local p4, "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$pdfViewRef$1":I
    invoke-static {v14, v14, v11, v14}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v22

    .line 134
    .end local p4    # "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$pdfViewRef$1":I
    move-object/from16 v11, v22

    .line 135
    .local v11, "value$iv":Ljava/lang/Object;
    move-object/from16 v14, p1

    .end local p1    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .local v14, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    invoke-interface {v14, v11}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 136
    nop

    .end local v11    # "value$iv":Ljava/lang/Object;
    goto :goto_21

    .line 137
    .end local v14    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local p3    # "it$iv":Ljava/lang/Object;
    .local v11, "it$iv":Ljava/lang/Object;
    .restart local p1    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    :cond_32
    move-object/from16 v14, p1

    move-object/from16 p3, v11

    .line 132
    .end local v11    # "it$iv":Ljava/lang/Object;
    .end local v21    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local p1    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .restart local v14    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    :goto_21
    nop

    .line 39
    .end local v14    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v19    # "invalid$iv":Z
    .end local v20    # "$i$f$cache":I
    check-cast v11, Landroidx/compose/runtime/MutableState;

    .local v11, "pdfViewRef":Landroidx/compose/runtime/MutableState;
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    const v14, 0x4c5de2

    invoke-interface {v4, v14}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-static {v4, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v14, v13, 0xe

    move/from16 v19, v13

    const/4 v13, 0x4

    .end local v13    # "$dirty":I
    .local v19, "$dirty":I
    if-eq v14, v13, :cond_34

    and-int/lit8 v13, v19, 0x8

    if-eqz v13, :cond_33

    .line 42
    invoke-interface {v4, v1}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_33

    goto :goto_22

    :cond_33
    move/from16 v13, p2

    goto :goto_23

    :cond_34
    :goto_22
    const/4 v13, 0x1

    .local v13, "invalid$iv":Z
    :goto_23
    move-object v14, v4

    .restart local v14    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/16 v20, 0x0

    .line 138
    .restart local v20    # "$i$f$cache":I
    move/from16 p1, v13

    .end local v13    # "invalid$iv":Z
    .local p1, "invalid$iv":Z
    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v13

    .local v13, "it$iv":Ljava/lang/Object;
    const/16 v21, 0x0

    .line 139
    .restart local v21    # "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez p1, :cond_36

    sget-object v22, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 p7, v7

    .end local v7    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .local p7, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    invoke-virtual/range {v22 .. v22}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v7

    if-ne v13, v7, :cond_35

    goto :goto_24

    .line 143
    :cond_35
    goto :goto_25

    .line 139
    .end local p7    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local v7    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    :cond_36
    move-object/from16 p7, v7

    .line 140
    .end local v7    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local p7    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    :goto_24
    const/4 v7, 0x0

    .line 42
    .local v7, "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$resolvedFile$2":I
    move/from16 p3, v7

    move-object/from16 p4, v13

    const/4 v7, 0x2

    const/4 v13, 0x0

    .end local v7    # "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$resolvedFile$2":I
    .end local v13    # "it$iv":Ljava/lang/Object;
    .local p3, "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$resolvedFile$2":I
    .local p4, "it$iv":Ljava/lang/Object;
    invoke-static {v13, v13, v7, v13}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v22

    .line 140
    .end local p3    # "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$resolvedFile$2":I
    move-object/from16 v7, v22

    .line 141
    .local v7, "value$iv":Ljava/lang/Object;
    invoke-interface {v14, v7}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 142
    move-object v13, v7

    .line 138
    .end local v7    # "value$iv":Ljava/lang/Object;
    .end local v21    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local p4    # "it$iv":Ljava/lang/Object;
    :goto_25
    nop

    .line 42
    .end local v14    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v20    # "$i$f$cache":I
    .end local p1    # "invalid$iv":Z
    move-object v7, v13

    check-cast v7, Landroidx/compose/runtime/MutableState;

    .local v7, "resolvedFile$delegate":Landroidx/compose/runtime/MutableState;
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 43
    const v13, -0x6815fd56

    invoke-interface {v4, v13}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-static {v4, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v13, v19, 0xe

    const/4 v14, 0x4

    if-eq v13, v14, :cond_38

    and-int/lit8 v13, v19, 0x8

    if-eqz v13, :cond_37

    invoke-interface {v4, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_37

    goto :goto_26

    :cond_37
    move/from16 v13, p2

    goto :goto_27

    :cond_38
    :goto_26
    const/4 v13, 0x1

    :goto_27
    invoke-interface {v4, v7}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v14

    or-int/2addr v13, v14

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v14

    or-int/2addr v13, v14

    .local v13, "invalid$iv":Z
    move-object v14, v4

    .restart local v14    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/16 v20, 0x0

    .line 144
    .restart local v20    # "$i$f$cache":I
    move/from16 p1, v13

    .end local v13    # "invalid$iv":Z
    .restart local p1    # "invalid$iv":Z
    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v13

    .local v13, "it$iv":Ljava/lang/Object;
    const/16 v21, 0x0

    .line 145
    .restart local v21    # "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez p1, :cond_3a

    sget-object v22, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 p6, v10

    .end local v10    # "headers":Lcom/rajat/pdfviewer/HeaderData;
    .local p6, "headers":Lcom/rajat/pdfviewer/HeaderData;
    invoke-virtual/range {v22 .. v22}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v10

    if-ne v13, v10, :cond_39

    goto :goto_28

    .line 149
    :cond_39
    goto :goto_29

    .line 145
    .end local p6    # "headers":Lcom/rajat/pdfviewer/HeaderData;
    .restart local v10    # "headers":Lcom/rajat/pdfviewer/HeaderData;
    :cond_3a
    move-object/from16 p6, v10

    .line 146
    .end local v10    # "headers":Lcom/rajat/pdfviewer/HeaderData;
    .restart local p6    # "headers":Lcom/rajat/pdfviewer/HeaderData;
    :goto_28
    const/4 v10, 0x0

    .line 43
    .local v10, "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$1":I
    move/from16 p3, v10

    .end local v10    # "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$1":I
    .local p3, "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$1":I
    new-instance v10, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;

    move-object/from16 p4, v13

    const/4 v13, 0x0

    .end local v13    # "it$iv":Ljava/lang/Object;
    .restart local p4    # "it$iv":Ljava/lang/Object;
    invoke-direct {v10, v1, v0, v7, v13}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;-><init>(Lcom/rajat/pdfviewer/util/PdfSource;Landroid/content/Context;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    check-cast v10, Lkotlin/jvm/functions/Function2;

    .line 146
    .end local p3    # "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$1":I
    nop

    .line 147
    .local v10, "value$iv":Ljava/lang/Object;
    invoke-interface {v14, v10}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 148
    move-object v13, v10

    .line 144
    .end local v10    # "value$iv":Ljava/lang/Object;
    .end local v21    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local p4    # "it$iv":Ljava/lang/Object;
    :goto_29
    nop

    .line 43
    .end local v14    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v20    # "$i$f$cache":I
    .end local p1    # "invalid$iv":Z
    check-cast v13, Lkotlin/jvm/functions/Function2;

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    and-int/lit8 v10, v19, 0xe

    invoke-static {v1, v13, v4, v10}, Landroidx/compose/runtime/EffectsKt;->LaunchedEffect(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    const v10, 0x4c5de2

    invoke-interface {v4, v10}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-static {v4, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v10, v19, 0xe

    const/4 v13, 0x4

    if-eq v10, v13, :cond_3c

    and-int/lit8 v10, v19, 0x8

    if-eqz v10, :cond_3b

    .line 50
    invoke-interface {v4, v1}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3b

    goto :goto_2a

    :cond_3b
    move/from16 v10, p2

    goto :goto_2b

    :cond_3c
    :goto_2a
    const/4 v10, 0x1

    .local v10, "invalid$iv":Z
    :goto_2b
    move-object v13, v4

    .local v13, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v14, 0x0

    .line 150
    .local v14, "$i$f$cache":I
    move-object/from16 v20, v0

    .end local v0    # "context":Landroid/content/Context;
    .local v20, "context":Landroid/content/Context;
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v0

    .local v0, "it$iv":Ljava/lang/Object;
    const/16 v21, 0x0

    .line 151
    .restart local v21    # "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v10, :cond_3e

    sget-object v22, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 p1, v10

    .end local v10    # "invalid$iv":Z
    .restart local p1    # "invalid$iv":Z
    invoke-virtual/range {v22 .. v22}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v10

    if-ne v0, v10, :cond_3d

    goto :goto_2c

    .line 155
    :cond_3d
    move/from16 p5, v14

    goto :goto_2d

    .line 151
    .end local p1    # "invalid$iv":Z
    .restart local v10    # "invalid$iv":Z
    :cond_3e
    move/from16 p1, v10

    .line 152
    .end local v10    # "invalid$iv":Z
    .restart local p1    # "invalid$iv":Z
    :goto_2c
    const/4 v10, 0x0

    .line 50
    .local v10, "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$hasInit$2":I
    move-object/from16 p3, v0

    .end local v0    # "it$iv":Ljava/lang/Object;
    .local p3, "it$iv":Ljava/lang/Object;
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    move/from16 p4, v10

    move/from16 p5, v14

    const/4 v10, 0x2

    const/4 v14, 0x0

    .end local v10    # "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$hasInit$2":I
    .end local v14    # "$i$f$cache":I
    .local p4, "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$hasInit$2":I
    .local p5, "$i$f$cache":I
    invoke-static {v0, v14, v10, v14}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v0

    .line 152
    .end local p4    # "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$hasInit$2":I
    nop

    .line 153
    .local v0, "value$iv":Ljava/lang/Object;
    invoke-interface {v13, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 154
    nop

    .line 150
    .end local v0    # "value$iv":Ljava/lang/Object;
    .end local v21    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local p3    # "it$iv":Ljava/lang/Object;
    :goto_2d
    nop

    .line 50
    .end local v13    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local p1    # "invalid$iv":Z
    .end local p5    # "$i$f$cache":I
    check-cast v0, Landroidx/compose/runtime/MutableState;

    .local v0, "hasInit$delegate":Landroidx/compose/runtime/MutableState;
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    const v10, -0x6815fd56

    invoke-interface {v4, v10}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-static {v4, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    const/high16 v10, 0x1c00000

    and-int v10, v19, v10

    const/high16 v13, 0x800000

    if-eq v10, v13, :cond_40

    const/high16 v10, 0x1000000

    and-int v10, v19, v10

    if-eqz v10, :cond_3f

    .line 53
    invoke-interface {v4, v2}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3f

    goto :goto_2e

    :cond_3f
    move/from16 v10, p2

    goto :goto_2f

    :cond_40
    :goto_2e
    const/4 v10, 0x1

    :goto_2f
    const/high16 v13, 0x380000

    and-int v13, v19, v13

    const/high16 v14, 0x100000

    if-ne v13, v14, :cond_41

    const/4 v13, 0x1

    goto :goto_30

    :cond_41
    move/from16 v13, p2

    :goto_30
    or-int/2addr v10, v13

    const/high16 v13, 0x70000000

    and-int v13, v19, v13

    const/high16 v14, 0x20000000

    if-ne v13, v14, :cond_42

    const/4 v13, 0x1

    goto :goto_31

    :cond_42
    move/from16 v13, p2

    :goto_31
    or-int/2addr v10, v13

    .local v10, "invalid$iv":Z
    move-object v13, v4

    .restart local v13    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v14, 0x0

    .line 156
    .restart local v14    # "$i$f$cache":I
    move/from16 p1, v10

    .end local v10    # "invalid$iv":Z
    .restart local p1    # "invalid$iv":Z
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v10

    .local v10, "it$iv":Ljava/lang/Object;
    const/16 v21, 0x0

    .line 157
    .restart local v21    # "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez p1, :cond_44

    sget-object v22, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 p3, v14

    .end local v14    # "$i$f$cache":I
    .local p3, "$i$f$cache":I
    invoke-virtual/range {v22 .. v22}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v14

    if-ne v10, v14, :cond_43

    goto :goto_32

    .line 161
    :cond_43
    goto :goto_33

    .line 157
    .end local p3    # "$i$f$cache":I
    .restart local v14    # "$i$f$cache":I
    :cond_44
    move/from16 p3, v14

    .line 158
    .end local v14    # "$i$f$cache":I
    .restart local p3    # "$i$f$cache":I
    :goto_32
    const/4 v14, 0x0

    .line 54
    .local v14, "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1":I
    move-object/from16 p4, v10

    .end local v10    # "it$iv":Ljava/lang/Object;
    .local p4, "it$iv":Ljava/lang/Object;
    new-instance v10, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;

    invoke-direct {v10, v2, v11, v3, v8}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;Landroidx/compose/runtime/MutableState;Ljava/lang/Integer;Lkotlin/jvm/functions/Function1;)V

    .line 82
    nop

    .line 158
    .end local v14    # "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1":I
    nop

    .line 159
    .local v10, "value$iv":Ljava/lang/Object;
    invoke-interface {v13, v10}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 160
    nop

    .line 156
    .end local v10    # "value$iv":Ljava/lang/Object;
    .end local v21    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local p4    # "it$iv":Ljava/lang/Object;
    :goto_33
    nop

    .line 53
    .end local v13    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local p1    # "invalid$iv":Z
    .end local p3    # "$i$f$cache":I
    check-cast v10, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;

    .local v10, "combinedCallback":Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 126
    const/4 v13, 0x2

    const/4 v14, 0x0

    invoke-static {v9, v15, v14, v13, v14}, Landroidx/compose/ui/input/nestedscroll/NestedScrollModifierKt;->nestedScroll$default(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/input/nestedscroll/NestedScrollConnection;Landroidx/compose/ui/input/nestedscroll/NestedScrollDispatcher;ILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v13

    const v14, -0x48fade91

    invoke-interface {v4, v14}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-static {v4, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-interface {v4, v10}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v14

    const/high16 v18, 0xe000000

    move-object/from16 v21, v2

    .end local v2    # "statusCallBack":Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    .local v21, "statusCallBack":Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    and-int v2, v19, v18

    move-object/from16 v18, v3

    const/high16 v3, 0x4000000

    .end local v3    # "jumpToPage":Ljava/lang/Integer;
    .local v18, "jumpToPage":Ljava/lang/Integer;
    if-eq v2, v3, :cond_46

    and-int v2, v19, v23

    if-eqz v2, :cond_45

    invoke-interface {v4, v5}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_45

    goto :goto_34

    :cond_45
    move/from16 v2, p2

    goto :goto_35

    :cond_46
    :goto_34
    const/4 v2, 0x1

    :goto_35
    or-int/2addr v2, v14

    const v3, 0xe000

    and-int v3, v19, v3

    const/16 v14, 0x4000

    if-ne v3, v14, :cond_47

    const/4 v3, 0x1

    goto :goto_36

    :cond_47
    move/from16 v3, p2

    :goto_36
    or-int/2addr v2, v3

    .line 86
    nop

    .local v2, "invalid$iv":Z
    move-object v3, v4

    .local v3, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v14, 0x0

    .line 162
    .local v14, "$i$f$cache":I
    move/from16 p1, v2

    .end local v2    # "invalid$iv":Z
    .restart local p1    # "invalid$iv":Z
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v2

    .local v2, "it$iv":Ljava/lang/Object;
    const/16 v22, 0x0

    .line 163
    .local v22, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez p1, :cond_49

    sget-object v25, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v26, v8

    .end local v8    # "onReady":Lkotlin/jvm/functions/Function1;
    .local v26, "onReady":Lkotlin/jvm/functions/Function1;
    invoke-virtual/range {v25 .. v25}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v8

    if-ne v2, v8, :cond_48

    goto :goto_37

    .line 167
    :cond_48
    goto :goto_38

    .line 163
    .end local v26    # "onReady":Lkotlin/jvm/functions/Function1;
    .restart local v8    # "onReady":Lkotlin/jvm/functions/Function1;
    :cond_49
    move-object/from16 v26, v8

    .line 164
    .end local v8    # "onReady":Lkotlin/jvm/functions/Function1;
    .restart local v26    # "onReady":Lkotlin/jvm/functions/Function1;
    :goto_37
    const/4 v8, 0x0

    .line 86
    .local v8, "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$2":I
    move-object/from16 p3, v2

    .end local v2    # "it$iv":Ljava/lang/Object;
    .local p3, "it$iv":Ljava/lang/Object;
    new-instance v2, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda0;

    invoke-direct {v2, v10, v5, v6, v11}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda0;-><init>(Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;FLandroidx/compose/runtime/MutableState;)V

    .line 164
    .end local v8    # "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$2":I
    nop

    .line 165
    .local v2, "value$iv":Ljava/lang/Object;
    invoke-interface {v3, v2}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 166
    nop

    .line 162
    .end local v2    # "value$iv":Ljava/lang/Object;
    .end local v22    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local p3    # "it$iv":Ljava/lang/Object;
    :goto_38
    nop

    .line 86
    .end local v3    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v14    # "$i$f$cache":I
    .end local p1    # "invalid$iv":Z
    check-cast v2, Lkotlin/jvm/functions/Function1;

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 126
    const v3, -0x48fade91

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-static {v4, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-interface {v4, v10}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v3

    const/high16 v8, 0xe000000

    and-int v8, v19, v8

    const/high16 v12, 0x4000000

    if-eq v8, v12, :cond_4b

    and-int v8, v19, v23

    if-eqz v8, :cond_4a

    invoke-interface {v4, v5}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4a

    goto :goto_39

    :cond_4a
    move/from16 v8, p2

    goto :goto_3a

    :cond_4b
    :goto_39
    const/4 v8, 0x1

    :goto_3a
    or-int/2addr v3, v8

    const v8, 0xe000

    and-int v8, v19, v8

    const/16 v14, 0x4000

    if-ne v8, v14, :cond_4c

    const/4 v8, 0x1

    goto :goto_3b

    :cond_4c
    move/from16 v8, p2

    :goto_3b
    or-int/2addr v3, v8

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v8

    or-int/2addr v3, v8

    and-int/lit8 v8, v19, 0xe

    const/4 v14, 0x4

    if-eq v8, v14, :cond_4e

    and-int/lit8 v8, v19, 0x8

    if-eqz v8, :cond_4d

    invoke-interface {v4, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4d

    goto :goto_3c

    :cond_4d
    move/from16 v8, p2

    goto :goto_3d

    :cond_4e
    :goto_3c
    const/4 v8, 0x1

    :goto_3d
    or-int/2addr v3, v8

    move-object/from16 v8, p6

    .end local p6    # "headers":Lcom/rajat/pdfviewer/HeaderData;
    .local v8, "headers":Lcom/rajat/pdfviewer/HeaderData;
    invoke-interface {v4, v8}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v12

    or-int/2addr v3, v12

    move-object/from16 v12, p7

    .end local p7    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .local v12, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    invoke-interface {v4, v12}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v14

    or-int/2addr v3, v14

    move-object/from16 p9, v0

    move/from16 v14, v19

    .end local v0    # "hasInit$delegate":Landroidx/compose/runtime/MutableState;
    .end local v19    # "$dirty":I
    .local v14, "$dirty":I
    .local p9, "hasInit$delegate":Landroidx/compose/runtime/MutableState;
    and-int/lit16 v0, v14, 0x1c00

    const/16 v1, 0x800

    if-ne v0, v1, :cond_4f

    const/16 v27, 0x1

    goto :goto_3e

    :cond_4f
    move/from16 v27, p2

    :goto_3e
    or-int v0, v3, v27

    invoke-interface {v4, v7}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v1

    or-int/2addr v0, v1

    .line 94
    nop

    .local v0, "invalid$iv":Z
    move-object v1, v4

    .local v1, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v3, 0x0

    .line 168
    .local v3, "$i$f$cache":I
    move/from16 v16, v0

    .end local v0    # "invalid$iv":Z
    .local v16, "invalid$iv":Z
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v0

    .local v0, "it$iv":Ljava/lang/Object;
    const/16 v17, 0x0

    .line 169
    .local v17, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v16, :cond_51

    sget-object v19, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v22, v2

    invoke-virtual/range {v19 .. v19}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v2

    if-ne v0, v2, :cond_50

    goto :goto_3f

    .line 173
    :cond_50
    move-object v2, v8

    move v8, v6

    move-object v6, v10

    move-object v10, v2

    move-object/from16 v23, p8

    move-object v2, v7

    move-object v7, v5

    move-object/from16 v5, p9

    goto :goto_40

    .line 169
    :cond_51
    move-object/from16 v22, v2

    .line 170
    :goto_3f
    const/4 v2, 0x0

    .line 94
    .local v2, "$i$a$-cache-PdfRendererComposeKt$PdfRendererViewCompose$3":I
    new-instance v19, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;

    move-object/from16 p5, p0

    move-object/from16 p3, v5

    move/from16 p4, v6

    move-object/from16 p10, v7

    move-object/from16 p6, v8

    move-object/from16 p2, v10

    move-object/from16 p7, v12

    move-object/from16 p1, v19

    .end local v5    # "zoomListener":Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    .end local v6    # "maxZoomScale":F
    .end local v7    # "resolvedFile$delegate":Landroidx/compose/runtime/MutableState;
    .end local v8    # "headers":Lcom/rajat/pdfviewer/HeaderData;
    .end local v10    # "combinedCallback":Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;
    .end local v12    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .local p2, "combinedCallback":Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;
    .local p3, "zoomListener":Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    .local p4, "maxZoomScale":F
    .restart local p6    # "headers":Lcom/rajat/pdfviewer/HeaderData;
    .restart local p7    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .local p10, "resolvedFile$delegate":Landroidx/compose/runtime/MutableState;
    invoke-direct/range {p1 .. p10}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;-><init>(Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;FLcom/rajat/pdfviewer/util/PdfSource;Lcom/rajat/pdfviewer/HeaderData;Landroidx/lifecycle/LifecycleOwner;Lcom/rajat/pdfviewer/util/CacheStrategy;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;)V

    .line 170
    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move/from16 v8, p4

    move-object/from16 v10, p6

    move-object/from16 v23, p8

    move-object/from16 v5, p9

    move-object/from16 v2, p10

    .line 171
    .end local p2    # "combinedCallback":Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;
    .end local p3    # "zoomListener":Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    .end local p4    # "maxZoomScale":F
    .end local p6    # "headers":Lcom/rajat/pdfviewer/HeaderData;
    .end local p7    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local p8    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .end local p9    # "hasInit$delegate":Landroidx/compose/runtime/MutableState;
    .end local p10    # "resolvedFile$delegate":Landroidx/compose/runtime/MutableState;
    .local v2, "resolvedFile$delegate":Landroidx/compose/runtime/MutableState;
    .local v5, "hasInit$delegate":Landroidx/compose/runtime/MutableState;
    .local v6, "combinedCallback":Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;
    .local v7, "zoomListener":Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    .local v8, "maxZoomScale":F
    .local v10, "headers":Lcom/rajat/pdfviewer/HeaderData;
    .restart local v12    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .local v23, "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .local p1, "value$iv":Ljava/lang/Object;
    move-object/from16 p2, v0

    move-object/from16 v0, p1

    .end local p1    # "value$iv":Ljava/lang/Object;
    .local v0, "value$iv":Ljava/lang/Object;
    .local p2, "it$iv":Ljava/lang/Object;
    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 172
    nop

    .line 168
    .end local v0    # "value$iv":Ljava/lang/Object;
    .end local v17    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local p2    # "it$iv":Ljava/lang/Object;
    :goto_40
    nop

    .line 94
    .end local v1    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v3    # "$i$f$cache":I
    .end local v16    # "invalid$iv":Z
    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 85
    const/4 v1, 0x0

    const/4 v3, 0x0

    move-object/from16 p3, v0

    move/from16 p5, v1

    move/from16 p6, v3

    move-object/from16 p4, v4

    move-object/from16 p2, v13

    move-object/from16 p1, v22

    .end local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .local p4, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {p1 .. p6}, Landroidx/compose/ui/viewinterop/AndroidView_androidKt;->AndroidView(Lkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V

    move-object/from16 v13, p4

    .end local p4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v13, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_52

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .end local v2    # "resolvedFile$delegate":Landroidx/compose/runtime/MutableState;
    .end local v5    # "hasInit$delegate":Landroidx/compose/runtime/MutableState;
    .end local v6    # "combinedCallback":Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;
    .end local v11    # "pdfViewRef":Landroidx/compose/runtime/MutableState;
    .end local v15    # "nestedScrollInterop":Landroidx/compose/ui/input/nestedscroll/NestedScrollConnection;
    .end local v20    # "context":Landroid/content/Context;
    :cond_52
    move v5, v8

    move-object v2, v9

    move-object v3, v10

    move-object v6, v12

    move-object/from16 v8, v21

    move-object/from16 v4, v23

    move-object/from16 v10, v26

    move-object v9, v7

    move-object/from16 v7, v18

    .end local v12    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local v18    # "jumpToPage":Ljava/lang/Integer;
    .end local v21    # "statusCallBack":Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    .end local v23    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .end local v26    # "onReady":Lkotlin/jvm/functions/Function1;
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "headers":Lcom/rajat/pdfviewer/HeaderData;
    .local v4, "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .local v5, "maxZoomScale":F
    .local v6, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .local v7, "jumpToPage":Ljava/lang/Integer;
    .local v8, "statusCallBack":Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    .local v9, "zoomListener":Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    .local v10, "onReady":Lkotlin/jvm/functions/Function1;
    :goto_41
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v15

    if-eqz v15, :cond_53

    new-instance v0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;

    move-object/from16 v1, p0

    move/from16 v11, p11

    move/from16 v12, p12

    invoke-direct/range {v0 .. v12}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;-><init>(Lcom/rajat/pdfviewer/util/PdfSource;Landroidx/compose/ui/Modifier;Lcom/rajat/pdfviewer/HeaderData;Lcom/rajat/pdfviewer/util/CacheStrategy;FLandroidx/lifecycle/LifecycleOwner;Ljava/lang/Integer;Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;Lkotlin/jvm/functions/Function1;II)V

    invoke-interface {v15, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    .line 128
    :cond_53
    return-void
.end method

.method static final PdfRendererViewCompose$lambda$11$lambda$10(Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;FLandroidx/compose/runtime/MutableState;Landroid/content/Context;)Lcom/rajat/pdfviewer/PdfRendererView;
    .locals 7
    .param p0, "$combinedCallback"    # Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;
    .param p1, "$zoomListener"    # Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    .param p2, "$maxZoomScale"    # F
    .param p3, "$pdfViewRef"    # Landroidx/compose/runtime/MutableState;
    .param p4, "ctx"    # Landroid/content/Context;

    const-string v0, "ctx"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 87
    new-instance v1, Lcom/rajat/pdfviewer/PdfRendererView;

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, p4

    .end local p4    # "ctx":Landroid/content/Context;
    .local v2, "ctx":Landroid/content/Context;
    invoke-direct/range {v1 .. v6}, Lcom/rajat/pdfviewer/PdfRendererView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object p4, v1

    .local p4, "view":Lcom/rajat/pdfviewer/PdfRendererView;
    const/4 v0, 0x0

    .line 88
    .local v0, "$i$a$-also-PdfRendererComposeKt$PdfRendererViewCompose$2$1$1":I
    move-object v3, p0

    check-cast v3, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    invoke-virtual {p4, v3}, Lcom/rajat/pdfviewer/PdfRendererView;->setStatusListener(Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;)V

    .line 89
    invoke-virtual {p4, p1}, Lcom/rajat/pdfviewer/PdfRendererView;->setZoomListener(Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;)V

    .line 90
    invoke-virtual {p4, p2}, Lcom/rajat/pdfviewer/PdfRendererView;->setMaxZoomScale(F)V

    .line 91
    invoke-interface {p3, p4}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 92
    nop

    .line 87
    .end local v0    # "$i$a$-also-PdfRendererComposeKt$PdfRendererViewCompose$2$1$1":I
    .end local p4    # "view":Lcom/rajat/pdfviewer/PdfRendererView;
    nop

    .line 92
    return-object v1
.end method

.method static final PdfRendererViewCompose$lambda$13$lambda$12(Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;FLcom/rajat/pdfviewer/util/PdfSource;Lcom/rajat/pdfviewer/HeaderData;Landroidx/lifecycle/LifecycleOwner;Lcom/rajat/pdfviewer/util/CacheStrategy;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lcom/rajat/pdfviewer/PdfRendererView;)Lkotlin/Unit;
    .locals 7
    .param p0, "$combinedCallback"    # Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;
    .param p1, "$zoomListener"    # Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    .param p2, "$maxZoomScale"    # F
    .param p3, "$source"    # Lcom/rajat/pdfviewer/util/PdfSource;
    .param p4, "$headers"    # Lcom/rajat/pdfviewer/HeaderData;
    .param p5, "$lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;
    .param p6, "$cacheStrategy"    # Lcom/rajat/pdfviewer/util/CacheStrategy;
    .param p7, "$hasInit$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p8, "$resolvedFile$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p9, "view"    # Lcom/rajat/pdfviewer/PdfRendererView;

    move-object/from16 v0, p9

    const-string/jumbo v1, "view"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 95
    move-object v1, p0

    check-cast v1, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfRendererView;->setStatusListener(Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;)V

    .line 96
    invoke-virtual {v0, p1}, Lcom/rajat/pdfviewer/PdfRendererView;->setZoomListener(Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;)V

    .line 97
    invoke-virtual {v0, p2}, Lcom/rajat/pdfviewer/PdfRendererView;->setMaxZoomScale(F)V

    .line 99
    invoke-static {p7}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;->PdfRendererViewCompose$lambda$6(Landroidx/compose/runtime/MutableState;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 100
    nop

    .line 101
    instance-of v1, p3, Lcom/rajat/pdfviewer/util/PdfSource$Remote;

    const/4 v6, 0x1

    if-eqz v1, :cond_0

    .line 102
    nop

    .line 103
    move-object v1, p3

    check-cast v1, Lcom/rajat/pdfviewer/util/PdfSource$Remote;

    invoke-virtual {v1}, Lcom/rajat/pdfviewer/util/PdfSource$Remote;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 104
    nop

    .line 105
    invoke-static {p5}, Landroidx/lifecycle/LifecycleOwnerKt;->getLifecycleScope(Landroidx/lifecycle/LifecycleOwner;)Landroidx/lifecycle/LifecycleCoroutineScope;

    move-result-object v3

    .line 106
    invoke-interface {p5}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object v4

    .line 107
    nop

    .line 102
    move-object v2, p4

    move-object v5, p6

    invoke-virtual/range {v0 .. v5}, Lcom/rajat/pdfviewer/PdfRendererView;->initWithUrl(Ljava/lang/String;Lcom/rajat/pdfviewer/HeaderData;Landroidx/lifecycle/LifecycleCoroutineScope;Landroidx/lifecycle/Lifecycle;Lcom/rajat/pdfviewer/util/CacheStrategy;)V

    .line 109
    invoke-static {p7, v6}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;->PdfRendererViewCompose$lambda$7(Landroidx/compose/runtime/MutableState;Z)V

    goto :goto_0

    .line 111
    :cond_0
    instance-of v1, p3, Lcom/rajat/pdfviewer/util/PdfSource$LocalFile;

    if-eqz v1, :cond_1

    .line 112
    move-object v1, p3

    check-cast v1, Lcom/rajat/pdfviewer/util/PdfSource$LocalFile;

    invoke-virtual {v1}, Lcom/rajat/pdfviewer/util/PdfSource$LocalFile;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1, p6}, Lcom/rajat/pdfviewer/PdfRendererView;->initWithFile(Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;)V

    .line 113
    invoke-static {p7, v6}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;->PdfRendererViewCompose$lambda$7(Landroidx/compose/runtime/MutableState;Z)V

    goto :goto_0

    .line 115
    :cond_1
    instance-of v1, p3, Lcom/rajat/pdfviewer/util/PdfSource$LocalUri;

    if-eqz v1, :cond_2

    .line 116
    move-object v1, p3

    check-cast v1, Lcom/rajat/pdfviewer/util/PdfSource$LocalUri;

    invoke-virtual {v1}, Lcom/rajat/pdfviewer/util/PdfSource$LocalUri;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfRendererView;->initWithUri(Landroid/net/Uri;)V

    .line 117
    invoke-static {p7, v6}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;->PdfRendererViewCompose$lambda$7(Landroidx/compose/runtime/MutableState;Z)V

    goto :goto_0

    .line 119
    :cond_2
    instance-of v1, p3, Lcom/rajat/pdfviewer/util/PdfSource$PdfSourceFromAsset;

    if-eqz v1, :cond_3

    invoke-static {p8}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;->PdfRendererViewCompose$lambda$2(Landroidx/compose/runtime/MutableState;)Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 120
    invoke-static {p8}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;->PdfRendererViewCompose$lambda$2(Landroidx/compose/runtime/MutableState;)Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, p6}, Lcom/rajat/pdfviewer/PdfRendererView;->initWithFile(Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;)V

    .line 121
    invoke-static {p7, v6}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;->PdfRendererViewCompose$lambda$7(Landroidx/compose/runtime/MutableState;Z)V

    .line 125
    :cond_3
    :goto_0
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method static final PdfRendererViewCompose$lambda$14(Lcom/rajat/pdfviewer/util/PdfSource;Landroidx/compose/ui/Modifier;Lcom/rajat/pdfviewer/HeaderData;Lcom/rajat/pdfviewer/util/CacheStrategy;FLandroidx/lifecycle/LifecycleOwner;Ljava/lang/Integer;Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;Lkotlin/jvm/functions/Function1;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 14

    or-int/lit8 v0, p10, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v12

    move-object v1, p0

    move-object v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move/from16 v13, p11

    move-object/from16 v11, p12

    invoke-static/range {v1 .. v13}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;->PdfRendererViewCompose(Lcom/rajat/pdfviewer/util/PdfSource;Landroidx/compose/ui/Modifier;Lcom/rajat/pdfviewer/HeaderData;Lcom/rajat/pdfviewer/util/CacheStrategy;FLandroidx/lifecycle/LifecycleOwner;Ljava/lang/Integer;Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final PdfRendererViewCompose$lambda$2(Landroidx/compose/runtime/MutableState;)Ljava/io/File;
    .locals 4
    .param p0, "$resolvedFile$delegate"    # Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/io/File;",
            ">;)",
            "Ljava/io/File;"
        }
    .end annotation

    .line 42
    move-object v0, p0

    check-cast v0, Landroidx/compose/runtime/State;

    .local v0, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "thisObj$iv":Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "property$iv":Lkotlin/reflect/KProperty;
    const/4 v3, 0x0

    .line 174
    .local v3, "$i$f$getValue":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v1    # "thisObj$iv":Ljava/lang/Object;
    .end local v2    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v3    # "$i$f$getValue":I
    check-cast v0, Ljava/io/File;

    .line 42
    return-object v0
.end method

.method private static final PdfRendererViewCompose$lambda$3(Landroidx/compose/runtime/MutableState;Ljava/io/File;)V
    .locals 4
    .param p0, "$resolvedFile$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "<set-?>"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/io/File;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .line 42
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$setValue$iv":Landroidx/compose/runtime/MutableState;
    const/4 v3, 0x0

    .line 175
    .local v3, "$i$f$setValue":I
    invoke-interface {v2, p1}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 176
    nop

    .line 42
    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$setValue$iv":Landroidx/compose/runtime/MutableState;
    .end local v3    # "$i$f$setValue":I
    return-void
.end method

.method private static final PdfRendererViewCompose$lambda$6(Landroidx/compose/runtime/MutableState;)Z
    .locals 4
    .param p0, "$hasInit$delegate"    # Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;)Z"
        }
    .end annotation

    .line 50
    move-object v0, p0

    check-cast v0, Landroidx/compose/runtime/State;

    .local v0, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "thisObj$iv":Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "property$iv":Lkotlin/reflect/KProperty;
    const/4 v3, 0x0

    .line 177
    .local v3, "$i$f$getValue":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v1    # "thisObj$iv":Ljava/lang/Object;
    .end local v2    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v3    # "$i$f$getValue":I
    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 50
    return v0
.end method

.method private static final PdfRendererViewCompose$lambda$7(Landroidx/compose/runtime/MutableState;Z)V
    .locals 5
    .param p0, "$hasInit$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "<set-?>"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;Z)V"
        }
    .end annotation

    .line 50
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .local v2, "value$iv":Ljava/lang/Object;
    move-object v3, p0

    .local v3, "$this$setValue$iv":Landroidx/compose/runtime/MutableState;
    const/4 v4, 0x0

    .line 178
    .local v4, "$i$f$setValue":I
    invoke-interface {v3, v2}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 179
    nop

    .line 50
    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "value$iv":Ljava/lang/Object;
    .end local v3    # "$this$setValue$iv":Landroidx/compose/runtime/MutableState;
    .end local v4    # "$i$f$setValue":I
    return-void
.end method

.method public static final synthetic access$PdfRendererViewCompose$lambda$3(Landroidx/compose/runtime/MutableState;Ljava/io/File;)V
    .locals 0
    .param p0, "$resolvedFile$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "<set-?>"    # Ljava/io/File;

    .line 1
    invoke-static {p0, p1}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;->PdfRendererViewCompose$lambda$3(Landroidx/compose/runtime/MutableState;Ljava/io/File;)V

    return-void
.end method
