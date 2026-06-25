.class public Lcom/itextpdf/io/codec/TiffWriter$FieldImage;
.super Lcom/itextpdf/io/codec/TiffWriter$FieldBase;
.source "TiffWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/codec/TiffWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FieldImage"
.end annotation


# direct methods
.method public constructor <init>([B)V
    .locals 3
    .param p1, "values"    # [B

    .line 216
    const/4 v0, 0x4

    const/4 v1, 0x1

    const/16 v2, 0x111

    invoke-direct {p0, v2, v0, v1}, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;-><init>(III)V

    .line 217
    iput-object p1, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldImage;->data:[B

    .line 218
    return-void
.end method
