.class public Lcom/itextpdf/io/codec/TiffWriter$FieldByte;
.super Lcom/itextpdf/io/codec/TiffWriter$FieldBase;
.source "TiffWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/codec/TiffWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FieldByte"
.end annotation


# direct methods
.method public constructor <init>(I[B)V
    .locals 2
    .param p1, "tag"    # I
    .param p2, "values"    # [B

    .line 196
    const/4 v0, 0x1

    array-length v1, p2

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;-><init>(III)V

    .line 197
    iput-object p2, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldByte;->data:[B

    .line 198
    return-void
.end method
