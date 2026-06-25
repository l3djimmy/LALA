.class public Lcom/itextpdf/layout/element/Tab;
.super Lcom/itextpdf/layout/element/AbstractElement;
.source "Tab.java"

# interfaces
.implements Lcom/itextpdf/layout/element/ILeafElement;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/layout/element/AbstractElement<",
        "Lcom/itextpdf/layout/element/Tab;",
        ">;",
        "Lcom/itextpdf/layout/element/ILeafElement;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/itextpdf/layout/element/AbstractElement;-><init>()V

    return-void
.end method


# virtual methods
.method protected makeNewRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 1

    .line 37
    new-instance v0, Lcom/itextpdf/layout/renderer/TabRenderer;

    invoke-direct {v0, p0}, Lcom/itextpdf/layout/renderer/TabRenderer;-><init>(Lcom/itextpdf/layout/element/Tab;)V

    return-object v0
.end method
