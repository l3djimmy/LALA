.class public Lcom/itextpdf/kernel/exceptions/BadPasswordException;
.super Lcom/itextpdf/kernel/exceptions/PdfException;
.source "BadPasswordException.java"


# static fields
.field public static final PdfReaderNotOpenedWithOwnerPassword:Ljava/lang/String; = "PdfReader is not opened with owner password"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .line 40
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 41
    return-void
.end method
