.class public Lcom/itextpdf/io/codec/TIFFFaxDecompressor;
.super Ljava/lang/Object;
.source "TIFFFaxDecompressor.java"


# static fields
.field public static additionalMakeup:[S

.field static black:[S

.field static flipTable:[B

.field static initBlack:[S

.field static table1:[I

.field static table2:[I

.field static twoBitBlack:[S

.field static twoDCodes:[B

.field static white:[S


# instance fields
.field private bitPointer:I

.field private bitsPerScanline:I

.field private buffer:[B

.field private bytePointer:I

.field private changingElemSize:I

.field protected compression:I

.field private currChangingElems:[I

.field private data:[B

.field public fails:I

.field protected fillBits:I

.field protected fillOrder:I

.field private h:I

.field private lastChangingElement:I

.field private lineBitNum:I

.field private final lock:Ljava/lang/Object;

.field protected oneD:I

.field private prevChangingElems:[I

.field private t4Options:I

.field private t6Options:I

.field protected uncompressedMode:I

.field private w:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 98
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->table1:[I

    .line 109
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->table2:[I

    .line 121
    const/16 v0, 0x100

    new-array v0, v0, [B

    fill-array-data v0, :array_2

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->flipTable:[B

    .line 156
    const/16 v0, 0x400

    new-array v0, v0, [S

    fill-array-data v0, :array_3

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->white:[S

    .line 421
    const/16 v0, 0x10

    new-array v0, v0, [S

    fill-array-data v0, :array_4

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->additionalMakeup:[S

    .line 429
    const/16 v0, 0x10

    new-array v0, v0, [S

    fill-array-data v0, :array_5

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->initBlack:[S

    .line 436
    const/4 v0, 0x4

    new-array v0, v0, [S

    fill-array-data v0, :array_6

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->twoBitBlack:[S

    .line 438
    const/16 v0, 0x200

    new-array v0, v0, [S

    fill-array-data v0, :array_7

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->black:[S

    .line 567
    const/16 v0, 0x80

    new-array v0, v0, [B

    fill-array-data v0, :array_8

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->twoDCodes:[B

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x1
        0x3
        0x7
        0xf
        0x1f
        0x3f
        0x7f
        0xff
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x80
        0xc0
        0xe0
        0xf0
        0xf8
        0xfc
        0xfe
        0xff
    .end array-data

    :array_2
    .array-data 1
        0x0t
        -0x80t
        0x40t
        -0x40t
        0x20t
        -0x60t
        0x60t
        -0x20t
        0x10t
        -0x70t
        0x50t
        -0x30t
        0x30t
        -0x50t
        0x70t
        -0x10t
        0x8t
        -0x78t
        0x48t
        -0x38t
        0x28t
        -0x58t
        0x68t
        -0x18t
        0x18t
        -0x68t
        0x58t
        -0x28t
        0x38t
        -0x48t
        0x78t
        -0x8t
        0x4t
        -0x7ct
        0x44t
        -0x3ct
        0x24t
        -0x5ct
        0x64t
        -0x1ct
        0x14t
        -0x6ct
        0x54t
        -0x2ct
        0x34t
        -0x4ct
        0x74t
        -0xct
        0xct
        -0x74t
        0x4ct
        -0x34t
        0x2ct
        -0x54t
        0x6ct
        -0x14t
        0x1ct
        -0x64t
        0x5ct
        -0x24t
        0x3ct
        -0x44t
        0x7ct
        -0x4t
        0x2t
        -0x7et
        0x42t
        -0x3et
        0x22t
        -0x5et
        0x62t
        -0x1et
        0x12t
        -0x6et
        0x52t
        -0x2et
        0x32t
        -0x4et
        0x72t
        -0xet
        0xat
        -0x76t
        0x4at
        -0x36t
        0x2at
        -0x56t
        0x6at
        -0x16t
        0x1at
        -0x66t
        0x5at
        -0x26t
        0x3at
        -0x46t
        0x7at
        -0x6t
        0x6t
        -0x7at
        0x46t
        -0x3at
        0x26t
        -0x5at
        0x66t
        -0x1at
        0x16t
        -0x6at
        0x56t
        -0x2at
        0x36t
        -0x4at
        0x76t
        -0xat
        0xet
        -0x72t
        0x4et
        -0x32t
        0x2et
        -0x52t
        0x6et
        -0x12t
        0x1et
        -0x62t
        0x5et
        -0x22t
        0x3et
        -0x42t
        0x7et
        -0x2t
        0x1t
        -0x7ft
        0x41t
        -0x3ft
        0x21t
        -0x5ft
        0x61t
        -0x1ft
        0x11t
        -0x6ft
        0x51t
        -0x2ft
        0x31t
        -0x4ft
        0x71t
        -0xft
        0x9t
        -0x77t
        0x49t
        -0x37t
        0x29t
        -0x57t
        0x69t
        -0x17t
        0x19t
        -0x67t
        0x59t
        -0x27t
        0x39t
        -0x47t
        0x79t
        -0x7t
        0x5t
        -0x7bt
        0x45t
        -0x3bt
        0x25t
        -0x5bt
        0x65t
        -0x1bt
        0x15t
        -0x6bt
        0x55t
        -0x2bt
        0x35t
        -0x4bt
        0x75t
        -0xbt
        0xdt
        -0x73t
        0x4dt
        -0x33t
        0x2dt
        -0x53t
        0x6dt
        -0x13t
        0x1dt
        -0x63t
        0x5dt
        -0x23t
        0x3dt
        -0x43t
        0x7dt
        -0x3t
        0x3t
        -0x7dt
        0x43t
        -0x3dt
        0x23t
        -0x5dt
        0x63t
        -0x1dt
        0x13t
        -0x6dt
        0x53t
        -0x2dt
        0x33t
        -0x4dt
        0x73t
        -0xdt
        0xbt
        -0x75t
        0x4bt
        -0x35t
        0x2bt
        -0x55t
        0x6bt
        -0x15t
        0x1bt
        -0x65t
        0x5bt
        -0x25t
        0x3bt
        -0x45t
        0x7bt
        -0x5t
        0x7t
        -0x79t
        0x47t
        -0x39t
        0x27t
        -0x59t
        0x67t
        -0x19t
        0x17t
        -0x69t
        0x57t
        -0x29t
        0x37t
        -0x49t
        0x77t
        -0x9t
        0xft
        -0x71t
        0x4ft
        -0x31t
        0x2ft
        -0x51t
        0x6ft
        -0x11t
        0x1ft
        -0x61t
        0x5ft
        -0x21t
        0x3ft
        -0x41t
        0x7ft
        -0x1t
    .end array-data

    :array_3
    .array-data 2
        0x191es
        0x1900s
        0x1900s
        0x1900s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0x3b0s
        0x3b0s
        0x3b0s
        0x3b0s
        0x3d0s
        0x3d0s
        0x3d0s
        0x3d0s
        0x5b0s
        0x5b0s
        0x5b0s
        0x5b0s
        0x5d0s
        0x5d0s
        0x5d0s
        0x5d0s
        0x2ces
        0x2ces
        0x2ces
        0x2ces
        0x2ces
        0x2ces
        0x2ces
        0x2ces
        0x2ees
        0x2ees
        0x2ees
        0x2ees
        0x2ees
        0x2ees
        0x2ees
        0x2ees
        0x5f0s
        0x5f0s
        0x5f0s
        0x5f0s
        0x610s
        0x610s
        0x610s
        0x610s
        0x1acs
        0x1acs
        0x1acs
        0x1acs
        0x1acs
        0x1acs
        0x1acs
        0x1acs
        0x1acs
        0x1acs
        0x1acs
        0x1acs
        0x1acs
        0x1acs
        0x1acs
        0x1acs
        0x28es
        0x28es
        0x28es
        0x28es
        0x28es
        0x28es
        0x28es
        0x28es
        0x430s
        0x430s
        0x430s
        0x430s
        0x450s
        0x450s
        0x450s
        0x450s
        0x470s
        0x470s
        0x470s
        0x470s
        0x490s
        0x490s
        0x490s
        0x490s
        0x4b0s
        0x4b0s
        0x4b0s
        0x4b0s
        0x4d0s
        0x4d0s
        0x4d0s
        0x4d0s
        0x26es
        0x26es
        0x26es
        0x26es
        0x26es
        0x26es
        0x26es
        0x26es
        0x3f0s
        0x3f0s
        0x3f0s
        0x3f0s
        0x410s
        0x410s
        0x410s
        0x410s
        0x2cs
        0x2cs
        0x2cs
        0x2cs
        0x2cs
        0x2cs
        0x2cs
        0x2cs
        0x2cs
        0x2cs
        0x2cs
        0x2cs
        0x2cs
        0x2cs
        0x2cs
        0x2cs
        0x18cs
        0x18cs
        0x18cs
        0x18cs
        0x18cs
        0x18cs
        0x18cs
        0x18cs
        0x18cs
        0x18cs
        0x18cs
        0x18cs
        0x18cs
        0x18cs
        0x18cs
        0x18cs
        0x6b0s
        0x6b0s
        0x6b0s
        0x6b0s
        0x6d0s
        0x6d0s
        0x6d0s
        0x6d0s
        0x34es
        0x34es
        0x34es
        0x34es
        0x34es
        0x34es
        0x34es
        0x34es
        0x4f0s
        0x4f0s
        0x4f0s
        0x4f0s
        0x510s
        0x510s
        0x510s
        0x510s
        0x530s
        0x530s
        0x530s
        0x530s
        0x550s
        0x550s
        0x550s
        0x550s
        0x570s
        0x570s
        0x570s
        0x570s
        0x590s
        0x590s
        0x590s
        0x590s
        0x2aes
        0x2aes
        0x2aes
        0x2aes
        0x2aes
        0x2aes
        0x2aes
        0x2aes
        0x38es
        0x38es
        0x38es
        0x38es
        0x38es
        0x38es
        0x38es
        0x38es
        0x7b0s
        0x7b0s
        0x7b0s
        0x7b0s
        0x7d0s
        0x7d0s
        0x7d0s
        0x7d0s
        0x7f0s
        0x7f0s
        0x7f0s
        0x7f0s
        0x10s
        0x10s
        0x10s
        0x10s
        0x2811s
        0x2811s
        0x2811s
        0x2811s
        0x3011s
        0x3011s
        0x3011s
        0x3011s
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x14as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x16as
        0x36es
        0x36es
        0x36es
        0x36es
        0x36es
        0x36es
        0x36es
        0x36es
        0x770s
        0x770s
        0x770s
        0x770s
        0x790s
        0x790s
        0x790s
        0x790s
        -0x47eds
        -0x47eds
        -0x3feds
        -0x3feds
        -0x37eds
        -0x37eds
        -0x27eds
        -0x27eds
        0x24es
        0x24es
        0x24es
        0x24es
        0x24es
        0x24es
        0x24es
        0x24es
        0x30es
        0x30es
        0x30es
        0x30es
        0x30es
        0x30es
        0x30es
        0x30es
        0x630s
        0x630s
        0x630s
        0x630s
        0x650s
        0x650s
        0x650s
        0x650s
        0x670s
        0x670s
        0x670s
        0x670s
        0x690s
        0x690s
        0x690s
        0x690s
        0x32es
        0x32es
        0x32es
        0x32es
        0x32es
        0x32es
        0x32es
        0x32es
        0x6f0s
        0x6f0s
        0x6f0s
        0x6f0s
        0x710s
        0x710s
        0x710s
        0x710s
        0x730s
        0x730s
        0x730s
        0x730s
        0x750s
        0x750s
        0x750s
        0x750s
        0x180ds
        0x180ds
        0x180ds
        0x180ds
        0x180ds
        0x180ds
        0x180ds
        0x180ds
        0x180ds
        0x180ds
        0x180ds
        0x180ds
        0x180ds
        0x180ds
        0x180ds
        0x180ds
        -0x2ff3s
        -0x2ff3s
        -0x2ff3s
        -0x2ff3s
        -0x2ff3s
        -0x2ff3s
        -0x2ff3s
        -0x2ff3s
        -0x2ff3s
        -0x2ff3s
        -0x2ff3s
        -0x2ff3s
        -0x2ff3s
        -0x2ff3s
        -0x2ff3s
        -0x2ff3s
        0x3811s
        0x3811s
        0x3811s
        0x3811s
        0x4011s
        0x4011s
        0x4011s
        0x4011s
        0x5813s
        0x5813s
        0x6013s
        0x6013s
        0x5011s
        0x5011s
        0x5011s
        0x5011s
        0x4811s
        0x4811s
        0x4811s
        0x4811s
        0x6813s
        0x6813s
        0x7013s
        0x7013s
        0x7813s
        0x7813s
        -0x7feds
        -0x7feds
        -0x77eds
        -0x77eds
        -0x6feds
        -0x6feds
        -0x67eds
        -0x67eds
        -0x5feds
        -0x5feds
        -0x57eds
        -0x57eds
        -0x4feds
        -0x4feds
        0x200fs
        0x200fs
        0x200fs
        0x200fs
        0x200fs
        0x200fs
        0x200fs
        0x200fs
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x48s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x68s
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x100bs
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x10as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x12as
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0x88s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0xa8s
        0x1ccs
        0x1ccs
        0x1ccs
        0x1ccs
        0x1ccs
        0x1ccs
        0x1ccs
        0x1ccs
        0x1ccs
        0x1ccs
        0x1ccs
        0x1ccs
        0x1ccs
        0x1ccs
        0x1ccs
        0x1ccs
        0x1ecs
        0x1ecs
        0x1ecs
        0x1ecs
        0x1ecs
        0x1ecs
        0x1ecs
        0x1ecs
        0x1ecs
        0x1ecs
        0x1ecs
        0x1ecs
        0x1ecs
        0x1ecs
        0x1ecs
        0x1ecs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0x80bs
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xc8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
        0xe8s
    .end array-data

    :array_4
    .array-data 2
        0x7007s
        0x7007s
        0x7c08s
        -0x7ff7s
        -0x7bf7s
        -0x77f7s
        -0x73f7s
        -0x6ff7s
        0x7407s
        0x7407s
        0x7807s
        0x7807s
        -0x6bf7s
        -0x67f7s
        -0x63f7s
        -0x5ff7s
    .end array-data

    :array_5
    .array-data 2
        0xc9as
        0x190cs
        0xc8s
        0xa8s
        0x26s
        0x26s
        0x86s
        0x86s
        0x64s
        0x64s
        0x64s
        0x64s
        0x44s
        0x44s
        0x44s
        0x44s
    .end array-data

    :array_6
    .array-data 2
        0x124s
        0x104s
        0xe2s
        0xe2s
    .end array-data

    :array_7
    .array-data 2
        0x3es
        0x3es
        0x1es
        0x1es
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0xc99s
        0x24cs
        0x24cs
        0x24cs
        0x24cs
        0x24cs
        0x24cs
        0x24cs
        0x24cs
        0x690s
        0x690s
        0x5013s
        0x5813s
        0x6013s
        0x6813s
        0x6f0s
        0x6f0s
        0x710s
        0x710s
        -0x5feds
        -0x57eds
        -0x4feds
        -0x47eds
        0x770s
        0x770s
        0x790s
        0x790s
        -0x3feds
        -0x37eds
        0x30es
        0x30es
        0x30es
        0x30es
        0x32es
        0x32es
        0x32es
        0x32es
        -0x2feds
        -0x27eds
        0x2811s
        0x2811s
        0x3011s
        0x3011s
        0x3811s
        0x3811s
        0x4013s
        0x4813s
        0x6b0s
        0x6b0s
        0x6d0s
        0x6d0s
        0x7013s
        0x7813s
        -0x7feds
        -0x77eds
        -0x6feds
        -0x67eds
        0x80ds
        0x80ds
        0x80ds
        0x80ds
        0x80ds
        0x80ds
        0x80ds
        0x80ds
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x1a8s
        0x2ees
        0x2ees
        0x2ees
        0x2ees
        0x650s
        0x650s
        0x670s
        0x670s
        0x590s
        0x590s
        0x5b0s
        0x5b0s
        0x5d0s
        0x5d0s
        0x5f0s
        0x5f0s
        0x730s
        0x730s
        0x750s
        0x750s
        0x7b0s
        0x7b0s
        0x2011s
        0x2011s
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x20cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x22cs
        0x610s
        0x610s
        0x630s
        0x630s
        0x7d0s
        0x7d0s
        0x7f0s
        0x7f0s
        0x3d0s
        0x3d0s
        0x3f0s
        0x3f0s
        0x410s
        0x410s
        0x430s
        0x430s
        0x510s
        0x510s
        0x530s
        0x530s
        0x2ces
        0x2ces
        0x2ces
        0x2ces
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x1c8s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x146s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x166s
        0x1eas
        0x1eas
        0x1eas
        0x1eas
        0x1eas
        0x1eas
        0x1eas
        0x1eas
        0x1eas
        0x1eas
        0x1eas
        0x1eas
        0x1eas
        0x1eas
        0x1eas
        0x1eas
        0x1011s
        0x1011s
        0x1811s
        0x1811s
        0x350s
        0x350s
        0x370s
        0x370s
        0x390s
        0x390s
        0x3b0s
        0x3b0s
        0x26es
        0x26es
        0x26es
        0x26es
        0x28es
        0x28es
        0x28es
        0x28es
        0x450s
        0x450s
        0x470s
        0x470s
        0x490s
        0x490s
        0x4b0s
        0x4b0s
        0x4d0s
        0x4d0s
        0x4f0s
        0x4f0s
        0x2aes
        0x2aes
        0x2aes
        0x2aes
        0x550s
        0x550s
        0x570s
        0x570s
        0xcs
        0xcs
        0xcs
        0xcs
        0xcs
        0xcs
        0xcs
        0xcs
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
        0x186s
    .end array-data

    :array_8
    .array-data 1
        0x50t
        0x58t
        0x17t
        0x47t
        0x1et
        0x1et
        0x3et
        0x3et
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0xbt
        0x23t
        0x23t
        0x23t
        0x23t
        0x23t
        0x23t
        0x23t
        0x23t
        0x23t
        0x23t
        0x23t
        0x23t
        0x23t
        0x23t
        0x23t
        0x23t
        0x33t
        0x33t
        0x33t
        0x33t
        0x33t
        0x33t
        0x33t
        0x33t
        0x33t
        0x33t
        0x33t
        0x33t
        0x33t
        0x33t
        0x33t
        0x33t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
        0x29t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 601
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->uncompressedMode:I

    .line 77
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fillBits:I

    .line 90
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    .line 94
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lastChangingElement:I

    .line 96
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lock:Ljava/lang/Object;

    .line 602
    return-void
.end method

.method private decodeBlackCodeWord()I
    .locals 10

    .line 1292
    const/4 v0, -0x1

    .line 1293
    .local v0, "code":I
    const/4 v1, 0x0

    .line 1294
    .local v1, "runLength":I
    const/4 v2, 0x0

    .line 1296
    .local v2, "isWhite":Z
    :cond_0
    :goto_0
    if-nez v2, :cond_5

    .line 1297
    const/4 v3, 0x4

    invoke-direct {p0, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextLesserThan8Bits(I)I

    move-result v4

    .line 1298
    .local v4, "current":I
    sget-object v5, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->initBlack:[S

    aget-short v5, v5, v4

    .line 1301
    .local v5, "entry":I
    and-int/lit8 v6, v5, 0x1

    .line 1302
    .local v6, "isT":I
    ushr-int/lit8 v7, v5, 0x1

    const/16 v8, 0xf

    and-int/2addr v7, v8

    .line 1303
    .local v7, "bits":I
    ushr-int/lit8 v9, v5, 0x5

    and-int/lit16 v0, v9, 0x7ff

    .line 1305
    const/16 v9, 0x64

    if-ne v0, v9, :cond_3

    .line 1306
    const/16 v9, 0x9

    invoke-direct {p0, v9}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextNBits(I)I

    move-result v4

    .line 1307
    sget-object v9, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->black:[S

    aget-short v5, v9, v4

    .line 1310
    and-int/lit8 v6, v5, 0x1

    .line 1311
    ushr-int/lit8 v9, v5, 0x1

    and-int/lit8 v7, v9, 0xf

    .line 1312
    ushr-int/lit8 v9, v5, 0x5

    and-int/lit16 v0, v9, 0x7ff

    .line 1314
    const/16 v9, 0xc

    if-ne v7, v9, :cond_1

    .line 1316
    const/4 v8, 0x5

    invoke-direct {p0, v8}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    .line 1317
    invoke-direct {p0, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextLesserThan8Bits(I)I

    move-result v3

    .line 1318
    .end local v4    # "current":I
    .local v3, "current":I
    sget-object v4, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->additionalMakeup:[S

    aget-short v4, v4, v3

    .line 1319
    .end local v5    # "entry":I
    .local v4, "entry":I
    ushr-int/lit8 v5, v4, 0x1

    and-int/lit8 v5, v5, 0x7

    .line 1320
    .end local v7    # "bits":I
    .local v5, "bits":I
    ushr-int/lit8 v7, v4, 0x4

    and-int/lit16 v0, v7, 0xfff

    .line 1321
    add-int/2addr v1, v0

    .line 1323
    rsub-int/lit8 v7, v5, 0x4

    invoke-direct {p0, v7}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    goto :goto_0

    .line 1324
    .end local v3    # "current":I
    .local v4, "current":I
    .local v5, "entry":I
    .restart local v7    # "bits":I
    :cond_1
    if-eq v7, v8, :cond_2

    .line 1328
    add-int/2addr v1, v0

    .line 1329
    rsub-int/lit8 v3, v7, 0x9

    invoke-direct {p0, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    .line 1330
    if-nez v6, :cond_0

    .line 1331
    const/4 v2, 0x1

    goto :goto_0

    .line 1326
    :cond_2
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v8, "Error 2"

    invoke-direct {v3, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1334
    :cond_3
    const/16 v3, 0xc8

    if-ne v0, v3, :cond_4

    .line 1336
    const/4 v3, 0x2

    invoke-direct {p0, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextLesserThan8Bits(I)I

    move-result v3

    .line 1337
    .end local v4    # "current":I
    .restart local v3    # "current":I
    sget-object v4, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->twoBitBlack:[S

    aget-short v4, v4, v3

    .line 1338
    .end local v5    # "entry":I
    .local v4, "entry":I
    ushr-int/lit8 v5, v4, 0x5

    and-int/lit16 v0, v5, 0x7ff

    .line 1339
    add-int/2addr v1, v0

    .line 1340
    ushr-int/lit8 v5, v4, 0x1

    and-int/2addr v5, v8

    .line 1341
    .end local v7    # "bits":I
    .local v5, "bits":I
    rsub-int/lit8 v7, v5, 0x2

    invoke-direct {p0, v7}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    .line 1342
    const/4 v2, 0x1

    goto :goto_0

    .line 1345
    .end local v3    # "current":I
    .local v4, "current":I
    .local v5, "entry":I
    .restart local v7    # "bits":I
    :cond_4
    add-int/2addr v1, v0

    .line 1346
    rsub-int/lit8 v3, v7, 0x4

    invoke-direct {p0, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    .line 1347
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 1351
    .end local v4    # "current":I
    .end local v5    # "entry":I
    .end local v6    # "isT":I
    .end local v7    # "bits":I
    :cond_5
    return v1
.end method

.method private decodeWhiteCodeWord()I
    .locals 10

    .line 1250
    const/4 v0, -0x1

    .line 1251
    .local v0, "code":I
    const/4 v1, 0x0

    .line 1252
    .local v1, "runLength":I
    const/4 v2, 0x1

    .line 1254
    .local v2, "isWhite":Z
    :cond_0
    :goto_0
    if-eqz v2, :cond_4

    .line 1255
    const/16 v3, 0xa

    invoke-direct {p0, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextNBits(I)I

    move-result v3

    .line 1256
    .local v3, "current":I
    sget-object v4, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->white:[S

    aget-short v4, v4, v3

    .line 1259
    .local v4, "entry":I
    and-int/lit8 v5, v4, 0x1

    .line 1260
    .local v5, "isT":I
    ushr-int/lit8 v6, v4, 0x1

    const/16 v7, 0xf

    and-int/2addr v6, v7

    .line 1262
    .local v6, "bits":I
    const/16 v8, 0xc

    if-ne v6, v8, :cond_1

    .line 1264
    const/4 v7, 0x2

    invoke-direct {p0, v7}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextLesserThan8Bits(I)I

    move-result v7

    .line 1266
    .local v7, "twoBits":I
    shl-int/lit8 v9, v3, 0x2

    and-int/2addr v8, v9

    or-int v3, v8, v7

    .line 1267
    sget-object v8, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->additionalMakeup:[S

    aget-short v4, v8, v3

    .line 1268
    ushr-int/lit8 v8, v4, 0x1

    and-int/lit8 v6, v8, 0x7

    .line 1269
    ushr-int/lit8 v8, v4, 0x4

    and-int/lit16 v0, v8, 0xfff

    .line 1270
    add-int/2addr v1, v0

    .line 1271
    rsub-int/lit8 v8, v6, 0x4

    invoke-direct {p0, v8}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    goto :goto_0

    .line 1272
    .end local v7    # "twoBits":I
    :cond_1
    if-eqz v6, :cond_3

    .line 1274
    if-eq v6, v7, :cond_2

    .line 1278
    ushr-int/lit8 v7, v4, 0x5

    and-int/lit16 v0, v7, 0x7ff

    .line 1279
    add-int/2addr v1, v0

    .line 1280
    rsub-int/lit8 v7, v6, 0xa

    invoke-direct {p0, v7}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    .line 1281
    if-nez v5, :cond_0

    .line 1282
    const/4 v2, 0x0

    goto :goto_0

    .line 1275
    :cond_2
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Error 1"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1273
    :cond_3
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Error 0"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1287
    .end local v3    # "current":I
    .end local v4    # "entry":I
    .end local v5    # "isT":I
    .end local v6    # "bits":I
    :cond_4
    return v1
.end method

.method private findNextLine()I
    .locals 7

    .line 1356
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->data:[B

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x8

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 1357
    .local v0, "bitIndexMax":I
    add-int/lit8 v2, v0, -0xc

    .line 1358
    .local v2, "bitIndexMax12":I
    iget v3, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    mul-int/lit8 v3, v3, 0x8

    iget v4, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    add-int/2addr v3, v4

    .line 1361
    .local v3, "bitIndex":I
    :goto_0
    if-gt v3, v2, :cond_3

    .line 1363
    const/16 v4, 0xc

    invoke-direct {p0, v4}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextNBits(I)I

    move-result v4

    .line 1364
    .local v4, "next12Bits":I
    add-int/lit8 v3, v3, 0xc

    .line 1368
    :goto_1
    if-eq v4, v1, :cond_0

    if-ge v3, v0, :cond_0

    .line 1369
    and-int/lit16 v5, v4, 0x7ff

    shl-int/2addr v5, v1

    .line 1371
    invoke-direct {p0, v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextLesserThan8Bits(I)I

    move-result v6

    and-int/2addr v6, v1

    or-int v4, v5, v6

    .line 1372
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1375
    :cond_0
    if-ne v4, v1, :cond_2

    .line 1376
    iget v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->oneD:I

    if-ne v5, v1, :cond_1

    .line 1377
    if-ge v3, v0, :cond_2

    .line 1379
    invoke-direct {p0, v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextLesserThan8Bits(I)I

    move-result v1

    return v1

    .line 1382
    :cond_1
    return v1

    .line 1385
    .end local v4    # "next12Bits":I
    :cond_2
    goto :goto_0

    .line 1388
    :cond_3
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1}, Ljava/lang/RuntimeException;-><init>()V

    throw v1
.end method

.method private getNextChangingElement(IZ[I)V
    .locals 7
    .param p1, "a0"    # I
    .param p2, "isWhite"    # Z
    .param p3, "ret"    # [I

    .line 1393
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->prevChangingElems:[I

    .line 1394
    .local v0, "pce":[I
    iget v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    .line 1399
    .local v1, "ces":I
    iget v2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lastChangingElement:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-lez v2, :cond_0

    iget v2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lastChangingElement:I

    sub-int/2addr v2, v4

    goto :goto_0

    :cond_0
    move v2, v3

    .line 1400
    .local v2, "start":I
    :goto_0
    if-eqz p2, :cond_1

    .line 1401
    and-int/lit8 v2, v2, -0x2

    goto :goto_1

    .line 1403
    :cond_1
    or-int/2addr v2, v4

    .line 1406
    :goto_1
    move v5, v2

    .line 1407
    .local v5, "i":I
    :goto_2
    if-ge v5, v1, :cond_3

    .line 1408
    aget v6, v0, v5

    .line 1409
    .local v6, "temp":I
    if-le v6, p1, :cond_2

    .line 1410
    iput v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lastChangingElement:I

    .line 1411
    aput v6, p3, v3

    .line 1412
    goto :goto_3

    .line 1407
    .end local v6    # "temp":I
    :cond_2
    add-int/lit8 v5, v5, 0x2

    goto :goto_2

    .line 1416
    :cond_3
    :goto_3
    add-int/lit8 v3, v5, 0x1

    if-ge v3, v1, :cond_4

    .line 1417
    add-int/lit8 v3, v5, 0x1

    aget v3, v0, v3

    aput v3, p3, v4

    .line 1419
    :cond_4
    return-void
.end method

.method private nextLesserThan8Bits(I)I
    .locals 11
    .param p1, "bitsToGet"    # I

    .line 1490
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->data:[B

    array-length v0, v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 1491
    .local v0, "l":I
    iget v2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    .line 1493
    .local v2, "bp":I
    iget v3, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fillOrder:I

    if-ne v3, v1, :cond_1

    .line 1494
    iget-object v3, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->data:[B

    aget-byte v3, v3, v2

    .line 1495
    .local v3, "b":B
    if-ne v2, v0, :cond_0

    .line 1496
    const/4 v4, 0x0

    .local v4, "next":B
    goto :goto_0

    .line 1498
    .end local v4    # "next":B
    :cond_0
    iget-object v4, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->data:[B

    add-int/lit8 v5, v2, 0x1

    aget-byte v4, v4, v5

    .restart local v4    # "next":B
    goto :goto_0

    .line 1500
    .end local v3    # "b":B
    .end local v4    # "next":B
    :cond_1
    iget v3, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fillOrder:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_5

    .line 1501
    sget-object v3, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->flipTable:[B

    iget-object v4, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->data:[B

    aget-byte v4, v4, v2

    and-int/lit16 v4, v4, 0xff

    aget-byte v3, v3, v4

    .line 1502
    .restart local v3    # "b":B
    if-ne v2, v0, :cond_2

    .line 1503
    const/4 v4, 0x0

    .restart local v4    # "next":B
    goto :goto_0

    .line 1505
    .end local v4    # "next":B
    :cond_2
    sget-object v4, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->flipTable:[B

    iget-object v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->data:[B

    add-int/lit8 v6, v2, 0x1

    aget-byte v5, v5, v6

    and-int/lit16 v5, v5, 0xff

    aget-byte v4, v4, v5

    .line 1511
    .restart local v4    # "next":B
    :goto_0
    iget v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    const/16 v6, 0x8

    rsub-int/lit8 v5, v5, 0x8

    .line 1512
    .local v5, "bitsLeft":I
    sub-int v7, p1, v5

    .line 1514
    .local v7, "bitsFromNextByte":I
    sub-int v8, v5, p1

    .line 1516
    .local v8, "shift":I
    if-ltz v8, :cond_3

    .line 1517
    sget-object v9, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->table1:[I

    aget v9, v9, v5

    and-int/2addr v9, v3

    ushr-int/2addr v9, v8

    .line 1518
    .local v9, "i1":I
    iget v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    add-int/2addr v10, p1

    iput v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    .line 1519
    iget v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    if-ne v10, v6, :cond_4

    .line 1520
    const/4 v6, 0x0

    iput v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    .line 1521
    iget v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    add-int/2addr v6, v1

    iput v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    goto :goto_1

    .line 1524
    .end local v9    # "i1":I
    :cond_3
    sget-object v6, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->table1:[I

    aget v6, v6, v5

    and-int/2addr v6, v3

    neg-int v9, v8

    shl-int/2addr v6, v9

    .line 1525
    .local v6, "i1":I
    sget-object v9, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->table2:[I

    aget v9, v9, v7

    and-int/2addr v9, v4

    rsub-int/lit8 v10, v7, 0x8

    ushr-int/2addr v9, v10

    .line 1527
    .local v9, "i2":I
    or-int/2addr v6, v9

    .line 1528
    iget v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    add-int/2addr v10, v1

    iput v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    .line 1529
    iput v7, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    move v9, v6

    .line 1532
    .end local v6    # "i1":I
    .local v9, "i1":I
    :cond_4
    :goto_1
    return v9

    .line 1508
    .end local v3    # "b":B
    .end local v4    # "next":B
    .end local v5    # "bitsLeft":I
    .end local v7    # "bitsFromNextByte":I
    .end local v8    # "shift":I
    .end local v9    # "i1":I
    :cond_5
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v3, "Invalid FillOrder"

    invoke-direct {v1, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private nextNBits(I)I
    .locals 14
    .param p1, "bitsToGet"    # I

    .line 1423
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->data:[B

    array-length v0, v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 1424
    .local v0, "l":I
    iget v2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    .line 1426
    .local v2, "bp":I
    iget v3, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fillOrder:I

    if-ne v3, v1, :cond_2

    .line 1427
    iget-object v3, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->data:[B

    aget-byte v3, v3, v2

    .line 1429
    .local v3, "b":B
    if-ne v2, v0, :cond_0

    .line 1430
    const/4 v4, 0x0

    .line 1431
    .local v4, "next":B
    const/4 v5, 0x0

    .local v5, "next2next":B
    goto :goto_0

    .line 1432
    .end local v4    # "next":B
    .end local v5    # "next2next":B
    :cond_0
    add-int/lit8 v4, v2, 0x1

    .line 1436
    iget-object v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->data:[B

    .line 1432
    if-ne v4, v0, :cond_1

    .line 1433
    add-int/lit8 v4, v2, 0x1

    aget-byte v4, v5, v4

    .line 1434
    .restart local v4    # "next":B
    const/4 v5, 0x0

    .restart local v5    # "next2next":B
    goto :goto_0

    .line 1436
    .end local v4    # "next":B
    .end local v5    # "next2next":B
    :cond_1
    add-int/lit8 v4, v2, 0x1

    aget-byte v4, v5, v4

    .line 1437
    .restart local v4    # "next":B
    iget-object v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->data:[B

    add-int/lit8 v6, v2, 0x2

    aget-byte v5, v5, v6

    .restart local v5    # "next2next":B
    goto :goto_0

    .line 1439
    .end local v3    # "b":B
    .end local v4    # "next":B
    .end local v5    # "next2next":B
    :cond_2
    iget v3, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fillOrder:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_8

    .line 1440
    sget-object v3, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->flipTable:[B

    iget-object v4, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->data:[B

    aget-byte v4, v4, v2

    and-int/lit16 v4, v4, 0xff

    aget-byte v3, v3, v4

    .line 1442
    .restart local v3    # "b":B
    if-ne v2, v0, :cond_3

    .line 1443
    const/4 v4, 0x0

    .line 1444
    .restart local v4    # "next":B
    const/4 v5, 0x0

    .restart local v5    # "next2next":B
    goto :goto_0

    .line 1445
    .end local v4    # "next":B
    .end local v5    # "next2next":B
    :cond_3
    add-int/lit8 v4, v2, 0x1

    .line 1449
    iget-object v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->data:[B

    .line 1445
    if-ne v4, v0, :cond_4

    .line 1446
    sget-object v4, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->flipTable:[B

    add-int/lit8 v6, v2, 0x1

    aget-byte v5, v5, v6

    and-int/lit16 v5, v5, 0xff

    aget-byte v4, v4, v5

    .line 1447
    .restart local v4    # "next":B
    const/4 v5, 0x0

    .restart local v5    # "next2next":B
    goto :goto_0

    .line 1449
    .end local v4    # "next":B
    .end local v5    # "next2next":B
    :cond_4
    sget-object v4, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->flipTable:[B

    add-int/lit8 v6, v2, 0x1

    aget-byte v5, v5, v6

    and-int/lit16 v5, v5, 0xff

    aget-byte v4, v4, v5

    .line 1450
    .restart local v4    # "next":B
    sget-object v5, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->flipTable:[B

    iget-object v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->data:[B

    add-int/lit8 v7, v2, 0x2

    aget-byte v6, v6, v7

    and-int/lit16 v6, v6, 0xff

    aget-byte v5, v5, v6

    .line 1456
    .restart local v5    # "next2next":B
    :goto_0
    iget v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    const/16 v7, 0x8

    rsub-int/lit8 v6, v6, 0x8

    .line 1457
    .local v6, "bitsLeft":I
    sub-int v8, p1, v6

    .line 1458
    .local v8, "bitsFromNextByte":I
    const/4 v9, 0x0

    .line 1459
    .local v9, "bitsFromNext2NextByte":I
    if-le v8, v7, :cond_5

    .line 1460
    add-int/lit8 v9, v8, -0x8

    .line 1461
    const/16 v8, 0x8

    .line 1464
    :cond_5
    iget v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    add-int/2addr v10, v1

    iput v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    .line 1466
    sget-object v10, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->table1:[I

    aget v10, v10, v6

    and-int/2addr v10, v3

    sub-int v11, p1, v6

    shl-int/2addr v10, v11

    .line 1467
    .local v10, "i1":I
    sget-object v11, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->table2:[I

    aget v11, v11, v8

    and-int/2addr v11, v4

    rsub-int/lit8 v12, v8, 0x8

    ushr-int/2addr v11, v12

    .line 1469
    .local v11, "i2":I
    const/4 v12, 0x0

    .line 1470
    .local v12, "i3":I
    if-eqz v9, :cond_6

    .line 1471
    shl-int v7, v11, v9

    .line 1472
    .end local v11    # "i2":I
    .local v7, "i2":I
    sget-object v11, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->table2:[I

    aget v11, v11, v9

    and-int/2addr v11, v5

    rsub-int/lit8 v13, v9, 0x8

    ushr-int v12, v11, v13

    .line 1474
    or-int v11, v7, v12

    .line 1475
    .end local v7    # "i2":I
    .restart local v11    # "i2":I
    iget v7, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    add-int/2addr v7, v1

    iput v7, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    .line 1476
    iput v9, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    goto :goto_1

    .line 1478
    :cond_6
    if-ne v8, v7, :cond_7

    .line 1479
    const/4 v7, 0x0

    iput v7, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    .line 1480
    iget v7, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    add-int/2addr v7, v1

    iput v7, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    goto :goto_1

    .line 1482
    :cond_7
    iput v8, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    .line 1485
    :goto_1
    or-int v1, v10, v11

    return v1

    .line 1453
    .end local v3    # "b":B
    .end local v4    # "next":B
    .end local v5    # "next2next":B
    .end local v6    # "bitsLeft":I
    .end local v8    # "bitsFromNextByte":I
    .end local v9    # "bitsFromNext2NextByte":I
    .end local v10    # "i1":I
    .end local v11    # "i2":I
    .end local v12    # "i3":I
    :cond_8
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v3, "Invalid FillOrder"

    invoke-direct {v1, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private setToBlack(II)V
    .locals 7
    .param p1, "bitNum"    # I
    .param p2, "numBits"    # I

    .line 1215
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lineBitNum:I

    add-int/2addr p1, v0

    .line 1217
    add-int v0, p1, p2

    .line 1218
    .local v0, "lastBit":I
    shr-int/lit8 v1, p1, 0x3

    .line 1221
    .local v1, "byteNum":I
    and-int/lit8 v2, p1, 0x7

    .line 1222
    .local v2, "shift":I
    const/4 v3, 0x1

    if-lez v2, :cond_1

    .line 1223
    rsub-int/lit8 v4, v2, 0x7

    shl-int v4, v3, v4

    .line 1224
    .local v4, "maskVal":I
    iget-object v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->buffer:[B

    aget-byte v5, v5, v1

    .line 1225
    .local v5, "val":B
    :goto_0
    if-lez v4, :cond_0

    if-ge p1, v0, :cond_0

    .line 1226
    int-to-byte v6, v4

    or-int/2addr v6, v5

    int-to-byte v5, v6

    .line 1227
    shr-int/lit8 v4, v4, 0x1

    .line 1228
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 1230
    :cond_0
    iget-object v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->buffer:[B

    aput-byte v5, v6, v1

    .line 1234
    .end local v4    # "maskVal":I
    .end local v5    # "val":B
    :cond_1
    shr-int/lit8 v1, p1, 0x3

    .line 1235
    :goto_1
    add-int/lit8 v4, v0, -0x7

    if-ge p1, v4, :cond_2

    .line 1236
    iget-object v4, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->buffer:[B

    add-int/lit8 v5, v1, 0x1

    .end local v1    # "byteNum":I
    .local v5, "byteNum":I
    const/4 v6, -0x1

    aput-byte v6, v4, v1

    .line 1237
    add-int/lit8 p1, p1, 0x8

    move v1, v5

    goto :goto_1

    .line 1241
    .end local v5    # "byteNum":I
    .restart local v1    # "byteNum":I
    :cond_2
    :goto_2
    if-ge p1, v0, :cond_3

    .line 1242
    shr-int/lit8 v1, p1, 0x3

    .line 1243
    iget-object v4, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->buffer:[B

    aget-byte v5, v4, v1

    and-int/lit8 v6, p1, 0x7

    rsub-int/lit8 v6, v6, 0x7

    shl-int v6, v3, v6

    int-to-byte v6, v6

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v4, v1

    .line 1244
    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    .line 1246
    :cond_3
    return-void
.end method

.method private updatePointer(I)V
    .locals 2
    .param p1, "bitsToMoveBack"    # I

    .line 1537
    const/16 v0, 0x8

    if-le p1, v0, :cond_0

    .line 1538
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    div-int/lit8 v1, p1, 0x8

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    .line 1539
    rem-int/lit8 p1, p1, 0x8

    .line 1542
    :cond_0
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    sub-int/2addr v0, p1

    .line 1543
    .local v0, "i":I
    if-gez v0, :cond_1

    .line 1544
    iget v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    .line 1545
    add-int/lit8 v1, v0, 0x8

    iput v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    goto :goto_0

    .line 1547
    :cond_1
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    .line 1549
    :goto_0
    return-void
.end method


# virtual methods
.method public SetOptions(IIII)V
    .locals 1
    .param p1, "fillOrder"    # I
    .param p2, "compression"    # I
    .param p3, "t4Options"    # I
    .param p4, "t6Options"    # I

    .line 613
    iput p1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fillOrder:I

    .line 614
    iput p2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->compression:I

    .line 615
    iput p3, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->t4Options:I

    .line 616
    iput p4, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->t6Options:I

    .line 617
    and-int/lit8 v0, p3, 0x1

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->oneD:I

    .line 618
    and-int/lit8 v0, p3, 0x2

    shr-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->uncompressedMode:I

    .line 619
    and-int/lit8 v0, p3, 0x4

    shr-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fillBits:I

    .line 620
    return-void
.end method

.method public decodeNextScanline()V
    .locals 15

    .line 671
    const/4 v0, 0x0

    .local v0, "bits":I
    const/4 v1, 0x0

    .local v1, "code":I
    const/4 v2, 0x0

    .line 673
    .local v2, "isT":I
    const/4 v3, 0x1

    .line 675
    .local v3, "isWhite":Z
    const/4 v4, 0x0

    .line 678
    .local v4, "bitOffset":I
    const/4 v5, 0x0

    iput v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    .line 681
    :goto_0
    iget v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    if-ge v4, v5, :cond_d

    .line 684
    move v5, v4

    .line 686
    .local v5, "runOffset":I
    :cond_0
    :goto_1
    const/16 v6, 0xc

    const/4 v7, 0x2

    const/16 v8, 0xa

    const/16 v9, 0xf

    if-eqz v3, :cond_4

    iget v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    if-ge v4, v10, :cond_4

    .line 688
    invoke-direct {p0, v8}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextNBits(I)I

    move-result v8

    .line 689
    .local v8, "current":I
    sget-object v10, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->white:[S

    aget-short v10, v10, v8

    .line 692
    .local v10, "entry":I
    and-int/lit8 v2, v10, 0x1

    .line 693
    ushr-int/lit8 v11, v10, 0x1

    and-int/lit8 v0, v11, 0xf

    .line 695
    if-ne v0, v6, :cond_1

    .line 697
    invoke-direct {p0, v7}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextLesserThan8Bits(I)I

    move-result v7

    .line 699
    .local v7, "twoBits":I
    shl-int/lit8 v9, v8, 0x2

    and-int/2addr v6, v9

    or-int/2addr v6, v7

    .line 700
    .end local v8    # "current":I
    .local v6, "current":I
    sget-object v8, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->additionalMakeup:[S

    aget-short v8, v8, v6

    .line 701
    .end local v10    # "entry":I
    .local v8, "entry":I
    ushr-int/lit8 v9, v8, 0x1

    and-int/lit8 v0, v9, 0x7

    .line 702
    ushr-int/lit8 v9, v8, 0x4

    and-int/lit16 v1, v9, 0xfff

    .line 703
    add-int/2addr v4, v1

    .line 705
    rsub-int/lit8 v9, v0, 0x4

    invoke-direct {p0, v9}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    goto :goto_1

    .line 706
    .end local v6    # "current":I
    .end local v7    # "twoBits":I
    .local v8, "current":I
    .restart local v10    # "entry":I
    :cond_1
    if-nez v0, :cond_2

    .line 707
    iget v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    goto :goto_1

    .line 709
    :cond_2
    if-ne v0, v9, :cond_3

    .line 714
    iget v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    .line 715
    return-void

    .line 718
    :cond_3
    ushr-int/lit8 v6, v10, 0x5

    and-int/lit16 v1, v6, 0x7ff

    .line 719
    add-int/2addr v4, v1

    .line 721
    rsub-int/lit8 v6, v0, 0xa

    invoke-direct {p0, v6}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    .line 722
    if-nez v2, :cond_0

    .line 723
    const/4 v3, 0x0

    .line 724
    iget-object v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    iget v7, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    add-int/lit8 v9, v7, 0x1

    iput v9, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    aput v4, v6, v7

    goto :goto_1

    .line 730
    .end local v8    # "current":I
    .end local v10    # "entry":I
    :cond_4
    iget v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    if-ne v4, v10, :cond_5

    .line 734
    sub-int v6, v4, v5

    .line 735
    .local v6, "runLength":I
    if-eqz v3, :cond_d

    if-eqz v6, :cond_d

    rem-int/lit8 v7, v6, 0x40

    if-nez v7, :cond_d

    .line 737
    const/16 v7, 0x8

    invoke-direct {p0, v7}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextNBits(I)I

    move-result v8

    const/16 v9, 0x35

    if-eq v8, v9, :cond_d

    .line 738
    iget v8, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    .line 739
    invoke-direct {p0, v7}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    goto/16 :goto_3

    .line 745
    .end local v6    # "runLength":I
    :cond_5
    move v5, v4

    .line 747
    :cond_6
    :goto_2
    if-nez v3, :cond_b

    iget v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    if-ge v4, v10, :cond_b

    .line 749
    const/4 v10, 0x4

    invoke-direct {p0, v10}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextLesserThan8Bits(I)I

    move-result v11

    .line 750
    .local v11, "current":I
    sget-object v12, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->initBlack:[S

    aget-short v12, v12, v11

    .line 753
    .local v12, "entry":I
    and-int/lit8 v2, v12, 0x1

    .line 754
    ushr-int/lit8 v13, v12, 0x1

    and-int/lit8 v0, v13, 0xf

    .line 755
    ushr-int/lit8 v13, v12, 0x5

    and-int/lit16 v1, v13, 0x7ff

    .line 757
    const/16 v13, 0x64

    if-ne v1, v13, :cond_9

    .line 758
    const/16 v13, 0x9

    invoke-direct {p0, v13}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextNBits(I)I

    move-result v11

    .line 759
    sget-object v13, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->black:[S

    aget-short v12, v13, v11

    .line 762
    and-int/lit8 v2, v12, 0x1

    .line 763
    ushr-int/lit8 v13, v12, 0x1

    and-int/lit8 v0, v13, 0xf

    .line 764
    ushr-int/lit8 v13, v12, 0x5

    and-int/lit16 v1, v13, 0x7ff

    .line 766
    if-ne v0, v6, :cond_7

    .line 768
    const/4 v13, 0x5

    invoke-direct {p0, v13}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    .line 769
    invoke-direct {p0, v10}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextLesserThan8Bits(I)I

    move-result v10

    .line 770
    .end local v11    # "current":I
    .local v10, "current":I
    sget-object v11, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->additionalMakeup:[S

    aget-short v11, v11, v10

    .line 771
    .end local v12    # "entry":I
    .local v11, "entry":I
    ushr-int/lit8 v12, v11, 0x1

    and-int/lit8 v0, v12, 0x7

    .line 772
    ushr-int/lit8 v12, v11, 0x4

    and-int/lit16 v1, v12, 0xfff

    .line 774
    invoke-direct {p0, v4, v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->setToBlack(II)V

    .line 775
    add-int/2addr v4, v1

    .line 777
    rsub-int/lit8 v12, v0, 0x4

    invoke-direct {p0, v12}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    goto :goto_2

    .line 778
    .end local v10    # "current":I
    .local v11, "current":I
    .restart local v12    # "entry":I
    :cond_7
    if-ne v0, v9, :cond_8

    .line 783
    iget v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    .line 784
    return-void

    .line 786
    :cond_8
    invoke-direct {p0, v4, v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->setToBlack(II)V

    .line 787
    add-int/2addr v4, v1

    .line 789
    rsub-int/lit8 v10, v0, 0x9

    invoke-direct {p0, v10}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    .line 790
    if-nez v2, :cond_6

    .line 791
    const/4 v3, 0x1

    .line 792
    iget-object v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    iget v13, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    add-int/lit8 v14, v13, 0x1

    iput v14, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    aput v4, v10, v13

    goto :goto_2

    .line 795
    :cond_9
    const/16 v10, 0xc8

    if-ne v1, v10, :cond_a

    .line 797
    invoke-direct {p0, v7}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextLesserThan8Bits(I)I

    move-result v10

    .line 798
    .end local v11    # "current":I
    .restart local v10    # "current":I
    sget-object v11, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->twoBitBlack:[S

    aget-short v11, v11, v10

    .line 799
    .end local v12    # "entry":I
    .local v11, "entry":I
    ushr-int/lit8 v12, v11, 0x5

    and-int/lit16 v1, v12, 0x7ff

    .line 800
    ushr-int/lit8 v12, v11, 0x1

    and-int/lit8 v0, v12, 0xf

    .line 802
    invoke-direct {p0, v4, v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->setToBlack(II)V

    .line 803
    add-int/2addr v4, v1

    .line 805
    rsub-int/lit8 v12, v0, 0x2

    invoke-direct {p0, v12}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    .line 806
    const/4 v3, 0x1

    .line 807
    iget-object v12, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    iget v13, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    add-int/lit8 v14, v13, 0x1

    iput v14, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    aput v4, v12, v13

    goto/16 :goto_2

    .line 810
    .end local v10    # "current":I
    .local v11, "current":I
    .restart local v12    # "entry":I
    :cond_a
    invoke-direct {p0, v4, v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->setToBlack(II)V

    .line 811
    add-int/2addr v4, v1

    .line 813
    rsub-int/lit8 v10, v0, 0x4

    invoke-direct {p0, v10}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    .line 814
    const/4 v3, 0x1

    .line 815
    iget-object v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    iget v13, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    add-int/lit8 v14, v13, 0x1

    iput v14, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    aput v4, v10, v13

    goto/16 :goto_2

    .line 820
    .end local v11    # "current":I
    .end local v12    # "entry":I
    :cond_b
    iget v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    if-ne v4, v6, :cond_c

    .line 824
    sub-int v6, v4, v5

    .line 825
    .restart local v6    # "runLength":I
    if-nez v3, :cond_d

    if-eqz v6, :cond_d

    rem-int/lit8 v7, v6, 0x40

    if-nez v7, :cond_d

    .line 827
    invoke-direct {p0, v8}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextNBits(I)I

    move-result v7

    const/16 v9, 0x37

    if-eq v7, v9, :cond_d

    .line 828
    iget v7, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    .line 829
    invoke-direct {p0, v8}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    goto :goto_3

    .line 833
    .end local v5    # "runOffset":I
    .end local v6    # "runLength":I
    :cond_c
    goto/16 :goto_0

    .line 835
    :cond_d
    :goto_3
    iget-object v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    iget v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    aput v4, v5, v6

    .line 836
    return-void
.end method

.method public decodeRLE()V
    .locals 3

    .line 655
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->h:I

    if-ge v0, v1, :cond_1

    .line 657
    invoke-virtual {p0}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeNextScanline()V

    .line 660
    iget v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    if-eqz v1, :cond_0

    .line 661
    iget v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    .line 662
    const/4 v1, 0x0

    iput v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    .line 666
    :cond_0
    iget v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lineBitNum:I

    iget v2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitsPerScanline:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lineBitNum:I

    .line 655
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 668
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method public decodeRaw([B[BII)V
    .locals 3
    .param p1, "buffer"    # [B
    .param p2, "compData"    # [B
    .param p3, "w"    # I
    .param p4, "h"    # I

    .line 624
    iput-object p1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->buffer:[B

    .line 625
    iput-object p2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->data:[B

    .line 626
    iput p3, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    .line 627
    iput p4, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->h:I

    .line 628
    iput p3, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitsPerScanline:I

    .line 629
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lineBitNum:I

    .line 631
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitPointer:I

    .line 632
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bytePointer:I

    .line 633
    add-int/lit8 v1, p3, 0x1

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->prevChangingElems:[I

    .line 634
    add-int/lit8 v1, p3, 0x1

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    .line 636
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    .line 639
    :try_start_0
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->compression:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 640
    invoke-virtual {p0}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeRLE()V

    goto :goto_0

    .line 641
    :cond_0
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->compression:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_1

    .line 642
    invoke-virtual {p0}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeT4()V

    goto :goto_0

    .line 643
    :cond_1
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->compression:I

    const/4 v2, 0x4

    if-ne v0, v2, :cond_2

    .line 644
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->t6Options:I

    and-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->uncompressedMode:I

    .line 645
    invoke-virtual {p0}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeT6()V

    .line 651
    :goto_0
    goto :goto_1

    .line 647
    :cond_2
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "Unknown compression type {0}."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->compression:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v0

    .end local p1    # "buffer":[B
    .end local p2    # "compData":[B
    .end local p3    # "w":I
    .end local p4    # "h":I
    throw v0
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 649
    .restart local p1    # "buffer":[B
    .restart local p2    # "compData":[B
    .restart local p3    # "w":I
    .restart local p4    # "h":I
    :catch_0
    move-exception v0

    .line 652
    :goto_1
    return-void
.end method

.method public decodeT4()V
    .locals 21

    .line 839
    move-object/from16 v1, p0

    iget v2, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->h:I

    .line 842
    .local v2, "height":I
    const/4 v0, 0x2

    new-array v3, v0, [I

    .line 845
    .local v3, "b":[I
    const/4 v4, 0x0

    .line 848
    .local v4, "currIndex":I
    iget-object v5, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->data:[B

    array-length v5, v5

    if-lt v5, v0, :cond_d

    .line 853
    const/16 v0, 0xc

    invoke-direct {v1, v0}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextNBits(I)I

    move-result v5

    .line 854
    .local v5, "next12":I
    const/4 v6, 0x1

    if-eq v5, v6, :cond_0

    .line 855
    iget v7, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    add-int/2addr v7, v6

    iput v7, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    .line 857
    :cond_0
    invoke-direct {v1, v0}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    .line 860
    const/4 v0, 0x0

    .line 861
    .local v0, "modeFlag":I
    const/4 v7, -0x1

    move v8, v7

    move v7, v0

    .line 862
    .end local v0    # "modeFlag":I
    .local v7, "modeFlag":I
    .local v8, "lines":I
    :goto_0
    if-eq v7, v6, :cond_1

    .line 864
    :try_start_0
    invoke-direct {v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->findNextLine()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v7, v0

    .line 865
    add-int/lit8 v8, v8, 0x1

    .line 868
    goto :goto_0

    .line 866
    :catch_0
    move-exception v0

    .line 867
    .local v0, "eofe":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/RuntimeException;

    const-string v9, "No reference line present."

    invoke-direct {v6, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 875
    .end local v0    # "eofe":Ljava/lang/Exception;
    :cond_1
    invoke-virtual {v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeNextScanline()V

    .line 876
    add-int/2addr v8, v6

    .line 877
    iget v0, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lineBitNum:I

    iget v9, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitsPerScanline:I

    add-int/2addr v0, v9

    iput v0, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lineBitNum:I

    .line 879
    :goto_1
    if-ge v8, v2, :cond_c

    .line 884
    :try_start_1
    invoke-direct {v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->findNextLine()I

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 888
    .end local v7    # "modeFlag":I
    .local v0, "modeFlag":I
    nop

    .line 889
    if-nez v0, :cond_b

    .line 894
    iget-object v7, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->prevChangingElems:[I

    .line 895
    .local v7, "temp":[I
    iget-object v9, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    iput-object v9, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->prevChangingElems:[I

    .line 896
    iput-object v7, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    .line 897
    const/4 v4, 0x0

    .line 900
    const/4 v9, -0x1

    .line 901
    .local v9, "a0":I
    const/4 v10, 0x1

    .line 902
    .local v10, "isWhite":Z
    const/4 v11, 0x0

    .line 904
    .local v11, "bitOffset":I
    const/4 v12, 0x0

    iput v12, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lastChangingElement:I

    .line 906
    :goto_2
    iget v13, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    if-ge v11, v13, :cond_a

    .line 908
    invoke-direct {v1, v9, v10, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->getNextChangingElement(IZ[I)V

    .line 910
    aget v13, v3, v12

    .line 911
    .local v13, "b1":I
    aget v14, v3, v6

    .line 914
    .local v14, "b2":I
    const/4 v15, 0x7

    invoke-direct {v1, v15}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextLesserThan8Bits(I)I

    move-result v15

    .line 917
    .local v15, "entry":I
    sget-object v16, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->twoDCodes:[B

    aget-byte v12, v16, v15

    and-int/lit16 v12, v12, 0xff

    .line 920
    .end local v15    # "entry":I
    .local v12, "entry":I
    and-int/lit8 v15, v12, 0x78

    ushr-int/lit8 v15, v15, 0x3

    .line 921
    .local v15, "code":I
    and-int/lit8 v16, v12, 0x7

    .line 923
    .local v16, "bits":I
    if-nez v15, :cond_3

    .line 924
    if-nez v10, :cond_2

    .line 925
    sub-int v6, v14, v11

    invoke-direct {v1, v11, v6}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->setToBlack(II)V

    .line 927
    :cond_2
    move v9, v14

    move v11, v14

    .line 930
    rsub-int/lit8 v6, v16, 0x7

    invoke-direct {v1, v6}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    const/4 v6, 0x1

    const/4 v12, 0x0

    goto :goto_2

    .line 931
    :cond_3
    const/4 v6, 0x1

    if-ne v15, v6, :cond_5

    .line 933
    rsub-int/lit8 v6, v16, 0x7

    invoke-direct {v1, v6}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    .line 937
    if-eqz v10, :cond_4

    .line 938
    invoke-direct {v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeWhiteCodeWord()I

    move-result v6

    .line 939
    .local v6, "number":I
    add-int/2addr v11, v6

    .line 940
    move/from16 v19, v0

    .end local v0    # "modeFlag":I
    .local v19, "modeFlag":I
    iget-object v0, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    add-int/lit8 v20, v4, 0x1

    .end local v4    # "currIndex":I
    .local v20, "currIndex":I
    aput v11, v0, v4

    .line 942
    invoke-direct {v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeBlackCodeWord()I

    move-result v0

    .line 943
    .end local v6    # "number":I
    .local v0, "number":I
    invoke-direct {v1, v11, v0}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->setToBlack(II)V

    .line 944
    add-int/2addr v11, v0

    .line 945
    iget-object v4, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    add-int/lit8 v6, v20, 0x1

    .end local v20    # "currIndex":I
    .local v6, "currIndex":I
    aput v11, v4, v20

    move v4, v6

    goto :goto_3

    .line 947
    .end local v6    # "currIndex":I
    .end local v19    # "modeFlag":I
    .local v0, "modeFlag":I
    .restart local v4    # "currIndex":I
    :cond_4
    move/from16 v19, v0

    .end local v0    # "modeFlag":I
    .restart local v19    # "modeFlag":I
    invoke-direct {v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeBlackCodeWord()I

    move-result v0

    .line 948
    .local v0, "number":I
    invoke-direct {v1, v11, v0}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->setToBlack(II)V

    .line 949
    add-int/2addr v11, v0

    .line 950
    iget-object v6, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    add-int/lit8 v20, v4, 0x1

    .end local v4    # "currIndex":I
    .restart local v20    # "currIndex":I
    aput v11, v6, v4

    .line 952
    invoke-direct {v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeWhiteCodeWord()I

    move-result v0

    .line 953
    add-int/2addr v11, v0

    .line 954
    iget-object v4, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    add-int/lit8 v6, v20, 0x1

    .end local v20    # "currIndex":I
    .restart local v6    # "currIndex":I
    aput v11, v4, v20

    move v4, v6

    .line 957
    .end local v6    # "currIndex":I
    .restart local v4    # "currIndex":I
    :goto_3
    move v9, v11

    .line 958
    .end local v0    # "number":I
    move/from16 v0, v19

    const/4 v6, 0x1

    const/4 v12, 0x0

    goto :goto_2

    .end local v19    # "modeFlag":I
    .local v0, "modeFlag":I
    :cond_5
    move/from16 v19, v0

    .end local v0    # "modeFlag":I
    .restart local v19    # "modeFlag":I
    const/16 v0, 0x8

    if-gt v15, v0, :cond_8

    .line 960
    add-int/lit8 v0, v15, -0x5

    add-int/2addr v0, v13

    .line 962
    .local v0, "a1":I
    iget-object v6, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    add-int/lit8 v20, v4, 0x1

    .end local v4    # "currIndex":I
    .restart local v20    # "currIndex":I
    aput v0, v6, v4

    .line 966
    if-nez v10, :cond_6

    .line 967
    sub-int v4, v0, v11

    invoke-direct {v1, v11, v4}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->setToBlack(II)V

    .line 969
    :cond_6
    move v9, v0

    move v11, v0

    .line 970
    if-nez v10, :cond_7

    const/4 v4, 0x1

    goto :goto_4

    :cond_7
    const/4 v4, 0x0

    :goto_4
    move v10, v4

    .line 972
    rsub-int/lit8 v4, v16, 0x7

    invoke-direct {v1, v4}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    move/from16 v0, v19

    move/from16 v4, v20

    const/4 v6, 0x1

    const/4 v12, 0x0

    goto/16 :goto_2

    .line 974
    .end local v0    # "a1":I
    .end local v20    # "currIndex":I
    .restart local v4    # "currIndex":I
    :cond_8
    iget v0, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    const/4 v6, 0x1

    add-int/2addr v0, v6

    iput v0, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    .line 976
    const/4 v0, 0x0

    move/from16 v17, v2

    move/from16 v2, v19

    move/from16 v19, v0

    .line 977
    .local v2, "modeFlag":I
    .local v17, "height":I
    .local v19, "numLinesTested":I
    :goto_5
    if-eq v2, v6, :cond_9

    .line 979
    :try_start_2
    invoke-direct {v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->findNextLine()I

    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move v2, v0

    .line 980
    add-int/lit8 v19, v19, 0x1

    .line 983
    const/4 v6, 0x1

    goto :goto_5

    .line 981
    :catch_1
    move-exception v0

    .line 982
    .local v0, "eofe":Ljava/lang/Exception;
    return-void

    .line 985
    .end local v0    # "eofe":Ljava/lang/Exception;
    :cond_9
    add-int/lit8 v0, v19, -0x1

    add-int/2addr v8, v0

    .line 986
    const/16 v0, 0xd

    invoke-direct {v1, v0}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    .line 987
    move v0, v2

    goto :goto_6

    .line 906
    .end local v12    # "entry":I
    .end local v13    # "b1":I
    .end local v14    # "b2":I
    .end local v15    # "code":I
    .end local v16    # "bits":I
    .end local v17    # "height":I
    .end local v19    # "numLinesTested":I
    .local v0, "modeFlag":I
    .local v2, "height":I
    :cond_a
    move/from16 v19, v0

    move/from16 v17, v2

    .line 993
    .end local v2    # "height":I
    .restart local v17    # "height":I
    :goto_6
    iget-object v2, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    add-int/lit8 v6, v4, 0x1

    .end local v4    # "currIndex":I
    .restart local v6    # "currIndex":I
    aput v11, v2, v4

    .line 994
    iput v6, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    move v7, v0

    move v4, v6

    goto :goto_7

    .line 997
    .end local v6    # "currIndex":I
    .end local v7    # "temp":[I
    .end local v9    # "a0":I
    .end local v10    # "isWhite":Z
    .end local v11    # "bitOffset":I
    .end local v17    # "height":I
    .restart local v2    # "height":I
    .restart local v4    # "currIndex":I
    :cond_b
    move/from16 v19, v0

    move/from16 v17, v2

    .end local v0    # "modeFlag":I
    .end local v2    # "height":I
    .restart local v17    # "height":I
    .local v19, "modeFlag":I
    invoke-virtual {v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeNextScanline()V

    move/from16 v7, v19

    .line 1000
    .end local v19    # "modeFlag":I
    .local v7, "modeFlag":I
    :goto_7
    iget v0, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lineBitNum:I

    iget v2, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitsPerScanline:I

    add-int/2addr v0, v2

    iput v0, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lineBitNum:I

    .line 1001
    const/16 v18, 0x1

    add-int/lit8 v8, v8, 0x1

    move/from16 v2, v17

    move/from16 v6, v18

    goto/16 :goto_1

    .line 885
    .end local v17    # "height":I
    .restart local v2    # "height":I
    :catch_2
    move-exception v0

    move/from16 v17, v2

    move/from16 v18, v6

    .line 886
    .end local v2    # "height":I
    .local v0, "eofe":Ljava/lang/Exception;
    .restart local v17    # "height":I
    iget v2, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    .line 887
    goto :goto_8

    .line 879
    .end local v0    # "eofe":Ljava/lang/Exception;
    .end local v17    # "height":I
    .restart local v2    # "height":I
    :cond_c
    move/from16 v17, v2

    .line 1003
    .end local v2    # "height":I
    .restart local v17    # "height":I
    :goto_8
    return-void

    .line 849
    .end local v5    # "next12":I
    .end local v7    # "modeFlag":I
    .end local v8    # "lines":I
    .end local v17    # "height":I
    .restart local v2    # "height":I
    :cond_d
    move/from16 v17, v2

    .end local v2    # "height":I
    .restart local v17    # "height":I
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "Insufficient data to read initial EOL."

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public decodeT6()V
    .locals 23

    .line 1006
    move-object/from16 v1, p0

    iget-object v2, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 1007
    :try_start_0
    iget v0, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->h:I

    .line 1016
    .local v0, "height":I
    const/4 v3, 0x2

    new-array v3, v3, [I

    .line 1023
    .local v3, "b":[I
    iget-object v4, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    .line 1028
    .local v4, "cce":[I
    const/4 v5, 0x0

    iput v5, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    .line 1029
    iget v6, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    add-int/lit8 v7, v6, 0x1

    iput v7, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    iget v7, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    aput v7, v4, v6

    .line 1030
    iget v6, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    add-int/lit8 v7, v6, 0x1

    iput v7, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    iget v7, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    aput v7, v4, v6

    .line 1034
    const/4 v6, 0x0

    .local v6, "lines":I
    :goto_0
    if-ge v6, v0, :cond_18

    .line 1036
    const/4 v7, -0x1

    .line 1037
    .local v7, "a0":I
    const/4 v8, 0x1

    .line 1042
    .local v8, "isWhite":Z
    iget-object v9, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->prevChangingElems:[I

    .line 1043
    .local v9, "temp":[I
    iget-object v10, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    iput-object v10, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->prevChangingElems:[I

    .line 1044
    iput-object v9, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->currChangingElems:[I

    move-object v4, v9

    .line 1045
    const/4 v10, 0x0

    .line 1048
    .local v10, "currIndex":I
    const/4 v11, 0x0

    .line 1051
    .local v11, "bitOffset":I
    iput v5, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lastChangingElement:I

    .line 1054
    :goto_1
    iget v12, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    if-ge v11, v12, :cond_16

    .line 1056
    invoke-direct {v1, v7, v8, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->getNextChangingElement(IZ[I)V

    .line 1057
    aget v12, v3, v5

    .line 1058
    .local v12, "b1":I
    const/4 v13, 0x1

    aget v14, v3, v13

    .line 1061
    .local v14, "b2":I
    const/4 v15, 0x7

    invoke-direct {v1, v15}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextLesserThan8Bits(I)I

    move-result v15

    .line 1063
    .local v15, "entry":I
    sget-object v16, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->twoDCodes:[B

    aget-byte v5, v16, v15

    and-int/lit16 v5, v5, 0xff

    .line 1066
    .end local v15    # "entry":I
    .local v5, "entry":I
    and-int/lit8 v15, v5, 0x78

    const/4 v13, 0x3

    ushr-int/2addr v15, v13

    .line 1067
    .local v15, "code":I
    and-int/lit8 v17, v5, 0x7

    .line 1069
    .local v17, "bits":I
    if-nez v15, :cond_2

    .line 1071
    if-nez v8, :cond_1

    .line 1072
    iget v13, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    if-le v14, v13, :cond_0

    .line 1073
    iget v13, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    move v14, v13

    .line 1075
    :cond_0
    sub-int v13, v14, v11

    invoke-direct {v1, v11, v13}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->setToBlack(II)V

    .line 1077
    :cond_1
    move v7, v14

    move v11, v14

    .line 1080
    rsub-int/lit8 v13, v17, 0x7

    invoke-direct {v1, v13}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    const/4 v5, 0x0

    goto :goto_1

    .line 1081
    :cond_2
    const/4 v13, 0x1

    if-ne v15, v13, :cond_6

    .line 1083
    rsub-int/lit8 v13, v17, 0x7

    invoke-direct {v1, v13}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    .line 1087
    if-eqz v8, :cond_4

    .line 1089
    invoke-direct {v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeWhiteCodeWord()I

    move-result v13

    .line 1090
    .local v13, "number":I
    add-int/2addr v11, v13

    .line 1091
    add-int/lit8 v16, v10, 0x1

    .end local v10    # "currIndex":I
    .local v16, "currIndex":I
    aput v11, v4, v10

    .line 1093
    invoke-direct {v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeBlackCodeWord()I

    move-result v10

    .line 1094
    .end local v13    # "number":I
    .local v10, "number":I
    iget v13, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    sub-int/2addr v13, v11

    if-le v10, v13, :cond_3

    .line 1095
    iget v13, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    sub-int v10, v13, v11

    .line 1097
    :cond_3
    invoke-direct {v1, v11, v10}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->setToBlack(II)V

    .line 1098
    add-int/2addr v11, v10

    .line 1099
    add-int/lit8 v13, v16, 0x1

    .end local v16    # "currIndex":I
    .local v13, "currIndex":I
    aput v11, v4, v16

    move/from16 v19, v0

    goto :goto_2

    .line 1102
    .end local v13    # "currIndex":I
    .local v10, "currIndex":I
    :cond_4
    invoke-direct {v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeBlackCodeWord()I

    move-result v13

    .line 1103
    .local v13, "number":I
    move/from16 v19, v0

    .end local v0    # "height":I
    .local v19, "height":I
    iget v0, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    sub-int/2addr v0, v11

    if-le v13, v0, :cond_5

    .line 1104
    iget v0, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    sub-int v13, v0, v11

    .line 1106
    :cond_5
    invoke-direct {v1, v11, v13}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->setToBlack(II)V

    .line 1107
    add-int/2addr v11, v13

    .line 1108
    add-int/lit8 v0, v10, 0x1

    .end local v10    # "currIndex":I
    .local v0, "currIndex":I
    aput v11, v4, v10

    .line 1110
    invoke-direct {v1}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeWhiteCodeWord()I

    move-result v10

    .line 1111
    .end local v13    # "number":I
    .local v10, "number":I
    add-int/2addr v11, v10

    .line 1112
    add-int/lit8 v13, v0, 0x1

    .end local v0    # "currIndex":I
    .local v13, "currIndex":I
    aput v11, v4, v0

    .line 1115
    :goto_2
    move v7, v11

    .line 1116
    .end local v10    # "number":I
    move v10, v13

    move/from16 v0, v19

    const/4 v5, 0x0

    goto/16 :goto_1

    .end local v13    # "currIndex":I
    .end local v19    # "height":I
    .local v0, "height":I
    .local v10, "currIndex":I
    :cond_6
    move/from16 v19, v0

    .end local v0    # "height":I
    .restart local v19    # "height":I
    const/16 v0, 0x8

    if-gt v15, v0, :cond_a

    .line 1117
    add-int/lit8 v0, v15, -0x5

    add-int/2addr v0, v12

    .line 1118
    .local v0, "a1":I
    add-int/lit8 v13, v10, 0x1

    .end local v10    # "currIndex":I
    .restart local v13    # "currIndex":I
    aput v0, v4, v10

    .line 1122
    if-nez v8, :cond_8

    .line 1123
    iget v10, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    if-le v0, v10, :cond_7

    .line 1124
    iget v10, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    move v0, v10

    .line 1126
    :cond_7
    sub-int v10, v0, v11

    invoke-direct {v1, v11, v10}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->setToBlack(II)V

    .line 1128
    :cond_8
    move v7, v0

    move v11, v0

    .line 1129
    if-nez v8, :cond_9

    const/16 v16, 0x1

    goto :goto_3

    :cond_9
    const/16 v16, 0x0

    :goto_3
    move/from16 v8, v16

    .line 1131
    rsub-int/lit8 v10, v17, 0x7

    invoke-direct {v1, v10}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->updatePointer(I)V

    move v10, v13

    move/from16 v0, v19

    const/4 v5, 0x0

    goto/16 :goto_1

    .line 1132
    .end local v0    # "a1":I
    .end local v13    # "currIndex":I
    .restart local v10    # "currIndex":I
    :cond_a
    const/16 v0, 0xb

    if-ne v15, v0, :cond_15

    .line 1133
    const/4 v0, 0x3

    invoke-direct {v1, v0}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextLesserThan8Bits(I)I

    move-result v0

    .line 1135
    .local v0, "entranceCode":I
    const/4 v13, 0x0

    .line 1136
    .local v13, "zeros":I
    const/16 v18, 0x0

    .line 1138
    .local v18, "exit":Z
    :goto_4
    if-nez v18, :cond_14

    .line 1139
    :goto_5
    move/from16 v20, v0

    move-object/from16 v21, v3

    const/4 v0, 0x1

    .end local v0    # "entranceCode":I
    .end local v3    # "b":[I
    .local v20, "entranceCode":I
    .local v21, "b":[I
    invoke-direct {v1, v0}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextLesserThan8Bits(I)I

    move-result v3

    if-eq v3, v0, :cond_b

    .line 1140
    add-int/lit8 v13, v13, 0x1

    move/from16 v0, v20

    move-object/from16 v3, v21

    goto :goto_5

    .line 1143
    :cond_b
    const/4 v0, 0x5

    if-le v13, v0, :cond_11

    .line 1147
    add-int/lit8 v13, v13, -0x6

    .line 1149
    if-nez v8, :cond_c

    if-lez v13, :cond_c

    .line 1150
    add-int/lit8 v3, v10, 0x1

    .end local v10    # "currIndex":I
    .local v3, "currIndex":I
    aput v11, v4, v10

    move v10, v3

    .line 1154
    .end local v3    # "currIndex":I
    .restart local v10    # "currIndex":I
    :cond_c
    add-int/2addr v11, v13

    .line 1155
    if-lez v13, :cond_d

    .line 1157
    const/4 v8, 0x1

    .line 1162
    :cond_d
    const/4 v3, 0x1

    invoke-direct {v1, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->nextLesserThan8Bits(I)I

    move-result v22

    if-nez v22, :cond_f

    .line 1163
    if-nez v8, :cond_e

    .line 1164
    add-int/lit8 v3, v10, 0x1

    .end local v10    # "currIndex":I
    .restart local v3    # "currIndex":I
    aput v11, v4, v10

    move v10, v3

    .line 1166
    .end local v3    # "currIndex":I
    .restart local v10    # "currIndex":I
    :cond_e
    const/4 v3, 0x1

    move v8, v3

    .end local v8    # "isWhite":Z
    .local v3, "isWhite":Z
    goto :goto_6

    .line 1168
    .end local v3    # "isWhite":Z
    .restart local v8    # "isWhite":Z
    :cond_f
    if-eqz v8, :cond_10

    .line 1169
    add-int/lit8 v3, v10, 0x1

    .end local v10    # "currIndex":I
    .local v3, "currIndex":I
    aput v11, v4, v10

    move v10, v3

    .line 1171
    .end local v3    # "currIndex":I
    .restart local v10    # "currIndex":I
    :cond_10
    const/4 v3, 0x0

    move v8, v3

    .line 1174
    :goto_6
    const/4 v3, 0x1

    move/from16 v18, v3

    .line 1177
    :cond_11
    if-ne v13, v0, :cond_13

    .line 1178
    if-nez v8, :cond_12

    .line 1179
    add-int/lit8 v0, v10, 0x1

    .end local v10    # "currIndex":I
    .local v0, "currIndex":I
    aput v11, v4, v10

    move v10, v0

    .line 1181
    .end local v0    # "currIndex":I
    .restart local v10    # "currIndex":I
    :cond_12
    add-int/2addr v11, v13

    .line 1184
    const/4 v8, 0x1

    move/from16 v0, v20

    move-object/from16 v3, v21

    goto :goto_4

    .line 1186
    :cond_13
    add-int/2addr v11, v13

    .line 1188
    add-int/lit8 v0, v10, 0x1

    .end local v10    # "currIndex":I
    .restart local v0    # "currIndex":I
    aput v11, v4, v10

    .line 1189
    const/4 v3, 0x1

    invoke-direct {v1, v11, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->setToBlack(II)V

    .line 1190
    add-int/lit8 v11, v11, 0x1

    .line 1193
    const/4 v8, 0x0

    move v10, v0

    move/from16 v0, v20

    move-object/from16 v3, v21

    goto :goto_4

    .line 1138
    .end local v20    # "entranceCode":I
    .end local v21    # "b":[I
    .local v0, "entranceCode":I
    .local v3, "b":[I
    .restart local v10    # "currIndex":I
    :cond_14
    move/from16 v20, v0

    move-object/from16 v21, v3

    .line 1197
    .end local v0    # "entranceCode":I
    .end local v3    # "b":[I
    .end local v13    # "zeros":I
    .end local v18    # "exit":Z
    .restart local v21    # "b":[I
    move/from16 v0, v19

    const/4 v5, 0x0

    goto/16 :goto_1

    .line 1132
    .end local v21    # "b":[I
    .restart local v3    # "b":[I
    :cond_15
    move-object/from16 v21, v3

    .end local v3    # "b":[I
    .restart local v21    # "b":[I
    move/from16 v0, v19

    const/4 v5, 0x0

    goto/16 :goto_1

    .line 1202
    .end local v5    # "entry":I
    .end local v12    # "b1":I
    .end local v14    # "b2":I
    .end local v15    # "code":I
    .end local v17    # "bits":I
    .end local v19    # "height":I
    .end local v21    # "b":[I
    .local v0, "height":I
    .restart local v3    # "b":[I
    :cond_16
    move/from16 v19, v0

    move-object/from16 v21, v3

    .end local v0    # "height":I
    .end local v3    # "b":[I
    .restart local v19    # "height":I
    .restart local v21    # "b":[I
    iget v0, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->w:I

    if-gt v10, v0, :cond_17

    .line 1203
    add-int/lit8 v0, v10, 0x1

    .end local v10    # "currIndex":I
    .local v0, "currIndex":I
    aput v11, v4, v10

    move v10, v0

    .line 1206
    .end local v0    # "currIndex":I
    .restart local v10    # "currIndex":I
    :cond_17
    iput v10, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->changingElemSize:I

    .line 1208
    iget v0, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lineBitNum:I

    iget v3, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->bitsPerScanline:I

    add-int/2addr v0, v3

    iput v0, v1, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->lineBitNum:I

    .line 1034
    add-int/lit8 v6, v6, 0x1

    move/from16 v0, v19

    move-object/from16 v3, v21

    const/4 v5, 0x0

    goto/16 :goto_0

    .end local v7    # "a0":I
    .end local v8    # "isWhite":Z
    .end local v9    # "temp":[I
    .end local v10    # "currIndex":I
    .end local v11    # "bitOffset":I
    .end local v19    # "height":I
    .end local v21    # "b":[I
    .local v0, "height":I
    .restart local v3    # "b":[I
    :cond_18
    move/from16 v19, v0

    move-object/from16 v21, v3

    .line 1210
    .end local v0    # "height":I
    .end local v3    # "b":[I
    .end local v4    # "cce":[I
    .end local v6    # "lines":I
    monitor-exit v2

    .line 1211
    return-void

    .line 1210
    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
