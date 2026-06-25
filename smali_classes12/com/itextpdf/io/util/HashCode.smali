.class public final Lcom/itextpdf/io/util/HashCode;
.super Ljava/lang/Object;
.source "HashCode.java"


# static fields
.field public static final EMPTY_HASH_CODE:I = 0x1


# instance fields
.field private hashCode:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    const/4 v0, 0x1

    iput v0, p0, Lcom/itextpdf/io/util/HashCode;->hashCode:I

    return-void
.end method

.method public static combine(ID)I
    .locals 3
    .param p0, "hashCode"    # I
    .param p1, "value"    # D

    .line 127
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 128
    .local v0, "v":J
    invoke-static {p0, v0, v1}, Lcom/itextpdf/io/util/HashCode;->combine(IJ)I

    move-result v2

    return v2
.end method

.method public static combine(IF)I
    .locals 2
    .param p0, "hashCode"    # I
    .param p1, "value"    # F

    .line 116
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    .line 117
    .local v0, "v":I
    invoke-static {p0, v0}, Lcom/itextpdf/io/util/HashCode;->combine(II)I

    move-result v1

    return v1
.end method

.method public static combine(II)I
    .locals 1
    .param p0, "hashCode"    # I
    .param p1, "value"    # I

    .line 148
    mul-int/lit8 v0, p0, 0x1f

    add-int/2addr v0, p1

    return v0
.end method

.method public static combine(IJ)I
    .locals 2
    .param p0, "hashCode"    # I
    .param p1, "value"    # J

    .line 105
    const/16 v0, 0x20

    ushr-long v0, p1, v0

    xor-long/2addr v0, p1

    long-to-int v0, v0

    .line 106
    .local v0, "v":I
    invoke-static {p0, v0}, Lcom/itextpdf/io/util/HashCode;->combine(II)I

    move-result v1

    return v1
.end method

.method public static combine(ILjava/lang/Object;)I
    .locals 1
    .param p0, "hashCode"    # I
    .param p1, "value"    # Ljava/lang/Object;

    .line 138
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {p0, v0}, Lcom/itextpdf/io/util/HashCode;->combine(II)I

    move-result v0

    return v0
.end method

.method public static combine(IZ)I
    .locals 2
    .param p0, "hashCode"    # I
    .param p1, "value"    # Z

    .line 94
    if-eqz p1, :cond_0

    const/16 v0, 0x4cf

    goto :goto_0

    :cond_0
    const/16 v0, 0x4d5

    .line 95
    .local v0, "v":I
    :goto_0
    invoke-static {p0, v0}, Lcom/itextpdf/io/util/HashCode;->combine(II)I

    move-result v1

    return v1
.end method


# virtual methods
.method public final append(D)Lcom/itextpdf/io/util/HashCode;
    .locals 1
    .param p1, "value"    # D

    .line 187
    iget v0, p0, Lcom/itextpdf/io/util/HashCode;->hashCode:I

    invoke-static {v0, p1, p2}, Lcom/itextpdf/io/util/HashCode;->combine(ID)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/util/HashCode;->hashCode:I

    .line 188
    return-object p0
.end method

.method public final append(F)Lcom/itextpdf/io/util/HashCode;
    .locals 1
    .param p1, "value"    # F

    .line 177
    iget v0, p0, Lcom/itextpdf/io/util/HashCode;->hashCode:I

    invoke-static {v0, p1}, Lcom/itextpdf/io/util/HashCode;->combine(IF)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/util/HashCode;->hashCode:I

    .line 178
    return-object p0
.end method

.method public final append(I)Lcom/itextpdf/io/util/HashCode;
    .locals 1
    .param p1, "value"    # I

    .line 157
    iget v0, p0, Lcom/itextpdf/io/util/HashCode;->hashCode:I

    invoke-static {v0, p1}, Lcom/itextpdf/io/util/HashCode;->combine(II)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/util/HashCode;->hashCode:I

    .line 158
    return-object p0
.end method

.method public final append(J)Lcom/itextpdf/io/util/HashCode;
    .locals 1
    .param p1, "value"    # J

    .line 167
    iget v0, p0, Lcom/itextpdf/io/util/HashCode;->hashCode:I

    invoke-static {v0, p1, p2}, Lcom/itextpdf/io/util/HashCode;->combine(IJ)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/util/HashCode;->hashCode:I

    .line 168
    return-object p0
.end method

.method public final append(Ljava/lang/Object;)Lcom/itextpdf/io/util/HashCode;
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .line 207
    iget v0, p0, Lcom/itextpdf/io/util/HashCode;->hashCode:I

    invoke-static {v0, p1}, Lcom/itextpdf/io/util/HashCode;->combine(ILjava/lang/Object;)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/util/HashCode;->hashCode:I

    .line 208
    return-object p0
.end method

.method public final append(Z)Lcom/itextpdf/io/util/HashCode;
    .locals 1
    .param p1, "value"    # Z

    .line 197
    iget v0, p0, Lcom/itextpdf/io/util/HashCode;->hashCode:I

    invoke-static {v0, p1}, Lcom/itextpdf/io/util/HashCode;->combine(IZ)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/util/HashCode;->hashCode:I

    .line 198
    return-object p0
.end method

.method public final hashCode()I
    .locals 1

    .line 84
    iget v0, p0, Lcom/itextpdf/io/util/HashCode;->hashCode:I

    return v0
.end method
