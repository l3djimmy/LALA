.class public Lcom/itextpdf/io/codec/TIFFFaxDecoder;
.super Ljava/lang/Object;
.source "TIFFFaxDecoder.java"


# static fields
.field public static additionalMakeup:[S

.field static black:[S

.field public static flipTable:[B

.field static initBlack:[S

.field static table1:[I

.field static table2:[I

.field static twoBitBlack:[S

.field static twoDCodes:[B

.field static white:[S


# instance fields
.field private bitPointer:I

.field private bytePointer:I

.field private changingElemSize:I

.field private compression:I

.field private currChangingElems:[I

.field private data:[B

.field private fillBits:I

.field private fillOrder:I

.field private h:I

.field private lastChangingElement:I

.field private oneD:I

.field private prevChangingElems:[I

.field private recoverFromImageError:Z

.field private uncompressedMode:I

.field private w:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 80
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->table1:[I

    .line 110
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->table2:[I

    .line 141
    const/16 v0, 0x100

    new-array v0, v0, [B

    fill-array-data v0, :array_2

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->flipTable:[B

    .line 177
    const/16 v0, 0x400

    new-array v0, v0, [S

    fill-array-data v0, :array_3

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->white:[S

    .line 444
    const/16 v0, 0x10

    new-array v0, v0, [S

    fill-array-data v0, :array_4

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->additionalMakeup:[S

    .line 452
    const/16 v0, 0x10

    new-array v0, v0, [S

    fill-array-data v0, :array_5

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->initBlack:[S

    .line 460
    const/4 v0, 0x4

    new-array v0, v0, [S

    fill-array-data v0, :array_6

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->twoBitBlack:[S

    .line 463
    const/16 v0, 0x200

    new-array v0, v0, [S

    fill-array-data v0, :array_7

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->black:[S

    .line 594
    const/16 v0, 0x80

    new-array v0, v0, [B

    fill-array-data v0, :array_8

    sput-object v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->twoDCodes:[B

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

.method public constructor <init>(III)V
    .locals 2
    .param p1, "fillOrder"    # I
    .param p2, "w"    # I
    .param p3, "h"    # I

    .line 634
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    .line 68
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->lastChangingElement:I

    .line 70
    const/4 v1, 0x2

    iput v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->compression:I

    .line 73
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->uncompressedMode:I

    .line 74
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->fillBits:I

    .line 635
    iput p1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->fillOrder:I

    .line 636
    iput p2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->w:I

    .line 637
    iput p3, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->h:I

    .line 639
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    .line 640
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    .line 641
    mul-int/lit8 v0, p2, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->prevChangingElems:[I

    .line 642
    mul-int/lit8 v0, p2, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    .line 643
    return-void
.end method

.method private advancePointer()Z
    .locals 2

    .line 1572
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1573
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    .line 1574
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    .line 1577
    :cond_0
    return v1
.end method

.method private decodeBlackCodeWord()I
    .locals 10

    .line 1320
    const/4 v0, -0x1

    .line 1321
    .local v0, "code":I
    const/4 v1, 0x0

    .line 1322
    .local v1, "runLength":I
    const/4 v2, 0x0

    .line 1324
    .local v2, "isWhite":Z
    :cond_0
    :goto_0
    if-nez v2, :cond_5

    .line 1325
    const/4 v3, 0x4

    invoke-direct {p0, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextLesserThan8Bits(I)I

    move-result v4

    .line 1326
    .local v4, "current":I
    sget-object v5, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->initBlack:[S

    aget-short v5, v5, v4

    .line 1329
    .local v5, "entry":I
    and-int/lit8 v6, v5, 0x1

    .line 1330
    .local v6, "isT":I
    ushr-int/lit8 v7, v5, 0x1

    const/16 v8, 0xf

    and-int/2addr v7, v8

    .line 1331
    .local v7, "bits":I
    ushr-int/lit8 v9, v5, 0x5

    and-int/lit16 v0, v9, 0x7ff

    .line 1333
    const/16 v9, 0x64

    if-ne v0, v9, :cond_3

    .line 1334
    const/16 v9, 0x9

    invoke-direct {p0, v9}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextNBits(I)I

    move-result v4

    .line 1335
    sget-object v9, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->black:[S

    aget-short v5, v9, v4

    .line 1338
    and-int/lit8 v6, v5, 0x1

    .line 1339
    ushr-int/lit8 v9, v5, 0x1

    and-int/lit8 v7, v9, 0xf

    .line 1340
    ushr-int/lit8 v9, v5, 0x5

    and-int/lit16 v0, v9, 0x7ff

    .line 1342
    const/16 v9, 0xc

    if-ne v7, v9, :cond_1

    .line 1345
    const/4 v8, 0x5

    invoke-direct {p0, v8}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    .line 1346
    invoke-direct {p0, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextLesserThan8Bits(I)I

    move-result v3

    .line 1347
    .end local v4    # "current":I
    .local v3, "current":I
    sget-object v4, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->additionalMakeup:[S

    aget-short v4, v4, v3

    .line 1350
    .end local v5    # "entry":I
    .local v4, "entry":I
    ushr-int/lit8 v5, v4, 0x1

    and-int/lit8 v5, v5, 0x7

    .line 1353
    .end local v7    # "bits":I
    .local v5, "bits":I
    ushr-int/lit8 v7, v4, 0x4

    and-int/lit16 v0, v7, 0xfff

    .line 1354
    add-int/2addr v1, v0

    .line 1356
    rsub-int/lit8 v7, v5, 0x4

    invoke-direct {p0, v7}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    goto :goto_0

    .line 1357
    .end local v3    # "current":I
    .local v4, "current":I
    .local v5, "entry":I
    .restart local v7    # "bits":I
    :cond_1
    if-eq v7, v8, :cond_2

    .line 1362
    add-int/2addr v1, v0

    .line 1363
    rsub-int/lit8 v3, v7, 0x9

    invoke-direct {p0, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    .line 1364
    if-nez v6, :cond_0

    .line 1365
    const/4 v2, 0x1

    goto :goto_0

    .line 1360
    :cond_2
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v8, "EOL code word encountered in Black run."

    invoke-direct {v3, v8}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1368
    :cond_3
    const/16 v3, 0xc8

    if-ne v0, v3, :cond_4

    .line 1371
    const/4 v3, 0x2

    invoke-direct {p0, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextLesserThan8Bits(I)I

    move-result v3

    .line 1372
    .end local v4    # "current":I
    .restart local v3    # "current":I
    sget-object v4, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->twoBitBlack:[S

    aget-short v4, v4, v3

    .line 1373
    .end local v5    # "entry":I
    .local v4, "entry":I
    ushr-int/lit8 v5, v4, 0x5

    and-int/lit16 v0, v5, 0x7ff

    .line 1374
    add-int/2addr v1, v0

    .line 1375
    ushr-int/lit8 v5, v4, 0x1

    and-int/2addr v5, v8

    .line 1376
    .end local v7    # "bits":I
    .local v5, "bits":I
    rsub-int/lit8 v7, v5, 0x2

    invoke-direct {p0, v7}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    .line 1377
    const/4 v2, 0x1

    goto :goto_0

    .line 1381
    .end local v3    # "current":I
    .local v4, "current":I
    .local v5, "entry":I
    .restart local v7    # "bits":I
    :cond_4
    add-int/2addr v1, v0

    .line 1382
    rsub-int/lit8 v3, v7, 0x4

    invoke-direct {p0, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    .line 1383
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 1387
    .end local v4    # "current":I
    .end local v5    # "entry":I
    .end local v6    # "isT":I
    .end local v7    # "bits":I
    :cond_5
    return v1
.end method

.method private decodeWhiteCodeWord()I
    .locals 10

    .line 1262
    const/4 v0, -0x1

    .line 1263
    .local v0, "code":I
    const/4 v1, 0x0

    .line 1264
    .local v1, "runLength":I
    const/4 v2, 0x1

    .line 1266
    .local v2, "isWhite":Z
    :cond_0
    :goto_0
    if-eqz v2, :cond_5

    .line 1267
    const/16 v3, 0xa

    invoke-direct {p0, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextNBits(I)I

    move-result v3

    .line 1268
    .local v3, "current":I
    sget-object v4, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->white:[S

    aget-short v4, v4, v3

    .line 1271
    .local v4, "entry":I
    and-int/lit8 v5, v4, 0x1

    .line 1272
    .local v5, "isT":I
    ushr-int/lit8 v6, v4, 0x1

    const/16 v7, 0xf

    and-int/2addr v6, v7

    .line 1275
    .local v6, "bits":I
    const/16 v8, 0xc

    if-ne v6, v8, :cond_1

    .line 1278
    const/4 v7, 0x2

    invoke-direct {p0, v7}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextLesserThan8Bits(I)I

    move-result v7

    .line 1281
    .local v7, "twoBits":I
    shl-int/lit8 v9, v3, 0x2

    and-int/2addr v8, v9

    or-int v3, v8, v7

    .line 1282
    sget-object v8, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->additionalMakeup:[S

    aget-short v4, v8, v3

    .line 1285
    ushr-int/lit8 v8, v4, 0x1

    and-int/lit8 v6, v8, 0x7

    .line 1288
    ushr-int/lit8 v8, v4, 0x4

    and-int/lit16 v0, v8, 0xfff

    .line 1289
    add-int/2addr v1, v0

    .line 1290
    rsub-int/lit8 v8, v6, 0x4

    invoke-direct {p0, v8}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    goto :goto_0

    .line 1293
    .end local v7    # "twoBits":I
    :cond_1
    if-eqz v6, :cond_4

    .line 1297
    if-ne v6, v7, :cond_3

    .line 1298
    if-nez v1, :cond_2

    .line 1299
    const/4 v2, 0x0

    goto :goto_0

    .line 1301
    :cond_2
    new-instance v7, Lcom/itextpdf/io/exceptions/IOException;

    const-string v8, "EOL code word encountered in White run."

    invoke-direct {v7, v8}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1306
    :cond_3
    ushr-int/lit8 v7, v4, 0x5

    and-int/lit16 v0, v7, 0x7ff

    .line 1307
    add-int/2addr v1, v0

    .line 1308
    rsub-int/lit8 v7, v6, 0xa

    invoke-direct {p0, v7}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    .line 1309
    if-nez v5, :cond_0

    .line 1310
    const/4 v2, 0x0

    goto :goto_0

    .line 1294
    :cond_4
    new-instance v7, Lcom/itextpdf/io/exceptions/IOException;

    const-string v8, "Invalid code encountered."

    invoke-direct {v7, v8}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1315
    .end local v3    # "current":I
    .end local v4    # "entry":I
    .end local v5    # "isT":I
    .end local v6    # "bits":I
    :cond_5
    return v1
.end method

.method private getNextChangingElement(IZ[I)V
    .locals 7
    .param p1, "a0"    # I
    .param p2, "isWhite"    # Z
    .param p3, "ret"    # [I

    .line 1412
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->prevChangingElems:[I

    .line 1413
    .local v0, "pce":[I
    iget v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    .line 1418
    .local v1, "ces":I
    iget v2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->lastChangingElement:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-lez v2, :cond_0

    iget v2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->lastChangingElement:I

    sub-int/2addr v2, v4

    goto :goto_0

    :cond_0
    move v2, v3

    .line 1419
    .local v2, "start":I
    :goto_0
    if-eqz p2, :cond_1

    .line 1422
    and-int/lit8 v2, v2, -0x2

    goto :goto_1

    .line 1426
    :cond_1
    or-int/2addr v2, v4

    .line 1429
    :goto_1
    move v5, v2

    .line 1430
    .local v5, "i":I
    :goto_2
    if-ge v5, v1, :cond_3

    .line 1431
    aget v6, v0, v5

    .line 1432
    .local v6, "temp":I
    if-le v6, p1, :cond_2

    .line 1433
    iput v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->lastChangingElement:I

    .line 1434
    aput v6, p3, v3

    .line 1435
    goto :goto_3

    .line 1430
    .end local v6    # "temp":I
    :cond_2
    add-int/lit8 v5, v5, 0x2

    goto :goto_2

    .line 1439
    :cond_3
    :goto_3
    add-int/lit8 v3, v5, 0x1

    if-ge v3, v1, :cond_4

    .line 1440
    add-int/lit8 v3, v5, 0x1

    aget v3, v0, v3

    aput v3, p3, v4

    .line 1442
    :cond_4
    return-void
.end method

.method private nextLesserThan8Bits(I)I
    .locals 11
    .param p1, "bitsToGet"    # I

    .line 1513
    const/4 v0, 0x0

    .local v0, "b":B
    const/4 v1, 0x0

    .line 1514
    .local v1, "next":B
    iget-object v2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    array-length v2, v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    .line 1515
    .local v2, "l":I
    iget v4, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    .line 1517
    .local v4, "bp":I
    iget v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->fillOrder:I

    if-ne v5, v3, :cond_1

    .line 1518
    iget-object v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    aget-byte v0, v5, v4

    .line 1519
    if-ne v4, v2, :cond_0

    .line 1520
    const/4 v1, 0x0

    goto :goto_0

    .line 1522
    :cond_0
    iget-object v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    add-int/lit8 v6, v4, 0x1

    aget-byte v1, v5, v6

    goto :goto_0

    .line 1524
    :cond_1
    iget v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->fillOrder:I

    const/4 v6, 0x2

    if-ne v5, v6, :cond_6

    .line 1525
    iget-boolean v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->recoverFromImageError:Z

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    array-length v5, v5

    if-lt v4, v5, :cond_2

    goto :goto_0

    .line 1528
    :cond_2
    sget-object v5, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->flipTable:[B

    iget-object v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    aget-byte v6, v6, v4

    and-int/lit16 v6, v6, 0xff

    aget-byte v0, v5, v6

    .line 1529
    if-ne v4, v2, :cond_3

    .line 1530
    const/4 v1, 0x0

    goto :goto_0

    .line 1532
    :cond_3
    sget-object v5, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->flipTable:[B

    iget-object v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    add-int/lit8 v7, v4, 0x1

    aget-byte v6, v6, v7

    and-int/lit16 v6, v6, 0xff

    aget-byte v1, v5, v6

    .line 1539
    :goto_0
    iget v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    const/16 v6, 0x8

    rsub-int/lit8 v5, v5, 0x8

    .line 1540
    .local v5, "bitsLeft":I
    sub-int v7, p1, v5

    .line 1542
    .local v7, "bitsFromNextByte":I
    sub-int v8, v5, p1

    .line 1544
    .local v8, "shift":I
    if-ltz v8, :cond_4

    .line 1545
    sget-object v9, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->table1:[I

    aget v9, v9, v5

    and-int/2addr v9, v0

    ushr-int/2addr v9, v8

    .line 1546
    .local v9, "i1":I
    iget v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    add-int/2addr v10, p1

    iput v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    .line 1547
    iget v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    if-ne v10, v6, :cond_5

    .line 1548
    const/4 v6, 0x0

    iput v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    .line 1549
    iget v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    add-int/2addr v6, v3

    iput v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    goto :goto_1

    .line 1552
    .end local v9    # "i1":I
    :cond_4
    sget-object v6, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->table1:[I

    aget v6, v6, v5

    and-int/2addr v6, v0

    neg-int v9, v8

    shl-int/2addr v6, v9

    .line 1553
    .local v6, "i1":I
    sget-object v9, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->table2:[I

    aget v9, v9, v7

    and-int/2addr v9, v1

    rsub-int/lit8 v10, v7, 0x8

    ushr-int/2addr v9, v10

    .line 1555
    .local v9, "i2":I
    or-int/2addr v6, v9

    .line 1556
    iget v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    add-int/2addr v10, v3

    iput v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    .line 1557
    iput v7, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    move v9, v6

    .line 1560
    .end local v6    # "i1":I
    .local v9, "i1":I
    :cond_5
    :goto_1
    return v9

    .line 1536
    .end local v5    # "bitsLeft":I
    .end local v7    # "bitsFromNextByte":I
    .end local v8    # "shift":I
    .end local v9    # "i1":I
    :cond_6
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v5, "TIFF_FILL_ORDER tag must be either 1 or 2."

    invoke-direct {v3, v5}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private nextNBits(I)I
    .locals 13
    .param p1, "bitsToGet"    # I

    .line 1446
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    array-length v0, v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 1447
    .local v0, "l":I
    iget v2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    .line 1449
    .local v2, "bp":I
    iget v3, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->fillOrder:I

    if-ne v3, v1, :cond_2

    .line 1450
    iget-object v3, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    aget-byte v3, v3, v2

    .line 1452
    .local v3, "b":B
    if-ne v2, v0, :cond_0

    .line 1453
    const/4 v4, 0x0

    .line 1454
    .local v4, "next":B
    const/4 v5, 0x0

    .local v5, "next2next":B
    goto :goto_0

    .line 1455
    .end local v4    # "next":B
    .end local v5    # "next2next":B
    :cond_0
    add-int/lit8 v4, v2, 0x1

    .line 1459
    iget-object v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    .line 1455
    if-ne v4, v0, :cond_1

    .line 1456
    add-int/lit8 v4, v2, 0x1

    aget-byte v4, v5, v4

    .line 1457
    .restart local v4    # "next":B
    const/4 v5, 0x0

    .restart local v5    # "next2next":B
    goto :goto_0

    .line 1459
    .end local v4    # "next":B
    .end local v5    # "next2next":B
    :cond_1
    add-int/lit8 v4, v2, 0x1

    aget-byte v4, v5, v4

    .line 1460
    .restart local v4    # "next":B
    iget-object v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    add-int/lit8 v6, v2, 0x2

    aget-byte v5, v5, v6

    .restart local v5    # "next2next":B
    goto :goto_0

    .line 1462
    .end local v3    # "b":B
    .end local v4    # "next":B
    .end local v5    # "next2next":B
    :cond_2
    iget v3, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->fillOrder:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_8

    .line 1463
    sget-object v3, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->flipTable:[B

    iget-object v4, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    aget-byte v4, v4, v2

    and-int/lit16 v4, v4, 0xff

    aget-byte v3, v3, v4

    .line 1465
    .restart local v3    # "b":B
    if-ne v2, v0, :cond_3

    .line 1466
    const/4 v4, 0x0

    .line 1467
    .restart local v4    # "next":B
    const/4 v5, 0x0

    .restart local v5    # "next2next":B
    goto :goto_0

    .line 1468
    .end local v4    # "next":B
    .end local v5    # "next2next":B
    :cond_3
    add-int/lit8 v4, v2, 0x1

    .line 1472
    iget-object v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    .line 1468
    if-ne v4, v0, :cond_4

    .line 1469
    sget-object v4, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->flipTable:[B

    add-int/lit8 v6, v2, 0x1

    aget-byte v5, v5, v6

    and-int/lit16 v5, v5, 0xff

    aget-byte v4, v4, v5

    .line 1470
    .restart local v4    # "next":B
    const/4 v5, 0x0

    .restart local v5    # "next2next":B
    goto :goto_0

    .line 1472
    .end local v4    # "next":B
    .end local v5    # "next2next":B
    :cond_4
    sget-object v4, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->flipTable:[B

    add-int/lit8 v6, v2, 0x1

    aget-byte v5, v5, v6

    and-int/lit16 v5, v5, 0xff

    aget-byte v4, v4, v5

    .line 1473
    .restart local v4    # "next":B
    sget-object v5, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->flipTable:[B

    iget-object v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    add-int/lit8 v7, v2, 0x2

    aget-byte v6, v6, v7

    and-int/lit16 v6, v6, 0xff

    aget-byte v5, v5, v6

    .line 1479
    .restart local v5    # "next2next":B
    :goto_0
    iget v6, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    const/16 v7, 0x8

    rsub-int/lit8 v6, v6, 0x8

    .line 1480
    .local v6, "bitsLeft":I
    sub-int v8, p1, v6

    .line 1481
    .local v8, "bitsFromNextByte":I
    const/4 v9, 0x0

    .line 1482
    .local v9, "bitsFromNext2NextByte":I
    if-le v8, v7, :cond_5

    .line 1483
    add-int/lit8 v9, v8, -0x8

    .line 1484
    const/16 v8, 0x8

    .line 1487
    :cond_5
    iget v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    add-int/2addr v10, v1

    iput v10, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    .line 1489
    sget-object v10, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->table1:[I

    aget v10, v10, v6

    and-int/2addr v10, v3

    sub-int v11, p1, v6

    shl-int/2addr v10, v11

    .line 1490
    .local v10, "i1":I
    sget-object v11, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->table2:[I

    aget v11, v11, v8

    and-int/2addr v11, v4

    rsub-int/lit8 v12, v8, 0x8

    ushr-int/2addr v11, v12

    .line 1493
    .local v11, "i2":I
    if-eqz v9, :cond_6

    .line 1494
    shl-int v7, v11, v9

    .line 1495
    .end local v11    # "i2":I
    .local v7, "i2":I
    sget-object v11, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->table2:[I

    aget v11, v11, v9

    and-int/2addr v11, v5

    rsub-int/lit8 v12, v9, 0x8

    ushr-int/2addr v11, v12

    .line 1497
    .local v11, "i3":I
    or-int/2addr v7, v11

    .line 1498
    iget v12, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    add-int/2addr v12, v1

    iput v12, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    .line 1499
    iput v9, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    move v11, v7

    goto :goto_1

    .line 1501
    .end local v7    # "i2":I
    .local v11, "i2":I
    :cond_6
    if-ne v8, v7, :cond_7

    .line 1502
    const/4 v7, 0x0

    iput v7, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    .line 1503
    iget v7, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    add-int/2addr v7, v1

    iput v7, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    goto :goto_1

    .line 1505
    :cond_7
    iput v8, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    .line 1509
    :goto_1
    or-int v1, v10, v11

    return v1

    .line 1476
    .end local v3    # "b":B
    .end local v4    # "next":B
    .end local v5    # "next2next":B
    .end local v6    # "bitsLeft":I
    .end local v8    # "bitsFromNextByte":I
    .end local v9    # "bitsFromNext2NextByte":I
    .end local v10    # "i1":I
    .end local v11    # "i2":I
    :cond_8
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "TIFF_FILL_ORDER tag must be either 1 or 2."

    invoke-direct {v1, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private readEOL()I
    .locals 3

    .line 1392
    :goto_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextLesserThan8Bits(I)I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1395
    :cond_0
    const/16 v1, 0xc

    invoke-direct {p0, v1}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    .line 1396
    invoke-direct {p0, v1}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextNBits(I)I

    move-result v1

    .line 1397
    .local v1, "next12Bits":I
    if-ne v1, v0, :cond_2

    .line 1401
    iget v2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->oneD:I

    if-nez v2, :cond_1

    .line 1402
    return v0

    .line 1406
    :cond_1
    invoke-direct {p0, v0}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextLesserThan8Bits(I)I

    move-result v0

    return v0

    .line 1398
    :cond_2
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "All fill bits preceding eol code must be 0."

    invoke-direct {v0, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static reverseBits([B)V
    .locals 3
    .param p0, "b"    # [B

    .line 651
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 652
    sget-object v1, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->flipTable:[B

    aget-byte v2, p0, v0

    and-int/lit16 v2, v2, 0xff

    aget-byte v1, v1, v2

    aput-byte v1, p0, v0

    .line 651
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 653
    .end local v0    # "k":I
    :cond_0
    return-void
.end method

.method private setToBlack([BIII)V
    .locals 8
    .param p1, "buffer"    # [B
    .param p2, "lineOffset"    # I
    .param p3, "bitOffset"    # I
    .param p4, "numBits"    # I

    .line 1223
    mul-int/lit8 v0, p2, 0x8

    add-int/2addr v0, p3

    .line 1224
    .local v0, "bitNum":I
    add-int v1, v0, p4

    .line 1226
    .local v1, "lastBit":I
    shr-int/lit8 v2, v0, 0x3

    .line 1229
    .local v2, "byteNum":I
    and-int/lit8 v3, v0, 0x7

    .line 1230
    .local v3, "shift":I
    const/4 v4, 0x1

    if-lez v3, :cond_1

    .line 1231
    rsub-int/lit8 v5, v3, 0x7

    shl-int v5, v4, v5

    .line 1232
    .local v5, "maskVal":I
    aget-byte v6, p1, v2

    .line 1233
    .local v6, "val":B
    :goto_0
    if-lez v5, :cond_0

    if-ge v0, v1, :cond_0

    .line 1234
    int-to-byte v7, v5

    or-int/2addr v7, v6

    int-to-byte v6, v7

    .line 1235
    shr-int/lit8 v5, v5, 0x1

    .line 1236
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1238
    :cond_0
    aput-byte v6, p1, v2

    .line 1242
    .end local v5    # "maskVal":I
    .end local v6    # "val":B
    :cond_1
    shr-int/lit8 v2, v0, 0x3

    .line 1243
    :goto_1
    add-int/lit8 v5, v1, -0x7

    if-ge v0, v5, :cond_2

    .line 1244
    add-int/lit8 v5, v2, 0x1

    .end local v2    # "byteNum":I
    .local v5, "byteNum":I
    const/4 v6, -0x1

    aput-byte v6, p1, v2

    .line 1245
    add-int/lit8 v0, v0, 0x8

    move v2, v5

    goto :goto_1

    .line 1249
    .end local v5    # "byteNum":I
    .restart local v2    # "byteNum":I
    :cond_2
    :goto_2
    if-ge v0, v1, :cond_4

    .line 1250
    shr-int/lit8 v2, v0, 0x3

    .line 1251
    iget-boolean v5, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->recoverFromImageError:Z

    if-eqz v5, :cond_3

    array-length v5, p1

    if-lt v2, v5, :cond_3

    goto :goto_3

    .line 1254
    :cond_3
    aget-byte v5, p1, v2

    and-int/lit8 v6, v0, 0x7

    rsub-int/lit8 v6, v6, 0x7

    shl-int v6, v4, v6

    int-to-byte v6, v6

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, p1, v2

    .line 1256
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1258
    :cond_4
    return-void
.end method

.method private updatePointer(I)V
    .locals 2
    .param p1, "bitsToMoveBack"    # I

    .line 1565
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    mul-int/lit8 v0, v0, 0x8

    iget v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    add-int/2addr v0, v1

    sub-int/2addr v0, p1

    .line 1566
    .local v0, "totalBits":I
    rem-int/lit8 v1, v0, 0x8

    iput v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    .line 1567
    div-int/lit8 v1, v0, 0x8

    iput v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    .line 1568
    return-void
.end method


# virtual methods
.method public decode1D([B[BII)V
    .locals 3
    .param p1, "buffer"    # [B
    .param p2, "compData"    # [B
    .param p3, "startX"    # I
    .param p4, "height"    # I

    .line 658
    iput-object p2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    .line 660
    const/4 v0, 0x0

    .line 661
    .local v0, "lineOffset":I
    iget v1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->w:I

    add-int/lit8 v1, v1, 0x7

    div-int/lit8 v1, v1, 0x8

    .line 663
    .local v1, "scanlineStride":I
    const/4 v2, 0x0

    iput v2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    .line 664
    iput v2, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    .line 666
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, p4, :cond_0

    .line 667
    invoke-virtual {p0, p1, v0, p3}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decodeNextScanline([BII)V

    .line 668
    add-int/2addr v0, v1

    .line 666
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 670
    .end local v2    # "i":I
    :cond_0
    return-void
.end method

.method public decode2D([B[BIIJ)V
    .locals 25
    .param p1, "buffer"    # [B
    .param p2, "compData"    # [B
    .param p3, "startX"    # I
    .param p4, "height"    # I
    .param p5, "tiffT4Options"    # J

    .line 830
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    move-object/from16 v3, p2

    iput-object v3, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    .line 831
    const/4 v4, 0x3

    iput v4, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->compression:I

    .line 833
    const/4 v5, 0x0

    iput v5, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    .line 834
    iput v5, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    .line 836
    iget v6, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->w:I

    const/4 v7, 0x7

    add-int/2addr v6, v7

    const/16 v8, 0x8

    div-int/2addr v6, v8

    .line 839
    .local v6, "scanlineStride":I
    const/4 v9, 0x2

    new-array v10, v9, [I

    .line 851
    .local v10, "b":[I
    const-wide/16 v11, 0x1

    and-long v11, p5, v11

    long-to-int v11, v11

    iput v11, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->oneD:I

    .line 852
    const-wide/16 v11, 0x2

    and-long v11, p5, v11

    const/4 v13, 0x1

    shr-long/2addr v11, v13

    long-to-int v11, v11

    iput v11, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->uncompressedMode:I

    .line 853
    const-wide/16 v11, 0x4

    and-long v11, p5, v11

    shr-long/2addr v11, v9

    long-to-int v9, v11

    iput v9, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->fillBits:I

    .line 856
    invoke-direct {v0}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->readEOL()I

    move-result v9

    if-ne v9, v13, :cond_a

    .line 860
    const/4 v9, 0x0

    .line 865
    .local v9, "lineOffset":I
    invoke-virtual {v0, v1, v9, v2}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decodeNextScanline([BII)V

    .line 866
    add-int/2addr v9, v6

    .line 868
    const/4 v11, 0x1

    .local v11, "lines":I
    :goto_0
    move/from16 v12, p4

    if-ge v11, v12, :cond_9

    .line 872
    invoke-direct {v0}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->readEOL()I

    move-result v14

    if-nez v14, :cond_8

    .line 877
    iget-object v14, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->prevChangingElems:[I

    .line 878
    .local v14, "temp":[I
    iget-object v15, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    iput-object v15, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->prevChangingElems:[I

    .line 879
    iput-object v14, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    .line 880
    const/4 v15, 0x0

    .line 883
    .local v15, "currIndex":I
    const/16 v16, -0x1

    .line 884
    .local v16, "a0":I
    const/16 v17, 0x1

    .line 885
    .local v17, "isWhite":Z
    move/from16 v18, p3

    .line 887
    .local v18, "bitOffset":I
    iput v5, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->lastChangingElement:I

    move/from16 v8, v16

    move/from16 v16, v4

    move v4, v8

    move/from16 v8, v17

    move/from16 v17, v5

    move v5, v8

    move/from16 v8, v18

    .line 889
    .end local v16    # "a0":I
    .end local v17    # "isWhite":Z
    .end local v18    # "bitOffset":I
    .local v4, "a0":I
    .local v5, "isWhite":Z
    .local v8, "bitOffset":I
    :goto_1
    move/from16 v19, v13

    iget v13, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->w:I

    if-ge v8, v13, :cond_7

    .line 891
    invoke-direct {v0, v4, v5, v10}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->getNextChangingElement(IZ[I)V

    .line 893
    aget v13, v10, v17

    .line 894
    .local v13, "b1":I
    aget v20, v10, v19

    .line 897
    .local v20, "b2":I
    invoke-direct {v0, v7}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextLesserThan8Bits(I)I

    move-result v21

    .line 900
    .local v21, "entry":I
    sget-object v22, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->twoDCodes:[B

    aget-byte v7, v22, v21

    and-int/lit16 v7, v7, 0xff

    .line 903
    .end local v21    # "entry":I
    .local v7, "entry":I
    and-int/lit8 v21, v7, 0x78

    ushr-int/lit8 v3, v21, 0x3

    .line 904
    .local v3, "code":I
    and-int/lit8 v21, v7, 0x7

    .line 906
    .local v21, "bits":I
    if-nez v3, :cond_1

    .line 907
    if-nez v5, :cond_0

    .line 908
    move/from16 v22, v4

    .end local v4    # "a0":I
    .local v22, "a0":I
    sub-int v4, v20, v8

    invoke-direct {v0, v1, v9, v8, v4}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->setToBlack([BIII)V

    goto :goto_2

    .line 907
    .end local v22    # "a0":I
    .restart local v4    # "a0":I
    :cond_0
    move/from16 v22, v4

    .line 911
    .end local v4    # "a0":I
    .restart local v22    # "a0":I
    :goto_2
    move/from16 v4, v20

    .end local v22    # "a0":I
    .restart local v4    # "a0":I
    move/from16 v8, v20

    .line 914
    move/from16 v22, v4

    .end local v4    # "a0":I
    .restart local v22    # "a0":I
    rsub-int/lit8 v4, v21, 0x7

    invoke-direct {v0, v4}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    move-object/from16 v3, p2

    move/from16 v13, v19

    move/from16 v4, v22

    const/4 v7, 0x7

    goto :goto_1

    .line 915
    .end local v22    # "a0":I
    .restart local v4    # "a0":I
    :cond_1
    move/from16 v22, v4

    .end local v4    # "a0":I
    .restart local v22    # "a0":I
    move/from16 v4, v19

    if-ne v3, v4, :cond_3

    .line 917
    rsub-int/lit8 v4, v21, 0x7

    invoke-direct {v0, v4}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    .line 921
    if-eqz v5, :cond_2

    .line 922
    invoke-direct {v0}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decodeWhiteCodeWord()I

    move-result v4

    .line 923
    .local v4, "number":I
    add-int/2addr v8, v4

    .line 924
    move/from16 v23, v4

    .end local v4    # "number":I
    .local v23, "number":I
    iget-object v4, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    add-int/lit8 v24, v15, 0x1

    .end local v15    # "currIndex":I
    .local v24, "currIndex":I
    aput v8, v4, v15

    .line 926
    invoke-direct {v0}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decodeBlackCodeWord()I

    move-result v4

    .line 927
    .end local v23    # "number":I
    .restart local v4    # "number":I
    invoke-direct {v0, v1, v9, v8, v4}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->setToBlack([BIII)V

    .line 928
    add-int/2addr v8, v4

    .line 929
    iget-object v15, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    add-int/lit8 v23, v24, 0x1

    .end local v24    # "currIndex":I
    .local v23, "currIndex":I
    aput v8, v15, v24

    move/from16 v15, v23

    goto :goto_3

    .line 931
    .end local v4    # "number":I
    .end local v23    # "currIndex":I
    .restart local v15    # "currIndex":I
    :cond_2
    invoke-direct {v0}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decodeBlackCodeWord()I

    move-result v4

    .line 932
    .restart local v4    # "number":I
    invoke-direct {v0, v1, v9, v8, v4}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->setToBlack([BIII)V

    .line 933
    add-int/2addr v8, v4

    .line 934
    move/from16 v23, v4

    .end local v4    # "number":I
    .local v23, "number":I
    iget-object v4, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    add-int/lit8 v24, v15, 0x1

    .end local v15    # "currIndex":I
    .restart local v24    # "currIndex":I
    aput v8, v4, v15

    .line 936
    invoke-direct {v0}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decodeWhiteCodeWord()I

    move-result v4

    .line 937
    .end local v23    # "number":I
    .restart local v4    # "number":I
    add-int/2addr v8, v4

    .line 938
    iget-object v15, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    add-int/lit8 v23, v24, 0x1

    .end local v24    # "currIndex":I
    .local v23, "currIndex":I
    aput v8, v15, v24

    move/from16 v15, v23

    .line 941
    .end local v23    # "currIndex":I
    .restart local v15    # "currIndex":I
    :goto_3
    move v4, v8

    .line 942
    .end local v22    # "a0":I
    .local v4, "a0":I
    move-object/from16 v3, p2

    const/4 v7, 0x7

    const/4 v13, 0x1

    goto/16 :goto_1

    .end local v4    # "a0":I
    .restart local v22    # "a0":I
    :cond_3
    const/16 v4, 0x8

    if-gt v3, v4, :cond_6

    .line 944
    add-int/lit8 v18, v3, -0x5

    add-int v18, v13, v18

    .line 946
    .local v18, "a1":I
    iget-object v4, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    add-int/lit8 v24, v15, 0x1

    .end local v15    # "currIndex":I
    .restart local v24    # "currIndex":I
    aput v18, v4, v15

    .line 950
    if-nez v5, :cond_4

    .line 951
    sub-int v4, v18, v8

    invoke-direct {v0, v1, v9, v8, v4}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->setToBlack([BIII)V

    .line 954
    :cond_4
    move/from16 v4, v18

    .end local v22    # "a0":I
    .restart local v4    # "a0":I
    move/from16 v8, v18

    .line 955
    if-nez v5, :cond_5

    const/4 v15, 0x1

    goto :goto_4

    :cond_5
    move/from16 v15, v17

    :goto_4
    move v5, v15

    .line 957
    rsub-int/lit8 v15, v21, 0x7

    invoke-direct {v0, v15}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    move-object/from16 v3, p2

    move/from16 v15, v24

    const/4 v7, 0x7

    const/4 v13, 0x1

    goto/16 :goto_1

    .line 959
    .end local v4    # "a0":I
    .end local v18    # "a1":I
    .end local v24    # "currIndex":I
    .restart local v15    # "currIndex":I
    .restart local v22    # "a0":I
    :cond_6
    new-instance v4, Lcom/itextpdf/io/exceptions/IOException;

    move/from16 v18, v3

    .end local v3    # "code":I
    .local v18, "code":I
    const-string v3, "Invalid code encountered while decoding 2D group 3 compressed data."

    invoke-direct {v4, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 965
    .end local v7    # "entry":I
    .end local v13    # "b1":I
    .end local v18    # "code":I
    .end local v20    # "b2":I
    .end local v21    # "bits":I
    .end local v22    # "a0":I
    .restart local v4    # "a0":I
    :cond_7
    move/from16 v22, v4

    .end local v4    # "a0":I
    .restart local v22    # "a0":I
    iget-object v3, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    add-int/lit8 v4, v15, 0x1

    .end local v15    # "currIndex":I
    .local v4, "currIndex":I
    aput v8, v3, v15

    .line 966
    iput v4, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    goto :goto_5

    .line 969
    .end local v4    # "currIndex":I
    .end local v5    # "isWhite":Z
    .end local v8    # "bitOffset":I
    .end local v14    # "temp":[I
    .end local v22    # "a0":I
    :cond_8
    move/from16 v16, v4

    move/from16 v17, v5

    invoke-virtual {v0, v1, v9, v2}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decodeNextScanline([BII)V

    .line 972
    :goto_5
    add-int/2addr v9, v6

    .line 868
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v3, p2

    move/from16 v4, v16

    move/from16 v5, v17

    const/4 v7, 0x7

    const/16 v8, 0x8

    const/4 v13, 0x1

    goto/16 :goto_0

    .line 974
    .end local v11    # "lines":I
    :cond_9
    return-void

    .line 857
    .end local v9    # "lineOffset":I
    :cond_a
    move/from16 v12, p4

    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "First scanline must be 1D encoded."

    invoke-direct {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public decodeNextScanline([BII)V
    .locals 16
    .param p1, "buffer"    # [B
    .param p2, "lineOffset"    # I
    .param p3, "bitOffset"    # I

    .line 674
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    const/4 v3, 0x1

    .line 677
    .local v3, "isWhite":Z
    const/4 v4, 0x0

    iput v4, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    move v4, v3

    move/from16 v3, p3

    .line 680
    .end local p3    # "bitOffset":I
    .local v3, "bitOffset":I
    .local v4, "isWhite":Z
    :cond_0
    iget v5, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->w:I

    if-ge v3, v5, :cond_d

    .line 681
    :cond_1
    :goto_0
    const-string v5, "EOL code word encountered in White run."

    const/16 v6, 0xc

    const/4 v7, 0x2

    const/16 v8, 0xf

    if-eqz v4, :cond_5

    .line 683
    const/16 v9, 0xa

    invoke-direct {v0, v9}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextNBits(I)I

    move-result v9

    .line 684
    .local v9, "current":I
    sget-object v10, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->white:[S

    aget-short v10, v10, v9

    .line 687
    .local v10, "entry":I
    and-int/lit8 v11, v10, 0x1

    .line 688
    .local v11, "isT":I
    ushr-int/lit8 v12, v10, 0x1

    and-int/2addr v12, v8

    .line 691
    .local v12, "bits":I
    if-ne v12, v6, :cond_2

    .line 694
    invoke-direct {v0, v7}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextLesserThan8Bits(I)I

    move-result v5

    .line 697
    .local v5, "twoBits":I
    shl-int/lit8 v7, v9, 0x2

    and-int/2addr v6, v7

    or-int/2addr v6, v5

    .line 698
    .end local v9    # "current":I
    .local v6, "current":I
    sget-object v7, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->additionalMakeup:[S

    aget-short v7, v7, v6

    .line 701
    .end local v10    # "entry":I
    .local v7, "entry":I
    ushr-int/lit8 v8, v7, 0x1

    and-int/lit8 v8, v8, 0x7

    .line 704
    .end local v12    # "bits":I
    .local v8, "bits":I
    ushr-int/lit8 v9, v7, 0x4

    and-int/lit16 v9, v9, 0xfff

    .line 707
    .local v9, "code":I
    add-int/2addr v3, v9

    .line 709
    rsub-int/lit8 v10, v8, 0x4

    invoke-direct {v0, v10}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    goto :goto_0

    .line 712
    .end local v5    # "twoBits":I
    .end local v6    # "current":I
    .end local v7    # "entry":I
    .end local v8    # "bits":I
    .local v9, "current":I
    .restart local v10    # "entry":I
    .restart local v12    # "bits":I
    :cond_2
    if-eqz v12, :cond_4

    .line 716
    if-eq v12, v8, :cond_3

    .line 721
    ushr-int/lit8 v5, v10, 0x5

    and-int/lit16 v5, v5, 0x7ff

    .line 722
    .local v5, "code":I
    add-int/2addr v3, v5

    .line 724
    rsub-int/lit8 v6, v12, 0xa

    invoke-direct {v0, v6}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    .line 725
    if-nez v11, :cond_1

    .line 726
    const/4 v4, 0x0

    .line 727
    iget-object v6, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    iget v7, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    add-int/lit8 v8, v7, 0x1

    iput v8, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    aput v3, v6, v7

    goto :goto_0

    .line 717
    .end local v5    # "code":I
    :cond_3
    new-instance v6, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v6, v5}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 713
    :cond_4
    new-instance v5, Lcom/itextpdf/io/exceptions/IOException;

    const-string v6, "Invalid code encountered."

    invoke-direct {v5, v6}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 734
    .end local v9    # "current":I
    .end local v10    # "entry":I
    .end local v11    # "isT":I
    .end local v12    # "bits":I
    :cond_5
    iget v9, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->w:I

    if-ne v3, v9, :cond_6

    .line 735
    iget v5, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->compression:I

    if-ne v5, v7, :cond_d

    .line 736
    invoke-direct {v0}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->advancePointer()Z

    goto/16 :goto_2

    .line 741
    :cond_6
    :goto_1
    if-nez v4, :cond_c

    .line 743
    const/4 v9, 0x4

    invoke-direct {v0, v9}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextLesserThan8Bits(I)I

    move-result v10

    .line 744
    .local v10, "current":I
    sget-object v11, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->initBlack:[S

    aget-short v11, v11, v10

    .line 747
    .local v11, "entry":I
    ushr-int/lit8 v12, v11, 0x1

    and-int/2addr v12, v8

    .line 748
    .restart local v12    # "bits":I
    ushr-int/lit8 v13, v11, 0x5

    and-int/lit16 v13, v13, 0x7ff

    .line 750
    .local v13, "code":I
    const/16 v14, 0x64

    if-ne v13, v14, :cond_a

    .line 751
    const/16 v14, 0x9

    invoke-direct {v0, v14}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextNBits(I)I

    move-result v10

    .line 752
    sget-object v14, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->black:[S

    aget-short v11, v14, v10

    .line 755
    and-int/lit8 v14, v11, 0x1

    .line 756
    .local v14, "isT":I
    ushr-int/lit8 v15, v11, 0x1

    and-int/lit8 v12, v15, 0xf

    .line 757
    ushr-int/lit8 v15, v11, 0x5

    and-int/lit16 v13, v15, 0x7ff

    .line 759
    if-ne v12, v6, :cond_7

    .line 761
    const/4 v15, 0x5

    invoke-direct {v0, v15}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    .line 762
    invoke-direct {v0, v9}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextLesserThan8Bits(I)I

    move-result v9

    .line 763
    .end local v10    # "current":I
    .restart local v9    # "current":I
    sget-object v10, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->additionalMakeup:[S

    aget-short v10, v10, v9

    .line 766
    .end local v11    # "entry":I
    .local v10, "entry":I
    ushr-int/lit8 v11, v10, 0x1

    and-int/lit8 v11, v11, 0x7

    .line 769
    .end local v12    # "bits":I
    .local v11, "bits":I
    ushr-int/lit8 v12, v10, 0x4

    and-int/lit16 v12, v12, 0xfff

    .line 771
    .end local v13    # "code":I
    .local v12, "code":I
    invoke-direct {v0, v1, v2, v3, v12}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->setToBlack([BIII)V

    .line 772
    add-int/2addr v3, v12

    .line 774
    rsub-int/lit8 v13, v11, 0x4

    invoke-direct {v0, v13}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    goto :goto_1

    .line 775
    .end local v9    # "current":I
    .local v10, "current":I
    .local v11, "entry":I
    .local v12, "bits":I
    .restart local v13    # "code":I
    :cond_7
    if-eq v12, v8, :cond_9

    .line 780
    invoke-direct {v0, v1, v2, v3, v13}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->setToBlack([BIII)V

    .line 781
    add-int/2addr v3, v13

    .line 783
    rsub-int/lit8 v9, v12, 0x9

    invoke-direct {v0, v9}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    .line 784
    if-nez v14, :cond_8

    .line 785
    const/4 v4, 0x1

    .line 786
    iget-object v9, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    iget v15, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    add-int/lit8 v6, v15, 0x1

    iput v6, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    aput v3, v9, v15

    const/16 v6, 0xc

    goto :goto_1

    .line 784
    :cond_8
    const/16 v6, 0xc

    goto :goto_1

    .line 778
    :cond_9
    new-instance v6, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v6, v5}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 789
    .end local v14    # "isT":I
    :cond_a
    const/16 v6, 0xc8

    if-ne v13, v6, :cond_b

    .line 792
    invoke-direct {v0, v7}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextLesserThan8Bits(I)I

    move-result v6

    .line 793
    .end local v10    # "current":I
    .restart local v6    # "current":I
    sget-object v9, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->twoBitBlack:[S

    aget-short v9, v9, v6

    .line 794
    .end local v11    # "entry":I
    .local v9, "entry":I
    ushr-int/lit8 v10, v9, 0x5

    and-int/lit16 v10, v10, 0x7ff

    .line 795
    .end local v13    # "code":I
    .local v10, "code":I
    ushr-int/lit8 v11, v9, 0x1

    and-int/2addr v11, v8

    .line 797
    .end local v12    # "bits":I
    .local v11, "bits":I
    invoke-direct {v0, v1, v2, v3, v10}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->setToBlack([BIII)V

    .line 798
    add-int/2addr v3, v10

    .line 800
    rsub-int/lit8 v12, v11, 0x2

    invoke-direct {v0, v12}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    .line 801
    const/4 v4, 0x1

    .line 802
    iget-object v12, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    iget v13, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    add-int/lit8 v14, v13, 0x1

    iput v14, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    aput v3, v12, v13

    const/16 v6, 0xc

    goto/16 :goto_1

    .line 806
    .end local v6    # "current":I
    .end local v9    # "entry":I
    .local v10, "current":I
    .local v11, "entry":I
    .restart local v12    # "bits":I
    .restart local v13    # "code":I
    :cond_b
    invoke-direct {v0, v1, v2, v3, v13}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->setToBlack([BIII)V

    .line 807
    add-int/2addr v3, v13

    .line 809
    rsub-int/lit8 v6, v12, 0x4

    invoke-direct {v0, v6}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    .line 810
    const/4 v4, 0x1

    .line 811
    iget-object v6, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    iget v9, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    add-int/lit8 v14, v9, 0x1

    iput v14, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    aput v3, v6, v9

    const/16 v6, 0xc

    goto/16 :goto_1

    .line 816
    .end local v10    # "current":I
    .end local v11    # "entry":I
    .end local v12    # "bits":I
    .end local v13    # "code":I
    :cond_c
    iget v5, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->w:I

    if-ne v3, v5, :cond_0

    .line 817
    iget v5, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->compression:I

    if-ne v5, v7, :cond_d

    .line 818
    invoke-direct {v0}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->advancePointer()Z

    .line 824
    :cond_d
    :goto_2
    iget-object v5, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    iget v6, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    add-int/lit8 v7, v6, 0x1

    iput v7, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    aput v3, v5, v6

    .line 825
    return-void
.end method

.method public decodeT6([B[BIIJ)V
    .locals 26
    .param p1, "buffer"    # [B
    .param p2, "compData"    # [B
    .param p3, "startX"    # I
    .param p4, "height"    # I
    .param p5, "tiffT6Options"    # J

    .line 981
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iput-object v2, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    .line 982
    const/4 v3, 0x4

    iput v3, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->compression:I

    .line 984
    const/4 v3, 0x0

    iput v3, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    .line 985
    iput v3, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    .line 987
    iget v4, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->w:I

    const/4 v5, 0x7

    add-int/2addr v4, v5

    const/16 v6, 0x8

    div-int/2addr v4, v6

    .line 996
    .local v4, "scanlineStride":I
    const/4 v7, 0x2

    new-array v8, v7, [I

    .line 1001
    .local v8, "b":[I
    const-wide/16 v9, 0x2

    and-long v9, p5, v9

    const/4 v11, 0x1

    shr-long/2addr v9, v11

    long-to-int v9, v9

    iput v9, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->uncompressedMode:I

    .line 1002
    const-wide/16 v9, 0x4

    and-long v9, p5, v9

    shr-long/2addr v9, v7

    long-to-int v7, v9

    iput v7, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->fillBits:I

    .line 1005
    iget-object v7, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    .line 1010
    .local v7, "cce":[I
    iput v3, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    .line 1011
    iget v9, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    iget v10, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->w:I

    aput v10, v7, v9

    .line 1012
    iget v9, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    iget v10, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->w:I

    aput v10, v7, v9

    .line 1014
    const/4 v9, 0x0

    .line 1017
    .local v9, "lineOffset":I
    const/4 v10, 0x0

    .local v10, "lines":I
    :goto_0
    move/from16 v12, p4

    if-ge v10, v12, :cond_18

    .line 1019
    const/4 v13, -0x1

    .line 1020
    .local v13, "a0":I
    const/4 v14, 0x1

    .line 1025
    .local v14, "isWhite":Z
    iget-object v15, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->prevChangingElems:[I

    .line 1026
    .local v15, "temp":[I
    move/from16 v16, v6

    iget-object v6, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    iput-object v6, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->prevChangingElems:[I

    .line 1027
    iput-object v15, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->currChangingElems:[I

    move-object v7, v15

    .line 1028
    const/4 v6, 0x0

    .line 1031
    .local v6, "currIndex":I
    move/from16 v17, p3

    .line 1033
    .local v17, "bitOffset":I
    iget v5, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->fillBits:I

    if-ne v5, v11, :cond_1

    .line 1036
    iget v5, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    if-lez v5, :cond_1

    .line 1037
    iget v5, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bitPointer:I

    rsub-int/lit8 v5, v5, 0x8

    .line 1038
    .local v5, "bitsLeft":I
    invoke-direct {v0, v5}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextNBits(I)I

    move-result v19

    if-nez v19, :cond_0

    goto :goto_1

    .line 1039
    :cond_0
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v11, "Expected trailing zero bits for byte-aligned lines"

    invoke-direct {v3, v11}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1045
    .end local v5    # "bitsLeft":I
    :cond_1
    :goto_1
    iput v3, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->lastChangingElement:I

    move/from16 v5, v17

    .line 1049
    .end local v17    # "bitOffset":I
    .local v5, "bitOffset":I
    :goto_2
    move/from16 v17, v3

    iget v3, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->w:I

    if-ge v5, v3, :cond_16

    iget v3, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->bytePointer:I

    move/from16 v19, v11

    iget-object v11, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->data:[B

    array-length v11, v11

    add-int/lit8 v11, v11, -0x1

    if-ge v3, v11, :cond_15

    .line 1052
    invoke-direct {v0, v13, v14, v8}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->getNextChangingElement(IZ[I)V

    .line 1053
    aget v3, v8, v17

    .line 1054
    .local v3, "b1":I
    aget v11, v8, v19

    .line 1057
    .local v11, "b2":I
    const/4 v2, 0x7

    invoke-direct {v0, v2}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextLesserThan8Bits(I)I

    move-result v20

    .line 1060
    .local v20, "entry":I
    sget-object v2, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->twoDCodes:[B

    aget-byte v2, v2, v20

    and-int/lit16 v2, v2, 0xff

    .line 1063
    .end local v20    # "entry":I
    .local v2, "entry":I
    and-int/lit8 v20, v2, 0x78

    move/from16 v21, v2

    .end local v2    # "entry":I
    .local v21, "entry":I
    const/16 v22, 0x3

    ushr-int/lit8 v2, v20, 0x3

    .line 1064
    .local v2, "code":I
    and-int/lit8 v20, v21, 0x7

    .line 1065
    .local v20, "bits":I
    if-nez v2, :cond_3

    .line 1069
    if-nez v14, :cond_2

    .line 1070
    move/from16 v23, v3

    .end local v3    # "b1":I
    .local v23, "b1":I
    sub-int v3, v11, v5

    invoke-direct {v0, v1, v9, v5, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->setToBlack([BIII)V

    goto :goto_3

    .line 1069
    .end local v23    # "b1":I
    .restart local v3    # "b1":I
    :cond_2
    move/from16 v23, v3

    .line 1073
    .end local v3    # "b1":I
    .restart local v23    # "b1":I
    :goto_3
    move v13, v11

    move v5, v11

    .line 1076
    rsub-int/lit8 v3, v20, 0x7

    invoke-direct {v0, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    move-object/from16 v2, p2

    move/from16 v3, v17

    move/from16 v11, v19

    goto :goto_2

    .line 1079
    .end local v23    # "b1":I
    .restart local v3    # "b1":I
    :cond_3
    move/from16 v23, v3

    .end local v3    # "b1":I
    .restart local v23    # "b1":I
    move/from16 v3, v19

    if-ne v2, v3, :cond_5

    .line 1082
    rsub-int/lit8 v3, v20, 0x7

    invoke-direct {v0, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    .line 1086
    if-eqz v14, :cond_4

    .line 1089
    invoke-direct {v0}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decodeWhiteCodeWord()I

    move-result v3

    .line 1090
    .local v3, "number":I
    add-int/2addr v5, v3

    .line 1091
    add-int/lit8 v22, v6, 0x1

    .end local v6    # "currIndex":I
    .local v22, "currIndex":I
    aput v5, v7, v6

    .line 1093
    invoke-direct {v0}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decodeBlackCodeWord()I

    move-result v3

    .line 1094
    invoke-direct {v0, v1, v9, v5, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->setToBlack([BIII)V

    .line 1095
    add-int/2addr v5, v3

    .line 1096
    add-int/lit8 v6, v22, 0x1

    .end local v22    # "currIndex":I
    .restart local v6    # "currIndex":I
    aput v5, v7, v22

    goto :goto_4

    .line 1100
    .end local v3    # "number":I
    :cond_4
    invoke-direct {v0}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decodeBlackCodeWord()I

    move-result v3

    .line 1101
    .restart local v3    # "number":I
    invoke-direct {v0, v1, v9, v5, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->setToBlack([BIII)V

    .line 1102
    add-int/2addr v5, v3

    .line 1103
    add-int/lit8 v22, v6, 0x1

    .end local v6    # "currIndex":I
    .restart local v22    # "currIndex":I
    aput v5, v7, v6

    .line 1105
    invoke-direct {v0}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decodeWhiteCodeWord()I

    move-result v3

    .line 1106
    add-int/2addr v5, v3

    .line 1107
    add-int/lit8 v6, v22, 0x1

    .end local v22    # "currIndex":I
    .restart local v6    # "currIndex":I
    aput v5, v7, v22

    .line 1110
    :goto_4
    move v13, v5

    .line 1113
    .end local v3    # "number":I
    move-object/from16 v2, p2

    move/from16 v3, v17

    const/4 v11, 0x1

    goto/16 :goto_2

    :cond_5
    move/from16 v3, v16

    if-gt v2, v3, :cond_8

    .line 1114
    add-int/lit8 v16, v2, -0x5

    add-int v16, v23, v16

    .line 1115
    .local v16, "a1":I
    add-int/lit8 v22, v6, 0x1

    .end local v6    # "currIndex":I
    .restart local v22    # "currIndex":I
    aput v16, v7, v6

    .line 1119
    if-nez v14, :cond_6

    .line 1120
    sub-int v6, v16, v5

    invoke-direct {v0, v1, v9, v5, v6}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->setToBlack([BIII)V

    .line 1123
    :cond_6
    move/from16 v13, v16

    move/from16 v5, v16

    .line 1124
    if-nez v14, :cond_7

    const/4 v6, 0x1

    goto :goto_5

    :cond_7
    move/from16 v6, v17

    :goto_5
    move v14, v6

    .line 1126
    rsub-int/lit8 v6, v20, 0x7

    invoke-direct {v0, v6}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    move-object/from16 v2, p2

    move/from16 v16, v3

    move/from16 v3, v17

    move/from16 v6, v22

    const/4 v11, 0x1

    goto/16 :goto_2

    .line 1127
    .end local v16    # "a1":I
    .end local v22    # "currIndex":I
    .restart local v6    # "currIndex":I
    :cond_8
    const/16 v3, 0xb

    if-ne v2, v3, :cond_14

    .line 1128
    move/from16 v3, v22

    invoke-direct {v0, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextLesserThan8Bits(I)I

    move-result v3

    move/from16 v22, v2

    const/4 v2, 0x7

    .end local v2    # "code":I
    .local v22, "code":I
    if-ne v3, v2, :cond_13

    .line 1132
    const/4 v3, 0x0

    .line 1133
    .local v3, "zeros":I
    const/16 v18, 0x0

    .line 1135
    .local v18, "exit":Z
    :goto_6
    if-nez v18, :cond_12

    .line 1136
    :goto_7
    move/from16 v24, v4

    const/4 v2, 0x1

    .end local v4    # "scanlineStride":I
    .local v24, "scanlineStride":I
    invoke-direct {v0, v2}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextLesserThan8Bits(I)I

    move-result v4

    if-eq v4, v2, :cond_9

    .line 1137
    add-int/lit8 v3, v3, 0x1

    move/from16 v4, v24

    const/4 v2, 0x7

    goto :goto_7

    .line 1140
    :cond_9
    const/4 v2, 0x5

    if-le v3, v2, :cond_f

    .line 1144
    add-int/lit8 v3, v3, -0x6

    .line 1146
    if-nez v14, :cond_a

    if-lez v3, :cond_a

    .line 1147
    add-int/lit8 v4, v6, 0x1

    .end local v6    # "currIndex":I
    .local v4, "currIndex":I
    aput v5, v7, v6

    move v6, v4

    .line 1151
    .end local v4    # "currIndex":I
    .restart local v6    # "currIndex":I
    :cond_a
    add-int/2addr v5, v3

    .line 1152
    if-lez v3, :cond_b

    .line 1154
    const/4 v14, 0x1

    .line 1159
    :cond_b
    const/4 v4, 0x1

    invoke-direct {v0, v4}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->nextLesserThan8Bits(I)I

    move-result v25

    if-nez v25, :cond_d

    .line 1160
    if-nez v14, :cond_c

    .line 1161
    add-int/lit8 v4, v6, 0x1

    .end local v6    # "currIndex":I
    .restart local v4    # "currIndex":I
    aput v5, v7, v6

    move v6, v4

    .line 1163
    .end local v4    # "currIndex":I
    .restart local v6    # "currIndex":I
    :cond_c
    const/4 v4, 0x1

    move v14, v4

    .end local v14    # "isWhite":Z
    .local v4, "isWhite":Z
    goto :goto_8

    .line 1165
    .end local v4    # "isWhite":Z
    .restart local v14    # "isWhite":Z
    :cond_d
    if-eqz v14, :cond_e

    .line 1166
    add-int/lit8 v4, v6, 0x1

    .end local v6    # "currIndex":I
    .local v4, "currIndex":I
    aput v5, v7, v6

    move v6, v4

    .line 1168
    .end local v4    # "currIndex":I
    .restart local v6    # "currIndex":I
    :cond_e
    const/4 v4, 0x0

    move v14, v4

    .line 1171
    :goto_8
    const/4 v4, 0x1

    move/from16 v18, v4

    .line 1174
    :cond_f
    if-ne v3, v2, :cond_11

    .line 1175
    if-nez v14, :cond_10

    .line 1176
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "currIndex":I
    .local v2, "currIndex":I
    aput v5, v7, v6

    move v6, v2

    .line 1178
    .end local v2    # "currIndex":I
    .restart local v6    # "currIndex":I
    :cond_10
    add-int/2addr v5, v3

    .line 1181
    const/4 v14, 0x1

    move/from16 v4, v24

    const/4 v2, 0x7

    goto :goto_6

    .line 1183
    :cond_11
    add-int/2addr v5, v3

    .line 1185
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "currIndex":I
    .restart local v2    # "currIndex":I
    aput v5, v7, v6

    .line 1186
    const/4 v4, 0x1

    invoke-direct {v0, v1, v9, v5, v4}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->setToBlack([BIII)V

    .line 1187
    add-int/2addr v5, v4

    .line 1190
    const/4 v14, 0x0

    move v6, v2

    move/from16 v4, v24

    const/4 v2, 0x7

    goto :goto_6

    .line 1135
    .end local v2    # "currIndex":I
    .end local v24    # "scanlineStride":I
    .local v4, "scanlineStride":I
    .restart local v6    # "currIndex":I
    :cond_12
    move/from16 v24, v4

    const/4 v4, 0x1

    .line 1194
    .end local v3    # "zeros":I
    .end local v4    # "scanlineStride":I
    .end local v18    # "exit":Z
    .restart local v24    # "scanlineStride":I
    move-object/from16 v2, p2

    move v11, v4

    move/from16 v3, v17

    move/from16 v4, v24

    const/16 v16, 0x8

    goto/16 :goto_2

    .line 1129
    .end local v24    # "scanlineStride":I
    .restart local v4    # "scanlineStride":I
    :cond_13
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Invalid code encountered while decoding 2D group 4 compressed data."

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1200
    .end local v22    # "code":I
    .local v2, "code":I
    :cond_14
    move/from16 v22, v2

    move/from16 v24, v4

    const/4 v4, 0x1

    .end local v2    # "code":I
    .end local v4    # "scanlineStride":I
    .restart local v22    # "code":I
    .restart local v24    # "scanlineStride":I
    iget v5, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->w:I

    .line 1201
    rsub-int/lit8 v2, v20, 0x7

    invoke-direct {v0, v2}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->updatePointer(I)V

    move-object/from16 v2, p2

    move v11, v4

    move/from16 v3, v17

    move/from16 v4, v24

    const/16 v16, 0x8

    goto/16 :goto_2

    .line 1049
    .end local v11    # "b2":I
    .end local v20    # "bits":I
    .end local v21    # "entry":I
    .end local v22    # "code":I
    .end local v23    # "b1":I
    .end local v24    # "scanlineStride":I
    .restart local v4    # "scanlineStride":I
    :cond_15
    move/from16 v24, v4

    move/from16 v4, v19

    goto :goto_9

    :cond_16
    move/from16 v24, v4

    move v4, v11

    .line 1210
    .end local v4    # "scanlineStride":I
    .restart local v24    # "scanlineStride":I
    :goto_9
    array-length v2, v7

    if-ge v6, v2, :cond_17

    .line 1211
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "currIndex":I
    .local v2, "currIndex":I
    aput v5, v7, v6

    move v6, v2

    .line 1214
    .end local v2    # "currIndex":I
    .restart local v6    # "currIndex":I
    :cond_17
    iput v6, v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->changingElemSize:I

    .line 1216
    add-int v9, v9, v24

    .line 1017
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v2, p2

    move v11, v4

    move/from16 v3, v17

    move/from16 v4, v24

    const/4 v5, 0x7

    const/16 v6, 0x8

    goto/16 :goto_0

    .line 1218
    .end local v5    # "bitOffset":I
    .end local v6    # "currIndex":I
    .end local v10    # "lines":I
    .end local v13    # "a0":I
    .end local v14    # "isWhite":Z
    .end local v15    # "temp":[I
    .end local v24    # "scanlineStride":I
    .restart local v4    # "scanlineStride":I
    :cond_18
    return-void
.end method

.method public setRecoverFromImageError(Z)V
    .locals 0
    .param p1, "recoverFromImageError"    # Z

    .line 1581
    iput-boolean p1, p0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->recoverFromImageError:Z

    .line 1582
    return-void
.end method
