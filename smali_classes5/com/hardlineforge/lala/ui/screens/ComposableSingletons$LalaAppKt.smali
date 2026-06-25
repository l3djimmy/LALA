.class public final Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;
.super Ljava/lang/Object;
.source "LalaApp.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;

.field private static lambda$-1442630731:Lkotlin/jvm/functions/Function4;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function4<",
            "Landroidx/compose/animation/AnimatedContentScope;",
            "Landroidx/navigation/NavBackStackEntry;",
            "Landroidx/compose/runtime/Composer;",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field private static lambda$-661289448:Lkotlin/jvm/functions/Function4;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function4<",
            "Landroidx/compose/animation/AnimatedContentScope;",
            "Landroidx/navigation/NavBackStackEntry;",
            "Landroidx/compose/runtime/Composer;",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;

    invoke-direct {v0}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;-><init>()V

    sput-object v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;

    .line 58
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt$$ExternalSyntheticLambda0;-><init>()V

    const v1, -0x276a79e8

    const/4 v2, 0x0

    invoke-static {v1, v2, v0}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    check-cast v0, Lkotlin/jvm/functions/Function4;

    sput-object v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;->lambda$-661289448:Lkotlin/jvm/functions/Function4;

    .line 61
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt$$ExternalSyntheticLambda1;-><init>()V

    const v1, -0x55fccc4b

    invoke-static {v1, v2, v0}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    check-cast v0, Lkotlin/jvm/functions/Function4;

    sput-object v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;->lambda$-1442630731:Lkotlin/jvm/functions/Function4;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static final lambda__1442630731$lambda$1(Landroidx/compose/animation/AnimatedContentScope;Landroidx/navigation/NavBackStackEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 3
    .param p0, "$this$composable"    # Landroidx/compose/animation/AnimatedContentScope;
    .param p1, "it"    # Landroidx/navigation/NavBackStackEntry;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    const-string v0, "$this$composable"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "C60@2434L16:LalaApp.kt#4cebsy"

    invoke-static {p2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$LalaAppKt.lambda$-1442630731.<anonymous> (LalaApp.kt:60)"

    const v2, -0x55fccc4b

    invoke-static {v2, p3, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 61
    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, p2, v1, v2}, Lcom/hardlineforge/lala/ui/screens/SettingsScreenKt;->SettingsScreen(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final lambda__661289448$lambda$0(Landroidx/compose/animation/AnimatedContentScope;Landroidx/navigation/NavBackStackEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 3
    .param p0, "$this$composable"    # Landroidx/compose/animation/AnimatedContentScope;
    .param p1, "it"    # Landroidx/navigation/NavBackStackEntry;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    const-string v0, "$this$composable"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "C57@2222L15:LalaApp.kt#4cebsy"

    invoke-static {p2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$LalaAppKt.lambda$-661289448.<anonymous> (LalaApp.kt:57)"

    const v2, -0x276a79e8

    invoke-static {v2, p3, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 58
    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, p2, v1, v2}, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt;->MapViewScreen(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method


# virtual methods
.method public final getLambda$-1442630731$app_debug()Lkotlin/jvm/functions/Function4;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function4<",
            "Landroidx/compose/animation/AnimatedContentScope;",
            "Landroidx/navigation/NavBackStackEntry;",
            "Landroidx/compose/runtime/Composer;",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;->lambda$-1442630731:Lkotlin/jvm/functions/Function4;

    return-object v0
.end method

.method public final getLambda$-661289448$app_debug()Lkotlin/jvm/functions/Function4;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function4<",
            "Landroidx/compose/animation/AnimatedContentScope;",
            "Landroidx/navigation/NavBackStackEntry;",
            "Landroidx/compose/runtime/Composer;",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;->lambda$-661289448:Lkotlin/jvm/functions/Function4;

    return-object v0
.end method
