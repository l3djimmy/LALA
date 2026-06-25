.class Lcom/itextpdf/kernel/numbering/GeorgianNumbering$GeorgianDigit;
.super Ljava/lang/Object;
.source "GeorgianNumbering.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/numbering/GeorgianNumbering;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GeorgianDigit"
.end annotation


# instance fields
.field digit:C

.field value:I


# direct methods
.method constructor <init>(CI)V
    .locals 0
    .param p1, "digit"    # C
    .param p2, "value"    # I

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    iput-char p1, p0, Lcom/itextpdf/kernel/numbering/GeorgianNumbering$GeorgianDigit;->digit:C

    .line 98
    iput p2, p0, Lcom/itextpdf/kernel/numbering/GeorgianNumbering$GeorgianDigit;->value:I

    .line 99
    return-void
.end method
