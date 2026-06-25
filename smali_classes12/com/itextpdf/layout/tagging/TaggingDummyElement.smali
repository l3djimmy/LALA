.class public Lcom/itextpdf/layout/tagging/TaggingDummyElement;
.super Ljava/lang/Object;
.source "TaggingDummyElement.java"

# interfaces
.implements Lcom/itextpdf/layout/tagging/IAccessibleElement;
.implements Lcom/itextpdf/layout/IPropertyContainer;


# instance fields
.field private id:Ljava/lang/Object;

.field private properties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "role"    # Ljava/lang/String;

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/itextpdf/layout/tagging/TaggingDummyElement;->properties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    .line 47
    return-void
.end method


# virtual methods
.method public deleteOwnProperty(I)V
    .locals 1
    .param p1, "property"    # I

    .line 115
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/TaggingDummyElement;->properties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    return-object v0
.end method

.method public getDefaultProperty(I)Ljava/lang/Object;
    .locals 1
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 107
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getOwnProperty(I)Ljava/lang/Object;
    .locals 1
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 99
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getProperty(I)Ljava/lang/Object;
    .locals 1
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 62
    const/16 v0, 0x6d

    if-ne p1, v0, :cond_0

    .line 63
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/TaggingDummyElement;->id:Ljava/lang/Object;

    return-object v0

    .line 65
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public hasOwnProperty(I)Z
    .locals 1
    .param p1, "property"    # I

    .line 91
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public hasProperty(I)Z
    .locals 1
    .param p1, "property"    # I

    .line 83
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setProperty(ILjava/lang/Object;)V
    .locals 1
    .param p1, "property"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 73
    const/16 v0, 0x6d

    if-ne p1, v0, :cond_0

    .line 74
    iput-object p2, p0, Lcom/itextpdf/layout/tagging/TaggingDummyElement;->id:Ljava/lang/Object;

    .line 76
    :cond_0
    return-void
.end method
