.class public final Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt;
.super Ljava/lang/Object;
.source "TimelineScreen.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTimelineScreen.kt\nKotlin\n*S Kotlin\n*F\n+ 1 TimelineScreen.kt\ncom/hardlineforge/lala/ui/screens/TimelineScreenKt\n+ 2 HiltViewModel.kt\nandroidx/hilt/navigation/compose/HiltViewModelKt\n+ 3 ViewModel.kt\nandroidx/lifecycle/viewmodel/compose/ViewModelKt\n+ 4 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 5 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 6 SnapshotState.kt\nandroidx/compose/runtime/SnapshotStateKt__SnapshotStateKt\n+ 7 Dp.kt\nandroidx/compose/ui/unit/DpKt\n+ 8 Maps.kt\nkotlin/collections/MapsKt__MapsKt\n+ 9 _Maps.kt\nkotlin/collections/MapsKt___MapsKt\n+ 10 LazyDsl.kt\nandroidx/compose/foundation/lazy/LazyDslKt\n+ 11 Row.kt\nandroidx/compose/foundation/layout/RowKt\n+ 12 Layout.kt\nandroidx/compose/ui/layout/LayoutKt\n+ 13 Composables.kt\nandroidx/compose/runtime/ComposablesKt\n+ 14 Composer.kt\nandroidx/compose/runtime/Updater\n+ 15 Column.kt\nandroidx/compose/foundation/layout/ColumnKt\n*L\n1#1,145:1\n46#2,7:146\n86#3,6:153\n1247#4,6:159\n1247#4,6:168\n1247#4,6:178\n1247#4,6:216\n774#5:165\n865#5,2:166\n1491#5:185\n1516#5,3:186\n1519#5,3:196\n85#6:174\n85#6:175\n113#6,2:176\n113#7:184\n113#7:214\n113#7:215\n113#7:222\n113#7:223\n113#7:261\n113#7:262\n113#7:263\n113#7:339\n113#7:344\n113#7:345\n113#7:384\n113#7:385\n382#8,7:189\n216#9:199\n217#9:213\n168#10,13:200\n99#11:224\n96#11,9:225\n99#11:301\n95#11,10:302\n106#11:343\n99#11:346\n95#11,10:347\n106#11:389\n106#11:397\n79#12,6:234\n86#12,3:249\n89#12,2:258\n79#12,6:274\n86#12,3:289\n89#12,2:298\n79#12,6:312\n86#12,3:327\n89#12,2:336\n93#12:342\n79#12,6:357\n86#12,3:372\n89#12,2:381\n93#12:388\n93#12:392\n93#12:396\n347#13,9:240\n356#13:260\n347#13,9:280\n356#13:300\n347#13,9:318\n356#13:338\n357#13,2:340\n347#13,9:363\n356#13:383\n357#13,2:386\n357#13,2:390\n357#13,2:394\n4206#14,6:252\n4206#14,6:292\n4206#14,6:330\n4206#14,6:375\n87#15:264\n84#15,9:265\n94#15:393\n*S KotlinDebug\n*F\n+ 1 TimelineScreen.kt\ncom/hardlineforge/lala/ui/screens/TimelineScreenKt\n*L\n30#1:146,7\n30#1:153,6\n32#1:159,6\n81#1:168,6\n40#1:178,6\n50#1:216,6\n35#1:165\n35#1:166,2\n52#1:185\n52#1:186,3\n52#1:196,3\n31#1:174\n32#1:175\n32#1:176,2\n62#1:184\n48#1:214\n49#1:215\n111#1:222\n85#1:223\n89#1:261\n92#1:262\n94#1:263\n102#1:339\n115#1:344\n123#1:345\n128#1:384\n131#1:385\n52#1:189,7\n56#1:199\n56#1:213\n65#1:200,13\n85#1:224\n85#1:225,9\n96#1:301\n96#1:302,10\n96#1:343\n124#1:346\n124#1:347,10\n124#1:389\n85#1:397\n85#1:234,6\n85#1:249,3\n85#1:258,2\n95#1:274,6\n95#1:289,3\n95#1:298,2\n96#1:312,6\n96#1:327,3\n96#1:336,2\n96#1:342\n124#1:357,6\n124#1:372,3\n124#1:381,2\n124#1:388\n95#1:392\n85#1:396\n85#1:240,9\n85#1:260\n95#1:280,9\n95#1:300\n96#1:318,9\n96#1:338\n96#1:340,2\n124#1:363,9\n124#1:383\n124#1:386,2\n95#1:390,2\n85#1:394,2\n85#1:252,6\n95#1:292,6\n96#1:330,6\n124#1:375,6\n95#1:264\n95#1:265,9\n95#1:393\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000e\u001a\u001f\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005H\u0007\u00a2\u0006\u0002\u0010\u0006\u001a%\u0010\u0007\u001a\u00020\u00012\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0003\u00a2\u0006\u0002\u0010\n\u00a8\u0006\u000b\u00b2\u0006\u0010\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\t0\rX\u008a\u0084\u0002\u00b2\u0006\u000c\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u008a\u008e\u0002"
    }
    d2 = {
        "TimelineScreen",
        "",
        "navController",
        "Landroidx/navigation/NavHostController;",
        "vm",
        "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
        "(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V",
        "TimelineCard",
        "entry",
        "Lcom/hardlineforge/lala/data/LogEntry;",
        "(Lcom/hardlineforge/lala/data/LogEntry;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;I)V",
        "app_debug",
        "entries",
        "",
        "selectedCategory",
        ""
    }
    k = 0x2
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private static final TimelineCard(Lcom/hardlineforge/lala/data/LogEntry;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;I)V
    .locals 23
    .param p0, "entry"    # Lcom/hardlineforge/lala/data/LogEntry;
    .param p1, "navController"    # Landroidx/navigation/NavHostController;
    .param p2, "vm"    # Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    .line 74
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p4

    const v3, 0x3d227f2d

    move-object/from16 v4, p3

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v13

    .end local p3    # "$composer":Landroidx/compose/runtime/Composer;
    .local v13, "$composer":Landroidx/compose/runtime/Composer;
    const-string v4, "C(TimelineCard)80@3163L54,81@3249L6,82@3335L11,82@3293L62,83@3362L2596,77@3078L2880:TimelineScreen.kt#4cebsy"

    invoke-static {v13, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v4, p4

    .local v4, "$dirty":I
    and-int/lit8 v5, v2, 0x6

    if-nez v5, :cond_1

    invoke-interface {v13, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int/2addr v4, v5

    :cond_1
    and-int/lit8 v5, v2, 0x30

    if-nez v5, :cond_3

    invoke-interface {v13, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const/16 v5, 0x20

    goto :goto_1

    :cond_2
    const/16 v5, 0x10

    :goto_1
    or-int/2addr v4, v5

    :cond_3
    and-int/lit8 v5, v4, 0x13

    const/16 v6, 0x12

    const/4 v7, 0x1

    if-eq v5, v6, :cond_4

    move v5, v7

    goto :goto_2

    :cond_4
    const/4 v5, 0x0

    :goto_2
    and-int/lit8 v6, v4, 0x1

    invoke-interface {v13, v5, v6}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v5

    if-eqz v5, :cond_5

    const/4 v5, -0x1

    const-string v6, "com.hardlineforge.lala.ui.screens.TimelineCard (TimelineScreen.kt:73)"

    invoke-static {v3, v4, v5, v6}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 75
    :cond_5
    const-string v3, "h:mm a"

    invoke-static {v3}, Ljava/time/format/DateTimeFormatter;->ofPattern(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    move-result-object v3

    .line 76
    .local v3, "formatter":Ljava/time/format/DateTimeFormatter;
    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/LogEntry;->getTimestamp()Ljava/time/Instant;

    move-result-object v5

    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/time/Instant;->atZone(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/time/ZonedDateTime;->format(Ljava/time/format/DateTimeFormatter;)Ljava/lang/String;

    move-result-object v5

    .line 79
    .local v5, "localTime":Ljava/lang/String;
    sget-object v6, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v6, Landroidx/compose/ui/Modifier;

    .line 80
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v6, v8, v7, v9}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxWidth$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v14

    .line 81
    const v6, 0x7e7f9423

    const-string v8, "CC(remember):TimelineScreen.kt#9igjgp"

    invoke-static {v13, v6, v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v13, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    invoke-interface {v13, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v8

    or-int/2addr v6, v8

    .local v6, "invalid\\1":Z
    move-object v8, v13

    .local v8, "$this$cache\\1":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 168
    .local v9, "$i$f$cache\\1\\81":I
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v10

    .local v10, "it\\1":Ljava/lang/Object;
    const/4 v11, 0x0

    .line 169
    .local v11, "$i$a$-let-ComposerKt$cache$1\\2\\168\\1":I
    if-nez v6, :cond_7

    sget-object v12, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v12}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v12

    if-ne v10, v12, :cond_6

    goto :goto_3

    .line 173
    :cond_6
    goto :goto_4

    .line 170
    :cond_7
    :goto_3
    const/4 v12, 0x0

    .line 81
    .local v12, "$i$a$-cache-TimelineScreenKt$TimelineCard$1\\3\\170\\0":I
    new-instance v15, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda5;

    invoke-direct {v15, v1, v0}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda5;-><init>(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/data/LogEntry;)V

    .line 170
    .end local v12    # "$i$a$-cache-TimelineScreenKt$TimelineCard$1\\3\\170\\0":I
    nop

    .line 171
    .local v15, "value\\2":Ljava/lang/Object;
    invoke-interface {v8, v15}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 172
    move-object v10, v15

    .line 168
    .end local v10    # "it\\1":Ljava/lang/Object;
    .end local v11    # "$i$a$-let-ComposerKt$cache$1\\2\\168\\1":I
    .end local v15    # "value\\2":Ljava/lang/Object;
    :goto_4
    nop

    .line 81
    .end local v6    # "invalid\\1":Z
    .end local v8    # "$this$cache\\1":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$cache\\1\\81":I
    move-object/from16 v18, v10

    check-cast v18, Lkotlin/jvm/functions/Function0;

    invoke-static {v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/16 v19, 0x7

    const/16 v20, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    invoke-static/range {v14 .. v20}, Landroidx/compose/foundation/ClickableKt;->clickable-XHw0xAI$default(Landroidx/compose/ui/Modifier;ZLjava/lang/String;Landroidx/compose/ui/semantics/Role;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v16

    .line 82
    sget-object v6, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v8, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v6, v13, v8}, Landroidx/compose/material3/MaterialTheme;->getShapes(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Shapes;

    move-result-object v6

    invoke-virtual {v6}, Landroidx/compose/material3/Shapes;->getLarge()Landroidx/compose/foundation/shape/CornerBasedShape;

    move-result-object v6

    move-object/from16 v17, v6

    check-cast v17, Landroidx/compose/ui/graphics/Shape;

    .line 83
    move v6, v4

    .end local v4    # "$dirty":I
    .local v6, "$dirty":I
    sget-object v4, Landroidx/compose/material3/CardDefaults;->INSTANCE:Landroidx/compose/material3/CardDefaults;

    sget-object v8, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v9, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v8, v13, v9}, Landroidx/compose/material3/MaterialTheme;->getColorScheme(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/ColorScheme;

    move-result-object v8

    invoke-virtual {v8}, Landroidx/compose/material3/ColorScheme;->getSurface-0d7_KjU()J

    move-result-wide v8

    sget v10, Landroidx/compose/material3/CardDefaults;->$stable:I

    shl-int/lit8 v14, v10, 0xc

    const/16 v15, 0xe

    move-object v10, v5

    move v11, v7

    move-wide/from16 v21, v8

    move v9, v6

    move-wide/from16 v5, v21

    .end local v5    # "localTime":Ljava/lang/String;
    .end local v6    # "$dirty":I
    .local v9, "$dirty":I
    .local v10, "localTime":Ljava/lang/String;
    const-wide/16 v7, 0x0

    move v12, v9

    move-object/from16 v18, v10

    .end local v9    # "$dirty":I
    .end local v10    # "localTime":Ljava/lang/String;
    .local v12, "$dirty":I
    .local v18, "localTime":Ljava/lang/String;
    const-wide/16 v9, 0x0

    move/from16 v20, v11

    move/from16 v19, v12

    .end local v12    # "$dirty":I
    .local v19, "$dirty":I
    const-wide/16 v11, 0x0

    move-object/from16 p3, v3

    move-object/from16 v3, v18

    move/from16 v1, v20

    .end local v18    # "localTime":Ljava/lang/String;
    .local v3, "localTime":Ljava/lang/String;
    .local p3, "formatter":Ljava/time/format/DateTimeFormatter;
    invoke-virtual/range {v4 .. v15}, Landroidx/compose/material3/CardDefaults;->cardColors-ro_MJ88(JJJJLandroidx/compose/runtime/Composer;II)Landroidx/compose/material3/CardColors;

    move-result-object v6

    .line 84
    new-instance v4, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda6;

    invoke-direct {v4, v0, v3}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda6;-><init>(Lcom/hardlineforge/lala/data/LogEntry;Ljava/lang/String;)V

    const/16 v5, 0x36

    const v7, 0x7fc7761f

    invoke-static {v7, v1, v4, v13, v5}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Lkotlin/jvm/functions/Function3;

    .line 78
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/high16 v11, 0x30000

    const/16 v12, 0x18

    move-object v10, v13

    move-object/from16 v4, v16

    move-object/from16 v5, v17

    .end local v13    # "$composer":Landroidx/compose/runtime/Composer;
    .local v10, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v4 .. v12}, Landroidx/compose/material3/CardKt;->Card(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material3/CardColors;Landroidx/compose/material3/CardElevation;Landroidx/compose/foundation/BorderStroke;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    .end local v10    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v13    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .end local v3    # "localTime":Ljava/lang/String;
    .end local p3    # "formatter":Ljava/time/format/DateTimeFormatter;
    goto :goto_5

    .line 73
    .end local v19    # "$dirty":I
    .restart local v4    # "$dirty":I
    :cond_8
    move/from16 v19, v4

    .end local v4    # "$dirty":I
    .restart local v19    # "$dirty":I
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 142
    :cond_9
    :goto_5
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v1

    if-eqz v1, :cond_a

    new-instance v3, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda7;

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    invoke-direct {v3, v0, v4, v5, v2}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda7;-><init>(Lcom/hardlineforge/lala/data/LogEntry;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;I)V

    invoke-interface {v1, v3}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    goto :goto_6

    :cond_a
    move-object/from16 v4, p1

    move-object/from16 v5, p2

    :goto_6
    return-void
.end method

.method static final TimelineCard$lambda$18$lambda$17(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/data/LogEntry;)Lkotlin/Unit;
    .locals 6
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$entry"    # Lcom/hardlineforge/lala/data/LogEntry;

    .line 81
    move-object v0, p0

    check-cast v0, Landroidx/navigation/NavController;

    invoke-virtual {p1}, Lcom/hardlineforge/lala/data/LogEntry;->getId()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "entry_detail/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Landroidx/navigation/NavController;->navigate$default(Landroidx/navigation/NavController;Ljava/lang/String;Landroidx/navigation/NavOptions;Landroidx/navigation/Navigator$Extras;ILjava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final TimelineCard$lambda$24(Lcom/hardlineforge/lala/data/LogEntry;Ljava/lang/String;Landroidx/compose/foundation/layout/ColumnScope;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 112
    .param p0, "$entry"    # Lcom/hardlineforge/lala/data/LogEntry;
    .param p1, "$localTime"    # Ljava/lang/String;
    .param p2, "$this$Card"    # Landroidx/compose/foundation/layout/ColumnScope;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    move-object/from16 v0, p3

    move/from16 v1, p4

    const-string v2, "$this$Card"

    move-object/from16 v3, p2

    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "C84@3372L2580:TimelineScreen.kt#4cebsy"

    invoke-static {v0, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v2, v1, 0x11

    const/16 v4, 0x10

    const/4 v6, 0x0

    if-eq v2, v4, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    move v2, v6

    :goto_0
    and-int/lit8 v4, v1, 0x1

    invoke-interface {v0, v2, v4}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v2

    if-eqz v2, :cond_15

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    const-string v4, "com.hardlineforge.lala.ui.screens.TimelineCard.<anonymous> (TimelineScreen.kt:84)"

    const v7, 0x7fc7761f

    invoke-static {v7, v1, v2, v4}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 85
    :cond_1
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    const/16 v4, 0x10

    .local v4, "$this$dp\\1":I
    const/4 v7, 0x0

    .line 223
    .local v7, "$i$f$getDp\\1\\85":I
    int-to-float v8, v4

    invoke-static {v8}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v4

    .line 85
    .end local v4    # "$this$dp\\1":I
    .end local v7    # "$i$f$getDp\\1\\85":I
    invoke-static {v2, v4}, Landroidx/compose/foundation/layout/PaddingKt;->padding-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v2

    .local v2, "modifier\\2":Landroidx/compose/ui/Modifier;
    sget-object v4, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v4}, Landroidx/compose/ui/Alignment$Companion;->getTop()Landroidx/compose/ui/Alignment$Vertical;

    move-result-object v4

    .local v4, "verticalAlignment\\2":Landroidx/compose/ui/Alignment$Vertical;
    const/16 v7, 0x186

    .local v7, "$changed\\2":I
    move-object/from16 v8, p3

    .local v8, "$composer\\2":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 224
    .local v9, "$i$f$Row\\2\\85":I
    const v10, 0x2952b718

    const-string v11, "CC(Row)P(2,1,3)99@5124L58,100@5187L130:Row.kt#2w3rfo"

    invoke-static {v8, v10, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 225
    sget-object v12, Landroidx/compose/foundation/layout/Arrangement;->INSTANCE:Landroidx/compose/foundation/layout/Arrangement;

    invoke-virtual {v12}, Landroidx/compose/foundation/layout/Arrangement;->getStart()Landroidx/compose/foundation/layout/Arrangement$Horizontal;

    move-result-object v12

    .line 229
    .local v12, "horizontalArrangement\\2":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    shr-int/lit8 v13, v7, 0x3

    and-int/lit8 v13, v13, 0xe

    shr-int/lit8 v14, v7, 0x3

    and-int/lit8 v14, v14, 0x70

    or-int/2addr v13, v14

    invoke-static {v12, v4, v8, v13}, Landroidx/compose/foundation/layout/RowKt;->rowMeasurePolicy(Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/ui/Alignment$Vertical;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v13

    .line 233
    .local v13, "measurePolicy\\2":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v14, v7, 0x3

    and-int/lit8 v14, v14, 0x70

    .line 230
    move-object v15, v2

    .local v14, "$changed\\3":I
    .local v15, "modifier\\3":Landroidx/compose/ui/Modifier;
    const/16 v16, 0x0

    .line 234
    .local v16, "$i$f$Layout\\3\\230":I
    const v5, -0x4ee9b9da

    const-string v10, "CC(Layout)P(!1,2)79@3206L23,82@3357L359:Layout.kt#80mrfh"

    invoke-static {v8, v5, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 235
    invoke-static {v8, v6}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v19

    .line 236
    .local v19, "compositeKeyHash\\3":I
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v5

    .line 237
    .local v5, "localMap\\3":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static {v8, v15}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v6

    .line 239
    .local v6, "materialized\\3":Landroidx/compose/ui/Modifier;
    sget-object v22, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v22 .. v22}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v22

    shl-int/lit8 v0, v14, 0x6

    and-int/lit16 v0, v0, 0x380

    move/from16 v23, v0

    const/4 v0, 0x6

    or-int/lit8 v23, v23, 0x6

    .line 238
    nop

    .local v23, "$changed\\4":I
    move-object/from16 v24, v22

    .local v24, "factory\\4":Lkotlin/jvm/functions/Function0;
    const/16 v22, 0x0

    .line 240
    .local v22, "$i$f$ReusableComposeNode\\4\\238":I
    move/from16 v25, v0

    const v0, -0x2942ffcf

    const-string v1, "CC(ReusableComposeNode)P(1,2)355@14017L9:Composables.kt#9igjgp"

    invoke-static {v8, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 241
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v0

    instance-of v0, v0, Landroidx/compose/runtime/Applier;

    if-nez v0, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 242
    :cond_2
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 243
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 244
    move-object/from16 v0, v24

    .end local v24    # "factory\\4":Lkotlin/jvm/functions/Function0;
    .local v0, "factory\\4":Lkotlin/jvm/functions/Function0;
    invoke-interface {v8, v0}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_1

    .line 246
    .end local v0    # "factory\\4":Lkotlin/jvm/functions/Function0;
    .restart local v24    # "factory\\4":Lkotlin/jvm/functions/Function0;
    :cond_3
    move-object/from16 v0, v24

    .end local v24    # "factory\\4":Lkotlin/jvm/functions/Function0;
    .restart local v0    # "factory\\4":Lkotlin/jvm/functions/Function0;
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 248
    :goto_1
    move-object/from16 v24, v0

    .end local v0    # "factory\\4":Lkotlin/jvm/functions/Function0;
    .restart local v24    # "factory\\4":Lkotlin/jvm/functions/Function0;
    invoke-static {v8}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v0

    .local v0, "$this$Layout_u24lambda_u240\\5":Landroidx/compose/runtime/Composer;
    const/16 v27, 0x0

    .line 249
    .local v27, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\5\\248\\3":I
    sget-object v28, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v29, v2

    .end local v2    # "modifier\\2":Landroidx/compose/ui/Modifier;
    .local v29, "modifier\\2":Landroidx/compose/ui/Modifier;
    invoke-virtual/range {v28 .. v28}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v2

    invoke-static {v0, v13, v2}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 250
    sget-object v2, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v2

    invoke-static {v0, v5, v2}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 251
    sget-object v2, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v2

    .local v2, "block\\6":Lkotlin/jvm/functions/Function2;
    const/16 v28, 0x0

    .line 252
    .local v28, "$i$f$set-impl\\6\\251":I
    move-object/from16 v30, v0

    .local v30, "$this$set_impl_u24lambda_u240\\6":Landroidx/compose/runtime/Composer;
    const/16 v31, 0x0

    .line 253
    .local v31, "$i$a$-with-Updater$set$1\\7\\252\\6":I
    invoke-interface/range {v30 .. v30}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v32

    if-nez v32, :cond_5

    invoke-interface/range {v30 .. v30}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v32, v4

    .end local v4    # "verticalAlignment\\2":Landroidx/compose/ui/Alignment$Vertical;
    .local v32, "verticalAlignment\\2":Landroidx/compose/ui/Alignment$Vertical;
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    goto :goto_2

    :cond_4
    move-object/from16 v4, v30

    goto :goto_3

    .end local v32    # "verticalAlignment\\2":Landroidx/compose/ui/Alignment$Vertical;
    .restart local v4    # "verticalAlignment\\2":Landroidx/compose/ui/Alignment$Vertical;
    :cond_5
    move-object/from16 v32, v4

    .line 254
    .end local v4    # "verticalAlignment\\2":Landroidx/compose/ui/Alignment$Vertical;
    .restart local v32    # "verticalAlignment\\2":Landroidx/compose/ui/Alignment$Vertical;
    :goto_2
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v4, v30

    .end local v30    # "$this$set_impl_u24lambda_u240\\6":Landroidx/compose/runtime/Composer;
    .local v4, "$this$set_impl_u24lambda_u240\\6":Landroidx/compose/runtime/Composer;
    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 255
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3, v2}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 257
    :goto_3
    nop

    .line 252
    .end local v4    # "$this$set_impl_u24lambda_u240\\6":Landroidx/compose/runtime/Composer;
    .end local v31    # "$i$a$-with-Updater$set$1\\7\\252\\6":I
    nop

    .line 257
    nop

    .line 258
    .end local v2    # "block\\6":Lkotlin/jvm/functions/Function2;
    .end local v28    # "$i$f$set-impl\\6\\251":I
    sget-object v2, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v2

    invoke-static {v0, v6, v2}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 259
    nop

    .line 248
    .end local v0    # "$this$Layout_u24lambda_u240\\5":Landroidx/compose/runtime/Composer;
    .end local v27    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\5\\248\\3":I
    nop

    .line 260
    shr-int/lit8 v0, v23, 0x6

    and-int/lit8 v0, v0, 0xe

    .local v0, "$changed\\8":I
    move-object v2, v8

    .local v2, "$composer\\8":Landroidx/compose/runtime/Composer;
    const/4 v3, 0x0

    .line 231
    .local v3, "$i$a$-Layout-RowKt$Row$1\\8\\260\\2":I
    const v4, -0x184d8b46

    move/from16 v27, v0

    .end local v0    # "$changed\\8":I
    .local v27, "$changed\\8":I
    const-string v0, "C101@5232L9:Row.kt#2w3rfo"

    invoke-static {v2, v4, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v28, Landroidx/compose/foundation/layout/RowScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/RowScopeInstance;

    shr-int/lit8 v30, v7, 0x6

    and-int/lit8 v30, v30, 0x70

    or-int/lit8 v30, v30, 0x6

    .local v30, "$changed\\9":I
    check-cast v28, Landroidx/compose/foundation/layout/RowScope;

    .local v28, "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423\\9":Landroidx/compose/foundation/layout/RowScope;
    move-object/from16 v31, v2

    .local v31, "$composer\\9":Landroidx/compose/runtime/Composer;
    move-object/from16 v33, v28

    .end local v28    # "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423\\9":Landroidx/compose/foundation/layout/RowScope;
    .local v33, "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423\\9":Landroidx/compose/foundation/layout/RowScope;
    const/16 v28, 0x0

    .line 87
    .local v28, "$i$a$-Row-TimelineScreenKt$TimelineCard$2$1\\9\\231\\0":I
    const v4, -0x43c1550f

    move-object/from16 v40, v2

    .end local v2    # "$composer\\8":Landroidx/compose/runtime/Composer;
    .local v40, "$composer\\8":Landroidx/compose/runtime/Composer;
    const-string v2, "C90@3640L29,86@3495L230,93@3738L40,94@3791L2151:TimelineScreen.kt#4cebsy"

    move/from16 v41, v3

    move-object/from16 v3, v31

    .end local v31    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .local v3, "$composer\\9":Landroidx/compose/runtime/Composer;
    .local v41, "$i$a$-Layout-RowKt$Row$1\\8\\260\\2":I
    invoke-static {v3, v4, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 88
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    .line 89
    const/16 v4, 0xc

    .local v4, "$this$dp\\10":I
    const/16 v31, 0x0

    .line 261
    .local v31, "$i$f$getDp\\10\\89":I
    move-object/from16 v42, v5

    .end local v5    # "localMap\\3":Landroidx/compose/runtime/CompositionLocalMap;
    .local v42, "localMap\\3":Landroidx/compose/runtime/CompositionLocalMap;
    int-to-float v5, v4

    invoke-static {v5}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v4

    .line 89
    .end local v4    # "$this$dp\\10":I
    .end local v31    # "$i$f$getDp\\10\\89":I
    invoke-static {v2, v4}, Landroidx/compose/foundation/layout/SizeKt;->size-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v2

    .line 90
    invoke-static {}, Landroidx/compose/foundation/shape/RoundedCornerShapeKt;->getCircleShape()Landroidx/compose/foundation/shape/RoundedCornerShape;

    move-result-object v4

    check-cast v4, Landroidx/compose/ui/graphics/Shape;

    invoke-static {v2, v4}, Landroidx/compose/ui/draw/ClipKt;->clip(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/graphics/Shape;)Landroidx/compose/ui/Modifier;

    move-result-object v43

    .line 91
    invoke-virtual/range {p0 .. p0}, Lcom/hardlineforge/lala/data/LogEntry;->getCategory()Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Lcom/hardlineforge/lala/ui/ColorUtilsKt;->categoryColor(Ljava/lang/String;Landroidx/compose/runtime/Composer;I)J

    move-result-wide v44

    const/16 v47, 0x2

    const/16 v48, 0x0

    const/16 v46, 0x0

    invoke-static/range {v43 .. v48}, Landroidx/compose/foundation/BackgroundKt;->background-bw27NRU$default(Landroidx/compose/ui/Modifier;JLandroidx/compose/ui/graphics/Shape;ILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v49

    .line 92
    const/4 v2, 0x4

    .local v2, "$this$dp\\11":I
    const/4 v4, 0x0

    .line 262
    .local v4, "$i$f$getDp\\11\\92":I
    int-to-float v5, v2

    invoke-static {v5}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v51

    .line 92
    .end local v2    # "$this$dp\\11":I
    .end local v4    # "$i$f$getDp\\11\\92":I
    const/16 v54, 0xd

    const/16 v55, 0x0

    const/16 v50, 0x0

    const/16 v52, 0x0

    const/16 v53, 0x0

    invoke-static/range {v49 .. v55}, Landroidx/compose/foundation/layout/PaddingKt;->padding-qDBjuR0$default(Landroidx/compose/ui/Modifier;FFFFILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v2

    .line 87
    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroidx/compose/foundation/layout/BoxKt;->Box(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    .line 94
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    const/16 v4, 0xc

    .local v4, "$this$dp\\12":I
    const/4 v5, 0x0

    .line 263
    .local v5, "$i$f$getDp\\12\\94":I
    move/from16 v31, v5

    .end local v5    # "$i$f$getDp\\12\\94":I
    .local v31, "$i$f$getDp\\12\\94":I
    int-to-float v5, v4

    invoke-static {v5}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v4

    .line 94
    .end local v4    # "$this$dp\\12":I
    .end local v31    # "$i$f$getDp\\12\\94":I
    invoke-static {v2, v4}, Landroidx/compose/foundation/layout/SizeKt;->width-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v2

    move/from16 v4, v25

    invoke-static {v2, v3, v4}, Landroidx/compose/foundation/layout/SpacerKt;->Spacer(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    .line 95
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    move-object/from16 v34, v2

    check-cast v34, Landroidx/compose/ui/Modifier;

    const/16 v37, 0x2

    const/16 v38, 0x0

    const/high16 v35, 0x3f800000    # 1.0f

    const/16 v36, 0x0

    invoke-static/range {v33 .. v38}, Landroidx/compose/foundation/layout/RowScope;->weight$default(Landroidx/compose/foundation/layout/RowScope;Landroidx/compose/ui/Modifier;FZILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v2

    .local v2, "modifier\\13":Landroidx/compose/ui/Modifier;
    const/4 v4, 0x0

    .local v4, "$changed\\13":I
    move-object v5, v3

    .local v5, "$composer\\13":Landroidx/compose/runtime/Composer;
    const/16 v31, 0x0

    .line 264
    .local v31, "$i$f$Column\\13\\95":I
    move-object/from16 v34, v2

    .end local v2    # "modifier\\13":Landroidx/compose/ui/Modifier;
    .local v34, "modifier\\13":Landroidx/compose/ui/Modifier;
    const v2, -0x1cd0f17e

    move-object/from16 v35, v3

    .end local v3    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .local v35, "$composer\\9":Landroidx/compose/runtime/Composer;
    const-string v3, "CC(Column)P(2,3,1)87@4442L61,88@4508L133:Column.kt#2w3rfo"

    invoke-static {v5, v2, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 265
    sget-object v2, Landroidx/compose/foundation/layout/Arrangement;->INSTANCE:Landroidx/compose/foundation/layout/Arrangement;

    invoke-virtual {v2}, Landroidx/compose/foundation/layout/Arrangement;->getTop()Landroidx/compose/foundation/layout/Arrangement$Vertical;

    move-result-object v2

    .line 266
    .local v2, "verticalArrangement\\13":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    sget-object v3, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v3}, Landroidx/compose/ui/Alignment$Companion;->getStart()Landroidx/compose/ui/Alignment$Horizontal;

    move-result-object v3

    .line 269
    .local v3, "horizontalAlignment\\13":Landroidx/compose/ui/Alignment$Horizontal;
    shr-int/lit8 v36, v4, 0x3

    and-int/lit8 v36, v36, 0xe

    shr-int/lit8 v37, v4, 0x3

    and-int/lit8 v37, v37, 0x70

    move/from16 v38, v4

    .end local v4    # "$changed\\13":I
    .local v38, "$changed\\13":I
    or-int v4, v36, v37

    invoke-static {v2, v3, v5, v4}, Landroidx/compose/foundation/layout/ColumnKt;->columnMeasurePolicy(Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/ui/Alignment$Horizontal;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v4

    .line 273
    .local v4, "measurePolicy\\13":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v36, v38, 0x3

    and-int/lit8 v36, v36, 0x70

    .line 270
    move-object/from16 v37, v34

    .local v36, "$changed\\14":I
    .local v37, "modifier\\14":Landroidx/compose/ui/Modifier;
    const/16 v43, 0x0

    .line 274
    .local v43, "$i$f$Layout\\14\\270":I
    move-object/from16 v44, v2

    const v2, -0x4ee9b9da

    .end local v2    # "verticalArrangement\\13":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    .local v44, "verticalArrangement\\13":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    invoke-static {v5, v2, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 275
    const/4 v2, 0x0

    invoke-static {v5, v2}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v45

    .line 276
    .local v45, "compositeKeyHash\\14":I
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v2

    .line 277
    .local v2, "localMap\\14":Landroidx/compose/runtime/CompositionLocalMap;
    move-object/from16 v46, v3

    move-object/from16 v3, v37

    move-object/from16 v37, v6

    .end local v6    # "materialized\\3":Landroidx/compose/ui/Modifier;
    .local v3, "modifier\\14":Landroidx/compose/ui/Modifier;
    .local v37, "materialized\\3":Landroidx/compose/ui/Modifier;
    .local v46, "horizontalAlignment\\13":Landroidx/compose/ui/Alignment$Horizontal;
    invoke-static {v5, v3}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v6

    .line 279
    .local v6, "materialized\\14":Landroidx/compose/ui/Modifier;
    sget-object v47, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v47 .. v47}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v47

    move-object/from16 v48, v3

    .end local v3    # "modifier\\14":Landroidx/compose/ui/Modifier;
    .local v48, "modifier\\14":Landroidx/compose/ui/Modifier;
    shl-int/lit8 v3, v36, 0x6

    and-int/lit16 v3, v3, 0x380

    const/16 v25, 0x6

    or-int/lit8 v3, v3, 0x6

    .line 278
    move-object/from16 v49, v47

    .local v3, "$changed\\15":I
    .local v49, "factory\\15":Lkotlin/jvm/functions/Function0;
    const/16 v47, 0x0

    .line 280
    .local v47, "$i$f$ReusableComposeNode\\15\\278":I
    move/from16 v50, v3

    const v3, -0x2942ffcf

    .end local v3    # "$changed\\15":I
    .local v50, "$changed\\15":I
    invoke-static {v5, v3, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 281
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v3

    instance-of v3, v3, Landroidx/compose/runtime/Applier;

    if-nez v3, :cond_6

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 282
    :cond_6
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 283
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 284
    move-object/from16 v3, v49

    .end local v49    # "factory\\15":Lkotlin/jvm/functions/Function0;
    .local v3, "factory\\15":Lkotlin/jvm/functions/Function0;
    invoke-interface {v5, v3}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_4

    .line 286
    .end local v3    # "factory\\15":Lkotlin/jvm/functions/Function0;
    .restart local v49    # "factory\\15":Lkotlin/jvm/functions/Function0;
    :cond_7
    move-object/from16 v3, v49

    .end local v49    # "factory\\15":Lkotlin/jvm/functions/Function0;
    .restart local v3    # "factory\\15":Lkotlin/jvm/functions/Function0;
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 288
    :goto_4
    move-object/from16 v49, v3

    .end local v3    # "factory\\15":Lkotlin/jvm/functions/Function0;
    .restart local v49    # "factory\\15":Lkotlin/jvm/functions/Function0;
    invoke-static {v5}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v3

    .local v3, "$this$Layout_u24lambda_u240\\16":Landroidx/compose/runtime/Composer;
    const/16 v51, 0x0

    .line 289
    .local v51, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\16\\288\\14":I
    sget-object v52, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v53, v5

    .end local v5    # "$composer\\13":Landroidx/compose/runtime/Composer;
    .local v53, "$composer\\13":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v52 .. v52}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v5

    invoke-static {v3, v4, v5}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 290
    sget-object v5, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v5}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v5

    invoke-static {v3, v2, v5}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 291
    sget-object v5, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v5}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v5

    .local v5, "block\\17":Lkotlin/jvm/functions/Function2;
    const/16 v52, 0x0

    .line 292
    .local v52, "$i$f$set-impl\\17\\291":I
    move-object/from16 v54, v3

    .local v54, "$this$set_impl_u24lambda_u240\\17":Landroidx/compose/runtime/Composer;
    const/16 v55, 0x0

    .line 293
    .local v55, "$i$a$-with-Updater$set$1\\18\\292\\17":I
    invoke-interface/range {v54 .. v54}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v56

    if-nez v56, :cond_9

    move-object/from16 v56, v2

    .end local v2    # "localMap\\14":Landroidx/compose/runtime/CompositionLocalMap;
    .local v56, "localMap\\14":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-interface/range {v54 .. v54}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v57, v4

    .end local v4    # "measurePolicy\\13":Landroidx/compose/ui/layout/MeasurePolicy;
    .local v57, "measurePolicy\\13":Landroidx/compose/ui/layout/MeasurePolicy;
    invoke-static/range {v45 .. v45}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    goto :goto_5

    :cond_8
    move-object/from16 v4, v54

    goto :goto_6

    .end local v56    # "localMap\\14":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v57    # "measurePolicy\\13":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v2    # "localMap\\14":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v4    # "measurePolicy\\13":Landroidx/compose/ui/layout/MeasurePolicy;
    :cond_9
    move-object/from16 v56, v2

    move-object/from16 v57, v4

    .line 294
    .end local v2    # "localMap\\14":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v4    # "measurePolicy\\13":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v56    # "localMap\\14":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v57    # "measurePolicy\\13":Landroidx/compose/ui/layout/MeasurePolicy;
    :goto_5
    invoke-static/range {v45 .. v45}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v4, v54

    .end local v54    # "$this$set_impl_u24lambda_u240\\17":Landroidx/compose/runtime/Composer;
    .local v4, "$this$set_impl_u24lambda_u240\\17":Landroidx/compose/runtime/Composer;
    invoke-interface {v4, v2}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 295
    invoke-static/range {v45 .. v45}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v3, v2, v5}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 297
    :goto_6
    nop

    .line 292
    .end local v4    # "$this$set_impl_u24lambda_u240\\17":Landroidx/compose/runtime/Composer;
    .end local v55    # "$i$a$-with-Updater$set$1\\18\\292\\17":I
    nop

    .line 297
    nop

    .line 298
    .end local v5    # "block\\17":Lkotlin/jvm/functions/Function2;
    .end local v52    # "$i$f$set-impl\\17\\291":I
    sget-object v2, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v2

    invoke-static {v3, v6, v2}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 299
    nop

    .line 288
    .end local v3    # "$this$Layout_u24lambda_u240\\16":Landroidx/compose/runtime/Composer;
    .end local v51    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\16\\288\\14":I
    nop

    .line 300
    shr-int/lit8 v2, v50, 0x6

    and-int/lit8 v2, v2, 0xe

    .local v2, "$changed\\19":I
    move-object/from16 v3, v53

    .local v3, "$composer\\19":Landroidx/compose/runtime/Composer;
    const/4 v4, 0x0

    .line 271
    .local v4, "$i$a$-Layout-ColumnKt$Column$1\\19\\300\\13":I
    const v5, -0x16eda499

    move/from16 v51, v2

    .end local v2    # "$changed\\19":I
    .local v51, "$changed\\19":I
    const-string v2, "C89@4556L9:Column.kt#2w3rfo"

    invoke-static {v3, v5, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v2, Landroidx/compose/foundation/layout/ColumnScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/ColumnScopeInstance;

    shr-int/lit8 v5, v38, 0x6

    and-int/lit8 v5, v5, 0x70

    const/16 v25, 0x6

    or-int/lit8 v5, v5, 0x6

    .local v5, "$changed\\20":I
    check-cast v2, Landroidx/compose/foundation/layout/ColumnScope;

    .local v2, "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423_u24lambda_u2422\\20":Landroidx/compose/foundation/layout/ColumnScope;
    move-object/from16 v79, v3

    .local v79, "$composer\\20":Landroidx/compose/runtime/Composer;
    const/16 v52, 0x0

    .line 96
    .local v52, "$i$a$-Column-TimelineScreenKt$TimelineCard$2$1$1\\20\\271\\9":I
    move-object/from16 v54, v2

    .end local v2    # "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423_u24lambda_u2422\\20":Landroidx/compose/foundation/layout/ColumnScope;
    .local v54, "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423_u24lambda_u2422\\20":Landroidx/compose/foundation/layout/ColumnScope;
    const v2, 0x78eb5a8a

    move-object/from16 v55, v3

    .end local v3    # "$composer\\19":Landroidx/compose/runtime/Composer;
    .local v55, "$composer\\19":Landroidx/compose/runtime/Composer;
    const-string v3, "C95@3848L922,114@4787L40,117@4934L10,115@4844L217:TimelineScreen.kt#4cebsy"

    move/from16 v83, v4

    move-object/from16 v4, v79

    .end local v79    # "$composer\\20":Landroidx/compose/runtime/Composer;
    .local v4, "$composer\\20":Landroidx/compose/runtime/Composer;
    .local v83, "$i$a$-Layout-ColumnKt$Column$1\\19\\300\\13":I
    invoke-static {v4, v2, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v2, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/Alignment$Companion;->getCenterVertically()Landroidx/compose/ui/Alignment$Vertical;

    move-result-object v2

    .local v2, "verticalAlignment\\21":Landroidx/compose/ui/Alignment$Vertical;
    const/16 v3, 0x180

    .local v3, "$changed\\21":I
    move-object/from16 v58, v4

    .local v58, "$composer\\21":Landroidx/compose/runtime/Composer;
    const/16 v59, 0x0

    .line 301
    .local v59, "$i$f$Row\\21\\96":I
    move/from16 v60, v3

    move/from16 v84, v5

    move-object/from16 v3, v58

    const v5, 0x2952b718

    .end local v5    # "$changed\\20":I
    .end local v58    # "$composer\\21":Landroidx/compose/runtime/Composer;
    .local v3, "$composer\\21":Landroidx/compose/runtime/Composer;
    .local v60, "$changed\\21":I
    .local v84, "$changed\\20":I
    invoke-static {v3, v5, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 302
    sget-object v5, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v5, Landroidx/compose/ui/Modifier;

    .line 303
    .local v5, "modifier\\21":Landroidx/compose/ui/Modifier;
    sget-object v58, Landroidx/compose/foundation/layout/Arrangement;->INSTANCE:Landroidx/compose/foundation/layout/Arrangement;

    move-object/from16 v61, v5

    .end local v5    # "modifier\\21":Landroidx/compose/ui/Modifier;
    .local v61, "modifier\\21":Landroidx/compose/ui/Modifier;
    invoke-virtual/range {v58 .. v58}, Landroidx/compose/foundation/layout/Arrangement;->getStart()Landroidx/compose/foundation/layout/Arrangement$Horizontal;

    move-result-object v5

    .line 307
    .local v5, "horizontalArrangement\\21":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    shr-int/lit8 v58, v60, 0x3

    and-int/lit8 v58, v58, 0xe

    shr-int/lit8 v62, v60, 0x3

    and-int/lit8 v62, v62, 0x70

    move-object/from16 v85, v6

    .end local v6    # "materialized\\14":Landroidx/compose/ui/Modifier;
    .local v85, "materialized\\14":Landroidx/compose/ui/Modifier;
    or-int v6, v58, v62

    invoke-static {v5, v2, v3, v6}, Landroidx/compose/foundation/layout/RowKt;->rowMeasurePolicy(Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/ui/Alignment$Vertical;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v6

    .line 311
    .local v6, "measurePolicy\\21":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v58, v60, 0x3

    and-int/lit8 v58, v58, 0x70

    .line 308
    move-object/from16 v62, v61

    .local v58, "$changed\\22":I
    .local v62, "modifier\\22":Landroidx/compose/ui/Modifier;
    const/16 v63, 0x0

    .line 312
    .local v63, "$i$f$Layout\\22\\308":I
    move-object/from16 v64, v2

    const v2, -0x4ee9b9da

    .end local v2    # "verticalAlignment\\21":Landroidx/compose/ui/Alignment$Vertical;
    .local v64, "verticalAlignment\\21":Landroidx/compose/ui/Alignment$Vertical;
    invoke-static {v3, v2, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 313
    const/4 v2, 0x0

    invoke-static {v3, v2}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v65

    .line 314
    .local v65, "compositeKeyHash\\22":I
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v2

    .line 315
    .local v2, "localMap\\22":Landroidx/compose/runtime/CompositionLocalMap;
    move-object/from16 v66, v5

    move/from16 v86, v7

    move-object/from16 v5, v62

    .end local v7    # "$changed\\2":I
    .end local v62    # "modifier\\22":Landroidx/compose/ui/Modifier;
    .local v5, "modifier\\22":Landroidx/compose/ui/Modifier;
    .local v66, "horizontalArrangement\\21":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .local v86, "$changed\\2":I
    invoke-static {v3, v5}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v7

    .line 317
    .local v7, "materialized\\22":Landroidx/compose/ui/Modifier;
    sget-object v62, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v62 .. v62}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v62

    move-object/from16 v67, v5

    .end local v5    # "modifier\\22":Landroidx/compose/ui/Modifier;
    .local v67, "modifier\\22":Landroidx/compose/ui/Modifier;
    shl-int/lit8 v5, v58, 0x6

    and-int/lit16 v5, v5, 0x380

    const/16 v25, 0x6

    or-int/lit8 v5, v5, 0x6

    .line 316
    move-object/from16 v68, v62

    .local v5, "$changed\\23":I
    .local v68, "factory\\23":Lkotlin/jvm/functions/Function0;
    const/16 v62, 0x0

    .line 318
    .local v62, "$i$f$ReusableComposeNode\\23\\316":I
    move/from16 v69, v5

    const v5, -0x2942ffcf

    .end local v5    # "$changed\\23":I
    .local v69, "$changed\\23":I
    invoke-static {v3, v5, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 319
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v5

    instance-of v5, v5, Landroidx/compose/runtime/Applier;

    if-nez v5, :cond_a

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 320
    :cond_a
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 321
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v5

    if-eqz v5, :cond_b

    .line 322
    move-object/from16 v5, v68

    .end local v68    # "factory\\23":Lkotlin/jvm/functions/Function0;
    .local v5, "factory\\23":Lkotlin/jvm/functions/Function0;
    invoke-interface {v3, v5}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_7

    .line 324
    .end local v5    # "factory\\23":Lkotlin/jvm/functions/Function0;
    .restart local v68    # "factory\\23":Lkotlin/jvm/functions/Function0;
    :cond_b
    move-object/from16 v5, v68

    .end local v68    # "factory\\23":Lkotlin/jvm/functions/Function0;
    .restart local v5    # "factory\\23":Lkotlin/jvm/functions/Function0;
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 326
    :goto_7
    move-object/from16 v68, v3

    .end local v3    # "$composer\\21":Landroidx/compose/runtime/Composer;
    .local v68, "$composer\\21":Landroidx/compose/runtime/Composer;
    invoke-static/range {v68 .. v68}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v3

    .local v3, "$this$Layout_u24lambda_u240\\24":Landroidx/compose/runtime/Composer;
    const/16 v70, 0x0

    .line 327
    .local v70, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\24\\326\\22":I
    sget-object v71, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v72, v5

    .end local v5    # "factory\\23":Lkotlin/jvm/functions/Function0;
    .local v72, "factory\\23":Lkotlin/jvm/functions/Function0;
    invoke-virtual/range {v71 .. v71}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v5

    invoke-static {v3, v6, v5}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 328
    sget-object v5, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v5}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v5

    invoke-static {v3, v2, v5}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 329
    sget-object v5, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v5}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v5

    .local v5, "block\\25":Lkotlin/jvm/functions/Function2;
    const/16 v71, 0x0

    .line 330
    .local v71, "$i$f$set-impl\\25\\329":I
    move-object/from16 v73, v3

    .local v73, "$this$set_impl_u24lambda_u240\\25":Landroidx/compose/runtime/Composer;
    const/16 v74, 0x0

    .line 331
    .local v74, "$i$a$-with-Updater$set$1\\26\\330\\25":I
    invoke-interface/range {v73 .. v73}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v75

    if-nez v75, :cond_d

    move-object/from16 v75, v2

    .end local v2    # "localMap\\22":Landroidx/compose/runtime/CompositionLocalMap;
    .local v75, "localMap\\22":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-interface/range {v73 .. v73}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v76, v6

    .end local v6    # "measurePolicy\\21":Landroidx/compose/ui/layout/MeasurePolicy;
    .local v76, "measurePolicy\\21":Landroidx/compose/ui/layout/MeasurePolicy;
    invoke-static/range {v65 .. v65}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v2, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    goto :goto_8

    :cond_c
    move-object/from16 v6, v73

    goto :goto_9

    .end local v75    # "localMap\\22":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v76    # "measurePolicy\\21":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v2    # "localMap\\22":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v6    # "measurePolicy\\21":Landroidx/compose/ui/layout/MeasurePolicy;
    :cond_d
    move-object/from16 v75, v2

    move-object/from16 v76, v6

    .line 332
    .end local v2    # "localMap\\22":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v6    # "measurePolicy\\21":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v75    # "localMap\\22":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v76    # "measurePolicy\\21":Landroidx/compose/ui/layout/MeasurePolicy;
    :goto_8
    invoke-static/range {v65 .. v65}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v6, v73

    .end local v73    # "$this$set_impl_u24lambda_u240\\25":Landroidx/compose/runtime/Composer;
    .local v6, "$this$set_impl_u24lambda_u240\\25":Landroidx/compose/runtime/Composer;
    invoke-interface {v6, v2}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 333
    invoke-static/range {v65 .. v65}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v3, v2, v5}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 335
    :goto_9
    nop

    .line 330
    .end local v6    # "$this$set_impl_u24lambda_u240\\25":Landroidx/compose/runtime/Composer;
    .end local v74    # "$i$a$-with-Updater$set$1\\26\\330\\25":I
    nop

    .line 335
    nop

    .line 336
    .end local v5    # "block\\25":Lkotlin/jvm/functions/Function2;
    .end local v71    # "$i$f$set-impl\\25\\329":I
    sget-object v2, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v2

    invoke-static {v3, v7, v2}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 337
    nop

    .line 326
    .end local v3    # "$this$Layout_u24lambda_u240\\24":Landroidx/compose/runtime/Composer;
    .end local v70    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\24\\326\\22":I
    nop

    .line 338
    shr-int/lit8 v2, v69, 0x6

    and-int/lit8 v2, v2, 0xe

    .local v2, "$changed\\27":I
    move-object/from16 v3, v68

    .local v3, "$composer\\27":Landroidx/compose/runtime/Composer;
    const/4 v5, 0x0

    .line 309
    .local v5, "$i$a$-Layout-RowKt$Row$1\\27\\338\\21":I
    const v6, -0x184d8b46

    invoke-static {v3, v6, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v6, Landroidx/compose/foundation/layout/RowScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/RowScopeInstance;

    shr-int/lit8 v70, v60, 0x6

    and-int/lit8 v70, v70, 0x70

    const/16 v25, 0x6

    or-int/lit8 v70, v70, 0x6

    .local v70, "$changed\\28":I
    check-cast v6, Landroidx/compose/foundation/layout/RowScope;

    .local v6, "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423_u24lambda_u2422_u24lambda_u2420\\28":Landroidx/compose/foundation/layout/RowScope;
    move-object/from16 v108, v3

    .local v108, "$composer\\28":Landroidx/compose/runtime/Composer;
    const/16 v71, 0x0

    .line 97
    .local v71, "$i$a$-Row-TimelineScreenKt$TimelineCard$2$1$1$1\\28\\309\\20":I
    move/from16 v73, v2

    .end local v2    # "$changed\\27":I
    .local v73, "$changed\\27":I
    const v2, -0x66f6ed38

    move-object/from16 v74, v3

    .end local v3    # "$composer\\27":Landroidx/compose/runtime/Composer;
    .local v74, "$composer\\27":Landroidx/compose/runtime/Composer;
    const-string v3, "C98@4016L10,99@4086L11,96@3922L214,101@4157L39,103@4272L6,104@4318L29,105@4390L362,102@4217L535:TimelineScreen.kt#4cebsy"

    move/from16 v77, v5

    move-object/from16 v5, v108

    .end local v108    # "$composer\\28":Landroidx/compose/runtime/Composer;
    .local v5, "$composer\\28":Landroidx/compose/runtime/Composer;
    .local v77, "$i$a$-Layout-RowKt$Row$1\\27\\338\\21":I
    invoke-static {v5, v2, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 98
    invoke-static/range {p1 .. p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 99
    sget-object v2, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v3, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v2, v5, v3}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/material3/Typography;->getLabelMedium()Landroidx/compose/ui/text/TextStyle;

    move-result-object v107

    .line 100
    sget-object v2, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v3, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v2, v5, v3}, Landroidx/compose/material3/MaterialTheme;->getColorScheme(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/ColorScheme;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/material3/ColorScheme;->getOnSurfaceVariant-0d7_KjU()J

    move-result-wide v89

    .line 98
    nop

    .line 100
    nop

    .line 99
    nop

    .line 97
    const/16 v88, 0x0

    const-wide/16 v91, 0x0

    const/16 v93, 0x0

    const/16 v94, 0x0

    const/16 v95, 0x0

    const-wide/16 v96, 0x0

    const/16 v98, 0x0

    const/16 v99, 0x0

    const-wide/16 v100, 0x0

    const/16 v102, 0x0

    const/16 v103, 0x0

    const/16 v104, 0x0

    const/16 v105, 0x0

    const/16 v106, 0x0

    const/16 v109, 0x0

    const/16 v110, 0x0

    const v111, 0xfffa

    move-object/from16 v87, p1

    .end local v5    # "$composer\\28":Landroidx/compose/runtime/Composer;
    .restart local v108    # "$composer\\28":Landroidx/compose/runtime/Composer;
    invoke-static/range {v87 .. v111}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 102
    .end local v108    # "$composer\\28":Landroidx/compose/runtime/Composer;
    .restart local v5    # "$composer\\28":Landroidx/compose/runtime/Composer;
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    const/16 v3, 0x8

    .local v3, "$this$dp\\29":I
    const/16 v78, 0x0

    .line 339
    .local v78, "$i$f$getDp\\29\\102":I
    move-object/from16 v79, v6

    .end local v6    # "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423_u24lambda_u2422_u24lambda_u2420\\28":Landroidx/compose/foundation/layout/RowScope;
    .local v79, "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423_u24lambda_u2422_u24lambda_u2420\\28":Landroidx/compose/foundation/layout/RowScope;
    int-to-float v6, v3

    invoke-static {v6}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v3

    .line 102
    .end local v3    # "$this$dp\\29":I
    .end local v78    # "$i$f$getDp\\29\\102":I
    invoke-static {v2, v3}, Landroidx/compose/foundation/layout/SizeKt;->width-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v2

    const/4 v3, 0x6

    invoke-static {v2, v5, v3}, Landroidx/compose/foundation/layout/SpacerKt;->Spacer(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    .line 104
    sget-object v2, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v3, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v2, v5, v3}, Landroidx/compose/material3/MaterialTheme;->getShapes(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Shapes;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/material3/Shapes;->getSmall()Landroidx/compose/foundation/shape/CornerBasedShape;

    move-result-object v2

    move-object/from16 v88, v2

    check-cast v88, Landroidx/compose/ui/graphics/Shape;

    .line 105
    invoke-virtual/range {p0 .. p0}, Lcom/hardlineforge/lala/data/LogEntry;->getCategory()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v5, v3}, Lcom/hardlineforge/lala/ui/ColorUtilsKt;->categoryColor(Ljava/lang/String;Landroidx/compose/runtime/Composer;I)J

    move-result-wide v89

    const/16 v95, 0xe

    const/16 v96, 0x0

    const v91, 0x3df5c28f    # 0.12f

    const/16 v92, 0x0

    const/16 v93, 0x0

    const/16 v94, 0x0

    invoke-static/range {v89 .. v96}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v89

    .line 106
    new-instance v2, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda3;

    move-object/from16 v3, p0

    invoke-direct {v2, v3}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda3;-><init>(Lcom/hardlineforge/lala/data/LogEntry;)V

    const/16 v6, 0x36

    const v3, -0x4aa57288

    move-object/from16 v78, v7

    const/4 v7, 0x1

    .end local v7    # "materialized\\22":Landroidx/compose/ui/Modifier;
    .local v78, "materialized\\22":Landroidx/compose/ui/Modifier;
    invoke-static {v3, v7, v2, v5, v6}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v2

    move-object/from16 v96, v2

    check-cast v96, Lkotlin/jvm/functions/Function2;

    .line 103
    const/16 v87, 0x0

    const-wide/16 v91, 0x0

    const/16 v95, 0x0

    const/high16 v98, 0xc00000

    const/16 v99, 0x79

    move-object/from16 v97, v5

    .end local v5    # "$composer\\28":Landroidx/compose/runtime/Composer;
    .local v97, "$composer\\28":Landroidx/compose/runtime/Composer;
    invoke-static/range {v87 .. v99}, Landroidx/compose/material3/SurfaceKt;->Surface-T9BRK9s(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/graphics/Shape;JJFFLandroidx/compose/foundation/BorderStroke;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    .line 97
    .end local v97    # "$composer\\28":Landroidx/compose/runtime/Composer;
    .restart local v5    # "$composer\\28":Landroidx/compose/runtime/Composer;
    invoke-static {v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 114
    nop

    .line 309
    .end local v5    # "$composer\\28":Landroidx/compose/runtime/Composer;
    .end local v70    # "$changed\\28":I
    .end local v71    # "$i$a$-Row-TimelineScreenKt$TimelineCard$2$1$1$1\\28\\309\\20":I
    .end local v79    # "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423_u24lambda_u2422_u24lambda_u2420\\28":Landroidx/compose/foundation/layout/RowScope;
    invoke-static/range {v74 .. v74}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 338
    .end local v73    # "$changed\\27":I
    .end local v74    # "$composer\\27":Landroidx/compose/runtime/Composer;
    .end local v77    # "$i$a$-Layout-RowKt$Row$1\\27\\338\\21":I
    nop

    .line 340
    invoke-interface/range {v68 .. v68}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 318
    invoke-static/range {v68 .. v68}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 341
    nop

    .line 312
    .end local v62    # "$i$f$ReusableComposeNode\\23\\316":I
    .end local v69    # "$changed\\23":I
    .end local v72    # "factory\\23":Lkotlin/jvm/functions/Function0;
    invoke-static/range {v68 .. v68}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 342
    nop

    .line 301
    .end local v58    # "$changed\\22":I
    .end local v63    # "$i$f$Layout\\22\\308":I
    .end local v65    # "compositeKeyHash\\22":I
    .end local v67    # "modifier\\22":Landroidx/compose/ui/Modifier;
    .end local v75    # "localMap\\22":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v78    # "materialized\\22":Landroidx/compose/ui/Modifier;
    invoke-static/range {v68 .. v68}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 343
    nop

    .line 115
    .end local v59    # "$i$f$Row\\21\\96":I
    .end local v60    # "$changed\\21":I
    .end local v61    # "modifier\\21":Landroidx/compose/ui/Modifier;
    .end local v64    # "verticalAlignment\\21":Landroidx/compose/ui/Alignment$Vertical;
    .end local v66    # "horizontalArrangement\\21":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .end local v68    # "$composer\\21":Landroidx/compose/runtime/Composer;
    .end local v76    # "measurePolicy\\21":Landroidx/compose/ui/layout/MeasurePolicy;
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    const/4 v3, 0x4

    .local v3, "$this$dp\\30":I
    const/4 v5, 0x0

    .line 344
    .local v5, "$i$f$getDp\\30\\115":I
    int-to-float v6, v3

    invoke-static {v6}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v3

    .line 115
    .end local v3    # "$this$dp\\30":I
    .end local v5    # "$i$f$getDp\\30\\115":I
    invoke-static {v2, v3}, Landroidx/compose/foundation/layout/SizeKt;->height-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v2

    const/4 v3, 0x6

    invoke-static {v2, v4, v3}, Landroidx/compose/foundation/layout/SpacerKt;->Spacer(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    .line 117
    invoke-virtual/range {p0 .. p0}, Lcom/hardlineforge/lala/data/LogEntry;->getComment()Ljava/lang/String;

    move-result-object v58

    .line 118
    sget-object v2, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v3, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v2, v4, v3}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/material3/Typography;->getBodyMedium()Landroidx/compose/ui/text/TextStyle;

    move-result-object v78

    .line 120
    sget-object v2, Landroidx/compose/ui/text/style/TextOverflow;->Companion:Landroidx/compose/ui/text/style/TextOverflow$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/text/style/TextOverflow$Companion;->getEllipsis-gIe3tQ8()I

    move-result v73

    .line 117
    nop

    .line 120
    nop

    .line 119
    nop

    .line 118
    nop

    .line 116
    const/16 v59, 0x0

    const-wide/16 v60, 0x0

    const-wide/16 v62, 0x0

    const/16 v64, 0x0

    const/16 v65, 0x0

    const/16 v66, 0x0

    const-wide/16 v67, 0x0

    const/16 v69, 0x0

    const/16 v70, 0x0

    const-wide/16 v71, 0x0

    const/16 v74, 0x0

    const/16 v75, 0x3

    const/16 v76, 0x0

    const/16 v77, 0x0

    const/16 v80, 0x0

    const/16 v81, 0xc30

    const v82, 0xd7fe

    move-object/from16 v79, v4

    .end local v4    # "$composer\\20":Landroidx/compose/runtime/Composer;
    .local v79, "$composer\\20":Landroidx/compose/runtime/Composer;
    invoke-static/range {v58 .. v82}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 122
    move-object/from16 v3, v79

    .end local v79    # "$composer\\20":Landroidx/compose/runtime/Composer;
    .local v3, "$composer\\20":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {p0 .. p0}, Lcom/hardlineforge/lala/data/LogEntry;->getLocationName()Ljava/lang/String;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    if-eqz v2, :cond_f

    invoke-static {v2}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_e

    goto :goto_a

    :cond_e
    const/4 v5, 0x0

    goto :goto_b

    :cond_f
    :goto_a
    move v5, v7

    :goto_b
    if-nez v5, :cond_14

    const v2, 0x78fdfdc0

    invoke-interface {v3, v2}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v2, "122@5141L40,123@5202L708"

    invoke-static {v3, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 123
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    const/4 v4, 0x4

    .local v4, "$this$dp\\31":I
    const/4 v5, 0x0

    .line 345
    .local v5, "$i$f$getDp\\31\\123":I
    int-to-float v6, v4

    invoke-static {v6}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v4

    .line 123
    .end local v4    # "$this$dp\\31":I
    .end local v5    # "$i$f$getDp\\31\\123":I
    invoke-static {v2, v4}, Landroidx/compose/foundation/layout/SizeKt;->height-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v2

    const/4 v4, 0x6

    invoke-static {v2, v3, v4}, Landroidx/compose/foundation/layout/SpacerKt;->Spacer(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    .line 124
    sget-object v2, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/Alignment$Companion;->getCenterVertically()Landroidx/compose/ui/Alignment$Vertical;

    move-result-object v2

    .local v2, "verticalAlignment\\32":Landroidx/compose/ui/Alignment$Vertical;
    const/16 v4, 0x180

    .local v4, "$changed\\32":I
    move-object v5, v3

    .local v5, "$composer\\32":Landroidx/compose/runtime/Composer;
    const/4 v6, 0x0

    .line 346
    .local v6, "$i$f$Row\\32\\124":I
    const v7, 0x2952b718

    invoke-static {v5, v7, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 347
    sget-object v7, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v7, Landroidx/compose/ui/Modifier;

    .line 348
    .local v7, "modifier\\32":Landroidx/compose/ui/Modifier;
    sget-object v11, Landroidx/compose/foundation/layout/Arrangement;->INSTANCE:Landroidx/compose/foundation/layout/Arrangement;

    invoke-virtual {v11}, Landroidx/compose/foundation/layout/Arrangement;->getStart()Landroidx/compose/foundation/layout/Arrangement$Horizontal;

    move-result-object v11

    .line 352
    .local v11, "horizontalArrangement\\32":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    shr-int/lit8 v17, v4, 0x3

    and-int/lit8 v17, v17, 0xe

    shr-int/lit8 v18, v4, 0x3

    and-int/lit8 v18, v18, 0x70

    move/from16 v58, v4

    .end local v4    # "$changed\\32":I
    .local v58, "$changed\\32":I
    or-int v4, v17, v18

    invoke-static {v11, v2, v5, v4}, Landroidx/compose/foundation/layout/RowKt;->rowMeasurePolicy(Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/ui/Alignment$Vertical;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v4

    .line 356
    .local v4, "measurePolicy\\32":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v17, v58, 0x3

    and-int/lit8 v17, v17, 0x70

    .line 353
    move-object/from16 v18, v7

    .local v17, "$changed\\33":I
    .local v18, "modifier\\33":Landroidx/compose/ui/Modifier;
    const/16 v59, 0x0

    .line 357
    .local v59, "$i$f$Layout\\33\\353":I
    move-object/from16 v60, v2

    const v2, -0x4ee9b9da

    .end local v2    # "verticalAlignment\\32":Landroidx/compose/ui/Alignment$Vertical;
    .local v60, "verticalAlignment\\32":Landroidx/compose/ui/Alignment$Vertical;
    invoke-static {v5, v2, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 358
    const/4 v2, 0x0

    invoke-static {v5, v2}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v2

    .line 359
    .local v2, "compositeKeyHash\\33":I
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v10

    .line 360
    .local v10, "localMap\\33":Landroidx/compose/runtime/CompositionLocalMap;
    move/from16 v20, v2

    move-object/from16 v2, v18

    move/from16 v18, v6

    .end local v6    # "$i$f$Row\\32\\124":I
    .local v2, "modifier\\33":Landroidx/compose/ui/Modifier;
    .local v18, "$i$f$Row\\32\\124":I
    .local v20, "compositeKeyHash\\33":I
    invoke-static {v5, v2}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v6

    .line 362
    .local v6, "materialized\\33":Landroidx/compose/ui/Modifier;
    sget-object v21, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v21 .. v21}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v21

    move-object/from16 v61, v2

    .end local v2    # "modifier\\33":Landroidx/compose/ui/Modifier;
    .local v61, "modifier\\33":Landroidx/compose/ui/Modifier;
    shl-int/lit8 v2, v17, 0x6

    and-int/lit16 v2, v2, 0x380

    const/16 v25, 0x6

    or-int/lit8 v2, v2, 0x6

    .line 361
    move-object/from16 v62, v21

    .local v2, "$changed\\34":I
    .local v62, "factory\\34":Lkotlin/jvm/functions/Function0;
    const/16 v21, 0x0

    .line 363
    .local v21, "$i$f$ReusableComposeNode\\34\\361":I
    move/from16 v63, v2

    const v2, -0x2942ffcf

    .end local v2    # "$changed\\34":I
    .local v63, "$changed\\34":I
    invoke-static {v5, v2, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 364
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v1

    instance-of v1, v1, Landroidx/compose/runtime/Applier;

    if-nez v1, :cond_10

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 365
    :cond_10
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 366
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 367
    move-object/from16 v1, v62

    .end local v62    # "factory\\34":Lkotlin/jvm/functions/Function0;
    .local v1, "factory\\34":Lkotlin/jvm/functions/Function0;
    invoke-interface {v5, v1}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_c

    .line 369
    .end local v1    # "factory\\34":Lkotlin/jvm/functions/Function0;
    .restart local v62    # "factory\\34":Lkotlin/jvm/functions/Function0;
    :cond_11
    move-object/from16 v1, v62

    .end local v62    # "factory\\34":Lkotlin/jvm/functions/Function0;
    .restart local v1    # "factory\\34":Lkotlin/jvm/functions/Function0;
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 371
    :goto_c
    invoke-static {v5}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v2

    .local v2, "$this$Layout_u24lambda_u240\\35":Landroidx/compose/runtime/Composer;
    const/16 v26, 0x0

    .line 372
    .local v26, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\35\\371\\33":I
    sget-object v62, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v64, v1

    .end local v1    # "factory\\34":Lkotlin/jvm/functions/Function0;
    .local v64, "factory\\34":Lkotlin/jvm/functions/Function0;
    invoke-virtual/range {v62 .. v62}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v1

    invoke-static {v2, v4, v1}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 373
    sget-object v1, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v1}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v1

    invoke-static {v2, v10, v1}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 374
    sget-object v1, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v1}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v1

    .local v1, "block\\36":Lkotlin/jvm/functions/Function2;
    const/16 v62, 0x0

    .line 375
    .local v62, "$i$f$set-impl\\36\\374":I
    move-object/from16 v65, v2

    .local v65, "$this$set_impl_u24lambda_u240\\36":Landroidx/compose/runtime/Composer;
    const/16 v66, 0x0

    .line 376
    .local v66, "$i$a$-with-Updater$set$1\\37\\375\\36":I
    invoke-interface/range {v65 .. v65}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v67

    if-nez v67, :cond_13

    move-object/from16 v67, v4

    .end local v4    # "measurePolicy\\32":Landroidx/compose/ui/layout/MeasurePolicy;
    .local v67, "measurePolicy\\32":Landroidx/compose/ui/layout/MeasurePolicy;
    invoke-interface/range {v65 .. v65}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v68, v5

    .end local v5    # "$composer\\32":Landroidx/compose/runtime/Composer;
    .local v68, "$composer\\32":Landroidx/compose/runtime/Composer;
    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_12

    goto :goto_d

    :cond_12
    move-object/from16 v5, v65

    goto :goto_e

    .end local v67    # "measurePolicy\\32":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v68    # "$composer\\32":Landroidx/compose/runtime/Composer;
    .restart local v4    # "measurePolicy\\32":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v5    # "$composer\\32":Landroidx/compose/runtime/Composer;
    :cond_13
    move-object/from16 v67, v4

    move-object/from16 v68, v5

    .line 377
    .end local v4    # "measurePolicy\\32":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v5    # "$composer\\32":Landroidx/compose/runtime/Composer;
    .restart local v67    # "measurePolicy\\32":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v68    # "$composer\\32":Landroidx/compose/runtime/Composer;
    :goto_d
    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v5, v65

    .end local v65    # "$this$set_impl_u24lambda_u240\\36":Landroidx/compose/runtime/Composer;
    .local v5, "$this$set_impl_u24lambda_u240\\36":Landroidx/compose/runtime/Composer;
    invoke-interface {v5, v4}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 378
    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4, v1}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 380
    :goto_e
    nop

    .line 375
    .end local v5    # "$this$set_impl_u24lambda_u240\\36":Landroidx/compose/runtime/Composer;
    .end local v66    # "$i$a$-with-Updater$set$1\\37\\375\\36":I
    nop

    .line 380
    nop

    .line 381
    .end local v1    # "block\\36":Lkotlin/jvm/functions/Function2;
    .end local v62    # "$i$f$set-impl\\36\\374":I
    sget-object v1, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v1}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v1

    invoke-static {v2, v6, v1}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 382
    nop

    .line 371
    .end local v2    # "$this$Layout_u24lambda_u240\\35":Landroidx/compose/runtime/Composer;
    .end local v26    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\35\\371\\33":I
    nop

    .line 383
    shr-int/lit8 v1, v63, 0x6

    and-int/lit8 v1, v1, 0xe

    .local v1, "$changed\\38":I
    move-object/from16 v2, v68

    .local v2, "$composer\\38":Landroidx/compose/runtime/Composer;
    const/4 v4, 0x0

    .line 354
    .local v4, "$i$a$-Layout-RowKt$Row$1\\38\\383\\32":I
    const v5, -0x184d8b46

    invoke-static {v2, v5, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v0, Landroidx/compose/foundation/layout/RowScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/RowScopeInstance;

    shr-int/lit8 v5, v58, 0x6

    and-int/lit8 v5, v5, 0x70

    const/16 v25, 0x6

    or-int/lit8 v5, v5, 0x6

    .local v5, "$changed\\39":I
    check-cast v0, Landroidx/compose/foundation/layout/RowScope;

    .local v0, "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423_u24lambda_u2422_u24lambda_u2421\\39":Landroidx/compose/foundation/layout/RowScope;
    move-object/from16 v74, v2

    .local v74, "$composer\\39":Landroidx/compose/runtime/Composer;
    const/16 v26, 0x0

    .line 125
    .local v26, "$i$a$-Row-TimelineScreenKt$TimelineCard$2$1$1$2\\39\\354\\20":I
    move-object/from16 v39, v0

    .end local v0    # "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423_u24lambda_u2422_u24lambda_u2421\\39":Landroidx/compose/foundation/layout/RowScope;
    .local v39, "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423_u24lambda_u2422_u24lambda_u2421\\39":Landroidx/compose/foundation/layout/RowScope;
    const v0, -0x14785a15

    move/from16 v62, v1

    .end local v1    # "$changed\\38":I
    .local v62, "$changed\\38":I
    const-string v1, "C128@5506L11,124@5280L280,130@5585L39,133@5760L10,134@5834L11,131@5649L239:TimelineScreen.kt#4cebsy"

    move-object/from16 v65, v2

    .end local v74    # "$composer\\39":Landroidx/compose/runtime/Composer;
    .local v2, "$composer\\39":Landroidx/compose/runtime/Composer;
    .local v65, "$composer\\38":Landroidx/compose/runtime/Composer;
    invoke-static {v2, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 126
    sget-object v0, Landroidx/compose/material/icons/Icons$Outlined;->INSTANCE:Landroidx/compose/material/icons/Icons$Outlined;

    invoke-static {v0}, Landroidx/compose/material/icons/outlined/LocationOnKt;->getLocationOn(Landroidx/compose/material/icons/Icons$Outlined;)Landroidx/compose/ui/graphics/vector/ImageVector;

    move-result-object v69

    .line 127
    nop

    .line 128
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    const/16 v1, 0xe

    .local v1, "$this$dp\\40":I
    const/16 v66, 0x0

    .line 384
    .local v66, "$i$f$getDp\\40\\128":I
    move/from16 v77, v4

    .end local v4    # "$i$a$-Layout-RowKt$Row$1\\38\\383\\32":I
    .local v77, "$i$a$-Layout-RowKt$Row$1\\38\\383\\32":I
    int-to-float v4, v1

    invoke-static {v4}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v1

    .line 128
    .end local v1    # "$this$dp\\40":I
    .end local v66    # "$i$f$getDp\\40\\128":I
    invoke-static {v0, v1}, Landroidx/compose/foundation/layout/SizeKt;->size-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v71

    .line 129
    sget-object v0, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v1, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v0, v2, v1}, Landroidx/compose/material3/MaterialTheme;->getColorScheme(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/ColorScheme;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/compose/material3/ColorScheme;->getOnSurfaceVariant-0d7_KjU()J

    move-result-wide v72

    .line 125
    const/16 v70, 0x0

    const/16 v75, 0x1b0

    const/16 v76, 0x0

    .end local v2    # "$composer\\39":Landroidx/compose/runtime/Composer;
    .restart local v74    # "$composer\\39":Landroidx/compose/runtime/Composer;
    invoke-static/range {v69 .. v76}, Landroidx/compose/material3/IconKt;->Icon-ww6aTOc(Landroidx/compose/ui/graphics/vector/ImageVector;Ljava/lang/String;Landroidx/compose/ui/Modifier;JLandroidx/compose/runtime/Composer;II)V

    .line 131
    .end local v74    # "$composer\\39":Landroidx/compose/runtime/Composer;
    .restart local v2    # "$composer\\39":Landroidx/compose/runtime/Composer;
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    const/4 v1, 0x4

    .local v1, "$this$dp\\41":I
    const/4 v4, 0x0

    .line 385
    .local v4, "$i$f$getDp\\41\\131":I
    move/from16 v66, v4

    .end local v4    # "$i$f$getDp\\41\\131":I
    .local v66, "$i$f$getDp\\41\\131":I
    int-to-float v4, v1

    invoke-static {v4}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v1

    .line 131
    .end local v1    # "$this$dp\\41":I
    .end local v66    # "$i$f$getDp\\41\\131":I
    invoke-static {v0, v1}, Landroidx/compose/foundation/layout/SizeKt;->width-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v0

    const/4 v4, 0x6

    invoke-static {v0, v2, v4}, Landroidx/compose/foundation/layout/SpacerKt;->Spacer(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    .line 133
    invoke-virtual/range {p0 .. p0}, Lcom/hardlineforge/lala/data/LogEntry;->getLocationName()Ljava/lang/String;

    move-result-object v87

    .line 134
    sget-object v0, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v1, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v0, v2, v1}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/compose/material3/Typography;->getLabelMedium()Landroidx/compose/ui/text/TextStyle;

    move-result-object v107

    .line 135
    sget-object v0, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v1, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v0, v2, v1}, Landroidx/compose/material3/MaterialTheme;->getColorScheme(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/ColorScheme;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/compose/material3/ColorScheme;->getOnSurfaceVariant-0d7_KjU()J

    move-result-wide v89

    .line 133
    nop

    .line 135
    nop

    .line 134
    nop

    .line 132
    const/16 v88, 0x0

    const-wide/16 v91, 0x0

    const/16 v93, 0x0

    const/16 v94, 0x0

    const/16 v95, 0x0

    const-wide/16 v96, 0x0

    const/16 v98, 0x0

    const/16 v99, 0x0

    const-wide/16 v100, 0x0

    const/16 v102, 0x0

    const/16 v103, 0x0

    const/16 v104, 0x0

    const/16 v105, 0x0

    const/16 v106, 0x0

    const/16 v109, 0x0

    const/16 v110, 0x0

    const v111, 0xfffa

    move-object/from16 v108, v2

    .end local v2    # "$composer\\39":Landroidx/compose/runtime/Composer;
    .local v108, "$composer\\39":Landroidx/compose/runtime/Composer;
    invoke-static/range {v87 .. v111}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 125
    .end local v108    # "$composer\\39":Landroidx/compose/runtime/Composer;
    .restart local v2    # "$composer\\39":Landroidx/compose/runtime/Composer;
    invoke-static {v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 137
    nop

    .line 354
    .end local v2    # "$composer\\39":Landroidx/compose/runtime/Composer;
    .end local v5    # "$changed\\39":I
    .end local v26    # "$i$a$-Row-TimelineScreenKt$TimelineCard$2$1$1$2\\39\\354\\20":I
    .end local v39    # "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423_u24lambda_u2422_u24lambda_u2421\\39":Landroidx/compose/foundation/layout/RowScope;
    invoke-static/range {v65 .. v65}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 383
    .end local v62    # "$changed\\38":I
    .end local v65    # "$composer\\38":Landroidx/compose/runtime/Composer;
    .end local v77    # "$i$a$-Layout-RowKt$Row$1\\38\\383\\32":I
    nop

    .line 386
    invoke-interface/range {v68 .. v68}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 363
    invoke-static/range {v68 .. v68}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 387
    nop

    .line 357
    .end local v21    # "$i$f$ReusableComposeNode\\34\\361":I
    .end local v63    # "$changed\\34":I
    .end local v64    # "factory\\34":Lkotlin/jvm/functions/Function0;
    invoke-static/range {v68 .. v68}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 388
    nop

    .line 346
    .end local v6    # "materialized\\33":Landroidx/compose/ui/Modifier;
    .end local v10    # "localMap\\33":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v17    # "$changed\\33":I
    .end local v20    # "compositeKeyHash\\33":I
    .end local v59    # "$i$f$Layout\\33\\353":I
    .end local v61    # "modifier\\33":Landroidx/compose/ui/Modifier;
    invoke-static/range {v68 .. v68}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 389
    nop

    .line 122
    .end local v7    # "modifier\\32":Landroidx/compose/ui/Modifier;
    .end local v11    # "horizontalArrangement\\32":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .end local v18    # "$i$f$Row\\32\\124":I
    .end local v58    # "$changed\\32":I
    .end local v60    # "verticalAlignment\\32":Landroidx/compose/ui/Alignment$Vertical;
    .end local v67    # "measurePolicy\\32":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v68    # "$composer\\32":Landroidx/compose/runtime/Composer;
    goto :goto_f

    :cond_14
    const v0, 0x78b01bc9

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    :goto_f
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 96
    invoke-static {v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 139
    nop

    .line 271
    .end local v3    # "$composer\\20":Landroidx/compose/runtime/Composer;
    .end local v52    # "$i$a$-Column-TimelineScreenKt$TimelineCard$2$1$1\\20\\271\\9":I
    .end local v54    # "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423_u24lambda_u2422\\20":Landroidx/compose/foundation/layout/ColumnScope;
    .end local v84    # "$changed\\20":I
    invoke-static/range {v55 .. v55}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 300
    .end local v51    # "$changed\\19":I
    .end local v55    # "$composer\\19":Landroidx/compose/runtime/Composer;
    .end local v83    # "$i$a$-Layout-ColumnKt$Column$1\\19\\300\\13":I
    nop

    .line 390
    invoke-interface/range {v53 .. v53}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 280
    invoke-static/range {v53 .. v53}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 391
    nop

    .line 274
    .end local v47    # "$i$f$ReusableComposeNode\\15\\278":I
    .end local v49    # "factory\\15":Lkotlin/jvm/functions/Function0;
    .end local v50    # "$changed\\15":I
    invoke-static/range {v53 .. v53}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 392
    nop

    .line 264
    .end local v36    # "$changed\\14":I
    .end local v43    # "$i$f$Layout\\14\\270":I
    .end local v45    # "compositeKeyHash\\14":I
    .end local v48    # "modifier\\14":Landroidx/compose/ui/Modifier;
    .end local v56    # "localMap\\14":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v85    # "materialized\\14":Landroidx/compose/ui/Modifier;
    invoke-static/range {v53 .. v53}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 393
    nop

    .line 87
    .end local v31    # "$i$f$Column\\13\\95":I
    .end local v34    # "modifier\\13":Landroidx/compose/ui/Modifier;
    .end local v38    # "$changed\\13":I
    .end local v44    # "verticalArrangement\\13":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    .end local v46    # "horizontalAlignment\\13":Landroidx/compose/ui/Alignment$Horizontal;
    .end local v53    # "$composer\\13":Landroidx/compose/runtime/Composer;
    .end local v57    # "measurePolicy\\13":Landroidx/compose/ui/layout/MeasurePolicy;
    invoke-static/range {v35 .. v35}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 140
    nop

    .line 231
    .end local v28    # "$i$a$-Row-TimelineScreenKt$TimelineCard$2$1\\9\\231\\0":I
    .end local v30    # "$changed\\9":I
    .end local v33    # "$this$TimelineCard_u24lambda_u2424_u24lambda_u2423\\9":Landroidx/compose/foundation/layout/RowScope;
    .end local v35    # "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-static/range {v40 .. v40}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 260
    .end local v27    # "$changed\\8":I
    .end local v40    # "$composer\\8":Landroidx/compose/runtime/Composer;
    .end local v41    # "$i$a$-Layout-RowKt$Row$1\\8\\260\\2":I
    nop

    .line 394
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 240
    invoke-static {v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 395
    nop

    .line 234
    .end local v22    # "$i$f$ReusableComposeNode\\4\\238":I
    .end local v23    # "$changed\\4":I
    .end local v24    # "factory\\4":Lkotlin/jvm/functions/Function0;
    invoke-static {v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 396
    nop

    .line 224
    .end local v14    # "$changed\\3":I
    .end local v15    # "modifier\\3":Landroidx/compose/ui/Modifier;
    .end local v16    # "$i$f$Layout\\3\\230":I
    .end local v19    # "compositeKeyHash\\3":I
    .end local v37    # "materialized\\3":Landroidx/compose/ui/Modifier;
    .end local v42    # "localMap\\3":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static {v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 397
    nop

    .end local v8    # "$composer\\2":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$Row\\2\\85":I
    .end local v12    # "horizontalArrangement\\2":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .end local v13    # "measurePolicy\\2":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v29    # "modifier\\2":Landroidx/compose/ui/Modifier;
    .end local v32    # "verticalAlignment\\2":Landroidx/compose/ui/Alignment$Vertical;
    .end local v86    # "$changed\\2":I
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_10

    .line 84
    :cond_15
    invoke-interface/range {p3 .. p3}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 141
    :cond_16
    :goto_10
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final TimelineCard$lambda$24$lambda$23$lambda$22$lambda$20$lambda$19(Lcom/hardlineforge/lala/data/LogEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 25
    .param p0, "$entry"    # Lcom/hardlineforge/lala/data/LogEntry;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    move-object/from16 v0, p1

    move/from16 v1, p2

    const-string v2, "C108@4523L10,109@4582L29,106@4416L314:TimelineScreen.kt#4cebsy"

    invoke-static {v0, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v2, v1, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-eq v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    and-int/lit8 v3, v1, 0x1

    invoke-interface {v0, v2, v3}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    const-string v3, "com.hardlineforge.lala.ui.screens.TimelineCard.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (TimelineScreen.kt:106)"

    const v5, -0x4aa57288

    invoke-static {v5, v1, v2, v3}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 108
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/hardlineforge/lala/data/LogEntry;->getCategory()Ljava/lang/String;

    move-result-object v2

    .line 109
    sget-object v3, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v5, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v3, v0, v5}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material3/Typography;->getLabelSmall()Landroidx/compose/ui/text/TextStyle;

    move-result-object v20

    .line 110
    invoke-virtual/range {p0 .. p0}, Lcom/hardlineforge/lala/data/LogEntry;->getCategory()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0, v4}, Lcom/hardlineforge/lala/ui/ColorUtilsKt;->categoryColor(Ljava/lang/String;Landroidx/compose/runtime/Composer;I)J

    move-result-wide v3

    .line 111
    sget-object v5, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v5, Landroidx/compose/ui/Modifier;

    const/16 v6, 0x8

    .local v6, "$this$dp\\1":I
    const/4 v7, 0x0

    .line 222
    .local v7, "$i$f$getDp\\1\\111":I
    int-to-float v8, v6

    invoke-static {v8}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v6

    .line 111
    .end local v6    # "$this$dp\\1":I
    .end local v7    # "$i$f$getDp\\1\\111":I
    const/4 v7, 0x2

    .local v7, "$this$dp\\2":I
    const/4 v8, 0x0

    .line 222
    .local v8, "$i$f$getDp\\2\\111":I
    int-to-float v9, v7

    invoke-static {v9}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v7

    .line 111
    .end local v7    # "$this$dp\\2":I
    .end local v8    # "$i$f$getDp\\2\\111":I
    invoke-static {v5, v6, v7}, Landroidx/compose/foundation/layout/PaddingKt;->padding-VpY3zN4(Landroidx/compose/ui/Modifier;FF)Landroidx/compose/ui/Modifier;

    move-result-object v5

    .line 108
    nop

    .line 111
    nop

    .line 110
    nop

    .line 109
    nop

    .line 107
    move-object v0, v2

    move-wide v2, v3

    move-object v1, v5

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-wide/16 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const-wide/16 v13, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v22, 0x30

    const/16 v23, 0x0

    const v24, 0xfff8

    move-object/from16 v21, p1

    invoke-static/range {v0 .. v24}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    .line 106
    :cond_2
    invoke-interface/range {p1 .. p1}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 113
    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final TimelineCard$lambda$25(Lcom/hardlineforge/lala/data/LogEntry;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 1

    or-int/lit8 v0, p3, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v0

    invoke-static {p0, p1, p2, p4, v0}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt;->TimelineCard(Lcom/hardlineforge/lala/data/LogEntry;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;I)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public static final TimelineScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
    .locals 24
    .param p0, "navController"    # Landroidx/navigation/NavHostController;
    .param p1, "vm"    # Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    const-string v3, "navController"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    const v3, 0x64957dd5

    move-object/from16 v4, p2

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v4

    .end local p2    # "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "$composer":Landroidx/compose/runtime/Composer;
    const-string v5, "C(TimelineScreen)30@1316L16,31@1361L42,37@1568L231,44@1806L1001,36@1527L1280:TimelineScreen.kt#4cebsy"

    invoke-static {v4, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v5, p3

    .local v5, "$dirty":I
    and-int/lit8 v6, v1, 0x6

    if-nez v6, :cond_1

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v6, 0x4

    goto :goto_0

    :cond_0
    const/4 v6, 0x2

    :goto_0
    or-int/2addr v5, v6

    :cond_1
    and-int/lit8 v6, v1, 0x30

    if-nez v6, :cond_4

    and-int/lit8 v6, v2, 0x2

    if-nez v6, :cond_2

    move-object/from16 v6, p1

    invoke-interface {v4, v6}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    const/16 v8, 0x20

    goto :goto_1

    :cond_2
    move-object/from16 v6, p1

    :cond_3
    const/16 v8, 0x10

    :goto_1
    or-int/2addr v5, v8

    goto :goto_2

    :cond_4
    move-object/from16 v6, p1

    :goto_2
    and-int/lit8 v8, v5, 0x13

    const/16 v9, 0x12

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-eq v8, v9, :cond_5

    move v8, v11

    goto :goto_3

    :cond_5
    move v8, v10

    :goto_3
    and-int/lit8 v9, v5, 0x1

    invoke-interface {v4, v8, v9}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v8

    if-eqz v8, :cond_11

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v8, "29@1264L15"

    invoke-static {v4, v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v8, v1, 0x1

    if-eqz v8, :cond_7

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v8

    if-eqz v8, :cond_6

    goto :goto_4

    .line 29
    :cond_6
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v8, v2, 0x2

    if-eqz v8, :cond_a

    and-int/lit8 v5, v5, -0x71

    goto/16 :goto_6

    .line 30
    :cond_7
    :goto_4
    and-int/lit8 v8, v2, 0x2

    if-eqz v8, :cond_a

    const/4 v8, 0x0

    .local v8, "$changed\\1":I
    move-object v9, v4

    .local v9, "$composer\\1":Landroidx/compose/runtime/Composer;
    const/16 v20, 0x0

    .local v20, "$i$f$hiltViewModel\\1\\30":I
    const v12, 0x70b323c8

    invoke-interface {v9, v12}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v12, "CC(hiltViewModel)P(1)*45@1969L7,50@2112L47,51@2171L54:HiltViewModel.kt#9mcars"

    invoke-static {v9, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 146
    sget-object v12, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->INSTANCE:Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;

    sget v13, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->$stable:I

    invoke-virtual {v12, v9, v13}, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->getCurrent(Landroidx/compose/runtime/Composer;I)Landroidx/lifecycle/ViewModelStoreOwner;

    move-result-object v13

    if-eqz v13, :cond_9

    .line 149
    .local v13, "viewModelStoreOwner\\1":Landroidx/lifecycle/ViewModelStoreOwner;
    const/4 v14, 0x0

    .line 151
    .local v14, "key\\1":Ljava/lang/String;
    and-int/lit8 v12, v8, 0xe

    invoke-static {v13, v9, v12}, Landroidx/hilt/navigation/compose/HiltViewModelKt;->createHiltViewModelFactory(Landroidx/lifecycle/ViewModelStoreOwner;Landroidx/compose/runtime/Composer;I)Landroidx/lifecycle/ViewModelProvider$Factory;

    move-result-object v15

    .local v15, "factory\\1":Landroidx/lifecycle/ViewModelProvider$Factory;
    and-int/lit8 v12, v8, 0xe

    and-int/lit8 v16, v8, 0x70

    or-int v12, v12, v16

    .line 152
    move/from16 v21, v12

    .local v21, "$changed\\3":I
    const/16 v22, 0x0

    .local v22, "$i$f$viewModel\\3\\152":I
    const v12, 0x671a9c9b

    invoke-interface {v9, v12}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v12, "CC(viewModel)P(3,2,1)*80@3834L7,90@4209L68:ViewModel.kt#3tja67"

    invoke-static {v9, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 153
    instance-of v12, v13, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;

    if-eqz v12, :cond_8

    .line 154
    move-object v12, v13

    check-cast v12, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;

    invoke-interface {v12}, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;->getDefaultViewModelCreationExtras()Landroidx/lifecycle/viewmodel/CreationExtras;

    move-result-object v12

    move-object/from16 v16, v12

    goto :goto_5

    .line 156
    :cond_8
    sget-object v12, Landroidx/lifecycle/viewmodel/CreationExtras$Empty;->INSTANCE:Landroidx/lifecycle/viewmodel/CreationExtras$Empty;

    check-cast v12, Landroidx/lifecycle/viewmodel/CreationExtras;

    move-object/from16 v16, v12

    :goto_5
    nop

    .local v16, "extras\\3":Landroidx/lifecycle/viewmodel/CreationExtras;
    const-class v12, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    .line 158
    shl-int/lit8 v7, v21, 0x3

    and-int/lit16 v7, v7, 0x380

    const v17, 0x9048

    or-int v18, v7, v17

    const/16 v19, 0x0

    move-object/from16 v17, v9

    .end local v9    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .local v17, "$composer\\1":Landroidx/compose/runtime/Composer;
    invoke-static/range {v12 .. v19}, Landroidx/lifecycle/viewmodel/compose/ViewModelKt;->viewModel(Ljava/lang/Class;Landroidx/lifecycle/ViewModelStoreOwner;Ljava/lang/String;Landroidx/lifecycle/ViewModelProvider$Factory;Landroidx/lifecycle/viewmodel/CreationExtras;Landroidx/compose/runtime/Composer;II)Landroidx/lifecycle/ViewModel;

    move-result-object v7

    invoke-interface/range {v17 .. v17}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .line 152
    .end local v16    # "extras\\3":Landroidx/lifecycle/viewmodel/CreationExtras;
    .end local v21    # "$changed\\3":I
    .end local v22    # "$i$f$viewModel\\3\\152":I
    invoke-interface/range {v17 .. v17}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .end local v8    # "$changed\\1":I
    .end local v13    # "viewModelStoreOwner\\1":Landroidx/lifecycle/ViewModelStoreOwner;
    .end local v14    # "key\\1":Ljava/lang/String;
    .end local v15    # "factory\\1":Landroidx/lifecycle/ViewModelProvider$Factory;
    .end local v17    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v20    # "$i$f$hiltViewModel\\1\\30":I
    move-object v6, v7

    check-cast v6, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    .end local p1    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v6, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    and-int/lit8 v5, v5, -0x71

    move-object/from16 v23, v6

    move v6, v5

    move-object/from16 v5, v23

    goto :goto_7

    .line 146
    .end local v6    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .restart local v8    # "$changed\\1":I
    .restart local v9    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .restart local v20    # "$i$f$hiltViewModel\\1\\30":I
    .restart local p1    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :cond_9
    const/4 v2, 0x0

    .line 147
    .local v2, "$i$a$-checkNotNull-HiltViewModelKt$hiltViewModel$1\\2\\146\\1":I
    nop

    .line 146
    .end local v2    # "$i$a$-checkNotNull-HiltViewModelKt$hiltViewModel$1\\2\\146\\1":I
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "No ViewModelStoreOwner was provided via LocalViewModelStoreOwner"

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 29
    .end local v8    # "$changed\\1":I
    .end local v9    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v20    # "$i$f$hiltViewModel\\1\\30":I
    :cond_a
    :goto_6
    move-object/from16 v23, v6

    move v6, v5

    move-object/from16 v5, v23

    .end local p1    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v5, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v6, "$dirty":I
    :goto_7
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v7

    if-eqz v7, :cond_b

    const/4 v7, -0x1

    const-string v8, "com.hardlineforge.lala.ui.screens.TimelineScreen (TimelineScreen.kt:29)"

    invoke-static {v3, v6, v7, v8}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 31
    :cond_b
    invoke-virtual {v5}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->getAllEntries()Lkotlinx/coroutines/flow/StateFlow;

    move-result-object v3

    const/4 v7, 0x0

    invoke-static {v3, v7, v4, v10, v11}, Landroidx/compose/runtime/SnapshotStateKt;->collectAsState(Lkotlinx/coroutines/flow/StateFlow;Lkotlin/coroutines/CoroutineContext;Landroidx/compose/runtime/Composer;II)Landroidx/compose/runtime/State;

    move-result-object v3

    .line 32
    .local v3, "entries$delegate":Landroidx/compose/runtime/State;
    const v8, -0x6ad28c81

    const-string v9, "CC(remember):TimelineScreen.kt#9igjgp"

    invoke-static {v4, v8, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v8, 0x0

    .local v8, "invalid\\4":Z
    move-object v9, v4

    .local v9, "$this$cache\\4":Landroidx/compose/runtime/Composer;
    const/4 v10, 0x0

    .line 159
    .local v10, "$i$f$cache\\4\\32":I
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v12

    .local v12, "it\\4":Ljava/lang/Object;
    const/4 v13, 0x0

    .line 160
    .local v13, "$i$a$-let-ComposerKt$cache$1\\5\\159\\4":I
    sget-object v14, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v14}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v14

    if-ne v12, v14, :cond_c

    .line 161
    const/4 v14, 0x0

    .line 32
    .local v14, "$i$a$-cache-TimelineScreenKt$TimelineScreen$selectedCategory$2\\6\\161\\0":I
    const/4 v15, 0x2

    invoke-static {v7, v7, v15, v7}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v7

    .line 161
    .end local v14    # "$i$a$-cache-TimelineScreenKt$TimelineScreen$selectedCategory$2\\6\\161\\0":I
    nop

    .line 162
    .local v7, "value\\5":Ljava/lang/Object;
    invoke-interface {v9, v7}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 163
    move-object v12, v7

    .end local v7    # "value\\5":Ljava/lang/Object;
    goto :goto_8

    .line 164
    :cond_c
    nop

    .line 159
    .end local v12    # "it\\4":Ljava/lang/Object;
    .end local v13    # "$i$a$-let-ComposerKt$cache$1\\5\\159\\4":I
    :goto_8
    nop

    .line 32
    .end local v8    # "invalid\\4":Z
    .end local v9    # "$this$cache\\4":Landroidx/compose/runtime/Composer;
    .end local v10    # "$i$f$cache\\4\\32":I
    move-object/from16 v19, v12

    check-cast v19, Landroidx/compose/runtime/MutableState;

    .local v19, "selectedCategory$delegate":Landroidx/compose/runtime/MutableState;
    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 34
    invoke-static/range {v19 .. v19}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt;->TimelineScreen$lambda$2(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_d

    invoke-static {v3}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt;->TimelineScreen$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v7

    move-object/from16 p1, v3

    goto :goto_a

    .line 35
    :cond_d
    invoke-static {v3}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt;->TimelineScreen$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v7

    check-cast v7, Ljava/lang/Iterable;

    .local v7, "$this$filter\\7":Ljava/lang/Iterable;
    const/4 v8, 0x0

    .line 165
    .local v8, "$i$f$filter\\7\\35":I
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    check-cast v9, Ljava/util/Collection;

    .local v9, "destination\\8":Ljava/util/Collection;
    move-object v10, v7

    .local v10, "$this$filterTo\\8":Ljava/lang/Iterable;
    const/4 v12, 0x0

    .line 166
    .local v12, "$i$f$filterTo\\8\\165":I
    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_9
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_f

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    .local v14, "element\\8":Ljava/lang/Object;
    move-object v15, v14

    check-cast v15, Lcom/hardlineforge/lala/data/LogEntry;

    .local v15, "it\\9":Lcom/hardlineforge/lala/data/LogEntry;
    const/16 v16, 0x0

    .line 35
    .local v16, "$i$a$-filter-TimelineScreenKt$TimelineScreen$filtered$1\\9\\166\\0":I
    invoke-virtual {v15}, Lcom/hardlineforge/lala/data/LogEntry;->getCategory()Ljava/lang/String;

    move-result-object v11

    move-object/from16 p1, v3

    .end local v3    # "entries$delegate":Landroidx/compose/runtime/State;
    .local p1, "entries$delegate":Landroidx/compose/runtime/State;
    invoke-static/range {v19 .. v19}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt;->TimelineScreen$lambda$2(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v11, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    .line 166
    .end local v15    # "it\\9":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v16    # "$i$a$-filter-TimelineScreenKt$TimelineScreen$filtered$1\\9\\166\\0":I
    if-eqz v3, :cond_e

    invoke-interface {v9, v14}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_e
    move-object/from16 v3, p1

    const/4 v11, 0x1

    goto :goto_9

    .line 167
    .end local v14    # "element\\8":Ljava/lang/Object;
    .end local p1    # "entries$delegate":Landroidx/compose/runtime/State;
    .restart local v3    # "entries$delegate":Landroidx/compose/runtime/State;
    :cond_f
    move-object/from16 p1, v3

    .end local v3    # "entries$delegate":Landroidx/compose/runtime/State;
    .end local v9    # "destination\\8":Ljava/util/Collection;
    .end local v10    # "$this$filterTo\\8":Ljava/lang/Iterable;
    .end local v12    # "$i$f$filterTo\\8\\165":I
    .restart local p1    # "entries$delegate":Landroidx/compose/runtime/State;
    move-object v3, v9

    check-cast v3, Ljava/util/List;

    .line 165
    move-object v7, v3

    .line 34
    .end local v7    # "$this$filter\\7":Ljava/lang/Iterable;
    .end local v8    # "$i$f$filter\\7\\35":I
    :goto_a
    move-object v3, v7

    .line 38
    .local v3, "filtered":Ljava/util/List;
    new-instance v7, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda8;

    invoke-direct {v7, v0}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda8;-><init>(Landroidx/navigation/NavHostController;)V

    const v8, -0x2140b852

    const/16 v9, 0x36

    const/4 v10, 0x1

    invoke-static {v8, v10, v7, v4, v9}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v7

    move-object v8, v7

    check-cast v8, Lkotlin/jvm/functions/Function2;

    .line 45
    new-instance v7, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda9;

    invoke-direct {v7, v3, v0, v5}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda9;-><init>(Ljava/util/List;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)V

    const v11, 0x7148ade6

    invoke-static {v11, v10, v7, v4, v9}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v7

    move-object v15, v7

    check-cast v15, Lkotlin/jvm/functions/Function3;

    .line 37
    move-object/from16 v17, v4

    .end local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v17, "$composer":Landroidx/compose/runtime/Composer;
    const/4 v4, 0x0

    move-object v7, v5

    .end local v5    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v7, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    const/4 v5, 0x0

    move v9, v6

    .end local v6    # "$dirty":I
    .local v9, "$dirty":I
    const/4 v6, 0x0

    move-object v10, v7

    .end local v7    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v10, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    const/4 v7, 0x0

    move v11, v9

    .end local v9    # "$dirty":I
    .local v11, "$dirty":I
    const/4 v9, 0x0

    move-object v13, v10

    move v12, v11

    .end local v10    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .end local v11    # "$dirty":I
    .local v12, "$dirty":I
    .local v13, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    const-wide/16 v10, 0x0

    move v14, v12

    move-object/from16 v16, v13

    .end local v12    # "$dirty":I
    .end local v13    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v14, "$dirty":I
    .local v16, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    const-wide/16 v12, 0x0

    move/from16 v18, v14

    .end local v14    # "$dirty":I
    .local v18, "$dirty":I
    const/4 v14, 0x0

    move-object/from16 v20, v16

    move-object/from16 v16, v17

    .end local v17    # "$composer":Landroidx/compose/runtime/Composer;
    .local v16, "$composer":Landroidx/compose/runtime/Composer;
    .local v20, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    const v17, 0x30006000

    move/from16 v21, v18

    .end local v18    # "$dirty":I
    .local v21, "$dirty":I
    const/16 v18, 0x1ef

    invoke-static/range {v4 .. v18}, Landroidx/compose/material3/ScaffoldKt;->Scaffold-TvnljyQ(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;IJJLandroidx/compose/foundation/layout/WindowInsets;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    move-object/from16 v17, v16

    .end local v16    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v17    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v4

    if-eqz v4, :cond_10

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 71
    .end local v3    # "filtered":Ljava/util/List;
    .end local v19    # "selectedCategory$delegate":Landroidx/compose/runtime/MutableState;
    .end local p1    # "entries$delegate":Landroidx/compose/runtime/State;
    :cond_10
    move-object/from16 v6, v20

    move/from16 v5, v21

    goto :goto_b

    .line 29
    .end local v17    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v20    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .end local v21    # "$dirty":I
    .restart local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v5, "$dirty":I
    .local p1, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :cond_11
    move-object/from16 v17, v4

    .end local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v17    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface/range {v17 .. v17}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 71
    .end local p1    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v6, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :goto_b
    invoke-interface/range {v17 .. v17}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v3

    if-eqz v3, :cond_12

    new-instance v4, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda10;

    invoke-direct {v4, v0, v6, v1, v2}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda10;-><init>(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;II)V

    invoke-interface {v3, v4}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_12
    return-void
.end method

.method private static final TimelineScreen$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 4
    .param p0, "$entries$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "+",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;>;)",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;"
        }
    .end annotation

    .line 31
    const/4 v0, 0x0

    .local v0, "this_\\1":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property\\1":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue\\1":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 174
    .local v3, "$i$f$getValue\\1\\31":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "this_\\1":Ljava/lang/Object;
    .end local v1    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue\\1":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue\\1\\31":I
    check-cast v0, Ljava/util/List;

    .line 31
    return-object v0
.end method

.method static final TimelineScreen$lambda$15(Ljava/util/List;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 18
    .param p0, "$filtered"    # Ljava/util/List;
    .param p1, "$navController"    # Landroidx/navigation/NavHostController;
    .param p2, "$vm"    # Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .param p3, "padding"    # Landroidx/compose/foundation/layout/PaddingValues;
    .param p4, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p5, "$changed"    # I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v14, p4

    const-string v4, "padding"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "C49@2012L789,45@1827L974:TimelineScreen.kt#4cebsy"

    invoke-static {v14, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v4, p5

    .local v4, "$dirty":I
    and-int/lit8 v5, p5, 0x6

    if-nez v5, :cond_1

    invoke-interface {v14, v3}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int/2addr v4, v5

    :cond_1
    and-int/lit8 v5, v4, 0x13

    const/16 v6, 0x12

    if-eq v5, v6, :cond_2

    const/4 v5, 0x1

    goto :goto_1

    :cond_2
    const/4 v5, 0x0

    :goto_1
    and-int/lit8 v6, v4, 0x1

    invoke-interface {v14, v5, v6}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v5, -0x1

    const-string v6, "com.hardlineforge.lala.ui.screens.TimelineScreen.<anonymous> (TimelineScreen.kt:45)"

    const v7, 0x7148ade6

    invoke-static {v7, v4, v5, v6}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 47
    :cond_3
    sget-object v5, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v5, Landroidx/compose/ui/Modifier;

    invoke-static {v5, v3}, Landroidx/compose/foundation/layout/PaddingKt;->padding(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/PaddingValues;)Landroidx/compose/ui/Modifier;

    move-result-object v5

    .line 48
    const/16 v6, 0x10

    .local v6, "$this$dp\\1":I
    const/4 v7, 0x0

    .line 214
    .local v7, "$i$f$getDp\\1\\48":I
    int-to-float v8, v6

    invoke-static {v8}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v6

    .line 48
    .end local v6    # "$this$dp\\1":I
    .end local v7    # "$i$f$getDp\\1\\48":I
    invoke-static {v6}, Landroidx/compose/foundation/layout/PaddingKt;->PaddingValues-0680j_4(F)Landroidx/compose/foundation/layout/PaddingValues;

    move-result-object v6

    .line 49
    sget-object v7, Landroidx/compose/foundation/layout/Arrangement;->INSTANCE:Landroidx/compose/foundation/layout/Arrangement;

    const/16 v8, 0xc

    .local v8, "$this$dp\\2":I
    const/4 v9, 0x0

    .line 215
    .local v9, "$i$f$getDp\\2\\49":I
    int-to-float v10, v8

    invoke-static {v10}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v8

    .line 49
    .end local v8    # "$this$dp\\2":I
    .end local v9    # "$i$f$getDp\\2\\49":I
    invoke-virtual {v7, v8}, Landroidx/compose/foundation/layout/Arrangement;->spacedBy-0680j_4(F)Landroidx/compose/foundation/layout/Arrangement$HorizontalOrVertical;

    move-result-object v7

    move-object v8, v7

    check-cast v8, Landroidx/compose/foundation/layout/Arrangement$Vertical;

    .line 50
    const v7, 0x41d4e93b

    const-string v9, "CC(remember):TimelineScreen.kt#9igjgp"

    invoke-static {v14, v7, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v14, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v7

    invoke-interface {v14, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v9

    or-int/2addr v7, v9

    invoke-interface {v14, v2}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v9

    or-int/2addr v7, v9

    .local v7, "invalid\\3":Z
    move-object/from16 v9, p4

    .local v9, "$this$cache\\3":Landroidx/compose/runtime/Composer;
    const/4 v10, 0x0

    .line 216
    .local v10, "$i$f$cache\\3\\50":I
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v11

    .local v11, "it\\3":Ljava/lang/Object;
    const/4 v12, 0x0

    .line 217
    .local v12, "$i$a$-let-ComposerKt$cache$1\\4\\216\\3":I
    if-nez v7, :cond_5

    sget-object v13, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v13}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v13

    if-ne v11, v13, :cond_4

    goto :goto_2

    .line 221
    :cond_4
    goto :goto_3

    .line 218
    :cond_5
    :goto_2
    const/4 v13, 0x0

    .line 50
    .local v13, "$i$a$-cache-TimelineScreenKt$TimelineScreen$2$1\\5\\218\\0":I
    new-instance v15, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda4;

    invoke-direct {v15, v0, v1, v2}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda4;-><init>(Ljava/util/List;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)V

    .line 218
    .end local v13    # "$i$a$-cache-TimelineScreenKt$TimelineScreen$2$1\\5\\218\\0":I
    nop

    .line 219
    .local v15, "value\\4":Ljava/lang/Object;
    invoke-interface {v9, v15}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 220
    move-object v11, v15

    .line 216
    .end local v11    # "it\\3":Ljava/lang/Object;
    .end local v12    # "$i$a$-let-ComposerKt$cache$1\\4\\216\\3":I
    .end local v15    # "value\\4":Ljava/lang/Object;
    :goto_3
    nop

    .line 50
    .end local v7    # "invalid\\3":Z
    .end local v9    # "$this$cache\\3":Landroidx/compose/runtime/Composer;
    .end local v10    # "$i$f$cache\\3\\50":I
    move-object v13, v11

    check-cast v13, Lkotlin/jvm/functions/Function1;

    invoke-static {v14}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 46
    move v7, v4

    move-object v4, v5

    .end local v4    # "$dirty":I
    .local v7, "$dirty":I
    const/4 v5, 0x0

    move v9, v7

    .end local v7    # "$dirty":I
    .local v9, "$dirty":I
    const/4 v7, 0x0

    move v10, v9

    .end local v9    # "$dirty":I
    .local v10, "$dirty":I
    const/4 v9, 0x0

    move v11, v10

    .end local v10    # "$dirty":I
    .local v11, "$dirty":I
    const/4 v10, 0x0

    move v12, v11

    .end local v11    # "$dirty":I
    .local v12, "$dirty":I
    const/4 v11, 0x0

    move v15, v12

    .end local v12    # "$dirty":I
    .local v15, "$dirty":I
    const/4 v12, 0x0

    move/from16 v16, v15

    .end local v15    # "$dirty":I
    .local v16, "$dirty":I
    const/16 v15, 0x6180

    move/from16 v17, v16

    .end local v16    # "$dirty":I
    .local v17, "$dirty":I
    const/16 v16, 0x1ea

    invoke-static/range {v4 .. v16}, Landroidx/compose/foundation/lazy/LazyDslKt;->LazyColumn(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/lazy/LazyListState;Landroidx/compose/foundation/layout/PaddingValues;ZLandroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/ui/Alignment$Horizontal;Landroidx/compose/foundation/gestures/FlingBehavior;ZLandroidx/compose/foundation/OverscrollEffect;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_4

    .line 45
    .end local v17    # "$dirty":I
    .restart local v4    # "$dirty":I
    :cond_6
    move/from16 v17, v4

    .end local v4    # "$dirty":I
    .restart local v17    # "$dirty":I
    invoke-interface/range {p4 .. p4}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 70
    :cond_7
    :goto_4
    sget-object v4, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v4
.end method

.method static final TimelineScreen$lambda$15$lambda$14$lambda$13(Ljava/util/List;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/foundation/lazy/LazyListScope;)Lkotlin/Unit;
    .locals 20
    .param p0, "$filtered"    # Ljava/util/List;
    .param p1, "$navController"    # Landroidx/navigation/NavHostController;
    .param p2, "$vm"    # Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .param p3, "$this$LazyColumn"    # Landroidx/compose/foundation/lazy/LazyListScope;

    const-string v0, "$this$LazyColumn"

    move-object/from16 v1, p3

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    move-object/from16 v0, p0

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$groupBy\\1":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 185
    .local v2, "$i$f$groupBy\\1\\52":I
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v3, Ljava/util/Map;

    .local v3, "destination\\2":Ljava/util/Map;
    move-object v4, v0

    .local v4, "$this$groupByTo\\2":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 186
    .local v5, "$i$f$groupByTo\\2\\185":I
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 187
    .local v7, "element\\2":Ljava/lang/Object;
    move-object v8, v7

    check-cast v8, Lcom/hardlineforge/lala/data/LogEntry;

    .local v8, "it\\5":Lcom/hardlineforge/lala/data/LogEntry;
    const/4 v9, 0x0

    .line 53
    .local v9, "$i$a$-groupBy-TimelineScreenKt$TimelineScreen$2$1$1$grouped$1\\5\\187\\0":I
    invoke-virtual {v8}, Lcom/hardlineforge/lala/data/LogEntry;->getTimestamp()Ljava/time/Instant;

    move-result-object v10

    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/time/Instant;->atZone(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object v10

    invoke-virtual {v10}, Ljava/time/ZonedDateTime;->toLocalDate()Ljava/time/LocalDate;

    move-result-object v8

    .line 187
    .end local v8    # "it\\5":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v9    # "$i$a$-groupBy-TimelineScreenKt$TimelineScreen$2$1$1$grouped$1\\5\\187\\0":I
    nop

    .line 188
    .local v8, "key\\2":Ljava/lang/Object;
    move-object v9, v8

    .local v9, "key\\3":Ljava/lang/Object;
    move-object v10, v3

    .local v10, "$this$getOrPut\\3":Ljava/util/Map;
    const/4 v11, 0x0

    .line 189
    .local v11, "$i$f$getOrPut\\3\\188":I
    invoke-interface {v10, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 190
    .local v12, "value\\3":Ljava/lang/Object;
    if-nez v12, :cond_0

    .line 191
    const/4 v13, 0x0

    .line 188
    .local v13, "$i$a$-getOrPut-CollectionsKt___CollectionsKt$groupByTo$list$1\\4\\191\\2":I
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    check-cast v14, Ljava/util/List;

    .line 191
    .end local v13    # "$i$a$-getOrPut-CollectionsKt___CollectionsKt$groupByTo$list$1\\4\\191\\2":I
    nop

    .line 192
    .local v14, "answer\\3":Ljava/lang/Object;
    invoke-interface {v10, v9, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    nop

    .end local v14    # "answer\\3":Ljava/lang/Object;
    goto :goto_1

    .line 195
    :cond_0
    move-object v14, v12

    .line 190
    :goto_1
    nop

    .line 188
    .end local v9    # "key\\3":Ljava/lang/Object;
    .end local v10    # "$this$getOrPut\\3":Ljava/util/Map;
    .end local v11    # "$i$f$getOrPut\\3\\188":I
    .end local v12    # "value\\3":Ljava/lang/Object;
    move-object v9, v14

    check-cast v9, Ljava/util/List;

    .line 196
    .local v9, "list\\2":Ljava/util/List;
    invoke-interface {v9, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 198
    .end local v7    # "element\\2":Ljava/lang/Object;
    .end local v8    # "key\\2":Ljava/lang/Object;
    .end local v9    # "list\\2":Ljava/util/List;
    :cond_1
    nop

    .line 185
    .end local v3    # "destination\\2":Ljava/util/Map;
    .end local v4    # "$this$groupByTo\\2":Ljava/lang/Iterable;
    .end local v5    # "$i$f$groupByTo\\2\\185":I
    nop

    .line 52
    .end local v0    # "$this$groupBy\\1":Ljava/lang/Iterable;
    .end local v2    # "$i$f$groupBy\\1\\52":I
    move-object v0, v3

    .line 56
    .local v0, "grouped":Ljava/util/Map;
    move-object v7, v0

    .local v7, "$this$forEach\\6":Ljava/util/Map;
    const/4 v8, 0x0

    .line 199
    .local v8, "$i$f$forEach\\6\\56":I
    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Ljava/util/Map$Entry;

    .local v10, "element\\6":Ljava/util/Map$Entry;
    const/4 v11, 0x0

    .local v11, "$i$a$-forEach-TimelineScreenKt$TimelineScreen$2$1$1$1\\7\\199\\0":I
    invoke-interface {v10}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Ljava/time/LocalDate;

    .local v12, "date\\7":Ljava/time/LocalDate;
    invoke-interface {v10}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Ljava/util/List;

    .line 57
    .local v13, "dayEntries\\7":Ljava/util/List;
    new-instance v2, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda1;

    invoke-direct {v2, v12}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda1;-><init>(Ljava/time/LocalDate;)V

    const v3, -0x564554aa

    const/4 v14, 0x1

    invoke-static {v3, v14, v2}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Lkotlin/jvm/functions/Function3;

    const/4 v5, 0x3

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Landroidx/compose/foundation/lazy/LazyListScope;->item$default(Landroidx/compose/foundation/lazy/LazyListScope;Ljava/lang/Object;Ljava/lang/Object;Lkotlin/jvm/functions/Function3;ILjava/lang/Object;)V

    .line 65
    new-instance v1, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda2;

    invoke-direct {v1}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda2;-><init>()V

    .local v1, "key\\8":Lkotlin/jvm/functions/Function1;
    move-object v2, v13

    .local v2, "items\\8":Ljava/util/List;
    move-object/from16 v3, p3

    .line 200
    .local v3, "$this$items_u24default\\8":Landroidx/compose/foundation/lazy/LazyListScope;
    nop

    .line 203
    sget-object v4, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$$inlined$items$default$1;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$$inlined$items$default$1;

    check-cast v4, Lkotlin/jvm/functions/Function1;

    .line 200
    .local v4, "contentType\\8":Lkotlin/jvm/functions/Function1;
    const/4 v5, 0x0

    .line 206
    .local v5, "$i$f$items\\8\\65":I
    nop

    .line 207
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    .line 208
    nop

    .line 206
    new-instance v15, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$$inlined$items$default$2;

    invoke-direct {v15, v1, v2}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$$inlined$items$default$2;-><init>(Lkotlin/jvm/functions/Function1;Ljava/util/List;)V

    check-cast v15, Lkotlin/jvm/functions/Function1;

    new-instance v14, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$$inlined$items$default$3;

    invoke-direct {v14, v4, v2}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$$inlined$items$default$3;-><init>(Lkotlin/jvm/functions/Function1;Ljava/util/List;)V

    check-cast v14, Lkotlin/jvm/functions/Function1;

    .line 210
    move-object/from16 v16, v0

    .end local v0    # "grouped":Ljava/util/Map;
    .local v16, "grouped":Ljava/util/Map;
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$$inlined$items$default$4;

    move-object/from16 v17, v1

    move-object/from16 v18, v4

    move-object/from16 v1, p1

    move-object/from16 v4, p2

    .end local v1    # "key\\8":Lkotlin/jvm/functions/Function1;
    .end local v4    # "contentType\\8":Lkotlin/jvm/functions/Function1;
    .local v17, "key\\8":Lkotlin/jvm/functions/Function1;
    .local v18, "contentType\\8":Lkotlin/jvm/functions/Function1;
    invoke-direct {v0, v2, v1, v4}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$$inlined$items$default$4;-><init>(Ljava/util/List;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)V

    const v1, -0x25b7f321

    move-object/from16 v19, v2

    const/4 v2, 0x1

    .end local v2    # "items\\8":Ljava/util/List;
    .local v19, "items\\8":Ljava/util/List;
    invoke-static {v1, v2, v0}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    check-cast v0, Lkotlin/jvm/functions/Function4;

    .line 206
    invoke-interface {v3, v6, v15, v14, v0}, Landroidx/compose/foundation/lazy/LazyListScope;->items(ILkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;)V

    .line 212
    nop

    .line 68
    .end local v3    # "$this$items_u24default\\8":Landroidx/compose/foundation/lazy/LazyListScope;
    .end local v5    # "$i$f$items\\8\\65":I
    .end local v17    # "key\\8":Lkotlin/jvm/functions/Function1;
    .end local v18    # "contentType\\8":Lkotlin/jvm/functions/Function1;
    .end local v19    # "items\\8":Ljava/util/List;
    nop

    .line 199
    .end local v11    # "$i$a$-forEach-TimelineScreenKt$TimelineScreen$2$1$1$1\\7\\199\\0":I
    .end local v12    # "date\\7":Ljava/time/LocalDate;
    .end local v13    # "dayEntries\\7":Ljava/util/List;
    move-object/from16 v1, p3

    move-object/from16 v0, v16

    .end local v10    # "element\\6":Ljava/util/Map$Entry;
    goto :goto_2

    .line 213
    .end local v16    # "grouped":Ljava/util/Map;
    .restart local v0    # "grouped":Ljava/util/Map;
    :cond_2
    move-object/from16 v16, v0

    .line 69
    .end local v0    # "grouped":Ljava/util/Map;
    .end local v7    # "$this$forEach\\6":Ljava/util/Map;
    .end local v8    # "$i$f$forEach\\6\\56":I
    .restart local v16    # "grouped":Ljava/util/Map;
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$lambda$10(Lcom/hardlineforge/lala/data/LogEntry;)Ljava/lang/Object;
    .locals 1
    .param p0, "it"    # Lcom/hardlineforge/lala/data/LogEntry;

    const-string v0, "it"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    invoke-virtual {p0}, Lcom/hardlineforge/lala/data/LogEntry;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static final TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$lambda$9(Ljava/time/LocalDate;Landroidx/compose/foundation/lazy/LazyItemScope;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 25
    .param p0, "$date"    # Ljava/time/LocalDate;
    .param p1, "$this$item"    # Landroidx/compose/foundation/lazy/LazyItemScope;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    move-object/from16 v0, p2

    move/from16 v1, p3

    const-string v2, "$this$item"

    move-object/from16 v3, p1

    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "C59@2430L10,60@2499L11,57@2289L331:TimelineScreen.kt#4cebsy"

    invoke-static {v0, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v2, v1, 0x11

    const/16 v4, 0x10

    if-eq v2, v4, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    and-int/lit8 v4, v1, 0x1

    invoke-interface {v0, v2, v4}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    const-string v4, "com.hardlineforge.lala.ui.screens.TimelineScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (TimelineScreen.kt:57)"

    const v5, -0x564554aa

    invoke-static {v5, v1, v2, v4}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 59
    :cond_1
    const-string v2, "MMMM d, yyyy"

    invoke-static {v2}, Ljava/time/format/DateTimeFormatter;->ofPattern(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    move-result-object v2

    move-object/from16 v4, p0

    invoke-virtual {v4, v2}, Ljava/time/LocalDate;->format(Ljava/time/format/DateTimeFormatter;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "format(...)"

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    sget-object v5, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v6, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v5, v0, v6}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/compose/material3/Typography;->getTitleLarge()Landroidx/compose/ui/text/TextStyle;

    move-result-object v20

    .line 61
    sget-object v5, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v6, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v5, v0, v6}, Landroidx/compose/material3/MaterialTheme;->getColorScheme(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/ColorScheme;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/compose/material3/ColorScheme;->getPrimary-0d7_KjU()J

    move-result-wide v5

    .line 62
    sget-object v7, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    move-object v8, v7

    check-cast v8, Landroidx/compose/ui/Modifier;

    const/16 v7, 0x8

    .local v7, "$this$dp\\1":I
    const/4 v9, 0x0

    .line 184
    .local v9, "$i$f$getDp\\1\\62":I
    int-to-float v10, v7

    invoke-static {v10}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v10

    .line 62
    .end local v7    # "$this$dp\\1":I
    .end local v9    # "$i$f$getDp\\1\\62":I
    const/4 v7, 0x4

    .local v7, "$this$dp\\2":I
    const/4 v9, 0x0

    .line 184
    .local v9, "$i$f$getDp\\2\\62":I
    int-to-float v11, v7

    invoke-static {v11}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v12

    .line 62
    .end local v7    # "$this$dp\\2":I
    .end local v9    # "$i$f$getDp\\2\\62":I
    const/4 v13, 0x5

    const/4 v14, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-static/range {v8 .. v14}, Landroidx/compose/foundation/layout/PaddingKt;->padding-qDBjuR0$default(Landroidx/compose/ui/Modifier;FFFFILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v7

    .line 59
    nop

    .line 62
    nop

    .line 61
    nop

    .line 60
    nop

    .line 58
    move-object v0, v2

    move-wide v2, v5

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    move-object v1, v7

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-wide/16 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const-wide/16 v13, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v22, 0x30

    const/16 v23, 0x0

    const v24, 0xfff8

    move-object/from16 v21, p2

    invoke-static/range {v0 .. v24}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    .line 57
    :cond_2
    invoke-interface/range {p2 .. p2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 64
    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final TimelineScreen$lambda$16(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 1

    or-int/lit8 v0, p2, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v0

    invoke-static {p0, p1, p4, v0, p3}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt;->TimelineScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final TimelineScreen$lambda$2(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;
    .locals 4
    .param p0, "$selectedCategory$delegate"    # Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 32
    move-object v0, p0

    check-cast v0, Landroidx/compose/runtime/State;

    .local v0, "$this$getValue\\1":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "this_\\1":Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "property\\1":Lkotlin/reflect/KProperty;
    const/4 v3, 0x0

    .line 175
    .local v3, "$i$f$getValue\\1\\32":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "$this$getValue\\1":Landroidx/compose/runtime/State;
    .end local v1    # "this_\\1":Ljava/lang/Object;
    .end local v2    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v3    # "$i$f$getValue\\1\\32":I
    check-cast v0, Ljava/lang/String;

    .line 32
    return-object v0
.end method

.method private static final TimelineScreen$lambda$3(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V
    .locals 5
    .param p0, "$selectedCategory$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "<set-?>"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 32
    const/4 v0, 0x0

    .local v0, "this_\\1":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property\\1":Lkotlin/reflect/KProperty;
    move-object v2, p1

    .local v2, "value\\1":Ljava/lang/Object;
    move-object v3, p0

    .local v3, "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    const/4 v4, 0x0

    .line 176
    .local v4, "$i$f$setValue\\1\\32":I
    invoke-interface {v3, v2}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 177
    nop

    .line 32
    .end local v0    # "this_\\1":Ljava/lang/Object;
    .end local v1    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v2    # "value\\1":Ljava/lang/Object;
    .end local v3    # "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    .end local v4    # "$i$f$setValue\\1\\32":I
    return-void
.end method

.method static final TimelineScreen$lambda$7(Landroidx/navigation/NavHostController;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 16
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    move-object/from16 v0, p0

    move-object/from16 v13, p1

    move/from16 v1, p2

    const-string v2, "C39@1638L39,38@1582L207:TimelineScreen.kt#4cebsy"

    invoke-static {v13, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v2, v1, 0x3

    const/4 v3, 0x2

    if-eq v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    and-int/lit8 v3, v1, 0x1

    invoke-interface {v13, v2, v3}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    const-string v3, "com.hardlineforge.lala.ui.screens.TimelineScreen.<anonymous> (TimelineScreen.kt:38)"

    const v4, -0x2140b852

    invoke-static {v4, v1, v2, v3}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    :cond_1
    sget-object v2, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$TimelineScreenKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$TimelineScreenKt;

    invoke-virtual {v2}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$TimelineScreenKt;->getLambda$1905197210$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v2

    sget-object v3, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$TimelineScreenKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$TimelineScreenKt;

    invoke-virtual {v3}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$TimelineScreenKt;->getLambda$-279078727$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v3

    .line 40
    const v4, 0x2c0c1d15

    const-string v5, "CC(remember):TimelineScreen.kt#9igjgp"

    invoke-static {v13, v4, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v13, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v4

    .local v4, "invalid\\1":Z
    move-object/from16 v5, p1

    .local v5, "$this$cache\\1":Landroidx/compose/runtime/Composer;
    const/4 v6, 0x0

    .line 178
    .local v6, "$i$f$cache\\1\\40":I
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v7

    .local v7, "it\\1":Ljava/lang/Object;
    const/4 v8, 0x0

    .line 179
    .local v8, "$i$a$-let-ComposerKt$cache$1\\2\\178\\1":I
    if-nez v4, :cond_3

    sget-object v9, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v9}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v9

    if-ne v7, v9, :cond_2

    goto :goto_1

    .line 183
    :cond_2
    goto :goto_2

    .line 180
    :cond_3
    :goto_1
    const/4 v9, 0x0

    .line 40
    .local v9, "$i$a$-cache-TimelineScreenKt$TimelineScreen$1$1\\3\\180\\0":I
    new-instance v10, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda0;

    invoke-direct {v10, v0}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda0;-><init>(Landroidx/navigation/NavHostController;)V

    .line 180
    .end local v9    # "$i$a$-cache-TimelineScreenKt$TimelineScreen$1$1\\3\\180\\0":I
    nop

    .line 181
    .local v10, "value\\2":Ljava/lang/Object;
    invoke-interface {v5, v10}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 182
    move-object v7, v10

    .line 178
    .end local v7    # "it\\1":Ljava/lang/Object;
    .end local v8    # "$i$a$-let-ComposerKt$cache$1\\2\\178\\1":I
    .end local v10    # "value\\2":Ljava/lang/Object;
    :goto_2
    nop

    .line 40
    .end local v4    # "invalid\\1":Z
    .end local v5    # "$this$cache\\1":Landroidx/compose/runtime/Composer;
    .end local v6    # "$i$f$cache\\1\\40":I
    check-cast v7, Lkotlin/jvm/functions/Function0;

    invoke-static {v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 39
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, v2

    move-object v2, v3

    move-object v3, v7

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v14, 0x36

    const/16 v15, 0x3f8

    invoke-static/range {v1 .. v15}, Landroidx/compose/material3/FloatingActionButtonKt;->ExtendedFloatingActionButton-ElI5-7k(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/graphics/Shape;JJLandroidx/compose/material3/FloatingActionButtonElevation;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_3

    .line 38
    :cond_4
    invoke-interface/range {p1 .. p1}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 44
    :cond_5
    :goto_3
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method static final TimelineScreen$lambda$7$lambda$6$lambda$5(Landroidx/navigation/NavHostController;)Lkotlin/Unit;
    .locals 6
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;

    .line 40
    move-object v0, p0

    check-cast v0, Landroidx/navigation/NavController;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const-string v1, "new_entry"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Landroidx/navigation/NavController;->navigate$default(Landroidx/navigation/NavController;Ljava/lang/String;Landroidx/navigation/NavOptions;Landroidx/navigation/Navigator$Extras;ILjava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public static final synthetic access$TimelineCard(Lcom/hardlineforge/lala/data/LogEntry;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;I)V
    .locals 0
    .param p0, "entry"    # Lcom/hardlineforge/lala/data/LogEntry;
    .param p1, "navController"    # Landroidx/navigation/NavHostController;
    .param p2, "vm"    # Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt;->TimelineCard(Lcom/hardlineforge/lala/data/LogEntry;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;I)V

    return-void
.end method
