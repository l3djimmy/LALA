.class Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;
.super Ljava/lang/Object;
.source "ArmenianNumbering.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/numbering/ArmenianNumbering;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ArmenianDigit"
.end annotation


# instance fields
.field digit:C

.field value:I


# direct methods
.method constructor <init>(CI)V
    .locals 0
    .param p1, "digit"    # C
    .param p2, "value"    # I

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    iput-char p1, p0, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;->digit:C

    .line 97
    iput p2, p0, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;->value:I

    .line 98
    return-void
.end method
