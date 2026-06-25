.class public Lcom/itextpdf/io/font/cmap/CMapLocationFromBytes;
.super Ljava/lang/Object;
.source "CMapLocationFromBytes.java"

# interfaces
.implements Lcom/itextpdf/io/font/cmap/ICMapLocation;


# instance fields
.field private data:[B


# direct methods
.method public constructor <init>([B)V
    .locals 0
    .param p1, "data"    # [B

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/itextpdf/io/font/cmap/CMapLocationFromBytes;->data:[B

    .line 35
    return-void
.end method


# virtual methods
.method public getLocation(Ljava/lang/String;)Lcom/itextpdf/io/source/PdfTokenizer;
    .locals 4
    .param p1, "location"    # Ljava/lang/String;

    .line 38
    new-instance v0, Lcom/itextpdf/io/source/PdfTokenizer;

    new-instance v1, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    new-instance v2, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v2}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    iget-object v3, p0, Lcom/itextpdf/io/font/cmap/CMapLocationFromBytes;->data:[B

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/PdfTokenizer;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)V

    return-object v0
.end method
