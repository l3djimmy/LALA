.class public final synthetic Lcom/hardlineforge/lala/data/VideoDao_Impl$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/data/VideoDao_Impl;"
    method = "delete$lambda$1"
    proto = "(Lcom/hardlineforge/lala/data/VideoDao_Impl;Lcom/hardlineforge/lala/data/Video;Landroidx/sqlite/SQLiteConnection;)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/hardlineforge/lala/data/VideoDao_Impl;

.field public final synthetic f$1:Lcom/hardlineforge/lala/data/Video;


# direct methods
.method public synthetic constructor <init>(Lcom/hardlineforge/lala/data/VideoDao_Impl;Lcom/hardlineforge/lala/data/Video;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hardlineforge/lala/data/VideoDao_Impl$$ExternalSyntheticLambda3;->f$0:Lcom/hardlineforge/lala/data/VideoDao_Impl;

    iput-object p2, p0, Lcom/hardlineforge/lala/data/VideoDao_Impl$$ExternalSyntheticLambda3;->f$1:Lcom/hardlineforge/lala/data/Video;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/hardlineforge/lala/data/VideoDao_Impl$$ExternalSyntheticLambda3;->f$0:Lcom/hardlineforge/lala/data/VideoDao_Impl;

    iget-object v1, p0, Lcom/hardlineforge/lala/data/VideoDao_Impl$$ExternalSyntheticLambda3;->f$1:Lcom/hardlineforge/lala/data/Video;

    check-cast p1, Landroidx/sqlite/SQLiteConnection;

    invoke-static {v0, v1, p1}, Lcom/hardlineforge/lala/data/VideoDao_Impl;->delete$lambda$1(Lcom/hardlineforge/lala/data/VideoDao_Impl;Lcom/hardlineforge/lala/data/Video;Landroidx/sqlite/SQLiteConnection;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
