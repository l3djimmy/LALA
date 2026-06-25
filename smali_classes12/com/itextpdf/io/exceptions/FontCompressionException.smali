.class public Lcom/itextpdf/io/exceptions/FontCompressionException;
.super Lcom/itextpdf/commons/exceptions/ITextException;
.source "FontCompressionException.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/itextpdf/commons/exceptions/ITextException;-><init>()V

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .line 33
    invoke-direct {p0, p1}, Lcom/itextpdf/commons/exceptions/ITextException;-><init>(Ljava/lang/String;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .line 37
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/commons/exceptions/ITextException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 38
    return-void
.end method
