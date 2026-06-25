.class Landroidx/camera/core/impl/utils/executor/AudioExecutor$1;
.super Ljava/lang/Object;
.source "AudioExecutor.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/utils/executor/AudioExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final THREAD_NAME_STEM:Ljava/lang/String; = "CameraX-camerax_audio_%d"


# instance fields
.field private final mThreadId:Ljava/util/concurrent/atomic/AtomicInteger;

.field final synthetic this$0:Landroidx/camera/core/impl/utils/executor/AudioExecutor;


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/utils/executor/AudioExecutor;)V
    .locals 2
    .param p1, "this$0"    # Landroidx/camera/core/impl/utils/executor/AudioExecutor;

    .line 42
    iput-object p1, p0, Landroidx/camera/core/impl/utils/executor/AudioExecutor$1;->this$0:Landroidx/camera/core/impl/utils/executor/AudioExecutor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Landroidx/camera/core/impl/utils/executor/AudioExecutor$1;->mThreadId:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method static synthetic lambda$newThread$0(Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "r"    # Ljava/lang/Runnable;

    .line 51
    const/16 v0, -0x10

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 52
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 53
    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 5
    .param p1, "r"    # Ljava/lang/Runnable;

    .line 50
    new-instance v0, Landroidx/camera/core/impl/utils/executor/AudioExecutor$1$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1}, Landroidx/camera/core/impl/utils/executor/AudioExecutor$1$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Runnable;)V

    .line 54
    .local v0, "wrapper":Ljava/lang/Runnable;
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 55
    .local v1, "t":Ljava/lang/Thread;
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-object v3, p0, Landroidx/camera/core/impl/utils/executor/AudioExecutor$1;->mThreadId:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 59
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 56
    const-string v4, "CameraX-camerax_audio_%d"

    invoke-static {v2, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 55
    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 60
    return-object v1
.end method
