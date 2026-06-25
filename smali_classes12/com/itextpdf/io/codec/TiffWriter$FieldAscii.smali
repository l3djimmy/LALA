.class public Lcom/itextpdf/io/codec/TiffWriter$FieldAscii;
.super Lcom/itextpdf/io/codec/TiffWriter$FieldBase;
.source "TiffWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/codec/TiffWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FieldAscii"
.end annotation


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 4
    .param p1, "tag"    # I
    .param p2, "values"    # Ljava/lang/String;

    .line 226
    sget-object v0, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    const/4 v1, 0x2

    invoke-direct {p0, p1, v1, v0}, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;-><init>(III)V

    .line 227
    sget-object v0, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 228
    .local v0, "b":[B
    array-length v1, v0

    add-int/lit8 v1, v1, 0x1

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldAscii;->data:[B

    .line 229
    iget-object v1, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldAscii;->data:[B

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 230
    return-void
.end method
