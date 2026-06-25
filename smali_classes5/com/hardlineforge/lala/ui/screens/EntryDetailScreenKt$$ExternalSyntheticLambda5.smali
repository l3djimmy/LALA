.class public final synthetic Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt;"
    method = "EntryDetailScreen$lambda$30$lambda$29"
    proto = "(Lcom/hardlineforge/lala/data/LogEntry;Landroidx/navigation/NavHostController;Ljava/lang/String;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/hardlineforge/lala/data/LogEntry;

.field public final synthetic f$1:Landroidx/navigation/NavHostController;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Landroidx/compose/runtime/State;

.field public final synthetic f$4:Landroidx/compose/runtime/State;

.field public final synthetic f$5:Landroidx/compose/runtime/State;


# direct methods
.method public synthetic constructor <init>(Lcom/hardlineforge/lala/data/LogEntry;Landroidx/navigation/NavHostController;Ljava/lang/String;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt$$ExternalSyntheticLambda5;->f$0:Lcom/hardlineforge/lala/data/LogEntry;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt$$ExternalSyntheticLambda5;->f$1:Landroidx/navigation/NavHostController;

    iput-object p3, p0, Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt$$ExternalSyntheticLambda5;->f$2:Ljava/lang/String;

    iput-object p4, p0, Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt$$ExternalSyntheticLambda5;->f$3:Landroidx/compose/runtime/State;

    iput-object p5, p0, Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt$$ExternalSyntheticLambda5;->f$4:Landroidx/compose/runtime/State;

    iput-object p6, p0, Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt$$ExternalSyntheticLambda5;->f$5:Landroidx/compose/runtime/State;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    .line 0
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt$$ExternalSyntheticLambda5;->f$0:Lcom/hardlineforge/lala/data/LogEntry;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt$$ExternalSyntheticLambda5;->f$1:Landroidx/navigation/NavHostController;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt$$ExternalSyntheticLambda5;->f$2:Ljava/lang/String;

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt$$ExternalSyntheticLambda5;->f$3:Landroidx/compose/runtime/State;

    iget-object v4, p0, Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt$$ExternalSyntheticLambda5;->f$4:Landroidx/compose/runtime/State;

    iget-object v5, p0, Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt$$ExternalSyntheticLambda5;->f$5:Landroidx/compose/runtime/State;

    move-object v6, p1

    check-cast v6, Landroidx/compose/foundation/layout/PaddingValues;

    move-object v7, p2

    check-cast v7, Landroidx/compose/runtime/Composer;

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-static/range {v0 .. v8}, Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt;->EntryDetailScreen$lambda$30$lambda$29(Lcom/hardlineforge/lala/data/LogEntry;Landroidx/navigation/NavHostController;Ljava/lang/String;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
