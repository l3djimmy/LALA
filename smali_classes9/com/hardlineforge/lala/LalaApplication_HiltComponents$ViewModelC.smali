.class public abstract Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ViewModelC;
.super Ljava/lang/Object;
.source "LalaApplication_HiltComponents.java"

# interfaces
.implements Ldagger/hilt/android/components/ViewModelComponent;
.implements Ldagger/hilt/android/internal/lifecycle/HiltViewModelFactory$ViewModelFactoriesEntryPoint;
.implements Ldagger/hilt/internal/GeneratedComponent;


# annotations
.annotation runtime Ldagger/Subcomponent;
    modules = {
        Ldagger/hilt/android/internal/lifecycle/HiltWrapper_HiltViewModelFactory_ViewModelModule;,
        Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_HiltModules$BindsModule;
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hardlineforge/lala/LalaApplication_HiltComponents;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ViewModelC"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ViewModelC$Builder;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 202
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
