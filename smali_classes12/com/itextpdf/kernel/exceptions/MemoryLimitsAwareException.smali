.class public Lcom/itextpdf/kernel/exceptions/MemoryLimitsAwareException;
.super Lcom/itextpdf/kernel/exceptions/PdfException;
.source "MemoryLimitsAwareException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .line 38
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .line 57
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "cause"    # Ljava/lang/Throwable;

    .line 47
    const-string v0, "Unknown PdfException."

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/kernel/exceptions/MemoryLimitsAwareException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 48
    return-void
.end method
