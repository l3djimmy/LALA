.class Lcom/itextpdf/kernel/pdf/SerializedObjectContent;
.super Ljava/lang/Object;
.source "SerializedObjectContent.java"


# instance fields
.field private final hash:I

.field private final serializedContent:[B


# direct methods
.method constructor <init>([B)V
    .locals 1
    .param p1, "serializedContent"    # [B

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/SerializedObjectContent;->serializedContent:[B

    .line 33
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/SerializedObjectContent;->calculateHash([B)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/SerializedObjectContent;->hash:I

    .line 34
    return-void
.end method

.method private static calculateHash([B)I
    .locals 5
    .param p0, "b"    # [B

    .line 49
    const/4 v0, 0x0

    .line 50
    .local v0, "hash":I
    array-length v1, p0

    .line 51
    .local v1, "len":I
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 52
    mul-int/lit8 v3, v0, 0x1f

    aget-byte v4, p0, v2

    and-int/lit16 v4, v4, 0xff

    add-int v0, v3, v4

    .line 51
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 54
    .end local v2    # "k":I
    :cond_0
    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .line 38
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/SerializedObjectContent;

    if-eqz v0, :cond_0

    .line 39
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/SerializedObjectContent;->hashCode()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/SerializedObjectContent;->serializedContent:[B

    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/SerializedObjectContent;

    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/SerializedObjectContent;->serializedContent:[B

    .line 40
    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 38
    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 45
    iget v0, p0, Lcom/itextpdf/kernel/pdf/SerializedObjectContent;->hash:I

    return v0
.end method
