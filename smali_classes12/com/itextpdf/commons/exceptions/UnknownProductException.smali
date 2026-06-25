.class public Lcom/itextpdf/commons/exceptions/UnknownProductException;
.super Lcom/itextpdf/commons/exceptions/ITextException;
.source "UnknownProductException.java"


# static fields
.field public static final UNKNOWN_PRODUCT:Ljava/lang/String; = "Product {0} is unknown. Probably you have to register it."


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .line 44
    invoke-direct {p0, p1}, Lcom/itextpdf/commons/exceptions/ITextException;-><init>(Ljava/lang/String;)V

    .line 45
    return-void
.end method
