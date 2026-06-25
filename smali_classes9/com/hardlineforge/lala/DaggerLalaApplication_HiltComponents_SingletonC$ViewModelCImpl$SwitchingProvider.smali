.class final Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;
.super Ljava/lang/Object;
.source "DaggerLalaApplication_HiltComponents_SingletonC.java"

# interfaces
.implements Ldagger/internal/Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SwitchingProvider"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ldagger/internal/Provider<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

.field private final id:I

.field private final singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

.field private final viewModelCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;I)V
    .locals 0
    .param p1, "singletonCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;
    .param p2, "activityRetainedCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;
    .param p3, "viewModelCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;
    .param p4, "id"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "singletonCImpl",
            "activityRetainedCImpl",
            "viewModelCImpl",
            "id"
        }
    .end annotation

    .line 440
    .local p0, "this":Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;, "Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 441
    iput-object p1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    .line 442
    iput-object p2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    .line 443
    iput-object p3, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;->viewModelCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;

    .line 444
    iput p4, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;->id:I

    .line 445
    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 450
    .local p0, "this":Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;, "Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider<TT;>;"
    iget v0, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;->id:I

    packed-switch v0, :pswitch_data_0

    .line 454
    new-instance v0, Ljava/lang/AssertionError;

    iget v1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;->id:I

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(I)V

    throw v0

    .line 452
    :pswitch_0
    new-instance v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iget-object v1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    iget-object v1, v1, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;->logRepositoryProvider:Ldagger/internal/Provider;

    invoke-interface {v1}, Ldagger/internal/Provider;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/hardlineforge/lala/data/LogRepository;

    iget-object v2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    iget-object v2, v2, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;->locationManagerProvider:Ldagger/internal/Provider;

    invoke-interface {v2}, Ldagger/internal/Provider;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/hardlineforge/lala/location/LocationManager;

    iget-object v3, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    iget-object v3, v3, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;->videoFrameExtractorProvider:Ldagger/internal/Provider;

    invoke-interface {v3}, Ldagger/internal/Provider;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/hardlineforge/lala/media/VideoFrameExtractor;

    iget-object v4, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    iget-object v4, v4, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;->pdfGeneratorProvider:Ldagger/internal/Provider;

    invoke-interface {v4}, Ldagger/internal/Provider;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/hardlineforge/lala/pdf/PdfGenerator;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;-><init>(Lcom/hardlineforge/lala/data/LogRepository;Lcom/hardlineforge/lala/location/LocationManager;Lcom/hardlineforge/lala/media/VideoFrameExtractor;Lcom/hardlineforge/lala/pdf/PdfGenerator;)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
