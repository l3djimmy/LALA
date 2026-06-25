.class public Lcom/itextpdf/io/font/otf/OpenTypeFeature;
.super Ljava/lang/Object;
.source "OpenTypeFeature.java"


# instance fields
.field private openTypeReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

.field private records:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/FeatureRecord;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V
    .locals 9
    .param p1, "openTypeReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "locationFeatureTable"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFeature;->openTypeReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFeature;->records:Ljava/util/List;

    .line 35
    iget-object v0, p1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v1, p2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 36
    invoke-virtual {p1, p2}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readTagAndLocations(I)[Lcom/itextpdf/io/font/otf/TagAndLocation;

    move-result-object v0

    .line 37
    .local v0, "tagsLocs":[Lcom/itextpdf/io/font/otf/TagAndLocation;
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 39
    .local v3, "tagLoc":Lcom/itextpdf/io/font/otf/TagAndLocation;
    iget-object v4, p1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v5, v3, Lcom/itextpdf/io/font/otf/TagAndLocation;->location:I

    int-to-long v5, v5

    const-wide/16 v7, 0x2

    add-long/2addr v5, v7

    invoke-virtual {v4, v5, v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 40
    iget-object v4, p1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    .line 41
    .local v4, "lookupCount":I
    new-instance v5, Lcom/itextpdf/io/font/otf/FeatureRecord;

    invoke-direct {v5}, Lcom/itextpdf/io/font/otf/FeatureRecord;-><init>()V

    .line 42
    .local v5, "rec":Lcom/itextpdf/io/font/otf/FeatureRecord;
    iget-object v6, v3, Lcom/itextpdf/io/font/otf/TagAndLocation;->tag:Ljava/lang/String;

    iput-object v6, v5, Lcom/itextpdf/io/font/otf/FeatureRecord;->tag:Ljava/lang/String;

    .line 43
    invoke-virtual {p1, v4}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(I)[I

    move-result-object v6

    iput-object v6, v5, Lcom/itextpdf/io/font/otf/FeatureRecord;->lookups:[I

    .line 44
    iget-object v6, p0, Lcom/itextpdf/io/font/otf/OpenTypeFeature;->records:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .end local v3    # "tagLoc":Lcom/itextpdf/io/font/otf/TagAndLocation;
    .end local v4    # "lookupCount":I
    .end local v5    # "rec":Lcom/itextpdf/io/font/otf/FeatureRecord;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 46
    :cond_0
    return-void
.end method


# virtual methods
.method public getRecord(I)Lcom/itextpdf/io/font/otf/FeatureRecord;
    .locals 1
    .param p1, "idx"    # I

    .line 53
    if-ltz p1, :cond_1

    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFeature;->records:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFeature;->records:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/otf/FeatureRecord;

    return-object v0

    .line 54
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRecords()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/FeatureRecord;",
            ">;"
        }
    .end annotation

    .line 49
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFeature;->records:Ljava/util/List;

    return-object v0
.end method
