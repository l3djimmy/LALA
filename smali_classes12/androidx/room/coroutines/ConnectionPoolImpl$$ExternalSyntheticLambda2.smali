.class public final synthetic Landroidx/room/coroutines/ConnectionPoolImpl$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/room/coroutines/ConnectionPoolImpl;"
    method = "useConnection$lambda$6"
    proto = "(Landroidx/room/coroutines/ConnectionPoolImpl;Z)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/room/coroutines/ConnectionPoolImpl;

.field public final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Landroidx/room/coroutines/ConnectionPoolImpl;Z)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/room/coroutines/ConnectionPoolImpl$$ExternalSyntheticLambda2;->f$0:Landroidx/room/coroutines/ConnectionPoolImpl;

    iput-boolean p2, p0, Landroidx/room/coroutines/ConnectionPoolImpl$$ExternalSyntheticLambda2;->f$1:Z

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 0
    iget-object v0, p0, Landroidx/room/coroutines/ConnectionPoolImpl$$ExternalSyntheticLambda2;->f$0:Landroidx/room/coroutines/ConnectionPoolImpl;

    iget-boolean v1, p0, Landroidx/room/coroutines/ConnectionPoolImpl$$ExternalSyntheticLambda2;->f$1:Z

    invoke-static {v0, v1}, Landroidx/room/coroutines/ConnectionPoolImpl;->useConnection$lambda$6(Landroidx/room/coroutines/ConnectionPoolImpl;Z)Lkotlin/Unit;

    move-result-object v0

    return-object v0
.end method
