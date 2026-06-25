.class public final Ldagger/hilt/android/internal/managers/ViewComponentManager;
.super Ljava/lang/Object;
.source "ViewComponentManager.java"

# interfaces
.implements Ldagger/hilt/internal/GeneratedComponentManager;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ldagger/hilt/android/internal/managers/ViewComponentManager$ViewWithFragmentComponentBuilderEntryPoint;,
        Ldagger/hilt/android/internal/managers/ViewComponentManager$ViewComponentBuilderEntryPoint;,
        Ldagger/hilt/android/internal/managers/ViewComponentManager$FragmentContextWrapper;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ldagger/hilt/internal/GeneratedComponentManager<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private volatile component:Ljava/lang/Object;

.field private final componentLock:Ljava/lang/Object;

.field private final hasFragmentBindings:Z

.field private final view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;Z)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "hasFragmentBindings"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "view",
            "hasFragmentBindings"
        }
    .end annotation

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->componentLock:Ljava/lang/Object;

    .line 70
    iput-object p1, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->view:Landroid/view/View;

    .line 71
    iput-boolean p2, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->hasFragmentBindings:Z

    .line 72
    return-void
.end method

.method private createComponent()Ljava/lang/Object;
    .locals 3

    .line 87
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ldagger/hilt/android/internal/managers/ViewComponentManager;->getParentComponentManager(Z)Ldagger/hilt/internal/GeneratedComponentManager;

    move-result-object v0

    .line 88
    .local v0, "componentManager":Ljava/lang/Object;
    iget-boolean v1, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->hasFragmentBindings:Z

    if-eqz v1, :cond_0

    .line 89
    const-class v1, Ldagger/hilt/android/internal/managers/ViewComponentManager$ViewWithFragmentComponentBuilderEntryPoint;

    invoke-static {v0, v1}, Ldagger/hilt/EntryPoints;->get(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldagger/hilt/android/internal/managers/ViewComponentManager$ViewWithFragmentComponentBuilderEntryPoint;

    .line 90
    invoke-interface {v1}, Ldagger/hilt/android/internal/managers/ViewComponentManager$ViewWithFragmentComponentBuilderEntryPoint;->viewWithFragmentComponentBuilder()Ldagger/hilt/android/internal/builders/ViewWithFragmentComponentBuilder;

    move-result-object v1

    iget-object v2, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->view:Landroid/view/View;

    .line 91
    invoke-interface {v1, v2}, Ldagger/hilt/android/internal/builders/ViewWithFragmentComponentBuilder;->view(Landroid/view/View;)Ldagger/hilt/android/internal/builders/ViewWithFragmentComponentBuilder;

    move-result-object v1

    .line 92
    invoke-interface {v1}, Ldagger/hilt/android/internal/builders/ViewWithFragmentComponentBuilder;->build()Ldagger/hilt/android/components/ViewWithFragmentComponent;

    move-result-object v1

    .line 89
    return-object v1

    .line 94
    :cond_0
    const-class v1, Ldagger/hilt/android/internal/managers/ViewComponentManager$ViewComponentBuilderEntryPoint;

    invoke-static {v0, v1}, Ldagger/hilt/EntryPoints;->get(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldagger/hilt/android/internal/managers/ViewComponentManager$ViewComponentBuilderEntryPoint;

    .line 95
    invoke-interface {v1}, Ldagger/hilt/android/internal/managers/ViewComponentManager$ViewComponentBuilderEntryPoint;->viewComponentBuilder()Ldagger/hilt/android/internal/builders/ViewComponentBuilder;

    move-result-object v1

    iget-object v2, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->view:Landroid/view/View;

    .line 96
    invoke-interface {v1, v2}, Ldagger/hilt/android/internal/builders/ViewComponentBuilder;->view(Landroid/view/View;)Ldagger/hilt/android/internal/builders/ViewComponentBuilder;

    move-result-object v1

    .line 97
    invoke-interface {v1}, Ldagger/hilt/android/internal/builders/ViewComponentBuilder;->build()Ldagger/hilt/android/components/ViewComponent;

    move-result-object v1

    .line 94
    return-object v1
.end method

.method private getParentComponentManager(Z)Ldagger/hilt/internal/GeneratedComponentManager;
    .locals 5
    .param p1, "allowMissing"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "allowMissing"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ldagger/hilt/internal/GeneratedComponentManager<",
            "*>;"
        }
    .end annotation

    .line 107
    iget-boolean v0, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->hasFragmentBindings:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 108
    const-class v0, Ldagger/hilt/android/internal/managers/ViewComponentManager$FragmentContextWrapper;

    invoke-direct {p0, v0, p1}, Ldagger/hilt/android/internal/managers/ViewComponentManager;->getParentContext(Ljava/lang/Class;Z)Landroid/content/Context;

    move-result-object v0

    .line 109
    .local v0, "context":Landroid/content/Context;
    instance-of v2, v0, Ldagger/hilt/android/internal/managers/ViewComponentManager$FragmentContextWrapper;

    if-eqz v2, :cond_0

    .line 111
    move-object v1, v0

    check-cast v1, Ldagger/hilt/android/internal/managers/ViewComponentManager$FragmentContextWrapper;

    .line 112
    .local v1, "fragmentContextWrapper":Ldagger/hilt/android/internal/managers/ViewComponentManager$FragmentContextWrapper;
    invoke-virtual {v1}, Ldagger/hilt/android/internal/managers/ViewComponentManager$FragmentContextWrapper;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v2

    check-cast v2, Ldagger/hilt/internal/GeneratedComponentManager;

    return-object v2

    .line 113
    .end local v1    # "fragmentContextWrapper":Ldagger/hilt/android/internal/managers/ViewComponentManager$FragmentContextWrapper;
    :cond_0
    if-eqz p1, :cond_1

    .line 116
    return-object v1

    .line 121
    :cond_1
    const-class v1, Ldagger/hilt/internal/GeneratedComponentManager;

    invoke-direct {p0, v1, p1}, Ldagger/hilt/android/internal/managers/ViewComponentManager;->getParentContext(Ljava/lang/Class;Z)Landroid/content/Context;

    move-result-object v1

    .line 122
    .local v1, "parent":Landroid/content/Context;
    instance-of v2, v1, Ldagger/hilt/internal/GeneratedComponentManager;

    xor-int/lit8 v2, v2, 0x1

    iget-object v3, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->view:Landroid/view/View;

    .line 126
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 127
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    .line 122
    const-string v4, "%s, @WithFragmentBindings Hilt view must be attached to an @AndroidEntryPoint Fragment. Was attached to context %s"

    invoke-static {v2, v4, v3}, Ldagger/hilt/internal/Preconditions;->checkState(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 128
    .end local v0    # "context":Landroid/content/Context;
    .end local v1    # "parent":Landroid/content/Context;
    goto :goto_0

    .line 129
    :cond_2
    const-class v0, Ldagger/hilt/internal/GeneratedComponentManager;

    invoke-direct {p0, v0, p1}, Ldagger/hilt/android/internal/managers/ViewComponentManager;->getParentContext(Ljava/lang/Class;Z)Landroid/content/Context;

    move-result-object v0

    .line 130
    .restart local v0    # "context":Landroid/content/Context;
    instance-of v2, v0, Ldagger/hilt/internal/GeneratedComponentManager;

    if-eqz v2, :cond_3

    .line 131
    move-object v1, v0

    check-cast v1, Ldagger/hilt/internal/GeneratedComponentManager;

    return-object v1

    .line 132
    :cond_3
    if-eqz p1, :cond_4

    .line 133
    return-object v1

    .line 138
    .end local v0    # "context":Landroid/content/Context;
    :cond_4
    :goto_0
    new-instance v0, Ljava/lang/IllegalStateException;

    iget-object v1, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->view:Landroid/view/View;

    .line 141
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 139
    const-string v2, "%s, Hilt view must be attached to an @AndroidEntryPoint Fragment or Activity."

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private getParentContext(Ljava/lang/Class;Z)Landroid/content/Context;
    .locals 3
    .param p2, "allowMissing"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "parentType",
            "allowMissing"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;Z)",
            "Landroid/content/Context;"
        }
    .end annotation

    .line 146
    .local p1, "parentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->view:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Ldagger/hilt/android/internal/managers/ViewComponentManager;->unwrap(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Context;

    move-result-object v0

    .line 147
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Ldagger/hilt/android/internal/Contexts;->getApplication(Landroid/content/Context;)Landroid/app/Application;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 150
    iget-object v1, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->view:Landroid/view/View;

    .line 154
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 150
    const-string v2, "%s, Hilt view cannot be created using the application context. Use a Hilt Fragment or Activity context."

    invoke-static {p2, v2, v1}, Ldagger/hilt/internal/Preconditions;->checkState(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 155
    const/4 v1, 0x0

    return-object v1

    .line 157
    :cond_0
    return-object v0
.end method

.method private static unwrap(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Context;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/Class<",
            "*>;)",
            "Landroid/content/Context;"
        }
    .end annotation

    .line 161
    .local p1, "target":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    nop

    :goto_0
    instance-of v0, p0, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_0

    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 162
    move-object v0, p0

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    goto :goto_0

    .line 164
    :cond_0
    return-object p0
.end method


# virtual methods
.method public generatedComponent()Ljava/lang/Object;
    .locals 2

    .line 76
    iget-object v0, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->component:Ljava/lang/Object;

    if-nez v0, :cond_1

    .line 77
    iget-object v0, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->componentLock:Ljava/lang/Object;

    monitor-enter v0

    .line 78
    :try_start_0
    iget-object v1, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->component:Ljava/lang/Object;

    if-nez v1, :cond_0

    .line 79
    invoke-direct {p0}, Ldagger/hilt/android/internal/managers/ViewComponentManager;->createComponent()Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->component:Ljava/lang/Object;

    .line 81
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 83
    :cond_1
    :goto_0
    iget-object v0, p0, Ldagger/hilt/android/internal/managers/ViewComponentManager;->component:Ljava/lang/Object;

    return-object v0
.end method

.method public maybeGetParentComponentManager()Ldagger/hilt/internal/GeneratedComponentManager;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ldagger/hilt/internal/GeneratedComponentManager<",
            "*>;"
        }
    .end annotation

    .line 103
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Ldagger/hilt/android/internal/managers/ViewComponentManager;->getParentComponentManager(Z)Ldagger/hilt/internal/GeneratedComponentManager;

    move-result-object v0

    return-object v0
.end method
