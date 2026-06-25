.class public Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;
.super Ljava/lang/Object;
.source "ForceCloseCaptureSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession$OnConfigured;
    }
.end annotation


# instance fields
.field private final mCaptureSessionOnClosedNotCalledQuirk:Landroidx/camera/camera2/internal/compat/quirk/CaptureSessionOnClosedNotCalledQuirk;


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/Quirks;)V
    .locals 1
    .param p1, "deviceQuirks"    # Landroidx/camera/core/impl/Quirks;

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/CaptureSessionOnClosedNotCalledQuirk;

    .line 47
    invoke-virtual {p1, v0}, Landroidx/camera/core/impl/Quirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    check-cast v0, Landroidx/camera/camera2/internal/compat/quirk/CaptureSessionOnClosedNotCalledQuirk;

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;->mCaptureSessionOnClosedNotCalledQuirk:Landroidx/camera/camera2/internal/compat/quirk/CaptureSessionOnClosedNotCalledQuirk;

    .line 48
    return-void
.end method

.method private forceOnClosed(Ljava/util/Set;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession;",
            ">;)V"
        }
    .end annotation

    .line 113
    .local p1, "sessions":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 114
    .local v1, "session":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    invoke-interface {v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->getStateCallback()Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;->onClosed(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    .line 115
    .end local v1    # "session":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    goto :goto_0

    .line 116
    :cond_0
    return-void
.end method

.method private forceOnConfigureFailed(Ljava/util/Set;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession;",
            ">;)V"
        }
    .end annotation

    .line 107
    .local p1, "sessions":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 108
    .local v1, "session":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    invoke-interface {v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->getStateCallback()Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;->onConfigureFailed(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    .line 109
    .end local v1    # "session":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    goto :goto_0

    .line 110
    :cond_0
    return-void
.end method


# virtual methods
.method public onSessionConfigured(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;Ljava/util/List;Ljava/util/List;Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession$OnConfigured;)V
    .locals 3
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    .param p4, "onConfigured"    # Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession$OnConfigured;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession;",
            "Ljava/util/List<",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession;",
            ">;",
            "Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession$OnConfigured;",
            ")V"
        }
    .end annotation

    .line 66
    .local p2, "creatingSessions":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    .local p3, "sessions":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;->shouldForceClose()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 67
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 68
    .local v0, "staleCreatingSessions":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 72
    .local v2, "s":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    if-ne v2, p1, :cond_0

    .line 73
    goto :goto_1

    .line 75
    :cond_0
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 76
    .end local v2    # "s":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    goto :goto_0

    .line 81
    :cond_1
    :goto_1
    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;->forceOnConfigureFailed(Ljava/util/Set;)V

    .line 84
    .end local v0    # "staleCreatingSessions":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    :cond_2
    invoke-interface {p4, p1}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession$OnConfigured;->run(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    .line 90
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;->shouldForceClose()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 91
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 92
    .local v0, "openedSessions":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 96
    .restart local v2    # "s":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    if-ne v2, p1, :cond_3

    .line 97
    goto :goto_3

    .line 99
    :cond_3
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 100
    .end local v2    # "s":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    goto :goto_2

    .line 102
    :cond_4
    :goto_3
    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;->forceOnClosed(Ljava/util/Set;)V

    .line 104
    .end local v0    # "openedSessions":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    :cond_5
    return-void
.end method

.method public shouldForceClose()Z
    .locals 1

    .line 52
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;->mCaptureSessionOnClosedNotCalledQuirk:Landroidx/camera/camera2/internal/compat/quirk/CaptureSessionOnClosedNotCalledQuirk;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
