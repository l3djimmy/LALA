.class Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;
.super Ljava/lang/Object;
.source "JavaUnsignedUtil.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asU16(S)I
    .locals 1
    .param p0, "number"    # S

    .line 30
    const v0, 0xffff

    and-int/2addr v0, p0

    return v0
.end method

.method public static asU8(B)I
    .locals 1
    .param p0, "number"    # B

    .line 34
    and-int/lit16 v0, p0, 0xff

    return v0
.end method

.method public static compareAsUnsigned(II)I
    .locals 6
    .param p0, "left"    # I
    .param p1, "right"    # I

    .line 46
    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    int-to-long v4, p1

    and-long v1, v4, v2

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Long;->compareTo(Ljava/lang/Long;)I

    move-result v0

    return v0
.end method

.method public static toU16(I)S
    .locals 1
    .param p0, "number"    # I

    .line 42
    const v0, 0xffff

    and-int/2addr v0, p0

    int-to-short v0, v0

    return v0
.end method

.method public static toU8(I)B
    .locals 1
    .param p0, "number"    # I

    .line 38
    and-int/lit16 v0, p0, 0xff

    int-to-byte v0, v0

    return v0
.end method
