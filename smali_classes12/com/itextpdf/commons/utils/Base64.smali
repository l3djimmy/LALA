.class public Lcom/itextpdf/commons/utils/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/commons/utils/Base64$OutputStream;,
        Lcom/itextpdf/commons/utils/Base64$InputStream;
    }
.end annotation


# static fields
.field public static final DECODE:I = 0x0

.field public static final DONT_BREAK_LINES:I = 0x8

.field public static final ENCODE:I = 0x1

.field private static final EQUALS_SIGN:B = 0x3dt

.field private static final EQUALS_SIGN_ENC:B = -0x1t

.field public static final GZIP:I = 0x2

.field private static final LOGGER:Lorg/slf4j/Logger;

.field private static final MAX_LINE_LENGTH:I = 0x4c

.field private static final NEW_LINE:B = 0xat

.field public static final NO_OPTIONS:I = 0x0

.field public static final ORDERED:I = 0x20

.field private static final PREFERRED_ENCODING:Ljava/lang/String; = "UTF-8"

.field public static final URL_SAFE:I = 0x10

.field private static final WHITE_SPACE_ENC:B = -0x5t

.field private static final _ORDERED_ALPHABET:[B

.field private static final _ORDERED_DECODABET:[B

.field private static final _STANDARD_ALPHABET:[B

.field private static final _STANDARD_DECODABET:[B

.field private static final _URL_SAFE_ALPHABET:[B

.field private static final _URL_SAFE_DECODABET:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 128
    const-class v0, Lcom/itextpdf/commons/utils/Base64;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/commons/utils/Base64;->LOGGER:Lorg/slf4j/Logger;

    .line 167
    const/16 v0, 0x40

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/commons/utils/Base64;->_STANDARD_ALPHABET:[B

    .line 186
    const/16 v0, 0x7f

    new-array v0, v0, [B

    fill-array-data v0, :array_1

    sput-object v0, Lcom/itextpdf/commons/utils/Base64;->_STANDARD_DECODABET:[B

    .line 229
    const/16 v0, 0x40

    new-array v0, v0, [B

    fill-array-data v0, :array_2

    sput-object v0, Lcom/itextpdf/commons/utils/Base64;->_URL_SAFE_ALPHABET:[B

    .line 246
    const/16 v0, 0x7f

    new-array v0, v0, [B

    fill-array-data v0, :array_3

    sput-object v0, Lcom/itextpdf/commons/utils/Base64;->_URL_SAFE_DECODABET:[B

    .line 293
    const/16 v0, 0x40

    new-array v0, v0, [B

    fill-array-data v0, :array_4

    sput-object v0, Lcom/itextpdf/commons/utils/Base64;->_ORDERED_ALPHABET:[B

    .line 312
    const/16 v0, 0x7f

    new-array v0, v0, [B

    fill-array-data v0, :array_5

    sput-object v0, Lcom/itextpdf/commons/utils/Base64;->_ORDERED_DECODABET:[B

    return-void

    nop

    :array_0
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2bt
        0x2ft
    .end array-data

    :array_1
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3et
        -0x9t
        -0x9t
        -0x9t
        0x3ft
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        0x25t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data

    :array_2
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2dt
        0x5ft
    .end array-data

    :array_3
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3et
        -0x9t
        -0x9t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3ft
        -0x9t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        0x25t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data

    :array_4
    .array-data 1
        0x2dt
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x5ft
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
    .end array-data

    :array_5
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x0t
        -0x9t
        -0x9t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x25t
        -0x9t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        0x3et
        0x3ft
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 388
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 389
    return-void
.end method

.method static synthetic access$000(I)[B
    .locals 1
    .param p0, "x0"    # I

    .line 72
    invoke-static {p0}, Lcom/itextpdf/commons/utils/Base64;->getAlphabet(I)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(I)[B
    .locals 1
    .param p0, "x0"    # I

    .line 72
    invoke-static {p0}, Lcom/itextpdf/commons/utils/Base64;->getDecodabet(I)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200([BII[BII)[B
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # [B
    .param p4, "x4"    # I
    .param p5, "x5"    # I

    .line 72
    invoke-static/range {p0 .. p5}, Lcom/itextpdf/commons/utils/Base64;->encode3to4([BII[BII)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300([BI[BII)I
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # I
    .param p2, "x2"    # [B
    .param p3, "x3"    # I
    .param p4, "x4"    # I

    .line 72
    invoke-static {p0, p1, p2, p3, p4}, Lcom/itextpdf/commons/utils/Base64;->decode4to3([BI[BII)I

    move-result v0

    return v0
.end method

.method static synthetic access$400([B[BII)[B
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # [B
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .line 72
    invoke-static {p0, p1, p2, p3}, Lcom/itextpdf/commons/utils/Base64;->encode3to4([B[BII)[B

    move-result-object v0

    return-object v0
.end method

.method public static decode(Ljava/lang/String;)[B
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .line 947
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/commons/utils/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    return-object v0
.end method

.method public static decode(Ljava/lang/String;I)[B
    .locals 9
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "options"    # I

    .line 963
    :try_start_0
    const-string v0, "UTF-8"

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 967
    .local v0, "bytes":[B
    goto :goto_0

    .line 965
    .end local v0    # "bytes":[B
    :catch_0
    move-exception v0

    .line 966
    .local v0, "uee":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    move-object v0, v1

    .line 971
    .local v0, "bytes":[B
    :goto_0
    array-length v1, v0

    const/4 v2, 0x0

    invoke-static {v0, v2, v1, p1}, Lcom/itextpdf/commons/utils/Base64;->decode([BIII)[B

    move-result-object v0

    .line 976
    if-eqz v0, :cond_1

    array-length v1, v0

    const/4 v3, 0x4

    if-lt v1, v3, :cond_1

    .line 978
    aget-byte v1, v0, v2

    and-int/lit16 v1, v1, 0xff

    const/4 v3, 0x1

    aget-byte v3, v0, v3

    shl-int/lit8 v3, v3, 0x8

    const v4, 0xff00

    and-int/2addr v3, v4

    or-int/2addr v1, v3

    .line 979
    .local v1, "head":I
    const v3, 0x8b1f

    if-ne v3, v1, :cond_1

    .line 980
    const/4 v3, 0x0

    .line 981
    .local v3, "bais":Ljava/io/ByteArrayInputStream;
    const/4 v4, 0x0

    .line 982
    .local v4, "gzis":Ljava/util/zip/GZIPInputStream;
    const/4 v5, 0x0

    .line 983
    .local v5, "baos":Ljava/io/ByteArrayOutputStream;
    const/16 v6, 0x800

    new-array v6, v6, [B

    .line 984
    .local v6, "buffer":[B
    const/4 v7, 0x0

    .line 987
    .local v7, "length":I
    :try_start_1
    new-instance v8, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v8}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move-object v5, v8

    .line 988
    new-instance v8, Ljava/io/ByteArrayInputStream;

    invoke-direct {v8, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    move-object v3, v8

    .line 989
    new-instance v8, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v8, v3}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    move-object v4, v8

    .line 991
    :goto_1
    invoke-virtual {v4, v6}, Ljava/util/zip/GZIPInputStream;->read([B)I

    move-result v8

    move v7, v8

    if-ltz v8, :cond_0

    .line 992
    invoke-virtual {v5, v6, v2, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    .line 996
    :cond_0
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v0, v2

    .line 1004
    :try_start_2
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 1006
    goto :goto_2

    .line 1005
    :catch_1
    move-exception v2

    .line 1008
    :goto_2
    :try_start_3
    invoke-virtual {v4}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 1010
    goto :goto_3

    .line 1009
    :catch_2
    move-exception v2

    .line 1012
    :goto_3
    :try_start_4
    invoke-virtual {v3}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 1014
    goto :goto_8

    .line 1013
    :catch_3
    move-exception v2

    .line 1015
    goto :goto_8

    .line 1003
    :catchall_0
    move-exception v2

    .line 1004
    :try_start_5
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    .line 1006
    goto :goto_4

    .line 1005
    :catch_4
    move-exception v8

    .line 1008
    :goto_4
    :try_start_6
    invoke-virtual {v4}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    .line 1010
    goto :goto_5

    .line 1009
    :catch_5
    move-exception v8

    .line 1012
    :goto_5
    :try_start_7
    invoke-virtual {v3}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    .line 1014
    goto :goto_6

    .line 1013
    :catch_6
    move-exception v8

    .line 1015
    :goto_6
    throw v2

    .line 999
    :catch_7
    move-exception v2

    .line 1004
    :try_start_8
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_8

    .line 1006
    goto :goto_7

    .line 1005
    :catch_8
    move-exception v2

    .line 1008
    :goto_7
    :try_start_9
    invoke-virtual {v4}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_9

    .line 1010
    goto :goto_3

    .line 1009
    :catch_9
    move-exception v2

    goto :goto_3

    .line 1020
    .end local v1    # "head":I
    .end local v3    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v4    # "gzis":Ljava/util/zip/GZIPInputStream;
    .end local v5    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "buffer":[B
    .end local v7    # "length":I
    :cond_1
    :goto_8
    return-object v0
.end method

.method public static decode([BIII)[B
    .locals 12
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "options"    # I

    .line 895
    invoke-static {p3}, Lcom/itextpdf/commons/utils/Base64;->getDecodabet(I)[B

    move-result-object v0

    .line 897
    .local v0, "DECODABET":[B
    mul-int/lit8 v1, p2, 0x3

    const/4 v2, 0x4

    div-int/2addr v1, v2

    .line 898
    .local v1, "len34":I
    new-array v3, v1, [B

    .line 899
    .local v3, "outBuff":[B
    const/4 v4, 0x0

    .line 901
    .local v4, "outBuffPosn":I
    new-array v2, v2, [B

    .line 902
    .local v2, "b4":[B
    const/4 v5, 0x0

    .line 903
    .local v5, "b4Posn":I
    const/4 v6, 0x0

    .line 904
    .local v6, "i":I
    const/4 v7, 0x0

    .line 905
    .local v7, "sbiCrop":B
    const/4 v8, 0x0

    .line 906
    .local v8, "sbiDecode":B
    move v6, p1

    :goto_0
    add-int v9, p1, p2

    const/4 v10, 0x0

    if-ge v6, v9, :cond_3

    .line 907
    aget-byte v9, p0, v6

    and-int/lit8 v9, v9, 0x7f

    int-to-byte v7, v9

    .line 908
    aget-byte v8, v0, v7

    .line 910
    const/4 v9, -0x5

    if-lt v8, v9, :cond_2

    .line 912
    const/4 v9, -0x1

    if-lt v8, v9, :cond_1

    .line 913
    add-int/lit8 v9, v5, 0x1

    .end local v5    # "b4Posn":I
    .local v9, "b4Posn":I
    aput-byte v7, v2, v5

    .line 914
    const/4 v5, 0x3

    if-le v9, v5, :cond_0

    .line 915
    invoke-static {v2, v10, v3, v4, p3}, Lcom/itextpdf/commons/utils/Base64;->decode4to3([BI[BII)I

    move-result v5

    add-int/2addr v4, v5

    .line 916
    const/4 v5, 0x0

    .line 919
    .end local v9    # "b4Posn":I
    .restart local v5    # "b4Posn":I
    const/16 v9, 0x3d

    if-ne v7, v9, :cond_1

    .line 920
    goto :goto_1

    .line 914
    .end local v5    # "b4Posn":I
    .restart local v9    # "b4Posn":I
    :cond_0
    move v5, v9

    .line 906
    .end local v9    # "b4Posn":I
    .restart local v5    # "b4Posn":I
    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 927
    :cond_2
    sget-object v9, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Bad Base64 input character at "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ": "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    aget-byte v11, p0, v6

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "(decimal)"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 928
    const/4 v9, 0x0

    return-object v9

    .line 932
    :cond_3
    :goto_1
    new-array v9, v4, [B

    .line 933
    .local v9, "out":[B
    invoke-static {v3, v10, v9, v10, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 934
    return-object v9
.end method

.method private static decode4to3([BI[BII)I
    .locals 7
    .param p0, "source"    # [B
    .param p1, "srcOffset"    # I
    .param p2, "destination"    # [B
    .param p3, "destOffset"    # I
    .param p4, "options"    # I

    .line 823
    invoke-static {p4}, Lcom/itextpdf/commons/utils/Base64;->getDecodabet(I)[B

    move-result-object v0

    .line 826
    .local v0, "DECODABET":[B
    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    const/16 v2, 0x3d

    if-ne v1, v2, :cond_0

    .line 830
    aget-byte v1, p0, p1

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x12

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0xc

    or-int/2addr v1, v2

    .line 833
    .local v1, "outBuff":I
    ushr-int/lit8 v2, v1, 0x10

    int-to-byte v2, v2

    aput-byte v2, p2, p3

    .line 834
    const/4 v2, 0x1

    return v2

    .line 838
    .end local v1    # "outBuff":I
    :cond_0
    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    if-ne v1, v2, :cond_1

    .line 843
    aget-byte v1, p0, p1

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x12

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0xc

    or-int/2addr v1, v2

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x6

    or-int/2addr v1, v2

    .line 847
    .restart local v1    # "outBuff":I
    ushr-int/lit8 v2, v1, 0x10

    int-to-byte v2, v2

    aput-byte v2, p2, p3

    .line 848
    add-int/lit8 v2, p3, 0x1

    ushr-int/lit8 v3, v1, 0x8

    int-to-byte v3, v3

    aput-byte v3, p2, v2

    .line 849
    const/4 v2, 0x2

    return v2

    .line 860
    .end local v1    # "outBuff":I
    :cond_1
    :try_start_0
    aget-byte v1, p0, p1

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x12

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0xc

    or-int/2addr v1, v2

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x6

    or-int/2addr v1, v2

    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    .line 866
    .restart local v1    # "outBuff":I
    shr-int/lit8 v2, v1, 0x10

    int-to-byte v2, v2

    aput-byte v2, p2, p3

    .line 867
    add-int/lit8 v2, p3, 0x1

    shr-int/lit8 v3, v1, 0x8

    int-to-byte v3, v3

    aput-byte v3, p2, v2

    .line 868
    add-int/lit8 v2, p3, 0x2

    int-to-byte v3, v1

    aput-byte v3, p2, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 870
    const/4 v2, 0x3

    return v2

    .line 871
    .end local v1    # "outBuff":I
    :catch_0
    move-exception v1

    .line 872
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-byte v5, p0, p1

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ": "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-byte v6, p0, p1

    aget-byte v6, v0, v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 873
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v6, p1, 0x1

    aget-byte v6, p0, v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v6, p1, 0x1

    aget-byte v6, p0, v6

    aget-byte v6, v0, v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 874
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v6, p1, 0x2

    aget-byte v6, p0, v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v6, p1, 0x2

    aget-byte v6, p0, v6

    aget-byte v6, v0, v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 875
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, p1, 0x3

    aget-byte v4, p0, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, p1, 0x3

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 876
    const/4 v2, -0x1

    return v2
.end method

.method public static decodeFileToFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "infile"    # Ljava/lang/String;
    .param p1, "outfile"    # Ljava/lang/String;

    .line 1264
    invoke-static {p0}, Lcom/itextpdf/commons/utils/Base64;->decodeFromFile(Ljava/lang/String;)[B

    move-result-object v0

    .line 1265
    .local v0, "decoded":[B
    const/4 v1, 0x0

    .line 1267
    .local v1, "out":Ljava/io/OutputStream;
    :try_start_0
    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object v1, v2

    .line 1269
    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1276
    :try_start_1
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1278
    :goto_0
    goto :goto_1

    .line 1277
    :catch_0
    move-exception v2

    .line 1279
    goto :goto_1

    .line 1275
    :catchall_0
    move-exception v2

    goto :goto_2

    .line 1271
    :catch_1
    move-exception v2

    .line 1272
    .local v2, "ex":Ljava/io/IOException;
    :try_start_2
    sget-object v3, Lcom/itextpdf/commons/utils/Base64;->LOGGER:Lorg/slf4j/Logger;

    const-string v4, "Exception during base64 encoding or decoding."

    invoke-interface {v3, v4, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1276
    .end local v2    # "ex":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 1280
    :goto_1
    return-void

    .line 1276
    :goto_2
    :try_start_4
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 1278
    goto :goto_3

    .line 1277
    :catch_2
    move-exception v3

    .line 1279
    :goto_3
    throw v2
.end method

.method public static decodeFromFile(Ljava/lang/String;)[B
    .locals 10
    .param p0, "filename"    # Ljava/lang/String;

    .line 1139
    const/4 v0, 0x0

    .line 1140
    .local v0, "decodedData":[B
    const/4 v1, 0x0

    .line 1143
    .local v1, "bis":Lcom/itextpdf/commons/utils/Base64$InputStream;
    :try_start_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1144
    .local v2, "file":Ljava/io/File;
    const/4 v3, 0x0

    .line 1145
    .local v3, "buffer":[B
    const/4 v4, 0x0

    .line 1146
    .local v4, "length":I
    const/4 v5, 0x0

    .line 1149
    .local v5, "numBytes":I
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v6

    const-wide/32 v8, 0x7fffffff

    cmp-long v6, v6, v8

    if-lez v6, :cond_1

    .line 1150
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "File is too big for this convenience method ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " bytes)."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1151
    nop

    .line 1173
    if-eqz v1, :cond_0

    .line 1175
    :try_start_1
    invoke-virtual {v1}, Lcom/itextpdf/commons/utils/Base64$InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1177
    goto :goto_0

    .line 1176
    :catch_0
    move-exception v6

    .line 1151
    :cond_0
    :goto_0
    const/4 v6, 0x0

    return-object v6

    .line 1153
    :cond_1
    :try_start_2
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v6

    long-to-int v6, v6

    new-array v6, v6, [B

    .line 1156
    .end local v3    # "buffer":[B
    .local v6, "buffer":[B
    new-instance v3, Lcom/itextpdf/commons/utils/Base64$InputStream;

    new-instance v7, Ljava/io/BufferedInputStream;

    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v7, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v8, 0x0

    invoke-direct {v3, v7, v8}, Lcom/itextpdf/commons/utils/Base64$InputStream;-><init>(Ljava/io/InputStream;I)V

    move-object v1, v3

    .line 1161
    :goto_1
    const/16 v3, 0x1000

    invoke-virtual {v1, v6, v4, v3}, Lcom/itextpdf/commons/utils/Base64$InputStream;->read([BII)I

    move-result v3

    move v5, v3

    if-ltz v3, :cond_2

    .line 1162
    add-int/2addr v4, v5

    goto :goto_1

    .line 1165
    :cond_2
    new-array v3, v4, [B

    move-object v0, v3

    .line 1166
    invoke-static {v6, v8, v0, v8, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1173
    .end local v2    # "file":Ljava/io/File;
    .end local v4    # "length":I
    .end local v5    # "numBytes":I
    .end local v6    # "buffer":[B
    nop

    .line 1175
    :goto_2
    :try_start_3
    invoke-virtual {v1}, Lcom/itextpdf/commons/utils/Base64$InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 1177
    :goto_3
    goto :goto_4

    .line 1176
    :catch_1
    move-exception v2

    goto :goto_3

    .line 1173
    :catchall_0
    move-exception v2

    goto :goto_5

    .line 1169
    :catch_2
    move-exception v2

    .line 1170
    .local v2, "e":Ljava/io/IOException;
    :try_start_4
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error decoding from file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1173
    .end local v2    # "e":Ljava/io/IOException;
    if-eqz v1, :cond_3

    .line 1175
    goto :goto_2

    .line 1181
    :cond_3
    :goto_4
    return-object v0

    .line 1173
    :goto_5
    if-eqz v1, :cond_4

    .line 1175
    :try_start_5
    invoke-virtual {v1}, Lcom/itextpdf/commons/utils/Base64$InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 1177
    goto :goto_6

    .line 1176
    :catch_3
    move-exception v3

    .line 1179
    :cond_4
    :goto_6
    throw v2
.end method

.method public static decodeToFile(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p0, "dataToDecode"    # Ljava/lang/String;
    .param p1, "filename"    # Ljava/lang/String;

    .line 1108
    const/4 v0, 0x0

    .line 1109
    .local v0, "success":Z
    const/4 v1, 0x0

    .line 1111
    .local v1, "bos":Lcom/itextpdf/commons/utils/Base64$OutputStream;
    :try_start_0
    new-instance v2, Lcom/itextpdf/commons/utils/Base64$OutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/commons/utils/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V

    move-object v1, v2

    .line 1113
    const-string v2, "UTF-8"

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/commons/utils/Base64$OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1114
    const/4 v0, 0x1

    .line 1121
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Lcom/itextpdf/commons/utils/Base64$OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1123
    goto :goto_2

    .line 1122
    :catch_0
    move-exception v2

    .line 1124
    goto :goto_2

    .line 1120
    :catchall_0
    move-exception v2

    .line 1121
    :try_start_2
    invoke-virtual {v1}, Lcom/itextpdf/commons/utils/Base64$OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 1123
    goto :goto_1

    .line 1122
    :catch_1
    move-exception v3

    .line 1124
    :goto_1
    throw v2

    .line 1116
    :catch_2
    move-exception v2

    .line 1117
    .local v2, "e":Ljava/io/IOException;
    const/4 v0, 0x0

    goto :goto_0

    .line 1126
    .end local v2    # "e":Ljava/io/IOException;
    :goto_2
    return v0
.end method

.method public static decodeToObject(Ljava/lang/String;)Ljava/lang/Object;
    .locals 7
    .param p0, "encodedObject"    # Ljava/lang/String;

    .line 1034
    const-string v0, "Exception during base64 encoding or decoding."

    invoke-static {p0}, Lcom/itextpdf/commons/utils/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v1

    .line 1036
    .local v1, "objBytes":[B
    const/4 v2, 0x0

    .line 1037
    .local v2, "bais":Ljava/io/ByteArrayInputStream;
    const/4 v3, 0x0

    .line 1038
    .local v3, "ois":Ljava/io/ObjectInputStream;
    const/4 v4, 0x0

    .line 1041
    .local v4, "obj":Ljava/lang/Object;
    :try_start_0
    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-direct {v5, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    move-object v2, v5

    .line 1042
    new-instance v5, Ljava/io/ObjectInputStream;

    invoke-direct {v5, v2}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    move-object v3, v5

    .line 1044
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v4, v0

    .line 1054
    :try_start_1
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1056
    goto :goto_0

    .line 1055
    :catch_0
    move-exception v0

    .line 1058
    :goto_0
    :try_start_2
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 1060
    goto :goto_1

    .line 1059
    :catch_1
    move-exception v0

    .line 1061
    goto :goto_1

    .line 1053
    :catchall_0
    move-exception v0

    goto :goto_2

    .line 1049
    :catch_2
    move-exception v5

    .line 1050
    .local v5, "e":Ljava/lang/ClassNotFoundException;
    :try_start_3
    sget-object v6, Lcom/itextpdf/commons/utils/Base64;->LOGGER:Lorg/slf4j/Logger;

    invoke-interface {v6, v0, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1054
    .end local v5    # "e":Ljava/lang/ClassNotFoundException;
    :try_start_4
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 1056
    goto :goto_0

    .line 1055
    :catch_3
    move-exception v0

    goto :goto_0

    .line 1046
    :catch_4
    move-exception v5

    .line 1047
    .local v5, "e":Ljava/io/IOException;
    :try_start_5
    sget-object v6, Lcom/itextpdf/commons/utils/Base64;->LOGGER:Lorg/slf4j/Logger;

    invoke-interface {v6, v0, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1054
    .end local v5    # "e":Ljava/io/IOException;
    :try_start_6
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    .line 1056
    goto :goto_0

    .line 1055
    :catch_5
    move-exception v0

    goto :goto_0

    .line 1063
    :goto_1
    return-object v4

    .line 1054
    :goto_2
    :try_start_7
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    .line 1056
    goto :goto_3

    .line 1055
    :catch_6
    move-exception v5

    .line 1058
    :goto_3
    :try_start_8
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_7

    .line 1060
    goto :goto_4

    .line 1059
    :catch_7
    move-exception v5

    .line 1061
    :goto_4
    throw v0
.end method

.method private static encode3to4([BII[BII)[B
    .locals 5
    .param p0, "source"    # [B
    .param p1, "srcOffset"    # I
    .param p2, "numSigBytes"    # I
    .param p3, "destination"    # [B
    .param p4, "destOffset"    # I
    .param p5, "options"    # I

    .line 479
    invoke-static {p5}, Lcom/itextpdf/commons/utils/Base64;->getAlphabet(I)[B

    move-result-object v0

    .line 492
    .local v0, "ALPHABET":[B
    const/4 v1, 0x0

    if-lez p2, :cond_0

    aget-byte v2, p0, p1

    shl-int/lit8 v2, v2, 0x18

    ushr-int/lit8 v2, v2, 0x8

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    const/4 v3, 0x1

    if-le p2, v3, :cond_1

    add-int/lit8 v3, p1, 0x1

    aget-byte v3, p0, v3

    shl-int/lit8 v3, v3, 0x18

    ushr-int/lit8 v3, v3, 0x10

    goto :goto_1

    :cond_1
    move v3, v1

    :goto_1
    or-int/2addr v2, v3

    const/4 v3, 0x2

    if-le p2, v3, :cond_2

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    shl-int/lit8 v1, v1, 0x18

    ushr-int/lit8 v1, v1, 0x18

    :cond_2
    or-int/2addr v1, v2

    .line 496
    .local v1, "inBuff":I
    const/16 v2, 0x3d

    packed-switch p2, :pswitch_data_0

    .line 519
    return-object p3

    .line 498
    :pswitch_0
    ushr-int/lit8 v2, v1, 0x12

    aget-byte v2, v0, v2

    aput-byte v2, p3, p4

    .line 499
    add-int/lit8 v2, p4, 0x1

    ushr-int/lit8 v3, v1, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 500
    add-int/lit8 v2, p4, 0x2

    ushr-int/lit8 v3, v1, 0x6

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 501
    add-int/lit8 v2, p4, 0x3

    and-int/lit8 v3, v1, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 502
    return-object p3

    .line 505
    :pswitch_1
    ushr-int/lit8 v3, v1, 0x12

    aget-byte v3, v0, v3

    aput-byte v3, p3, p4

    .line 506
    add-int/lit8 v3, p4, 0x1

    ushr-int/lit8 v4, v1, 0xc

    and-int/lit8 v4, v4, 0x3f

    aget-byte v4, v0, v4

    aput-byte v4, p3, v3

    .line 507
    add-int/lit8 v3, p4, 0x2

    ushr-int/lit8 v4, v1, 0x6

    and-int/lit8 v4, v4, 0x3f

    aget-byte v4, v0, v4

    aput-byte v4, p3, v3

    .line 508
    add-int/lit8 v3, p4, 0x3

    aput-byte v2, p3, v3

    .line 509
    return-object p3

    .line 512
    :pswitch_2
    ushr-int/lit8 v3, v1, 0x12

    aget-byte v3, v0, v3

    aput-byte v3, p3, p4

    .line 513
    add-int/lit8 v3, p4, 0x1

    ushr-int/lit8 v4, v1, 0xc

    and-int/lit8 v4, v4, 0x3f

    aget-byte v4, v0, v4

    aput-byte v4, p3, v3

    .line 514
    add-int/lit8 v3, p4, 0x2

    aput-byte v2, p3, v3

    .line 515
    add-int/lit8 v3, p4, 0x3

    aput-byte v2, p3, v3

    .line 516
    return-object p3

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static encode3to4([B[BII)[B
    .locals 6
    .param p0, "b4"    # [B
    .param p1, "threeBytes"    # [B
    .param p2, "numSigBytes"    # I
    .param p3, "options"    # I

    .line 447
    const/4 v1, 0x0

    const/4 v4, 0x0

    move-object v3, p0

    move-object v0, p1

    move v2, p2

    move v5, p3

    .end local p0    # "b4":[B
    .end local p1    # "threeBytes":[B
    .end local p2    # "numSigBytes":I
    .end local p3    # "options":I
    .local v0, "threeBytes":[B
    .local v2, "numSigBytes":I
    .local v3, "b4":[B
    .local v5, "options":I
    invoke-static/range {v0 .. v5}, Lcom/itextpdf/commons/utils/Base64;->encode3to4([BII[BII)[B

    .line 448
    return-object v3
.end method

.method public static encodeBytes([B)Ljava/lang/String;
    .locals 2
    .param p0, "source"    # [B

    .line 632
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, v0}, Lcom/itextpdf/commons/utils/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBytes([BI)Ljava/lang/String;
    .locals 2
    .param p0, "source"    # [B
    .param p1, "options"    # I

    .line 657
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, p1}, Lcom/itextpdf/commons/utils/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBytes([BII)Ljava/lang/String;
    .locals 1
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I

    .line 672
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/itextpdf/commons/utils/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBytes([BIII)Ljava/lang/String;
    .locals 18
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "options"    # I

    .line 701
    move/from16 v1, p1

    move/from16 v2, p2

    and-int/lit8 v3, p3, 0x8

    .line 702
    .local v3, "dontBreakLines":I
    and-int/lit8 v4, p3, 0x2

    .line 705
    .local v4, "gzip":I
    const-string v5, "UTF-8"

    const/4 v0, 0x2

    if-ne v4, v0, :cond_0

    .line 706
    const/4 v6, 0x0

    .line 707
    .local v6, "baos":Ljava/io/ByteArrayOutputStream;
    const/4 v7, 0x0

    .line 708
    .local v7, "gzos":Ljava/util/zip/GZIPOutputStream;
    const/4 v8, 0x0

    .line 713
    .local v8, "b64os":Lcom/itextpdf/commons/utils/Base64$OutputStream;
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move-object v6, v0

    .line 714
    new-instance v0, Lcom/itextpdf/commons/utils/Base64$OutputStream;

    or-int/lit8 v9, p3, 0x1

    invoke-direct {v0, v6, v9}, Lcom/itextpdf/commons/utils/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V

    move-object v8, v0

    .line 715
    new-instance v0, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v0, v8}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v7, v0

    .line 717
    move-object/from16 v9, p0

    :try_start_1
    invoke-virtual {v7, v9, v1, v2}, Ljava/util/zip/GZIPOutputStream;->write([BII)V

    .line 718
    invoke-virtual {v7}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 726
    :try_start_2
    invoke-virtual {v7}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 728
    goto :goto_0

    .line 727
    :catch_0
    move-exception v0

    .line 730
    :goto_0
    :try_start_3
    invoke-virtual {v8}, Lcom/itextpdf/commons/utils/Base64$OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 732
    goto :goto_1

    .line 731
    :catch_1
    move-exception v0

    .line 734
    :goto_1
    :try_start_4
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 736
    goto :goto_2

    .line 735
    :catch_2
    move-exception v0

    .line 737
    nop

    .line 741
    :goto_2
    :try_start_5
    new-instance v0, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v10

    invoke-direct {v0, v10, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_5 .. :try_end_5} :catch_3

    return-object v0

    .line 743
    :catch_3
    move-exception v0

    .line 744
    .local v0, "uue":Ljava/io/UnsupportedEncodingException;
    new-instance v5, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v10

    invoke-direct {v5, v10}, Ljava/lang/String;-><init>([B)V

    return-object v5

    .line 720
    .end local v0    # "uue":Ljava/io/UnsupportedEncodingException;
    :catch_4
    move-exception v0

    goto :goto_4

    .line 725
    :catchall_0
    move-exception v0

    move-object/from16 v9, p0

    :goto_3
    move-object v5, v0

    goto :goto_8

    .line 720
    :catch_5
    move-exception v0

    move-object/from16 v9, p0

    :goto_4
    move-object v5, v0

    .line 721
    .local v5, "e":Ljava/io/IOException;
    :try_start_6
    sget-object v0, Lcom/itextpdf/commons/utils/Base64;->LOGGER:Lorg/slf4j/Logger;

    const-string v10, "Exception during base64 encoding or decoding."

    invoke-interface {v0, v10, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 722
    nop

    .line 726
    :try_start_7
    invoke-virtual {v7}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    .line 728
    goto :goto_5

    .line 727
    :catch_6
    move-exception v0

    .line 730
    :goto_5
    :try_start_8
    invoke-virtual {v8}, Lcom/itextpdf/commons/utils/Base64$OutputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_7

    .line 732
    goto :goto_6

    .line 731
    :catch_7
    move-exception v0

    .line 734
    :goto_6
    :try_start_9
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_8

    .line 736
    goto :goto_7

    .line 735
    :catch_8
    move-exception v0

    .line 722
    :goto_7
    const/4 v0, 0x0

    return-object v0

    .line 725
    .end local v5    # "e":Ljava/io/IOException;
    :catchall_1
    move-exception v0

    goto :goto_3

    .line 726
    :goto_8
    :try_start_a
    invoke-virtual {v7}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_9

    .line 728
    goto :goto_9

    .line 727
    :catch_9
    move-exception v0

    .line 730
    :goto_9
    :try_start_b
    invoke-virtual {v8}, Lcom/itextpdf/commons/utils/Base64$OutputStream;->close()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_a

    .line 732
    goto :goto_a

    .line 731
    :catch_a
    move-exception v0

    .line 734
    :goto_a
    :try_start_c
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_b

    .line 736
    goto :goto_b

    .line 735
    :catch_b
    move-exception v0

    .line 737
    :goto_b
    throw v5

    .line 751
    .end local v6    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .end local v8    # "b64os":Lcom/itextpdf/commons/utils/Base64$OutputStream;
    :cond_0
    move-object/from16 v9, p0

    const/4 v6, 0x0

    if-nez v3, :cond_1

    const/4 v0, 0x1

    goto :goto_c

    :cond_1
    move v0, v6

    :goto_c
    move v7, v0

    .line 753
    .local v7, "breakLines":Z
    mul-int/lit8 v0, v2, 0x4

    div-int/lit8 v8, v0, 0x3

    .line 754
    .local v8, "len43":I
    rem-int/lit8 v0, v2, 0x3

    if-lez v0, :cond_2

    const/4 v0, 0x4

    goto :goto_d

    :cond_2
    move v0, v6

    :goto_d
    add-int/2addr v0, v8

    if-eqz v7, :cond_3

    div-int/lit8 v10, v8, 0x4c

    goto :goto_e

    :cond_3
    move v10, v6

    :goto_e
    add-int/2addr v0, v10

    new-array v12, v0, [B

    .line 757
    .local v12, "outBuff":[B
    const/4 v0, 0x0

    .line 758
    .local v0, "d":I
    const/4 v10, 0x0

    .line 759
    .local v10, "e":I
    add-int/lit8 v11, v2, -0x2

    .line 760
    .local v11, "len2":I
    const/4 v13, 0x0

    move/from16 v16, v13

    move v13, v10

    move v10, v0

    .line 761
    .end local v0    # "d":I
    .local v10, "d":I
    .local v13, "e":I
    .local v16, "lineLength":I
    :goto_f
    if-ge v10, v11, :cond_5

    .line 762
    move v14, v10

    .end local v10    # "d":I
    .local v14, "d":I
    add-int v10, v14, v1

    move/from16 v17, v11

    .end local v11    # "len2":I
    .local v17, "len2":I
    const/4 v11, 0x3

    move v15, v14

    const/4 v0, 0x4

    move/from16 v14, p3

    .end local v14    # "d":I
    .local v15, "d":I
    invoke-static/range {v9 .. v14}, Lcom/itextpdf/commons/utils/Base64;->encode3to4([BII[BII)[B

    .line 764
    add-int/lit8 v9, v16, 0x4

    .line 765
    .end local v16    # "lineLength":I
    .local v9, "lineLength":I
    if-eqz v7, :cond_4

    const/16 v10, 0x4c

    if-ne v9, v10, :cond_4

    .line 766
    add-int/lit8 v10, v13, 0x4

    const/16 v11, 0xa

    aput-byte v11, v12, v10

    .line 767
    add-int/lit8 v13, v13, 0x1

    .line 768
    const/4 v9, 0x0

    move/from16 v16, v9

    goto :goto_10

    .line 761
    :cond_4
    move/from16 v16, v9

    .end local v9    # "lineLength":I
    .restart local v16    # "lineLength":I
    :goto_10
    add-int/lit8 v10, v15, 0x3

    .end local v15    # "d":I
    .restart local v10    # "d":I
    add-int/2addr v13, v0

    move-object/from16 v9, p0

    move/from16 v11, v17

    goto :goto_f

    .line 772
    .end local v17    # "len2":I
    .restart local v11    # "len2":I
    :cond_5
    move v15, v10

    move/from16 v17, v11

    .end local v10    # "d":I
    .end local v11    # "len2":I
    .restart local v15    # "d":I
    .restart local v17    # "len2":I
    if-ge v15, v2, :cond_6

    .line 773
    add-int v10, v15, v1

    sub-int v11, v2, v15

    move-object/from16 v9, p0

    move/from16 v14, p3

    invoke-static/range {v9 .. v14}, Lcom/itextpdf/commons/utils/Base64;->encode3to4([BII[BII)[B

    .line 774
    add-int/lit8 v13, v13, 0x4

    .line 780
    :cond_6
    :try_start_d
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v12, v6, v13, v5}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_d .. :try_end_d} :catch_c

    return-object v0

    .line 782
    :catch_c
    move-exception v0

    .line 783
    .local v0, "uue":Ljava/io/UnsupportedEncodingException;
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v12, v6, v13}, Ljava/lang/String;-><init>([BII)V

    return-object v5
.end method

.method public static encodeFileToFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "infile"    # Ljava/lang/String;
    .param p1, "outfile"    # Ljava/lang/String;

    .line 1237
    invoke-static {p0}, Lcom/itextpdf/commons/utils/Base64;->encodeFromFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1238
    .local v0, "encoded":Ljava/lang/String;
    const/4 v1, 0x0

    .line 1240
    .local v1, "out":Ljava/io/OutputStream;
    :try_start_0
    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object v1, v2

    .line 1242
    const-string v2, "US-ASCII"

    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1249
    :try_start_1
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1251
    :goto_0
    goto :goto_1

    .line 1250
    :catch_0
    move-exception v2

    .line 1252
    goto :goto_1

    .line 1248
    :catchall_0
    move-exception v2

    goto :goto_2

    .line 1244
    :catch_1
    move-exception v2

    .line 1245
    .local v2, "ex":Ljava/io/IOException;
    :try_start_2
    sget-object v3, Lcom/itextpdf/commons/utils/Base64;->LOGGER:Lorg/slf4j/Logger;

    const-string v4, "Exception during base64 encoding or decoding."

    invoke-interface {v3, v4, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1249
    .end local v2    # "ex":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 1253
    :goto_1
    return-void

    .line 1249
    :goto_2
    :try_start_4
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 1251
    goto :goto_3

    .line 1250
    :catch_2
    move-exception v3

    .line 1252
    :goto_3
    throw v2
.end method

.method public static encodeFromFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "filename"    # Ljava/lang/String;

    .line 1194
    const/4 v0, 0x0

    .line 1195
    .local v0, "encodedData":Ljava/lang/String;
    const/4 v1, 0x0

    .line 1198
    .local v1, "bis":Lcom/itextpdf/commons/utils/Base64$InputStream;
    :try_start_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1199
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v3

    long-to-double v3, v3

    const-wide v5, 0x3ff6666666666666L    # 1.4

    mul-double/2addr v3, v5

    double-to-int v3, v3

    const/16 v4, 0x28

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    new-array v3, v3, [B

    .line 1200
    .local v3, "buffer":[B
    const/4 v4, 0x0

    .line 1201
    .local v4, "length":I
    const/4 v5, 0x0

    .line 1204
    .local v5, "numBytes":I
    new-instance v6, Lcom/itextpdf/commons/utils/Base64$InputStream;

    new-instance v7, Ljava/io/BufferedInputStream;

    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v7, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v8, 0x1

    invoke-direct {v6, v7, v8}, Lcom/itextpdf/commons/utils/Base64$InputStream;-><init>(Ljava/io/InputStream;I)V

    move-object v1, v6

    .line 1209
    :goto_0
    const/16 v6, 0x1000

    invoke-virtual {v1, v3, v4, v6}, Lcom/itextpdf/commons/utils/Base64$InputStream;->read([BII)I

    move-result v6

    move v5, v6

    if-ltz v6, :cond_0

    .line 1210
    add-int/2addr v4, v5

    goto :goto_0

    .line 1213
    :cond_0
    new-instance v6, Ljava/lang/String;

    const-string v7, "UTF-8"

    const/4 v8, 0x0

    invoke-direct {v6, v3, v8, v4, v7}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, v6

    .line 1221
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "buffer":[B
    .end local v4    # "length":I
    .end local v5    # "numBytes":I
    :try_start_1
    invoke-virtual {v1}, Lcom/itextpdf/commons/utils/Base64$InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1223
    :goto_1
    goto :goto_2

    .line 1222
    :catch_0
    move-exception v2

    .line 1224
    goto :goto_2

    .line 1220
    :catchall_0
    move-exception v2

    goto :goto_3

    .line 1216
    :catch_1
    move-exception v2

    .line 1217
    .local v2, "e":Ljava/io/IOException;
    :try_start_2
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error encoding from file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1221
    .end local v2    # "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v1}, Lcom/itextpdf/commons/utils/Base64$InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1

    .line 1226
    :goto_2
    return-object v0

    .line 1221
    :goto_3
    :try_start_4
    invoke-virtual {v1}, Lcom/itextpdf/commons/utils/Base64$InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 1223
    goto :goto_4

    .line 1222
    :catch_2
    move-exception v3

    .line 1224
    :goto_4
    throw v2
.end method

.method public static encodeObject(Ljava/io/Serializable;)Ljava/lang/String;
    .locals 1
    .param p0, "serializableObject"    # Ljava/io/Serializable;

    .line 536
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/commons/utils/Base64;->encodeObject(Ljava/io/Serializable;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeObject(Ljava/io/Serializable;I)Ljava/lang/String;
    .locals 9
    .param p0, "serializableObject"    # Ljava/io/Serializable;
    .param p1, "options"    # I

    .line 565
    const/4 v0, 0x0

    .line 566
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    .line 567
    .local v1, "b64os":Ljava/io/OutputStream;
    const/4 v2, 0x0

    .line 568
    .local v2, "oos":Ljava/io/ObjectOutputStream;
    const/4 v3, 0x0

    .line 571
    .local v3, "gzos":Ljava/util/zip/GZIPOutputStream;
    and-int/lit8 v4, p1, 0x2

    .line 572
    .local v4, "gzip":I
    and-int/lit8 v5, p1, 0x8

    .line 576
    .local v5, "dontBreakLines":I
    :try_start_0
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move-object v0, v6

    .line 577
    new-instance v6, Lcom/itextpdf/commons/utils/Base64$OutputStream;

    or-int/lit8 v7, p1, 0x1

    invoke-direct {v6, v0, v7}, Lcom/itextpdf/commons/utils/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V

    move-object v1, v6

    .line 580
    const/4 v6, 0x2

    if-ne v4, v6, :cond_0

    .line 581
    new-instance v6, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v6, v1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object v3, v6

    .line 582
    new-instance v6, Ljava/io/ObjectOutputStream;

    invoke-direct {v6, v3}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object v2, v6

    .end local v2    # "oos":Ljava/io/ObjectOutputStream;
    .local v6, "oos":Ljava/io/ObjectOutputStream;
    goto :goto_0

    .line 585
    .end local v6    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v2    # "oos":Ljava/io/ObjectOutputStream;
    :cond_0
    new-instance v6, Ljava/io/ObjectOutputStream;

    invoke-direct {v6, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .end local v2    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v6    # "oos":Ljava/io/ObjectOutputStream;
    move-object v2, v6

    .line 587
    .end local v6    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v2    # "oos":Ljava/io/ObjectOutputStream;
    :goto_0
    invoke-virtual {v2, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 595
    :try_start_1
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 597
    goto :goto_1

    .line 596
    :catch_0
    move-exception v6

    .line 599
    :goto_1
    :try_start_2
    invoke-virtual {v3}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 601
    goto :goto_2

    .line 600
    :catch_1
    move-exception v6

    .line 603
    :goto_2
    :try_start_3
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 605
    goto :goto_3

    .line 604
    :catch_2
    move-exception v6

    .line 607
    :goto_3
    :try_start_4
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 609
    goto :goto_4

    .line 608
    :catch_3
    move-exception v6

    .line 610
    nop

    .line 614
    :goto_4
    :try_start_5
    new-instance v6, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    const-string v8, "UTF-8"

    invoke-direct {v6, v7, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_5 .. :try_end_5} :catch_4

    return-object v6

    .line 616
    :catch_4
    move-exception v6

    .line 617
    .local v6, "uue":Ljava/io/UnsupportedEncodingException;
    new-instance v7, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/String;-><init>([B)V

    return-object v7

    .line 594
    .end local v6    # "uue":Ljava/io/UnsupportedEncodingException;
    :catchall_0
    move-exception v6

    goto :goto_9

    .line 589
    :catch_5
    move-exception v6

    .line 590
    .local v6, "e":Ljava/io/IOException;
    :try_start_6
    sget-object v7, Lcom/itextpdf/commons/utils/Base64;->LOGGER:Lorg/slf4j/Logger;

    const-string v8, "Exception during base64 encoding or decoding."

    invoke-interface {v7, v8, v6}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 591
    nop

    .line 595
    :try_start_7
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    .line 597
    goto :goto_5

    .line 596
    :catch_6
    move-exception v7

    .line 599
    :goto_5
    :try_start_8
    invoke-virtual {v3}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_7

    .line 601
    goto :goto_6

    .line 600
    :catch_7
    move-exception v7

    .line 603
    :goto_6
    :try_start_9
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_8

    .line 605
    goto :goto_7

    .line 604
    :catch_8
    move-exception v7

    .line 607
    :goto_7
    :try_start_a
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_9

    .line 609
    goto :goto_8

    .line 608
    :catch_9
    move-exception v7

    .line 591
    :goto_8
    const/4 v7, 0x0

    return-object v7

    .line 595
    .end local v6    # "e":Ljava/io/IOException;
    :goto_9
    :try_start_b
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_a

    .line 597
    goto :goto_a

    .line 596
    :catch_a
    move-exception v7

    .line 599
    :goto_a
    :try_start_c
    invoke-virtual {v3}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_b

    .line 601
    goto :goto_b

    .line 600
    :catch_b
    move-exception v7

    .line 603
    :goto_b
    :try_start_d
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_c

    .line 605
    goto :goto_c

    .line 604
    :catch_c
    move-exception v7

    .line 607
    :goto_c
    :try_start_e
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_d

    .line 609
    goto :goto_d

    .line 608
    :catch_d
    move-exception v7

    .line 610
    :goto_d
    throw v6
.end method

.method public static encodeToFile([BLjava/lang/String;)Z
    .locals 5
    .param p0, "dataToEncode"    # [B
    .param p1, "filename"    # Ljava/lang/String;

    .line 1076
    const/4 v0, 0x0

    .line 1077
    .local v0, "success":Z
    const/4 v1, 0x0

    .line 1079
    .local v1, "bos":Lcom/itextpdf/commons/utils/Base64$OutputStream;
    :try_start_0
    new-instance v2, Lcom/itextpdf/commons/utils/Base64$OutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/commons/utils/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V

    move-object v1, v2

    .line 1081
    invoke-virtual {v1, p0}, Lcom/itextpdf/commons/utils/Base64$OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1082
    const/4 v0, 0x1

    .line 1090
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Lcom/itextpdf/commons/utils/Base64$OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1092
    goto :goto_2

    .line 1091
    :catch_0
    move-exception v2

    .line 1093
    goto :goto_2

    .line 1089
    :catchall_0
    move-exception v2

    .line 1090
    :try_start_2
    invoke-virtual {v1}, Lcom/itextpdf/commons/utils/Base64$OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 1092
    goto :goto_1

    .line 1091
    :catch_1
    move-exception v3

    .line 1093
    :goto_1
    throw v2

    .line 1084
    :catch_2
    move-exception v2

    .line 1086
    .local v2, "e":Ljava/io/IOException;
    const/4 v0, 0x0

    goto :goto_0

    .line 1095
    .end local v2    # "e":Ljava/io/IOException;
    :goto_2
    return v0
.end method

.method private static getAlphabet(I)[B
    .locals 2
    .param p0, "options"    # I

    .line 363
    and-int/lit8 v0, p0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/itextpdf/commons/utils/Base64;->_URL_SAFE_ALPHABET:[B

    return-object v0

    .line 364
    :cond_0
    and-int/lit8 v0, p0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_1

    sget-object v0, Lcom/itextpdf/commons/utils/Base64;->_ORDERED_ALPHABET:[B

    return-object v0

    .line 365
    :cond_1
    sget-object v0, Lcom/itextpdf/commons/utils/Base64;->_STANDARD_ALPHABET:[B

    return-object v0
.end method

.method private static getDecodabet(I)[B
    .locals 2
    .param p0, "options"    # I

    .line 378
    and-int/lit8 v0, p0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/itextpdf/commons/utils/Base64;->_URL_SAFE_DECODABET:[B

    return-object v0

    .line 379
    :cond_0
    and-int/lit8 v0, p0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_1

    sget-object v0, Lcom/itextpdf/commons/utils/Base64;->_ORDERED_DECODABET:[B

    return-object v0

    .line 380
    :cond_1
    sget-object v0, Lcom/itextpdf/commons/utils/Base64;->_STANDARD_DECODABET:[B

    return-object v0
.end method

.method private static usage(Ljava/lang/String;)V
    .locals 2
    .param p0, "msg"    # Ljava/lang/String;

    .line 423
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 424
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "Usage: java Base64 -e|-d inputfile outputfile"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 425
    return-void
.end method
