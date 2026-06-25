.class Lcom/itextpdf/io/font/woff2/Woff2Dec$Checksums;
.super Ljava/lang/Object;
.source "Woff2Dec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/woff2/Woff2Dec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Checksums"
.end annotation


# instance fields
.field public glyph_checksum:I

.field public loca_checksum:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .param p1, "loca_checksum"    # I
    .param p2, "glyph_checksum"    # I

    .line 617
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 618
    iput p1, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$Checksums;->loca_checksum:I

    .line 619
    iput p2, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$Checksums;->glyph_checksum:I

    .line 620
    return-void
.end method
