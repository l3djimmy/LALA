.class public abstract Lcom/hardlineforge/lala/LalaApplication_HiltComponents$SingletonC;
.super Ljava/lang/Object;
.source "LalaApplication_HiltComponents.java"

# interfaces
.implements Lcom/hardlineforge/lala/LalaApplication_GeneratedInjector;
.implements Ldagger/hilt/android/flags/FragmentGetContextFix$FragmentGetContextFixEntryPoint;
.implements Ldagger/hilt/android/internal/managers/HiltWrapper_ActivityRetainedComponentManager_ActivityRetainedComponentBuilderEntryPoint;
.implements Ldagger/hilt/android/internal/managers/ServiceComponentManager$ServiceComponentBuilderEntryPoint;
.implements Ldagger/hilt/components/SingletonComponent;
.implements Ldagger/hilt/internal/GeneratedComponent;


# annotations
.annotation runtime Ldagger/Component;
    modules = {
        Lcom/hardlineforge/lala/di/AppModule;,
        Ldagger/hilt/android/internal/modules/ApplicationContextModule;,
        Ldagger/hilt/android/flags/HiltWrapper_FragmentGetContextFix_FragmentGetContextFixModule;,
        Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ActivityRetainedCBuilderModule;,
        Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ServiceCBuilderModule;
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hardlineforge/lala/LalaApplication_HiltComponents;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SingletonC"
.end annotation

.annotation runtime Ljakarta/inject/Singleton;
.end annotation

.annotation runtime Ljavax/inject/Singleton;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
