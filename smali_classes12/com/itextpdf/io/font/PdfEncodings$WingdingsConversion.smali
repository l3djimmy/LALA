.class Lcom/itextpdf/io/font/PdfEncodings$WingdingsConversion;
.super Ljava/lang/Object;
.source "PdfEncodings.java"

# interfaces
.implements Lcom/itextpdf/io/font/IExtraEncoding;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/PdfEncodings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WingdingsConversion"
.end annotation


# static fields
.field private static final table:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 367
    const/16 v0, 0xbf

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/io/font/PdfEncodings$WingdingsConversion;->table:[B

    return-void

    :array_0
    .array-data 1
        0x0t
        0x23t
        0x22t
        0x0t
        0x0t
        0x0t
        0x29t
        0x3et
        0x51t
        0x2at
        0x0t
        0x0t
        0x41t
        0x3ft
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        -0x4t
        0x0t
        0x0t
        0x0t
        -0x5t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x56t
        0x0t
        0x58t
        0x59t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        -0x4bt
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        -0x4at
        0x0t
        0x0t
        0x0t
        -0x53t
        -0x51t
        -0x54t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x7ct
        0x7bt
        0x0t
        0x0t
        0x0t
        0x54t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        -0x5at
        0x0t
        0x0t
        0x0t
        0x71t
        0x72t
        0x0t
        0x0t
        0x0t
        0x75t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x7dt
        0x7et
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        -0x74t
        -0x73t
        -0x72t
        -0x71t
        -0x70t
        -0x6ft
        -0x6et
        -0x6dt
        -0x6ct
        -0x6bt
        -0x7ft
        -0x7et
        -0x7dt
        -0x7ct
        -0x7bt
        -0x7at
        -0x79t
        -0x78t
        -0x77t
        -0x76t
        -0x74t
        -0x73t
        -0x72t
        -0x71t
        -0x70t
        -0x6ft
        -0x6et
        -0x6dt
        -0x6ct
        -0x6bt
        -0x18t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        -0x18t
        -0x28t
        0x0t
        0x0t
        -0x3ct
        -0x3at
        0x0t
        0x0t
        -0x10t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        -0x24t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 328
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/io/font/PdfEncodings$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/io/font/PdfEncodings$1;

    .line 328
    invoke-direct {p0}, Lcom/itextpdf/io/font/PdfEncodings$WingdingsConversion;-><init>()V

    return-void
.end method


# virtual methods
.method public byteToChar([BLjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "b"    # [B
    .param p2, "encoding"    # Ljava/lang/String;

    .line 364
    const/4 v0, 0x0

    return-object v0
.end method

.method public charToByte(CLjava/lang/String;)[B
    .locals 4
    .param p1, "char1"    # C
    .param p2, "encoding"    # Ljava/lang/String;

    .line 331
    const/16 v0, 0x20

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v0, :cond_0

    .line 332
    int-to-byte v0, p1

    new-array v1, v1, [B

    aput-byte v0, v1, v2

    return-object v1

    .line 333
    :cond_0
    const/16 v0, 0x2701

    if-lt p1, v0, :cond_1

    const/16 v0, 0x27be

    if-gt p1, v0, :cond_1

    .line 334
    sget-object v0, Lcom/itextpdf/io/font/PdfEncodings$WingdingsConversion;->table:[B

    add-int/lit16 v3, p1, -0x2700

    aget-byte v0, v0, v3

    .line 335
    .local v0, "v":B
    if-eqz v0, :cond_1

    .line 336
    new-array v1, v1, [B

    aput-byte v0, v1, v2

    return-object v1

    .line 338
    .end local v0    # "v":B
    :cond_1
    new-array v0, v2, [B

    return-object v0
.end method

.method public charToByte(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 8
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;

    .line 342
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 343
    .local v0, "cc":[C
    array-length v1, v0

    new-array v1, v1, [B

    .line 344
    .local v1, "b":[B
    const/4 v2, 0x0

    .line 345
    .local v2, "ptr":I
    array-length v3, v0

    .line 346
    .local v3, "len":I
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_0
    if-ge v4, v3, :cond_2

    .line 347
    aget-char v5, v0, v4

    .line 348
    .local v5, "c":C
    const/16 v6, 0x20

    if-ne v5, v6, :cond_0

    .line 349
    add-int/lit8 v6, v2, 0x1

    .end local v2    # "ptr":I
    .local v6, "ptr":I
    int-to-byte v7, v5

    aput-byte v7, v1, v2

    move v2, v6

    goto :goto_1

    .line 350
    .end local v6    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_0
    const/16 v6, 0x2701

    if-lt v5, v6, :cond_1

    const/16 v6, 0x27be

    if-gt v5, v6, :cond_1

    .line 351
    sget-object v6, Lcom/itextpdf/io/font/PdfEncodings$WingdingsConversion;->table:[B

    add-int/lit16 v7, v5, -0x2700

    aget-byte v6, v6, v7

    .line 352
    .local v6, "v":B
    if-eqz v6, :cond_1

    .line 353
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "ptr":I
    .local v7, "ptr":I
    aput-byte v6, v1, v2

    move v2, v7

    .line 346
    .end local v5    # "c":C
    .end local v6    # "v":B
    .end local v7    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_1
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 356
    .end local v4    # "k":I
    :cond_2
    if-ne v2, v3, :cond_3

    .line 357
    return-object v1

    .line 358
    :cond_3
    new-array v4, v2, [B

    .line 359
    .local v4, "b2":[B
    const/4 v5, 0x0

    invoke-static {v1, v5, v4, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 360
    return-object v4
.end method
