.class final Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;
.super Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ActivityC;
.source "DaggerLalaApplication_HiltComponents_SingletonC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ActivityCImpl"
.end annotation


# instance fields
.field private final activityCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

.field private final activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

.field private final singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Landroid/app/Activity;)V
    .locals 0
    .param p1, "singletonCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;
    .param p2, "activityRetainedCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;
    .param p3, "activityParam"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "singletonCImpl",
            "activityRetainedCImpl",
            "activityParam"
        }
    .end annotation

    .line 359
    invoke-direct {p0}, Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ActivityC;-><init>()V

    .line 356
    iput-object p0, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;->activityCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

    .line 360
    iput-object p1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    .line 361
    iput-object p2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    .line 364
    return-void
.end method


# virtual methods
.method public fragmentComponentBuilder()Ldagger/hilt/android/internal/builders/FragmentComponentBuilder;
    .locals 5

    .line 387
    new-instance v0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCBuilder;

    iget-object v1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    iget-object v2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    iget-object v3, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;->activityCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCBuilder;-><init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC-IA;)V

    return-object v0
.end method

.method public getHiltInternalFactoryFactory()Ldagger/hilt/android/internal/lifecycle/DefaultViewModelFactories$InternalFactoryFactory;
    .locals 5

    .line 372
    invoke-virtual {p0}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;->getViewModelKeys()Ljava/util/Map;

    move-result-object v0

    new-instance v1, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCBuilder;

    iget-object v2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    iget-object v3, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCBuilder;-><init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC-IA;)V

    invoke-static {v0, v1}, Ldagger/hilt/android/internal/lifecycle/DefaultViewModelFactories_InternalFactoryFactory_Factory;->newInstance(Ljava/util/Map;Ldagger/hilt/android/internal/builders/ViewModelComponentBuilder;)Ldagger/hilt/android/internal/lifecycle/DefaultViewModelFactories$InternalFactoryFactory;

    move-result-object v0

    return-object v0
.end method

.method public getViewModelComponentBuilder()Ldagger/hilt/android/internal/builders/ViewModelComponentBuilder;
    .locals 4

    .line 382
    new-instance v0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCBuilder;

    iget-object v1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    iget-object v2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCBuilder;-><init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC-IA;)V

    return-object v0
.end method

.method public getViewModelKeys()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 377
    sget-object v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_HiltModules_KeyModule_Provide_LazyMapKey;->lazyClassKeyName:Ljava/lang/String;

    invoke-static {}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_HiltModules$KeyModule;->provide()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Ldagger/internal/LazyClassKeyMap;->of(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public injectMainActivity(Lcom/hardlineforge/lala/MainActivity;)V
    .locals 0
    .param p1, "mainActivity"    # Lcom/hardlineforge/lala/MainActivity;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mainActivity"
        }
    .end annotation

    .line 368
    return-void
.end method

.method public viewComponentBuilder()Ldagger/hilt/android/internal/builders/ViewComponentBuilder;
    .locals 5

    .line 392
    new-instance v0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewCBuilder;

    iget-object v1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    iget-object v2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    iget-object v3, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;->activityCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewCBuilder;-><init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC-IA;)V

    return-object v0
.end method
