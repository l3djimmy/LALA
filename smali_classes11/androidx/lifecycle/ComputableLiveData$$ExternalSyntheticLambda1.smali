.class public final synthetic Landroidx/lifecycle/ComputableLiveData$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/lifecycle/ComputableLiveData;"
    method = "invalidationRunnable$lambda$1"
    proto = "(Landroidx/lifecycle/ComputableLiveData;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/lifecycle/ComputableLiveData;


# direct methods
.method public synthetic constructor <init>(Landroidx/lifecycle/ComputableLiveData;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/lifecycle/ComputableLiveData$$ExternalSyntheticLambda1;->f$0:Landroidx/lifecycle/ComputableLiveData;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/lifecycle/ComputableLiveData$$ExternalSyntheticLambda1;->f$0:Landroidx/lifecycle/ComputableLiveData;

    invoke-static {v0}, Landroidx/lifecycle/ComputableLiveData;->invalidationRunnable$lambda$1(Landroidx/lifecycle/ComputableLiveData;)V

    return-void
.end method
