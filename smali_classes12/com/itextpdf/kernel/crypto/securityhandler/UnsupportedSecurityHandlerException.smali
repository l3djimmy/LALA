.class public Lcom/itextpdf/kernel/crypto/securityhandler/UnsupportedSecurityHandlerException;
.super Lcom/itextpdf/kernel/exceptions/PdfException;
.source "UnsupportedSecurityHandlerException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .line 30
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .line 31
    return-void
.end method
