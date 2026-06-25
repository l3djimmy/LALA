.class public Landroidx/camera/core/internal/compat/workaround/InvalidJpegDataParser;
.super Ljava/lang/Object;
.source "InvalidJpegDataParser.java"


# instance fields
.field private final mHasQuirk:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const-class v0, Landroidx/camera/core/internal/compat/quirk/LargeJpegImageQuirk;

    invoke-static {v0}, Landroidx/camera/core/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Landroidx/camera/core/internal/compat/workaround/InvalidJpegDataParser;->mHasQuirk:Z

    return-void
.end method


# virtual methods
.method public getValidDataLength([B)I
    .locals 5
    .param p1, "bytes"    # [B

    .line 40
    iget-boolean v0, p0, Landroidx/camera/core/internal/compat/workaround/InvalidJpegDataParser;->mHasQuirk:Z

    if-nez v0, :cond_0

    .line 41
    array-length v0, p1

    return v0

    .line 45
    :cond_0
    const/4 v0, 0x2

    .line 48
    .local v0, "markPosition":I
    :goto_0
    add-int/lit8 v1, v0, 0x4

    array-length v2, p1

    if-gt v1, v2, :cond_5

    aget-byte v1, p1, v0

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    goto :goto_2

    .line 52
    :cond_1
    add-int/lit8 v1, v0, 0x2

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    add-int/lit8 v3, v0, 0x3

    aget-byte v3, p1, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v1, v3

    .line 56
    .local v1, "segmentLength":I
    aget-byte v3, p1, v0

    if-ne v3, v2, :cond_4

    add-int/lit8 v3, v0, 0x1

    aget-byte v3, p1, v3

    const/16 v4, -0x26

    if-ne v3, v4, :cond_4

    .line 57
    nop

    .line 63
    .end local v1    # "segmentLength":I
    add-int/lit8 v1, v0, 0x2

    .line 67
    .local v1, "eoiPosition":I
    :goto_1
    add-int/lit8 v3, v1, 0x2

    array-length v4, p1

    if-le v3, v4, :cond_2

    .line 68
    array-length v2, p1

    return v2

    .line 71
    :cond_2
    aget-byte v3, p1, v1

    if-ne v3, v2, :cond_3

    add-int/lit8 v3, v1, 0x1

    aget-byte v3, p1, v3

    const/16 v4, -0x27

    if-ne v3, v4, :cond_3

    .line 72
    nop

    .line 77
    add-int/lit8 v2, v1, 0x2

    return v2

    .line 74
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 59
    .local v1, "segmentLength":I
    :cond_4
    add-int/lit8 v2, v1, 0x2

    add-int/2addr v0, v2

    .line 60
    .end local v1    # "segmentLength":I
    goto :goto_0

    .line 49
    :cond_5
    :goto_2
    array-length v1, p1

    return v1
.end method
