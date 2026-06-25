.class public Lcom/itextpdf/kernel/geom/PageSize;
.super Lcom/itextpdf/kernel/geom/Rectangle;
.source "PageSize.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field public static final A0:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final A1:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final A10:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final A2:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final A3:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final A4:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final A5:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final A6:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final A7:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final A8:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final A9:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final B0:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final B1:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final B10:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final B2:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final B3:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final B4:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final B5:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final B6:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final B7:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final B8:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final B9:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final DEFAULT:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final EXECUTIVE:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final LEDGER:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final LEGAL:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final LETTER:Lcom/itextpdf/kernel/geom/PageSize;

.field public static final TABLOID:Lcom/itextpdf/kernel/geom/PageSize;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 27
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const v1, 0x4552a000    # 3370.0f

    const/high16 v2, 0x45150000    # 2384.0f

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->A0:Lcom/itextpdf/kernel/geom/PageSize;

    .line 28
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const v1, 0x44d28000    # 1684.0f

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->A1:Lcom/itextpdf/kernel/geom/PageSize;

    .line 29
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const v2, 0x4494c000    # 1190.0f

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->A2:Lcom/itextpdf/kernel/geom/PageSize;

    .line 30
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const v1, 0x44528000    # 842.0f

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->A3:Lcom/itextpdf/kernel/geom/PageSize;

    .line 31
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const v2, 0x4414c000    # 595.0f

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->A4:Lcom/itextpdf/kernel/geom/PageSize;

    .line 32
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const/high16 v1, 0x43d20000    # 420.0f

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->A5:Lcom/itextpdf/kernel/geom/PageSize;

    .line 33
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const/high16 v2, 0x43950000    # 298.0f

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->A6:Lcom/itextpdf/kernel/geom/PageSize;

    .line 34
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const/high16 v1, 0x43520000    # 210.0f

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->A7:Lcom/itextpdf/kernel/geom/PageSize;

    .line 35
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const/high16 v2, 0x43140000    # 148.0f

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->A8:Lcom/itextpdf/kernel/geom/PageSize;

    .line 36
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const v1, 0x4408c000    # 547.0f

    const/high16 v2, 0x42d20000    # 105.0f

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->A9:Lcom/itextpdf/kernel/geom/PageSize;

    .line 37
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const/high16 v1, 0x42940000    # 74.0f

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->A10:Lcom/itextpdf/kernel/geom/PageSize;

    .line 39
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const v1, 0x457a8000    # 4008.0f

    const v2, 0x45312000    # 2834.0f

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->B0:Lcom/itextpdf/kernel/geom/PageSize;

    .line 40
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const v1, 0x44fa8000    # 2004.0f

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->B1:Lcom/itextpdf/kernel/geom/PageSize;

    .line 41
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const v2, 0x44b12000    # 1417.0f

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->B2:Lcom/itextpdf/kernel/geom/PageSize;

    .line 42
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const/high16 v1, 0x447a0000    # 1000.0f

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->B3:Lcom/itextpdf/kernel/geom/PageSize;

    .line 43
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const/high16 v2, 0x44310000    # 708.0f

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->B4:Lcom/itextpdf/kernel/geom/PageSize;

    .line 44
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const/high16 v1, 0x43f90000    # 498.0f

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->B5:Lcom/itextpdf/kernel/geom/PageSize;

    .line 45
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const/high16 v2, 0x43b10000    # 354.0f

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->B6:Lcom/itextpdf/kernel/geom/PageSize;

    .line 46
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const/high16 v1, 0x43790000    # 249.0f

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->B7:Lcom/itextpdf/kernel/geom/PageSize;

    .line 47
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const/high16 v2, 0x432f0000    # 175.0f

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->B8:Lcom/itextpdf/kernel/geom/PageSize;

    .line 48
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const/high16 v1, 0x42f80000    # 124.0f

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->B9:Lcom/itextpdf/kernel/geom/PageSize;

    .line 49
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const/high16 v2, 0x42b00000    # 88.0f

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->B10:Lcom/itextpdf/kernel/geom/PageSize;

    .line 51
    sget-object v0, Lcom/itextpdf/kernel/geom/PageSize;->A4:Lcom/itextpdf/kernel/geom/PageSize;

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->DEFAULT:Lcom/itextpdf/kernel/geom/PageSize;

    .line 53
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const v1, 0x44028000    # 522.0f

    const/high16 v2, 0x443d0000    # 756.0f

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->EXECUTIVE:Lcom/itextpdf/kernel/geom/PageSize;

    .line 54
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const/high16 v1, 0x44990000    # 1224.0f

    const/high16 v2, 0x44460000    # 792.0f

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->LEDGER:Lcom/itextpdf/kernel/geom/PageSize;

    .line 55
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    const/high16 v3, 0x447c0000    # 1008.0f

    const/high16 v4, 0x44190000    # 612.0f

    invoke-direct {v0, v4, v3}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->LEGAL:Lcom/itextpdf/kernel/geom/PageSize;

    .line 56
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    invoke-direct {v0, v4, v2}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->LETTER:Lcom/itextpdf/kernel/geom/PageSize;

    .line 57
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    sput-object v0, Lcom/itextpdf/kernel/geom/PageSize;->TABLOID:Lcom/itextpdf/kernel/geom/PageSize;

    return-void
.end method

.method public constructor <init>(FF)V
    .locals 1
    .param p1, "width"    # F
    .param p2, "height"    # F

    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, v0, v0, p1, p2}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 61
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 4
    .param p1, "box"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 65
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 66
    return-void
.end method


# virtual methods
.method public clone()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1

    .line 88
    invoke-super {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 25
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/PageSize;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    return-object v0
.end method

.method public rotate()Lcom/itextpdf/kernel/geom/PageSize;
    .locals 3

    .line 74
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    iget v1, p0, Lcom/itextpdf/kernel/geom/PageSize;->height:F

    iget v2, p0, Lcom/itextpdf/kernel/geom/PageSize;->width:F

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(FF)V

    return-object v0
.end method
