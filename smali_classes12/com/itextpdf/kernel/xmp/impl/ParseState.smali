.class Lcom/itextpdf/kernel/xmp/impl/ParseState;
.super Ljava/lang/Object;
.source "ISO8601Converter.java"


# instance fields
.field private pos:I

.field private str:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .line 423
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 416
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->pos:I

    .line 424
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->str:Ljava/lang/String;

    .line 425
    return-void
.end method


# virtual methods
.method public ch()C
    .locals 2

    .line 463
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->pos:I

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->str:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->str:Ljava/lang/String;

    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->pos:I

    .line 464
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 463
    :goto_0
    return v0
.end method

.method public ch(I)C
    .locals 1
    .param p1, "index"    # I

    .line 452
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->str:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->str:Ljava/lang/String;

    .line 453
    invoke-virtual {v0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 452
    :goto_0
    return v0
.end method

.method public gatherInt(Ljava/lang/String;I)I
    .locals 5
    .param p1, "errorMsg"    # Ljava/lang/String;
    .param p2, "maxValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 496
    const/4 v0, 0x0

    .line 497
    .local v0, "value":I
    const/4 v1, 0x0

    .line 498
    .local v1, "success":Z
    iget v2, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->pos:I

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch(I)C

    move-result v2

    .line 499
    .local v2, "ch":C
    :goto_0
    const/16 v3, 0x30

    if-gt v3, v2, :cond_0

    const/16 v3, 0x39

    if-gt v2, v3, :cond_0

    .line 501
    mul-int/lit8 v3, v0, 0xa

    add-int/lit8 v4, v2, -0x30

    add-int v0, v3, v4

    .line 502
    const/4 v1, 0x1

    .line 503
    iget v3, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->pos:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->pos:I

    .line 504
    iget v3, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->pos:I

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch(I)C

    move-result v2

    goto :goto_0

    .line 507
    :cond_0
    if-eqz v1, :cond_3

    .line 509
    if-le v0, p2, :cond_1

    .line 511
    return p2

    .line 513
    :cond_1
    if-gez v0, :cond_2

    .line 515
    const/4 v3, 0x0

    return v3

    .line 519
    :cond_2
    return v0

    .line 524
    :cond_3
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const/4 v4, 0x5

    invoke-direct {v3, p1, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3
.end method

.method public hasNext()Z
    .locals 2

    .line 442
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->pos:I

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->str:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public length()I
    .locals 1

    .line 433
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->str:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    return v0
.end method

.method public pos()I
    .locals 1

    .line 483
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->pos:I

    return v0
.end method

.method public skip()V
    .locals 1

    .line 474
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/ParseState;->pos:I

    .line 475
    return-void
.end method
