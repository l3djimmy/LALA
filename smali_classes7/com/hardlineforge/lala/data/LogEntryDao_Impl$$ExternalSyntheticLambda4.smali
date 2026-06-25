.class public final synthetic Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/data/LogEntryDao_Impl;"
    method = "update$lambda$2"
    proto = "(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Lcom/hardlineforge/lala/data/LogEntry;Landroidx/sqlite/SQLiteConnection;)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/hardlineforge/lala/data/LogEntryDao_Impl;

.field public final synthetic f$1:Lcom/hardlineforge/lala/data/LogEntry;


# direct methods
.method public synthetic constructor <init>(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Lcom/hardlineforge/lala/data/LogEntry;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda4;->f$0:Lcom/hardlineforge/lala/data/LogEntryDao_Impl;

    iput-object p2, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda4;->f$1:Lcom/hardlineforge/lala/data/LogEntry;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda4;->f$0:Lcom/hardlineforge/lala/data/LogEntryDao_Impl;

    iget-object v1, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda4;->f$1:Lcom/hardlineforge/lala/data/LogEntry;

    check-cast p1, Landroidx/sqlite/SQLiteConnection;

    invoke-static {v0, v1, p1}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->update$lambda$2(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Lcom/hardlineforge/lala/data/LogEntry;Landroidx/sqlite/SQLiteConnection;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
