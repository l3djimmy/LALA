.class Lcom/hardlineforge/lala/Hilt_LalaApplication$1;
.super Ljava/lang/Object;
.source "Hilt_LalaApplication.java"

# interfaces
.implements Ldagger/hilt/android/internal/managers/ComponentSupplier;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hardlineforge/lala/Hilt_LalaApplication;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/hardlineforge/lala/Hilt_LalaApplication;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/Hilt_LalaApplication;)V
    .locals 0
    .param p1, "this$0"    # Lcom/hardlineforge/lala/Hilt_LalaApplication;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 21
    iput-object p1, p0, Lcom/hardlineforge/lala/Hilt_LalaApplication$1;->this$0:Lcom/hardlineforge/lala/Hilt_LalaApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 3

    .line 24
    invoke-static {}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC;->builder()Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$Builder;

    move-result-object v0

    new-instance v1, Ldagger/hilt/android/internal/modules/ApplicationContextModule;

    iget-object v2, p0, Lcom/hardlineforge/lala/Hilt_LalaApplication$1;->this$0:Lcom/hardlineforge/lala/Hilt_LalaApplication;

    invoke-direct {v1, v2}, Ldagger/hilt/android/internal/modules/ApplicationContextModule;-><init>(Landroid/content/Context;)V

    .line 25
    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$Builder;->applicationContextModule(Ldagger/hilt/android/internal/modules/ApplicationContextModule;)Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$Builder;

    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$Builder;->build()Lcom/hardlineforge/lala/LalaApplication_HiltComponents$SingletonC;

    move-result-object v0

    .line 24
    return-object v0
.end method
