.class Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;
.super Ljava/lang/Object;
.source "RomanNumbering.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/numbering/RomanNumbering;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RomanDigit"
.end annotation


# instance fields
.field public digit:C

.field public pre:Z

.field public value:I


# direct methods
.method constructor <init>(CIZ)V
    .locals 0
    .param p1, "digit"    # C
    .param p2, "value"    # I
    .param p3, "pre"    # Z

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 156
    iput-char p1, p0, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;->digit:C

    .line 157
    iput p2, p0, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;->value:I

    .line 158
    iput-boolean p3, p0, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;->pre:Z

    .line 159
    return-void
.end method
