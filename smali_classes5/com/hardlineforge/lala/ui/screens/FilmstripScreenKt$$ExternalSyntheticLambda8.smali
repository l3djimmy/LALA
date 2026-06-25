.class public final synthetic Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt;"
    method = "FilmstripScreen$lambda$21"
    proto = "(Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/compose/runtime/MutableState;

.field public final synthetic f$1:Landroidx/compose/runtime/MutableState;

.field public final synthetic f$2:Landroidx/compose/runtime/MutableState;


# direct methods
.method public synthetic constructor <init>(Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$$ExternalSyntheticLambda8;->f$0:Landroidx/compose/runtime/MutableState;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$$ExternalSyntheticLambda8;->f$1:Landroidx/compose/runtime/MutableState;

    iput-object p3, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$$ExternalSyntheticLambda8;->f$2:Landroidx/compose/runtime/MutableState;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 0
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$$ExternalSyntheticLambda8;->f$0:Landroidx/compose/runtime/MutableState;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$$ExternalSyntheticLambda8;->f$1:Landroidx/compose/runtime/MutableState;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$$ExternalSyntheticLambda8;->f$2:Landroidx/compose/runtime/MutableState;

    move-object v3, p1

    check-cast v3, Landroidx/compose/foundation/layout/PaddingValues;

    move-object v4, p2

    check-cast v4, Landroidx/compose/runtime/Composer;

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-static/range {v0 .. v5}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt;->FilmstripScreen$lambda$21(Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
