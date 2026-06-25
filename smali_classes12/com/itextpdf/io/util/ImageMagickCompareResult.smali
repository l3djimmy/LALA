.class public final Lcom/itextpdf/io/util/ImageMagickCompareResult;
.super Ljava/lang/Object;
.source "ImageMagickCompareResult.java"


# instance fields
.field private final diffPixels:J

.field private final result:Z


# direct methods
.method public constructor <init>(ZJ)V
    .locals 0
    .param p1, "result"    # Z
    .param p2, "diffPixels"    # J

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-boolean p1, p0, Lcom/itextpdf/io/util/ImageMagickCompareResult;->result:Z

    .line 42
    iput-wide p2, p0, Lcom/itextpdf/io/util/ImageMagickCompareResult;->diffPixels:J

    .line 43
    return-void
.end method


# virtual methods
.method public getDiffPixels()J
    .locals 2

    .line 60
    iget-wide v0, p0, Lcom/itextpdf/io/util/ImageMagickCompareResult;->diffPixels:J

    return-wide v0
.end method

.method public isComparingResultSuccessful()Z
    .locals 1

    .line 51
    iget-boolean v0, p0, Lcom/itextpdf/io/util/ImageMagickCompareResult;->result:Z

    return v0
.end method
