.class Lcom/itextpdf/io/font/woff2/Woff2Dec;
.super Ljava/lang/Object;
.source "Woff2Dec.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;,
        Lcom/itextpdf/io/font/woff2/Woff2Dec$Checksums;,
        Lcom/itextpdf/io/font/woff2/Woff2Dec$CompositeGlyphInfo;,
        Lcom/itextpdf/io/font/woff2/Woff2Dec$TableChecksumInfo;,
        Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;,
        Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;,
        Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;,
        Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final FLAG_ARG_1_AND_2_ARE_WORDS:I = 0x1

.field private static final FLAG_MORE_COMPONENTS:I = 0x20

.field private static final FLAG_WE_HAVE_AN_X_AND_Y_SCALE:I = 0x40

.field private static final FLAG_WE_HAVE_A_SCALE:I = 0x8

.field private static final FLAG_WE_HAVE_A_TWO_BY_TWO:I = 0x80

.field private static final FLAG_WE_HAVE_INSTRUCTIONS:I = 0x100

.field private static final kDefaultGlyphBuf:I = 0x1400

.field private static final kEndPtsOfContoursOffset:I = 0xa

.field private static final kGlyfOnCurve:I = 0x1

.field private static final kGlyfRepeat:I = 0x8

.field private static final kGlyfThisXIsSame:I = 0x10

.field private static final kGlyfThisYIsSame:I = 0x20

.field private static final kGlyfXShort:I = 0x2

.field private static final kGlyfYShort:I = 0x4

.field private static final kMaxPlausibleCompressionRatio:F = 100.0f


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 55
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static computeBbox(I[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;[B)V
    .locals 7
    .param p0, "n_points"    # I
    .param p1, "points"    # [Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    .param p2, "dst"    # [B

    .line 321
    const/4 v0, 0x0

    .line 322
    .local v0, "x_min":I
    const/4 v1, 0x0

    .line 323
    .local v1, "y_min":I
    const/4 v2, 0x0

    .line 324
    .local v2, "x_max":I
    const/4 v3, 0x0

    .line 326
    .local v3, "y_max":I
    if-lez p0, :cond_0

    .line 327
    const/4 v4, 0x0

    aget-object v5, p1, v4

    iget v0, v5, Lcom/itextpdf/io/font/woff2/Woff2Common$Point;->x:I

    .line 328
    aget-object v5, p1, v4

    iget v2, v5, Lcom/itextpdf/io/font/woff2/Woff2Common$Point;->x:I

    .line 329
    aget-object v5, p1, v4

    iget v1, v5, Lcom/itextpdf/io/font/woff2/Woff2Common$Point;->y:I

    .line 330
    aget-object v4, p1, v4

    iget v3, v4, Lcom/itextpdf/io/font/woff2/Woff2Common$Point;->y:I

    .line 332
    :cond_0
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_0
    if-ge v4, p0, :cond_1

    .line 333
    aget-object v5, p1, v4

    iget v5, v5, Lcom/itextpdf/io/font/woff2/Woff2Common$Point;->x:I

    .line 334
    .local v5, "x":I
    aget-object v6, p1, v4

    iget v6, v6, Lcom/itextpdf/io/font/woff2/Woff2Common$Point;->y:I

    .line 335
    .local v6, "y":I
    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 336
    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 337
    invoke-static {v6, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 338
    invoke-static {v6, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 332
    .end local v5    # "x":I
    .end local v6    # "y":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 340
    .end local v4    # "i":I
    :cond_1
    const/4 v4, 0x2

    .line 341
    .local v4, "offset":I
    invoke-static {p2, v4, v0}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result v4

    .line 342
    invoke-static {p2, v4, v1}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result v4

    .line 343
    invoke-static {p2, v4, v2}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result v4

    .line 344
    invoke-static {p2, v4, v3}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result v4

    .line 345
    return-void
.end method

.method private static computeOffsetToFirstTable(Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;)I
    .locals 6
    .param p0, "hdr"    # Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;

    .line 827
    iget-short v0, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->num_tables:S

    mul-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0xc

    .line 829
    .local v0, "offset":I
    iget v1, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->header_version:I

    if-eqz v1, :cond_1

    .line 830
    iget v1, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->header_version:I

    iget-object v2, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->ttc_fonts:[Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

    array-length v2, v2

    invoke-static {v1, v2}, Lcom/itextpdf/io/font/woff2/Woff2Common;->collectionHeaderSize(II)I

    move-result v1

    iget-object v2, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->ttc_fonts:[Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

    array-length v2, v2

    mul-int/lit8 v2, v2, 0xc

    add-int/2addr v1, v2

    .line 832
    .end local v0    # "offset":I
    .local v1, "offset":I
    iget-object v0, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->ttc_fonts:[Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v0, v3

    .line 833
    .local v4, "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    iget-object v5, v4, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;->table_indices:[S

    array-length v5, v5

    mul-int/lit8 v5, v5, 0x10

    add-int/2addr v1, v5

    .line 832
    .end local v4    # "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    .line 836
    .end local v1    # "offset":I
    .restart local v0    # "offset":I
    :cond_1
    return v0
.end method

.method public static computeWoff2FinalSize([BI)I
    .locals 2
    .param p0, "data"    # [B
    .param p1, "length"    # I

    .line 1186
    new-instance v0, Lcom/itextpdf/io/font/woff2/Buffer;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, p1}, Lcom/itextpdf/io/font/woff2/Buffer;-><init>([BII)V

    .line 1187
    .local v0, "file":Lcom/itextpdf/io/font/woff2/Buffer;
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/woff2/Buffer;->skip(I)V

    .line 1188
    invoke-virtual {v0}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    move-result v1

    return v1
.end method

.method public static convertWoff2ToTtf([BILcom/itextpdf/io/font/woff2/Woff2Out;)V
    .locals 13
    .param p0, "data"    # [B
    .param p1, "length"    # I
    .param p2, "out"    # Lcom/itextpdf/io/font/woff2/Woff2Out;

    .line 1195
    new-instance v0, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;-><init>(Lcom/itextpdf/io/font/woff2/Woff2Dec$1;)V

    move-object v5, v0

    .line 1196
    .local v5, "metadata":Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;
    new-instance v6, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;

    invoke-direct {v6, v1}, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;-><init>(Lcom/itextpdf/io/font/woff2/Woff2Dec$1;)V

    .line 1197
    .local v6, "hdr":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;
    invoke-static {p0, p1, v6}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->readWoff2Header([BILcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;)V

    .line 1199
    invoke-static {p0, p1, v5, v6, p2}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->writeHeaders([BILcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;Lcom/itextpdf/io/font/woff2/Woff2Out;)V

    .line 1201
    iget v0, v6, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->uncompressed_size:I

    int-to-float v0, v0

    int-to-float v1, p1

    div-float/2addr v0, v1

    .line 1202
    .local v0, "compression_ratio":F
    const/high16 v1, 0x42c80000    # 100.0f

    cmpl-float v1, v0, v1

    if-gtz v1, :cond_1

    .line 1206
    iget v1, v6, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->uncompressed_size:I

    new-array v2, v1, [B

    .line 1207
    .local v2, "uncompressed_buf":[B
    iget v9, v6, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->uncompressed_size:I

    iget v11, v6, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->compressed_offset:I

    iget v12, v6, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->compressed_length:I

    const/4 v8, 0x0

    move-object v10, p0

    move-object v7, v2

    .end local v2    # "uncompressed_buf":[B
    .end local p0    # "data":[B
    .local v7, "uncompressed_buf":[B
    .local v10, "data":[B
    invoke-static/range {v7 .. v12}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->woff2Uncompress([BII[BII)V

    .line 1209
    .end local v7    # "uncompressed_buf":[B
    .restart local v2    # "uncompressed_buf":[B
    const/4 p0, 0x0

    move v7, p0

    .local v7, "i":I
    :goto_0
    iget-object p0, v5, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;->font_infos:[Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;

    array-length p0, p0

    if-ge v7, p0, :cond_0

    .line 1210
    const/4 v3, 0x0

    iget v4, v6, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->uncompressed_size:I

    move-object v8, p2

    .end local p2    # "out":Lcom/itextpdf/io/font/woff2/Woff2Out;
    .local v8, "out":Lcom/itextpdf/io/font/woff2/Woff2Out;
    invoke-static/range {v2 .. v8}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->reconstructFont([BIILcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;ILcom/itextpdf/io/font/woff2/Woff2Out;)V

    .line 1209
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1212
    .end local v7    # "i":I
    .end local v8    # "out":Lcom/itextpdf/io/font/woff2/Woff2Out;
    .restart local p2    # "out":Lcom/itextpdf/io/font/woff2/Woff2Out;
    :cond_0
    return-void

    .line 1203
    .end local v2    # "uncompressed_buf":[B
    .end local v10    # "data":[B
    .restart local p0    # "data":[B
    :cond_1
    move-object v10, p0

    move-object v8, p2

    .end local p0    # "data":[B
    .end local p2    # "out":Lcom/itextpdf/io/font/woff2/Woff2Out;
    .restart local v8    # "out":Lcom/itextpdf/io/font/woff2/Woff2Out;
    .restart local v10    # "data":[B
    new-instance p0, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    const-string v1, "Implausible compression ratio {0}"

    invoke-static {v1, p2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static findTable(Ljava/util/ArrayList;I)Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .locals 3
    .param p1, "tag"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/itextpdf/io/font/woff2/Woff2Common$Table;",
            ">;I)",
            "Lcom/itextpdf/io/font/woff2/Woff2Common$Table;"
        }
    .end annotation

    .line 634
    .local p0, "tables":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/itextpdf/io/font/woff2/Woff2Common$Table;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    .line 635
    .local v1, "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    iget v2, v1, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    if-ne v2, p1, :cond_0

    .line 636
    return-object v1

    .line 638
    .end local v1    # "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    :cond_0
    goto :goto_0

    .line 639
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private static pad4(Lcom/itextpdf/io/font/woff2/Woff2Out;)V
    .locals 3
    .param p0, "out"    # Lcom/itextpdf/io/font/woff2/Woff2Out;

    .line 390
    const/4 v0, 0x3

    new-array v1, v0, [B

    fill-array-data v1, :array_0

    .line 391
    .local v1, "zeroes":[B
    invoke-interface {p0}, Lcom/itextpdf/io/font/woff2/Woff2Out;->size()I

    move-result v2

    add-int/2addr v2, v0

    invoke-interface {p0}, Lcom/itextpdf/io/font/woff2/Woff2Out;->size()I

    move-result v0

    if-lt v2, v0, :cond_1

    .line 394
    invoke-interface {p0}, Lcom/itextpdf/io/font/woff2/Woff2Out;->size()I

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/io/font/woff2/Round;->round4(I)I

    move-result v0

    invoke-interface {p0}, Lcom/itextpdf/io/font/woff2/Woff2Out;->size()I

    move-result v2

    sub-int/2addr v0, v2

    .line 395
    .local v0, "pad_bytes":I
    if-lez v0, :cond_0

    .line 396
    const/4 v2, 0x0

    invoke-interface {p0, v1, v2, v0}, Lcom/itextpdf/io/font/woff2/Woff2Out;->write([BII)V

    .line 398
    :cond_0
    return-void

    .line 392
    .end local v0    # "pad_bytes":I
    :cond_1
    new-instance v0, Lcom/itextpdf/io/exceptions/FontCompressionException;

    const-string/jumbo v2, "woff2 padding overflow exception"

    invoke-direct {v0, v2}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v0

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method private static readNumHMetrics([BII)S
    .locals 2
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "data_length"    # I

    .line 645
    new-instance v0, Lcom/itextpdf/io/font/woff2/Buffer;

    invoke-direct {v0, p0, p1, p2}, Lcom/itextpdf/io/font/woff2/Buffer;-><init>([BII)V

    .line 646
    .local v0, "buffer":Lcom/itextpdf/io/font/woff2/Buffer;
    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/woff2/Buffer;->skip(I)V

    .line 647
    invoke-virtual {v0}, Lcom/itextpdf/io/font/woff2/Buffer;->readShort()S

    move-result v1

    return v1
.end method

.method private static readTableDirectory(Lcom/itextpdf/io/font/woff2/Buffer;[Lcom/itextpdf/io/font/woff2/Woff2Common$Table;I)V
    .locals 12
    .param p0, "file"    # Lcom/itextpdf/io/font/woff2/Buffer;
    .param p1, "tables"    # [Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .param p2, "num_tables"    # I

    .line 755
    const/4 v0, 0x0

    .line 756
    .local v0, "src_offset":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p2, :cond_7

    .line 757
    new-instance v2, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    invoke-direct {v2}, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;-><init>()V

    .line 758
    .local v2, "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    aput-object v2, p1, v1

    .line 759
    invoke-virtual {p0}, Lcom/itextpdf/io/font/woff2/Buffer;->readByte()B

    move-result v3

    invoke-static {v3}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v3

    .line 761
    .local v3, "flag_byte":I
    and-int/lit8 v4, v3, 0x3f

    const/16 v5, 0x3f

    if-ne v4, v5, :cond_0

    .line 762
    invoke-virtual {p0}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    move-result v4

    .local v4, "tag":I
    goto :goto_1

    .line 764
    .end local v4    # "tag":I
    :cond_0
    sget-object v4, Lcom/itextpdf/io/font/woff2/TableTags;->kKnownTags:[I

    and-int/lit8 v5, v3, 0x3f

    aget v4, v4, v5

    .line 766
    .restart local v4    # "tag":I
    :goto_1
    const/4 v5, 0x0

    .line 767
    .local v5, "flags":I
    shr-int/lit8 v6, v3, 0x6

    and-int/lit8 v6, v6, 0x3

    .line 770
    .local v6, "xform_version":I
    const v7, 0x676c7966

    const v8, 0x6c6f6361

    if-eq v4, v7, :cond_2

    if-ne v4, v8, :cond_1

    goto :goto_2

    .line 774
    :cond_1
    if-eqz v6, :cond_3

    .line 775
    or-int/lit16 v5, v5, 0x100

    goto :goto_3

    .line 771
    :cond_2
    :goto_2
    if-nez v6, :cond_3

    .line 772
    or-int/lit16 v5, v5, 0x100

    .line 777
    :cond_3
    :goto_3
    or-int/2addr v5, v6

    .line 779
    invoke-static {p0}, Lcom/itextpdf/io/font/woff2/VariableLength;->readBase128(Lcom/itextpdf/io/font/woff2/Buffer;)I

    move-result v7

    .line 780
    .local v7, "dst_length":I
    move v9, v7

    .line 781
    .local v9, "transform_length":I
    and-int/lit16 v10, v5, 0x100

    const-string v11, "Reading woff2 tables directory exception"

    if-eqz v10, :cond_5

    .line 782
    invoke-static {p0}, Lcom/itextpdf/io/font/woff2/VariableLength;->readBase128(Lcom/itextpdf/io/font/woff2/Buffer;)I

    move-result v9

    .line 783
    if-ne v4, v8, :cond_5

    if-nez v9, :cond_4

    goto :goto_4

    .line 784
    :cond_4
    new-instance v8, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v8, v11}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 787
    :cond_5
    :goto_4
    add-int v8, v0, v9

    if-lt v8, v0, :cond_6

    .line 790
    iput v0, v2, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_offset:I

    .line 791
    iput v9, v2, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_length:I

    .line 792
    add-int/2addr v0, v9

    .line 794
    iput v4, v2, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    .line 795
    iput v5, v2, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->flags:I

    .line 796
    iput v9, v2, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->transform_length:I

    .line 797
    iput v7, v2, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_length:I

    .line 756
    .end local v2    # "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .end local v3    # "flag_byte":I
    .end local v4    # "tag":I
    .end local v5    # "flags":I
    .end local v6    # "xform_version":I
    .end local v7    # "dst_length":I
    .end local v9    # "transform_length":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 788
    .restart local v2    # "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .restart local v3    # "flag_byte":I
    .restart local v4    # "tag":I
    .restart local v5    # "flags":I
    .restart local v6    # "xform_version":I
    .restart local v7    # "dst_length":I
    .restart local v9    # "transform_length":I
    :cond_6
    new-instance v8, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v8, v11}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 799
    .end local v1    # "i":I
    .end local v2    # "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .end local v3    # "flag_byte":I
    .end local v4    # "tag":I
    .end local v5    # "flags":I
    .end local v6    # "xform_version":I
    .end local v7    # "dst_length":I
    .end local v9    # "transform_length":I
    :cond_7
    return-void
.end method

.method private static readWoff2Header([BILcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;)V
    .locals 25
    .param p0, "data"    # [B
    .param p1, "length"    # I
    .param p2, "hdr"    # Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;

    .line 963
    move/from16 v0, p1

    move-object/from16 v1, p2

    new-instance v2, Lcom/itextpdf/io/font/woff2/Buffer;

    const/4 v3, 0x0

    move-object/from16 v4, p0

    invoke-direct {v2, v4, v3, v0}, Lcom/itextpdf/io/font/woff2/Buffer;-><init>([BII)V

    .line 966
    .local v2, "file":Lcom/itextpdf/io/font/woff2/Buffer;
    invoke-virtual {v2}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    move-result v5

    .line 967
    .local v5, "signature":I
    const v6, 0x774f4632

    if-ne v5, v6, :cond_20

    .line 970
    invoke-virtual {v2}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    move-result v6

    iput v6, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->flavor:I

    .line 972
    invoke-virtual {v2}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    move-result v6

    .line 973
    .local v6, "reported_length":I
    if-lez v6, :cond_1f

    .line 975
    const-string v7, "Reading woff2 header exception"

    if-ne v0, v6, :cond_1e

    .line 979
    invoke-virtual {v2}, Lcom/itextpdf/io/font/woff2/Buffer;->readShort()S

    move-result v8

    iput-short v8, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->num_tables:S

    .line 980
    iget-short v8, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->num_tables:S

    if-eqz v8, :cond_1d

    .line 987
    const/4 v8, 0x6

    invoke-virtual {v2, v8}, Lcom/itextpdf/io/font/woff2/Buffer;->skip(I)V

    .line 989
    invoke-virtual {v2}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    move-result v8

    iput v8, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->compressed_length:I

    .line 990
    iget v8, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->compressed_length:I

    if-ltz v8, :cond_1c

    .line 994
    const/4 v8, 0x4

    invoke-virtual {v2, v8}, Lcom/itextpdf/io/font/woff2/Buffer;->skip(I)V

    .line 999
    invoke-virtual {v2}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    move-result v8

    .line 1000
    .local v8, "meta_offset":I
    if-ltz v8, :cond_1b

    .line 1001
    invoke-virtual {v2}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    move-result v9

    .line 1002
    .local v9, "meta_length":I
    if-ltz v9, :cond_1a

    .line 1003
    invoke-virtual {v2}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    move-result v10

    .line 1004
    .local v10, "meta_length_orig":I
    if-ltz v10, :cond_19

    .line 1005
    if-eqz v8, :cond_1

    .line 1006
    if-ge v8, v0, :cond_0

    sub-int v11, v0, v8

    if-lt v11, v9, :cond_0

    goto :goto_0

    .line 1007
    :cond_0
    new-instance v3, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v3, v7}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1012
    :cond_1
    :goto_0
    invoke-virtual {v2}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    move-result v11

    .line 1013
    .local v11, "priv_offset":I
    if-ltz v11, :cond_18

    .line 1014
    invoke-virtual {v2}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    move-result v12

    .line 1015
    .local v12, "priv_length":I
    if-ltz v12, :cond_17

    .line 1017
    if-eqz v11, :cond_3

    .line 1018
    if-ge v11, v0, :cond_2

    sub-int v13, v0, v11

    if-lt v13, v12, :cond_2

    goto :goto_1

    .line 1019
    :cond_2
    new-instance v3, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v3, v7}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1022
    :cond_3
    :goto_1
    iget-short v13, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->num_tables:S

    new-array v13, v13, [Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    iput-object v13, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->tables:[Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    .line 1023
    iget-object v13, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->tables:[Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    iget-short v14, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->num_tables:S

    invoke-static {v2, v13, v14}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->readTableDirectory(Lcom/itextpdf/io/font/woff2/Buffer;[Lcom/itextpdf/io/font/woff2/Woff2Common$Table;I)V

    .line 1026
    iget-object v13, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->tables:[Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    iget-object v14, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->tables:[Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    array-length v14, v14

    const/4 v15, 0x1

    sub-int/2addr v14, v15

    aget-object v13, v13, v14

    .line 1027
    .local v13, "last_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    iget v14, v13, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_offset:I

    iget v15, v13, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_length:I

    add-int/2addr v14, v15

    iput v14, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->uncompressed_size:I

    .line 1028
    iget v14, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->uncompressed_size:I

    if-lez v14, :cond_16

    .line 1029
    iget v14, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->uncompressed_size:I

    iget v15, v13, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_offset:I

    if-lt v14, v15, :cond_15

    .line 1033
    iput v3, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->header_version:I

    .line 1035
    iget v14, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->flavor:I

    const v15, 0x74746366

    if-ne v14, v15, :cond_e

    .line 1036
    invoke-virtual {v2}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    move-result v14

    iput v14, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->header_version:I

    .line 1037
    iget v14, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->header_version:I

    const/high16 v15, 0x10000

    const-string v3, "Reading collection woff2 header exception"

    if-eq v14, v15, :cond_5

    iget v14, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->header_version:I

    const/high16 v15, 0x20000

    if-ne v14, v15, :cond_4

    goto :goto_2

    .line 1038
    :cond_4
    new-instance v7, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v7, v3}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1041
    :cond_5
    :goto_2
    invoke-static {v2}, Lcom/itextpdf/io/font/woff2/VariableLength;->read255UShort(Lcom/itextpdf/io/font/woff2/Buffer;)I

    move-result v14

    .line 1042
    .local v14, "num_fonts":I
    new-array v15, v14, [Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

    iput-object v15, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->ttc_fonts:[Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

    .line 1044
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_3
    if-ge v15, v14, :cond_d

    .line 1045
    move-object/from16 v16, v2

    .end local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v16, "file":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v2, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;-><init>(Lcom/itextpdf/io/font/woff2/Woff2Dec$1;)V

    .line 1046
    .local v2, "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    iget-object v4, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->ttc_fonts:[Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

    aput-object v2, v4, v15

    .line 1048
    invoke-static/range {v16 .. v16}, Lcom/itextpdf/io/font/woff2/VariableLength;->read255UShort(Lcom/itextpdf/io/font/woff2/Buffer;)I

    move-result v4

    .line 1049
    .local v4, "num_tables":I
    move/from16 v17, v5

    .end local v5    # "signature":I
    .local v17, "signature":I
    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    move-result v5

    iput v5, v2, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;->flavor:I

    .line 1051
    new-array v5, v4, [S

    iput-object v5, v2, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;->table_indices:[S

    .line 1053
    const/4 v5, 0x0

    .line 1054
    .local v5, "glyf_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    const/16 v18, 0x0

    .line 1056
    .local v18, "loca_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    const/16 v19, 0x0

    move/from16 v24, v19

    move-object/from16 v19, v5

    move/from16 v5, v24

    .local v5, "j":I
    .local v19, "glyf_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    :goto_4
    if-ge v5, v4, :cond_9

    .line 1058
    move/from16 v20, v4

    .end local v4    # "num_tables":I
    .local v20, "num_tables":I
    invoke-static/range {v16 .. v16}, Lcom/itextpdf/io/font/woff2/VariableLength;->read255UShort(Lcom/itextpdf/io/font/woff2/Buffer;)I

    move-result v4

    .line 1059
    .local v4, "table_idx":I
    move/from16 v21, v5

    .end local v5    # "j":I
    .local v21, "j":I
    iget-object v5, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->tables:[Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    array-length v5, v5

    if-ge v4, v5, :cond_8

    .line 1062
    iget-object v5, v2, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;->table_indices:[S

    move-object/from16 v22, v2

    .end local v2    # "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    .local v22, "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    int-to-short v2, v4

    aput-short v2, v5, v21

    .line 1064
    iget-object v2, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->tables:[Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    aget-object v2, v2, v4

    .line 1065
    .local v2, "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    iget v5, v2, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    move/from16 v23, v4

    .end local v4    # "table_idx":I
    .local v23, "table_idx":I
    const v4, 0x6c6f6361

    if-ne v5, v4, :cond_6

    .line 1066
    move-object v4, v2

    move-object/from16 v18, v4

    .line 1068
    :cond_6
    iget v4, v2, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    const v5, 0x676c7966

    if-ne v4, v5, :cond_7

    .line 1069
    move-object v4, v2

    move-object/from16 v19, v4

    .line 1056
    .end local v2    # "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .end local v23    # "table_idx":I
    :cond_7
    add-int/lit8 v5, v21, 0x1

    move/from16 v4, v20

    move-object/from16 v2, v22

    .end local v21    # "j":I
    .restart local v5    # "j":I
    goto :goto_4

    .line 1060
    .end local v5    # "j":I
    .end local v22    # "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    .local v2, "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    .restart local v4    # "table_idx":I
    .restart local v21    # "j":I
    :cond_8
    move-object/from16 v22, v2

    .end local v2    # "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    .restart local v22    # "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    new-instance v2, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1056
    .end local v20    # "num_tables":I
    .end local v21    # "j":I
    .end local v22    # "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    .restart local v2    # "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    .local v4, "num_tables":I
    .restart local v5    # "j":I
    :cond_9
    move-object/from16 v22, v2

    move/from16 v20, v4

    move/from16 v21, v5

    .line 1074
    .end local v2    # "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    .end local v4    # "num_tables":I
    .end local v5    # "j":I
    .restart local v20    # "num_tables":I
    .restart local v22    # "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    if-nez v19, :cond_a

    const/4 v2, 0x1

    goto :goto_5

    :cond_a
    const/4 v2, 0x0

    :goto_5
    if-nez v18, :cond_b

    const/4 v4, 0x1

    goto :goto_6

    :cond_b
    const/4 v4, 0x0

    :goto_6
    if-ne v2, v4, :cond_c

    .line 1044
    .end local v18    # "loca_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .end local v19    # "glyf_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .end local v20    # "num_tables":I
    .end local v22    # "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v4, p0

    move-object/from16 v2, v16

    move/from16 v5, v17

    goto/16 :goto_3

    .line 1075
    .restart local v18    # "loca_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .restart local v19    # "glyf_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .restart local v20    # "num_tables":I
    .restart local v22    # "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    :cond_c
    new-instance v2, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1044
    .end local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v17    # "signature":I
    .end local v18    # "loca_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .end local v19    # "glyf_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .end local v20    # "num_tables":I
    .end local v22    # "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    .local v2, "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v5, "signature":I
    :cond_d
    move-object/from16 v16, v2

    move/from16 v17, v5

    .end local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v5    # "signature":I
    .restart local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v17    # "signature":I
    goto :goto_7

    .line 1035
    .end local v14    # "num_fonts":I
    .end local v15    # "i":I
    .end local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v17    # "signature":I
    .restart local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v5    # "signature":I
    :cond_e
    move-object/from16 v16, v2

    move/from16 v17, v5

    .line 1080
    .end local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v5    # "signature":I
    .restart local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v17    # "signature":I
    :goto_7
    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/io/font/woff2/Buffer;->getOffset()I

    move-result v2

    iput v2, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->compressed_offset:I

    .line 1081
    iget v2, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->compressed_offset:I

    iget v3, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->compressed_length:I

    add-int/2addr v2, v3

    invoke-static {v2}, Lcom/itextpdf/io/font/woff2/Round;->round4(I)I

    move-result v2

    .line 1083
    .local v2, "src_offset":I
    if-gt v2, v0, :cond_14

    .line 1086
    if-eqz v8, :cond_10

    .line 1087
    if-ne v2, v8, :cond_f

    .line 1090
    add-int v3, v8, v9

    invoke-static {v3}, Lcom/itextpdf/io/font/woff2/Round;->round4(I)I

    move-result v2

    goto :goto_8

    .line 1088
    :cond_f
    new-instance v3, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v3, v7}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1093
    :cond_10
    :goto_8
    if-eqz v11, :cond_12

    .line 1094
    if-ne v2, v11, :cond_11

    .line 1097
    add-int v3, v11, v12

    invoke-static {v3}, Lcom/itextpdf/io/font/woff2/Round;->round4(I)I

    move-result v2

    goto :goto_9

    .line 1095
    :cond_11
    new-instance v3, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v3, v7}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1100
    :cond_12
    :goto_9
    invoke-static {v0}, Lcom/itextpdf/io/font/woff2/Round;->round4(I)I

    move-result v3

    if-ne v2, v3, :cond_13

    .line 1103
    return-void

    .line 1101
    :cond_13
    new-instance v3, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v3, v7}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1084
    :cond_14
    new-instance v3, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v3, v7}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1030
    .end local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v17    # "signature":I
    .local v2, "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v5    # "signature":I
    :cond_15
    move-object/from16 v16, v2

    .end local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v2, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v2, v7}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1028
    .end local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    :cond_16
    move-object/from16 v16, v2

    .end local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 1015
    .end local v13    # "last_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .end local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    :cond_17
    move-object/from16 v16, v2

    .end local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 1013
    .end local v12    # "priv_length":I
    .end local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    :cond_18
    move-object/from16 v16, v2

    .end local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 1004
    .end local v11    # "priv_offset":I
    .end local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    :cond_19
    move-object/from16 v16, v2

    .end local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 1002
    .end local v10    # "meta_length_orig":I
    .end local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    :cond_1a
    move-object/from16 v16, v2

    .end local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 1000
    .end local v9    # "meta_length":I
    .end local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    :cond_1b
    move-object/from16 v16, v2

    .end local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 990
    .end local v8    # "meta_offset":I
    .end local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    :cond_1c
    move-object/from16 v16, v2

    .end local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 981
    .end local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    :cond_1d
    move-object/from16 v16, v2

    .end local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v2, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v2, v7}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 976
    .end local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    :cond_1e
    move-object/from16 v16, v2

    .end local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v2, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v2, v7}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 973
    .end local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    :cond_1f
    move-object/from16 v16, v2

    .end local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 968
    .end local v6    # "reported_length":I
    .end local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    :cond_20
    move-object/from16 v16, v2

    .end local v2    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v16    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v2, Lcom/itextpdf/io/exceptions/FontCompressionException;

    const-string v3, "Incorrect woff2 signature"

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static reconstructFont([BIILcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;ILcom/itextpdf/io/font/woff2/Woff2Out;)V
    .locals 25
    .param p0, "transformed_buf"    # [B
    .param p1, "transformed_buf_offset"    # I
    .param p2, "transformed_buf_size"    # I
    .param p3, "metadata"    # Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;
    .param p4, "hdr"    # Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;
    .param p5, "font_index"    # I
    .param p6, "out"    # Lcom/itextpdf/io/font/woff2/Woff2Out;

    .line 858
    move-object/from16 v0, p0

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    move-object/from16 v6, p6

    invoke-interface {v6}, Lcom/itextpdf/io/font/woff2/Woff2Out;->size()I

    move-result v1

    .line 859
    .local v1, "dest_offset":I
    const/16 v10, 0xc

    new-array v11, v10, [B

    .line 860
    .local v11, "table_entry":[B
    iget-object v2, v8, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;->font_infos:[Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;

    aget-object v2, v2, p5

    .line 861
    .local v2, "info":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    invoke-static/range {p4 .. p5}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->tables(Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;I)Ljava/util/ArrayList;

    move-result-object v12

    .line 864
    .local v12, "tables":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/itextpdf/io/font/woff2/Woff2Common$Table;>;"
    const v13, 0x676c7966

    invoke-static {v12, v13}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->findTable(Ljava/util/ArrayList;I)Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    move-result-object v3

    const/4 v4, 0x1

    if-nez v3, :cond_0

    move v3, v4

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    const v15, 0x6c6f6361

    invoke-static {v12, v15}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->findTable(Ljava/util/ArrayList;I)Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    move-result-object v5

    if-eqz v5, :cond_1

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    const-string v5, "Reconstructing woff2 table directory exception"

    if-eq v3, v4, :cond_12

    .line 868
    iget v3, v8, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;->header_checksum:I

    .line 869
    .local v3, "font_checksum":I
    iget v4, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->header_version:I

    if-eqz v4, :cond_2

    .line 870
    iget-object v4, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->ttc_fonts:[Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

    aget-object v4, v4, p5

    iget v3, v4, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;->header_checksum:I

    .line 873
    :cond_2
    const/4 v4, 0x0

    .line 874
    .local v4, "loca_checksum":I
    const/4 v7, 0x0

    move/from16 v16, v3

    move v3, v7

    .local v3, "i":I
    .local v16, "font_checksum":I
    :goto_2
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/16 v19, 0x8

    if-ge v3, v7, :cond_f

    .line 875
    invoke-virtual {v12, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    .line 877
    .local v7, "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    new-instance v13, Lcom/itextpdf/io/font/woff2/Woff2Dec$TableChecksumInfo;

    iget v14, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    iget v10, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_offset:I

    invoke-direct {v13, v14, v10}, Lcom/itextpdf/io/font/woff2/Woff2Dec$TableChecksumInfo;-><init>(II)V

    .line 878
    .local v13, "checksum_key":Lcom/itextpdf/io/font/woff2/Woff2Dec$TableChecksumInfo;
    iget-object v10, v8, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;->checksums:Ljava/util/Map;

    invoke-interface {v10, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    .line 879
    .local v10, "reused":Z
    if-nez p5, :cond_4

    if-nez v10, :cond_3

    goto :goto_3

    .line 880
    :cond_3
    new-instance v14, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v14, v5}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 883
    :cond_4
    :goto_3
    iget v14, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_offset:I

    move/from16 v22, v3

    move/from16 v21, v4

    .end local v3    # "i":I
    .end local v4    # "loca_checksum":I
    .local v21, "loca_checksum":I
    .local v22, "i":I
    int-to-long v3, v14

    iget v14, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_length:I

    move-wide/from16 v23, v3

    int-to-long v3, v14

    add-long v3, v23, v3

    move/from16 v14, p2

    move-wide/from16 v23, v3

    int-to-long v3, v14

    cmp-long v3, v23, v3

    if-gtz v3, :cond_e

    .line 887
    iget v3, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    const v4, 0x68686561

    if-ne v3, v4, :cond_5

    .line 888
    iget v3, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_offset:I

    add-int v3, p1, v3

    iget v4, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_length:I

    invoke-static {v0, v3, v4}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->readNumHMetrics([BII)S

    move-result v3

    iput-short v3, v2, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->num_hmetrics:S

    .line 891
    :cond_5
    const/4 v3, 0x0

    .line 892
    .local v3, "checksum":I
    if-nez v10, :cond_c

    .line 893
    iget v4, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->flags:I

    const/16 v15, 0x100

    and-int/2addr v4, v15

    if-eq v4, v15, :cond_8

    .line 894
    iget v4, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    const v15, 0x68656164

    if-ne v4, v15, :cond_7

    .line 895
    iget v4, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_length:I

    const/16 v15, 0xc

    if-lt v4, v15, :cond_6

    .line 899
    iget v4, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_offset:I

    add-int v4, p1, v4

    add-int/lit8 v4, v4, 0x8

    const/4 v15, 0x0

    invoke-static {v0, v4, v15}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    goto :goto_4

    .line 896
    :cond_6
    new-instance v4, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v4, v5}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 901
    :cond_7
    :goto_4
    iput v1, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_offset:I

    .line 902
    iget v4, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_offset:I

    add-int v4, p1, v4

    iget v15, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_length:I

    invoke-static {v0, v4, v15}, Lcom/itextpdf/io/font/woff2/Woff2Common;->computeULongSum([BII)I

    move-result v3

    .line 903
    iget v4, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_offset:I

    add-int v4, p1, v4

    iget v15, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_length:I

    invoke-interface {v6, v0, v4, v15}, Lcom/itextpdf/io/font/woff2/Woff2Out;->write([BII)V

    move v15, v1

    move-object v9, v5

    move/from16 v24, v10

    move/from16 v4, v21

    const v17, 0x6c6f6361

    move-object v10, v7

    move-object v7, v2

    goto/16 :goto_5

    .line 905
    :cond_8
    iget v4, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    const v15, 0x676c7966

    if-ne v4, v15, :cond_9

    .line 906
    iput v1, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_offset:I

    .line 908
    const v4, 0x6c6f6361

    invoke-static {v12, v4}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->findTable(Ljava/util/ArrayList;I)Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    move-result-object v18

    .line 910
    .local v18, "loca_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    iget v4, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_offset:I

    add-int v4, p1, v4

    move-object v9, v6

    move-object v6, v2

    move-object v2, v7

    move-object v7, v9

    move v15, v1

    move v1, v4

    move-object v9, v5

    move-object/from16 v4, v18

    move/from16 v5, v21

    .end local v1    # "dest_offset":I
    .end local v7    # "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .end local v18    # "loca_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .end local v21    # "loca_checksum":I
    .local v2, "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .local v4, "loca_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .local v5, "loca_checksum":I
    .local v6, "info":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    .local v15, "dest_offset":I
    invoke-static/range {v0 .. v7}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->reconstructGlyf([BILcom/itextpdf/io/font/woff2/Woff2Common$Table;ILcom/itextpdf/io/font/woff2/Woff2Common$Table;ILcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;Lcom/itextpdf/io/font/woff2/Woff2Out;)Lcom/itextpdf/io/font/woff2/Woff2Dec$Checksums;

    move-result-object v1

    .line 911
    move-object v0, v2

    move/from16 v23, v3

    move-object v7, v6

    .end local v2    # "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .end local v3    # "checksum":I
    .end local v5    # "loca_checksum":I
    .end local v6    # "info":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    .local v0, "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .local v1, "resultChecksum":Lcom/itextpdf/io/font/woff2/Woff2Dec$Checksums;
    .local v7, "info":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    .restart local v21    # "loca_checksum":I
    .local v23, "checksum":I
    iget v3, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Checksums;->glyph_checksum:I

    .line 912
    .end local v23    # "checksum":I
    .restart local v3    # "checksum":I
    iget v4, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Checksums;->loca_checksum:I

    .line 913
    .end local v1    # "resultChecksum":Lcom/itextpdf/io/font/woff2/Woff2Dec$Checksums;
    .end local v21    # "loca_checksum":I
    .local v4, "loca_checksum":I
    move-object/from16 v6, p6

    move/from16 v24, v10

    const v17, 0x6c6f6361

    move-object v10, v0

    goto :goto_5

    .end local v0    # "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .end local v4    # "loca_checksum":I
    .end local v15    # "dest_offset":I
    .local v1, "dest_offset":I
    .local v2, "info":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    .local v7, "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .restart local v21    # "loca_checksum":I
    :cond_9
    move v15, v1

    move/from16 v23, v3

    move-object v9, v5

    move-object v0, v7

    move-object v7, v2

    .end local v1    # "dest_offset":I
    .end local v2    # "info":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    .end local v3    # "checksum":I
    .restart local v0    # "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .local v7, "info":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    .restart local v15    # "dest_offset":I
    .restart local v23    # "checksum":I
    iget v1, v0, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    const v2, 0x6c6f6361

    if-ne v1, v2, :cond_a

    .line 915
    move/from16 v3, v21

    move-object/from16 v6, p6

    move/from16 v17, v2

    move/from16 v24, v10

    move/from16 v4, v21

    move-object v10, v0

    .end local v23    # "checksum":I
    .restart local v3    # "checksum":I
    goto :goto_5

    .line 916
    .end local v3    # "checksum":I
    .restart local v23    # "checksum":I
    :cond_a
    iget v1, v0, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    const v3, 0x686d7478

    if-ne v1, v3, :cond_b

    .line 917
    iput v15, v0, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_offset:I

    .line 919
    iget v1, v0, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_offset:I

    add-int v1, p1, v1

    move/from16 v17, v2

    iget v2, v0, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->src_length:I

    iget-short v3, v7, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->num_glyphs:S

    .line 921
    invoke-static {v3}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU16(S)I

    move-result v3

    iget-short v4, v7, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->num_hmetrics:S

    invoke-static {v4}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU16(S)I

    move-result v4

    iget-object v5, v7, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->x_mins:[S

    .line 919
    move-object/from16 v6, p6

    move/from16 v24, v10

    move-object v10, v0

    move-object/from16 v0, p0

    .end local v0    # "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .local v10, "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .local v24, "reused":Z
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->reconstructTransformedHmtx([BIIII[SLcom/itextpdf/io/font/woff2/Woff2Out;)I

    move-result v3

    move/from16 v4, v21

    .line 927
    .end local v21    # "loca_checksum":I
    .end local v23    # "checksum":I
    .restart local v3    # "checksum":I
    .restart local v4    # "loca_checksum":I
    :goto_5
    iget-object v0, v8, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;->checksums:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    .line 924
    .end local v3    # "checksum":I
    .end local v4    # "loca_checksum":I
    .end local v24    # "reused":Z
    .restart local v0    # "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .local v10, "reused":Z
    .restart local v21    # "loca_checksum":I
    .restart local v23    # "checksum":I
    :cond_b
    move/from16 v24, v10

    move-object v10, v0

    .end local v0    # "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .local v10, "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .restart local v24    # "reused":Z
    new-instance v0, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v0, v9}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 929
    .end local v15    # "dest_offset":I
    .end local v23    # "checksum":I
    .end local v24    # "reused":Z
    .restart local v1    # "dest_offset":I
    .restart local v2    # "info":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    .restart local v3    # "checksum":I
    .local v7, "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .local v10, "reused":Z
    :cond_c
    move v15, v1

    move/from16 v23, v3

    move-object v9, v5

    move/from16 v24, v10

    const v17, 0x6c6f6361

    move-object v10, v7

    move-object v7, v2

    .end local v1    # "dest_offset":I
    .end local v2    # "info":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    .end local v3    # "checksum":I
    .local v7, "info":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    .local v10, "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .restart local v15    # "dest_offset":I
    .restart local v23    # "checksum":I
    .restart local v24    # "reused":Z
    iget-object v0, v8, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;->checksums:Ljava/util/Map;

    invoke-interface {v0, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    move/from16 v4, v21

    .line 931
    .end local v21    # "loca_checksum":I
    .end local v23    # "checksum":I
    .restart local v3    # "checksum":I
    .restart local v4    # "loca_checksum":I
    :goto_6
    add-int v16, v16, v3

    .line 934
    const/4 v0, 0x0

    invoke-static {v11, v0, v3}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    .line 935
    iget v0, v10, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_offset:I

    const/4 v1, 0x4

    invoke-static {v11, v1, v0}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    .line 936
    iget v0, v10, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_length:I

    move/from16 v2, v19

    invoke-static {v11, v2, v0}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    .line 937
    iget-object v0, v7, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->table_entry_by_tag:Ljava/util/Map;

    iget v2, v10, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr v0, v1

    const/4 v1, 0x0

    const/16 v2, 0xc

    invoke-interface {v6, v11, v1, v0, v2}, Lcom/itextpdf/io/font/woff2/Woff2Out;->write([BIII)V

    .line 940
    invoke-static {v11, v1, v2}, Lcom/itextpdf/io/font/woff2/Woff2Common;->computeULongSum([BII)I

    move-result v0

    add-int v16, v16, v0

    .line 942
    invoke-static {v6}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->pad4(Lcom/itextpdf/io/font/woff2/Woff2Out;)V

    .line 944
    iget v0, v10, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_offset:I

    int-to-long v0, v0

    iget v2, v10, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_length:I

    move-wide/from16 v19, v0

    int-to-long v0, v2

    add-long v0, v19, v0

    invoke-interface {v6}, Lcom/itextpdf/io/font/woff2/Woff2Out;->size()I

    move-result v2

    move-wide/from16 v19, v0

    int-to-long v0, v2

    cmp-long v0, v19, v0

    if-gtz v0, :cond_d

    .line 947
    invoke-interface {v6}, Lcom/itextpdf/io/font/woff2/Woff2Out;->size()I

    move-result v1

    .line 874
    .end local v3    # "checksum":I
    .end local v10    # "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .end local v13    # "checksum_key":Lcom/itextpdf/io/font/woff2/Woff2Dec$TableChecksumInfo;
    .end local v15    # "dest_offset":I
    .end local v24    # "reused":Z
    .restart local v1    # "dest_offset":I
    add-int/lit8 v3, v22, 0x1

    move-object/from16 v0, p0

    move-object v2, v7

    move-object v5, v9

    move/from16 v15, v17

    const/16 v10, 0xc

    const v13, 0x676c7966

    move-object/from16 v9, p4

    .end local v22    # "i":I
    .local v3, "i":I
    goto/16 :goto_2

    .line 945
    .end local v1    # "dest_offset":I
    .local v3, "checksum":I
    .restart local v10    # "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .restart local v13    # "checksum_key":Lcom/itextpdf/io/font/woff2/Woff2Dec$TableChecksumInfo;
    .restart local v15    # "dest_offset":I
    .restart local v22    # "i":I
    .restart local v24    # "reused":Z
    :cond_d
    new-instance v0, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v0, v9}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 884
    .end local v3    # "checksum":I
    .end local v4    # "loca_checksum":I
    .end local v15    # "dest_offset":I
    .end local v24    # "reused":Z
    .restart local v1    # "dest_offset":I
    .restart local v2    # "info":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    .local v7, "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .local v10, "reused":Z
    .restart local v21    # "loca_checksum":I
    :cond_e
    move-object v9, v5

    new-instance v0, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v0, v9}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 874
    .end local v7    # "table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .end local v10    # "reused":Z
    .end local v13    # "checksum_key":Lcom/itextpdf/io/font/woff2/Woff2Dec$TableChecksumInfo;
    .end local v21    # "loca_checksum":I
    .end local v22    # "i":I
    .local v3, "i":I
    .restart local v4    # "loca_checksum":I
    :cond_f
    move/from16 v14, p2

    move v15, v1

    move-object v7, v2

    move/from16 v22, v3

    move/from16 v21, v4

    move-object v9, v5

    .line 951
    .end local v1    # "dest_offset":I
    .end local v2    # "info":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    .end local v3    # "i":I
    .end local v4    # "loca_checksum":I
    .local v7, "info":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    .restart local v15    # "dest_offset":I
    .restart local v21    # "loca_checksum":I
    const v0, 0x68656164

    invoke-static {v12, v0}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->findTable(Ljava/util/ArrayList;I)Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    move-result-object v0

    .line 952
    .local v0, "head_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    if-eqz v0, :cond_11

    .line 953
    iget v1, v0, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_length:I

    const/16 v2, 0xc

    if-lt v1, v2, :cond_10

    .line 956
    const/4 v1, 0x4

    new-array v2, v1, [B

    .line 957
    .local v2, "checksum_adjustment":[B
    const v3, -0x4e4f5046

    sub-int v3, v3, v16

    const/4 v4, 0x0

    invoke-static {v2, v4, v3}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    .line 958
    iget v3, v0, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_offset:I

    const/16 v19, 0x8

    add-int/lit8 v3, v3, 0x8

    invoke-interface {v6, v2, v4, v3, v1}, Lcom/itextpdf/io/font/woff2/Woff2Out;->write([BIII)V

    goto :goto_7

    .line 954
    .end local v2    # "checksum_adjustment":[B
    :cond_10
    new-instance v1, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v1, v9}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 960
    :cond_11
    :goto_7
    return-void

    .line 865
    .end local v0    # "head_table":Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .end local v7    # "info":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    .end local v15    # "dest_offset":I
    .end local v16    # "font_checksum":I
    .end local v21    # "loca_checksum":I
    .restart local v1    # "dest_offset":I
    .local v2, "info":Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    :cond_12
    move-object v9, v5

    new-instance v0, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v0, v9}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static reconstructGlyf([BILcom/itextpdf/io/font/woff2/Woff2Common$Table;ILcom/itextpdf/io/font/woff2/Woff2Common$Table;ILcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;Lcom/itextpdf/io/font/woff2/Woff2Out;)Lcom/itextpdf/io/font/woff2/Woff2Dec$Checksums;
    .locals 43
    .param p0, "data"    # [B
    .param p1, "data_offset"    # I
    .param p2, "glyf_table"    # Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .param p3, "glyph_checksum"    # I
    .param p4, "loca_table"    # Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
    .param p5, "loca_checksum"    # I
    .param p6, "info"    # Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
    .param p7, "out"    # Lcom/itextpdf/io/font/woff2/Woff2Out;

    .line 427
    move-object/from16 v0, p0

    move/from16 v6, p1

    move-object/from16 v7, p2

    move-object/from16 v9, p6

    const/4 v11, 0x7

    .line 428
    .local v11, "kNumSubStreams":I
    new-instance v1, Lcom/itextpdf/io/font/woff2/Buffer;

    iget v2, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->transform_length:I

    invoke-direct {v1, v0, v6, v2}, Lcom/itextpdf/io/font/woff2/Buffer;-><init>([BII)V

    move-object v12, v1

    .line 429
    .local v12, "file":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x7

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    move-object v13, v1

    .line 430
    .local v13, "substreams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;>;"
    invoke-interface/range {p7 .. p7}, Lcom/itextpdf/io/font/woff2/Woff2Out;->size()I

    move-result v14

    .line 433
    .local v14, "glyf_start":I
    invoke-virtual {v12}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    .line 434
    invoke-virtual {v12}, Lcom/itextpdf/io/font/woff2/Buffer;->readShort()S

    move-result v1

    iput-short v1, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->num_glyphs:S

    .line 435
    invoke-virtual {v12}, Lcom/itextpdf/io/font/woff2/Buffer;->readShort()S

    move-result v1

    iput-short v1, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->index_format:S

    .line 437
    const/16 v1, 0x24

    .line 438
    .local v1, "offset":I
    iget v3, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->transform_length:I

    const-string v15, "Reconstructing woff2 glyf table exception"

    if-gt v1, v3, :cond_14

    .line 442
    const/4 v3, 0x0

    move/from16 v16, v1

    .end local v1    # "offset":I
    .local v3, "i":I
    .local v16, "offset":I
    :goto_0
    if-ge v3, v2, :cond_1

    .line 444
    invoke-virtual {v12}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    move-result v1

    .line 445
    .local v1, "substream_size":I
    iget v4, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->transform_length:I

    sub-int v4, v4, v16

    if-gt v1, v4, :cond_0

    .line 448
    new-instance v4, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;

    add-int v5, v6, v16

    invoke-direct {v4, v5, v1}, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;-><init>(II)V

    invoke-virtual {v13, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 449
    add-int v16, v16, v1

    .line 442
    .end local v1    # "substream_size":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 446
    .restart local v1    # "substream_size":I
    :cond_0
    new-instance v2, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v2, v15}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 451
    .end local v1    # "substream_size":I
    .end local v3    # "i":I
    :cond_1
    new-instance v1, Lcom/itextpdf/io/font/woff2/Buffer;

    const/4 v2, 0x0

    invoke-virtual {v13, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;

    iget v3, v3, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;->offset:I

    invoke-virtual {v13, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;

    iget v4, v4, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;->length:I

    invoke-direct {v1, v0, v3, v4}, Lcom/itextpdf/io/font/woff2/Buffer;-><init>([BII)V

    move-object/from16 v17, v1

    .line 452
    .local v17, "n_contour_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v1, Lcom/itextpdf/io/font/woff2/Buffer;

    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;

    iget v4, v4, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;->offset:I

    invoke-virtual {v13, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;

    iget v5, v5, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;->length:I

    invoke-direct {v1, v0, v4, v5}, Lcom/itextpdf/io/font/woff2/Buffer;-><init>([BII)V

    move-object/from16 v18, v1

    .line 453
    .local v18, "n_points_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v1, Lcom/itextpdf/io/font/woff2/Buffer;

    const/4 v4, 0x2

    invoke-virtual {v13, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;

    iget v5, v5, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;->offset:I

    invoke-virtual {v13, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    move/from16 v20, v3

    move-object/from16 v3, v19

    check-cast v3, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;

    iget v3, v3, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;->length:I

    invoke-direct {v1, v0, v5, v3}, Lcom/itextpdf/io/font/woff2/Buffer;-><init>([BII)V

    .line 454
    .local v1, "flag_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v3, Lcom/itextpdf/io/font/woff2/Buffer;

    const/4 v5, 0x3

    invoke-virtual {v13, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    move/from16 v21, v4

    move-object/from16 v4, v19

    check-cast v4, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;

    iget v4, v4, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;->offset:I

    invoke-virtual {v13, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;

    iget v5, v5, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;->length:I

    invoke-direct {v3, v0, v4, v5}, Lcom/itextpdf/io/font/woff2/Buffer;-><init>([BII)V

    .line 455
    .local v3, "glyph_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v4, Lcom/itextpdf/io/font/woff2/Buffer;

    const/4 v5, 0x4

    invoke-virtual {v13, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v2, v19

    check-cast v2, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;

    iget v2, v2, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;->offset:I

    invoke-virtual {v13, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;

    iget v5, v5, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;->length:I

    invoke-direct {v4, v0, v2, v5}, Lcom/itextpdf/io/font/woff2/Buffer;-><init>([BII)V

    move-object v2, v4

    .line 456
    .local v2, "composite_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v4, Lcom/itextpdf/io/font/woff2/Buffer;

    const/4 v5, 0x5

    invoke-virtual {v13, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v23, v1

    .end local v1    # "flag_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v23, "flag_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    move-object/from16 v1, v19

    check-cast v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;

    iget v1, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;->offset:I

    invoke-virtual {v13, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    move/from16 v24, v5

    move-object/from16 v5, v19

    check-cast v5, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;

    iget v5, v5, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;->length:I

    invoke-direct {v4, v0, v1, v5}, Lcom/itextpdf/io/font/woff2/Buffer;-><init>([BII)V

    move-object v1, v4

    .line 457
    .local v1, "bbox_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v4, Lcom/itextpdf/io/font/woff2/Buffer;

    const/4 v5, 0x6

    invoke-virtual {v13, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v25, v3

    .end local v3    # "glyph_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v25, "glyph_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    move-object/from16 v3, v19

    check-cast v3, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;

    iget v3, v3, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;->offset:I

    invoke-virtual {v13, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;

    iget v5, v5, Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;->length:I

    invoke-direct {v4, v0, v3, v5}, Lcom/itextpdf/io/font/woff2/Buffer;-><init>([BII)V

    move-object v3, v4

    .line 459
    .local v3, "instruction_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    iget-short v4, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->num_glyphs:S

    invoke-static {v4}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU16(S)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    new-array v4, v4, [I

    .line 460
    .local v4, "loca_values":[I
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 461
    .local v5, "n_points_vec":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    move-object/from16 v19, v4

    const/4 v4, 0x0

    .end local v4    # "loca_values":[I
    .local v19, "loca_values":[I
    new-array v6, v4, [Lcom/itextpdf/io/font/woff2/Woff2Common$Point;

    .line 462
    .local v6, "points":[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    const/4 v4, 0x0

    .line 463
    .local v4, "points_size":I
    move-object/from16 v20, v6

    .end local v6    # "points":[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    .local v20, "points":[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    invoke-virtual {v1}, Lcom/itextpdf/io/font/woff2/Buffer;->getInitialOffset()I

    move-result v6

    .line 465
    .local v6, "bbox_bitmap_offset":I
    move/from16 v26, v4

    .end local v4    # "points_size":I
    .local v26, "points_size":I
    iget-short v4, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->num_glyphs:S

    invoke-static {v4}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU16(S)I

    move-result v4

    add-int/lit8 v4, v4, 0x1f

    shr-int/lit8 v4, v4, 0x5

    shl-int/lit8 v4, v4, 0x2

    .line 466
    .local v4, "bitmap_length":I
    invoke-virtual {v1, v4}, Lcom/itextpdf/io/font/woff2/Buffer;->skip(I)V

    .line 469
    move/from16 v24, v11

    .end local v11    # "kNumSubStreams":I
    .local v24, "kNumSubStreams":I
    const/16 v11, 0x1400

    .line 470
    .local v11, "glyph_buf_size":I
    move-object/from16 v27, v12

    .end local v12    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v27, "file":Lcom/itextpdf/io/font/woff2/Buffer;
    new-array v12, v11, [B

    .line 472
    .local v12, "glyph_buf":[B
    move/from16 v28, v11

    .end local v11    # "glyph_buf_size":I
    .local v28, "glyph_buf_size":I
    iget-short v11, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->num_glyphs:S

    invoke-static {v11}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU16(S)I

    move-result v11

    new-array v11, v11, [S

    iput-object v11, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->x_mins:[S

    .line 473
    const/4 v11, 0x0

    move/from16 v29, v28

    move/from16 v28, v14

    move/from16 v14, v29

    move-object/from16 v29, v12

    move/from16 v12, v26

    move-object/from16 v26, v13

    move v13, v11

    move/from16 v11, p3

    .end local p3    # "glyph_checksum":I
    .local v11, "glyph_checksum":I
    .local v12, "points_size":I
    .local v13, "i":I
    .local v14, "glyph_buf_size":I
    .local v26, "substreams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;>;"
    .local v28, "glyf_start":I
    .local v29, "glyph_buf":[B
    :goto_1
    move/from16 p3, v11

    .end local v11    # "glyph_checksum":I
    .restart local p3    # "glyph_checksum":I
    iget-short v11, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->num_glyphs:S

    invoke-static {v11}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU16(S)I

    move-result v11

    if-ge v13, v11, :cond_13

    .line 474
    const/4 v11, 0x0

    .line 475
    .local v11, "glyph_size":I
    const/16 v30, 0x0

    .line 476
    .local v30, "n_contours":I
    const/16 v31, 0x0

    .line 477
    .local v31, "have_bbox":Z
    move/from16 v32, v13

    .end local v13    # "i":I
    .local v32, "i":I
    new-array v13, v4, [B

    .line 478
    .local v13, "bitmap":[B
    const/4 v8, 0x0

    invoke-static {v0, v6, v13, v8, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 479
    shr-int/lit8 v22, v32, 0x3

    add-int v22, v6, v22

    aget-byte v22, v0, v22

    and-int/lit8 v33, v32, 0x7

    const/16 v34, 0x80

    shr-int v33, v34, v33

    and-int v22, v22, v33

    if-eqz v22, :cond_2

    .line 480
    const/16 v31, 0x1

    .line 482
    :cond_2
    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/io/font/woff2/Buffer;->readShort()S

    move-result v22

    invoke-static/range {v22 .. v22}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU16(S)I

    move-result v8

    .line 484
    .end local v30    # "n_contours":I
    .local v8, "n_contours":I
    const v0, 0xffff

    move/from16 v22, v6

    .end local v6    # "bbox_bitmap_offset":I
    .local v22, "bbox_bitmap_offset":I
    if-ne v8, v0, :cond_7

    .line 486
    const/4 v0, 0x0

    .line 487
    .local v0, "have_instructions":Z
    const/16 v30, 0x0

    .line 488
    .local v30, "instruction_size":I
    if-eqz v31, :cond_6

    .line 494
    invoke-static {v2}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->sizeOfComposite(Lcom/itextpdf/io/font/woff2/Buffer;)Lcom/itextpdf/io/font/woff2/Woff2Dec$CompositeGlyphInfo;

    move-result-object v6

    .line 495
    .local v6, "compositeGlyphInfo":Lcom/itextpdf/io/font/woff2/Woff2Dec$CompositeGlyphInfo;
    iget-boolean v0, v6, Lcom/itextpdf/io/font/woff2/Woff2Dec$CompositeGlyphInfo;->have_instructions:Z

    .line 496
    move/from16 v35, v0

    .end local v0    # "have_instructions":Z
    .local v35, "have_instructions":Z
    iget v0, v6, Lcom/itextpdf/io/font/woff2/Woff2Dec$CompositeGlyphInfo;->size:I

    .line 497
    .local v0, "composite_size":I
    if-eqz v35, :cond_3

    .line 498
    invoke-static/range {v25 .. v25}, Lcom/itextpdf/io/font/woff2/VariableLength;->read255UShort(Lcom/itextpdf/io/font/woff2/Buffer;)I

    move-result v30

    move/from16 v36, v4

    move/from16 v4, v30

    goto :goto_2

    .line 497
    :cond_3
    move/from16 v36, v4

    move/from16 v4, v30

    .line 501
    .end local v30    # "instruction_size":I
    .local v4, "instruction_size":I
    .local v36, "bitmap_length":I
    :goto_2
    add-int/lit8 v30, v0, 0xc

    move-object/from16 v37, v6

    .end local v6    # "compositeGlyphInfo":Lcom/itextpdf/io/font/woff2/Woff2Dec$CompositeGlyphInfo;
    .local v37, "compositeGlyphInfo":Lcom/itextpdf/io/font/woff2/Woff2Dec$CompositeGlyphInfo;
    add-int v6, v30, v4

    .line 502
    .local v6, "size_needed":I
    if-ge v14, v6, :cond_4

    .line 503
    move-object/from16 v39, v13

    .end local v13    # "bitmap":[B
    .local v39, "bitmap":[B
    new-array v13, v6, [B

    .line 504
    .end local v29    # "glyph_buf":[B
    .local v13, "glyph_buf":[B
    move v14, v6

    goto :goto_3

    .line 502
    .end local v39    # "bitmap":[B
    .local v13, "bitmap":[B
    .restart local v29    # "glyph_buf":[B
    :cond_4
    move-object/from16 v39, v13

    .end local v13    # "bitmap":[B
    .restart local v39    # "bitmap":[B
    move-object/from16 v13, v29

    .line 507
    .end local v29    # "glyph_buf":[B
    .local v13, "glyph_buf":[B
    :goto_3
    invoke-static {v13, v11, v8}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result v11

    .line 508
    move/from16 v30, v6

    const/16 v6, 0x8

    .end local v6    # "size_needed":I
    .local v30, "size_needed":I
    invoke-virtual {v1, v13, v11, v6}, Lcom/itextpdf/io/font/woff2/Buffer;->read([BII)V

    .line 509
    add-int/2addr v11, v6

    .line 511
    invoke-virtual {v2, v13, v11, v0}, Lcom/itextpdf/io/font/woff2/Buffer;->read([BII)V

    .line 512
    add-int/2addr v11, v0

    .line 513
    if-eqz v35, :cond_5

    .line 514
    invoke-static {v13, v11, v4}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result v6

    .line 515
    .end local v11    # "glyph_size":I
    .local v6, "glyph_size":I
    invoke-virtual {v3, v13, v6, v4}, Lcom/itextpdf/io/font/woff2/Buffer;->read([BII)V

    .line 516
    add-int/2addr v6, v4

    move v11, v6

    .line 518
    .end local v0    # "composite_size":I
    .end local v4    # "instruction_size":I
    .end local v6    # "glyph_size":I
    .end local v30    # "size_needed":I
    .end local v35    # "have_instructions":Z
    .end local v37    # "compositeGlyphInfo":Lcom/itextpdf/io/font/woff2/Woff2Dec$CompositeGlyphInfo;
    .restart local v11    # "glyph_size":I
    :cond_5
    move-object v7, v1

    move-object/from16 v21, v2

    move-object/from16 v30, v3

    move-object v10, v5

    move/from16 v35, v8

    move v0, v12

    move-object v1, v13

    move-object/from16 v13, v23

    move-object/from16 v12, v25

    move/from16 v25, v36

    move-object/from16 v23, v19

    goto/16 :goto_9

    .line 490
    .end local v36    # "bitmap_length":I
    .end local v39    # "bitmap":[B
    .local v0, "have_instructions":Z
    .local v4, "bitmap_length":I
    .local v13, "bitmap":[B
    .restart local v29    # "glyph_buf":[B
    .local v30, "instruction_size":I
    :cond_6
    move/from16 v36, v4

    .end local v4    # "bitmap_length":I
    .restart local v36    # "bitmap_length":I
    new-instance v4, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v4, v15}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 518
    .end local v0    # "have_instructions":Z
    .end local v30    # "instruction_size":I
    .end local v36    # "bitmap_length":I
    .restart local v4    # "bitmap_length":I
    :cond_7
    move/from16 v36, v4

    move-object/from16 v39, v13

    .end local v4    # "bitmap_length":I
    .end local v13    # "bitmap":[B
    .restart local v36    # "bitmap_length":I
    .restart local v39    # "bitmap":[B
    if-lez v8, :cond_11

    .line 520
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 521
    const/4 v0, 0x0

    .line 527
    .local v0, "total_n_points":I
    const/4 v4, 0x0

    move/from16 v42, v4

    move v4, v0

    move/from16 v0, v42

    .local v0, "j":I
    .local v4, "total_n_points":I
    :goto_4
    if-ge v0, v8, :cond_9

    .line 528
    invoke-static/range {v18 .. v18}, Lcom/itextpdf/io/font/woff2/VariableLength;->read255UShort(Lcom/itextpdf/io/font/woff2/Buffer;)I

    move-result v6

    .line 529
    .local v6, "n_points_contour":I
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v5, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 530
    add-int v13, v4, v6

    if-lt v13, v4, :cond_8

    .line 533
    add-int/2addr v4, v6

    .line 527
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 531
    :cond_8
    new-instance v13, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v13, v15}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 535
    .end local v0    # "j":I
    .end local v6    # "n_points_contour":I
    :cond_9
    move v6, v4

    .line 536
    .local v6, "flag_size":I
    invoke-virtual/range {v23 .. v23}, Lcom/itextpdf/io/font/woff2/Buffer;->getLength()I

    move-result v0

    invoke-virtual/range {v23 .. v23}, Lcom/itextpdf/io/font/woff2/Buffer;->getOffset()I

    move-result v13

    sub-int/2addr v0, v13

    if-gt v6, v0, :cond_10

    .line 539
    invoke-virtual/range {v23 .. v23}, Lcom/itextpdf/io/font/woff2/Buffer;->getInitialOffset()I

    move-result v0

    invoke-virtual/range {v23 .. v23}, Lcom/itextpdf/io/font/woff2/Buffer;->getOffset()I

    move-result v13

    add-int/2addr v0, v13

    .line 540
    .local v0, "flags_buf_offset":I
    invoke-virtual/range {v25 .. v25}, Lcom/itextpdf/io/font/woff2/Buffer;->getInitialOffset()I

    move-result v13

    invoke-virtual/range {v25 .. v25}, Lcom/itextpdf/io/font/woff2/Buffer;->getOffset()I

    move-result v30

    add-int v13, v13, v30

    .line 541
    .local v13, "triplet_buf_offset":I
    invoke-virtual/range {v25 .. v25}, Lcom/itextpdf/io/font/woff2/Buffer;->getLength()I

    move-result v30

    invoke-virtual/range {v25 .. v25}, Lcom/itextpdf/io/font/woff2/Buffer;->getOffset()I

    move-result v35

    sub-int v30, v30, v35

    .line 542
    .local v30, "triplet_size":I
    const/16 v35, 0x0

    .line 543
    .local v35, "triplet_bytes_consumed":I
    if-ge v12, v4, :cond_a

    .line 544
    move v12, v4

    .line 545
    move/from16 v37, v0

    .end local v0    # "flags_buf_offset":I
    .local v37, "flags_buf_offset":I
    new-array v0, v12, [Lcom/itextpdf/io/font/woff2/Woff2Common$Point;

    move-object/from16 v20, v0

    .end local v20    # "points":[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    .local v0, "points":[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    goto :goto_5

    .line 543
    .end local v37    # "flags_buf_offset":I
    .local v0, "flags_buf_offset":I
    .restart local v20    # "points":[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    :cond_a
    move/from16 v37, v0

    .line 547
    .end local v0    # "flags_buf_offset":I
    .restart local v37    # "flags_buf_offset":I
    :goto_5
    move/from16 v0, v30

    move-object/from16 v30, v3

    move v3, v0

    move-object/from16 v0, p0

    move-object v7, v1

    move-object/from16 v21, v2

    move-object v10, v5

    move v2, v13

    move-object/from16 v5, v20

    move-object/from16 v13, v23

    move/from16 v1, v37

    move-object/from16 v23, v19

    move/from16 v19, v12

    move-object/from16 v12, v25

    move/from16 v25, v36

    .end local v20    # "points":[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    .end local v36    # "bitmap_length":I
    .end local v37    # "flags_buf_offset":I
    .local v1, "flags_buf_offset":I
    .local v2, "triplet_buf_offset":I
    .local v3, "triplet_size":I
    .local v5, "points":[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    .local v7, "bbox_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v10, "n_points_vec":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .local v12, "glyph_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v13, "flag_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v19, "points_size":I
    .local v21, "composite_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v23, "loca_values":[I
    .local v25, "bitmap_length":I
    .local v30, "instruction_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    invoke-static/range {v0 .. v5}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->tripletDecode([BIIII[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;)I

    move-result v9

    .line 550
    .end local v35    # "triplet_bytes_consumed":I
    .local v9, "triplet_bytes_consumed":I
    invoke-virtual {v13, v6}, Lcom/itextpdf/io/font/woff2/Buffer;->skip(I)V

    .line 551
    invoke-virtual {v12, v9}, Lcom/itextpdf/io/font/woff2/Buffer;->skip(I)V

    .line 553
    invoke-static {v12}, Lcom/itextpdf/io/font/woff2/VariableLength;->read255UShort(Lcom/itextpdf/io/font/woff2/Buffer;)I

    move-result v0

    .line 555
    .local v0, "instruction_size":I
    move/from16 v20, v1

    .end local v1    # "flags_buf_offset":I
    .local v20, "flags_buf_offset":I
    const/high16 v1, 0x8000000

    if-ge v4, v1, :cond_f

    const/high16 v1, 0x40000000    # 2.0f

    if-ge v0, v1, :cond_f

    .line 558
    mul-int/lit8 v1, v8, 0x2

    add-int/lit8 v1, v1, 0xc

    mul-int/lit8 v33, v4, 0x5

    add-int v1, v1, v33

    add-int/2addr v1, v0

    .line 560
    .local v1, "size_needed":I
    if-ge v14, v1, :cond_b

    .line 561
    move/from16 v40, v2

    .end local v2    # "triplet_buf_offset":I
    .local v40, "triplet_buf_offset":I
    new-array v2, v1, [B

    .line 562
    .end local v29    # "glyph_buf":[B
    .local v2, "glyph_buf":[B
    move v14, v1

    move/from16 v38, v14

    goto :goto_6

    .line 560
    .end local v40    # "triplet_buf_offset":I
    .local v2, "triplet_buf_offset":I
    .restart local v29    # "glyph_buf":[B
    :cond_b
    move/from16 v40, v2

    .end local v2    # "triplet_buf_offset":I
    .restart local v40    # "triplet_buf_offset":I
    move-object/from16 v2, v29

    move/from16 v38, v14

    .line 565
    .end local v14    # "glyph_buf_size":I
    .end local v29    # "glyph_buf":[B
    .local v2, "glyph_buf":[B
    .local v38, "glyph_buf_size":I
    :goto_6
    invoke-static {v2, v11, v8}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result v11

    .line 566
    if-eqz v31, :cond_c

    .line 567
    const/16 v14, 0x8

    invoke-virtual {v7, v2, v11, v14}, Lcom/itextpdf/io/font/woff2/Buffer;->read([BII)V

    goto :goto_7

    .line 569
    :cond_c
    invoke-static {v4, v5, v2}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->computeBbox(I[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;[B)V

    .line 571
    :goto_7
    const/16 v11, 0xa

    .line 572
    const/4 v14, -0x1

    .line 573
    .local v14, "end_point":I
    const/16 v29, 0x0

    move/from16 v41, v1

    move/from16 v1, v29

    .local v1, "contour_ix":I
    .local v41, "size_needed":I
    :goto_8
    if-ge v1, v8, :cond_e

    .line 574
    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Ljava/lang/Integer;

    invoke-virtual/range {v29 .. v29}, Ljava/lang/Integer;->intValue()I

    move-result v29

    add-int v14, v14, v29

    .line 575
    move/from16 v29, v1

    .end local v1    # "contour_ix":I
    .local v29, "contour_ix":I
    const/high16 v1, 0x10000

    if-ge v14, v1, :cond_d

    .line 578
    invoke-static {v2, v11, v14}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result v11

    .line 573
    add-int/lit8 v1, v29, 0x1

    .end local v29    # "contour_ix":I
    .restart local v1    # "contour_ix":I
    goto :goto_8

    .line 576
    .end local v1    # "contour_ix":I
    .restart local v29    # "contour_ix":I
    :cond_d
    new-instance v1, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v1, v15}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 573
    .end local v29    # "contour_ix":I
    .restart local v1    # "contour_ix":I
    :cond_e
    move/from16 v29, v1

    .line 581
    .end local v1    # "contour_ix":I
    invoke-static {v2, v11, v0}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result v1

    .line 582
    .end local v11    # "glyph_size":I
    .local v1, "glyph_size":I
    move-object/from16 v11, v30

    .end local v30    # "instruction_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v11, "instruction_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    invoke-virtual {v11, v2, v1, v0}, Lcom/itextpdf/io/font/woff2/Buffer;->read([BII)V

    .line 583
    add-int/2addr v1, v0

    .line 585
    move/from16 v36, v0

    move-object/from16 v37, v2

    move/from16 v33, v4

    move-object/from16 v34, v5

    move/from16 v35, v8

    .end local v0    # "instruction_size":I
    .end local v2    # "glyph_buf":[B
    .end local v4    # "total_n_points":I
    .end local v5    # "points":[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    .end local v8    # "n_contours":I
    .local v33, "total_n_points":I
    .local v34, "points":[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    .local v35, "n_contours":I
    .local v36, "instruction_size":I
    .local v37, "glyph_buf":[B
    invoke-static/range {v33 .. v38}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->storePoints(I[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;II[BI)I

    move-result v0

    move-object/from16 v20, v5

    move-object/from16 v1, v37

    move/from16 v14, v38

    move v11, v0

    move/from16 v0, v19

    .end local v1    # "glyph_size":I
    .end local v33    # "total_n_points":I
    .end local v34    # "points":[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    .local v0, "glyph_size":I
    .restart local v4    # "total_n_points":I
    .restart local v5    # "points":[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    goto :goto_9

    .line 555
    .end local v35    # "n_contours":I
    .end local v36    # "instruction_size":I
    .end local v37    # "glyph_buf":[B
    .end local v38    # "glyph_buf_size":I
    .end local v40    # "triplet_buf_offset":I
    .end local v41    # "size_needed":I
    .local v0, "instruction_size":I
    .local v2, "triplet_buf_offset":I
    .restart local v8    # "n_contours":I
    .local v11, "glyph_size":I
    .local v14, "glyph_buf_size":I
    .local v29, "glyph_buf":[B
    .restart local v30    # "instruction_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    :cond_f
    move/from16 v36, v0

    move/from16 v40, v2

    move/from16 v35, v8

    .line 556
    .end local v0    # "instruction_size":I
    .end local v2    # "triplet_buf_offset":I
    .end local v8    # "n_contours":I
    .restart local v35    # "n_contours":I
    .restart local v36    # "instruction_size":I
    .restart local v40    # "triplet_buf_offset":I
    new-instance v0, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v0, v15}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 537
    .end local v7    # "bbox_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v9    # "triplet_bytes_consumed":I
    .end local v10    # "n_points_vec":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v13    # "flag_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v21    # "composite_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v30    # "instruction_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v35    # "n_contours":I
    .end local v40    # "triplet_buf_offset":I
    .local v1, "bbox_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v2, "composite_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v3, "instruction_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v5, "n_points_vec":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .restart local v8    # "n_contours":I
    .local v12, "points_size":I
    .local v19, "loca_values":[I
    .local v20, "points":[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    .local v23, "flag_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v25, "glyph_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v36, "bitmap_length":I
    :cond_10
    move-object v7, v1

    .end local v1    # "bbox_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v7    # "bbox_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    new-instance v1, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v1, v15}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 518
    .end local v4    # "total_n_points":I
    .end local v6    # "flag_size":I
    .end local v7    # "bbox_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v1    # "bbox_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    :cond_11
    move-object v7, v1

    move-object/from16 v21, v2

    move-object/from16 v30, v3

    move-object v10, v5

    move/from16 v35, v8

    move v0, v12

    move-object/from16 v13, v23

    move-object/from16 v12, v25

    move/from16 v25, v36

    move-object/from16 v23, v19

    .end local v1    # "bbox_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v2    # "composite_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v3    # "instruction_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v5    # "n_points_vec":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v8    # "n_contours":I
    .end local v19    # "loca_values":[I
    .end local v36    # "bitmap_length":I
    .local v0, "points_size":I
    .restart local v7    # "bbox_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v10    # "n_points_vec":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .local v12, "glyph_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v13    # "flag_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v21    # "composite_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v23, "loca_values":[I
    .local v25, "bitmap_length":I
    .restart local v30    # "instruction_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v35    # "n_contours":I
    move-object/from16 v1, v29

    .line 588
    .end local v29    # "glyph_buf":[B
    .local v1, "glyph_buf":[B
    :goto_9
    invoke-interface/range {p7 .. p7}, Lcom/itextpdf/io/font/woff2/Woff2Out;->size()I

    move-result v2

    sub-int v2, v2, v28

    aput v2, v23, v32

    .line 589
    move-object/from16 v2, p7

    const/4 v8, 0x0

    invoke-interface {v2, v1, v8, v11}, Lcom/itextpdf/io/font/woff2/Woff2Out;->write([BII)V

    .line 591
    invoke-static {v2}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->pad4(Lcom/itextpdf/io/font/woff2/Woff2Out;)V

    .line 593
    invoke-static {v1, v8, v11}, Lcom/itextpdf/io/font/woff2/Woff2Common;->computeULongSum([BII)I

    move-result v3

    add-int v3, p3, v3

    .line 596
    .end local p3    # "glyph_checksum":I
    .local v3, "glyph_checksum":I
    if-lez v35, :cond_12

    .line 597
    new-instance v4, Lcom/itextpdf/io/font/woff2/Buffer;

    const/4 v5, 0x2

    invoke-direct {v4, v1, v5, v5}, Lcom/itextpdf/io/font/woff2/Buffer;-><init>([BII)V

    .line 598
    .local v4, "x_min_buf":Lcom/itextpdf/io/font/woff2/Buffer;
    move-object/from16 v9, p6

    iget-object v6, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->x_mins:[S

    invoke-virtual {v4}, Lcom/itextpdf/io/font/woff2/Buffer;->readShort()S

    move-result v19

    aput-short v19, v6, v32

    goto :goto_a

    .line 596
    .end local v4    # "x_min_buf":Lcom/itextpdf/io/font/woff2/Buffer;
    :cond_12
    move-object/from16 v9, p6

    const/4 v5, 0x2

    .line 473
    .end local v11    # "glyph_size":I
    .end local v31    # "have_bbox":Z
    .end local v35    # "n_contours":I
    .end local v39    # "bitmap":[B
    :goto_a
    add-int/lit8 v4, v32, 0x1

    move-object/from16 v29, v1

    move v11, v3

    move-object v1, v7

    move-object/from16 v2, v21

    move/from16 v6, v22

    move-object/from16 v19, v23

    move-object/from16 v3, v30

    move-object/from16 v7, p2

    move/from16 v21, v5

    move-object v5, v10

    move-object/from16 v23, v13

    move v13, v4

    move/from16 v4, v25

    move-object/from16 v25, v12

    move v12, v0

    move-object/from16 v0, p0

    .end local v32    # "i":I
    .local v4, "i":I
    goto/16 :goto_1

    .end local v0    # "points_size":I
    .end local v7    # "bbox_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v10    # "n_points_vec":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v21    # "composite_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v22    # "bbox_bitmap_offset":I
    .end local v30    # "instruction_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v1, "bbox_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v2    # "composite_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v3, "instruction_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v4, "bitmap_length":I
    .restart local v5    # "n_points_vec":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .local v6, "bbox_bitmap_offset":I
    .local v12, "points_size":I
    .local v13, "i":I
    .restart local v19    # "loca_values":[I
    .local v23, "flag_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v25, "glyph_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v29    # "glyph_buf":[B
    .restart local p3    # "glyph_checksum":I
    :cond_13
    move-object v7, v1

    move-object/from16 v21, v2

    move-object/from16 v30, v3

    move-object v10, v5

    move/from16 v22, v6

    move v0, v12

    move/from16 v32, v13

    move-object/from16 v13, v23

    move-object/from16 v12, v25

    move-object/from16 v2, p7

    move/from16 v25, v4

    move-object/from16 v23, v19

    .line 603
    .end local v1    # "bbox_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v2    # "composite_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v3    # "instruction_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v4    # "bitmap_length":I
    .end local v5    # "n_points_vec":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v6    # "bbox_bitmap_offset":I
    .end local v19    # "loca_values":[I
    .restart local v0    # "points_size":I
    .restart local v7    # "bbox_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v10    # "n_points_vec":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .local v12, "glyph_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v13, "flag_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v21    # "composite_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .restart local v22    # "bbox_bitmap_offset":I
    .local v23, "loca_values":[I
    .local v25, "bitmap_length":I
    .restart local v30    # "instruction_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    invoke-interface {v2}, Lcom/itextpdf/io/font/woff2/Woff2Out;->size()I

    move-result v1

    move-object/from16 v3, p2

    iget v4, v3, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_offset:I

    sub-int/2addr v1, v4

    iput v1, v3, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_length:I

    .line 604
    invoke-interface {v2}, Lcom/itextpdf/io/font/woff2/Woff2Out;->size()I

    move-result v1

    move-object/from16 v8, p4

    iput v1, v8, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_offset:I

    .line 606
    iget-short v1, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->num_glyphs:S

    invoke-static {v1}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU16(S)I

    move-result v1

    iget v4, v3, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_length:I

    aput v4, v23, v1

    .line 607
    iget-short v1, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->index_format:S

    move-object/from16 v4, v23

    .end local v23    # "loca_values":[I
    .local v4, "loca_values":[I
    invoke-static {v4, v1, v2}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->storeLoca([IILcom/itextpdf/io/font/woff2/Woff2Out;)I

    move-result v1

    .line 608
    .end local p5    # "loca_checksum":I
    .local v1, "loca_checksum":I
    invoke-interface {v2}, Lcom/itextpdf/io/font/woff2/Woff2Out;->size()I

    move-result v5

    iget v6, v8, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_offset:I

    sub-int/2addr v5, v6

    iput v5, v8, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->dst_length:I

    .line 610
    new-instance v5, Lcom/itextpdf/io/font/woff2/Woff2Dec$Checksums;

    move/from16 v6, p3

    .end local p3    # "glyph_checksum":I
    .local v6, "glyph_checksum":I
    invoke-direct {v5, v1, v6}, Lcom/itextpdf/io/font/woff2/Woff2Dec$Checksums;-><init>(II)V

    return-object v5

    .line 439
    .end local v0    # "points_size":I
    .end local v4    # "loca_values":[I
    .end local v6    # "glyph_checksum":I
    .end local v7    # "bbox_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v10    # "n_points_vec":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v16    # "offset":I
    .end local v17    # "n_contour_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v18    # "n_points_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v20    # "points":[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    .end local v21    # "composite_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v22    # "bbox_bitmap_offset":I
    .end local v24    # "kNumSubStreams":I
    .end local v25    # "bitmap_length":I
    .end local v26    # "substreams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;>;"
    .end local v27    # "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .end local v28    # "glyf_start":I
    .end local v29    # "glyph_buf":[B
    .end local v30    # "instruction_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v1, "offset":I
    .local v11, "kNumSubStreams":I
    .local v12, "file":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v13, "substreams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/itextpdf/io/font/woff2/Woff2Dec$StreamInfo;>;"
    .local v14, "glyf_start":I
    .restart local p3    # "glyph_checksum":I
    .restart local p5    # "loca_checksum":I
    :cond_14
    new-instance v0, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v0, v15}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static reconstructTransformedHmtx([BIIII[SLcom/itextpdf/io/font/woff2/Woff2Out;)I
    .locals 17
    .param p0, "transformed_buf"    # [B
    .param p1, "transformed_offset"    # I
    .param p2, "transformed_size"    # I
    .param p3, "num_glyphs"    # I
    .param p4, "num_hmetrics"    # I
    .param p5, "x_mins"    # [S
    .param p6, "out"    # Lcom/itextpdf/io/font/woff2/Woff2Out;

    .line 657
    move/from16 v0, p3

    move/from16 v1, p4

    move-object/from16 v2, p5

    new-instance v3, Lcom/itextpdf/io/font/woff2/Buffer;

    move-object/from16 v4, p0

    move/from16 v5, p1

    move/from16 v6, p2

    invoke-direct {v3, v4, v5, v6}, Lcom/itextpdf/io/font/woff2/Buffer;-><init>([BII)V

    .line 659
    .local v3, "hmtx_buff_in":Lcom/itextpdf/io/font/woff2/Buffer;
    invoke-virtual {v3}, Lcom/itextpdf/io/font/woff2/Buffer;->readByte()B

    move-result v7

    invoke-static {v7}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v7

    .line 663
    .local v7, "hmtx_flags":I
    and-int/lit8 v8, v7, 0x1

    const/4 v10, 0x1

    if-nez v8, :cond_0

    move v8, v10

    goto :goto_0

    :cond_0
    const/4 v8, 0x0

    .line 664
    .local v8, "has_proportional_lsbs":Z
    :goto_0
    and-int/lit8 v11, v7, 0x2

    if-nez v11, :cond_1

    move v11, v10

    goto :goto_1

    :cond_1
    const/4 v11, 0x0

    .line 667
    .local v11, "has_monospace_lsbs":Z
    :goto_1
    const-string v12, "Reconstructing woff2 hmtx table exception"

    if-eqz v8, :cond_3

    if-nez v11, :cond_2

    goto :goto_2

    .line 668
    :cond_2
    new-instance v9, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v9, v12}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 671
    :cond_3
    :goto_2
    if-eqz v2, :cond_d

    array-length v13, v2

    if-ne v13, v0, :cond_d

    .line 676
    if-gt v1, v0, :cond_c

    .line 682
    if-lt v1, v10, :cond_b

    .line 686
    new-array v10, v1, [S

    .line 687
    .local v10, "advance_widths":[S
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_3
    if-ge v12, v1, :cond_4

    .line 689
    invoke-virtual {v3}, Lcom/itextpdf/io/font/woff2/Buffer;->readShort()S

    move-result v13

    .line 690
    .local v13, "advance_width":S
    aput-short v13, v10, v12

    .line 687
    .end local v13    # "advance_width":S
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 693
    .end local v12    # "i":I
    :cond_4
    new-array v12, v0, [S

    .line 694
    .local v12, "lsbs":[S
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_4
    if-ge v13, v1, :cond_6

    .line 696
    if-eqz v8, :cond_5

    .line 697
    invoke-virtual {v3}, Lcom/itextpdf/io/font/woff2/Buffer;->readShort()S

    move-result v14

    .local v14, "lsb":S
    goto :goto_5

    .line 699
    .end local v14    # "lsb":S
    :cond_5
    aget-short v14, v2, v13

    .line 701
    .restart local v14    # "lsb":S
    :goto_5
    aput-short v14, v12, v13

    .line 694
    .end local v14    # "lsb":S
    add-int/lit8 v13, v13, 0x1

    goto :goto_4

    .line 704
    .end local v13    # "i":I
    :cond_6
    move/from16 v13, p4

    .restart local v13    # "i":I
    :goto_6
    if-ge v13, v0, :cond_8

    .line 706
    if-eqz v11, :cond_7

    .line 707
    invoke-virtual {v3}, Lcom/itextpdf/io/font/woff2/Buffer;->readShort()S

    move-result v14

    .restart local v14    # "lsb":S
    goto :goto_7

    .line 709
    .end local v14    # "lsb":S
    :cond_7
    aget-short v14, v2, v13

    .line 711
    .restart local v14    # "lsb":S
    :goto_7
    aput-short v14, v12, v13

    .line 704
    .end local v14    # "lsb":S
    add-int/lit8 v13, v13, 0x1

    goto :goto_6

    .line 715
    .end local v13    # "i":I
    :cond_8
    mul-int/lit8 v13, v0, 0x2

    mul-int/lit8 v14, v1, 0x2

    add-int/2addr v13, v14

    .line 716
    .local v13, "hmtx_output_size":I
    new-array v14, v13, [B

    .line 717
    .local v14, "hmtx_table":[B
    const/4 v15, 0x0

    .line 718
    .local v15, "dst_offset":I
    const/16 v16, 0x0

    move/from16 v9, v16

    .local v9, "i":I
    :goto_8
    if-ge v9, v0, :cond_a

    .line 719
    if-ge v9, v1, :cond_9

    .line 720
    aget-short v0, v10, v9

    invoke-static {v14, v15, v0}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result v15

    .line 722
    :cond_9
    aget-short v0, v12, v9

    invoke-static {v14, v15, v0}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result v15

    .line 718
    add-int/lit8 v9, v9, 0x1

    move/from16 v0, p3

    goto :goto_8

    .line 725
    .end local v9    # "i":I
    :cond_a
    const/4 v0, 0x0

    invoke-static {v14, v0, v13}, Lcom/itextpdf/io/font/woff2/Woff2Common;->computeULongSum([BII)I

    move-result v9

    .line 726
    .local v9, "checksum":I
    move-object/from16 v1, p6

    invoke-interface {v1, v14, v0, v13}, Lcom/itextpdf/io/font/woff2/Woff2Out;->write([BII)V

    .line 728
    return v9

    .line 683
    .end local v9    # "checksum":I
    .end local v10    # "advance_widths":[S
    .end local v12    # "lsbs":[S
    .end local v13    # "hmtx_output_size":I
    .end local v14    # "hmtx_table":[B
    .end local v15    # "dst_offset":I
    :cond_b
    move-object/from16 v1, p6

    new-instance v0, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v0, v12}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 677
    :cond_c
    move-object/from16 v1, p6

    new-instance v0, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v0, v12}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 671
    :cond_d
    move-object/from16 v1, p6

    .line 672
    new-instance v0, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v0, v12}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static sizeOfComposite(Lcom/itextpdf/io/font/woff2/Buffer;)Lcom/itextpdf/io/font/woff2/Woff2Dec$CompositeGlyphInfo;
    .locals 6
    .param p0, "composite_stream"    # Lcom/itextpdf/io/font/woff2/Buffer;

    .line 349
    new-instance v0, Lcom/itextpdf/io/font/woff2/Buffer;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/font/woff2/Buffer;-><init>(Lcom/itextpdf/io/font/woff2/Buffer;)V

    .line 350
    .end local p0    # "composite_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    .local v0, "composite_stream":Lcom/itextpdf/io/font/woff2/Buffer;
    invoke-virtual {v0}, Lcom/itextpdf/io/font/woff2/Buffer;->getOffset()I

    move-result p0

    .line 351
    .local p0, "start_offset":I
    const/4 v1, 0x0

    .line 353
    .local v1, "we_have_instructions":Z
    const/16 v2, 0x20

    .line 354
    .local v2, "flags":I
    :goto_0
    and-int/lit8 v3, v2, 0x20

    if-eqz v3, :cond_5

    .line 355
    invoke-virtual {v0}, Lcom/itextpdf/io/font/woff2/Buffer;->readShort()S

    move-result v3

    invoke-static {v3}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU16(S)I

    move-result v2

    .line 356
    and-int/lit16 v3, v2, 0x100

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    :goto_1
    or-int/2addr v1, v3

    .line 357
    const/4 v3, 0x2

    .line 358
    .local v3, "arg_size":I
    and-int/lit8 v4, v2, 0x1

    if-eqz v4, :cond_1

    .line 359
    add-int/lit8 v3, v3, 0x4

    goto :goto_2

    .line 361
    :cond_1
    add-int/lit8 v3, v3, 0x2

    .line 363
    :goto_2
    and-int/lit8 v4, v2, 0x8

    if-eqz v4, :cond_2

    .line 364
    add-int/lit8 v3, v3, 0x2

    goto :goto_3

    .line 365
    :cond_2
    and-int/lit8 v4, v2, 0x40

    if-eqz v4, :cond_3

    .line 366
    add-int/lit8 v3, v3, 0x4

    goto :goto_3

    .line 367
    :cond_3
    and-int/lit16 v4, v2, 0x80

    if-eqz v4, :cond_4

    .line 368
    add-int/lit8 v3, v3, 0x8

    .line 370
    :cond_4
    :goto_3
    invoke-virtual {v0, v3}, Lcom/itextpdf/io/font/woff2/Buffer;->skip(I)V

    .line 371
    .end local v3    # "arg_size":I
    goto :goto_0

    .line 373
    :cond_5
    invoke-virtual {v0}, Lcom/itextpdf/io/font/woff2/Buffer;->getOffset()I

    move-result v3

    sub-int/2addr v3, p0

    .line 374
    .local v3, "size":I
    move v4, v1

    .line 376
    .local v4, "have_instructions":Z
    new-instance v5, Lcom/itextpdf/io/font/woff2/Woff2Dec$CompositeGlyphInfo;

    invoke-direct {v5, v3, v4}, Lcom/itextpdf/io/font/woff2/Woff2Dec$CompositeGlyphInfo;-><init>(IZ)V

    return-object v5
.end method

.method private static storeLoca([IILcom/itextpdf/io/font/woff2/Woff2Out;)I
    .locals 9
    .param p0, "loca_values"    # [I
    .param p1, "index_format"    # I
    .param p2, "out"    # Lcom/itextpdf/io/font/woff2/Woff2Out;

    .line 402
    array-length v0, p0

    int-to-long v0, v0

    .line 403
    .local v0, "loca_size":J
    if-eqz p1, :cond_0

    const-wide/16 v2, 0x4

    goto :goto_0

    :cond_0
    const-wide/16 v2, 0x2

    .line 404
    .local v2, "offset_size":J
    :goto_0
    const/4 v4, 0x2

    shl-long v5, v0, v4

    shr-long v4, v5, v4

    cmp-long v4, v4, v0

    if-nez v4, :cond_3

    .line 407
    mul-long v4, v0, v2

    long-to-int v4, v4

    new-array v4, v4, [B

    .line 408
    .local v4, "loca_content":[B
    const/4 v5, 0x0

    .line 409
    .local v5, "offset":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    array-length v7, p0

    if-ge v6, v7, :cond_2

    .line 410
    aget v7, p0, v6

    .line 411
    .local v7, "value":I
    if-eqz p1, :cond_1

    .line 412
    invoke-static {v4, v5, v7}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    move-result v5

    goto :goto_2

    .line 414
    :cond_1
    shr-int/lit8 v8, v7, 0x1

    invoke-static {v4, v5, v8}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result v5

    .line 409
    .end local v7    # "value":I
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 417
    .end local v6    # "i":I
    :cond_2
    array-length v6, v4

    const/4 v7, 0x0

    invoke-static {v4, v7, v6}, Lcom/itextpdf/io/font/woff2/Woff2Common;->computeULongSum([BII)I

    move-result v6

    .line 418
    .local v6, "checksum":I
    array-length v8, v4

    invoke-interface {p2, v4, v7, v8}, Lcom/itextpdf/io/font/woff2/Woff2Out;->write([BII)V

    .line 419
    return v6

    .line 405
    .end local v4    # "loca_content":[B
    .end local v5    # "offset":I
    .end local v6    # "checksum":I
    :cond_3
    new-instance v4, Lcom/itextpdf/io/exceptions/FontCompressionException;

    const-string/jumbo v5, "woff2 loca table content size overflow exception"

    invoke-direct {v4, v5}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private static storeOffsetTable([BIII)I
    .locals 3
    .param p0, "result"    # [B
    .param p1, "offset"    # I
    .param p2, "flavor"    # I
    .param p3, "num_tables"    # I

    .line 803
    invoke-static {p0, p1, p2}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    move-result p1

    .line 804
    invoke-static {p0, p1, p3}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result p1

    .line 805
    const/4 v0, 0x0

    .line 806
    .local v0, "max_pow2":I
    :goto_0
    add-int/lit8 v1, v0, 0x1

    const/4 v2, 0x1

    shl-int v1, v2, v1

    if-gt v1, p3, :cond_0

    .line 807
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 809
    :cond_0
    shl-int v1, v2, v0

    shl-int/lit8 v1, v1, 0x4

    .line 810
    .local v1, "output_search_range":I
    invoke-static {p0, p1, v1}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result p1

    .line 811
    invoke-static {p0, p1, v0}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result p1

    .line 813
    shl-int/lit8 v2, p3, 0x4

    sub-int/2addr v2, v1

    invoke-static {p0, p1, v2}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result p1

    .line 814
    return p1
.end method

.method private static storePoints(I[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;II[BI)I
    .locals 19
    .param p0, "n_points"    # I
    .param p1, "points"    # [Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    .param p2, "n_contours"    # I
    .param p3, "instruction_length"    # I
    .param p4, "dst"    # [B
    .param p5, "dst_size"    # I

    .line 223
    move/from16 v0, p0

    move-object/from16 v1, p4

    move/from16 v2, p5

    mul-int/lit8 v3, p2, 0x2

    add-int/lit8 v3, v3, 0xa

    add-int/lit8 v3, v3, 0x2

    add-int v3, v3, p3

    .line 225
    .local v3, "flag_offset":I
    const/4 v4, -0x1

    .line 226
    .local v4, "last_flag":I
    const/4 v5, 0x0

    .line 227
    .local v5, "repeat_count":I
    const/4 v6, 0x0

    .line 228
    .local v6, "last_x":I
    const/4 v7, 0x0

    .line 229
    .local v7, "last_y":I
    const/4 v8, 0x0

    .line 230
    .local v8, "x_bytes":I
    const/4 v9, 0x0

    .line 232
    .local v9, "y_bytes":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    const-string v13, "Reconstructing woff2 glyph\'s point exception"

    if-ge v10, v0, :cond_a

    .line 233
    aget-object v14, p1, v10

    .line 234
    .local v14, "point":Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    iget-boolean v15, v14, Lcom/itextpdf/io/font/woff2/Woff2Common$Point;->on_curve:Z

    .line 235
    .local v15, "flag":I
    iget v11, v14, Lcom/itextpdf/io/font/woff2/Woff2Common$Point;->x:I

    sub-int/2addr v11, v6

    .line 236
    .local v11, "dx":I
    iget v12, v14, Lcom/itextpdf/io/font/woff2/Woff2Common$Point;->y:I

    sub-int/2addr v12, v7

    .line 237
    .local v12, "dy":I
    const/16 v17, 0x0

    if-nez v11, :cond_0

    .line 238
    or-int/lit8 v15, v15, 0x10

    move/from16 v18, v6

    goto :goto_2

    .line 239
    :cond_0
    move/from16 v18, v6

    const/16 v6, -0x100

    .end local v6    # "last_x":I
    .local v18, "last_x":I
    if-le v11, v6, :cond_2

    const/16 v6, 0x100

    if-ge v11, v6, :cond_2

    .line 240
    if-lez v11, :cond_1

    const/16 v6, 0x10

    goto :goto_1

    :cond_1
    move/from16 v6, v17

    :goto_1
    or-int/lit8 v6, v6, 0x2

    or-int/2addr v15, v6

    .line 241
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 243
    :cond_2
    add-int/lit8 v8, v8, 0x2

    .line 245
    :goto_2
    if-nez v12, :cond_3

    .line 246
    or-int/lit8 v15, v15, 0x20

    goto :goto_3

    .line 247
    :cond_3
    const/16 v6, -0x100

    if-le v12, v6, :cond_5

    const/16 v6, 0x100

    if-ge v12, v6, :cond_5

    .line 248
    if-lez v12, :cond_4

    const/16 v17, 0x20

    :cond_4
    or-int/lit8 v6, v17, 0x4

    or-int/2addr v15, v6

    .line 249
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 251
    :cond_5
    add-int/lit8 v9, v9, 0x2

    .line 254
    :goto_3
    if-ne v15, v4, :cond_6

    const/16 v6, 0xff

    if-eq v5, v6, :cond_6

    .line 255
    add-int/lit8 v6, v3, -0x1

    aget-byte v13, v1, v6

    or-int/lit8 v13, v13, 0x8

    int-to-byte v13, v13

    aput-byte v13, v1, v6

    .line 256
    add-int/lit8 v5, v5, 0x1

    move/from16 v17, v4

    goto :goto_5

    .line 258
    :cond_6
    if-eqz v5, :cond_8

    .line 259
    if-ge v3, v2, :cond_7

    .line 262
    add-int/lit8 v6, v3, 0x1

    move/from16 v17, v4

    .end local v3    # "flag_offset":I
    .end local v4    # "last_flag":I
    .local v6, "flag_offset":I
    .local v17, "last_flag":I
    int-to-byte v4, v5

    aput-byte v4, v1, v3

    move v3, v6

    goto :goto_4

    .line 260
    .end local v6    # "flag_offset":I
    .end local v17    # "last_flag":I
    .restart local v3    # "flag_offset":I
    .restart local v4    # "last_flag":I
    :cond_7
    move/from16 v17, v4

    .end local v4    # "last_flag":I
    .restart local v17    # "last_flag":I
    new-instance v4, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v4, v13}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 258
    .end local v17    # "last_flag":I
    .restart local v4    # "last_flag":I
    :cond_8
    move/from16 v17, v4

    .line 264
    .end local v4    # "last_flag":I
    .restart local v17    # "last_flag":I
    :goto_4
    if-ge v3, v2, :cond_9

    .line 267
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "flag_offset":I
    .local v4, "flag_offset":I
    int-to-byte v6, v15

    aput-byte v6, v1, v3

    .line 268
    const/4 v3, 0x0

    move v5, v3

    move v3, v4

    .line 270
    .end local v4    # "flag_offset":I
    .restart local v3    # "flag_offset":I
    :goto_5
    iget v6, v14, Lcom/itextpdf/io/font/woff2/Woff2Common$Point;->x:I

    .line 271
    .end local v18    # "last_x":I
    .local v6, "last_x":I
    iget v7, v14, Lcom/itextpdf/io/font/woff2/Woff2Common$Point;->y:I

    .line 272
    move v4, v15

    .line 232
    .end local v11    # "dx":I
    .end local v12    # "dy":I
    .end local v14    # "point":Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    .end local v15    # "flag":I
    .end local v17    # "last_flag":I
    .local v4, "last_flag":I
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_0

    .line 265
    .end local v4    # "last_flag":I
    .end local v6    # "last_x":I
    .restart local v11    # "dx":I
    .restart local v12    # "dy":I
    .restart local v14    # "point":Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    .restart local v15    # "flag":I
    .restart local v17    # "last_flag":I
    .restart local v18    # "last_x":I
    :cond_9
    new-instance v4, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v4, v13}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 232
    .end local v11    # "dx":I
    .end local v12    # "dy":I
    .end local v14    # "point":Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    .end local v15    # "flag":I
    .end local v17    # "last_flag":I
    .end local v18    # "last_x":I
    .restart local v4    # "last_flag":I
    .restart local v6    # "last_x":I
    :cond_a
    move/from16 v17, v4

    move/from16 v18, v6

    .line 275
    .end local v4    # "last_flag":I
    .end local v6    # "last_x":I
    .end local v10    # "i":I
    .restart local v17    # "last_flag":I
    .restart local v18    # "last_x":I
    if-eqz v5, :cond_c

    .line 276
    if-ge v3, v2, :cond_b

    .line 279
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "flag_offset":I
    .local v4, "flag_offset":I
    int-to-byte v6, v5

    aput-byte v6, v1, v3

    move v3, v4

    goto :goto_6

    .line 277
    .end local v4    # "flag_offset":I
    .restart local v3    # "flag_offset":I
    :cond_b
    new-instance v4, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v4, v13}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 281
    :cond_c
    :goto_6
    add-int v4, v8, v9

    .line 282
    .local v4, "xy_bytes":I
    if-lt v4, v8, :cond_12

    add-int v6, v3, v4

    if-lt v6, v3, :cond_12

    add-int v6, v3, v4

    if-gt v6, v2, :cond_12

    .line 288
    move v6, v3

    .line 289
    .local v6, "x_offset":I
    add-int v10, v3, v8

    .line 290
    .local v10, "y_offset":I
    const/4 v11, 0x0

    .line 291
    .end local v18    # "last_x":I
    .local v11, "last_x":I
    const/4 v7, 0x0

    .line 292
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_7
    if-ge v12, v0, :cond_11

    .line 293
    aget-object v13, p1, v12

    iget v13, v13, Lcom/itextpdf/io/font/woff2/Woff2Common$Point;->x:I

    sub-int/2addr v13, v11

    .line 294
    .local v13, "dx":I
    if-nez v13, :cond_d

    goto :goto_8

    .line 296
    :cond_d
    const/16 v14, -0x100

    if-le v13, v14, :cond_e

    const/16 v14, 0x100

    if-ge v13, v14, :cond_e

    .line 297
    add-int/lit8 v14, v6, 0x1

    .end local v6    # "x_offset":I
    .local v14, "x_offset":I
    invoke-static {v13}, Ljava/lang/Math;->abs(I)I

    move-result v15

    int-to-byte v15, v15

    aput-byte v15, v1, v6

    move v6, v14

    goto :goto_8

    .line 300
    .end local v14    # "x_offset":I
    .restart local v6    # "x_offset":I
    :cond_e
    invoke-static {v1, v6, v13}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result v6

    .line 302
    :goto_8
    add-int/2addr v11, v13

    .line 303
    aget-object v14, p1, v12

    iget v14, v14, Lcom/itextpdf/io/font/woff2/Woff2Common$Point;->y:I

    sub-int/2addr v14, v7

    .line 304
    .local v14, "dy":I
    if-nez v14, :cond_f

    goto :goto_9

    .line 306
    :cond_f
    const/16 v15, -0x100

    if-le v14, v15, :cond_10

    const/16 v15, 0x100

    if-ge v14, v15, :cond_10

    .line 307
    add-int/lit8 v16, v10, 0x1

    .end local v10    # "y_offset":I
    .local v16, "y_offset":I
    invoke-static {v14}, Ljava/lang/Math;->abs(I)I

    move-result v15

    int-to-byte v15, v15

    aput-byte v15, v1, v10

    move/from16 v10, v16

    goto :goto_9

    .line 309
    .end local v16    # "y_offset":I
    .restart local v10    # "y_offset":I
    :cond_10
    invoke-static {v1, v10, v14}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU16([BII)I

    move-result v10

    .line 311
    :goto_9
    add-int/2addr v7, v14

    .line 292
    .end local v13    # "dx":I
    .end local v14    # "dy":I
    add-int/lit8 v12, v12, 0x1

    goto :goto_7

    .line 313
    .end local v12    # "i":I
    :cond_11
    move v12, v10

    .line 314
    .local v12, "glyph_size":I
    return v12

    .line 285
    .end local v6    # "x_offset":I
    .end local v10    # "y_offset":I
    .end local v11    # "last_x":I
    .end local v12    # "glyph_size":I
    .restart local v18    # "last_x":I
    :cond_12
    new-instance v6, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v6, v13}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method private static storeTableEntry([BII)I
    .locals 1
    .param p0, "result"    # [B
    .param p1, "offset"    # I
    .param p2, "tag"    # I

    .line 818
    invoke-static {p0, p1, p2}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    move-result p1

    .line 819
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    move-result p1

    .line 820
    invoke-static {p0, p1, v0}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    move-result p1

    .line 821
    invoke-static {p0, p1, v0}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    move-result p1

    .line 822
    return p1
.end method

.method private static tables(Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;I)Ljava/util/ArrayList;
    .locals 7
    .param p0, "hdr"    # Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;
    .param p1, "font_index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;",
            "I)",
            "Ljava/util/ArrayList<",
            "Lcom/itextpdf/io/font/woff2/Woff2Common$Table;",
            ">;"
        }
    .end annotation

    .line 840
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 841
    .local v0, "tables":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/itextpdf/io/font/woff2/Woff2Common$Table;>;"
    iget v1, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->header_version:I

    if-eqz v1, :cond_0

    .line 842
    iget-object v1, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->ttc_fonts:[Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

    aget-object v1, v1, p1

    iget-object v1, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;->table_indices:[S

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-short v4, v1, v3

    .line 843
    .local v4, "index":S
    iget-object v5, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->tables:[Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    invoke-static {v4}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU16(S)I

    move-result v6

    aget-object v5, v5, v6

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 842
    .end local v4    # "index":S
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 846
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->tables:[Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 848
    :cond_1
    return-object v0
.end method

.method private static tripletDecode([BIIII[Lcom/itextpdf/io/font/woff2/Woff2Common$Point;)I
    .locals 17
    .param p0, "data"    # [B
    .param p1, "flags_in_offset"    # I
    .param p2, "in_offset"    # I
    .param p3, "in_size"    # I
    .param p4, "n_points"    # I
    .param p5, "result"    # [Lcom/itextpdf/io/font/woff2/Woff2Common$Point;

    .line 155
    move/from16 v0, p3

    move/from16 v1, p4

    const/4 v2, 0x0

    .line 156
    .local v2, "x":I
    const/4 v3, 0x0

    .line 158
    .local v3, "y":I
    const-string v4, "Reconstructing woff2 glyph exception"

    if-gt v1, v0, :cond_b

    .line 161
    const/4 v5, 0x0

    .line 163
    .local v5, "triplet_index":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    if-ge v6, v1, :cond_a

    .line 164
    add-int v7, v6, p1

    aget-byte v7, p0, v7

    invoke-static {v7}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v7

    .line 165
    .local v7, "flag":I
    shr-int/lit8 v8, v7, 0x7

    const/4 v9, 0x1

    if-nez v8, :cond_0

    move v8, v9

    goto :goto_1

    :cond_0
    const/4 v8, 0x0

    .line 166
    .local v8, "on_curve":Z
    :goto_1
    and-int/lit8 v7, v7, 0x7f

    .line 168
    const/16 v10, 0x7c

    const/16 v11, 0x78

    const/16 v12, 0x54

    if-ge v7, v12, :cond_1

    .line 169
    const/4 v13, 0x1

    .local v13, "n_data_bytes":I
    goto :goto_2

    .line 170
    .end local v13    # "n_data_bytes":I
    :cond_1
    if-ge v7, v11, :cond_2

    .line 171
    const/4 v13, 0x2

    .restart local v13    # "n_data_bytes":I
    goto :goto_2

    .line 172
    .end local v13    # "n_data_bytes":I
    :cond_2
    if-ge v7, v10, :cond_3

    .line 173
    const/4 v13, 0x3

    .restart local v13    # "n_data_bytes":I
    goto :goto_2

    .line 175
    .end local v13    # "n_data_bytes":I
    :cond_3
    const/4 v13, 0x4

    .line 177
    .restart local v13    # "n_data_bytes":I
    :goto_2
    add-int v14, v5, v13

    if-gt v14, v0, :cond_9

    add-int v14, v5, v13

    if-lt v14, v5, :cond_9

    .line 182
    const/16 v14, 0xa

    if-ge v7, v14, :cond_4

    .line 183
    const/4 v9, 0x0

    .line 184
    .local v9, "dx":I
    and-int/lit8 v10, v7, 0xe

    shl-int/lit8 v10, v10, 0x7

    add-int v11, p2, v5

    aget-byte v11, p0, v11

    invoke-static {v11}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v11

    add-int/2addr v10, v11

    invoke-static {v7, v10}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->withSign(II)I

    move-result v10

    .local v10, "dy":I
    goto/16 :goto_3

    .line 185
    .end local v9    # "dx":I
    .end local v10    # "dy":I
    :cond_4
    const/16 v14, 0x14

    if-ge v7, v14, :cond_5

    .line 186
    add-int/lit8 v9, v7, -0xa

    and-int/lit8 v9, v9, 0xe

    shl-int/lit8 v9, v9, 0x7

    add-int v10, p2, v5

    aget-byte v10, p0, v10

    invoke-static {v10}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v10

    add-int/2addr v9, v10

    invoke-static {v7, v9}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->withSign(II)I

    move-result v9

    .line 187
    .restart local v9    # "dx":I
    const/4 v10, 0x0

    .restart local v10    # "dy":I
    goto/16 :goto_3

    .line 188
    .end local v9    # "dx":I
    .end local v10    # "dy":I
    :cond_5
    if-ge v7, v12, :cond_6

    .line 189
    add-int/lit8 v10, v7, -0x14

    .line 190
    .local v10, "b0":I
    add-int v11, p2, v5

    aget-byte v11, p0, v11

    invoke-static {v11}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v11

    .line 191
    .local v11, "b1":I
    and-int/lit8 v12, v10, 0x30

    add-int/2addr v12, v9

    shr-int/lit8 v14, v11, 0x4

    add-int/2addr v12, v14

    invoke-static {v7, v12}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->withSign(II)I

    move-result v12

    .line 192
    .local v12, "dx":I
    shr-int/lit8 v14, v7, 0x1

    and-int/lit8 v15, v10, 0xc

    shl-int/lit8 v15, v15, 0x2

    add-int/2addr v15, v9

    and-int/lit8 v9, v11, 0xf

    add-int/2addr v15, v9

    invoke-static {v14, v15}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->withSign(II)I

    move-result v10

    .line 193
    .end local v11    # "b1":I
    .local v10, "dy":I
    move v9, v12

    goto/16 :goto_3

    .end local v10    # "dy":I
    .end local v12    # "dx":I
    :cond_6
    if-ge v7, v11, :cond_7

    .line 194
    add-int/lit8 v10, v7, -0x54

    .line 195
    .local v10, "b0":I
    div-int/lit8 v11, v10, 0xc

    shl-int/lit8 v11, v11, 0x8

    add-int/2addr v11, v9

    add-int v12, p2, v5

    aget-byte v12, p0, v12

    invoke-static {v12}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v12

    add-int/2addr v11, v12

    invoke-static {v7, v11}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->withSign(II)I

    move-result v11

    .line 196
    .local v11, "dx":I
    shr-int/lit8 v12, v7, 0x1

    rem-int/lit8 v14, v10, 0xc

    shr-int/lit8 v14, v14, 0x2

    shl-int/lit8 v14, v14, 0x8

    add-int/2addr v14, v9

    add-int v15, p2, v5

    add-int/2addr v15, v9

    aget-byte v9, p0, v15

    .line 197
    invoke-static {v9}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v9

    add-int/2addr v14, v9

    .line 196
    invoke-static {v12, v14}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->withSign(II)I

    move-result v10

    .line 198
    .local v10, "dy":I
    move v9, v11

    goto :goto_3

    .end local v10    # "dy":I
    .end local v11    # "dx":I
    :cond_7
    if-ge v7, v10, :cond_8

    .line 199
    add-int v10, p2, v5

    add-int/2addr v10, v9

    aget-byte v9, p0, v10

    invoke-static {v9}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v9

    .line 200
    .local v9, "b2":I
    add-int v10, p2, v5

    aget-byte v10, p0, v10

    invoke-static {v10}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v10

    shl-int/lit8 v10, v10, 0x4

    shr-int/lit8 v11, v9, 0x4

    add-int/2addr v10, v11

    invoke-static {v7, v10}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->withSign(II)I

    move-result v10

    .line 201
    .local v10, "dx":I
    shr-int/lit8 v11, v7, 0x1

    and-int/lit8 v12, v9, 0xf

    shl-int/lit8 v12, v12, 0x8

    add-int v14, p2, v5

    add-int/lit8 v14, v14, 0x2

    aget-byte v14, p0, v14

    invoke-static {v14}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v14

    add-int/2addr v12, v14

    invoke-static {v11, v12}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->withSign(II)I

    move-result v9

    .line 202
    .local v9, "dy":I
    move/from16 v16, v10

    move v10, v9

    move/from16 v9, v16

    goto :goto_3

    .line 203
    .end local v9    # "dy":I
    .end local v10    # "dx":I
    :cond_8
    add-int v10, p2, v5

    aget-byte v10, p0, v10

    invoke-static {v10}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v10

    shl-int/lit8 v10, v10, 0x8

    add-int v11, p2, v5

    add-int/2addr v11, v9

    aget-byte v9, p0, v11

    invoke-static {v9}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v9

    add-int/2addr v10, v9

    invoke-static {v7, v10}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->withSign(II)I

    move-result v9

    .line 204
    .local v9, "dx":I
    shr-int/lit8 v10, v7, 0x1

    add-int v11, p2, v5

    add-int/lit8 v11, v11, 0x2

    aget-byte v11, p0, v11

    .line 205
    invoke-static {v11}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v11

    shl-int/lit8 v11, v11, 0x8

    add-int v12, p2, v5

    add-int/lit8 v12, v12, 0x3

    aget-byte v12, p0, v12

    invoke-static {v12}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v12

    add-int/2addr v11, v12

    .line 204
    invoke-static {v10, v11}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->withSign(II)I

    move-result v10

    .line 207
    .local v10, "dy":I
    :goto_3
    add-int/2addr v5, v13

    .line 209
    add-int/2addr v2, v9

    .line 210
    add-int/2addr v3, v10

    .line 211
    new-instance v11, Lcom/itextpdf/io/font/woff2/Woff2Common$Point;

    invoke-direct {v11, v2, v3, v8}, Lcom/itextpdf/io/font/woff2/Woff2Common$Point;-><init>(IIZ)V

    aput-object v11, p5, v6

    .line 163
    .end local v7    # "flag":I
    .end local v8    # "on_curve":Z
    .end local v9    # "dx":I
    .end local v10    # "dy":I
    .end local v13    # "n_data_bytes":I
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    .line 179
    .restart local v7    # "flag":I
    .restart local v8    # "on_curve":Z
    .restart local v13    # "n_data_bytes":I
    :cond_9
    new-instance v9, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v9, v4}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 213
    .end local v6    # "i":I
    .end local v7    # "flag":I
    .end local v8    # "on_curve":Z
    .end local v13    # "n_data_bytes":I
    :cond_a
    return v5

    .line 159
    .end local v5    # "triplet_index":I
    :cond_b
    new-instance v5, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v5, v4}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private static withSign(II)I
    .locals 1
    .param p0, "flag"    # I
    .param p1, "baseval"    # I

    .line 151
    and-int/lit8 v0, p0, 0x1

    if-eqz v0, :cond_0

    move v0, p1

    goto :goto_0

    :cond_0
    neg-int v0, p1

    :goto_0
    return v0
.end method

.method private static woff2Uncompress([BII[BII)V
    .locals 5
    .param p0, "dst_buf"    # [B
    .param p1, "dst_offset"    # I
    .param p2, "dst_length"    # I
    .param p3, "src_buf"    # [B
    .param p4, "src_offset"    # I
    .param p5, "src_length"    # I

    .line 732
    const-string v0, "Woff2 brotli decoding exception"

    move v1, p2

    .line 734
    .local v1, "remain":I
    :try_start_0
    new-instance v2, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;

    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-direct {v3, p3, p4, p5}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    invoke-direct {v2, v3}, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;-><init>(Ljava/io/InputStream;)V

    .line 735
    .local v2, "stream":Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;
    :goto_0
    if-lez v1, :cond_1

    .line 736
    invoke-virtual {v2, p0, p1, p2}, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->read([BII)I

    move-result v3

    .line 737
    .local v3, "read":I
    if-ltz v3, :cond_0

    .line 740
    sub-int/2addr v1, v3

    .line 741
    .end local v3    # "read":I
    goto :goto_0

    .line 738
    .restart local v3    # "read":I
    :cond_0
    new-instance v4, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v4, v0}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    .end local v1    # "remain":I
    .end local p0    # "dst_buf":[B
    .end local p1    # "dst_offset":I
    .end local p2    # "dst_length":I
    .end local p3    # "src_buf":[B
    .end local p4    # "src_offset":I
    .end local p5    # "src_length":I
    throw v4

    .line 743
    .end local v3    # "read":I
    .restart local v1    # "remain":I
    .restart local p0    # "dst_buf":[B
    .restart local p1    # "dst_offset":I
    .restart local p2    # "dst_length":I
    .restart local p3    # "src_buf":[B
    .restart local p4    # "src_offset":I
    .restart local p5    # "src_length":I
    :cond_1
    invoke-virtual {v2}, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->read()I

    move-result v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v4, -0x1

    if-ne v3, v4, :cond_3

    .line 748
    .end local v2    # "stream":Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;
    nop

    .line 749
    if-nez v1, :cond_2

    .line 752
    return-void

    .line 750
    :cond_2
    new-instance v2, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v2, v0}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 744
    .restart local v2    # "stream":Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;
    :cond_3
    :try_start_1
    new-instance v3, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v3, v0}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    .end local v1    # "remain":I
    .end local p0    # "dst_buf":[B
    .end local p1    # "dst_offset":I
    .end local p2    # "dst_length":I
    .end local p3    # "src_buf":[B
    .end local p4    # "src_offset":I
    .end local p5    # "src_length":I
    throw v3
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 746
    .end local v2    # "stream":Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;
    .restart local v1    # "remain":I
    .restart local p0    # "dst_buf":[B
    .restart local p1    # "dst_offset":I
    .restart local p2    # "dst_length":I
    .restart local p3    # "src_buf":[B
    .restart local p4    # "src_offset":I
    .restart local p5    # "src_length":I
    :catch_0
    move-exception v2

    .line 747
    .local v2, "any":Ljava/io/IOException;
    new-instance v3, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v3, v0}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private static writeHeaders([BILcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;Lcom/itextpdf/io/font/woff2/Woff2Out;)V
    .locals 17
    .param p0, "data"    # [B
    .param p1, "length"    # I
    .param p2, "metadata"    # Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;
    .param p3, "hdr"    # Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;
    .param p4, "out"    # Lcom/itextpdf/io/font/woff2/Woff2Out;

    .line 1108
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-static {v1}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->computeOffsetToFirstTable(Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;)I

    move-result v2

    new-array v2, v2, [B

    .line 1111
    .local v2, "output":[B
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->tables:[Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1113
    .local v3, "sorted_tables":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/woff2/Woff2Common$Table;>;"
    iget v4, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->header_version:I

    const/4 v5, 0x0

    if-eqz v4, :cond_2

    .line 1115
    iget-object v4, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->ttc_fonts:[Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

    array-length v6, v4

    move v7, v5

    :goto_0
    if-ge v7, v6, :cond_3

    aget-object v8, v4, v7

    .line 1116
    .local v8, "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    new-instance v9, Ljava/util/TreeMap;

    invoke-direct {v9}, Ljava/util/TreeMap;-><init>()V

    .line 1117
    .local v9, "sorted_index_by_tag":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Short;>;"
    iget-object v10, v8, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;->table_indices:[S

    array-length v11, v10

    move v12, v5

    :goto_1
    if-ge v12, v11, :cond_0

    aget-short v13, v10, v12

    .line 1118
    .local v13, "table_index":S
    iget-object v14, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->tables:[Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    aget-object v14, v14, v13

    iget v14, v14, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-static {v13}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v15

    invoke-interface {v9, v14, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1117
    .end local v13    # "table_index":S
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 1120
    :cond_0
    const/4 v10, 0x0

    .line 1121
    .local v10, "index":S
    invoke-interface {v9}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/Map$Entry;

    .line 1122
    .local v12, "i":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Short;>;"
    iget-object v13, v8, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;->table_indices:[S

    add-int/lit8 v14, v10, 0x1

    int-to-short v14, v14

    .end local v10    # "index":S
    .local v14, "index":S
    invoke-interface {v12}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Short;

    invoke-virtual {v15}, Ljava/lang/Short;->shortValue()S

    move-result v15

    aput-short v15, v13, v10

    .line 1123
    .end local v12    # "i":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Short;>;"
    move v10, v14

    goto :goto_2

    .line 1115
    .end local v8    # "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    .end local v9    # "sorted_index_by_tag":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Short;>;"
    .end local v14    # "index":S
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1127
    :cond_2
    invoke-static {v3}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 1131
    :cond_3
    const/4 v4, 0x0

    .line 1132
    .local v4, "offset":I
    iget v6, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->header_version:I

    const/4 v7, 0x0

    if-eqz v6, :cond_8

    .line 1134
    iget v6, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->flavor:I

    invoke-static {v2, v4, v6}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    move-result v4

    .line 1135
    iget v6, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->header_version:I

    invoke-static {v2, v4, v6}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    move-result v4

    .line 1136
    iget-object v6, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->ttc_fonts:[Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

    array-length v6, v6

    invoke-static {v2, v4, v6}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    move-result v4

    .line 1138
    move v6, v4

    .line 1139
    .local v6, "offset_table":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_3
    iget-object v9, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->ttc_fonts:[Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

    array-length v9, v9

    if-ge v8, v9, :cond_4

    .line 1140
    invoke-static {v2, v4, v5}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    move-result v4

    .line 1139
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 1143
    .end local v8    # "i":I
    :cond_4
    iget v8, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->header_version:I

    const/high16 v9, 0x20000

    if-ne v8, v9, :cond_5

    .line 1144
    invoke-static {v2, v4, v5}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    move-result v4

    .line 1145
    invoke-static {v2, v4, v5}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    move-result v4

    .line 1146
    invoke-static {v2, v4, v5}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    move-result v4

    .line 1150
    :cond_5
    iget-object v8, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->ttc_fonts:[Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

    array-length v8, v8

    new-array v8, v8, [Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;

    iput-object v8, v0, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;->font_infos:[Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;

    .line 1151
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_4
    iget-object v9, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->ttc_fonts:[Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

    array-length v9, v9

    if-ge v8, v9, :cond_7

    .line 1152
    iget-object v9, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->ttc_fonts:[Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

    aget-object v9, v9, v8

    .line 1155
    .local v9, "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    invoke-static {v2, v6, v4}, Lcom/itextpdf/io/font/woff2/StoreBytes;->storeU32([BII)I

    move-result v6

    .line 1158
    iput v4, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;->dst_offset:I

    .line 1159
    iget v10, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;->flavor:I

    iget-object v11, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;->table_indices:[S

    array-length v11, v11

    invoke-static {v2, v4, v10, v11}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->storeOffsetTable([BIII)I

    move-result v4

    .line 1161
    iget-object v10, v0, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;->font_infos:[Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;

    new-instance v11, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;

    invoke-direct {v11, v7}, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;-><init>(Lcom/itextpdf/io/font/woff2/Woff2Dec$1;)V

    aput-object v11, v10, v8

    .line 1162
    iget-object v10, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;->table_indices:[S

    array-length v11, v10

    move v12, v5

    :goto_5
    if-ge v12, v11, :cond_6

    aget-short v13, v10, v12

    .line 1163
    .restart local v13    # "table_index":S
    iget-object v14, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->tables:[Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    aget-object v14, v14, v13

    iget v14, v14, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    .line 1164
    .local v14, "tag":I
    iget-object v15, v0, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;->font_infos:[Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;

    aget-object v15, v15, v8

    iget-object v15, v15, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->table_entry_by_tag:Ljava/util/Map;

    move/from16 v16, v5

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v15, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1165
    invoke-static {v2, v4, v14}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->storeTableEntry([BII)I

    move-result v4

    .line 1162
    .end local v13    # "table_index":S
    .end local v14    # "tag":I
    add-int/lit8 v12, v12, 0x1

    move/from16 v5, v16

    const/4 v7, 0x0

    goto :goto_5

    .line 1168
    :cond_6
    move/from16 v16, v5

    iget v5, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;->dst_offset:I

    iget v7, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;->dst_offset:I

    sub-int v7, v4, v7

    invoke-static {v2, v5, v7}, Lcom/itextpdf/io/font/woff2/Woff2Common;->computeULongSum([BII)I

    move-result v5

    iput v5, v9, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;->header_checksum:I

    .line 1151
    .end local v9    # "ttc_font":Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
    add-int/lit8 v8, v8, 0x1

    move/from16 v5, v16

    const/4 v7, 0x0

    goto :goto_4

    :cond_7
    move/from16 v16, v5

    .line 1170
    .end local v6    # "offset_table":I
    .end local v8    # "i":I
    goto :goto_7

    .line 1171
    :cond_8
    move/from16 v16, v5

    const/4 v5, 0x1

    new-array v5, v5, [Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;

    iput-object v5, v0, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;->font_infos:[Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;

    .line 1172
    iget v5, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->flavor:I

    iget-short v6, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->num_tables:S

    invoke-static {v2, v4, v5, v6}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->storeOffsetTable([BIII)I

    move-result v4

    .line 1173
    iget-object v5, v0, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;->font_infos:[Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;

    new-instance v6, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;

    const/4 v7, 0x0

    invoke-direct {v6, v7}, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;-><init>(Lcom/itextpdf/io/font/woff2/Woff2Dec$1;)V

    aput-object v6, v5, v16

    .line 1174
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_6
    iget-short v6, v1, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;->num_tables:S

    if-ge v5, v6, :cond_9

    .line 1175
    iget-object v6, v0, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;->font_infos:[Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;

    aget-object v6, v6, v16

    iget-object v6, v6, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->table_entry_by_tag:Ljava/util/Map;

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    iget v7, v7, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1176
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    iget v6, v6, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    invoke-static {v2, v4, v6}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->storeTableEntry([BII)I

    move-result v4

    .line 1174
    add-int/lit8 v5, v5, 0x1

    goto :goto_6

    .line 1180
    .end local v5    # "i":I
    :cond_9
    :goto_7
    array-length v5, v2

    move-object/from16 v6, p4

    move/from16 v7, v16

    invoke-interface {v6, v2, v7, v5}, Lcom/itextpdf/io/font/woff2/Woff2Out;->write([BII)V

    .line 1181
    array-length v5, v2

    invoke-static {v2, v7, v5}, Lcom/itextpdf/io/font/woff2/Woff2Common;->computeULongSum([BII)I

    move-result v5

    iput v5, v0, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;->header_checksum:I

    .line 1182
    return-void
.end method
