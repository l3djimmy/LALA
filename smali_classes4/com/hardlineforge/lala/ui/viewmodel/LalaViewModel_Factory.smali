.class public final Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_Factory;
.super Ljava/lang/Object;
.source "LalaViewModel_Factory.java"

# interfaces
.implements Ldagger/internal/Factory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ldagger/internal/Factory<",
        "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
        ">;"
    }
.end annotation


# instance fields
.field private final locationManagerProvider:Ldagger/internal/Provider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/location/LocationManager;",
            ">;"
        }
    .end annotation
.end field

.field private final pdfGeneratorProvider:Ldagger/internal/Provider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/pdf/PdfGenerator;",
            ">;"
        }
    .end annotation
.end field

.field private final repoProvider:Ldagger/internal/Provider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/data/LogRepository;",
            ">;"
        }
    .end annotation
.end field

.field private final videoFrameExtractorProvider:Ldagger/internal/Provider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/media/VideoFrameExtractor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ldagger/internal/Provider;Ldagger/internal/Provider;Ldagger/internal/Provider;Ldagger/internal/Provider;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "repoProvider",
            "locationManagerProvider",
            "videoFrameExtractorProvider",
            "pdfGeneratorProvider"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/data/LogRepository;",
            ">;",
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/location/LocationManager;",
            ">;",
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/media/VideoFrameExtractor;",
            ">;",
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/pdf/PdfGenerator;",
            ">;)V"
        }
    .end annotation

    .line 42
    .local p1, "repoProvider":Ldagger/internal/Provider;, "Ldagger/internal/Provider<Lcom/hardlineforge/lala/data/LogRepository;>;"
    .local p2, "locationManagerProvider":Ldagger/internal/Provider;, "Ldagger/internal/Provider<Lcom/hardlineforge/lala/location/LocationManager;>;"
    .local p3, "videoFrameExtractorProvider":Ldagger/internal/Provider;, "Ldagger/internal/Provider<Lcom/hardlineforge/lala/media/VideoFrameExtractor;>;"
    .local p4, "pdfGeneratorProvider":Ldagger/internal/Provider;, "Ldagger/internal/Provider<Lcom/hardlineforge/lala/pdf/PdfGenerator;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_Factory;->repoProvider:Ldagger/internal/Provider;

    .line 44
    iput-object p2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_Factory;->locationManagerProvider:Ldagger/internal/Provider;

    .line 45
    iput-object p3, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_Factory;->videoFrameExtractorProvider:Ldagger/internal/Provider;

    .line 46
    iput-object p4, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_Factory;->pdfGeneratorProvider:Ldagger/internal/Provider;

    .line 47
    return-void
.end method

.method public static create(Ldagger/internal/Provider;Ldagger/internal/Provider;Ldagger/internal/Provider;Ldagger/internal/Provider;)Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_Factory;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "repoProvider",
            "locationManagerProvider",
            "videoFrameExtractorProvider",
            "pdfGeneratorProvider"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/data/LogRepository;",
            ">;",
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/location/LocationManager;",
            ">;",
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/media/VideoFrameExtractor;",
            ">;",
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/pdf/PdfGenerator;",
            ">;)",
            "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_Factory;"
        }
    .end annotation

    .line 58
    .local p0, "repoProvider":Ldagger/internal/Provider;, "Ldagger/internal/Provider<Lcom/hardlineforge/lala/data/LogRepository;>;"
    .local p1, "locationManagerProvider":Ldagger/internal/Provider;, "Ldagger/internal/Provider<Lcom/hardlineforge/lala/location/LocationManager;>;"
    .local p2, "videoFrameExtractorProvider":Ldagger/internal/Provider;, "Ldagger/internal/Provider<Lcom/hardlineforge/lala/media/VideoFrameExtractor;>;"
    .local p3, "pdfGeneratorProvider":Ldagger/internal/Provider;, "Ldagger/internal/Provider<Lcom/hardlineforge/lala/pdf/PdfGenerator;>;"
    new-instance v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_Factory;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_Factory;-><init>(Ldagger/internal/Provider;Ldagger/internal/Provider;Ldagger/internal/Provider;Ldagger/internal/Provider;)V

    return-object v0
.end method

.method public static newInstance(Lcom/hardlineforge/lala/data/LogRepository;Lcom/hardlineforge/lala/location/LocationManager;Lcom/hardlineforge/lala/media/VideoFrameExtractor;Lcom/hardlineforge/lala/pdf/PdfGenerator;)Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .locals 1
    .param p0, "repo"    # Lcom/hardlineforge/lala/data/LogRepository;
    .param p1, "locationManager"    # Lcom/hardlineforge/lala/location/LocationManager;
    .param p2, "videoFrameExtractor"    # Lcom/hardlineforge/lala/media/VideoFrameExtractor;
    .param p3, "pdfGenerator"    # Lcom/hardlineforge/lala/pdf/PdfGenerator;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "repo",
            "locationManager",
            "videoFrameExtractor",
            "pdfGenerator"
        }
    .end annotation

    .line 63
    new-instance v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;-><init>(Lcom/hardlineforge/lala/data/LogRepository;Lcom/hardlineforge/lala/location/LocationManager;Lcom/hardlineforge/lala/media/VideoFrameExtractor;Lcom/hardlineforge/lala/pdf/PdfGenerator;)V

    return-object v0
.end method


# virtual methods
.method public get()Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .locals 4

    .line 51
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_Factory;->repoProvider:Ldagger/internal/Provider;

    invoke-interface {v0}, Ldagger/internal/Provider;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/data/LogRepository;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_Factory;->locationManagerProvider:Ldagger/internal/Provider;

    invoke-interface {v1}, Ldagger/internal/Provider;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/hardlineforge/lala/location/LocationManager;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_Factory;->videoFrameExtractorProvider:Ldagger/internal/Provider;

    invoke-interface {v2}, Ldagger/internal/Provider;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/hardlineforge/lala/media/VideoFrameExtractor;

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_Factory;->pdfGeneratorProvider:Ldagger/internal/Provider;

    invoke-interface {v3}, Ldagger/internal/Provider;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/hardlineforge/lala/pdf/PdfGenerator;

    invoke-static {v0, v1, v2, v3}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_Factory;->newInstance(Lcom/hardlineforge/lala/data/LogRepository;Lcom/hardlineforge/lala/location/LocationManager;Lcom/hardlineforge/lala/media/VideoFrameExtractor;Lcom/hardlineforge/lala/pdf/PdfGenerator;)Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_Factory;->get()Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    move-result-object v0

    return-object v0
.end method
