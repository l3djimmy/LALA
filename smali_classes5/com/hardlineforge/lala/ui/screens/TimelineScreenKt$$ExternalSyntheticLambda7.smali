.class public final synthetic Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt;"
    method = "TimelineCard$lambda$25"
    proto = "(Lcom/hardlineforge/lala/data/LogEntry;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/hardlineforge/lala/data/LogEntry;

.field public final synthetic f$1:Landroidx/navigation/NavHostController;

.field public final synthetic f$2:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

.field public final synthetic f$3:I


# direct methods
.method public synthetic constructor <init>(Lcom/hardlineforge/lala/data/LogEntry;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda7;->f$0:Lcom/hardlineforge/lala/data/LogEntry;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda7;->f$1:Landroidx/navigation/NavHostController;

    iput-object p3, p0, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda7;->f$2:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iput p4, p0, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda7;->f$3:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 0
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda7;->f$0:Lcom/hardlineforge/lala/data/LogEntry;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda7;->f$1:Landroidx/navigation/NavHostController;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda7;->f$2:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iget v3, p0, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda7;->f$3:I

    move-object v4, p1

    check-cast v4, Landroidx/compose/runtime/Composer;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-static/range {v0 .. v5}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt;->TimelineCard$lambda$25(Lcom/hardlineforge/lala/data/LogEntry;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
