.class final Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ServiceCImpl;
.super Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ServiceC;
.source "DaggerLalaApplication_HiltComponents_SingletonC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ServiceCImpl"
.end annotation


# instance fields
.field private final serviceCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ServiceCImpl;

.field private final singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;Landroid/app/Service;)V
    .locals 0
    .param p1, "singletonCImpl"    # Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;
    .param p2, "serviceParam"    # Landroid/app/Service;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "singletonCImpl",
            "serviceParam"
        }
    .end annotation

    .line 522
    invoke-direct {p0}, Lcom/hardlineforge/lala/LalaApplication_HiltComponents$ServiceC;-><init>()V

    .line 520
    iput-object p0, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ServiceCImpl;->serviceCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ServiceCImpl;

    .line 523
    iput-object p1, p0, Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$ServiceCImpl;->singletonCImpl:Lcom/hardlineforge/lala/DaggerLalaApplication_HiltComponents_SingletonC$SingletonCImpl;

    .line 526
    return-void
.end method
