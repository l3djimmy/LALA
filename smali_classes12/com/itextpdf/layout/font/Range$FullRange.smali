.class Lcom/itextpdf/layout/font/Range$FullRange;
.super Lcom/itextpdf/layout/font/Range;
.source "Range.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/font/Range;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FullRange"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 1

    .line 168
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/font/Range;-><init>(Lcom/itextpdf/layout/font/Range$1;)V

    .line 169
    return-void
.end method


# virtual methods
.method public contains(I)Z
    .locals 1
    .param p1, "uni"    # I

    .line 173
    const/4 v0, 0x1

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .line 178
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 183
    const/4 v0, 0x1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 188
    const-string v0, "[FullRange]"

    return-object v0
.end method
