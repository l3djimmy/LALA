.class public final synthetic Lcom/hardlineforge/lala/data/AppDatabase_Impl$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/data/AppDatabase_Impl;"
    method = "_logEntryDao$lambda$0"
    proto = "(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)Lcom/hardlineforge/lala/data/LogEntryDao_Impl;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/hardlineforge/lala/data/AppDatabase_Impl;


# direct methods
.method public synthetic constructor <init>(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl$$ExternalSyntheticLambda0;->f$0:Lcom/hardlineforge/lala/data/AppDatabase_Impl;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl$$ExternalSyntheticLambda0;->f$0:Lcom/hardlineforge/lala/data/AppDatabase_Impl;

    invoke-static {v0}, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->_logEntryDao$lambda$0(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)Lcom/hardlineforge/lala/data/LogEntryDao_Impl;

    move-result-object v0

    return-object v0
.end method
