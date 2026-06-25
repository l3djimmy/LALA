.class public Lcom/itextpdf/io/codec/TiffWriter$FieldUndefined;
.super Lcom/itextpdf/io/codec/TiffWriter$FieldBase;
.source "TiffWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/codec/TiffWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FieldUndefined"
.end annotation


# direct methods
.method public constructor <init>(I[B)V
    .locals 2
    .param p1, "tag"    # I
    .param p2, "values"    # [B

    .line 206
    const/4 v0, 0x7

    array-length v1, p2

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;-><init>(III)V

    .line 207
    iput-object p2, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldUndefined;->data:[B

    .line 208
    return-void
.end method
