.class public Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils$InlineImageParseException;
.super Lcom/itextpdf/kernel/exceptions/PdfException;
.source "InlineImageParsingUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InlineImageParseException"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .line 63
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .line 64
    return-void
.end method
