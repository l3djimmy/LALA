.class public Lcom/itextpdf/io/font/CMapEncoding;
.super Ljava/lang/Object;
.source "CMapEncoding.java"


# static fields
.field private static final IDENTITY_H_V_CODESPACE_RANGES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field


# instance fields
.field private cid2Code:Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

.field private final cmap:Ljava/lang/String;

.field private code2Cid:Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;

.field private codeSpaceRanges:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field

.field private isDirect:Z

.field private uniMap:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 40
    const/4 v0, 0x2

    new-array v1, v0, [B

    fill-array-data v1, :array_0

    new-array v0, v0, [B

    fill-array-data v0, :array_1

    filled-new-array {v1, v0}, [[B

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/font/CMapEncoding;->IDENTITY_H_V_CODESPACE_RANGES:Ljava/util/List;

    return-void

    :array_0
    .array-data 1
        0x0t
        0x0t
    .end array-data

    nop

    :array_1
    .array-data 1
        -0x1t
        -0x1t
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "cmap"    # Ljava/lang/String;

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Lcom/itextpdf/io/font/CMapEncoding;->cmap:Ljava/lang/String;

    .line 60
    const-string v0, "Identity-H"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Identity-V"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 61
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->isDirect:Z

    .line 65
    :cond_1
    sget-object v0, Lcom/itextpdf/io/font/CMapEncoding;->IDENTITY_H_V_CODESPACE_RANGES:Ljava/util/List;

    iput-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->codeSpaceRanges:Ljava/util/List;

    .line 66
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "cmap"    # Ljava/lang/String;
    .param p2, "uniMap"    # Ljava/lang/String;

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object p1, p0, Lcom/itextpdf/io/font/CMapEncoding;->cmap:Ljava/lang/String;

    .line 75
    iput-object p2, p0, Lcom/itextpdf/io/font/CMapEncoding;->uniMap:Ljava/lang/String;

    .line 76
    const-string v0, "Identity-H"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "Identity-V"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 80
    :cond_0
    invoke-static {p1}, Lcom/itextpdf/io/font/CjkResourceLoader;->getCidToCodepointCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->cid2Code:Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    .line 81
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->cid2Code:Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    invoke-static {p1, v0}, Lcom/itextpdf/io/font/CMapEncoding;->getCodeToCidCmap(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;)Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->code2Cid:Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;

    .line 82
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->cid2Code:Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;->getCodeSpaceRanges()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->codeSpaceRanges:Ljava/util/List;

    goto :goto_1

    .line 77
    :cond_1
    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->isDirect:Z

    .line 78
    sget-object v0, Lcom/itextpdf/io/font/CMapEncoding;->IDENTITY_H_V_CODESPACE_RANGES:Ljava/util/List;

    iput-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->codeSpaceRanges:Ljava/util/List;

    .line 84
    :goto_1
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 3
    .param p1, "cmap"    # Ljava/lang/String;
    .param p2, "cmapBytes"    # [B

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-object p1, p0, Lcom/itextpdf/io/font/CMapEncoding;->cmap:Ljava/lang/String;

    .line 88
    new-instance v0, Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    invoke-direct {v0}, Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->cid2Code:Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    .line 90
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->cid2Code:Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    new-instance v1, Lcom/itextpdf/io/font/cmap/CMapLocationFromBytes;

    invoke-direct {v1, p2}, Lcom/itextpdf/io/font/cmap/CMapLocationFromBytes;-><init>([B)V

    invoke-static {p1, v0, v1}, Lcom/itextpdf/io/font/cmap/CMapParser;->parseCid(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/AbstractCMap;Lcom/itextpdf/io/font/cmap/ICMapLocation;)V

    .line 91
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->cid2Code:Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    invoke-static {p1, v0}, Lcom/itextpdf/io/font/CMapEncoding;->getCodeToCidCmap(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;)Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->code2Cid:Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;

    .line 92
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->cid2Code:Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;->getCodeSpaceRanges()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->codeSpaceRanges:Ljava/util/List;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    goto :goto_0

    .line 93
    :catch_0
    move-exception v0

    .line 94
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    const-string v2, "Failed to parse encoding stream."

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 96
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method private static getCodeToCidCmap(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;)Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;
    .locals 2
    .param p0, "cmap"    # Ljava/lang/String;
    .param p1, "cid2Code"    # Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    .line 200
    :try_start_0
    invoke-static {p0}, Lcom/itextpdf/io/font/CjkResourceLoader;->getCodepointToCidCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;

    move-result-object v0
    :try_end_0
    .catch Lcom/itextpdf/io/exceptions/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 201
    :catch_0
    move-exception v0

    .line 203
    .local v0, "ex":Lcom/itextpdf/io/exceptions/IOException;
    new-instance v1, Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;

    invoke-direct {v1, p1}, Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;-><init>(Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;)V

    return-object v1
.end method


# virtual methods
.method public fillCmapBytes(I[BI)I
    .locals 4
    .param p1, "cid"    # I
    .param p2, "array"    # [B
    .param p3, "offset"    # I

    .line 156
    iget-boolean v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->isDirect:Z

    if-eqz v0, :cond_0

    .line 157
    add-int/lit8 v0, p3, 0x1

    .end local p3    # "offset":I
    .local v0, "offset":I
    const v1, 0xff00

    and-int/2addr v1, p1

    shr-int/lit8 v1, v1, 0x8

    int-to-byte v1, v1

    aput-byte v1, p2, p3

    .line 158
    add-int/lit8 p3, v0, 0x1

    .end local v0    # "offset":I
    .restart local p3    # "offset":I
    and-int/lit16 v1, p1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    goto :goto_1

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->cid2Code:Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;->lookup(I)[B

    move-result-object v0

    .line 161
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 162
    add-int/lit8 v2, p3, 0x1

    .end local p3    # "offset":I
    .local v2, "offset":I
    aget-byte v3, v0, v1

    aput-byte v3, p2, p3

    .line 161
    add-int/lit8 v1, v1, 0x1

    move p3, v2

    goto :goto_0

    .line 165
    .end local v0    # "bytes":[B
    .end local v1    # "i":I
    .end local v2    # "offset":I
    .restart local p3    # "offset":I
    :cond_1
    :goto_1
    return p3
.end method

.method public fillCmapBytes(ILcom/itextpdf/io/source/ByteBuffer;)V
    .locals 1
    .param p1, "cid"    # I
    .param p2, "buffer"    # Lcom/itextpdf/io/source/ByteBuffer;

    .line 169
    iget-boolean v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->isDirect:Z

    if-eqz v0, :cond_0

    .line 170
    const v0, 0xff00

    and-int/2addr v0, p1

    shr-int/lit8 v0, v0, 0x8

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 171
    and-int/lit16 v0, p1, 0xff

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(B)Lcom/itextpdf/io/source/ByteBuffer;

    goto :goto_0

    .line 173
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->cid2Code:Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;->lookup(I)[B

    move-result-object v0

    .line 174
    .local v0, "bytes":[B
    invoke-virtual {p2, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append([B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 176
    .end local v0    # "bytes":[B
    :goto_0
    return-void
.end method

.method public getCidCode(I)I
    .locals 1
    .param p1, "cmapCode"    # I

    .line 187
    iget-boolean v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->isDirect:Z

    if-eqz v0, :cond_0

    .line 188
    return p1

    .line 190
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->code2Cid:Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;->lookup(I)I

    move-result v0

    return v0
.end method

.method public getCmapBytes(I)[B
    .locals 3
    .param p1, "cid"    # I

    .line 149
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/font/CMapEncoding;->getCmapBytesLength(I)I

    move-result v0

    .line 150
    .local v0, "length":I
    new-array v1, v0, [B

    .line 151
    .local v1, "result":[B
    const/4 v2, 0x0

    invoke-virtual {p0, p1, v1, v2}, Lcom/itextpdf/io/font/CMapEncoding;->fillCmapBytes(I[BI)I

    .line 152
    return-object v1
.end method

.method public getCmapBytesLength(I)I
    .locals 1
    .param p1, "cid"    # I

    .line 179
    iget-boolean v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->isDirect:Z

    if-eqz v0, :cond_0

    .line 180
    const/4 v0, 0x2

    return v0

    .line 182
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->cid2Code:Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;->lookup(I)[B

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public getCmapName()Ljava/lang/String;
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->cmap:Ljava/lang/String;

    return-object v0
.end method

.method public getCodeSpaceRanges()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation

    .line 195
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->codeSpaceRanges:Ljava/util/List;

    return-object v0
.end method

.method public getOrdering()Ljava/lang/String;
    .locals 1

    .line 115
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CMapEncoding;->isDirect()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 116
    const-string v0, "Identity"

    return-object v0

    .line 118
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->cid2Code:Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;->getOrdering()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRegistry()Ljava/lang/String;
    .locals 1

    .line 107
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CMapEncoding;->isDirect()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    const-string v0, "Adobe"

    return-object v0

    .line 110
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->cid2Code:Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;->getRegistry()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSupplement()I
    .locals 1

    .line 123
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CMapEncoding;->isDirect()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 124
    const/4 v0, 0x0

    return v0

    .line 126
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->cid2Code:Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;->getSupplement()I

    move-result v0

    return v0
.end method

.method public getUniMapName()Ljava/lang/String;
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->uniMap:Ljava/lang/String;

    return-object v0
.end method

.method public hasUniMap()Z
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->uniMap:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->uniMap:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isBuiltWith(Ljava/lang/String;)Z
    .locals 1
    .param p1, "cmap"    # Ljava/lang/String;

    .line 145
    iget-object v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->cmap:Ljava/lang/String;

    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isDirect()Z
    .locals 1

    .line 99
    iget-boolean v0, p0, Lcom/itextpdf/io/font/CMapEncoding;->isDirect:Z

    return v0
.end method
