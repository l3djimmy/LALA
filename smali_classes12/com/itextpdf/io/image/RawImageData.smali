.class public Lcom/itextpdf/io/image/RawImageData;
.super Lcom/itextpdf/io/image/ImageData;
.source "RawImageData.java"


# static fields
.field public static final CCITTG3_1D:I = 0x101

.field public static final CCITTG3_2D:I = 0x102

.field public static final CCITTG4:I = 0x100

.field public static final CCITT_BLACKIS1:I = 0x1

.field public static final CCITT_ENCODEDBYTEALIGN:I = 0x2

.field public static final CCITT_ENDOFBLOCK:I = 0x8

.field public static final CCITT_ENDOFLINE:I = 0x4


# instance fields
.field protected typeCcitt:I


# direct methods
.method protected constructor <init>(Ljava/net/URL;Lcom/itextpdf/io/image/ImageType;)V
    .locals 0
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "type"    # Lcom/itextpdf/io/image/ImageType;

    .line 74
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/io/image/ImageData;-><init>(Ljava/net/URL;Lcom/itextpdf/io/image/ImageType;)V

    .line 75
    return-void
.end method

.method protected constructor <init>([BLcom/itextpdf/io/image/ImageType;)V
    .locals 0
    .param p1, "bytes"    # [B
    .param p2, "type"    # Lcom/itextpdf/io/image/ImageType;

    .line 78
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/io/image/ImageData;-><init>([BLcom/itextpdf/io/image/ImageType;)V

    .line 79
    return-void
.end method


# virtual methods
.method public getTypeCcitt()I
    .locals 1

    .line 87
    iget v0, p0, Lcom/itextpdf/io/image/RawImageData;->typeCcitt:I

    return v0
.end method

.method public isRawImage()Z
    .locals 1

    .line 83
    const/4 v0, 0x1

    return v0
.end method

.method public setTypeCcitt(I)V
    .locals 0
    .param p1, "typeCcitt"    # I

    .line 91
    iput p1, p0, Lcom/itextpdf/io/image/RawImageData;->typeCcitt:I

    .line 92
    return-void
.end method
