.class final Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;
.super Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ViewModelC;
.source "DaggerLalaApplication_HiltComponents_SingletonC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ViewModelCImpl"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;
    }
.end annotation


# instance fields
.field private final activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

.field lalaViewModelProvider:Ldagger/internal/Provider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
            ">;"
        }
    .end annotation
.end field

.field private final singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

.field private final viewModelCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Landroidx/lifecycle/SavedStateHandle;Ldagger/hilt/android/ViewModelLifecycle;)V
    .locals 0
    .param p1, "singletonCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;
    .param p2, "activityRetainedCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;
    .param p3, "savedStateHandleParam"    # Landroidx/lifecycle/SavedStateHandle;
    .param p4, "viewModelLifecycleParam"    # Ldagger/hilt/android/ViewModelLifecycle;
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
            "savedStateHandleParam",
            "viewModelLifecycleParam"
        }
    .end annotation

    .line 406
    invoke-direct {p0}, Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ViewModelC;-><init>()V

    .line 401
    iput-object p0, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;->viewModelCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;

    .line 407
    iput-object p1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    .line 408
    iput-object p2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    .line 410
    invoke-direct {p0, p3, p4}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;->initialize(Landroidx/lifecycle/SavedStateHandle;Ldagger/hilt/android/ViewModelLifecycle;)V

    .line 412
    return-void
.end method

.method private initialize(Landroidx/lifecycle/SavedStateHandle;Ldagger/hilt/android/ViewModelLifecycle;)V
    .locals 5
    .param p1, "savedStateHandleParam"    # Landroidx/lifecycle/SavedStateHandle;
    .param p2, "viewModelLifecycleParam"    # Ldagger/hilt/android/ViewModelLifecycle;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "savedStateHandleParam",
            "viewModelLifecycleParam"
        }
    .end annotation

    .line 417
    new-instance v0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;

    iget-object v1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    iget-object v2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    iget-object v3, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;->viewModelCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl$SwitchingProvider;-><init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;I)V

    iput-object v0, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;->lalaViewModelProvider:Ldagger/internal/Provider;

    .line 418
    return-void
.end method


# virtual methods
.method public getHiltViewModelAssistedMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 427
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getHiltViewModelMap()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljavax/inject/Provider<",
            "Landroidx/lifecycle/ViewModel;",
            ">;>;"
        }
    .end annotation

    .line 422
    sget-object v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel_HiltModules_BindsModule_Binds_LazyMapKey;->lazyClassKeyName:Ljava/lang/String;

    iget-object v1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;->lalaViewModelProvider:Ldagger/internal/Provider;

    invoke-static {v0, v1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Ldagger/internal/LazyClassKeyMap;->of(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method
