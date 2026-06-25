.class final Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCImpl;
.super Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ViewWithFragmentC;
.source "DaggerLalaApplication_HiltComponents_SingletonC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ViewWithFragmentCImpl"
.end annotation


# instance fields
.field private final activityCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

.field private final activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

.field private final fragmentCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;

.field private final singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

.field private final viewWithFragmentCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCImpl;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;Landroid/view/View;)V
    .locals 0
    .param p1, "singletonCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;
    .param p2, "activityRetainedCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;
    .param p3, "activityCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;
    .param p4, "fragmentCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;
    .param p5, "viewParam"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "singletonCImpl",
            "activityRetainedCImpl",
            "activityCImpl",
            "fragmentCImpl",
            "viewParam"
        }
    .end annotation

    .line 293
    invoke-direct {p0}, Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ViewWithFragmentC;-><init>()V

    .line 289
    iput-object p0, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCImpl;->viewWithFragmentCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCImpl;

    .line 294
    iput-object p1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCImpl;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    .line 295
    iput-object p2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCImpl;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    .line 296
    iput-object p3, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCImpl;->activityCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

    .line 297
    iput-object p4, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCImpl;->fragmentCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;

    .line 300
    return-void
.end method
