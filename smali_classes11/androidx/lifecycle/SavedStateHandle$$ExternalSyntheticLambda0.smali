.class public final synthetic Landroidx/lifecycle/SavedStateHandle$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/savedstate/SavedStateRegistry$SavedStateProvider;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/lifecycle/SavedStateHandle;"
    method = "savedStateProvider$lambda$0"
    proto = "(Landroidx/lifecycle/SavedStateHandle;)Landroid/os/Bundle;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/lifecycle/SavedStateHandle;


# direct methods
.method public synthetic constructor <init>(Landroidx/lifecycle/SavedStateHandle;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/lifecycle/SavedStateHandle$$ExternalSyntheticLambda0;->f$0:Landroidx/lifecycle/SavedStateHandle;

    return-void
.end method


# virtual methods
.method public final saveState()Landroid/os/Bundle;
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/lifecycle/SavedStateHandle$$ExternalSyntheticLambda0;->f$0:Landroidx/lifecycle/SavedStateHandle;

    invoke-static {v0}, Landroidx/lifecycle/SavedStateHandle;->savedStateProvider$lambda$0(Landroidx/lifecycle/SavedStateHandle;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method
