.class public Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;
.super Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;
.source "MetaBrush.java"


# static fields
.field public static final BS_DIBPATTERN:I = 0x5

.field public static final BS_HATCHED:I = 0x2

.field public static final BS_NULL:I = 0x1

.field public static final BS_PATTERN:I = 0x3

.field public static final BS_SOLID:I = 0x0

.field public static final HS_BDIAGONAL:I = 0x3

.field public static final HS_CROSS:I = 0x4

.field public static final HS_DIAGCROSS:I = 0x5

.field public static final HS_FDIAGONAL:I = 0x2

.field public static final HS_HORIZONTAL:I = 0x0

.field public static final HS_VERTICAL:I = 0x1


# instance fields
.field color:Lcom/itextpdf/kernel/colors/Color;

.field hatch:I

.field style:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 56
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;-><init>(I)V

    .line 48
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;->style:I

    .line 50
    sget-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->WHITE:Lcom/itextpdf/kernel/colors/Color;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;->color:Lcom/itextpdf/kernel/colors/Color;

    .line 57
    return-void
.end method


# virtual methods
.method public getColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;->color:Lcom/itextpdf/kernel/colors/Color;

    return-object v0
.end method

.method public getHatch()I
    .locals 1

    .line 85
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;->hatch:I

    return v0
.end method

.method public getStyle()I
    .locals 1

    .line 77
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;->style:I

    return v0
.end method

.method public init(Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;)V
    .locals 1
    .param p1, "in"    # Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 66
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;->style:I

    .line 67
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;->color:Lcom/itextpdf/kernel/colors/Color;

    .line 68
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;->hatch:I

    .line 69
    return-void
.end method
