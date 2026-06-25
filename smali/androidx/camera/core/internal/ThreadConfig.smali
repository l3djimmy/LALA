.class public interface abstract Landroidx/camera/core/internal/ThreadConfig;
.super Ljava/lang/Object;
.source "ThreadConfig.java"

# interfaces
.implements Landroidx/camera/core/impl/ReadableConfig;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/internal/ThreadConfig$Builder;
    }
.end annotation


# static fields
.field public static final OPTION_BACKGROUND_EXECUTOR:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Ljava/util/concurrent/Executor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 38
    const-class v0, Ljava/util/concurrent/Executor;

    .line 39
    const-string/jumbo v1, "camerax.core.thread.backgroundExecutor"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/internal/ThreadConfig;->OPTION_BACKGROUND_EXECUTOR:Landroidx/camera/core/impl/Config$Option;

    .line 38
    return-void
.end method


# virtual methods
.method public getBackgroundExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 64
    sget-object v0, Landroidx/camera/core/internal/ThreadConfig;->OPTION_BACKGROUND_EXECUTOR:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/internal/ThreadConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public getBackgroundExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;
    .locals 1
    .param p1, "valueIfMissing"    # Ljava/util/concurrent/Executor;

    .line 52
    sget-object v0, Landroidx/camera/core/internal/ThreadConfig;->OPTION_BACKGROUND_EXECUTOR:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/internal/ThreadConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Executor;

    return-object v0
.end method
