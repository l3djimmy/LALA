.class final Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewCImpl;
.super Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ViewC;
.source "DaggerLalaApplication_HiltComponents_SingletonC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ViewCImpl"
.end annotation


# instance fields
.field private final activityCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

.field private final activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

.field private final singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

.field private final viewCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewCImpl;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;Landroid/view/View;)V
    .locals 0
    .param p1, "singletonCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;
    .param p2, "activityRetainedCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;
    .param p3, "activityCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;
    .param p4, "viewParam"    # Landroid/view/View;
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
            "viewParam"
        }
    .end annotation

    .line 342
    invoke-direct {p0}, Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ViewC;-><init>()V

    .line 339
    iput-object p0, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewCImpl;->viewCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewCImpl;

    .line 343
    iput-object p1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewCImpl;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    .line 344
    iput-object p2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewCImpl;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    .line 345
    iput-object p3, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewCImpl;->activityCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

    .line 348
    return-void
.end method
