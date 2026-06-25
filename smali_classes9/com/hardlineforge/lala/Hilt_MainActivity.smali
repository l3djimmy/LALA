.class public abstract Lcom/hardlineforge/lala/Hilt_MainActivity;
.super Landroidx/activity/ComponentActivity;
.source "Hilt_MainActivity.java"

# interfaces
.implements Ldagger/hilt/internal/GeneratedComponentManagerHolder;


# instance fields
.field private volatile componentManager:Ldagger/hilt/android/internal/managers/ActivityComponentManager;

.field private final componentManagerLock:Ljava/lang/Object;

.field private injected:Z


# direct methods
.method constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Landroidx/activity/ComponentActivity;-><init>()V

    .line 24
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/hardlineforge/lala/Hilt_MainActivity;->componentManagerLock:Ljava/lang/Object;

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/hardlineforge/lala/Hilt_MainActivity;->injected:Z

    .line 30
    invoke-direct {p0}, Lcom/hardlineforge/lala/Hilt_MainActivity;->_initHiltInternal()V

    .line 31
    return-void
.end method

.method constructor <init>(I)V
    .locals 1
    .param p1, "contentLayoutId"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "contentLayoutId"
        }
    .end annotation

    .line 34
    invoke-direct {p0, p1}, Landroidx/activity/ComponentActivity;-><init>(I)V

    .line 24
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/hardlineforge/lala/Hilt_MainActivity;->componentManagerLock:Ljava/lang/Object;

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/hardlineforge/lala/Hilt_MainActivity;->injected:Z

    .line 35
    invoke-direct {p0}, Lcom/hardlineforge/lala/Hilt_MainActivity;->_initHiltInternal()V

    .line 36
    return-void
.end method

.method private _initHiltInternal()V
    .locals 1

    .line 39
    new-instance v0, Lcom/hardlineforge/lala/Hilt_MainActivity$1;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/Hilt_MainActivity$1;-><init>(Lcom/hardlineforge/lala/Hilt_MainActivity;)V

    invoke-virtual {p0, v0}, Lcom/hardlineforge/lala/Hilt_MainActivity;->addOnContextAvailableListener(Landroidx/activity/contextaware/OnContextAvailableListener;)V

    .line 45
    return-void
.end method

.method private initSavedStateHandleHolders()V
    .locals 1

    .line 48
    invoke-virtual {p0}, Lcom/hardlineforge/lala/Hilt_MainActivity;->componentManager()Ldagger/hilt/android/internal/managers/ActivityComponentManager;

    move-result-object v0

    invoke-virtual {v0}, Ldagger/hilt/android/internal/managers/ActivityComponentManager;->initSavedStateHandleHolders()V

    .line 49
    return-void
.end method


# virtual methods
.method public final componentManager()Ldagger/hilt/android/internal/managers/ActivityComponentManager;
    .locals 2

    .line 75
    iget-object v0, p0, Lcom/hardlineforge/lala/Hilt_MainActivity;->componentManager:Ldagger/hilt/android/internal/managers/ActivityComponentManager;

    if-nez v0, :cond_1

    .line 76
    iget-object v0, p0, Lcom/hardlineforge/lala/Hilt_MainActivity;->componentManagerLock:Ljava/lang/Object;

    monitor-enter v0

    .line 77
    :try_start_0
    iget-object v1, p0, Lcom/hardlineforge/lala/Hilt_MainActivity;->componentManager:Ldagger/hilt/android/internal/managers/ActivityComponentManager;

    if-nez v1, :cond_0

    .line 78
    invoke-virtual {p0}, Lcom/hardlineforge/lala/Hilt_MainActivity;->createComponentManager()Ldagger/hilt/android/internal/managers/ActivityComponentManager;

    move-result-object v1

    iput-object v1, p0, Lcom/hardlineforge/lala/Hilt_MainActivity;->componentManager:Ldagger/hilt/android/internal/managers/ActivityComponentManager;

    .line 80
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 82
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/hardlineforge/lala/Hilt_MainActivity;->componentManager:Ldagger/hilt/android/internal/managers/ActivityComponentManager;

    return-object v0
.end method

.method public bridge synthetic componentManager()Ldagger/hilt/internal/GeneratedComponentManager;
    .locals 1

    .line 20
    invoke-virtual {p0}, Lcom/hardlineforge/lala/Hilt_MainActivity;->componentManager()Ldagger/hilt/android/internal/managers/ActivityComponentManager;

    move-result-object v0

    return-object v0
.end method

.method protected createComponentManager()Ldagger/hilt/android/internal/managers/ActivityComponentManager;
    .locals 1

    .line 70
    new-instance v0, Ldagger/hilt/android/internal/managers/ActivityComponentManager;

    invoke-direct {v0, p0}, Ldagger/hilt/android/internal/managers/ActivityComponentManager;-><init>(Landroid/app/Activity;)V

    return-object v0
.end method

.method public final generatedComponent()Ljava/lang/Object;
    .locals 1

    .line 66
    invoke-virtual {p0}, Lcom/hardlineforge/lala/Hilt_MainActivity;->componentManager()Ldagger/hilt/android/internal/managers/ActivityComponentManager;

    move-result-object v0

    invoke-virtual {v0}, Ldagger/hilt/android/internal/managers/ActivityComponentManager;->generatedComponent()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultViewModelProviderFactory()Landroidx/lifecycle/ViewModelProvider$Factory;
    .locals 1

    .line 94
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->getDefaultViewModelProviderFactory()Landroidx/lifecycle/ViewModelProvider$Factory;

    move-result-object v0

    invoke-static {p0, v0}, Ldagger/hilt/android/internal/lifecycle/DefaultViewModelFactories;->getActivityFactory(Landroidx/activity/ComponentActivity;Landroidx/lifecycle/ViewModelProvider$Factory;)Landroidx/lifecycle/ViewModelProvider$Factory;

    move-result-object v0

    return-object v0
.end method

.method protected inject()V
    .locals 2

    .line 86
    iget-boolean v0, p0, Lcom/hardlineforge/lala/Hilt_MainActivity;->injected:Z

    if-nez v0, :cond_0

    .line 87
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/hardlineforge/lala/Hilt_MainActivity;->injected:Z

    .line 88
    invoke-virtual {p0}, Lcom/hardlineforge/lala/Hilt_MainActivity;->generatedComponent()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/MainActivity_GeneratedInjector;

    invoke-static {p0}, Ldagger/hilt/internal/UnsafeCasts;->unsafeCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/hardlineforge/lala/MainActivity;

    invoke-interface {v0, v1}, Lcom/hardlineforge/lala/MainActivity_GeneratedInjector;->injectMainActivity(Lcom/hardlineforge/lala/MainActivity;)V

    .line 90
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "savedInstanceState"
        }
    .end annotation

    .line 54
    invoke-super {p0, p1}, Landroidx/activity/ComponentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 55
    invoke-direct {p0}, Lcom/hardlineforge/lala/Hilt_MainActivity;->initSavedStateHandleHolders()V

    .line 56
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 60
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onDestroy()V

    .line 61
    invoke-virtual {p0}, Lcom/hardlineforge/lala/Hilt_MainActivity;->componentManager()Ldagger/hilt/android/internal/managers/ActivityComponentManager;

    move-result-object v0

    invoke-virtual {v0}, Ldagger/hilt/android/internal/managers/ActivityComponentManager;->clearSavedStateHandleHolders()V

    .line 62
    return-void
.end method
