.class final Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCBuilder;
.super Ljava/lang/Object;
.source "DaggerLalaApplication_HiltComponents_SingletonC.java"

# interfaces
.implements Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ActivityC$Builder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ActivityCBuilder"
.end annotation


# instance fields
.field private activity:Landroid/app/Activity;

.field private final activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

.field private final singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;


# direct methods
.method private constructor <init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;)V
    .locals 0
    .param p1, "singletonCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;
    .param p2, "activityRetainedCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "singletonCImpl",
            "activityRetainedCImpl"
        }
    .end annotation

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    iput-object p1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCBuilder;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    .line 116
    iput-object p2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCBuilder;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    .line 117
    return-void
.end method

.method synthetic constructor <init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC-IA;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCBuilder;-><init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;)V

    return-void
.end method


# virtual methods
.method public activity(Landroid/app/Activity;)Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCBuilder;
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "activity"
        }
    .end annotation

    .line 121
    invoke-static {p1}, Ldagger/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    iput-object v0, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCBuilder;->activity:Landroid/app/Activity;

    .line 122
    return-object p0
.end method

.method public bridge synthetic activity(Landroid/app/Activity;)Ldagger/hilt/android/internal/builders/ActivityComponentBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "activity"
        }
    .end annotation

    .line 106
    invoke-virtual {p0, p1}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCBuilder;->activity(Landroid/app/Activity;)Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCBuilder;

    move-result-object p1

    return-object p1
.end method

.method public build()Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ActivityC;
    .locals 4

    .line 127
    iget-object v0, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCBuilder;->activity:Landroid/app/Activity;

    const-class v1, Landroid/app/Activity;

    invoke-static {v0, v1}, Ldagger/internal/Preconditions;->checkBuilderRequirement(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 128
    new-instance v0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;

    iget-object v1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCBuilder;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    iget-object v2, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCBuilder;->activityRetainedCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;

    iget-object v3, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCBuilder;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1, v2, v3}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;-><init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;Landroid/app/Activity;)V

    return-object v0
.end method

.method public bridge synthetic build()Ldagger/hilt/android/components/ActivityComponent;
    .locals 1

    .line 106
    invoke-virtual {p0}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCBuilder;->build()Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ActivityC;

    move-result-object v0

    return-object v0
.end method
