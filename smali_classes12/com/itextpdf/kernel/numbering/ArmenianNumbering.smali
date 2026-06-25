.class public Lcom/itextpdf/kernel/numbering/ArmenianNumbering;
.super Ljava/lang/Object;
.source "ArmenianNumbering.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;
    }
.end annotation


# static fields
.field private static final DIGITS:[Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 31
    const/16 v0, 0x24

    new-array v0, v0, [Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x531

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x532

    const/4 v4, 0x2

    invoke-direct {v1, v2, v4}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    aput-object v1, v0, v3

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x533

    const/4 v3, 0x3

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    aput-object v1, v0, v4

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x534

    const/4 v4, 0x4

    invoke-direct {v1, v2, v4}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    aput-object v1, v0, v3

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x535

    const/4 v3, 0x5

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    aput-object v1, v0, v4

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x536

    const/4 v4, 0x6

    invoke-direct {v1, v2, v4}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    aput-object v1, v0, v3

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x537

    const/4 v3, 0x7

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    aput-object v1, v0, v4

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x538

    const/16 v4, 0x8

    invoke-direct {v1, v2, v4}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    aput-object v1, v0, v3

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x539

    const/16 v3, 0x9

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    aput-object v1, v0, v4

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x53a

    const/16 v4, 0xa

    invoke-direct {v1, v2, v4}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    aput-object v1, v0, v3

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x53b

    const/16 v3, 0x14

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    aput-object v1, v0, v4

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x53c

    const/16 v4, 0x1e

    invoke-direct {v1, v2, v4}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0xb

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x53d

    const/16 v5, 0x28

    invoke-direct {v1, v2, v5}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0xc

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x53e

    const/16 v5, 0x32

    invoke-direct {v1, v2, v5}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0xd

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x53f

    const/16 v5, 0x3c

    invoke-direct {v1, v2, v5}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0xe

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x540

    const/16 v5, 0x46

    invoke-direct {v1, v2, v5}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0xf

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x541

    const/16 v5, 0x50

    invoke-direct {v1, v2, v5}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x10

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x542

    const/16 v5, 0x5a

    invoke-direct {v1, v2, v5}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x11

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x543

    const/16 v5, 0x64

    invoke-direct {v1, v2, v5}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x12

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x544

    const/16 v5, 0xc8

    invoke-direct {v1, v2, v5}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x13

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x545

    const/16 v5, 0x12c

    invoke-direct {v1, v2, v5}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    aput-object v1, v0, v3

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x546

    const/16 v3, 0x190

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x15

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x547

    const/16 v3, 0x1f4

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x16

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x548

    const/16 v3, 0x258

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x17

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x549

    const/16 v3, 0x2bc

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x18

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x54a

    const/16 v3, 0x320

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x19

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x54b

    const/16 v3, 0x384

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x1a

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x54c

    const/16 v3, 0x3e8

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x1b

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x54d

    const/16 v3, 0x7d0

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x1c

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x54e

    const/16 v3, 0xbb8

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x1d

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x54f

    const/16 v3, 0xfa0

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    aput-object v1, v0, v4

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x550

    const/16 v3, 0x1388

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x1f

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x551

    const/16 v3, 0x1770

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x20

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x552

    const/16 v3, 0x1b58

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x21

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x553

    const/16 v3, 0x1f40

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x22

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    const/16 v2, 0x554

    const/16 v3, 0x2328

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;-><init>(CI)V

    const/16 v2, 0x23

    aput-object v1, v0, v2

    sput-object v0, Lcom/itextpdf/kernel/numbering/ArmenianNumbering;->DIGITS:[Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    return-void
.end method

.method public static toArmenian(I)Ljava/lang/String;
    .locals 4
    .param p0, "number"    # I

    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .local v0, "result":Ljava/lang/StringBuilder;
    sget-object v1, Lcom/itextpdf/kernel/numbering/ArmenianNumbering;->DIGITS:[Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 82
    sget-object v2, Lcom/itextpdf/kernel/numbering/ArmenianNumbering;->DIGITS:[Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;

    aget-object v2, v2, v1

    .line 83
    .local v2, "curDigit":Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;
    :goto_1
    iget v3, v2, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;->value:I

    if-lt p0, v3, :cond_0

    .line 84
    iget-char v3, v2, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;->digit:C

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 85
    iget v3, v2, Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;->value:I

    sub-int/2addr p0, v3

    goto :goto_1

    .line 81
    .end local v2    # "curDigit":Lcom/itextpdf/kernel/numbering/ArmenianNumbering$ArmenianDigit;
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 88
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
