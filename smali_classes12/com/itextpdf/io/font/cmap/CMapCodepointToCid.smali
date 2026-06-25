.class public Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;
.super Lcom/itextpdf/io/font/cmap/AbstractCMap;
.source "CMapCodepointToCid.java"


# instance fields
.field private final map:Lcom/itextpdf/io/util/IntHashtable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 37
    invoke-direct {p0}, Lcom/itextpdf/io/font/cmap/AbstractCMap;-><init>()V

    .line 38
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    invoke-direct {v0}, Lcom/itextpdf/io/util/IntHashtable;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;->map:Lcom/itextpdf/io/util/IntHashtable;

    .line 39
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;)V
    .locals 1
    .param p1, "reverseMap"    # Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    .line 41
    invoke-direct {p0}, Lcom/itextpdf/io/font/cmap/AbstractCMap;-><init>()V

    .line 42
    invoke-virtual {p1}, Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;->getReversMap()Lcom/itextpdf/io/util/IntHashtable;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;->map:Lcom/itextpdf/io/util/IntHashtable;

    .line 43
    return-void
.end method


# virtual methods
.method addChar(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapObject;)V
    .locals 6
    .param p1, "mark"    # Ljava/lang/String;
    .param p2, "code"    # Lcom/itextpdf/io/font/cmap/CMapObject;

    .line 47
    invoke-virtual {p2}, Lcom/itextpdf/io/font/cmap/CMapObject;->isNumber()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 48
    invoke-static {p1}, Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;->decodeStringToByte(Ljava/lang/String;)[B

    move-result-object v0

    .line 49
    .local v0, "ser":[B
    const/4 v1, 0x0

    .line 50
    .local v1, "byteCode":I
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-byte v4, v0, v3

    .line 51
    .local v4, "b":B
    shl-int/lit8 v1, v1, 0x8

    .line 52
    and-int/lit16 v5, v4, 0xff

    add-int/2addr v1, v5

    .line 50
    .end local v4    # "b":B
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 54
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;->map:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {p2}, Lcom/itextpdf/io/font/cmap/CMapObject;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v1, v3}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 56
    .end local v0    # "ser":[B
    .end local v1    # "byteCode":I
    :cond_1
    return-void
.end method

.method public lookup(I)I
    .locals 1
    .param p1, "codepoint"    # I

    .line 59
    iget-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;->map:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/util/IntHashtable;->get(I)I

    move-result v0

    return v0
.end method
