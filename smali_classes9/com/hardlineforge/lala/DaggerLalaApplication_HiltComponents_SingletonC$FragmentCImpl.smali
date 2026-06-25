.class final Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;
.super Lcom/hardlineforge/lala/LalaApplication_HiltComponents$FragmentC;
.source "DaggerLalaApplication_HiltComponents_SingletonC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FragmentCImpl"
.end annotation


# instance fields
.field private final activityCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

.field private final activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

.field private final fragmentCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;

.field private final singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;Landroidx/fragment/app/Fragment;)V
    .locals 0
    .param p1, "singletonCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;
    .param p2, "activityRetainedCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;
    .param p3, "activityCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;
    .param p4, "fragmentParam"    # Landroidx/fragment/app/Fragment;
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
            "activityCImpl",
            "fragmentParam"
        }
    .end annotation

    .line 313
    invoke-direct {p0}, Lcom/hardlineforge/lala/LalaApplication_HiltComponents$FragmentC;-><init>()V

    .line 310
    iput-object p0, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;->fragmentCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;

    .line 314
    iput-object p1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    .line 315
    iput-object p2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    .line 316
    iput-object p3, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;->activityCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

    .line 319
    return-void
.end method


# virtual methods
.method public getHiltInternalFactoryFactory()Ldagger/hilt/android/internal/lifecycle/DefaultViewModelFactories$InternalFactoryFactory;
    .locals 1

    .line 323
    iget-object v0, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;->activityCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;->getHiltInternalFactoryFactory()Ldagger/hilt/android/internal/lifecycle/DefaultViewModelFactories$InternalFactoryFactory;

    move-result-object v0

    return-object v0
.end method

.method public viewWithFragmentComponentBuilder()Ldagger/hilt/android/internal/builders/ViewWithFragmentComponentBuilder;
    .locals 6

    .line 328
    new-instance v0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;

    iget-object v1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    iget-object v2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    iget-object v3, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;->activityCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

    iget-object v4, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;->fragmentCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;-><init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC-IA;)V

    return-object v0
.end method
