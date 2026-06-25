.class public final synthetic Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt;"
    method = "TimelineCard$lambda$18$lambda$17"
    proto = "(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/data/LogEntry;)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/navigation/NavHostController;

.field public final synthetic f$1:Lcom/hardlineforge/lala/data/LogEntry;


# direct methods
.method public synthetic constructor <init>(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/data/LogEntry;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda5;->f$0:Landroidx/navigation/NavHostController;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda5;->f$1:Lcom/hardlineforge/lala/data/LogEntry;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda5;->f$0:Landroidx/navigation/NavHostController;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda5;->f$1:Lcom/hardlineforge/lala/data/LogEntry;

    invoke-static {v0, v1}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt;->TimelineCard$lambda$18$lambda$17(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/data/LogEntry;)Lkotlin/Unit;

    move-result-object v0

    return-object v0
.end method
