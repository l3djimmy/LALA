.class public final synthetic Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/data/LogEntryDao_Impl;"
    method = "getByDateRange$lambda$7"
    proto = "(Ljava/lang/String;Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Ljava/time/Instant;Ljava/time/Instant;Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Lcom/hardlineforge/lala/data/LogEntryDao_Impl;

.field public final synthetic f$2:Ljava/time/Instant;

.field public final synthetic f$3:Ljava/time/Instant;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Ljava/time/Instant;Ljava/time/Instant;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda7;->f$0:Ljava/lang/String;

    iput-object p2, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda7;->f$1:Lcom/hardlineforge/lala/data/LogEntryDao_Impl;

    iput-object p3, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda7;->f$2:Ljava/time/Instant;

    iput-object p4, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda7;->f$3:Ljava/time/Instant;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda7;->f$0:Ljava/lang/String;

    iget-object v1, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda7;->f$1:Lcom/hardlineforge/lala/data/LogEntryDao_Impl;

    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda7;->f$2:Ljava/time/Instant;

    iget-object v3, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda7;->f$3:Ljava/time/Instant;

    check-cast p1, Landroidx/sqlite/SQLiteConnection;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->getByDateRange$lambda$7(Ljava/lang/String;Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Ljava/time/Instant;Ljava/time/Instant;Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method
