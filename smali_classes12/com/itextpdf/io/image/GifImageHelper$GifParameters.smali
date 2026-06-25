.class Lcom/itextpdf/io/image/GifImageHelper$GifParameters;
.super Ljava/lang/Object;
.source "GifImageHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/image/GifImageHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GifParameters"
.end annotation


# instance fields
.field bgColor:I

.field bgIndex:I

.field block:[B

.field blockSize:I

.field currentFrame:I

.field delay:I

.field dispose:I

.field fromData:[B

.field fromUrl:Ljava/net/URL;

.field gctFlag:Z

.field ih:I

.field image:Lcom/itextpdf/io/image/GifImageData;

.field input:Ljava/io/InputStream;

.field interlace:Z

.field iw:I

.field ix:I

.field iy:I

.field lctFlag:Z

.field lctSize:I

.field m_bpc:I

.field m_curr_table:[B

.field m_gbpc:I

.field m_global_table:[B

.field m_line_stride:I

.field m_local_table:[B

.field m_out:[B

.field pixelAspect:I

.field pixelStack:[B

.field pixels:[B

.field prefix:[S

.field suffix:[B

.field transIndex:I

.field transparency:Z


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/image/GifImageData;)V
    .locals 1
    .param p1, "image"    # Lcom/itextpdf/io/image/GifImageData;

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const/16 v0, 0x100

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->block:[B

    .line 71
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->blockSize:I

    .line 75
    iput v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->dispose:I

    .line 77
    iput-boolean v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->transparency:Z

    .line 79
    iput v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->delay:I

    .line 44
    iput-object p1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->image:Lcom/itextpdf/io/image/GifImageData;

    .line 45
    return-void
.end method
