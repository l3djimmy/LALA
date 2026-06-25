.class final Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy$PdfTextLocationComparator;
.super Ljava/lang/Object;
.source "RegexBasedLocationExtractionStrategy.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PdfTextLocationComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy$1;

    .line 187
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy$PdfTextLocationComparator;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;)I
    .locals 7
    .param p1, "l1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;
    .param p2, "l2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;

    .line 192
    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 193
    .local v0, "o1":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-interface {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 194
    .local v1, "o2":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v3

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const v3, 0x38d1b717    # 1.0E-4f

    cmpg-float v2, v2, v3

    const/4 v4, -0x1

    const/4 v5, 0x1

    if-gez v2, :cond_2

    .line 195
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v6

    sub-float/2addr v2, v6

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpg-float v2, v2, v3

    if-gez v2, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v2

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v6

    sub-float/2addr v2, v6

    cmpl-float v2, v2, v3

    if-lez v2, :cond_1

    goto :goto_0

    :cond_1
    move v4, v5

    :goto_0
    return v4

    .line 197
    :cond_2
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v2

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v6

    sub-float/2addr v2, v6

    cmpl-float v2, v2, v3

    if-lez v2, :cond_3

    goto :goto_1

    :cond_3
    move v4, v5

    :goto_1
    return v4
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 187
    check-cast p1, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;

    check-cast p2, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;

    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy$PdfTextLocationComparator;->compare(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;)I

    move-result p1

    return p1
.end method
