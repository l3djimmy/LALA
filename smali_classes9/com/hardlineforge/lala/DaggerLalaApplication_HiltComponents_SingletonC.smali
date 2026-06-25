.class public final Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC;
.super Ljava/lang/Object;
.source "DaggerLalaApplication_HiltComponents_SingletonC.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$Builder;,
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;,
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ServiceCImpl;,
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCImpl;,
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCImpl;,
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCImpl;,
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewCImpl;,
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCImpl;,
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCImpl;,
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ServiceCBuilder;,
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewModelCBuilder;,
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewCBuilder;,
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ViewWithFragmentCBuilder;,
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$FragmentCBuilder;,
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityCBuilder;,
        Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ActivityRetainedCBuilder;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    return-void
.end method

.method public static builder()Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$Builder;
    .locals 2

    .line 63
    new-instance v0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$Builder;-><init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC-IA;)V

    return-object v0
.end method
