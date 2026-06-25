.class public final Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt;
.super Ljava/lang/Object;
.source "SettingsScreen.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSettingsScreen.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SettingsScreen.kt\ncom/hardlineforge/lala/ui/screens/SettingsScreenKt\n+ 2 HiltViewModel.kt\nandroidx/hilt/navigation/compose/HiltViewModelKt\n+ 3 ViewModel.kt\nandroidx/lifecycle/viewmodel/compose/ViewModelKt\n+ 4 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 5 Dp.kt\nandroidx/compose/ui/unit/DpKt\n+ 6 Column.kt\nandroidx/compose/foundation/layout/ColumnKt\n+ 7 Layout.kt\nandroidx/compose/ui/layout/LayoutKt\n+ 8 Composables.kt\nandroidx/compose/runtime/ComposablesKt\n+ 9 Composer.kt\nandroidx/compose/runtime/Updater\n+ 10 Row.kt\nandroidx/compose/foundation/layout/RowKt\n+ 11 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 12 SnapshotState.kt\nandroidx/compose/runtime/SnapshotStateKt__SnapshotStateKt\n+ 13 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,75:1\n46#2,7:76\n86#3,6:83\n1247#4,6:89\n1247#4,6:95\n1247#4,6:101\n1247#4,6:177\n1247#4,6:187\n1247#4,6:193\n1247#4,6:233\n1247#4,6:259\n1247#4,6:267\n113#5:107\n87#6:108\n85#6,8:109\n94#6:247\n79#7,6:117\n86#7,3:132\n89#7,2:141\n79#7,6:150\n86#7,3:165\n89#7,2:174\n93#7:185\n79#7,6:206\n86#7,3:221\n89#7,2:230\n93#7:241\n93#7:246\n347#8,9:123\n356#8:143\n347#8,9:156\n356#8:176\n357#8,2:183\n347#8,9:212\n356#8:232\n357#8,2:239\n357#8,2:244\n4206#9,6:135\n4206#9,6:168\n4206#9,6:224\n99#10,6:144\n106#10:186\n99#10,6:200\n106#10:242\n1869#11:199\n1870#11:243\n1869#11:258\n1870#11:265\n1869#11:266\n1870#11:273\n85#12:248\n113#12,2:249\n85#12:251\n113#12,2:252\n85#12:254\n113#12,2:255\n85#12:274\n1#13:257\n*S KotlinDebug\n*F\n+ 1 SettingsScreen.kt\ncom/hardlineforge/lala/ui/screens/SettingsScreenKt\n*L\n13#1:76,7\n13#1:83,6\n14#1:89,6\n15#1:95,6\n16#1:101,6\n25#1:177,6\n54#1:187,6\n57#1:193,6\n69#1:233,6\n33#1:259,6\n44#1:267,6\n18#1:107\n18#1:108\n18#1:109,8\n18#1:247\n18#1:117,6\n18#1:132,3\n18#1:141,2\n23#1:150,6\n23#1:165,3\n23#1:174,2\n23#1:185\n67#1:206,6\n67#1:221,3\n67#1:230,2\n67#1:241\n18#1:246\n18#1:123,9\n18#1:143\n23#1:156,9\n23#1:176\n23#1:183,2\n67#1:212,9\n67#1:232\n67#1:239,2\n18#1:244,2\n18#1:135,6\n23#1:168,6\n67#1:224,6\n23#1:144,6\n23#1:186\n67#1:200,6\n67#1:242\n66#1:199\n66#1:243\n30#1:258\n30#1:265\n41#1:266\n41#1:273\n14#1:248\n14#1:249,2\n15#1:251\n15#1:252,2\n16#1:254\n16#1:255,2\n65#1:274\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\u001a\u0017\u0010\u0000\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0010\u0004\u00a8\u0006\u0005\u00b2\u0006\n\u0010\u0006\u001a\u00020\u0007X\u008a\u008e\u0002\u00b2\u0006\n\u0010\u0008\u001a\u00020\tX\u008a\u008e\u0002\u00b2\u0006\n\u0010\n\u001a\u00020\tX\u008a\u008e\u0002\u00b2\u0006\u0010\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000cX\u008a\u0084\u0002"
    }
    d2 = {
        "SettingsScreen",
        "",
        "vm",
        "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
        "(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V",
        "app_debug",
        "darkMode",
        "",
        "fontSize",
        "",
        "accentColor",
        "cats",
        "",
        "Lcom/hardlineforge/lala/data/CustomCategory;"
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
.method public static final SettingsScreen(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
    .locals 95
    .param p0, "vm"    # Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    .line 13
    move/from16 v1, p3

    const v2, 0x1d0499ba

    move-object/from16 v3, p1

    invoke-interface {v3, v2}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v3

    .end local p1    # "$composer":Landroidx/compose/runtime/Composer;
    .local v3, "$composer":Landroidx/compose/runtime/Composer;
    const-string v4, "C(SettingsScreen)13@467L34,14@522L38,15@617L35,17@689L2566:SettingsScreen.kt#4cebsy"

    invoke-static {v3, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v4, p2

    .local v4, "$dirty":I
    and-int/lit8 v5, p2, 0x6

    const/4 v6, 0x2

    if-nez v5, :cond_2

    and-int/lit8 v5, v1, 0x1

    if-nez v5, :cond_0

    move-object/from16 v5, p0

    invoke-interface {v3, v5}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/4 v7, 0x4

    goto :goto_0

    :cond_0
    move-object/from16 v5, p0

    :cond_1
    move v7, v6

    :goto_0
    or-int/2addr v4, v7

    goto :goto_1

    :cond_2
    move-object/from16 v5, p0

    :goto_1
    and-int/lit8 v7, v4, 0x3

    if-eq v7, v6, :cond_3

    const/4 v7, 0x1

    goto :goto_2

    :cond_3
    const/4 v7, 0x0

    :goto_2
    and-int/lit8 v10, v4, 0x1

    invoke-interface {v3, v7, v10}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v7

    if-eqz v7, :cond_21

    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v7, "12@428L15"

    invoke-static {v3, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v7, p2, 0x1

    if-eqz v7, :cond_6

    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v7

    if-eqz v7, :cond_4

    goto :goto_3

    .line 12
    :cond_4
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v7, v1, 0x1

    if-eqz v7, :cond_5

    and-int/lit8 v4, v4, -0xf

    :cond_5
    const/16 p1, 0x0

    goto/16 :goto_5

    .line 13
    :cond_6
    :goto_3
    and-int/lit8 v7, v1, 0x1

    if-eqz v7, :cond_9

    const/4 v7, 0x0

    .local v7, "$changed\\1":I
    move-object v15, v3

    .local v15, "$composer\\1":Landroidx/compose/runtime/Composer;
    const/16 v18, 0x0

    .local v18, "$i$f$hiltViewModel\\1\\13":I
    const v10, 0x70b323c8

    invoke-interface {v15, v10}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v10, "CC(hiltViewModel)P(1)*45@1969L7,50@2112L47,51@2171L54:HiltViewModel.kt#9mcars"

    invoke-static {v15, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 76
    sget-object v10, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->INSTANCE:Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;

    sget v11, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->$stable:I

    invoke-virtual {v10, v15, v11}, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->getCurrent(Landroidx/compose/runtime/Composer;I)Landroidx/lifecycle/ViewModelStoreOwner;

    move-result-object v11

    if-eqz v11, :cond_8

    .line 79
    .local v11, "viewModelStoreOwner\\1":Landroidx/lifecycle/ViewModelStoreOwner;
    const/4 v12, 0x0

    .line 81
    .local v12, "key\\1":Ljava/lang/String;
    and-int/lit8 v10, v7, 0xe

    invoke-static {v11, v15, v10}, Landroidx/hilt/navigation/compose/HiltViewModelKt;->createHiltViewModelFactory(Landroidx/lifecycle/ViewModelStoreOwner;Landroidx/compose/runtime/Composer;I)Landroidx/lifecycle/ViewModelProvider$Factory;

    move-result-object v13

    .local v13, "factory\\1":Landroidx/lifecycle/ViewModelProvider$Factory;
    and-int/lit8 v10, v7, 0xe

    and-int/lit8 v14, v7, 0x70

    or-int/2addr v10, v14

    .line 82
    move/from16 v19, v10

    .local v19, "$changed\\3":I
    const/16 v20, 0x0

    .local v20, "$i$f$viewModel\\3\\82":I
    const v10, 0x671a9c9b

    invoke-interface {v15, v10}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v10, "CC(viewModel)P(3,2,1)*80@3834L7,90@4209L68:ViewModel.kt#3tja67"

    invoke-static {v15, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 83
    instance-of v10, v11, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;

    if-eqz v10, :cond_7

    .line 84
    move-object v10, v11

    check-cast v10, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;

    invoke-interface {v10}, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;->getDefaultViewModelCreationExtras()Landroidx/lifecycle/viewmodel/CreationExtras;

    move-result-object v10

    move-object v14, v10

    goto :goto_4

    .line 86
    :cond_7
    sget-object v10, Landroidx/lifecycle/viewmodel/CreationExtras$Empty;->INSTANCE:Landroidx/lifecycle/viewmodel/CreationExtras$Empty;

    check-cast v10, Landroidx/lifecycle/viewmodel/CreationExtras;

    move-object v14, v10

    :goto_4
    nop

    .local v14, "extras\\3":Landroidx/lifecycle/viewmodel/CreationExtras;
    const-class v10, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    .line 88
    const/16 p1, 0x0

    shl-int/lit8 v8, v19, 0x3

    and-int/lit16 v8, v8, 0x380

    const v16, 0x9048

    or-int v16, v8, v16

    const/16 v17, 0x0

    invoke-static/range {v10 .. v17}, Landroidx/lifecycle/viewmodel/compose/ViewModelKt;->viewModel(Ljava/lang/Class;Landroidx/lifecycle/ViewModelStoreOwner;Ljava/lang/String;Landroidx/lifecycle/ViewModelProvider$Factory;Landroidx/lifecycle/viewmodel/CreationExtras;Landroidx/compose/runtime/Composer;II)Landroidx/lifecycle/ViewModel;

    move-result-object v8

    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .line 82
    .end local v14    # "extras\\3":Landroidx/lifecycle/viewmodel/CreationExtras;
    .end local v19    # "$changed\\3":I
    .end local v20    # "$i$f$viewModel\\3\\82":I
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .end local v7    # "$changed\\1":I
    .end local v11    # "viewModelStoreOwner\\1":Landroidx/lifecycle/ViewModelStoreOwner;
    .end local v12    # "key\\1":Ljava/lang/String;
    .end local v13    # "factory\\1":Landroidx/lifecycle/ViewModelProvider$Factory;
    .end local v15    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v18    # "$i$f$hiltViewModel\\1\\13":I
    move-object v5, v8

    check-cast v5, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    .end local p0    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v5, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    and-int/lit8 v4, v4, -0xf

    goto :goto_5

    .line 76
    .end local v5    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .restart local v7    # "$changed\\1":I
    .restart local v15    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .restart local v18    # "$i$f$hiltViewModel\\1\\13":I
    .restart local p0    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :cond_8
    const/4 v1, 0x0

    .line 77
    .local v1, "$i$a$-checkNotNull-HiltViewModelKt$hiltViewModel$1\\2\\76\\1":I
    nop

    .line 76
    .end local v1    # "$i$a$-checkNotNull-HiltViewModelKt$hiltViewModel$1\\2\\76\\1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "No ViewModelStoreOwner was provided via LocalViewModelStoreOwner"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 13
    .end local v7    # "$changed\\1":I
    .end local v15    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v18    # "$i$f$hiltViewModel\\1\\13":I
    :cond_9
    const/16 p1, 0x0

    .line 12
    .end local p0    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .restart local v5    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :goto_5
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v7

    if-eqz v7, :cond_a

    const/4 v7, -0x1

    const-string v8, "com.hardlineforge.lala.ui.screens.SettingsScreen (SettingsScreen.kt:12)"

    invoke-static {v2, v4, v7, v8}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 14
    :cond_a
    const v2, -0x11bae164

    const-string v7, "CC(remember):SettingsScreen.kt#9igjgp"

    invoke-static {v3, v2, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v2, 0x0

    .local v2, "invalid\\4":Z
    move-object v8, v3

    .local v8, "$this$cache\\4":Landroidx/compose/runtime/Composer;
    const/4 v10, 0x0

    .line 89
    .local v10, "$i$f$cache\\4\\14":I
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v11

    .local v11, "it\\4":Ljava/lang/Object;
    const/4 v12, 0x0

    .line 90
    .local v12, "$i$a$-let-ComposerKt$cache$1\\5\\89\\4":I
    sget-object v13, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v13}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v13

    const/4 v14, 0x0

    if-ne v11, v13, :cond_b

    .line 91
    const/4 v13, 0x0

    .line 14
    .local v13, "$i$a$-cache-SettingsScreenKt$SettingsScreen$darkMode$2\\6\\91\\0":I
    invoke-static/range {p1 .. p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    invoke-static {v15, v14, v6, v14}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v13

    .line 91
    .end local v13    # "$i$a$-cache-SettingsScreenKt$SettingsScreen$darkMode$2\\6\\91\\0":I
    nop

    .line 92
    .local v13, "value\\5":Ljava/lang/Object;
    invoke-interface {v8, v13}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 93
    move-object v11, v13

    .end local v13    # "value\\5":Ljava/lang/Object;
    goto :goto_6

    .line 94
    :cond_b
    nop

    .line 89
    .end local v11    # "it\\4":Ljava/lang/Object;
    .end local v12    # "$i$a$-let-ComposerKt$cache$1\\5\\89\\4":I
    :goto_6
    nop

    .line 14
    .end local v2    # "invalid\\4":Z
    .end local v8    # "$this$cache\\4":Landroidx/compose/runtime/Composer;
    .end local v10    # "$i$f$cache\\4\\14":I
    move-object v2, v11

    check-cast v2, Landroidx/compose/runtime/MutableState;

    .local v2, "darkMode$delegate":Landroidx/compose/runtime/MutableState;
    invoke-static {v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 15
    const v8, -0x11bada80

    invoke-static {v3, v8, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v8, 0x0

    .local v8, "invalid\\7":Z
    move-object v10, v3

    .local v10, "$this$cache\\7":Landroidx/compose/runtime/Composer;
    const/4 v11, 0x0

    .line 95
    .local v11, "$i$f$cache\\7\\15":I
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v12

    .local v12, "it\\7":Ljava/lang/Object;
    const/4 v13, 0x0

    .line 96
    .local v13, "$i$a$-let-ComposerKt$cache$1\\8\\95\\7":I
    sget-object v15, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v15}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v15

    if-ne v12, v15, :cond_c

    .line 97
    const/4 v15, 0x0

    .line 15
    .local v15, "$i$a$-cache-SettingsScreenKt$SettingsScreen$fontSize$2\\9\\97\\0":I
    const-string v9, "default"

    invoke-static {v9, v14, v6, v14}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v9

    .line 97
    .end local v15    # "$i$a$-cache-SettingsScreenKt$SettingsScreen$fontSize$2\\9\\97\\0":I
    nop

    .line 98
    .local v9, "value\\8":Ljava/lang/Object;
    invoke-interface {v10, v9}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 99
    move-object v12, v9

    .end local v9    # "value\\8":Ljava/lang/Object;
    goto :goto_7

    .line 100
    :cond_c
    nop

    .line 95
    .end local v12    # "it\\7":Ljava/lang/Object;
    .end local v13    # "$i$a$-let-ComposerKt$cache$1\\8\\95\\7":I
    :goto_7
    nop

    .line 15
    .end local v8    # "invalid\\7":Z
    .end local v10    # "$this$cache\\7":Landroidx/compose/runtime/Composer;
    .end local v11    # "$i$f$cache\\7\\15":I
    move-object v8, v12

    check-cast v8, Landroidx/compose/runtime/MutableState;

    .local v8, "fontSize$delegate":Landroidx/compose/runtime/MutableState;
    invoke-static {v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 16
    const v9, -0x11bacea3

    invoke-static {v3, v9, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v9, 0x0

    .local v9, "invalid\\10":Z
    move-object v10, v3

    .local v10, "$this$cache\\10":Landroidx/compose/runtime/Composer;
    const/4 v11, 0x0

    .line 101
    .local v11, "$i$f$cache\\10\\16":I
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v12

    .local v12, "it\\10":Ljava/lang/Object;
    const/4 v13, 0x0

    .line 102
    .local v13, "$i$a$-let-ComposerKt$cache$1\\11\\101\\10":I
    sget-object v15, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v15}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v15

    if-ne v12, v15, :cond_d

    .line 103
    const/4 v15, 0x0

    .line 16
    .local v15, "$i$a$-cache-SettingsScreenKt$SettingsScreen$accentColor$2\\12\\103\\0":I
    move/from16 v17, v4

    .end local v4    # "$dirty":I
    .local v17, "$dirty":I
    const-string v4, "blue"

    invoke-static {v4, v14, v6, v14}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v4

    .line 103
    .end local v15    # "$i$a$-cache-SettingsScreenKt$SettingsScreen$accentColor$2\\12\\103\\0":I
    nop

    .line 104
    .local v4, "value\\11":Ljava/lang/Object;
    invoke-interface {v10, v4}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 105
    move-object v12, v4

    .end local v4    # "value\\11":Ljava/lang/Object;
    goto :goto_8

    .line 106
    .end local v17    # "$dirty":I
    .local v4, "$dirty":I
    :cond_d
    move/from16 v17, v4

    .line 101
    .end local v4    # "$dirty":I
    .end local v12    # "it\\10":Ljava/lang/Object;
    .end local v13    # "$i$a$-let-ComposerKt$cache$1\\11\\101\\10":I
    .restart local v17    # "$dirty":I
    :goto_8
    nop

    .line 16
    .end local v9    # "invalid\\10":Z
    .end local v10    # "$this$cache\\10":Landroidx/compose/runtime/Composer;
    .end local v11    # "$i$f$cache\\10\\16":I
    move-object v4, v12

    check-cast v4, Landroidx/compose/runtime/MutableState;

    .local v4, "accentColor$delegate":Landroidx/compose/runtime/MutableState;
    invoke-static {v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 18
    sget-object v6, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v6, Landroidx/compose/ui/Modifier;

    const/4 v9, 0x0

    const/4 v10, 0x1

    invoke-static {v6, v9, v10, v14}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxSize$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v6

    const/16 v10, 0x14

    .local v10, "$this$dp\\13":I
    const/4 v11, 0x0

    .line 107
    .local v11, "$i$f$getDp\\13\\18":I
    int-to-float v12, v10

    invoke-static {v12}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v10

    .line 18
    .end local v10    # "$this$dp\\13":I
    .end local v11    # "$i$f$getDp\\13\\18":I
    invoke-static {v6, v10}, Landroidx/compose/foundation/layout/PaddingKt;->padding-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v6

    sget-object v10, Landroidx/compose/foundation/layout/Arrangement;->INSTANCE:Landroidx/compose/foundation/layout/Arrangement;

    const/16 v11, 0x14

    .local v11, "$this$dp\\14":I
    const/4 v12, 0x0

    .line 107
    .local v12, "$i$f$getDp\\14\\18":I
    int-to-float v13, v11

    invoke-static {v13}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v11

    .line 18
    .end local v11    # "$this$dp\\14":I
    .end local v12    # "$i$f$getDp\\14\\18":I
    invoke-virtual {v10, v11}, Landroidx/compose/foundation/layout/Arrangement;->spacedBy-0680j_4(F)Landroidx/compose/foundation/layout/Arrangement$HorizontalOrVertical;

    move-result-object v10

    check-cast v10, Landroidx/compose/foundation/layout/Arrangement$Vertical;

    .local v10, "verticalArrangement\\15":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    const/16 v11, 0x36

    .local v6, "modifier\\15":Landroidx/compose/ui/Modifier;
    .local v11, "$changed\\15":I
    move-object v12, v3

    .local v12, "$composer\\15":Landroidx/compose/runtime/Composer;
    const/4 v13, 0x0

    .line 108
    .local v13, "$i$f$Column\\15\\18":I
    const v15, -0x1cd0f17e

    const-string v9, "CC(Column)P(2,3,1)87@4442L61,88@4508L133:Column.kt#2w3rfo"

    invoke-static {v12, v15, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 109
    sget-object v9, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v9}, Landroidx/compose/ui/Alignment$Companion;->getStart()Landroidx/compose/ui/Alignment$Horizontal;

    move-result-object v9

    .line 112
    .local v9, "horizontalAlignment\\15":Landroidx/compose/ui/Alignment$Horizontal;
    shr-int/lit8 v15, v11, 0x3

    and-int/lit8 v15, v15, 0xe

    shr-int/lit8 v18, v11, 0x3

    and-int/lit8 v18, v18, 0x70

    or-int v15, v15, v18

    invoke-static {v10, v9, v12, v15}, Landroidx/compose/foundation/layout/ColumnKt;->columnMeasurePolicy(Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/ui/Alignment$Horizontal;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v15

    .line 116
    .local v15, "measurePolicy\\15":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v18, v11, 0x3

    and-int/lit8 v18, v18, 0x70

    .line 113
    move-object/from16 v19, v6

    .local v18, "$changed\\16":I
    .local v19, "modifier\\16":Landroidx/compose/ui/Modifier;
    const/16 v20, 0x0

    .line 117
    .local v20, "$i$f$Layout\\16\\113":I
    const v14, -0x4ee9b9da

    move-object/from16 v22, v6

    .end local v6    # "modifier\\15":Landroidx/compose/ui/Modifier;
    .local v22, "modifier\\15":Landroidx/compose/ui/Modifier;
    const-string v6, "CC(Layout)P(!1,2)79@3206L23,82@3357L359:Layout.kt#80mrfh"

    invoke-static {v12, v14, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 118
    move/from16 v14, p1

    invoke-static {v12, v14}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v23

    .line 119
    .local v23, "compositeKeyHash\\16":I
    invoke-interface {v12}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v14

    .line 120
    .local v14, "localMap\\16":Landroidx/compose/runtime/CompositionLocalMap;
    move-object/from16 v24, v9

    move-object/from16 v9, v19

    move-object/from16 v19, v10

    .end local v10    # "verticalArrangement\\15":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    .local v9, "modifier\\16":Landroidx/compose/ui/Modifier;
    .local v19, "verticalArrangement\\15":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    .local v24, "horizontalAlignment\\15":Landroidx/compose/ui/Alignment$Horizontal;
    invoke-static {v12, v9}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v10

    .line 122
    .local v10, "materialized\\16":Landroidx/compose/ui/Modifier;
    sget-object v25, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v25 .. v25}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v25

    move-object/from16 v26, v9

    .end local v9    # "modifier\\16":Landroidx/compose/ui/Modifier;
    .local v26, "modifier\\16":Landroidx/compose/ui/Modifier;
    shl-int/lit8 v9, v18, 0x6

    and-int/lit16 v9, v9, 0x380

    or-int/lit8 v9, v9, 0x6

    .line 121
    nop

    .local v9, "$changed\\17":I
    move-object/from16 v27, v25

    .local v27, "factory\\17":Lkotlin/jvm/functions/Function0;
    const/16 v25, 0x0

    .line 123
    .local v25, "$i$f$ReusableComposeNode\\17\\121":I
    move/from16 v28, v9

    .end local v9    # "$changed\\17":I
    .local v28, "$changed\\17":I
    const v9, -0x2942ffcf

    move/from16 v29, v11

    .end local v11    # "$changed\\15":I
    .local v29, "$changed\\15":I
    const-string v11, "CC(ReusableComposeNode)P(1,2)355@14017L9:Composables.kt#9igjgp"

    invoke-static {v12, v9, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 124
    invoke-interface {v12}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v9

    instance-of v9, v9, Landroidx/compose/runtime/Applier;

    if-nez v9, :cond_e

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 125
    :cond_e
    invoke-interface {v12}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 126
    invoke-interface {v12}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v9

    if-eqz v9, :cond_f

    .line 127
    move-object/from16 v9, v27

    .end local v27    # "factory\\17":Lkotlin/jvm/functions/Function0;
    .local v9, "factory\\17":Lkotlin/jvm/functions/Function0;
    invoke-interface {v12, v9}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_9

    .line 129
    .end local v9    # "factory\\17":Lkotlin/jvm/functions/Function0;
    .restart local v27    # "factory\\17":Lkotlin/jvm/functions/Function0;
    :cond_f
    move-object/from16 v9, v27

    .end local v27    # "factory\\17":Lkotlin/jvm/functions/Function0;
    .restart local v9    # "factory\\17":Lkotlin/jvm/functions/Function0;
    invoke-interface {v12}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 131
    :goto_9
    move-object/from16 v27, v9

    .end local v9    # "factory\\17":Lkotlin/jvm/functions/Function0;
    .restart local v27    # "factory\\17":Lkotlin/jvm/functions/Function0;
    invoke-static {v12}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v9

    .local v9, "$this$Layout_u24lambda_u240\\18":Landroidx/compose/runtime/Composer;
    const/16 v30, 0x0

    .line 132
    .local v30, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\18\\131\\16":I
    sget-object v31, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v32, v12

    .end local v12    # "$composer\\15":Landroidx/compose/runtime/Composer;
    .local v32, "$composer\\15":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v31 .. v31}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v12

    invoke-static {v9, v15, v12}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 133
    sget-object v12, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v12}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v12

    invoke-static {v9, v14, v12}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 134
    sget-object v12, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v12}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v12

    .local v12, "block\\19":Lkotlin/jvm/functions/Function2;
    const/16 v31, 0x0

    .line 135
    .local v31, "$i$f$set-impl\\19\\134":I
    move-object/from16 v33, v9

    .local v33, "$this$set_impl_u24lambda_u240\\19":Landroidx/compose/runtime/Composer;
    const/16 v34, 0x0

    .line 136
    .local v34, "$i$a$-with-Updater$set$1\\20\\135\\19":I
    invoke-interface/range {v33 .. v33}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v35

    if-nez v35, :cond_11

    move/from16 v35, v13

    .end local v13    # "$i$f$Column\\15\\18":I
    .local v35, "$i$f$Column\\15\\18":I
    invoke-interface/range {v33 .. v33}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v13

    move-object/from16 v36, v14

    .end local v14    # "localMap\\16":Landroidx/compose/runtime/CompositionLocalMap;
    .local v36, "localMap\\16":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-static {v13, v14}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_10

    goto :goto_a

    :cond_10
    move-object/from16 v14, v33

    goto :goto_b

    .end local v35    # "$i$f$Column\\15\\18":I
    .end local v36    # "localMap\\16":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v13    # "$i$f$Column\\15\\18":I
    .restart local v14    # "localMap\\16":Landroidx/compose/runtime/CompositionLocalMap;
    :cond_11
    move/from16 v35, v13

    move-object/from16 v36, v14

    .line 137
    .end local v13    # "$i$f$Column\\15\\18":I
    .end local v14    # "localMap\\16":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v35    # "$i$f$Column\\15\\18":I
    .restart local v36    # "localMap\\16":Landroidx/compose/runtime/CompositionLocalMap;
    :goto_a
    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    move-object/from16 v14, v33

    .end local v33    # "$this$set_impl_u24lambda_u240\\19":Landroidx/compose/runtime/Composer;
    .local v14, "$this$set_impl_u24lambda_u240\\19":Landroidx/compose/runtime/Composer;
    invoke-interface {v14, v13}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 138
    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v9, v13, v12}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 140
    :goto_b
    nop

    .line 135
    .end local v14    # "$this$set_impl_u24lambda_u240\\19":Landroidx/compose/runtime/Composer;
    .end local v34    # "$i$a$-with-Updater$set$1\\20\\135\\19":I
    nop

    .line 140
    nop

    .line 141
    .end local v12    # "block\\19":Lkotlin/jvm/functions/Function2;
    .end local v31    # "$i$f$set-impl\\19\\134":I
    sget-object v12, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v12}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v12

    invoke-static {v9, v10, v12}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 142
    nop

    .line 131
    .end local v9    # "$this$Layout_u24lambda_u240\\18":Landroidx/compose/runtime/Composer;
    .end local v30    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\18\\131\\16":I
    nop

    .line 143
    shr-int/lit8 v9, v28, 0x6

    and-int/lit8 v9, v9, 0xe

    .local v9, "$changed\\21":I
    move-object/from16 v12, v32

    .local v12, "$composer\\21":Landroidx/compose/runtime/Composer;
    const/4 v13, 0x0

    .line 114
    .local v13, "$i$a$-Layout-ColumnKt$Column$1\\21\\143\\15":I
    const v14, -0x16eda499

    move/from16 v30, v9

    .end local v9    # "$changed\\21":I
    .local v30, "$changed\\21":I
    const-string v9, "C89@4556L9:Column.kt#2w3rfo"

    invoke-static {v12, v14, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v9, Landroidx/compose/foundation/layout/ColumnScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/ColumnScopeInstance;

    shr-int/lit8 v14, v29, 0x6

    and-int/lit8 v14, v14, 0x70

    or-int/lit8 v14, v14, 0x6

    .local v14, "$changed\\22":I
    check-cast v9, Landroidx/compose/foundation/layout/ColumnScope;

    .local v9, "$this$SettingsScreen_u24lambda_u2433\\22":Landroidx/compose/foundation/layout/ColumnScope;
    move-object/from16 v58, v12

    .local v58, "$composer\\22":Landroidx/compose/runtime/Composer;
    const/16 v31, 0x0

    .line 19
    .local v31, "$i$a$-Column-SettingsScreenKt$SettingsScreen$1\\22\\114\\0":I
    move-object/from16 v33, v9

    .end local v9    # "$this$SettingsScreen_u24lambda_u2433\\22":Landroidx/compose/foundation/layout/ColumnScope;
    .local v33, "$this$SettingsScreen_u24lambda_u2433\\22":Landroidx/compose/foundation/layout/ColumnScope;
    const v9, 0x34abaaf5

    move-object/from16 v34, v10

    .end local v10    # "materialized\\16":Landroidx/compose/ui/Modifier;
    .local v34, "materialized\\16":Landroidx/compose/ui/Modifier;
    const-string v10, "C18@846L10,18@807L65,21@945L10,21@904L64,22@977L255,27@1282L10,27@1242L62,28@1344L359,28@1313L390,38@1756L10,38@1713L65,39@1818L367,39@1787L398,49@2195L9,52@2287L10,52@2241L69,53@2344L16,53@2420L6,53@2319L159,56@2512L20,56@2592L6,56@2487L167,60@2664L9,63@2753L10,63@2705L71,64@2817L16:SettingsScreen.kt#4cebsy"

    move-object/from16 v62, v12

    .end local v58    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .local v12, "$composer\\22":Landroidx/compose/runtime/Composer;
    .local v62, "$composer\\21":Landroidx/compose/runtime/Composer;
    invoke-static {v12, v9, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v9, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v10, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v9, v12, v10}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v9

    invoke-virtual {v9}, Landroidx/compose/material3/Typography;->getHeadlineMedium()Landroidx/compose/ui/text/TextStyle;

    move-result-object v57

    const/16 v60, 0x0

    const v61, 0xfffe

    const-string v37, "Settings"

    const/16 v38, 0x0

    const-wide/16 v39, 0x0

    const-wide/16 v41, 0x0

    const/16 v43, 0x0

    const/16 v44, 0x0

    const/16 v45, 0x0

    const-wide/16 v46, 0x0

    const/16 v48, 0x0

    const/16 v49, 0x0

    const-wide/16 v50, 0x0

    const/16 v52, 0x0

    const/16 v53, 0x0

    const/16 v54, 0x0

    const/16 v55, 0x0

    const/16 v56, 0x0

    const/16 v59, 0x6

    .end local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v58    # "$composer\\22":Landroidx/compose/runtime/Composer;
    invoke-static/range {v37 .. v61}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 22
    .end local v58    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    sget-object v9, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v10, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v9, v12, v10}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v9

    invoke-virtual {v9}, Landroidx/compose/material3/Typography;->getTitleMedium()Landroidx/compose/ui/text/TextStyle;

    move-result-object v57

    const-string v37, "Appearance"

    .end local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v58    # "$composer\\22":Landroidx/compose/runtime/Composer;
    invoke-static/range {v37 .. v61}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 23
    .end local v58    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    sget-object v9, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v9}, Landroidx/compose/ui/Alignment$Companion;->getCenterVertically()Landroidx/compose/ui/Alignment$Vertical;

    move-result-object v9

    .local v9, "verticalAlignment\\23":Landroidx/compose/ui/Alignment$Vertical;
    sget-object v10, Landroidx/compose/foundation/layout/Arrangement;->INSTANCE:Landroidx/compose/foundation/layout/Arrangement;

    invoke-virtual {v10}, Landroidx/compose/foundation/layout/Arrangement;->getSpaceBetween()Landroidx/compose/foundation/layout/Arrangement$HorizontalOrVertical;

    move-result-object v10

    sget-object v37, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    move-object/from16 v38, v10

    move-object/from16 v10, v37

    check-cast v10, Landroidx/compose/ui/Modifier;

    move/from16 v63, v13

    move/from16 v64, v14

    move-object/from16 v65, v15

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    .end local v13    # "$i$a$-Layout-ColumnKt$Column$1\\21\\143\\15":I
    .end local v14    # "$changed\\22":I
    .end local v15    # "measurePolicy\\15":Landroidx/compose/ui/layout/MeasurePolicy;
    .local v63, "$i$a$-Layout-ColumnKt$Column$1\\21\\143\\15":I
    .local v64, "$changed\\22":I
    .local v65, "measurePolicy\\15":Landroidx/compose/ui/layout/MeasurePolicy;
    invoke-static {v10, v13, v15, v14}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxWidth$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v10

    .local v10, "modifier\\23":Landroidx/compose/ui/Modifier;
    move-object/from16 v13, v38

    check-cast v13, Landroidx/compose/foundation/layout/Arrangement$Horizontal;

    .local v13, "horizontalArrangement\\23":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    const/16 v14, 0x1b6

    .local v14, "$changed\\23":I
    move-object v15, v12

    .local v15, "$composer\\23":Landroidx/compose/runtime/Composer;
    const/16 v37, 0x0

    .line 144
    .local v37, "$i$f$Row\\23\\23":I
    move-object/from16 v38, v10

    .end local v10    # "modifier\\23":Landroidx/compose/ui/Modifier;
    .local v38, "modifier\\23":Landroidx/compose/ui/Modifier;
    const v10, 0x2952b718

    move/from16 v39, v14

    .end local v14    # "$changed\\23":I
    .local v39, "$changed\\23":I
    const-string v14, "CC(Row)P(2,1,3)99@5124L58,100@5187L130:Row.kt#2w3rfo"

    invoke-static {v15, v10, v14}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 145
    shr-int/lit8 v40, v39, 0x3

    and-int/lit8 v40, v40, 0xe

    shr-int/lit8 v41, v39, 0x3

    and-int/lit8 v41, v41, 0x70

    or-int v10, v40, v41

    invoke-static {v13, v9, v15, v10}, Landroidx/compose/foundation/layout/RowKt;->rowMeasurePolicy(Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/ui/Alignment$Vertical;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v10

    .line 149
    .local v10, "measurePolicy\\23":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v40, v39, 0x3

    and-int/lit8 v40, v40, 0x70

    .line 146
    nop

    .local v40, "$changed\\24":I
    move-object/from16 v41, v38

    .local v41, "modifier\\24":Landroidx/compose/ui/Modifier;
    const/16 v42, 0x0

    .line 150
    .local v42, "$i$f$Layout\\24\\146":I
    move-object/from16 v43, v9

    const v9, -0x4ee9b9da

    .end local v9    # "verticalAlignment\\23":Landroidx/compose/ui/Alignment$Vertical;
    .local v43, "verticalAlignment\\23":Landroidx/compose/ui/Alignment$Vertical;
    invoke-static {v15, v9, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 151
    const/4 v9, 0x0

    invoke-static {v15, v9}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v44

    .line 152
    .local v44, "compositeKeyHash\\24":I
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v9

    .line 153
    .local v9, "localMap\\24":Landroidx/compose/runtime/CompositionLocalMap;
    move-object/from16 v45, v13

    move-object/from16 v13, v41

    .end local v41    # "modifier\\24":Landroidx/compose/ui/Modifier;
    .local v13, "modifier\\24":Landroidx/compose/ui/Modifier;
    .local v45, "horizontalArrangement\\23":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    invoke-static {v15, v13}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v0

    .line 155
    .local v0, "materialized\\24":Landroidx/compose/ui/Modifier;
    sget-object v41, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v41 .. v41}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v41

    move-object/from16 v46, v13

    .end local v13    # "modifier\\24":Landroidx/compose/ui/Modifier;
    .local v46, "modifier\\24":Landroidx/compose/ui/Modifier;
    shl-int/lit8 v13, v40, 0x6

    and-int/lit16 v13, v13, 0x380

    or-int/lit8 v13, v13, 0x6

    .line 154
    nop

    .local v13, "$changed\\25":I
    move-object/from16 v47, v41

    .local v47, "factory\\25":Lkotlin/jvm/functions/Function0;
    const/16 v41, 0x0

    .line 156
    .local v41, "$i$f$ReusableComposeNode\\25\\154":I
    move/from16 v48, v13

    const v13, -0x2942ffcf

    .end local v13    # "$changed\\25":I
    .local v48, "$changed\\25":I
    invoke-static {v15, v13, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 157
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v13

    instance-of v13, v13, Landroidx/compose/runtime/Applier;

    if-nez v13, :cond_12

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 158
    :cond_12
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 159
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v13

    if-eqz v13, :cond_13

    .line 160
    move-object/from16 v13, v47

    .end local v47    # "factory\\25":Lkotlin/jvm/functions/Function0;
    .local v13, "factory\\25":Lkotlin/jvm/functions/Function0;
    invoke-interface {v15, v13}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_c

    .line 162
    .end local v13    # "factory\\25":Lkotlin/jvm/functions/Function0;
    .restart local v47    # "factory\\25":Lkotlin/jvm/functions/Function0;
    :cond_13
    move-object/from16 v13, v47

    .end local v47    # "factory\\25":Lkotlin/jvm/functions/Function0;
    .restart local v13    # "factory\\25":Lkotlin/jvm/functions/Function0;
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 164
    :goto_c
    move-object/from16 v47, v13

    .end local v13    # "factory\\25":Lkotlin/jvm/functions/Function0;
    .restart local v47    # "factory\\25":Lkotlin/jvm/functions/Function0;
    invoke-static {v15}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v13

    .local v13, "$this$Layout_u24lambda_u240\\26":Landroidx/compose/runtime/Composer;
    const/16 v49, 0x0

    .line 165
    .local v49, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\26\\164\\24":I
    sget-object v50, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v51, v15

    .end local v15    # "$composer\\23":Landroidx/compose/runtime/Composer;
    .local v51, "$composer\\23":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v50 .. v50}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v15

    invoke-static {v13, v10, v15}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 166
    sget-object v15, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v15}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v15

    invoke-static {v13, v9, v15}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 167
    sget-object v15, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v15}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v15

    .local v15, "block\\27":Lkotlin/jvm/functions/Function2;
    const/16 v50, 0x0

    .line 168
    .local v50, "$i$f$set-impl\\27\\167":I
    move-object/from16 v52, v13

    .local v52, "$this$set_impl_u24lambda_u240\\27":Landroidx/compose/runtime/Composer;
    const/16 v53, 0x0

    .line 169
    .local v53, "$i$a$-with-Updater$set$1\\28\\168\\27":I
    invoke-interface/range {v52 .. v52}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v54

    if-nez v54, :cond_15

    move-object/from16 v54, v9

    .end local v9    # "localMap\\24":Landroidx/compose/runtime/CompositionLocalMap;
    .local v54, "localMap\\24":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-interface/range {v52 .. v52}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v9

    move-object/from16 v55, v10

    .end local v10    # "measurePolicy\\23":Landroidx/compose/ui/layout/MeasurePolicy;
    .local v55, "measurePolicy\\23":Landroidx/compose/ui/layout/MeasurePolicy;
    invoke-static/range {v44 .. v44}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_14

    goto :goto_d

    :cond_14
    move-object/from16 v10, v52

    goto :goto_e

    .end local v54    # "localMap\\24":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v55    # "measurePolicy\\23":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v9    # "localMap\\24":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v10    # "measurePolicy\\23":Landroidx/compose/ui/layout/MeasurePolicy;
    :cond_15
    move-object/from16 v54, v9

    move-object/from16 v55, v10

    .line 170
    .end local v9    # "localMap\\24":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v10    # "measurePolicy\\23":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v54    # "localMap\\24":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v55    # "measurePolicy\\23":Landroidx/compose/ui/layout/MeasurePolicy;
    :goto_d
    invoke-static/range {v44 .. v44}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    move-object/from16 v10, v52

    .end local v52    # "$this$set_impl_u24lambda_u240\\27":Landroidx/compose/runtime/Composer;
    .local v10, "$this$set_impl_u24lambda_u240\\27":Landroidx/compose/runtime/Composer;
    invoke-interface {v10, v9}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 171
    invoke-static/range {v44 .. v44}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v13, v9, v15}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 173
    :goto_e
    nop

    .line 168
    .end local v10    # "$this$set_impl_u24lambda_u240\\27":Landroidx/compose/runtime/Composer;
    .end local v53    # "$i$a$-with-Updater$set$1\\28\\168\\27":I
    nop

    .line 173
    nop

    .line 174
    .end local v15    # "block\\27":Lkotlin/jvm/functions/Function2;
    .end local v50    # "$i$f$set-impl\\27\\167":I
    sget-object v9, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v9}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v9

    invoke-static {v13, v0, v9}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 175
    nop

    .line 164
    .end local v13    # "$this$Layout_u24lambda_u240\\26":Landroidx/compose/runtime/Composer;
    .end local v49    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\26\\164\\24":I
    nop

    .line 176
    shr-int/lit8 v9, v48, 0x6

    and-int/lit8 v9, v9, 0xe

    .local v9, "$changed\\29":I
    move-object/from16 v10, v51

    .local v10, "$composer\\29":Landroidx/compose/runtime/Composer;
    const/4 v13, 0x0

    .line 147
    .local v13, "$i$a$-Layout-RowKt$Row$1\\29\\176\\23":I
    const v15, -0x184d8b46

    move-object/from16 v49, v0

    .end local v0    # "materialized\\24":Landroidx/compose/ui/Modifier;
    .local v49, "materialized\\24":Landroidx/compose/ui/Modifier;
    const-string v0, "C101@5232L9:Row.kt#2w3rfo"

    invoke-static {v10, v15, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v50, Landroidx/compose/foundation/layout/RowScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/RowScopeInstance;

    shr-int/lit8 v52, v39, 0x6

    and-int/lit8 v52, v52, 0x70

    or-int/lit8 v52, v52, 0x6

    .local v52, "$changed\\30":I
    check-cast v50, Landroidx/compose/foundation/layout/RowScope;

    .local v50, "$this$SettingsScreen_u24lambda_u2433_u24lambda_u2411\\30":Landroidx/compose/foundation/layout/RowScope;
    move-object/from16 v87, v10

    .local v87, "$composer\\30":Landroidx/compose/runtime/Composer;
    const/16 v53, 0x0

    .line 24
    .local v53, "$i$a$-Row-SettingsScreenKt$SettingsScreen$1$1\\30\\147\\22":I
    const v15, 0x3e8f8666

    move/from16 v56, v9

    .end local v9    # "$changed\\29":I
    .local v56, "$changed\\29":I
    const-string v9, "C23@1129L17,24@1204L17,24@1159L63:SettingsScreen.kt#4cebsy"

    move-object/from16 v57, v10

    .end local v87    # "$composer\\30":Landroidx/compose/runtime/Composer;
    .local v10, "$composer\\30":Landroidx/compose/runtime/Composer;
    .local v57, "$composer\\29":Landroidx/compose/runtime/Composer;
    invoke-static {v10, v15, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/16 v89, 0x0

    const v90, 0x1fffe

    const-string v66, "Dark Mode"

    const/16 v67, 0x0

    const-wide/16 v68, 0x0

    const-wide/16 v70, 0x0

    const/16 v72, 0x0

    const/16 v73, 0x0

    const/16 v74, 0x0

    const-wide/16 v75, 0x0

    const/16 v77, 0x0

    const/16 v78, 0x0

    const-wide/16 v79, 0x0

    const/16 v81, 0x0

    const/16 v82, 0x0

    const/16 v83, 0x0

    const/16 v84, 0x0

    const/16 v85, 0x0

    const/16 v86, 0x0

    const/16 v88, 0x6

    .end local v10    # "$composer\\30":Landroidx/compose/runtime/Composer;
    .restart local v87    # "$composer\\30":Landroidx/compose/runtime/Composer;
    invoke-static/range {v66 .. v90}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 25
    .end local v87    # "$composer\\30":Landroidx/compose/runtime/Composer;
    .restart local v10    # "$composer\\30":Landroidx/compose/runtime/Composer;
    invoke-static {v2}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt;->SettingsScreen$lambda$1(Landroidx/compose/runtime/MutableState;)Z

    move-result v66

    const v9, 0x204aa51

    invoke-static {v10, v9, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v9, 0x0

    .local v9, "invalid\\31":Z
    move-object v15, v10

    .local v15, "$this$cache\\31":Landroidx/compose/runtime/Composer;
    const/16 v58, 0x0

    .line 177
    .local v58, "$i$f$cache\\31\\25":I
    move/from16 v59, v9

    .end local v9    # "invalid\\31":Z
    .local v59, "invalid\\31":Z
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v9

    .local v9, "it\\31":Ljava/lang/Object;
    const/16 v60, 0x0

    .line 178
    .local v60, "$i$a$-let-ComposerKt$cache$1\\32\\177\\31":I
    sget-object v61, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    .end local v10    # "$composer\\30":Landroidx/compose/runtime/Composer;
    .restart local v87    # "$composer\\30":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v61 .. v61}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v10

    if-ne v9, v10, :cond_16

    .line 179
    const/4 v10, 0x0

    .line 25
    .local v10, "$i$a$-cache-SettingsScreenKt$SettingsScreen$1$1$1\\33\\179\\30":I
    move-object/from16 v61, v9

    .end local v9    # "it\\31":Ljava/lang/Object;
    .local v61, "it\\31":Ljava/lang/Object;
    new-instance v9, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda2;

    invoke-direct {v9, v2}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda2;-><init>(Landroidx/compose/runtime/MutableState;)V

    .line 179
    .end local v10    # "$i$a$-cache-SettingsScreenKt$SettingsScreen$1$1$1\\33\\179\\30":I
    nop

    .line 180
    .local v9, "value\\32":Ljava/lang/Object;
    invoke-interface {v15, v9}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 181
    nop

    .end local v9    # "value\\32":Ljava/lang/Object;
    goto :goto_f

    .line 182
    .end local v61    # "it\\31":Ljava/lang/Object;
    .local v9, "it\\31":Ljava/lang/Object;
    :cond_16
    move-object/from16 v61, v9

    .line 177
    .end local v9    # "it\\31":Ljava/lang/Object;
    .end local v60    # "$i$a$-let-ComposerKt$cache$1\\32\\177\\31":I
    :goto_f
    nop

    .line 25
    .end local v15    # "$this$cache\\31":Landroidx/compose/runtime/Composer;
    .end local v58    # "$i$f$cache\\31\\25":I
    .end local v59    # "invalid\\31":Z
    move-object/from16 v67, v9

    check-cast v67, Lkotlin/jvm/functions/Function1;

    invoke-static/range {v87 .. v87}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/16 v74, 0x30

    const/16 v75, 0x7c

    const/16 v68, 0x0

    const/16 v69, 0x0

    const/16 v70, 0x0

    const/16 v71, 0x0

    const/16 v72, 0x0

    move-object/from16 v73, v87

    .end local v87    # "$composer\\30":Landroidx/compose/runtime/Composer;
    .local v73, "$composer\\30":Landroidx/compose/runtime/Composer;
    invoke-static/range {v66 .. v75}, Landroidx/compose/material3/SwitchKt;->Switch(ZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/material3/SwitchColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/runtime/Composer;II)V

    .line 24
    move-object/from16 v10, v73

    .end local v73    # "$composer\\30":Landroidx/compose/runtime/Composer;
    .local v10, "$composer\\30":Landroidx/compose/runtime/Composer;
    invoke-static {v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 26
    nop

    .line 147
    .end local v10    # "$composer\\30":Landroidx/compose/runtime/Composer;
    .end local v50    # "$this$SettingsScreen_u24lambda_u2433_u24lambda_u2411\\30":Landroidx/compose/foundation/layout/RowScope;
    .end local v52    # "$changed\\30":I
    .end local v53    # "$i$a$-Row-SettingsScreenKt$SettingsScreen$1$1\\30\\147\\22":I
    invoke-static/range {v57 .. v57}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 176
    .end local v13    # "$i$a$-Layout-RowKt$Row$1\\29\\176\\23":I
    .end local v56    # "$changed\\29":I
    .end local v57    # "$composer\\29":Landroidx/compose/runtime/Composer;
    nop

    .line 183
    invoke-interface/range {v51 .. v51}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 156
    invoke-static/range {v51 .. v51}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 184
    nop

    .line 150
    .end local v41    # "$i$f$ReusableComposeNode\\25\\154":I
    .end local v47    # "factory\\25":Lkotlin/jvm/functions/Function0;
    .end local v48    # "$changed\\25":I
    invoke-static/range {v51 .. v51}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 185
    nop

    .line 144
    .end local v40    # "$changed\\24":I
    .end local v42    # "$i$f$Layout\\24\\146":I
    .end local v44    # "compositeKeyHash\\24":I
    .end local v46    # "modifier\\24":Landroidx/compose/ui/Modifier;
    .end local v49    # "materialized\\24":Landroidx/compose/ui/Modifier;
    .end local v54    # "localMap\\24":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static/range {v51 .. v51}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 186
    nop

    .line 28
    .end local v37    # "$i$f$Row\\23\\23":I
    .end local v38    # "modifier\\23":Landroidx/compose/ui/Modifier;
    .end local v39    # "$changed\\23":I
    .end local v43    # "verticalAlignment\\23":Landroidx/compose/ui/Alignment$Vertical;
    .end local v45    # "horizontalArrangement\\23":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .end local v51    # "$composer\\23":Landroidx/compose/runtime/Composer;
    .end local v55    # "measurePolicy\\23":Landroidx/compose/ui/layout/MeasurePolicy;
    sget-object v9, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v10, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v9, v12, v10}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v9

    invoke-virtual {v9}, Landroidx/compose/material3/Typography;->getLabelLarge()Landroidx/compose/ui/text/TextStyle;

    move-result-object v57

    const/16 v60, 0x0

    const v61, 0xfffe

    const/16 v38, 0x0

    const-wide/16 v39, 0x0

    const-wide/16 v41, 0x0

    const/16 v43, 0x0

    const/16 v44, 0x0

    const/16 v45, 0x0

    const-wide/16 v46, 0x0

    const/16 v48, 0x0

    const/16 v49, 0x0

    const-wide/16 v50, 0x0

    const/16 v52, 0x0

    const/16 v53, 0x0

    const/16 v54, 0x0

    const/16 v55, 0x0

    const/16 v56, 0x0

    const/16 v59, 0x6

    const-string v37, "Font Size"

    move-object/from16 v58, v12

    .end local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .local v58, "$composer\\22":Landroidx/compose/runtime/Composer;
    invoke-static/range {v37 .. v61}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 29
    .end local v58    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    new-instance v9, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda3;

    invoke-direct {v9, v8}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda3;-><init>(Landroidx/compose/runtime/MutableState;)V

    const/16 v10, 0x36

    const v13, -0x7fde9231

    const/4 v15, 0x1

    invoke-static {v13, v15, v9, v12, v10}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v9

    move-object/from16 v39, v9

    check-cast v39, Lkotlin/jvm/functions/Function3;

    const/16 v41, 0x180

    const/16 v42, 0x3

    const/16 v37, 0x0

    const/16 v38, 0x0

    move-object/from16 v40, v12

    .end local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .local v40, "$composer\\22":Landroidx/compose/runtime/Composer;
    invoke-static/range {v37 .. v42}, Landroidx/compose/material3/SegmentedButtonKt;->SingleChoiceSegmentedButtonRow-uFdPcIQ(Landroidx/compose/ui/Modifier;FLkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    .line 39
    .end local v40    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    sget-object v9, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v10, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v9, v12, v10}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v9

    invoke-virtual {v9}, Landroidx/compose/material3/Typography;->getLabelLarge()Landroidx/compose/ui/text/TextStyle;

    move-result-object v57

    const/16 v38, 0x0

    const-wide/16 v39, 0x0

    const-wide/16 v41, 0x0

    const-string v37, "Accent Color"

    .end local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v58    # "$composer\\22":Landroidx/compose/runtime/Composer;
    invoke-static/range {v37 .. v61}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 40
    .end local v58    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    new-instance v9, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda4;

    invoke-direct {v9, v4}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda4;-><init>(Landroidx/compose/runtime/MutableState;)V

    const/16 v10, 0x36

    const v13, -0x7d1a5e48

    const/4 v15, 0x1

    invoke-static {v13, v15, v9, v12, v10}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v9

    move-object/from16 v39, v9

    check-cast v39, Lkotlin/jvm/functions/Function3;

    const/16 v41, 0x180

    const/16 v42, 0x3

    const/16 v37, 0x0

    const/16 v38, 0x0

    move-object/from16 v40, v12

    .end local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v40    # "$composer\\22":Landroidx/compose/runtime/Composer;
    invoke-static/range {v37 .. v42}, Landroidx/compose/material3/SegmentedButtonKt;->SingleChoiceSegmentedButtonRow-uFdPcIQ(Landroidx/compose/ui/Modifier;FLkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    .line 50
    .end local v40    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    const-wide/16 v39, 0x0

    const/16 v42, 0x0

    const/16 v43, 0x7

    move-object/from16 v41, v12

    .end local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .local v41, "$composer\\22":Landroidx/compose/runtime/Composer;
    invoke-static/range {v37 .. v43}, Landroidx/compose/material3/DividerKt;->Divider-9IZ8Weo(Landroidx/compose/ui/Modifier;FJLandroidx/compose/runtime/Composer;II)V

    .line 53
    .end local v41    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    sget-object v9, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v10, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v9, v12, v10}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v9

    invoke-virtual {v9}, Landroidx/compose/material3/Typography;->getTitleMedium()Landroidx/compose/ui/text/TextStyle;

    move-result-object v57

    const/16 v38, 0x0

    const-wide/16 v41, 0x0

    const/16 v43, 0x0

    const-string v37, "Data Management"

    .end local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v58    # "$composer\\22":Landroidx/compose/runtime/Composer;
    invoke-static/range {v37 .. v61}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 54
    .end local v58    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    const v9, -0x61651a8c

    invoke-static {v12, v9, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v9, 0x0

    .local v9, "invalid\\34":Z
    move-object v10, v12

    .local v10, "$this$cache\\34":Landroidx/compose/runtime/Composer;
    const/4 v13, 0x0

    .line 187
    .local v13, "$i$f$cache\\34\\54":I
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v15

    .local v15, "it\\34":Ljava/lang/Object;
    const/16 v37, 0x0

    .line 188
    .local v37, "$i$a$-let-ComposerKt$cache$1\\35\\187\\34":I
    sget-object v38, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v66, v2

    .end local v2    # "darkMode$delegate":Landroidx/compose/runtime/MutableState;
    .local v66, "darkMode$delegate":Landroidx/compose/runtime/MutableState;
    invoke-virtual/range {v38 .. v38}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v2

    if-ne v15, v2, :cond_17

    .line 189
    const/4 v2, 0x0

    .local v2, "$i$a$-cache-SettingsScreenKt$SettingsScreen$1$4\\36\\189\\22":I
    new-instance v38, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda5;

    invoke-direct/range {v38 .. v38}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda5;-><init>()V

    .end local v2    # "$i$a$-cache-SettingsScreenKt$SettingsScreen$1$4\\36\\189\\22":I
    move-object/from16 v2, v38

    .line 190
    .local v2, "value\\35":Ljava/lang/Object;
    invoke-interface {v10, v2}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 191
    move-object v15, v2

    .end local v2    # "value\\35":Ljava/lang/Object;
    goto :goto_10

    .line 192
    :cond_17
    nop

    .line 187
    .end local v15    # "it\\34":Ljava/lang/Object;
    .end local v37    # "$i$a$-let-ComposerKt$cache$1\\35\\187\\34":I
    :goto_10
    nop

    .line 54
    .end local v9    # "invalid\\34":Z
    .end local v10    # "$this$cache\\34":Landroidx/compose/runtime/Composer;
    .end local v13    # "$i$f$cache\\34\\54":I
    move-object/from16 v37, v15

    check-cast v37, Lkotlin/jvm/functions/Function0;

    invoke-static {v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    const/4 v9, 0x0

    const/4 v13, 0x0

    const/4 v15, 0x1

    invoke-static {v2, v13, v15, v9}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxWidth$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v38

    sget-object v2, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v9, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v2, v12, v9}, Landroidx/compose/material3/MaterialTheme;->getShapes(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Shapes;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/material3/Shapes;->getMedium()Landroidx/compose/foundation/shape/CornerBasedShape;

    move-result-object v2

    move-object/from16 v40, v2

    check-cast v40, Landroidx/compose/ui/graphics/Shape;

    sget-object v2, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SettingsScreenKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SettingsScreenKt;

    invoke-virtual {v2}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SettingsScreenKt;->getLambda$-1283927342$app_debug()Lkotlin/jvm/functions/Function3;

    move-result-object v46

    const v48, 0x30000036

    const/16 v49, 0x1f4

    const/16 v39, 0x0

    const/16 v41, 0x0

    const/16 v42, 0x0

    const/16 v43, 0x0

    const/16 v44, 0x0

    const/16 v45, 0x0

    move-object/from16 v47, v12

    .end local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .local v47, "$composer\\22":Landroidx/compose/runtime/Composer;
    invoke-static/range {v37 .. v49}, Landroidx/compose/material3/ButtonKt;->OutlinedButton(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/graphics/Shape;Landroidx/compose/material3/ButtonColors;Landroidx/compose/material3/ButtonElevation;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/foundation/interaction/MutableInteractionSource;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    .line 57
    .end local v47    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    const v2, -0x61650588

    invoke-static {v12, v2, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v2, 0x0

    .local v2, "invalid\\37":Z
    move-object v9, v12

    .local v9, "$this$cache\\37":Landroidx/compose/runtime/Composer;
    const/4 v10, 0x0

    .line 193
    .local v10, "$i$f$cache\\37\\57":I
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v13

    .local v13, "it\\37":Ljava/lang/Object;
    const/4 v15, 0x0

    .line 194
    .local v15, "$i$a$-let-ComposerKt$cache$1\\38\\193\\37":I
    sget-object v37, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 v38, v2

    .end local v2    # "invalid\\37":Z
    .local v38, "invalid\\37":Z
    invoke-virtual/range {v37 .. v37}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v2

    if-ne v13, v2, :cond_18

    .line 195
    const/4 v2, 0x0

    .local v2, "$i$a$-cache-SettingsScreenKt$SettingsScreen$1$5\\39\\195\\22":I
    new-instance v37, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda6;

    invoke-direct/range {v37 .. v37}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda6;-><init>()V

    .end local v2    # "$i$a$-cache-SettingsScreenKt$SettingsScreen$1$5\\39\\195\\22":I
    move-object/from16 v2, v37

    .line 196
    .local v2, "value\\38":Ljava/lang/Object;
    invoke-interface {v9, v2}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 197
    move-object v13, v2

    .end local v2    # "value\\38":Ljava/lang/Object;
    goto :goto_11

    .line 198
    :cond_18
    nop

    .line 193
    .end local v13    # "it\\37":Ljava/lang/Object;
    .end local v15    # "$i$a$-let-ComposerKt$cache$1\\38\\193\\37":I
    :goto_11
    nop

    .line 57
    .end local v9    # "$this$cache\\37":Landroidx/compose/runtime/Composer;
    .end local v10    # "$i$f$cache\\37\\57":I
    .end local v38    # "invalid\\37":Z
    move-object/from16 v37, v13

    check-cast v37, Lkotlin/jvm/functions/Function0;

    invoke-static {v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    const/4 v9, 0x0

    const/4 v13, 0x0

    const/4 v15, 0x1

    invoke-static {v2, v13, v15, v9}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxWidth$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v38

    sget-object v2, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v9, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v2, v12, v9}, Landroidx/compose/material3/MaterialTheme;->getShapes(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Shapes;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/material3/Shapes;->getMedium()Landroidx/compose/foundation/shape/CornerBasedShape;

    move-result-object v2

    move-object/from16 v40, v2

    check-cast v40, Landroidx/compose/ui/graphics/Shape;

    sget-object v2, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SettingsScreenKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SettingsScreenKt;

    invoke-virtual {v2}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SettingsScreenKt;->getLambda$1039651323$app_debug()Lkotlin/jvm/functions/Function3;

    move-result-object v46

    const v48, 0x30000036

    const/16 v49, 0x1f4

    const/16 v39, 0x0

    const/16 v41, 0x0

    const/16 v42, 0x0

    const/16 v43, 0x0

    const/16 v44, 0x0

    const/16 v45, 0x0

    move-object/from16 v47, v12

    .end local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v47    # "$composer\\22":Landroidx/compose/runtime/Composer;
    invoke-static/range {v37 .. v49}, Landroidx/compose/material3/ButtonKt;->OutlinedButton(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/graphics/Shape;Landroidx/compose/material3/ButtonColors;Landroidx/compose/material3/ButtonElevation;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/foundation/interaction/MutableInteractionSource;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    .line 61
    .end local v47    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    const/16 v37, 0x0

    const/16 v38, 0x0

    const-wide/16 v39, 0x0

    const/16 v42, 0x0

    const/16 v43, 0x7

    move-object/from16 v41, v12

    .end local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v41    # "$composer\\22":Landroidx/compose/runtime/Composer;
    invoke-static/range {v37 .. v43}, Landroidx/compose/material3/DividerKt;->Divider-9IZ8Weo(Landroidx/compose/ui/Modifier;FJLandroidx/compose/runtime/Composer;II)V

    .line 64
    .end local v41    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    sget-object v2, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v9, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v2, v12, v9}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/material3/Typography;->getTitleMedium()Landroidx/compose/ui/text/TextStyle;

    move-result-object v57

    const/16 v60, 0x0

    const v61, 0xfffe

    const-string v37, "Custom Categories"

    const/16 v38, 0x0

    const-wide/16 v41, 0x0

    const/16 v43, 0x0

    const-wide/16 v46, 0x0

    const/16 v48, 0x0

    const/16 v49, 0x0

    const-wide/16 v50, 0x0

    const/16 v52, 0x0

    const/16 v53, 0x0

    const/16 v54, 0x0

    const/16 v55, 0x0

    const/16 v56, 0x0

    const/16 v59, 0x6

    move-object/from16 v58, v12

    .end local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v58    # "$composer\\22":Landroidx/compose/runtime/Composer;
    invoke-static/range {v37 .. v61}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 65
    .end local v58    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .restart local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    invoke-virtual {v5}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->getCustomCategories()Lkotlinx/coroutines/flow/StateFlow;

    move-result-object v2

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v15, 0x1

    invoke-static {v2, v10, v12, v9, v15}, Landroidx/compose/runtime/SnapshotStateKt;->collectAsState(Lkotlinx/coroutines/flow/StateFlow;Lkotlin/coroutines/CoroutineContext;Landroidx/compose/runtime/Composer;II)Landroidx/compose/runtime/State;

    move-result-object v2

    .local v2, "cats$delegate\\22":Landroidx/compose/runtime/State;
    const v9, -0x6164da5a

    invoke-interface {v12, v9}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v9, "*66@2876L315"

    invoke-static {v12, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 66
    invoke-static {v2}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt;->SettingsScreen$lambda$33$lambda$28(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v9

    check-cast v9, Ljava/lang/Iterable;

    .local v9, "$this$forEach\\40":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 199
    .local v10, "$i$f$forEach\\40\\66":I
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_12
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_1f

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    move-object/from16 v37, v2

    .end local v2    # "cats$delegate\\22":Landroidx/compose/runtime/State;
    .local v15, "element\\40":Ljava/lang/Object;
    .local v37, "cats$delegate\\22":Landroidx/compose/runtime/State;
    move-object v2, v15

    check-cast v2, Lcom/hardlineforge/lala/data/CustomCategory;

    .local v2, "cat\\41":Lcom/hardlineforge/lala/data/CustomCategory;
    const/16 v38, 0x0

    .line 67
    .local v38, "$i$a$-forEach-SettingsScreenKt$SettingsScreen$1$6\\41\\199\\22":I
    sget-object v39, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    move-object/from16 v40, v4

    .end local v4    # "accentColor$delegate":Landroidx/compose/runtime/MutableState;
    .local v40, "accentColor$delegate":Landroidx/compose/runtime/MutableState;
    move-object/from16 v4, v39

    check-cast v4, Landroidx/compose/ui/Modifier;

    move-object/from16 v39, v8

    move-object/from16 p0, v9

    move/from16 v16, v10

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    .end local v8    # "fontSize$delegate":Landroidx/compose/runtime/MutableState;
    .end local v9    # "$this$forEach\\40":Ljava/lang/Iterable;
    .end local v10    # "$i$f$forEach\\40\\66":I
    .local v16, "$i$f$forEach\\40\\66":I
    .local v39, "fontSize$delegate":Landroidx/compose/runtime/MutableState;
    .local p0, "$this$forEach\\40":Ljava/lang/Iterable;
    invoke-static {v4, v8, v10, v9}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxWidth$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v4

    .local v4, "modifier\\42":Landroidx/compose/ui/Modifier;
    sget-object v21, Landroidx/compose/foundation/layout/Arrangement;->INSTANCE:Landroidx/compose/foundation/layout/Arrangement;

    invoke-virtual/range {v21 .. v21}, Landroidx/compose/foundation/layout/Arrangement;->getSpaceBetween()Landroidx/compose/foundation/layout/Arrangement$HorizontalOrVertical;

    move-result-object v21

    move-object/from16 v8, v21

    check-cast v8, Landroidx/compose/foundation/layout/Arrangement$Horizontal;

    .local v8, "horizontalArrangement\\42":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    sget-object v21, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual/range {v21 .. v21}, Landroidx/compose/ui/Alignment$Companion;->getCenterVertically()Landroidx/compose/ui/Alignment$Vertical;

    move-result-object v9

    .local v9, "verticalAlignment\\42":Landroidx/compose/ui/Alignment$Vertical;
    const/16 v21, 0x1b6

    .local v21, "$changed\\42":I
    move-object/from16 v43, v12

    .local v43, "$composer\\42":Landroidx/compose/runtime/Composer;
    const/16 v44, 0x0

    .line 200
    .local v44, "$i$f$Row\\42\\67":I
    move-object/from16 v10, v43

    move-object/from16 v43, v4

    const v4, 0x2952b718

    .end local v4    # "modifier\\42":Landroidx/compose/ui/Modifier;
    .local v10, "$composer\\42":Landroidx/compose/runtime/Composer;
    .local v43, "modifier\\42":Landroidx/compose/ui/Modifier;
    invoke-static {v10, v4, v14}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 201
    shr-int/lit8 v46, v21, 0x3

    and-int/lit8 v46, v46, 0xe

    shr-int/lit8 v47, v21, 0x3

    and-int/lit8 v47, v47, 0x70

    or-int v4, v46, v47

    invoke-static {v8, v9, v10, v4}, Landroidx/compose/foundation/layout/RowKt;->rowMeasurePolicy(Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/ui/Alignment$Vertical;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v4

    .line 205
    .local v4, "measurePolicy\\42":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v46, v21, 0x3

    and-int/lit8 v46, v46, 0x70

    .line 202
    move-object/from16 v47, v43

    .local v46, "$changed\\43":I
    .local v47, "modifier\\43":Landroidx/compose/ui/Modifier;
    const/16 v48, 0x0

    .line 206
    .local v48, "$i$f$Layout\\43\\202":I
    move-object/from16 v49, v8

    const v8, -0x4ee9b9da

    .end local v8    # "horizontalArrangement\\42":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .local v49, "horizontalArrangement\\42":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    invoke-static {v10, v8, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 207
    const/4 v8, 0x0

    invoke-static {v10, v8}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v50

    .line 208
    .local v50, "compositeKeyHash\\43":I
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v8

    .line 209
    .local v8, "localMap\\43":Landroidx/compose/runtime/CompositionLocalMap;
    move-object/from16 v51, v6

    move-object/from16 v6, v47

    move-object/from16 v47, v9

    .end local v9    # "verticalAlignment\\42":Landroidx/compose/ui/Alignment$Vertical;
    .local v6, "modifier\\43":Landroidx/compose/ui/Modifier;
    .local v47, "verticalAlignment\\42":Landroidx/compose/ui/Alignment$Vertical;
    invoke-static {v10, v6}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v9

    .line 211
    .local v9, "materialized\\43":Landroidx/compose/ui/Modifier;
    sget-object v52, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v52 .. v52}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v52

    move-object/from16 v53, v6

    .end local v6    # "modifier\\43":Landroidx/compose/ui/Modifier;
    .local v53, "modifier\\43":Landroidx/compose/ui/Modifier;
    shl-int/lit8 v6, v46, 0x6

    and-int/lit16 v6, v6, 0x380

    or-int/lit8 v6, v6, 0x6

    .line 210
    nop

    .local v6, "$changed\\44":I
    move-object/from16 v54, v52

    .local v54, "factory\\44":Lkotlin/jvm/functions/Function0;
    const/16 v52, 0x0

    .line 212
    .local v52, "$i$f$ReusableComposeNode\\44\\210":I
    move/from16 v55, v6

    const v6, -0x2942ffcf

    .end local v6    # "$changed\\44":I
    .local v55, "$changed\\44":I
    invoke-static {v10, v6, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 213
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v6

    instance-of v6, v6, Landroidx/compose/runtime/Applier;

    if-nez v6, :cond_19

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 214
    :cond_19
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 215
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v6

    if-eqz v6, :cond_1a

    .line 216
    move-object/from16 v6, v54

    .end local v54    # "factory\\44":Lkotlin/jvm/functions/Function0;
    .local v6, "factory\\44":Lkotlin/jvm/functions/Function0;
    invoke-interface {v10, v6}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_13

    .line 218
    .end local v6    # "factory\\44":Lkotlin/jvm/functions/Function0;
    .restart local v54    # "factory\\44":Lkotlin/jvm/functions/Function0;
    :cond_1a
    move-object/from16 v6, v54

    .end local v54    # "factory\\44":Lkotlin/jvm/functions/Function0;
    .restart local v6    # "factory\\44":Lkotlin/jvm/functions/Function0;
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 220
    :goto_13
    move-object/from16 v54, v6

    .end local v6    # "factory\\44":Lkotlin/jvm/functions/Function0;
    .restart local v54    # "factory\\44":Lkotlin/jvm/functions/Function0;
    invoke-static {v10}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v6

    .local v6, "$this$Layout_u24lambda_u240\\45":Landroidx/compose/runtime/Composer;
    const/16 v56, 0x0

    .line 221
    .local v56, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\45\\220\\43":I
    sget-object v57, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v58, v10

    .end local v10    # "$composer\\42":Landroidx/compose/runtime/Composer;
    .local v58, "$composer\\42":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v57 .. v57}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v10

    invoke-static {v6, v4, v10}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 222
    sget-object v10, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v10}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v10

    invoke-static {v6, v8, v10}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 223
    sget-object v10, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v10}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v10

    .local v10, "block\\46":Lkotlin/jvm/functions/Function2;
    const/16 v57, 0x0

    .line 224
    .local v57, "$i$f$set-impl\\46\\223":I
    move-object/from16 v59, v6

    .local v59, "$this$set_impl_u24lambda_u240\\46":Landroidx/compose/runtime/Composer;
    const/16 v60, 0x0

    .line 225
    .local v60, "$i$a$-with-Updater$set$1\\47\\224\\46":I
    invoke-interface/range {v59 .. v59}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v61

    if-nez v61, :cond_1c

    move-object/from16 v61, v4

    .end local v4    # "measurePolicy\\42":Landroidx/compose/ui/layout/MeasurePolicy;
    .local v61, "measurePolicy\\42":Landroidx/compose/ui/layout/MeasurePolicy;
    invoke-interface/range {v59 .. v59}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v67, v8

    .end local v8    # "localMap\\43":Landroidx/compose/runtime/CompositionLocalMap;
    .local v67, "localMap\\43":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static/range {v50 .. v50}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v4, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1b

    goto :goto_14

    :cond_1b
    move-object/from16 v8, v59

    goto :goto_15

    .end local v61    # "measurePolicy\\42":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v67    # "localMap\\43":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v4    # "measurePolicy\\42":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v8    # "localMap\\43":Landroidx/compose/runtime/CompositionLocalMap;
    :cond_1c
    move-object/from16 v61, v4

    move-object/from16 v67, v8

    .line 226
    .end local v4    # "measurePolicy\\42":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v8    # "localMap\\43":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v61    # "measurePolicy\\42":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v67    # "localMap\\43":Landroidx/compose/runtime/CompositionLocalMap;
    :goto_14
    invoke-static/range {v50 .. v50}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v8, v59

    .end local v59    # "$this$set_impl_u24lambda_u240\\46":Landroidx/compose/runtime/Composer;
    .local v8, "$this$set_impl_u24lambda_u240\\46":Landroidx/compose/runtime/Composer;
    invoke-interface {v8, v4}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 227
    invoke-static/range {v50 .. v50}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v6, v4, v10}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 229
    :goto_15
    nop

    .line 224
    .end local v8    # "$this$set_impl_u24lambda_u240\\46":Landroidx/compose/runtime/Composer;
    .end local v60    # "$i$a$-with-Updater$set$1\\47\\224\\46":I
    nop

    .line 229
    nop

    .line 230
    .end local v10    # "block\\46":Lkotlin/jvm/functions/Function2;
    .end local v57    # "$i$f$set-impl\\46\\223":I
    sget-object v4, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v4}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v4

    invoke-static {v6, v9, v4}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 231
    nop

    .line 220
    .end local v6    # "$this$Layout_u24lambda_u240\\45":Landroidx/compose/runtime/Composer;
    .end local v56    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\45\\220\\43":I
    nop

    .line 232
    shr-int/lit8 v4, v55, 0x6

    and-int/lit8 v4, v4, 0xe

    .local v4, "$changed\\48":I
    move-object/from16 v6, v58

    .local v6, "$composer\\48":Landroidx/compose/runtime/Composer;
    const/4 v8, 0x0

    .line 203
    .local v8, "$i$a$-Layout-RowKt$Row$1\\48\\232\\42":I
    const v10, -0x184d8b46

    invoke-static {v6, v10, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v56, Landroidx/compose/foundation/layout/RowScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/RowScopeInstance;

    shr-int/lit8 v57, v21, 0x6

    and-int/lit8 v57, v57, 0x70

    or-int/lit8 v57, v57, 0x6

    .local v57, "$changed\\49":I
    check-cast v56, Landroidx/compose/foundation/layout/RowScope;

    .local v56, "$this$SettingsScreen_u24lambda_u2433_u24lambda_u2432_u24lambda_u2431\\49":Landroidx/compose/foundation/layout/RowScope;
    move-object/from16 v89, v6

    .local v89, "$composer\\49":Landroidx/compose/runtime/Composer;
    const/16 v59, 0x0

    .line 68
    .local v59, "$i$a$-Row-SettingsScreenKt$SettingsScreen$1$6$1\\49\\203\\41":I
    const v10, -0x7121efc8

    move-object/from16 v93, v0

    const-string v0, "C67@3032L14,68@3084L32,68@3063L114:SettingsScreen.kt#4cebsy"

    move/from16 v94, v4

    move-object/from16 v4, v89

    .end local v89    # "$composer\\49":Landroidx/compose/runtime/Composer;
    .local v4, "$composer\\49":Landroidx/compose/runtime/Composer;
    .local v94, "$changed\\48":I
    invoke-static {v4, v10, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-virtual {v2}, Lcom/hardlineforge/lala/data/CustomCategory;->getName()Ljava/lang/String;

    move-result-object v68

    const/16 v91, 0x0

    const v92, 0x1fffe

    const/16 v69, 0x0

    const-wide/16 v70, 0x0

    const-wide/16 v72, 0x0

    const/16 v74, 0x0

    const/16 v75, 0x0

    const/16 v76, 0x0

    const-wide/16 v77, 0x0

    const/16 v79, 0x0

    const/16 v80, 0x0

    const-wide/16 v81, 0x0

    const/16 v83, 0x0

    const/16 v84, 0x0

    const/16 v85, 0x0

    const/16 v86, 0x0

    const/16 v87, 0x0

    const/16 v88, 0x0

    const/16 v90, 0x0

    .end local v4    # "$composer\\49":Landroidx/compose/runtime/Composer;
    .restart local v89    # "$composer\\49":Landroidx/compose/runtime/Composer;
    invoke-static/range {v68 .. v92}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 69
    .end local v89    # "$composer\\49":Landroidx/compose/runtime/Composer;
    .restart local v4    # "$composer\\49":Landroidx/compose/runtime/Composer;
    const v0, 0x67b49b3a

    invoke-static {v4, v0, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v3, v5}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v0

    invoke-interface {v3, v2}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v10

    or-int/2addr v0, v10

    .local v0, "invalid\\50":Z
    move-object v10, v4

    .local v10, "$this$cache\\50":Landroidx/compose/runtime/Composer;
    const/16 v68, 0x0

    .line 233
    .local v68, "$i$f$cache\\50\\69":I
    move/from16 v69, v0

    .end local v0    # "invalid\\50":Z
    .local v69, "invalid\\50":Z
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v0

    .local v0, "it\\50":Ljava/lang/Object;
    const/16 v70, 0x0

    .line 234
    .local v70, "$i$a$-let-ComposerKt$cache$1\\51\\233\\50":I
    if-nez v69, :cond_1e

    sget-object v71, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v81, v3

    .end local v3    # "$composer":Landroidx/compose/runtime/Composer;
    .local v81, "$composer":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v71 .. v71}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v3

    if-ne v0, v3, :cond_1d

    goto :goto_16

    .line 238
    :cond_1d
    goto :goto_17

    .line 234
    .end local v81    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v3    # "$composer":Landroidx/compose/runtime/Composer;
    :cond_1e
    move-object/from16 v81, v3

    .line 235
    .end local v3    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v81    # "$composer":Landroidx/compose/runtime/Composer;
    :goto_16
    const/4 v3, 0x0

    .line 69
    .local v3, "$i$a$-cache-SettingsScreenKt$SettingsScreen$1$6$1$1\\52\\235\\49":I
    move-object/from16 v71, v0

    .end local v0    # "it\\50":Ljava/lang/Object;
    .local v71, "it\\50":Ljava/lang/Object;
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda7;

    invoke-direct {v0, v5, v2}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda7;-><init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Lcom/hardlineforge/lala/data/CustomCategory;)V

    .line 235
    .end local v3    # "$i$a$-cache-SettingsScreenKt$SettingsScreen$1$6$1$1\\52\\235\\49":I
    nop

    .line 236
    .local v0, "value\\51":Ljava/lang/Object;
    invoke-interface {v10, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 237
    nop

    .line 233
    .end local v0    # "value\\51":Ljava/lang/Object;
    .end local v70    # "$i$a$-let-ComposerKt$cache$1\\51\\233\\50":I
    .end local v71    # "it\\50":Ljava/lang/Object;
    :goto_17
    nop

    .line 69
    .end local v10    # "$this$cache\\50":Landroidx/compose/runtime/Composer;
    .end local v68    # "$i$f$cache\\50\\69":I
    .end local v69    # "invalid\\50":Z
    move-object/from16 v68, v0

    check-cast v68, Lkotlin/jvm/functions/Function0;

    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    sget-object v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SettingsScreenKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SettingsScreenKt;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SettingsScreenKt;->getLambda$1145931863$app_debug()Lkotlin/jvm/functions/Function3;

    move-result-object v77

    const/high16 v79, 0x30000000

    const/16 v80, 0x1fe

    const/16 v69, 0x0

    const/16 v70, 0x0

    const/16 v71, 0x0

    const/16 v72, 0x0

    const/16 v73, 0x0

    const/16 v74, 0x0

    const/16 v75, 0x0

    const/16 v76, 0x0

    move-object/from16 v78, v4

    .end local v4    # "$composer\\49":Landroidx/compose/runtime/Composer;
    .local v78, "$composer\\49":Landroidx/compose/runtime/Composer;
    invoke-static/range {v68 .. v80}, Landroidx/compose/material3/ButtonKt;->TextButton(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/graphics/Shape;Landroidx/compose/material3/ButtonColors;Landroidx/compose/material3/ButtonElevation;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/foundation/interaction/MutableInteractionSource;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    .line 68
    .end local v78    # "$composer\\49":Landroidx/compose/runtime/Composer;
    .restart local v4    # "$composer\\49":Landroidx/compose/runtime/Composer;
    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 70
    nop

    .line 203
    .end local v4    # "$composer\\49":Landroidx/compose/runtime/Composer;
    .end local v56    # "$this$SettingsScreen_u24lambda_u2433_u24lambda_u2432_u24lambda_u2431\\49":Landroidx/compose/foundation/layout/RowScope;
    .end local v57    # "$changed\\49":I
    .end local v59    # "$i$a$-Row-SettingsScreenKt$SettingsScreen$1$6$1\\49\\203\\41":I
    invoke-static {v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 232
    .end local v6    # "$composer\\48":Landroidx/compose/runtime/Composer;
    .end local v8    # "$i$a$-Layout-RowKt$Row$1\\48\\232\\42":I
    .end local v94    # "$changed\\48":I
    nop

    .line 239
    invoke-interface/range {v58 .. v58}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 212
    invoke-static/range {v58 .. v58}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 240
    nop

    .line 206
    .end local v52    # "$i$f$ReusableComposeNode\\44\\210":I
    .end local v54    # "factory\\44":Lkotlin/jvm/functions/Function0;
    .end local v55    # "$changed\\44":I
    invoke-static/range {v58 .. v58}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 241
    nop

    .line 200
    .end local v9    # "materialized\\43":Landroidx/compose/ui/Modifier;
    .end local v46    # "$changed\\43":I
    .end local v48    # "$i$f$Layout\\43\\202":I
    .end local v50    # "compositeKeyHash\\43":I
    .end local v53    # "modifier\\43":Landroidx/compose/ui/Modifier;
    .end local v67    # "localMap\\43":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static/range {v58 .. v58}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 242
    nop

    .line 71
    .end local v21    # "$changed\\42":I
    .end local v43    # "modifier\\42":Landroidx/compose/ui/Modifier;
    .end local v44    # "$i$f$Row\\42\\67":I
    .end local v47    # "verticalAlignment\\42":Landroidx/compose/ui/Alignment$Vertical;
    .end local v49    # "horizontalArrangement\\42":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .end local v58    # "$composer\\42":Landroidx/compose/runtime/Composer;
    .end local v61    # "measurePolicy\\42":Landroidx/compose/ui/layout/MeasurePolicy;
    nop

    .line 199
    .end local v2    # "cat\\41":Lcom/hardlineforge/lala/data/CustomCategory;
    .end local v38    # "$i$a$-forEach-SettingsScreenKt$SettingsScreen$1$6\\41\\199\\22":I
    move-object/from16 v9, p0

    move/from16 v10, v16

    move-object/from16 v2, v37

    move-object/from16 v8, v39

    move-object/from16 v4, v40

    move-object/from16 v6, v51

    move-object/from16 v3, v81

    move-object/from16 v0, v93

    .end local v15    # "element\\40":Ljava/lang/Object;
    goto/16 :goto_12

    .line 243
    .end local v16    # "$i$f$forEach\\40\\66":I
    .end local v37    # "cats$delegate\\22":Landroidx/compose/runtime/State;
    .end local v39    # "fontSize$delegate":Landroidx/compose/runtime/MutableState;
    .end local v40    # "accentColor$delegate":Landroidx/compose/runtime/MutableState;
    .end local v81    # "$composer":Landroidx/compose/runtime/Composer;
    .end local p0    # "$this$forEach\\40":Ljava/lang/Iterable;
    .local v2, "cats$delegate\\22":Landroidx/compose/runtime/State;
    .local v3, "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "accentColor$delegate":Landroidx/compose/runtime/MutableState;
    .local v8, "fontSize$delegate":Landroidx/compose/runtime/MutableState;
    .local v9, "$this$forEach\\40":Ljava/lang/Iterable;
    .local v10, "$i$f$forEach\\40\\66":I
    :cond_1f
    move-object/from16 v37, v2

    move-object/from16 v81, v3

    move-object/from16 v40, v4

    move-object/from16 v39, v8

    move-object/from16 p0, v9

    move/from16 v16, v10

    .end local v2    # "cats$delegate\\22":Landroidx/compose/runtime/State;
    .end local v3    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v4    # "accentColor$delegate":Landroidx/compose/runtime/MutableState;
    .end local v8    # "fontSize$delegate":Landroidx/compose/runtime/MutableState;
    .end local v9    # "$this$forEach\\40":Ljava/lang/Iterable;
    .end local v10    # "$i$f$forEach\\40\\66":I
    .restart local v37    # "cats$delegate\\22":Landroidx/compose/runtime/State;
    .restart local v39    # "fontSize$delegate":Landroidx/compose/runtime/MutableState;
    .restart local v40    # "accentColor$delegate":Landroidx/compose/runtime/MutableState;
    .restart local v81    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface {v12}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 19
    invoke-static {v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 73
    .end local v37    # "cats$delegate\\22":Landroidx/compose/runtime/State;
    nop

    .line 114
    .end local v12    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .end local v31    # "$i$a$-Column-SettingsScreenKt$SettingsScreen$1\\22\\114\\0":I
    .end local v33    # "$this$SettingsScreen_u24lambda_u2433\\22":Landroidx/compose/foundation/layout/ColumnScope;
    .end local v64    # "$changed\\22":I
    invoke-static/range {v62 .. v62}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 143
    .end local v30    # "$changed\\21":I
    .end local v62    # "$composer\\21":Landroidx/compose/runtime/Composer;
    .end local v63    # "$i$a$-Layout-ColumnKt$Column$1\\21\\143\\15":I
    nop

    .line 244
    invoke-interface/range {v32 .. v32}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 123
    invoke-static/range {v32 .. v32}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 245
    nop

    .line 117
    .end local v25    # "$i$f$ReusableComposeNode\\17\\121":I
    .end local v27    # "factory\\17":Lkotlin/jvm/functions/Function0;
    .end local v28    # "$changed\\17":I
    invoke-static/range {v32 .. v32}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 246
    nop

    .line 108
    .end local v18    # "$changed\\16":I
    .end local v20    # "$i$f$Layout\\16\\113":I
    .end local v23    # "compositeKeyHash\\16":I
    .end local v26    # "modifier\\16":Landroidx/compose/ui/Modifier;
    .end local v34    # "materialized\\16":Landroidx/compose/ui/Modifier;
    .end local v36    # "localMap\\16":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static/range {v32 .. v32}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 247
    nop

    .end local v19    # "verticalArrangement\\15":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    .end local v22    # "modifier\\15":Landroidx/compose/ui/Modifier;
    .end local v24    # "horizontalAlignment\\15":Landroidx/compose/ui/Alignment$Horizontal;
    .end local v29    # "$changed\\15":I
    .end local v32    # "$composer\\15":Landroidx/compose/runtime/Composer;
    .end local v35    # "$i$f$Column\\15\\18":I
    .end local v65    # "measurePolicy\\15":Landroidx/compose/ui/layout/MeasurePolicy;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 74
    .end local v39    # "fontSize$delegate":Landroidx/compose/runtime/MutableState;
    .end local v40    # "accentColor$delegate":Landroidx/compose/runtime/MutableState;
    .end local v66    # "darkMode$delegate":Landroidx/compose/runtime/MutableState;
    :cond_20
    move/from16 v4, v17

    goto :goto_18

    .line 12
    .end local v5    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .end local v17    # "$dirty":I
    .end local v81    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v3    # "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "$dirty":I
    .local p0, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :cond_21
    move-object/from16 v81, v3

    .end local v3    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v81    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface/range {v81 .. v81}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 74
    .end local p0    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .restart local v5    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :goto_18
    invoke-interface/range {v81 .. v81}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v0

    if-eqz v0, :cond_22

    new-instance v2, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda8;

    move/from16 v3, p2

    invoke-direct {v2, v5, v3, v1}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda8;-><init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;II)V

    invoke-interface {v0, v2}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    goto :goto_19

    :cond_22
    move/from16 v3, p2

    :goto_19
    return-void
.end method

.method private static final SettingsScreen$lambda$1(Landroidx/compose/runtime/MutableState;)Z
    .locals 4
    .param p0, "$darkMode$delegate"    # Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;)Z"
        }
    .end annotation

    .line 14
    move-object v0, p0

    check-cast v0, Landroidx/compose/runtime/State;

    .local v0, "$this$getValue\\1":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "this_\\1":Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "property\\1":Lkotlin/reflect/KProperty;
    const/4 v3, 0x0

    .line 248
    .local v3, "$i$f$getValue\\1\\14":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "$this$getValue\\1":Landroidx/compose/runtime/State;
    .end local v1    # "this_\\1":Ljava/lang/Object;
    .end local v2    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v3    # "$i$f$getValue\\1\\14":I
    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 14
    return v0
.end method

.method private static final SettingsScreen$lambda$2(Landroidx/compose/runtime/MutableState;Z)V
    .locals 5
    .param p0, "$darkMode$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "<set-?>"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;Z)V"
        }
    .end annotation

    .line 14
    const/4 v0, 0x0

    .local v0, "this_\\1":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property\\1":Lkotlin/reflect/KProperty;
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .local v2, "value\\1":Ljava/lang/Object;
    move-object v3, p0

    .local v3, "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    const/4 v4, 0x0

    .line 249
    .local v4, "$i$f$setValue\\1\\14":I
    invoke-interface {v3, v2}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 250
    nop

    .line 14
    .end local v0    # "this_\\1":Ljava/lang/Object;
    .end local v1    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v2    # "value\\1":Ljava/lang/Object;
    .end local v3    # "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    .end local v4    # "$i$f$setValue\\1\\14":I
    return-void
.end method

.method static final SettingsScreen$lambda$33$lambda$11$lambda$10$lambda$9(Landroidx/compose/runtime/MutableState;Z)Lkotlin/Unit;
    .locals 1
    .param p0, "$darkMode$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "it"    # Z

    .line 25
    invoke-static {p0, p1}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt;->SettingsScreen$lambda$2(Landroidx/compose/runtime/MutableState;Z)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final SettingsScreen$lambda$33$lambda$17(Landroidx/compose/runtime/MutableState;Landroidx/compose/material3/SingleChoiceSegmentedButtonRowScope;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 23
    .param p0, "$fontSize$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "$this$SingleChoiceSegmentedButtonRow"    # Landroidx/compose/material3/SingleChoiceSegmentedButtonRowScope;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    move-object/from16 v0, p1

    move-object/from16 v11, p2

    const-string v1, "$this$SingleChoiceSegmentedButtonRow"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "C*32@1534L19,33@1597L6,34@1629L50,30@1438L241:SettingsScreen.kt#4cebsy"

    invoke-static {v11, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v1, p3

    .local v1, "$dirty":I
    and-int/lit8 v2, p3, 0x6

    const/4 v3, 0x4

    const/4 v4, 0x2

    if-nez v2, :cond_1

    invoke-interface {v11, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    or-int/2addr v1, v2

    :cond_1
    move v15, v1

    .end local v1    # "$dirty":I
    .local v15, "$dirty":I
    and-int/lit8 v1, v15, 0x13

    const/16 v2, 0x12

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq v1, v2, :cond_2

    move v1, v6

    goto :goto_1

    :cond_2
    move v1, v5

    :goto_1
    and-int/lit8 v2, v15, 0x1

    invoke-interface {v11, v1, v2}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, -0x1

    const-string v2, "com.hardlineforge.lala.ui.screens.SettingsScreen.<anonymous>.<anonymous> (SettingsScreen.kt:29)"

    const v7, -0x7fde9231

    invoke-static {v7, v15, v1, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 30
    :cond_3
    new-array v1, v3, [Ljava/lang/String;

    const-string v2, "small"

    aput-object v2, v1, v5

    const-string v2, "default"

    aput-object v2, v1, v6

    const-string v2, "large"

    aput-object v2, v1, v4

    const/4 v2, 0x3

    const-string v3, "xlarge"

    aput-object v3, v1, v2

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Ljava/lang/Iterable;

    .local v16, "$this$forEach\\1":Ljava/lang/Iterable;
    const/16 v17, 0x0

    .line 258
    .local v17, "$i$f$forEach\\1\\30":I
    invoke-interface/range {v16 .. v16}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_2
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    .local v19, "element\\1":Ljava/lang/Object;
    move-object/from16 v1, v19

    check-cast v1, Ljava/lang/String;

    .local v1, "size\\2":Ljava/lang/String;
    const/16 v20, 0x0

    .line 31
    .local v20, "$i$a$-forEach-SettingsScreenKt$SettingsScreen$1$2$1\\2\\258\\0":I
    nop

    .line 32
    invoke-static/range {p0 .. p0}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt;->SettingsScreen$lambda$4(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    .line 33
    const v3, 0x5d44e312

    const-string v4, "CC(remember):SettingsScreen.kt#9igjgp"

    invoke-static {v11, v3, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v11, v1}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v3

    .local v3, "invalid\\3":Z
    move-object/from16 v4, p2

    .local v4, "$this$cache\\3":Landroidx/compose/runtime/Composer;
    const/4 v5, 0x0

    .line 259
    .local v5, "$i$f$cache\\3\\33":I
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v7

    .local v7, "it\\3":Ljava/lang/Object;
    const/4 v8, 0x0

    .line 260
    .local v8, "$i$a$-let-ComposerKt$cache$1\\4\\259\\3":I
    if-nez v3, :cond_5

    sget-object v9, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v9}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v9

    if-ne v7, v9, :cond_4

    goto :goto_3

    .line 264
    :cond_4
    move-object/from16 v12, p0

    goto :goto_4

    .line 261
    :cond_5
    :goto_3
    const/4 v9, 0x0

    .line 33
    .local v9, "$i$a$-cache-SettingsScreenKt$SettingsScreen$1$2$1$1\\5\\261\\2":I
    new-instance v10, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda9;

    move-object/from16 v12, p0

    invoke-direct {v10, v1, v12}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda9;-><init>(Ljava/lang/String;Landroidx/compose/runtime/MutableState;)V

    .line 261
    .end local v9    # "$i$a$-cache-SettingsScreenKt$SettingsScreen$1$2$1$1\\5\\261\\2":I
    nop

    .line 262
    .local v10, "value\\4":Ljava/lang/Object;
    invoke-interface {v4, v10}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 263
    move-object v7, v10

    .line 259
    .end local v7    # "it\\3":Ljava/lang/Object;
    .end local v8    # "$i$a$-let-ComposerKt$cache$1\\4\\259\\3":I
    .end local v10    # "value\\4":Ljava/lang/Object;
    :goto_4
    nop

    .line 33
    .end local v3    # "invalid\\3":Z
    .end local v4    # "$this$cache\\3":Landroidx/compose/runtime/Composer;
    .end local v5    # "$i$f$cache\\3\\33":I
    check-cast v7, Lkotlin/jvm/functions/Function0;

    invoke-static {v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 34
    sget-object v3, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v4, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v3, v11, v4}, Landroidx/compose/material3/MaterialTheme;->getShapes(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Shapes;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material3/Shapes;->getMedium()Landroidx/compose/foundation/shape/CornerBasedShape;

    move-result-object v3

    check-cast v3, Landroidx/compose/ui/graphics/Shape;

    .line 35
    new-instance v4, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda10;

    invoke-direct {v4, v1}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda10;-><init>(Ljava/lang/String;)V

    const/16 v5, 0x36

    const v8, 0x696e84cf

    invoke-static {v8, v6, v4, v11, v5}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lkotlin/jvm/functions/Function2;

    and-int/lit8 v12, v15, 0xe

    .line 31
    const/4 v4, 0x0

    const/4 v5, 0x0

    move v8, v6

    const/4 v6, 0x0

    move-object v9, v1

    move v1, v2

    move-object v2, v7

    .end local v1    # "size\\2":Ljava/lang/String;
    .local v9, "size\\2":Ljava/lang/String;
    const/4 v7, 0x0

    move v13, v8

    const/4 v8, 0x0

    move-object v14, v9

    .end local v9    # "size\\2":Ljava/lang/String;
    .local v14, "size\\2":Ljava/lang/String;
    const/4 v9, 0x0

    move/from16 v21, v13

    const/4 v13, 0x6

    move-object/from16 v22, v14

    .end local v14    # "size\\2":Ljava/lang/String;
    .local v22, "size\\2":Ljava/lang/String;
    const/16 v14, 0x1f8

    invoke-static/range {v0 .. v14}, Landroidx/compose/material3/SegmentedButtonKt;->SegmentedButton(Landroidx/compose/material3/SingleChoiceSegmentedButtonRowScope;ZLkotlin/jvm/functions/Function0;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/ui/Modifier;ZLandroidx/compose/material3/SegmentedButtonColors;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/foundation/interaction/MutableInteractionSource;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;III)V

    .line 36
    nop

    .line 258
    .end local v20    # "$i$a$-forEach-SettingsScreenKt$SettingsScreen$1$2$1\\2\\258\\0":I
    .end local v22    # "size\\2":Ljava/lang/String;
    move-object/from16 v0, p1

    move-object/from16 v11, p2

    move/from16 v6, v21

    .end local v19    # "element\\1":Ljava/lang/Object;
    goto/16 :goto_2

    .line 265
    :cond_6
    nop

    .end local v16    # "$this$forEach\\1":Ljava/lang/Iterable;
    .end local v17    # "$i$f$forEach\\1\\30":I
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_5

    .line 29
    :cond_7
    invoke-interface/range {p2 .. p2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 37
    :cond_8
    :goto_5
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final SettingsScreen$lambda$33$lambda$17$lambda$16$lambda$13$lambda$12(Ljava/lang/String;Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;
    .locals 1
    .param p0, "$size"    # Ljava/lang/String;
    .param p1, "$fontSize$delegate"    # Landroidx/compose/runtime/MutableState;

    .line 33
    invoke-static {p1, p0}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt;->SettingsScreen$lambda$5(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final SettingsScreen$lambda$33$lambda$17$lambda$16$lambda$15(Ljava/lang/String;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 26
    .param p0, "$size"    # Ljava/lang/String;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    const-string v3, "C34@1631L46:SettingsScreen.kt#4cebsy"

    invoke-static {v1, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v3, v2, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq v3, v4, :cond_0

    move v3, v6

    goto :goto_0

    :cond_0
    move v3, v5

    :goto_0
    and-int/lit8 v4, v2, 0x1

    invoke-interface {v1, v3, v4}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v3, -0x1

    const-string v4, "com.hardlineforge.lala.ui.screens.SettingsScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous> (SettingsScreen.kt:34)"

    const v7, 0x696e84cf

    invoke-static {v7, v2, v3, v4}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 35
    :cond_1
    move-object v3, v0

    check-cast v3, Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-lez v3, :cond_2

    move v3, v6

    goto :goto_1

    :cond_2
    move v3, v5

    :goto_1
    if-eqz v3, :cond_3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 257
    nop

    .local v4, "it\\1":C
    const/4 v5, 0x0

    .line 35
    .local v5, "$i$a$-replaceFirstCharWithCharSequence-SettingsScreenKt$SettingsScreen$1$2$1$2$1\\1\\35\\0":I
    invoke-static {v4}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v7

    const-string v8, "null cannot be cast to non-null type java.lang.String"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v7, v8}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "toUpperCase(...)"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v7, Ljava/lang/CharSequence;

    .end local v4    # "it\\1":C
    .end local v5    # "$i$a$-replaceFirstCharWithCharSequence-SettingsScreenKt$SettingsScreen$1$2$1$2$1\\1\\35\\0":I
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "substring(...)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    :cond_3
    move-object v3, v0

    :goto_2
    const/16 v24, 0x0

    const v25, 0x1fffe

    const/4 v2, 0x0

    move-object v1, v3

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-wide/16 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v23, 0x0

    move-object/from16 v22, p1

    invoke-static/range {v1 .. v25}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_3

    :cond_4
    invoke-interface/range {p1 .. p1}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    :cond_5
    :goto_3
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method static final SettingsScreen$lambda$33$lambda$23(Landroidx/compose/runtime/MutableState;Landroidx/compose/material3/SingleChoiceSegmentedButtonRowScope;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 23
    .param p0, "$accentColor$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "$this$SingleChoiceSegmentedButtonRow"    # Landroidx/compose/material3/SingleChoiceSegmentedButtonRowScope;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    move-object/from16 v0, p1

    move-object/from16 v11, p2

    const-string v1, "$this$SingleChoiceSegmentedButtonRow"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "C*43@2011L23,44@2078L6,45@2110L51,41@1911L250:SettingsScreen.kt#4cebsy"

    invoke-static {v11, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v1, p3

    .local v1, "$dirty":I
    and-int/lit8 v2, p3, 0x6

    const/4 v3, 0x4

    const/4 v4, 0x2

    if-nez v2, :cond_1

    invoke-interface {v11, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    or-int/2addr v1, v2

    :cond_1
    move v15, v1

    .end local v1    # "$dirty":I
    .local v15, "$dirty":I
    and-int/lit8 v1, v15, 0x13

    const/16 v2, 0x12

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq v1, v2, :cond_2

    move v1, v6

    goto :goto_1

    :cond_2
    move v1, v5

    :goto_1
    and-int/lit8 v2, v15, 0x1

    invoke-interface {v11, v1, v2}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, -0x1

    const-string v2, "com.hardlineforge.lala.ui.screens.SettingsScreen.<anonymous>.<anonymous> (SettingsScreen.kt:40)"

    const v7, -0x7d1a5e48

    invoke-static {v7, v15, v1, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 41
    :cond_3
    new-array v1, v3, [Ljava/lang/String;

    const-string v2, "blue"

    aput-object v2, v1, v5

    const-string v2, "green"

    aput-object v2, v1, v6

    const-string v2, "purple"

    aput-object v2, v1, v4

    const/4 v2, 0x3

    const-string v3, "orange"

    aput-object v3, v1, v2

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Ljava/lang/Iterable;

    .local v16, "$this$forEach\\1":Ljava/lang/Iterable;
    const/16 v17, 0x0

    .line 266
    .local v17, "$i$f$forEach\\1\\41":I
    invoke-interface/range {v16 .. v16}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_2
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    .local v19, "element\\1":Ljava/lang/Object;
    move-object/from16 v1, v19

    check-cast v1, Ljava/lang/String;

    .local v1, "color\\2":Ljava/lang/String;
    const/16 v20, 0x0

    .line 42
    .local v20, "$i$a$-forEach-SettingsScreenKt$SettingsScreen$1$3$1\\2\\266\\0":I
    nop

    .line 43
    invoke-static/range {p0 .. p0}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt;->SettingsScreen$lambda$7(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    .line 44
    const v3, -0x13a4eaa1

    const-string v4, "CC(remember):SettingsScreen.kt#9igjgp"

    invoke-static {v11, v3, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v11, v1}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v3

    .local v3, "invalid\\3":Z
    move-object/from16 v4, p2

    .local v4, "$this$cache\\3":Landroidx/compose/runtime/Composer;
    const/4 v5, 0x0

    .line 267
    .local v5, "$i$f$cache\\3\\44":I
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v7

    .local v7, "it\\3":Ljava/lang/Object;
    const/4 v8, 0x0

    .line 268
    .local v8, "$i$a$-let-ComposerKt$cache$1\\4\\267\\3":I
    if-nez v3, :cond_5

    sget-object v9, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v9}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v9

    if-ne v7, v9, :cond_4

    goto :goto_3

    .line 272
    :cond_4
    move-object/from16 v12, p0

    goto :goto_4

    .line 269
    :cond_5
    :goto_3
    const/4 v9, 0x0

    .line 44
    .local v9, "$i$a$-cache-SettingsScreenKt$SettingsScreen$1$3$1$1\\5\\269\\2":I
    new-instance v10, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda0;

    move-object/from16 v12, p0

    invoke-direct {v10, v1, v12}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;Landroidx/compose/runtime/MutableState;)V

    .line 269
    .end local v9    # "$i$a$-cache-SettingsScreenKt$SettingsScreen$1$3$1$1\\5\\269\\2":I
    nop

    .line 270
    .local v10, "value\\4":Ljava/lang/Object;
    invoke-interface {v4, v10}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 271
    move-object v7, v10

    .line 267
    .end local v7    # "it\\3":Ljava/lang/Object;
    .end local v8    # "$i$a$-let-ComposerKt$cache$1\\4\\267\\3":I
    .end local v10    # "value\\4":Ljava/lang/Object;
    :goto_4
    nop

    .line 44
    .end local v3    # "invalid\\3":Z
    .end local v4    # "$this$cache\\3":Landroidx/compose/runtime/Composer;
    .end local v5    # "$i$f$cache\\3\\44":I
    check-cast v7, Lkotlin/jvm/functions/Function0;

    invoke-static {v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 45
    sget-object v3, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v4, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v3, v11, v4}, Landroidx/compose/material3/MaterialTheme;->getShapes(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Shapes;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material3/Shapes;->getMedium()Landroidx/compose/foundation/shape/CornerBasedShape;

    move-result-object v3

    check-cast v3, Landroidx/compose/ui/graphics/Shape;

    .line 46
    new-instance v4, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda1;

    invoke-direct {v4, v1}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;)V

    const/16 v5, 0x36

    const v8, 0x4d48f8b8    # 2.1073395E8f

    invoke-static {v8, v6, v4, v11, v5}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lkotlin/jvm/functions/Function2;

    and-int/lit8 v12, v15, 0xe

    .line 42
    const/4 v4, 0x0

    const/4 v5, 0x0

    move v8, v6

    const/4 v6, 0x0

    move-object v9, v1

    move v1, v2

    move-object v2, v7

    .end local v1    # "color\\2":Ljava/lang/String;
    .local v9, "color\\2":Ljava/lang/String;
    const/4 v7, 0x0

    move v13, v8

    const/4 v8, 0x0

    move-object v14, v9

    .end local v9    # "color\\2":Ljava/lang/String;
    .local v14, "color\\2":Ljava/lang/String;
    const/4 v9, 0x0

    move/from16 v21, v13

    const/4 v13, 0x6

    move-object/from16 v22, v14

    .end local v14    # "color\\2":Ljava/lang/String;
    .local v22, "color\\2":Ljava/lang/String;
    const/16 v14, 0x1f8

    invoke-static/range {v0 .. v14}, Landroidx/compose/material3/SegmentedButtonKt;->SegmentedButton(Landroidx/compose/material3/SingleChoiceSegmentedButtonRowScope;ZLkotlin/jvm/functions/Function0;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/ui/Modifier;ZLandroidx/compose/material3/SegmentedButtonColors;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/foundation/interaction/MutableInteractionSource;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;III)V

    .line 47
    nop

    .line 266
    .end local v20    # "$i$a$-forEach-SettingsScreenKt$SettingsScreen$1$3$1\\2\\266\\0":I
    .end local v22    # "color\\2":Ljava/lang/String;
    move-object/from16 v0, p1

    move-object/from16 v11, p2

    move/from16 v6, v21

    .end local v19    # "element\\1":Ljava/lang/Object;
    goto/16 :goto_2

    .line 273
    :cond_6
    nop

    .end local v16    # "$this$forEach\\1":Ljava/lang/Iterable;
    .end local v17    # "$i$f$forEach\\1\\41":I
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_5

    .line 40
    :cond_7
    invoke-interface/range {p2 .. p2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 48
    :cond_8
    :goto_5
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final SettingsScreen$lambda$33$lambda$23$lambda$22$lambda$19$lambda$18(Ljava/lang/String;Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;
    .locals 1
    .param p0, "$color"    # Ljava/lang/String;
    .param p1, "$accentColor$delegate"    # Landroidx/compose/runtime/MutableState;

    .line 44
    invoke-static {p1, p0}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt;->SettingsScreen$lambda$8(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final SettingsScreen$lambda$33$lambda$23$lambda$22$lambda$21(Ljava/lang/String;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 26
    .param p0, "$color"    # Ljava/lang/String;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    const-string v3, "C45@2112L47:SettingsScreen.kt#4cebsy"

    invoke-static {v1, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v3, v2, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq v3, v4, :cond_0

    move v3, v6

    goto :goto_0

    :cond_0
    move v3, v5

    :goto_0
    and-int/lit8 v4, v2, 0x1

    invoke-interface {v1, v3, v4}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v3, -0x1

    const-string v4, "com.hardlineforge.lala.ui.screens.SettingsScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous> (SettingsScreen.kt:45)"

    const v7, 0x4d48f8b8    # 2.1073395E8f

    invoke-static {v7, v2, v3, v4}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 46
    :cond_1
    move-object v3, v0

    check-cast v3, Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-lez v3, :cond_2

    move v3, v6

    goto :goto_1

    :cond_2
    move v3, v5

    :goto_1
    if-eqz v3, :cond_3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 257
    nop

    .local v4, "it\\1":C
    const/4 v5, 0x0

    .line 46
    .local v5, "$i$a$-replaceFirstCharWithCharSequence-SettingsScreenKt$SettingsScreen$1$3$1$2$1\\1\\46\\0":I
    invoke-static {v4}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v7

    const-string v8, "null cannot be cast to non-null type java.lang.String"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v7, v8}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "toUpperCase(...)"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v7, Ljava/lang/CharSequence;

    .end local v4    # "it\\1":C
    .end local v5    # "$i$a$-replaceFirstCharWithCharSequence-SettingsScreenKt$SettingsScreen$1$3$1$2$1\\1\\46\\0":I
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "substring(...)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    :cond_3
    move-object v3, v0

    :goto_2
    const/16 v24, 0x0

    const v25, 0x1fffe

    const/4 v2, 0x0

    move-object v1, v3

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-wide/16 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v23, 0x0

    move-object/from16 v22, p1

    invoke-static/range {v1 .. v25}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_3

    :cond_4
    invoke-interface/range {p1 .. p1}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    :cond_5
    :goto_3
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method static final SettingsScreen$lambda$33$lambda$25$lambda$24()Lkotlin/Unit;
    .locals 1

    .line 54
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final SettingsScreen$lambda$33$lambda$27$lambda$26()Lkotlin/Unit;
    .locals 1

    .line 57
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final SettingsScreen$lambda$33$lambda$28(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 4
    .param p0, "$cats$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "+",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/CustomCategory;",
            ">;>;)",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/CustomCategory;",
            ">;"
        }
    .end annotation

    .line 65
    const/4 v0, 0x0

    .local v0, "this_\\1":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property\\1":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue\\1":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 274
    .local v3, "$i$f$getValue\\1\\65":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "this_\\1":Ljava/lang/Object;
    .end local v1    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue\\1":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue\\1\\65":I
    check-cast v0, Ljava/util/List;

    .line 65
    return-object v0
.end method

.method static final SettingsScreen$lambda$33$lambda$32$lambda$31$lambda$30$lambda$29(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Lcom/hardlineforge/lala/data/CustomCategory;)Lkotlin/Unit;
    .locals 1
    .param p0, "$vm"    # Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .param p1, "$cat"    # Lcom/hardlineforge/lala/data/CustomCategory;

    .line 69
    invoke-virtual {p0, p1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->deleteCustomCategory(Lcom/hardlineforge/lala/data/CustomCategory;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final SettingsScreen$lambda$34(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 1

    or-int/lit8 v0, p1, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v0

    invoke-static {p0, p3, v0, p2}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt;->SettingsScreen(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final SettingsScreen$lambda$4(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;
    .locals 4
    .param p0, "$fontSize$delegate"    # Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 15
    move-object v0, p0

    check-cast v0, Landroidx/compose/runtime/State;

    .local v0, "$this$getValue\\1":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "this_\\1":Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "property\\1":Lkotlin/reflect/KProperty;
    const/4 v3, 0x0

    .line 251
    .local v3, "$i$f$getValue\\1\\15":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "$this$getValue\\1":Landroidx/compose/runtime/State;
    .end local v1    # "this_\\1":Ljava/lang/Object;
    .end local v2    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v3    # "$i$f$getValue\\1\\15":I
    check-cast v0, Ljava/lang/String;

    .line 15
    return-object v0
.end method

.method private static final SettingsScreen$lambda$5(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V
    .locals 5
    .param p0, "$fontSize$delegate"    # Landroidx/compose/runtime/MutableState;
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

    .line 15
    const/4 v0, 0x0

    .local v0, "this_\\1":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property\\1":Lkotlin/reflect/KProperty;
    move-object v2, p1

    .local v2, "value\\1":Ljava/lang/Object;
    move-object v3, p0

    .local v3, "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    const/4 v4, 0x0

    .line 252
    .local v4, "$i$f$setValue\\1\\15":I
    invoke-interface {v3, v2}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 253
    nop

    .line 15
    .end local v0    # "this_\\1":Ljava/lang/Object;
    .end local v1    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v2    # "value\\1":Ljava/lang/Object;
    .end local v3    # "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    .end local v4    # "$i$f$setValue\\1\\15":I
    return-void
.end method

.method private static final SettingsScreen$lambda$7(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;
    .locals 4
    .param p0, "$accentColor$delegate"    # Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 16
    move-object v0, p0

    check-cast v0, Landroidx/compose/runtime/State;

    .local v0, "$this$getValue\\1":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "this_\\1":Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "property\\1":Lkotlin/reflect/KProperty;
    const/4 v3, 0x0

    .line 254
    .local v3, "$i$f$getValue\\1\\16":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "$this$getValue\\1":Landroidx/compose/runtime/State;
    .end local v1    # "this_\\1":Ljava/lang/Object;
    .end local v2    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v3    # "$i$f$getValue\\1\\16":I
    check-cast v0, Ljava/lang/String;

    .line 16
    return-object v0
.end method

.method private static final SettingsScreen$lambda$8(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V
    .locals 5
    .param p0, "$accentColor$delegate"    # Landroidx/compose/runtime/MutableState;
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

    .line 16
    const/4 v0, 0x0

    .local v0, "this_\\1":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property\\1":Lkotlin/reflect/KProperty;
    move-object v2, p1

    .local v2, "value\\1":Ljava/lang/Object;
    move-object v3, p0

    .local v3, "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    const/4 v4, 0x0

    .line 255
    .local v4, "$i$f$setValue\\1\\16":I
    invoke-interface {v3, v2}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 256
    nop

    .line 16
    .end local v0    # "this_\\1":Ljava/lang/Object;
    .end local v1    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v2    # "value\\1":Ljava/lang/Object;
    .end local v3    # "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    .end local v4    # "$i$f$setValue\\1\\16":I
    return-void
.end method
