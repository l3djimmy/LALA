.class public final synthetic Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/ui/screens/LalaAppKt;"
    method = "LalaApp$lambda$3$lambda$2$lambda$1$lambda$0"
    proto = "(Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/DrawerState;)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lkotlinx/coroutines/CoroutineScope;

.field public final synthetic f$1:Landroidx/compose/material3/DrawerState;


# direct methods
.method public synthetic constructor <init>(Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/DrawerState;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda10;->f$0:Lkotlinx/coroutines/CoroutineScope;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda10;->f$1:Landroidx/compose/material3/DrawerState;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda10;->f$0:Lkotlinx/coroutines/CoroutineScope;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda10;->f$1:Landroidx/compose/material3/DrawerState;

    invoke-static {v0, v1}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt;->LalaApp$lambda$3$lambda$2$lambda$1$lambda$0(Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/DrawerState;)Lkotlin/Unit;

    move-result-object v0

    return-object v0
.end method
