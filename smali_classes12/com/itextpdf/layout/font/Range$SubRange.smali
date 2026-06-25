.class Lcom/itextpdf/layout/font/Range$SubRange;
.super Ljava/lang/Object;
.source "Range.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/font/Range;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SubRange"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/itextpdf/layout/font/Range$SubRange;",
        ">;"
    }
.end annotation


# instance fields
.field high:I

.field low:I


# direct methods
.method constructor <init>(II)V
    .locals 0
    .param p1, "low"    # I
    .param p2, "high"    # I

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    iput p1, p0, Lcom/itextpdf/layout/font/Range$SubRange;->low:I

    .line 132
    iput p2, p0, Lcom/itextpdf/layout/font/Range$SubRange;->high:I

    .line 133
    return-void
.end method


# virtual methods
.method public compareTo(I)I
    .locals 1
    .param p1, "n"    # I

    .line 141
    iget v0, p0, Lcom/itextpdf/layout/font/Range$SubRange;->low:I

    if-ge p1, v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 142
    :cond_0
    iget v0, p0, Lcom/itextpdf/layout/font/Range$SubRange;->high:I

    if-le p1, v0, :cond_1

    const/4 v0, -0x1

    return v0

    .line 143
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public compareTo(Lcom/itextpdf/layout/font/Range$SubRange;)I
    .locals 2
    .param p1, "o"    # Lcom/itextpdf/layout/font/Range$SubRange;

    .line 137
    iget v0, p0, Lcom/itextpdf/layout/font/Range$SubRange;->low:I

    iget v1, p1, Lcom/itextpdf/layout/font/Range$SubRange;->low:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 126
    check-cast p1, Lcom/itextpdf/layout/font/Range$SubRange;

    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/font/Range$SubRange;->compareTo(Lcom/itextpdf/layout/font/Range$SubRange;)I

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 148
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 149
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 150
    :cond_1
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/layout/font/Range$SubRange;

    .line 151
    .local v2, "subRange":Lcom/itextpdf/layout/font/Range$SubRange;
    iget v3, p0, Lcom/itextpdf/layout/font/Range$SubRange;->low:I

    iget v4, v2, Lcom/itextpdf/layout/font/Range$SubRange;->low:I

    if-ne v3, v4, :cond_2

    iget v3, p0, Lcom/itextpdf/layout/font/Range$SubRange;->high:I

    iget v4, v2, Lcom/itextpdf/layout/font/Range$SubRange;->high:I

    if-ne v3, v4, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    :goto_0
    return v0

    .line 149
    .end local v2    # "subRange":Lcom/itextpdf/layout/font/Range$SubRange;
    :cond_3
    :goto_1
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 157
    iget v0, p0, Lcom/itextpdf/layout/font/Range$SubRange;->low:I

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/itextpdf/layout/font/Range$SubRange;->high:I

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 162
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/layout/font/Range$SubRange;->low:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/layout/font/Range$SubRange;->high:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
