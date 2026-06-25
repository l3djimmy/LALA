.class public Lcom/itextpdf/io/font/cmap/CMapLocationResource;
.super Ljava/lang/Object;
.source "CMapLocationResource.java"

# interfaces
.implements Lcom/itextpdf/io/font/cmap/ICMapLocation;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getLocation(Ljava/lang/String;)Lcom/itextpdf/io/source/PdfTokenizer;
    .locals 5
    .param p1, "location"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/itextpdf/io/font/cmap/CMapLocationResource;->getLocationPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, "fullName":Ljava/lang/String;
    invoke-static {v0}, Lcom/itextpdf/io/util/ResourceUtil;->getResourceStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 41
    .local v1, "inp":Ljava/io/InputStream;
    if-eqz v1, :cond_0

    .line 44
    new-instance v2, Lcom/itextpdf/io/source/PdfTokenizer;

    new-instance v3, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    new-instance v4, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v4}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    invoke-virtual {v4, v1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource(Ljava/io/InputStream;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    invoke-direct {v2, v3}, Lcom/itextpdf/io/source/PdfTokenizer;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)V

    return-object v2

    .line 42
    :cond_0
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "The CMap {0} was not found."

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v2

    throw v2
.end method

.method public getLocationPath()Ljava/lang/String;
    .locals 1

    .line 53
    const-string v0, "com/itextpdf/io/font/cmap/"

    return-object v0
.end method
