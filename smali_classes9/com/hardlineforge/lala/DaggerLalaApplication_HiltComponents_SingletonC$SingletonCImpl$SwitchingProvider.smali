.class final Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl$SwitchingProvider;
.super Ljava/lang/Object;
.source "DaggerLalaApplication_HiltComponents_SingletonC.java"

# interfaces
.implements Ldagger/internal/Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;
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
.field private final id:I

.field private final singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;I)V
    .locals 0
    .param p1, "singletonCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;
    .param p2, "id"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "singletonCImpl",
            "id"
        }
    .end annotation

    .line 583
    .local p0, "this":Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl$SwitchingProvider;, "Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl$SwitchingProvider<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 584
    iput-object p1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl$SwitchingProvider;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    .line 585
    iput p2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl$SwitchingProvider;->id:I

    .line 586
    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 591
    .local p0, "this":Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl$SwitchingProvider;, "Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl$SwitchingProvider<TT;>;"
    iget v0, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl$SwitchingProvider;->id:I

    packed-switch v0, :pswitch_data_0

    .line 607
    new-instance v0, Ljava/lang/AssertionError;

    iget v1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl$SwitchingProvider;->id:I

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(I)V

    throw v0

    .line 605
    :pswitch_0
    new-instance v0, Lcom/hardlineforge/lala/pdf/PdfGenerator;

    iget-object v1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl$SwitchingProvider;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    invoke-static {v1}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;->-$$Nest$fgetapplicationContextModule(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;)Ldagger/hilt/android/internal/modules/ApplicationContextModule;

    move-result-object v1

    invoke-static {v1}, Ldagger/hilt/android/internal/modules/ApplicationContextModule_ProvideContextFactory;->provideContext(Ldagger/hilt/android/internal/modules/ApplicationContextModule;)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/pdf/PdfGenerator;-><init>(Landroid/content/Context;)V

    return-object v0

    .line 602
    :pswitch_1
    new-instance v0, Lcom/hardlineforge/lala/media/VideoFrameExtractor;

    iget-object v1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl$SwitchingProvider;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    invoke-static {v1}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;->-$$Nest$fgetapplicationContextModule(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;)Ldagger/hilt/android/internal/modules/ApplicationContextModule;

    move-result-object v1

    invoke-static {v1}, Ldagger/hilt/android/internal/modules/ApplicationContextModule_ProvideContextFactory;->provideContext(Ldagger/hilt/android/internal/modules/ApplicationContextModule;)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/media/VideoFrameExtractor;-><init>(Landroid/content/Context;)V

    return-object v0

    .line 599
    :pswitch_2
    new-instance v0, Lcom/hardlineforge/lala/location/LocationManager;

    iget-object v1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl$SwitchingProvider;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    invoke-static {v1}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;->-$$Nest$fgetapplicationContextModule(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;)Ldagger/hilt/android/internal/modules/ApplicationContextModule;

    move-result-object v1

    invoke-static {v1}, Ldagger/hilt/android/internal/modules/ApplicationContextModule_ProvideContextFactory;->provideContext(Ldagger/hilt/android/internal/modules/ApplicationContextModule;)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/location/LocationManager;-><init>(Landroid/content/Context;)V

    return-object v0

    .line 596
    :pswitch_3
    iget-object v0, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl$SwitchingProvider;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    invoke-static {v0}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;->-$$Nest$fgetapplicationContextModule(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;)Ldagger/hilt/android/internal/modules/ApplicationContextModule;

    move-result-object v0

    invoke-static {v0}, Ldagger/hilt/android/internal/modules/ApplicationContextModule_ProvideContextFactory;->provideContext(Ldagger/hilt/android/internal/modules/ApplicationContextModule;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/hardlineforge/lala/di/AppModule_ProvideDatabaseFactory;->provideDatabase(Landroid/content/Context;)Lcom/hardlineforge/lala/data/AppDatabase;

    move-result-object v0

    return-object v0

    .line 593
    :pswitch_4
    new-instance v0, Lcom/hardlineforge/lala/data/LogRepository;

    iget-object v1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl$SwitchingProvider;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    iget-object v1, v1, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;->provideDatabaseProvider:Ldagger/internal/Provider;

    invoke-interface {v1}, Ldagger/internal/Provider;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/hardlineforge/lala/data/AppDatabase;

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/data/LogRepository;-><init>(Lcom/hardlineforge/lala/data/AppDatabase;)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
