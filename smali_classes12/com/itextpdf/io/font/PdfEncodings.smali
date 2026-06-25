.class public Lcom/itextpdf/io/font/PdfEncodings;
.super Ljava/lang/Object;
.source "PdfEncodings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/font/PdfEncodings$SymbolTTConversion;,
        Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;,
        Lcom/itextpdf/io/font/PdfEncodings$Cp437Conversion;,
        Lcom/itextpdf/io/font/PdfEncodings$WingdingsConversion;
    }
.end annotation


# static fields
.field public static final CP1250:Ljava/lang/String; = "Cp1250"

.field public static final CP1252:Ljava/lang/String; = "Cp1252"

.field public static final CP1253:Ljava/lang/String; = "Cp1253"

.field public static final CP1257:Ljava/lang/String; = "Cp1257"

.field private static final EMPTY_STRING:Ljava/lang/String; = ""

.field public static final IDENTITY_H:Ljava/lang/String; = "Identity-H"

.field public static final IDENTITY_V:Ljava/lang/String; = "Identity-V"

.field public static final MACROMAN:Ljava/lang/String; = "MacRoman"

.field public static final PDF_DOC_ENCODING:Ljava/lang/String; = "PDF"

.field public static final SYMBOL:Ljava/lang/String; = "Symbol"

.field public static final UNICODE_BIG:Ljava/lang/String; = "UnicodeBig"

.field public static final UNICODE_BIG_UNMARKED:Ljava/lang/String; = "UnicodeBigUnmarked"

.field public static final UTF8:Ljava/lang/String; = "UTF-8"

.field public static final WINANSI:Ljava/lang/String; = "Cp1252"

.field public static final ZAPFDINGBATS:Ljava/lang/String; = "ZapfDingbats"

.field private static final extraEncodings:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/itextpdf/io/font/IExtraEncoding;",
            ">;"
        }
    .end annotation
.end field

.field private static final pdfEncoding:Lcom/itextpdf/io/util/IntHashtable;

.field private static final pdfEncodingByteToChar:[C

.field static final standardEncoding:[I

.field private static final winansi:Lcom/itextpdf/io/util/IntHashtable;

.field private static final winansiByteToChar:[C


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 69
    const/16 v0, 0x100

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/io/font/PdfEncodings;->winansiByteToChar:[C

    .line 88
    const/16 v0, 0x100

    new-array v0, v0, [C

    fill-array-data v0, :array_1

    sput-object v0, Lcom/itextpdf/io/font/PdfEncodings;->pdfEncodingByteToChar:[C

    .line 106
    const/16 v0, 0x100

    new-array v0, v0, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/itextpdf/io/font/PdfEncodings;->standardEncoding:[I

    .line 125
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    invoke-direct {v0}, Lcom/itextpdf/io/util/IntHashtable;-><init>()V

    sput-object v0, Lcom/itextpdf/io/font/PdfEncodings;->winansi:Lcom/itextpdf/io/util/IntHashtable;

    .line 127
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    invoke-direct {v0}, Lcom/itextpdf/io/util/IntHashtable;-><init>()V

    sput-object v0, Lcom/itextpdf/io/font/PdfEncodings;->pdfEncoding:Lcom/itextpdf/io/util/IntHashtable;

    .line 129
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/io/font/PdfEncodings;->extraEncodings:Ljava/util/Map;

    .line 132
    const/16 v0, 0x80

    .local v0, "k":I
    :goto_0
    const v1, 0xfffd

    const/16 v2, 0xa1

    if-ge v0, v2, :cond_1

    .line 133
    sget-object v2, Lcom/itextpdf/io/font/PdfEncodings;->winansiByteToChar:[C

    aget-char v2, v2, v0

    .line 134
    .local v2, "c":C
    if-eq v2, v1, :cond_0

    .line 135
    sget-object v1, Lcom/itextpdf/io/font/PdfEncodings;->winansi:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 132
    .end local v2    # "c":C
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 138
    .end local v0    # "k":I
    :cond_1
    const/16 v0, 0x80

    .restart local v0    # "k":I
    :goto_1
    if-ge v0, v2, :cond_3

    .line 139
    sget-object v3, Lcom/itextpdf/io/font/PdfEncodings;->pdfEncodingByteToChar:[C

    aget-char v3, v3, v0

    .line 140
    .local v3, "c":C
    if-eq v3, v1, :cond_2

    .line 141
    sget-object v4, Lcom/itextpdf/io/font/PdfEncodings;->pdfEncoding:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v4, v3, v0}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 138
    .end local v3    # "c":C
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 145
    .end local v0    # "k":I
    :cond_3
    new-instance v0, Lcom/itextpdf/io/font/PdfEncodings$WingdingsConversion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings$WingdingsConversion;-><init>(Lcom/itextpdf/io/font/PdfEncodings$1;)V

    const-string v1, "Wingdings"

    invoke-static {v1, v0}, Lcom/itextpdf/io/font/PdfEncodings;->addExtraEncoding(Ljava/lang/String;Lcom/itextpdf/io/font/IExtraEncoding;)V

    .line 146
    new-instance v0, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;-><init>(Z)V

    const-string v1, "Symbol"

    invoke-static {v1, v0}, Lcom/itextpdf/io/font/PdfEncodings;->addExtraEncoding(Ljava/lang/String;Lcom/itextpdf/io/font/IExtraEncoding;)V

    .line 147
    new-instance v0, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;-><init>(Z)V

    const-string v1, "ZapfDingbats"

    invoke-static {v1, v0}, Lcom/itextpdf/io/font/PdfEncodings;->addExtraEncoding(Ljava/lang/String;Lcom/itextpdf/io/font/IExtraEncoding;)V

    .line 148
    new-instance v0, Lcom/itextpdf/io/font/PdfEncodings$SymbolTTConversion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings$SymbolTTConversion;-><init>(Lcom/itextpdf/io/font/PdfEncodings$1;)V

    const-string v1, "SymbolTT"

    invoke-static {v1, v0}, Lcom/itextpdf/io/font/PdfEncodings;->addExtraEncoding(Ljava/lang/String;Lcom/itextpdf/io/font/IExtraEncoding;)V

    .line 149
    new-instance v0, Lcom/itextpdf/io/font/PdfEncodings$Cp437Conversion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings$Cp437Conversion;-><init>(Lcom/itextpdf/io/font/PdfEncodings$1;)V

    const-string v1, "Cp437"

    invoke-static {v1, v0}, Lcom/itextpdf/io/font/PdfEncodings;->addExtraEncoding(Ljava/lang/String;Lcom/itextpdf/io/font/IExtraEncoding;)V

    .line 150
    return-void

    nop

    :array_0
    .array-data 2
        0x0s
        0x1s
        0x2s
        0x3s
        0x4s
        0x5s
        0x6s
        0x7s
        0x8s
        0x9s
        0xas
        0xbs
        0xcs
        0xds
        0xes
        0xfs
        0x10s
        0x11s
        0x12s
        0x13s
        0x14s
        0x15s
        0x16s
        0x17s
        0x18s
        0x19s
        0x1as
        0x1bs
        0x1cs
        0x1ds
        0x1es
        0x1fs
        0x20s
        0x21s
        0x22s
        0x23s
        0x24s
        0x25s
        0x26s
        0x27s
        0x28s
        0x29s
        0x2as
        0x2bs
        0x2cs
        0x2ds
        0x2es
        0x2fs
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x3as
        0x3bs
        0x3cs
        0x3ds
        0x3es
        0x3fs
        0x40s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
        0x5bs
        0x5cs
        0x5ds
        0x5es
        0x5fs
        0x60s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
        0x7bs
        0x7cs
        0x7ds
        0x7es
        0x7fs
        0x20acs
        -0x3s
        0x201as
        0x192s
        0x201es
        0x2026s
        0x2020s
        0x2021s
        0x2c6s
        0x2030s
        0x160s
        0x2039s
        0x152s
        -0x3s
        0x17ds
        -0x3s
        -0x3s
        0x2018s
        0x2019s
        0x201cs
        0x201ds
        0x2022s
        0x2013s
        0x2014s
        0x2dcs
        0x2122s
        0x161s
        0x203as
        0x153s
        -0x3s
        0x17es
        0x178s
        0xa0s
        0xa1s
        0xa2s
        0xa3s
        0xa4s
        0xa5s
        0xa6s
        0xa7s
        0xa8s
        0xa9s
        0xaas
        0xabs
        0xacs
        0xads
        0xaes
        0xafs
        0xb0s
        0xb1s
        0xb2s
        0xb3s
        0xb4s
        0xb5s
        0xb6s
        0xb7s
        0xb8s
        0xb9s
        0xbas
        0xbbs
        0xbcs
        0xbds
        0xbes
        0xbfs
        0xc0s
        0xc1s
        0xc2s
        0xc3s
        0xc4s
        0xc5s
        0xc6s
        0xc7s
        0xc8s
        0xc9s
        0xcas
        0xcbs
        0xccs
        0xcds
        0xces
        0xcfs
        0xd0s
        0xd1s
        0xd2s
        0xd3s
        0xd4s
        0xd5s
        0xd6s
        0xd7s
        0xd8s
        0xd9s
        0xdas
        0xdbs
        0xdcs
        0xdds
        0xdes
        0xdfs
        0xe0s
        0xe1s
        0xe2s
        0xe3s
        0xe4s
        0xe5s
        0xe6s
        0xe7s
        0xe8s
        0xe9s
        0xeas
        0xebs
        0xecs
        0xeds
        0xees
        0xefs
        0xf0s
        0xf1s
        0xf2s
        0xf3s
        0xf4s
        0xf5s
        0xf6s
        0xf7s
        0xf8s
        0xf9s
        0xfas
        0xfbs
        0xfcs
        0xfds
        0xfes
        0xffs
    .end array-data

    :array_1
    .array-data 2
        0x0s
        0x1s
        0x2s
        0x3s
        0x4s
        0x5s
        0x6s
        0x7s
        0x8s
        0x9s
        0xas
        0xbs
        0xcs
        0xds
        0xes
        0xfs
        0x10s
        0x11s
        0x12s
        0x13s
        0x14s
        0x15s
        0x16s
        0x17s
        0x18s
        0x19s
        0x1as
        0x1bs
        0x1cs
        0x1ds
        0x1es
        0x1fs
        0x20s
        0x21s
        0x22s
        0x23s
        0x24s
        0x25s
        0x26s
        0x27s
        0x28s
        0x29s
        0x2as
        0x2bs
        0x2cs
        0x2ds
        0x2es
        0x2fs
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x3as
        0x3bs
        0x3cs
        0x3ds
        0x3es
        0x3fs
        0x40s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
        0x5bs
        0x5cs
        0x5ds
        0x5es
        0x5fs
        0x60s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
        0x7bs
        0x7cs
        0x7ds
        0x7es
        0x7fs
        0x2022s
        0x2020s
        0x2021s
        0x2026s
        0x2014s
        0x2013s
        0x192s
        0x2044s
        0x2039s
        0x203as
        0x2212s
        0x2030s
        0x201es
        0x201cs
        0x201ds
        0x2018s
        0x2019s
        0x201as
        0x2122s
        -0x4ffs
        -0x4fes
        0x141s
        0x152s
        0x160s
        0x178s
        0x17ds
        0x131s
        0x142s
        0x153s
        0x161s
        0x17es
        -0x3s
        0x20acs
        0xa1s
        0xa2s
        0xa3s
        0xa4s
        0xa5s
        0xa6s
        0xa7s
        0xa8s
        0xa9s
        0xaas
        0xabs
        0xacs
        0xads
        0xaes
        0xafs
        0xb0s
        0xb1s
        0xb2s
        0xb3s
        0xb4s
        0xb5s
        0xb6s
        0xb7s
        0xb8s
        0xb9s
        0xbas
        0xbbs
        0xbcs
        0xbds
        0xbes
        0xbfs
        0xc0s
        0xc1s
        0xc2s
        0xc3s
        0xc4s
        0xc5s
        0xc6s
        0xc7s
        0xc8s
        0xc9s
        0xcas
        0xcbs
        0xccs
        0xcds
        0xces
        0xcfs
        0xd0s
        0xd1s
        0xd2s
        0xd3s
        0xd4s
        0xd5s
        0xd6s
        0xd7s
        0xd8s
        0xd9s
        0xdas
        0xdbs
        0xdcs
        0xdds
        0xdes
        0xdfs
        0xe0s
        0xe1s
        0xe2s
        0xe3s
        0xe4s
        0xe5s
        0xe6s
        0xe7s
        0xe8s
        0xe9s
        0xeas
        0xebs
        0xecs
        0xeds
        0xees
        0xefs
        0xf0s
        0xf1s
        0xf2s
        0xf3s
        0xf4s
        0xf5s
        0xf6s
        0xf7s
        0xf8s
        0xf9s
        0xfas
        0xfbs
        0xfcs
        0xfds
        0xfes
        0xffs
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x20
        0x21
        0x22
        0x23
        0x24
        0x25
        0x26
        0x2019
        0x28
        0x29
        0x2a
        0x2b
        0x2c
        0x2d
        0x2e
        0x2f
        0x30
        0x31
        0x32
        0x33
        0x34
        0x35
        0x36
        0x37
        0x38
        0x39
        0x3a
        0x3b
        0x3c
        0x3d
        0x3e
        0x3f
        0x40
        0x41
        0x42
        0x43
        0x44
        0x45
        0x46
        0x47
        0x48
        0x49
        0x4a
        0x4b
        0x4c
        0x4d
        0x4e
        0x4f
        0x50
        0x51
        0x52
        0x53
        0x54
        0x55
        0x56
        0x57
        0x58
        0x59
        0x5a
        0x5b
        0x5c
        0x5d
        0x5e
        0x5f
        0x2018
        0x61
        0x62
        0x63
        0x64
        0x65
        0x66
        0x67
        0x68
        0x69
        0x6a
        0x6b
        0x6c
        0x6d
        0x6e
        0x6f
        0x70
        0x71
        0x72
        0x73
        0x74
        0x75
        0x76
        0x77
        0x78
        0x79
        0x7a
        0x7b
        0x7c
        0x7d
        0x7e
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0xa1
        0xa2
        0xa3
        0x2044
        0xa5
        0x192
        0xa7
        0xa4
        0x27
        0x201c
        0xab
        0x2039
        0x203a
        0xfb01
        0xfb02
        0x0
        0x2013
        0x2020
        0x2021
        0xb7
        0x0
        0xb6
        0x2022
        0x201a
        0x201e
        0x201d
        0xbb
        0x2026
        0x2030
        0x0
        0xbf
        0x0
        0x60
        0xb4
        0x2c6
        0x2dc
        0xaf
        0x2d8
        0x2d9
        0xa8
        0x0
        0x2da
        0xb8
        0x0
        0x2dd
        0x2db
        0x2c7
        0x2014
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0xc6
        0x0
        0xaa
        0x0
        0x0
        0x0
        0x0
        0x141
        0xd8
        0x152
        0xba
        0x0
        0x0
        0x0
        0x0
        0x0
        0xe6
        0x0
        0x0
        0x0
        0x131
        0x0
        0x0
        0x142
        0xf8
        0x153
        0xdf
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addExtraEncoding(Ljava/lang/String;Lcom/itextpdf/io/font/IExtraEncoding;)V
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "enc"    # Lcom/itextpdf/io/font/IExtraEncoding;

    .line 323
    sget-object v0, Lcom/itextpdf/io/font/PdfEncodings;->extraEncodings:Ljava/util/Map;

    monitor-enter v0

    .line 324
    :try_start_0
    sget-object v1, Lcom/itextpdf/io/font/PdfEncodings;->extraEncodings:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    monitor-exit v0

    .line 326
    return-void

    .line 325
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static convertToBytes(CLjava/lang/String;)[B
    .locals 5
    .param p0, "ch"    # C
    .param p1, "encoding"    # Ljava/lang/String;

    .line 222
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_7

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_7

    const-string/jumbo v2, "symboltt"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_3

    .line 226
    :cond_0
    const/4 v2, 0x0

    .line 227
    .local v2, "hash":Lcom/itextpdf/io/util/IntHashtable;
    const-string v3, "Cp1252"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 228
    sget-object v2, Lcom/itextpdf/io/font/PdfEncodings;->winansi:Lcom/itextpdf/io/util/IntHashtable;

    goto :goto_0

    .line 229
    :cond_1
    const-string v3, "PDF"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 230
    sget-object v2, Lcom/itextpdf/io/font/PdfEncodings;->pdfEncoding:Lcom/itextpdf/io/util/IntHashtable;

    .line 231
    :cond_2
    :goto_0
    if-eqz v2, :cond_6

    .line 233
    const/16 v3, 0x80

    if-lt p0, v3, :cond_4

    const/16 v3, 0xa0

    if-le p0, v3, :cond_3

    const/16 v3, 0xff

    if-gt p0, v3, :cond_3

    goto :goto_1

    .line 236
    :cond_3
    invoke-virtual {v2, p0}, Lcom/itextpdf/io/util/IntHashtable;->get(I)I

    move-result v3

    .local v3, "c":I
    goto :goto_2

    .line 234
    .end local v3    # "c":I
    :cond_4
    :goto_1
    move v3, p0

    .line 238
    .restart local v3    # "c":I
    :goto_2
    if-eqz v3, :cond_5

    .line 239
    int-to-byte v4, v3

    new-array v0, v0, [B

    aput-byte v4, v0, v1

    return-object v0

    .line 241
    :cond_5
    new-array v0, v1, [B

    return-object v0

    .line 245
    .end local v3    # "c":I
    :cond_6
    :try_start_0
    new-array v0, v0, [C

    aput-char p0, v0, v1

    invoke-static {v0, p1}, Lcom/itextpdf/commons/utils/EncodingUtil;->convertToBytes([CLjava/lang/String;)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 246
    :catch_0
    move-exception v0

    .line 247
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Character code exception."

    invoke-direct {v1, v3, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 223
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "hash":Lcom/itextpdf/io/util/IntHashtable;
    :cond_7
    :goto_3
    int-to-byte v2, p0

    new-array v0, v0, [B

    aput-byte v2, v0, v1

    return-object v0
.end method

.method public static convertToBytes(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 12
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;

    .line 161
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 162
    new-array v0, v0, [B

    return-object v0

    .line 163
    :cond_0
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    goto/16 :goto_4

    .line 171
    :cond_1
    sget-object v1, Lcom/itextpdf/io/font/PdfEncodings;->extraEncodings:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/io/font/IExtraEncoding;

    .line 172
    .local v1, "extra":Lcom/itextpdf/io/font/IExtraEncoding;
    if-eqz v1, :cond_2

    .line 173
    invoke-interface {v1, p0, p1}, Lcom/itextpdf/io/font/IExtraEncoding;->charToByte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v2

    .line 174
    .local v2, "b":[B
    if-eqz v2, :cond_2

    .line 175
    return-object v2

    .line 177
    .end local v2    # "b":[B
    :cond_2
    const/4 v2, 0x0

    .line 178
    .local v2, "hash":Lcom/itextpdf/io/util/IntHashtable;
    const-string v3, "Cp1252"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 179
    sget-object v2, Lcom/itextpdf/io/font/PdfEncodings;->winansi:Lcom/itextpdf/io/util/IntHashtable;

    goto :goto_0

    .line 180
    :cond_3
    const-string v3, "PDF"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 181
    sget-object v2, Lcom/itextpdf/io/font/PdfEncodings;->pdfEncoding:Lcom/itextpdf/io/util/IntHashtable;

    .line 183
    :cond_4
    :goto_0
    if-eqz v2, :cond_a

    .line 184
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    .line 185
    .local v3, "cc":[C
    array-length v4, v3

    .line 186
    .local v4, "len":I
    const/4 v5, 0x0

    .line 187
    .local v5, "ptr":I
    new-array v6, v4, [B

    .line 189
    .local v6, "b":[B
    const/4 v7, 0x0

    .local v7, "k":I
    :goto_1
    if-ge v7, v4, :cond_8

    .line 190
    aget-char v8, v3, v7

    .line 191
    .local v8, "ch":C
    const/16 v9, 0x80

    if-lt v8, v9, :cond_6

    const/16 v9, 0xa0

    if-le v8, v9, :cond_5

    const/16 v9, 0xff

    if-gt v8, v9, :cond_5

    goto :goto_2

    .line 194
    :cond_5
    invoke-virtual {v2, v8}, Lcom/itextpdf/io/util/IntHashtable;->get(I)I

    move-result v9

    .local v9, "c":I
    goto :goto_3

    .line 192
    .end local v9    # "c":I
    :cond_6
    :goto_2
    move v9, v8

    .line 196
    .restart local v9    # "c":I
    :goto_3
    if-eqz v9, :cond_7

    .line 197
    add-int/lit8 v10, v5, 0x1

    .end local v5    # "ptr":I
    .local v10, "ptr":I
    int-to-byte v11, v9

    aput-byte v11, v6, v5

    move v5, v10

    .line 189
    .end local v8    # "ch":C
    .end local v10    # "ptr":I
    .restart local v5    # "ptr":I
    :cond_7
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 200
    .end local v7    # "k":I
    .end local v9    # "c":I
    :cond_8
    if-ne v5, v4, :cond_9

    .line 201
    return-object v6

    .line 202
    :cond_9
    new-array v7, v5, [B

    .line 203
    .local v7, "b2":[B
    invoke-static {v6, v0, v7, v0, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 204
    return-object v7

    .line 207
    .end local v3    # "cc":[C
    .end local v4    # "len":I
    .end local v5    # "ptr":I
    .end local v6    # "b":[B
    .end local v7    # "b2":[B
    :cond_a
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-static {v0, p1}, Lcom/itextpdf/commons/utils/EncodingUtil;->convertToBytes([CLjava/lang/String;)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 208
    :catch_0
    move-exception v0

    .line 209
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "Character code exception."

    invoke-direct {v3, v4, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 164
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "extra":Lcom/itextpdf/io/font/IExtraEncoding;
    .end local v2    # "hash":Lcom/itextpdf/io/util/IntHashtable;
    :cond_b
    :goto_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 165
    .local v0, "len":I
    new-array v1, v0, [B

    .line 166
    .local v1, "b":[B
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_5
    if-ge v2, v0, :cond_c

    .line 167
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 166
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 169
    .end local v2    # "k":I
    :cond_c
    return-object v1
.end method

.method public static convertToString([BLjava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "bytes"    # [B
    .param p1, "encoding"    # Ljava/lang/String;

    .line 260
    if-nez p0, :cond_0

    .line 261
    const-string v0, ""

    return-object v0

    .line 262
    :cond_0
    if-eqz p1, :cond_7

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    goto :goto_2

    .line 269
    :cond_1
    sget-object v0, Lcom/itextpdf/io/font/PdfEncodings;->extraEncodings:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/IExtraEncoding;

    .line 270
    .local v0, "extra":Lcom/itextpdf/io/font/IExtraEncoding;
    if-eqz v0, :cond_2

    .line 271
    invoke-interface {v0, p0, p1}, Lcom/itextpdf/io/font/IExtraEncoding;->byteToChar([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 272
    .local v1, "text":Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 273
    return-object v1

    .line 276
    .end local v1    # "text":Ljava/lang/String;
    :cond_2
    const/4 v1, 0x0

    .line 277
    .local v1, "ch":[C
    const-string v2, "Cp1252"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 278
    sget-object v1, Lcom/itextpdf/io/font/PdfEncodings;->winansiByteToChar:[C

    goto :goto_0

    .line 279
    :cond_3
    const-string v2, "PDF"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 280
    sget-object v1, Lcom/itextpdf/io/font/PdfEncodings;->pdfEncodingByteToChar:[C

    .line 281
    :cond_4
    :goto_0
    if-eqz v1, :cond_6

    .line 282
    array-length v2, p0

    .line 283
    .local v2, "len":I
    new-array v3, v2, [C

    .line 284
    .local v3, "c":[C
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_1
    if-ge v4, v2, :cond_5

    .line 285
    aget-byte v5, p0, v4

    and-int/lit16 v5, v5, 0xff

    aget-char v5, v1, v5

    aput-char v5, v3, v4

    .line 284
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 287
    .end local v4    # "k":I
    :cond_5
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v3}, Ljava/lang/String;-><init>([C)V

    return-object v4

    .line 290
    .end local v2    # "len":I
    .end local v3    # "c":[C
    :cond_6
    :try_start_0
    invoke-static {p0, p1}, Lcom/itextpdf/commons/utils/EncodingUtil;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 291
    :catch_0
    move-exception v2

    .line 292
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "Unsupported encoding exception."

    invoke-direct {v3, v4, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 263
    .end local v0    # "extra":Lcom/itextpdf/io/font/IExtraEncoding;
    .end local v1    # "ch":[C
    .end local v2    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_7
    :goto_2
    array-length v0, p0

    new-array v0, v0, [C

    .line 264
    .local v0, "c":[C
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_3
    array-length v2, p0

    if-ge v1, v2, :cond_8

    .line 265
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    int-to-char v2, v2

    aput-char v2, v0, v1

    .line 264
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 267
    .end local v1    # "k":I
    :cond_8
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    return-object v1
.end method

.method public static isPdfDocEncoding(Ljava/lang/String;)Z
    .locals 5
    .param p0, "text"    # Ljava/lang/String;

    .line 303
    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 304
    return v0

    .line 305
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 306
    .local v1, "len":I
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    if-ge v2, v1, :cond_3

    .line 307
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 308
    .local v3, "ch":C
    const/16 v4, 0x80

    if-lt v3, v4, :cond_2

    const/16 v4, 0xa0

    if-le v3, v4, :cond_1

    const/16 v4, 0xff

    if-gt v3, v4, :cond_1

    .line 309
    goto :goto_1

    .line 310
    :cond_1
    sget-object v4, Lcom/itextpdf/io/font/PdfEncodings;->pdfEncoding:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v4, v3}, Lcom/itextpdf/io/util/IntHashtable;->containsKey(I)Z

    move-result v4

    if-nez v4, :cond_2

    .line 311
    const/4 v0, 0x0

    return v0

    .line 306
    .end local v3    # "ch":C
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 313
    .end local v2    # "k":I
    :cond_3
    return v0
.end method
