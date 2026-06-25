.class final Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;
.super Ljava/lang/Object;
.source "DaggerLalaApplication_HiltComponents_SingletonC.java"

# interfaces
.implements Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ViewWithFragmentC$Builder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ViewWithFragmentCBuilder"
.end annotation


# instance fields
.field private final activityCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

.field private final activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

.field private final fragmentCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;

.field private final singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

.field private view:Landroid/view/View;


# direct methods
.method private constructor <init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;)V
    .locals 0
    .param p1, "singletonCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;
    .param p2, "activityRetainedCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;
    .param p3, "activityCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;
    .param p4, "fragmentCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;
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
            "fragmentCImpl"
        }
    .end annotation

    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 175
    iput-object p1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    .line 176
    iput-object p2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    .line 177
    iput-object p3, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;->activityCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

    .line 178
    iput-object p4, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;->fragmentCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;

    .line 179
    return-void
.end method

.method synthetic constructor <init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC-IA;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;-><init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;)V

    return-void
.end method


# virtual methods
.method public build()Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ViewWithFragmentC;
    .locals 8

    .line 189
    iget-object v0, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;->view:Landroid/view/View;

    const-class v1, Landroid/view/View;

    invoke-static {v0, v1}, Ldagger/internal/Preconditions;->checkBuilderRequirement(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 190
    new-instance v2, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCImpl;

    iget-object v3, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    iget-object v4, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    iget-object v5, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;->activityCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

    iget-object v6, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;->fragmentCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;

    iget-object v7, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;->view:Landroid/view/View;

    invoke-direct/range {v2 .. v7}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCImpl;-><init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;Landroid/view/View;)V

    return-object v2
.end method

.method public bridge synthetic build()Ldagger/hilt/android/components/ViewWithFragmentComponent;
    .locals 1

    .line 161
    invoke-virtual {p0}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;->build()Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ViewWithFragmentC;

    move-result-object v0

    return-object v0
.end method

.method public view(Landroid/view/View;)Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "view"
        }
    .end annotation

    .line 183
    invoke-static {p1}, Ldagger/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;->view:Landroid/view/View;

    .line 184
    return-object p0
.end method

.method public bridge synthetic view(Landroid/view/View;)Ldagger/hilt/android/internal/builders/ViewWithFragmentComponentBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "view"
        }
    .end annotation

    .line 161
    invoke-virtual {p0, p1}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;->view(Landroid/view/View;)Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;

    move-result-object p1

    return-object p1
.end method
