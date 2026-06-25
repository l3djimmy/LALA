.class public final Lcom/hardlineforge/lala/media/VideoFrameExtractor_Factory;
.super Ljava/lang/Object;
.source "VideoFrameExtractor_Factory.java"

# interfaces
.implements Ldagger/internal/Factory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ldagger/internal/Factory<",
        "Lcom/hardlineforge/lala/media/VideoFrameExtractor;",
        ">;"
    }
.end annotation


# instance fields
.field private final contextProvider:Ldagger/internal/Provider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Provider<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ldagger/internal/Provider;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "contextProvider"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ldagger/internal/Provider<",
            "Landroid/content/Context;",
            ">;)V"
        }
    .end annotation

    .line 30
    .local p1, "contextProvider":Ldagger/internal/Provider;, "Ldagger/internal/Provider<Landroid/content/Context;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/hardlineforge/lala/media/VideoFrameExtractor_Factory;->contextProvider:Ldagger/internal/Provider;

    .line 32
    return-void
.end method

.method public static create(Ldagger/internal/Provider;)Lcom/hardlineforge/lala/media/VideoFrameExtractor_Factory;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "contextProvider"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ldagger/internal/Provider<",
            "Landroid/content/Context;",
            ">;)",
            "Lcom/hardlineforge/lala/media/VideoFrameExtractor_Factory;"
        }
    .end annotation

    .line 40
    .local p0, "contextProvider":Ldagger/internal/Provider;, "Ldagger/internal/Provider<Landroid/content/Context;>;"
    new-instance v0, Lcom/hardlineforge/lala/media/VideoFrameExtractor_Factory;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/media/VideoFrameExtractor_Factory;-><init>(Ldagger/internal/Provider;)V

    return-object v0
.end method

.method public static newInstance(Landroid/content/Context;)Lcom/hardlineforge/lala/media/VideoFrameExtractor;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 44
    new-instance v0, Lcom/hardlineforge/lala/media/VideoFrameExtractor;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/media/VideoFrameExtractor;-><init>(Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public get()Lcom/hardlineforge/lala/media/VideoFrameExtractor;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/hardlineforge/lala/media/VideoFrameExtractor_Factory;->contextProvider:Ldagger/internal/Provider;

    invoke-interface {v0}, Ldagger/internal/Provider;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Lcom/hardlineforge/lala/media/VideoFrameExtractor_Factory;->newInstance(Landroid/content/Context;)Lcom/hardlineforge/lala/media/VideoFrameExtractor;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .line 11
    invoke-virtual {p0}, Lcom/hardlineforge/lala/media/VideoFrameExtractor_Factory;->get()Lcom/hardlineforge/lala/media/VideoFrameExtractor;

    move-result-object v0

    return-object v0
.end method
