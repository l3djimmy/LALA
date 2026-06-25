.class public Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;
.super Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;
.source "MetaPen.java"


# static fields
.field public static final PS_DASH:I = 0x1

.field public static final PS_DASHDOT:I = 0x3

.field public static final PS_DASHDOTDOT:I = 0x4

.field public static final PS_DOT:I = 0x2

.field public static final PS_INSIDEFRAME:I = 0x6

.field public static final PS_NULL:I = 0x5

.field public static final PS_SOLID:I


# instance fields
.field color:Lcom/itextpdf/kernel/colors/Color;

.field penWidth:I

.field style:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 51
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;-><init>(I)V

    .line 43
    const/4 v1, 0x0

    iput v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;->style:I

    .line 44
    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;->penWidth:I

    .line 45
    sget-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->BLACK:Lcom/itextpdf/kernel/colors/Color;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;->color:Lcom/itextpdf/kernel/colors/Color;

    .line 52
    return-void
.end method


# virtual methods
.method public getColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;->color:Lcom/itextpdf/kernel/colors/Color;

    return-object v0
.end method

.method public getPenWidth()I
    .locals 1

    .line 82
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;->penWidth:I

    return v0
.end method

.method public getStyle()I
    .locals 1

    .line 73
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;->style:I

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

    .line 61
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;->style:I

    .line 62
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;->penWidth:I

    .line 63
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    .line 64
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;->color:Lcom/itextpdf/kernel/colors/Color;

    .line 65
    return-void
.end method
