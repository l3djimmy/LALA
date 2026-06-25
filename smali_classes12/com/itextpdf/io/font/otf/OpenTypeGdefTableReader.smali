.class public Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;
.super Ljava/lang/Object;
.source "OpenTypeGdefTableReader.java"


# static fields
.field static final FLAG_IGNORE_BASE:I = 0x2

.field static final FLAG_IGNORE_LIGATURE:I = 0x4

.field static final FLAG_IGNORE_MARK:I = 0x8


# instance fields
.field private glyphClass:Lcom/itextpdf/io/font/otf/OtfClass;

.field private markAttachmentClass:Lcom/itextpdf/io/font/otf/OtfClass;

.field private final rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

.field private final tableLocation:I


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;I)V
    .locals 0
    .param p1, "rf"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p2, "tableLocation"    # I

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 40
    iput p2, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->tableLocation:I

    .line 41
    return-void
.end method


# virtual methods
.method public getGlyphClassTable()Lcom/itextpdf/io/font/otf/OtfClass;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->glyphClass:Lcom/itextpdf/io/font/otf/OtfClass;

    return-object v0
.end method

.method public isSkip(II)Z
    .locals 6
    .param p1, "glyph"    # I
    .param p2, "flag"    # I

    .line 64
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->glyphClass:Lcom/itextpdf/io/font/otf/OtfClass;

    const/4 v1, 0x3

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    and-int/lit8 v0, p2, 0xe

    if-eqz v0, :cond_2

    .line 65
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->glyphClass:Lcom/itextpdf/io/font/otf/OtfClass;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/otf/OtfClass;->getOtfClass(I)I

    move-result v0

    .line 66
    .local v0, "cla":I
    if-ne v0, v2, :cond_0

    and-int/lit8 v3, p2, 0x2

    if-eqz v3, :cond_0

    .line 67
    return v2

    .line 69
    :cond_0
    if-ne v0, v1, :cond_1

    and-int/lit8 v3, p2, 0x8

    if-eqz v3, :cond_1

    .line 70
    return v2

    .line 72
    :cond_1
    const/4 v3, 0x2

    if-ne v0, v3, :cond_2

    and-int/lit8 v3, p2, 0x4

    if-eqz v3, :cond_2

    .line 73
    return v2

    .line 76
    .end local v0    # "cla":I
    :cond_2
    shr-int/lit8 v0, p2, 0x8

    .line 81
    .local v0, "markAttachmentType":I
    const/4 v3, 0x0

    if-eqz v0, :cond_5

    iget-object v4, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->glyphClass:Lcom/itextpdf/io/font/otf/OtfClass;

    if-eqz v4, :cond_5

    .line 82
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->glyphClass:Lcom/itextpdf/io/font/otf/OtfClass;

    invoke-virtual {v4, p1}, Lcom/itextpdf/io/font/otf/OtfClass;->getOtfClass(I)I

    move-result v4

    .line 84
    .local v4, "currentGlyphClass":I
    iget-object v5, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->markAttachmentClass:Lcom/itextpdf/io/font/otf/OtfClass;

    if-eqz v5, :cond_3

    iget-object v5, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->markAttachmentClass:Lcom/itextpdf/io/font/otf/OtfClass;

    invoke-virtual {v5, p1}, Lcom/itextpdf/io/font/otf/OtfClass;->getOtfClass(I)I

    move-result v5

    goto :goto_0

    :cond_3
    move v5, v3

    .line 85
    .local v5, "glyphMarkAttachmentClass":I
    :goto_0
    if-ne v4, v1, :cond_4

    if-eq v5, v0, :cond_4

    goto :goto_1

    :cond_4
    move v2, v3

    :goto_1
    return v2

    .line 87
    .end local v4    # "currentGlyphClass":I
    .end local v5    # "glyphMarkAttachmentClass":I
    :cond_5
    return v3
.end method

.method public readTable()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 44
    iget v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->tableLocation:I

    if-lez v0, :cond_1

    .line 45
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->tableLocation:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 47
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedInt()J

    .line 48
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v0

    .line 50
    .local v0, "glyphClassDefOffset":I
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    .line 52
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    .line 53
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 54
    .local v1, "markAttachClassDefOffset":I
    if-lez v0, :cond_0

    .line 55
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v3, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->tableLocation:I

    add-int/2addr v3, v0

    invoke-static {v2, v3}, Lcom/itextpdf/io/font/otf/OtfClass;->create(Lcom/itextpdf/io/source/RandomAccessFileOrArray;I)Lcom/itextpdf/io/font/otf/OtfClass;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->glyphClass:Lcom/itextpdf/io/font/otf/OtfClass;

    .line 57
    :cond_0
    if-lez v1, :cond_1

    .line 58
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v3, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->tableLocation:I

    add-int/2addr v3, v1

    invoke-static {v2, v3}, Lcom/itextpdf/io/font/otf/OtfClass;->create(Lcom/itextpdf/io/source/RandomAccessFileOrArray;I)Lcom/itextpdf/io/font/otf/OtfClass;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->markAttachmentClass:Lcom/itextpdf/io/font/otf/OtfClass;

    .line 61
    .end local v0    # "glyphClassDefOffset":I
    .end local v1    # "markAttachClassDefOffset":I
    :cond_1
    return-void
.end method
