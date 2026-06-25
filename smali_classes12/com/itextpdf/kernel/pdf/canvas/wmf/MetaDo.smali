.class public Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;
.super Ljava/lang/Object;
.source "MetaDo.java"


# static fields
.field public static final META_ANIMATEPALETTE:I = 0x436

.field public static final META_ARC:I = 0x817

.field public static final META_BITBLT:I = 0x922

.field public static final META_CHORD:I = 0x830

.field public static final META_CREATEBRUSHINDIRECT:I = 0x2fc

.field public static final META_CREATEFONTINDIRECT:I = 0x2fb

.field public static final META_CREATEPALETTE:I = 0xf7

.field public static final META_CREATEPATTERNBRUSH:I = 0x1f9

.field public static final META_CREATEPENINDIRECT:I = 0x2fa

.field public static final META_CREATEREGION:I = 0x6ff

.field public static final META_DELETEOBJECT:I = 0x1f0

.field public static final META_DIBBITBLT:I = 0x940

.field public static final META_DIBCREATEPATTERNBRUSH:I = 0x142

.field public static final META_DIBSTRETCHBLT:I = 0xb41

.field public static final META_ELLIPSE:I = 0x418

.field public static final META_ESCAPE:I = 0x626

.field public static final META_EXCLUDECLIPRECT:I = 0x415

.field public static final META_EXTFLOODFILL:I = 0x548

.field public static final META_EXTTEXTOUT:I = 0xa32

.field public static final META_FILLREGION:I = 0x228

.field public static final META_FLOODFILL:I = 0x419

.field public static final META_FRAMEREGION:I = 0x429

.field public static final META_INTERSECTCLIPRECT:I = 0x416

.field public static final META_INVERTREGION:I = 0x12a

.field public static final META_LINETO:I = 0x213

.field public static final META_MOVETO:I = 0x214

.field public static final META_OFFSETCLIPRGN:I = 0x220

.field public static final META_OFFSETVIEWPORTORG:I = 0x211

.field public static final META_OFFSETWINDOWORG:I = 0x20f

.field public static final META_PAINTREGION:I = 0x12b

.field public static final META_PATBLT:I = 0x61d

.field public static final META_PIE:I = 0x81a

.field public static final META_POLYGON:I = 0x324

.field public static final META_POLYLINE:I = 0x325

.field public static final META_POLYPOLYGON:I = 0x538

.field public static final META_REALIZEPALETTE:I = 0x35

.field public static final META_RECTANGLE:I = 0x41b

.field public static final META_RESIZEPALETTE:I = 0x139

.field public static final META_RESTOREDC:I = 0x127

.field public static final META_ROUNDRECT:I = 0x61c

.field public static final META_SAVEDC:I = 0x1e

.field public static final META_SCALEVIEWPORTEXT:I = 0x412

.field public static final META_SCALEWINDOWEXT:I = 0x410

.field public static final META_SELECTCLIPREGION:I = 0x12c

.field public static final META_SELECTOBJECT:I = 0x12d

.field public static final META_SELECTPALETTE:I = 0x234

.field public static final META_SETBKCOLOR:I = 0x201

.field public static final META_SETBKMODE:I = 0x102

.field public static final META_SETDIBTODEV:I = 0xd33

.field public static final META_SETMAPMODE:I = 0x103

.field public static final META_SETMAPPERFLAGS:I = 0x231

.field public static final META_SETPALENTRIES:I = 0x37

.field public static final META_SETPIXEL:I = 0x41f

.field public static final META_SETPOLYFILLMODE:I = 0x106

.field public static final META_SETRELABS:I = 0x105

.field public static final META_SETROP2:I = 0x104

.field public static final META_SETSTRETCHBLTMODE:I = 0x107

.field public static final META_SETTEXTALIGN:I = 0x12e

.field public static final META_SETTEXTCHAREXTRA:I = 0x108

.field public static final META_SETTEXTCOLOR:I = 0x209

.field public static final META_SETTEXTJUSTIFICATION:I = 0x20a

.field public static final META_SETVIEWPORTEXT:I = 0x20e

.field public static final META_SETVIEWPORTORG:I = 0x20d

.field public static final META_SETWINDOWEXT:I = 0x20c

.field public static final META_SETWINDOWORG:I = 0x20b

.field public static final META_STRETCHBLT:I = 0xb23

.field public static final META_STRETCHDIB:I = 0xf43

.field public static final META_TEXTOUT:I = 0x521


# instance fields
.field bottom:I

.field public cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

.field public in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

.field inch:I

.field left:I

.field right:I

.field state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

.field top:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "cb"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    .line 146
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 147
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    .line 148
    return-void
.end method

.method static getArc(FFFF)F
    .locals 6
    .param p0, "xCenter"    # F
    .param p1, "yCenter"    # F
    .param p2, "xDot"    # F
    .param p3, "yDot"    # F

    .line 713
    sub-float v0, p3, p1

    float-to-double v0, v0

    sub-float v2, p2, p0

    float-to-double v2, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    .line 714
    .local v0, "s":D
    const-wide/16 v2, 0x0

    cmpg-double v2, v0, v2

    if-gez v2, :cond_0

    .line 715
    const-wide v2, 0x401921fb54442d18L    # 6.283185307179586

    add-double/2addr v0, v2

    .line 716
    :cond_0
    const-wide v2, 0x400921fb54442d18L    # Math.PI

    div-double v2, v0, v2

    const-wide v4, 0x4066800000000000L    # 180.0

    mul-double/2addr v2, v4

    double-to-float v2, v2

    return v2
.end method

.method public static wrapBMP(Lcom/itextpdf/io/image/ImageData;)[B
    .locals 9
    .param p0, "image"    # Lcom/itextpdf/io/image/ImageData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 727
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getOriginalType()Lcom/itextpdf/io/image/ImageType;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/io/image/ImageType;->BMP:Lcom/itextpdf/io/image/ImageType;

    if-ne v0, v1, :cond_3

    .line 732
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getData()[B

    move-result-object v0

    if-nez v0, :cond_1

    .line 733
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getUrl()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    .line 734
    .local v0, "imgIn":Ljava/io/InputStream;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 735
    .local v1, "out":Ljava/io/ByteArrayOutputStream;
    const/4 v2, 0x0

    .line 736
    .local v2, "b":I
    :goto_0
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v3

    move v2, v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    .line 737
    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_0

    .line 738
    :cond_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 739
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 740
    .end local v2    # "b":I
    .local v1, "data":[B
    goto :goto_1

    .line 741
    .end local v0    # "imgIn":Ljava/io/InputStream;
    .end local v1    # "data":[B
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getData()[B

    move-result-object v1

    .line 743
    .restart local v1    # "data":[B
    :goto_1
    array-length v0, v1

    const/16 v2, 0xe

    sub-int/2addr v0, v2

    const/4 v3, 0x1

    add-int/2addr v0, v3

    ushr-int/2addr v0, v3

    .line 744
    .local v0, "sizeBmpWords":I
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 746
    .local v4, "os":Ljava/io/ByteArrayOutputStream;
    invoke-static {v4, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 747
    const/16 v5, 0x9

    invoke-static {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 748
    const/16 v5, 0x300

    invoke-static {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 750
    add-int/lit8 v5, v0, 0x24

    const/4 v6, 0x3

    add-int/2addr v5, v6

    invoke-static {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeDWord(Ljava/io/OutputStream;I)V

    .line 751
    invoke-static {v4, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 753
    add-int/lit8 v5, v0, 0xe

    invoke-static {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeDWord(Ljava/io/OutputStream;I)V

    .line 754
    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 756
    const/4 v7, 0x4

    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeDWord(Ljava/io/OutputStream;I)V

    .line 757
    const/16 v7, 0x103

    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 758
    const/16 v7, 0x8

    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 760
    const/4 v7, 0x5

    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeDWord(Ljava/io/OutputStream;I)V

    .line 761
    const/16 v8, 0x20b

    invoke-static {v4, v8}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 762
    invoke-static {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 763
    invoke-static {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 765
    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeDWord(Ljava/io/OutputStream;I)V

    .line 766
    const/16 v7, 0x20c

    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 767
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getHeight()F

    move-result v7

    float-to-int v7, v7

    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 768
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getWidth()F

    move-result v7

    float-to-int v7, v7

    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 770
    add-int/lit8 v7, v0, 0xd

    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeDWord(Ljava/io/OutputStream;I)V

    .line 771
    const/16 v7, 0xb41

    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 772
    const v7, 0xcc0020

    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeDWord(Ljava/io/OutputStream;I)V

    .line 773
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getHeight()F

    move-result v7

    float-to-int v7, v7

    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 774
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getWidth()F

    move-result v7

    float-to-int v7, v7

    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 775
    invoke-static {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 776
    invoke-static {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 777
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getHeight()F

    move-result v7

    float-to-int v7, v7

    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 778
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getWidth()F

    move-result v7

    float-to-int v7, v7

    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 779
    invoke-static {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 780
    invoke-static {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 781
    array-length v7, v1

    sub-int/2addr v7, v2

    invoke-virtual {v4, v1, v2, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 782
    array-length v2, v1

    and-int/2addr v2, v3

    if-ne v2, v3, :cond_2

    .line 783
    invoke-virtual {v4, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 785
    :cond_2
    invoke-static {v4, v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeDWord(Ljava/io/OutputStream;I)V

    .line 786
    invoke-static {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 787
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 788
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2

    .line 728
    .end local v0    # "sizeBmpWords":I
    .end local v1    # "data":[B
    .end local v4    # "os":Ljava/io/ByteArrayOutputStream;
    :cond_3
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Only BMP can be wrapped in WMF."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static writeDWord(Ljava/io/OutputStream;I)V
    .locals 2
    .param p0, "os"    # Ljava/io/OutputStream;
    .param p1, "v"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 811
    const v0, 0xffff

    and-int v1, p1, v0

    invoke-static {p0, v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 812
    ushr-int/lit8 v1, p1, 0x10

    and-int/2addr v0, v1

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->writeWord(Ljava/io/OutputStream;I)V

    .line 813
    return-void
.end method

.method public static writeWord(Ljava/io/OutputStream;I)V
    .locals 1
    .param p0, "os"    # Ljava/io/OutputStream;
    .param p1, "v"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 799
    and-int/lit16 v0, p1, 0xff

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 800
    ushr-int/lit8 v0, p1, 0x8

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 801
    return-void
.end method


# virtual methods
.method public isNullStrokeFill(Z)Z
    .locals 8
    .param p1, "isRectangle"    # Z

    .line 666
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getCurrentPen()Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;

    move-result-object v0

    .line 667
    .local v0, "pen":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getCurrentBrush()Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;

    move-result-object v1

    .line 668
    .local v1, "brush":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;->getStyle()I

    move-result v2

    const/4 v3, 0x5

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ne v2, v3, :cond_0

    move v2, v4

    goto :goto_0

    :cond_0
    move v2, v5

    .line 669
    .local v2, "noPen":Z
    :goto_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;->getStyle()I

    move-result v3

    .line 670
    .local v3, "style":I
    if-eqz v3, :cond_2

    const/4 v6, 0x2

    if-ne v3, v6, :cond_1

    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getBackgroundMode()I

    move-result v7

    if-ne v7, v6, :cond_1

    goto :goto_1

    :cond_1
    move v6, v5

    goto :goto_2

    :cond_2
    :goto_1
    move v6, v4

    .line 671
    .local v6, "isBrush":Z
    :goto_2
    if-eqz v2, :cond_3

    if-nez v6, :cond_3

    goto :goto_3

    :cond_3
    move v4, v5

    .line 672
    .local v4, "result":Z
    :goto_3
    if-nez v2, :cond_5

    .line 673
    nop

    .line 676
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    .line 673
    if-eqz p1, :cond_4

    .line 674
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v5, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setLineJoinRectangle(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    goto :goto_4

    .line 676
    :cond_4
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v5, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setLineJoinPolygon(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 678
    :cond_5
    :goto_4
    return v4
.end method

.method public outputText(IIIIIIILjava/lang/String;)V
    .locals 45
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "flag"    # I
    .param p4, "x1"    # I
    .param p5, "y1"    # I
    .param p6, "x2"    # I
    .param p7, "y2"    # I
    .param p8, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 599
    move-object/from16 v0, p0

    move-object/from16 v1, p8

    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getCurrentFont()Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;

    move-result-object v2

    .line 600
    .local v2, "font":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    move/from16 v4, p1

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v3

    .line 601
    .local v3, "refX":F
    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    move/from16 v6, p2

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v5

    .line 602
    .local v5, "refY":F
    iget-object v7, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->getAngle()F

    move-result v8

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformAngle(F)F

    move-result v7

    .line 603
    .local v7, "angle":F
    float-to-double v8, v7

    invoke-static {v8, v9}, Ljava/lang/Math;->sin(D)D

    move-result-wide v8

    double-to-float v8, v8

    .line 604
    .local v8, "sin":F
    float-to-double v9, v7

    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    double-to-float v9, v9

    .line 605
    .local v9, "cos":F
    iget-object v10, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v2, v10}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->getFontSize(Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;)F

    move-result v10

    .line 606
    .local v10, "fontSize":F
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->getFont()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v11

    .line 607
    .local v11, "fp":Lcom/itextpdf/io/font/FontProgram;
    iget-object v12, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getTextAlign()I

    move-result v12

    .line 609
    .local v12, "align":I
    const/4 v13, 0x0

    .line 610
    .local v13, "normalizedWidth":I
    iget-object v14, v2, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->encoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v14, v1}, Lcom/itextpdf/io/font/FontEncoding;->convertToBytes(Ljava/lang/String;)[B

    move-result-object v14

    .line 611
    .local v14, "bytes":[B
    array-length v15, v14

    const/16 v16, 0x0

    move/from16 v44, v16

    move-object/from16 v16, v2

    move/from16 v2, v44

    .end local v2    # "font":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;
    .local v16, "font":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;
    :goto_0
    if-ge v2, v15, :cond_0

    move/from16 v17, v2

    aget-byte v2, v14, v17

    .line 612
    .local v2, "b":B
    and-int/lit16 v4, v2, 0xff

    invoke-virtual {v11, v4}, Lcom/itextpdf/io/font/FontProgram;->getWidth(I)I

    move-result v4

    add-int/2addr v13, v4

    .line 611
    .end local v2    # "b":B
    add-int/lit8 v2, v17, 0x1

    move/from16 v4, p1

    goto :goto_0

    .line 614
    :cond_0
    invoke-static {v10}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v2

    int-to-float v4, v13

    mul-float/2addr v2, v4

    .line 615
    .local v2, "textWidth":F
    const/4 v4, 0x0

    .line 616
    .local v4, "tx":F
    const/4 v15, 0x0

    .line 617
    .local v15, "ty":F
    invoke-virtual {v11}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v17

    move/from16 v18, v4

    .end local v4    # "tx":F
    .local v18, "tx":F
    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/io/font/FontMetrics;->getTypoDescender()I

    move-result v4

    int-to-float v4, v4

    .line 618
    .local v4, "descender":F
    invoke-virtual {v11}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/io/font/FontMetrics;->getBbox()[I

    move-result-object v17

    const/16 v19, 0x3

    aget v6, v17, v19

    int-to-float v6, v6

    .line 619
    .local v6, "ury":F
    move/from16 v17, v7

    .end local v7    # "angle":F
    .local v17, "angle":F
    iget-object v7, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 620
    iget-object v7, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-object/from16 v32, v11

    move/from16 v33, v12

    .end local v11    # "fp":Lcom/itextpdf/io/font/FontProgram;
    .end local v12    # "align":I
    .local v32, "fp":Lcom/itextpdf/io/font/FontProgram;
    .local v33, "align":I
    float-to-double v11, v9

    move-wide/from16 v20, v11

    float-to-double v11, v8

    move-object/from16 v19, v7

    neg-float v7, v8

    move/from16 v34, v8

    .end local v8    # "sin":F
    .local v34, "sin":F
    float-to-double v7, v7

    move-wide/from16 v24, v7

    float-to-double v7, v9

    move-wide/from16 v26, v7

    float-to-double v7, v3

    move-wide/from16 v28, v7

    float-to-double v7, v5

    move-wide/from16 v30, v7

    move-wide/from16 v22, v11

    invoke-virtual/range {v19 .. v31}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->concatMatrix(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 621
    and-int/lit8 v7, v33, 0x6

    const/4 v8, 0x6

    const/4 v11, 0x2

    if-ne v7, v8, :cond_1

    .line 622
    neg-float v7, v2

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v7, v8

    .end local v18    # "tx":F
    .local v7, "tx":F
    goto :goto_1

    .line 623
    .end local v7    # "tx":F
    .restart local v18    # "tx":F
    :cond_1
    and-int/lit8 v7, v33, 0x2

    if-ne v7, v11, :cond_2

    .line 624
    neg-float v7, v2

    .end local v18    # "tx":F
    .restart local v7    # "tx":F
    goto :goto_1

    .line 623
    .end local v7    # "tx":F
    .restart local v18    # "tx":F
    :cond_2
    move/from16 v7, v18

    .line 625
    .end local v18    # "tx":F
    .restart local v7    # "tx":F
    :goto_1
    and-int/lit8 v8, v33, 0x18

    const/16 v12, 0x18

    if-ne v8, v12, :cond_3

    .line 626
    const/4 v8, 0x0

    .end local v15    # "ty":F
    .local v8, "ty":F
    goto :goto_2

    .line 627
    .end local v8    # "ty":F
    .restart local v15    # "ty":F
    :cond_3
    and-int/lit8 v8, v33, 0x8

    const/16 v12, 0x8

    if-ne v8, v12, :cond_4

    .line 628
    neg-float v8, v4

    .end local v15    # "ty":F
    .restart local v8    # "ty":F
    goto :goto_2

    .line 630
    .end local v8    # "ty":F
    .restart local v15    # "ty":F
    :cond_4
    neg-float v8, v6

    .line 633
    .end local v15    # "ty":F
    .restart local v8    # "ty":F
    :goto_2
    iget-object v12, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getBackgroundMode()I

    move-result v12

    if-ne v12, v11, :cond_5

    .line 634
    iget-object v11, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getCurrentBackgroundColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v11

    .line 635
    .local v11, "textColor":Lcom/itextpdf/kernel/colors/Color;
    iget-object v12, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v12, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 636
    iget-object v12, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move v15, v3

    move/from16 v27, v4

    .end local v3    # "refX":F
    .end local v4    # "descender":F
    .local v15, "refX":F
    .local v27, "descender":F
    float-to-double v3, v7

    move-wide/from16 v19, v3

    add-float v3, v8, v27

    float-to-double v3, v3

    move-wide/from16 v21, v3

    float-to-double v3, v2

    move-wide/from16 v23, v3

    sub-float v3, v6, v27

    float-to-double v3, v3

    move-wide/from16 v25, v3

    move-object/from16 v18, v12

    invoke-virtual/range {v18 .. v26}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rectangle(DDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 637
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_3

    .line 633
    .end local v11    # "textColor":Lcom/itextpdf/kernel/colors/Color;
    .end local v15    # "refX":F
    .end local v27    # "descender":F
    .restart local v3    # "refX":F
    .restart local v4    # "descender":F
    :cond_5
    move v15, v3

    move/from16 v27, v4

    .line 639
    .end local v3    # "refX":F
    .end local v4    # "descender":F
    .restart local v15    # "refX":F
    .restart local v27    # "descender":F
    :goto_3
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getCurrentTextColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v3

    .line 640
    .local v3, "textColor":Lcom/itextpdf/kernel/colors/Color;
    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 641
    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->beginText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 642
    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    iget-object v11, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getCurrentFont()Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->getFont()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v11

    const-string v12, "Cp1252"

    move-object/from16 v18, v3

    .end local v3    # "textColor":Lcom/itextpdf/kernel/colors/Color;
    .local v18, "textColor":Lcom/itextpdf/kernel/colors/Color;
    sget-object v3, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->PREFER_EMBEDDED:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    invoke-static {v11, v12, v3}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v3

    invoke-virtual {v4, v3, v10}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFontAndSize(Lcom/itextpdf/kernel/font/PdfFont;F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 644
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v3, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setTextMatrix(FF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 645
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->showText(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 646
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 647
    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->isUnderline()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 648
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    float-to-double v11, v7

    const/high16 v19, 0x40800000    # 4.0f

    div-float v19, v10, v19

    const/high16 v20, 0x41700000    # 15.0f

    sub-float v4, v8, v19

    move-object/from16 v35, v3

    float-to-double v3, v4

    move-wide/from16 v38, v3

    float-to-double v3, v2

    div-float v1, v10, v20

    move-wide/from16 v40, v3

    float-to-double v3, v1

    move-wide/from16 v42, v3

    move-wide/from16 v36, v11

    invoke-virtual/range {v35 .. v43}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rectangle(DDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 649
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_4

    .line 647
    :cond_6
    const/high16 v20, 0x41700000    # 15.0f

    .line 651
    :goto_4
    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->isStrikeout()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 652
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    float-to-double v3, v7

    const/high16 v11, 0x40400000    # 3.0f

    div-float v11, v10, v11

    add-float/2addr v11, v8

    float-to-double v11, v11

    move-wide/from16 v36, v3

    float-to-double v3, v2

    move-object/from16 v35, v1

    div-float v1, v10, v20

    move/from16 v19, v2

    .end local v2    # "textWidth":F
    .local v19, "textWidth":F
    float-to-double v1, v1

    move-wide/from16 v42, v1

    move-wide/from16 v40, v3

    move-wide/from16 v38, v11

    invoke-virtual/range {v35 .. v43}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rectangle(DDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 653
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_5

    .line 651
    .end local v19    # "textWidth":F
    .restart local v2    # "textWidth":F
    :cond_7
    move/from16 v19, v2

    .line 655
    .end local v2    # "textWidth":F
    .restart local v19    # "textWidth":F
    :goto_5
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 656
    return-void
.end method

.method public readAll()V
    .locals 55
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 156
    move-object/from16 v1, p0

    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readInt()I

    move-result v0

    const v2, -0x65393229

    if-ne v0, v2, :cond_1c

    .line 159
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    .line 160
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v0

    iput v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->left:I

    .line 161
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v0

    iput v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->top:I

    .line 162
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v0

    iput v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->right:I

    .line 163
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v0

    iput v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->bottom:I

    .line 164
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v0

    iput v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->inch:I

    .line 165
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->right:I

    iget v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->left:I

    sub-int/2addr v2, v3

    int-to-float v2, v2

    iget v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->inch:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    const/high16 v3, 0x42900000    # 72.0f

    mul-float/2addr v2, v3

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setScalingX(F)V

    .line 166
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->bottom:I

    iget v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->top:I

    sub-int/2addr v2, v4

    int-to-float v2, v2

    iget v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->inch:I

    int-to-float v4, v4

    div-float/2addr v2, v4

    mul-float/2addr v2, v3

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setScalingY(F)V

    .line 167
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->left:I

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setOffsetWx(I)V

    .line 168
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->top:I

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setOffsetWy(I)V

    .line 169
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->right:I

    iget v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->left:I

    sub-int/2addr v2, v3

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setExtentWx(I)V

    .line 170
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->bottom:I

    iget v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->top:I

    sub-int/2addr v2, v3

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setExtentWy(I)V

    .line 171
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readInt()I

    .line 172
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    .line 173
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    const/16 v2, 0x12

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->skip(I)V

    .line 177
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    const/4 v10, 0x1

    invoke-virtual {v0, v10}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineCapStyle(I)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 178
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v0, v10}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineJoinStyle(I)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 180
    :goto_0
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->getLength()I

    move-result v11

    .line 181
    .local v11, "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readInt()I

    move-result v12

    .line 182
    .local v12, "tsize":I
    const/4 v0, 0x3

    if-ge v12, v0, :cond_0

    .line 183
    nop

    .line 581
    .end local v11    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->cleanup(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 582
    return-void

    .line 184
    .restart local v11    # "lenMarker":I
    :cond_0
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v13

    .line 185
    .local v13, "function":I
    const-string v5, "Cp1252"

    const/high16 v14, 0x40000000    # 2.0f

    const/4 v15, 0x0

    sparse-switch v13, :sswitch_data_0

    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .local v10, "tsize":I
    .local v26, "lenMarker":I
    goto/16 :goto_12

    .line 543
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_0
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readInt()I

    move-result v2

    .line 544
    .local v2, "rop":I
    const/16 v0, 0xf43

    if-ne v13, v0, :cond_1

    .line 545
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    .line 547
    :cond_1
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    .line 548
    .local v3, "srcHeight":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v4

    .line 549
    .local v4, "srcWidth":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v5

    .line 550
    .local v5, "ySrc":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v6

    .line 551
    .local v6, "xSrc":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v7

    invoke-virtual {v0, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v0

    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v7, v15}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v7

    sub-float v7, v0, v7

    .line 552
    .local v7, "destHeight":F
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v8, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v8

    invoke-virtual {v0, v8}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v0

    iget-object v8, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v8, v15}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v8

    sub-float v8, v0, v8

    .line 553
    .local v8, "destWidth":F
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v9

    invoke-virtual {v0, v9}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v9

    .line 554
    .local v9, "yDest":F
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v14, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v14

    invoke-virtual {v0, v14}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v14

    .line 555
    .local v14, "xDest":F
    mul-int/lit8 v0, v12, 0x2

    iget-object v15, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->getLength()I

    move-result v15

    sub-int/2addr v15, v11

    sub-int/2addr v0, v15

    new-array v15, v0, [B

    .line 556
    .local v15, "b":[B
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_1
    array-length v10, v15

    if-ge v0, v10, :cond_2

    .line 557
    iget-object v10, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readByte()I

    move-result v10

    int-to-byte v10, v10

    aput-byte v10, v15, v0

    .line 556
    add-int/lit8 v0, v0, 0x1

    const/4 v10, 0x1

    goto :goto_1

    .line 559
    .end local v0    # "k":I
    :cond_2
    :try_start_0
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 560
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    move/from16 v26, v11

    .end local v11    # "lenMarker":I
    .restart local v26    # "lenMarker":I
    float-to-double v10, v14

    move-wide/from16 v18, v10

    float-to-double v10, v9

    move/from16 v27, v9

    move-wide/from16 v20, v10

    .end local v9    # "yDest":F
    .local v27, "yDest":F
    float-to-double v9, v8

    move v11, v8

    move-wide/from16 v22, v9

    .end local v8    # "destWidth":F
    .local v11, "destWidth":F
    float-to-double v8, v7

    move-object/from16 v17, v0

    move-wide/from16 v24, v8

    :try_start_1
    invoke-virtual/range {v17 .. v25}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rectangle(DDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 561
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 562
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 563
    const/4 v8, 0x1

    invoke-static {v15, v8}, Lcom/itextpdf/io/image/ImageDataFactory;->createBmp([BZ)Lcom/itextpdf/io/image/ImageData;

    move-result-object v0

    .line 564
    .local v0, "bmpImage":Lcom/itextpdf/io/image/ImageData;
    new-instance v8, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    invoke-direct {v8, v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;-><init>(Lcom/itextpdf/io/image/ImageData;)V

    .line 566
    .local v8, "imageXObject":Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    invoke-virtual {v0}, Lcom/itextpdf/io/image/ImageData;->getWidth()F

    move-result v9

    mul-float/2addr v9, v11

    int-to-float v10, v4

    div-float/2addr v9, v10

    .line 567
    .local v9, "width":F
    neg-float v10, v7

    invoke-virtual {v0}, Lcom/itextpdf/io/image/ImageData;->getHeight()F

    move-result v17
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    mul-float v10, v10, v17

    move-object/from16 v17, v0

    .end local v0    # "bmpImage":Lcom/itextpdf/io/image/ImageData;
    .local v17, "bmpImage":Lcom/itextpdf/io/image/ImageData;
    int-to-float v0, v3

    div-float/2addr v10, v0

    .line 568
    .local v10, "height":F
    int-to-float v0, v6

    mul-float/2addr v0, v11

    move/from16 v18, v0

    int-to-float v0, v4

    div-float v0, v18, v0

    sub-float v0, v14, v0

    .line 569
    .local v0, "x":F
    move/from16 v18, v2

    .end local v2    # "rop":I
    .local v18, "rop":I
    int-to-float v2, v5

    mul-float/2addr v2, v7

    move/from16 v19, v2

    int-to-float v2, v3

    div-float v2, v19, v2

    add-float v2, v27, v2

    sub-float/2addr v2, v10

    .line 570
    .local v2, "y":F
    move/from16 v19, v3

    .end local v3    # "srcHeight":I
    .local v19, "srcHeight":I
    :try_start_2
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move/from16 v20, v4

    .end local v4    # "srcWidth":I
    .local v20, "srcWidth":I
    :try_start_3
    new-instance v4, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v4, v0, v2, v9, v10}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    invoke-virtual {v3, v8, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addXObjectFittedIntoRectangle(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 571
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 575
    move v10, v12

    .end local v0    # "x":F
    .end local v2    # "y":F
    .end local v8    # "imageXObject":Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    .end local v9    # "width":F
    .end local v10    # "height":F
    .end local v17    # "bmpImage":Lcom/itextpdf/io/image/ImageData;
    goto/16 :goto_12

    .line 573
    :catch_0
    move-exception v0

    goto :goto_2

    .end local v20    # "srcWidth":I
    .restart local v4    # "srcWidth":I
    :catch_1
    move-exception v0

    move/from16 v20, v4

    .end local v4    # "srcWidth":I
    .restart local v20    # "srcWidth":I
    goto :goto_2

    .end local v18    # "rop":I
    .end local v19    # "srcHeight":I
    .end local v20    # "srcWidth":I
    .local v2, "rop":I
    .restart local v3    # "srcHeight":I
    .restart local v4    # "srcWidth":I
    :catch_2
    move-exception v0

    move/from16 v18, v2

    move/from16 v19, v3

    move/from16 v20, v4

    .end local v2    # "rop":I
    .end local v3    # "srcHeight":I
    .end local v4    # "srcWidth":I
    .restart local v18    # "rop":I
    .restart local v19    # "srcHeight":I
    .restart local v20    # "srcWidth":I
    goto :goto_2

    .end local v18    # "rop":I
    .end local v19    # "srcHeight":I
    .end local v20    # "srcWidth":I
    .end local v26    # "lenMarker":I
    .end local v27    # "yDest":F
    .restart local v2    # "rop":I
    .restart local v3    # "srcHeight":I
    .restart local v4    # "srcWidth":I
    .local v8, "destWidth":F
    .local v9, "yDest":F
    .local v11, "lenMarker":I
    :catch_3
    move-exception v0

    move/from16 v18, v2

    move/from16 v19, v3

    move/from16 v20, v4

    move/from16 v27, v9

    move/from16 v26, v11

    move v11, v8

    .line 576
    .end local v2    # "rop":I
    .end local v3    # "srcHeight":I
    .end local v4    # "srcWidth":I
    .end local v8    # "destWidth":F
    .end local v9    # "yDest":F
    .local v11, "destWidth":F
    .restart local v18    # "rop":I
    .restart local v19    # "srcHeight":I
    .restart local v20    # "srcWidth":I
    .restart local v26    # "lenMarker":I
    .restart local v27    # "yDest":F
    :goto_2
    move v10, v12

    goto/16 :goto_12

    .line 457
    .end local v5    # "ySrc":I
    .end local v6    # "xSrc":I
    .end local v7    # "destHeight":F
    .end local v14    # "xDest":F
    .end local v15    # "b":[B
    .end local v18    # "rop":I
    .end local v19    # "srcHeight":I
    .end local v20    # "srcWidth":I
    .end local v26    # "lenMarker":I
    .end local v27    # "yDest":F
    .local v11, "lenMarker":I
    :sswitch_1
    move/from16 v26, v11

    .end local v11    # "lenMarker":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    .line 458
    .local v3, "y":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    .line 459
    .local v2, "x":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v10

    .line 460
    .local v10, "count":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v4

    .line 461
    .local v4, "flag":I
    const/4 v0, 0x0

    .line 462
    .local v0, "x1":I
    const/4 v6, 0x0

    .line 463
    .local v6, "y1":I
    const/4 v7, 0x0

    .line 464
    .local v7, "x2":I
    const/4 v8, 0x0

    .line 465
    .local v8, "y2":I
    and-int/lit8 v9, v4, 0x6

    if-eqz v9, :cond_3

    .line 466
    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v0

    .line 467
    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v6

    .line 468
    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v7

    .line 469
    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v8

    move v9, v8

    move v8, v7

    move v7, v6

    move v6, v0

    goto :goto_3

    .line 465
    :cond_3
    move v9, v8

    move v8, v7

    move v7, v6

    move v6, v0

    .line 471
    .end local v0    # "x1":I
    .local v6, "x1":I
    .local v7, "y1":I
    .local v8, "x2":I
    .local v9, "y2":I
    :goto_3
    new-array v11, v10, [B

    .line 473
    .local v11, "text":[B
    const/4 v0, 0x0

    move v14, v0

    .local v14, "k":I
    :goto_4
    if-ge v14, v10, :cond_5

    .line 474
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readByte()I

    move-result v0

    int-to-byte v0, v0

    .line 475
    .local v0, "c":B
    if-nez v0, :cond_4

    .line 476
    goto :goto_5

    .line 477
    :cond_4
    aput-byte v0, v11, v14

    .line 473
    .end local v0    # "c":B
    add-int/lit8 v14, v14, 0x1

    goto :goto_4

    .line 481
    :cond_5
    :goto_5
    :try_start_4
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v11, v15, v14, v5}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_4} :catch_4

    .line 485
    .local v0, "s":Ljava/lang/String;
    goto :goto_6

    .line 483
    .end local v0    # "s":Ljava/lang/String;
    :catch_4
    move-exception v0

    .line 484
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v11, v15, v14}, Ljava/lang/String;-><init>([BII)V

    move-object v0, v5

    .line 486
    .local v0, "s":Ljava/lang/String;
    :goto_6
    move v5, v6

    move v6, v7

    move v7, v8

    move v8, v9

    move-object v9, v0

    .end local v0    # "s":Ljava/lang/String;
    .local v5, "x1":I
    .local v6, "y1":I
    .local v7, "x2":I
    .local v8, "y2":I
    .local v9, "s":Ljava/lang/String;
    invoke-virtual/range {v1 .. v9}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->outputText(IIIIIIILjava/lang/String;)V

    .line 487
    move v10, v12

    goto/16 :goto_12

    .line 386
    .end local v2    # "x":I
    .end local v3    # "y":I
    .end local v4    # "flag":I
    .end local v5    # "x1":I
    .end local v6    # "y1":I
    .end local v7    # "x2":I
    .end local v8    # "y2":I
    .end local v9    # "s":Ljava/lang/String;
    .end local v10    # "count":I
    .end local v14    # "k":I
    .end local v26    # "lenMarker":I
    .local v11, "lenMarker":I
    :sswitch_2
    move/from16 v26, v11

    .end local v11    # "lenMarker":I
    .restart local v26    # "lenMarker":I
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getLineNeutral()Z

    move-result v5

    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->isNullStrokeFill(Z)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 387
    move v10, v12

    goto/16 :goto_12

    .line 388
    :cond_6
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v10, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v10

    invoke-virtual {v5, v10}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v5

    .line 389
    .local v5, "yend":F
    iget-object v10, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v11, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v11

    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v10

    .line 390
    .local v10, "xend":F
    iget-object v11, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    move/from16 v17, v0

    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v0

    invoke-virtual {v11, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v0

    .line 391
    .local v0, "ystart":F
    iget-object v11, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    const/16 v18, 0x7

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    invoke-virtual {v11, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v2

    .line 392
    .local v2, "xstart":F
    iget-object v11, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    const/16 v19, 0x5

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    invoke-virtual {v11, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v3

    .line 393
    .local v3, "b":F
    iget-object v11, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    const/16 v20, 0x4

    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v4

    invoke-virtual {v11, v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v4

    .line 394
    .local v4, "r":F
    iget-object v11, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    const/high16 v21, 0x43b40000    # 360.0f

    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v6

    invoke-virtual {v11, v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v6

    .line 395
    .local v6, "t":F
    iget-object v11, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    const/16 v22, 0x0

    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v7

    invoke-virtual {v11, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v7

    .line 396
    .local v7, "l":F
    add-float v11, v4, v7

    div-float/2addr v11, v14

    .line 397
    .local v11, "cx":F
    add-float v23, v6, v3

    div-float v14, v23, v14

    .line 398
    .local v14, "cy":F
    const/16 v23, 0x6

    invoke-static {v11, v14, v2, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->getArc(FFFF)F

    move-result v8

    .line 399
    .local v8, "arc1":F
    invoke-static {v11, v14, v10, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->getArc(FFFF)F

    move-result v24

    .line 400
    .local v24, "arc2":F
    sub-float v24, v24, v8

    .line 401
    cmpg-float v22, v24, v22

    if-gtz v22, :cond_7

    .line 402
    add-float v24, v24, v21

    move/from16 v9, v24

    const/16 v25, 0x2

    goto :goto_7

    .line 401
    :cond_7
    move/from16 v9, v24

    const/16 v25, 0x2

    .line 403
    .end local v24    # "arc2":F
    .local v9, "arc2":F
    :goto_7
    move/from16 v24, v10

    move/from16 v39, v11

    .end local v10    # "xend":F
    .end local v11    # "cx":F
    .local v24, "xend":F
    .local v39, "cx":F
    float-to-double v10, v7

    move-wide/from16 v27, v10

    float-to-double v10, v3

    move/from16 v40, v2

    move/from16 v41, v3

    .end local v2    # "xstart":F
    .end local v3    # "b":F
    .local v40, "xstart":F
    .local v41, "b":F
    float-to-double v2, v4

    move-wide/from16 v31, v2

    float-to-double v2, v6

    move-wide/from16 v33, v2

    float-to-double v2, v8

    move-wide/from16 v35, v2

    float-to-double v2, v9

    move-wide/from16 v37, v2

    move-wide/from16 v29, v10

    invoke-static/range {v27 .. v38}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->bezierArc(DDDDDD)Ljava/util/List;

    move-result-object v2

    .line 404
    .local v2, "ar":Ljava/util/List;, "Ljava/util/List<[D>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_8

    .line 405
    move v10, v12

    goto/16 :goto_12

    .line 406
    :cond_8
    invoke-interface {v2, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [D

    .line 407
    .local v3, "pt":[D
    aget-wide v10, v3, v15

    double-to-float v10, v10

    .line 408
    .end local v39    # "cx":F
    .local v10, "cx":F
    move/from16 v27, v4

    move v11, v5

    const/16 v16, 0x1

    .end local v4    # "r":F
    .end local v5    # "yend":F
    .local v11, "yend":F
    .local v27, "r":F
    aget-wide v4, v3, v16

    double-to-float v4, v4

    .line 409
    .end local v14    # "cy":F
    .local v4, "cy":F
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    float-to-double v14, v10

    move/from16 v28, v6

    move/from16 v29, v7

    .end local v6    # "t":F
    .end local v7    # "l":F
    .local v28, "t":F
    .local v29, "l":F
    float-to-double v6, v4

    invoke-virtual {v5, v14, v15, v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 410
    const/4 v5, 0x0

    .local v5, "k":I
    :goto_8
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_9

    .line 411
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object v3, v6

    check-cast v3, [D

    .line 412
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    aget-wide v43, v3, v25

    aget-wide v45, v3, v17

    aget-wide v47, v3, v20

    aget-wide v49, v3, v19

    aget-wide v51, v3, v23

    aget-wide v53, v3, v18

    move-object/from16 v42, v6

    invoke-virtual/range {v42 .. v54}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->curveTo(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 410
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    .line 414
    .end local v5    # "k":I
    :cond_9
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    float-to-double v6, v10

    float-to-double v14, v4

    invoke-virtual {v5, v6, v7, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 415
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->strokeAndFill()V

    .line 416
    move v10, v12

    goto/16 :goto_12

    .line 353
    .end local v0    # "ystart":F
    .end local v2    # "ar":Ljava/util/List;, "Ljava/util/List<[D>;"
    .end local v3    # "pt":[D
    .end local v4    # "cy":F
    .end local v8    # "arc1":F
    .end local v9    # "arc2":F
    .end local v10    # "cx":F
    .end local v24    # "xend":F
    .end local v26    # "lenMarker":I
    .end local v27    # "r":F
    .end local v28    # "t":F
    .end local v29    # "l":F
    .end local v40    # "xstart":F
    .end local v41    # "b":F
    .local v11, "lenMarker":I
    :sswitch_3
    move/from16 v17, v0

    move/from16 v26, v11

    const/16 v18, 0x7

    const/16 v19, 0x5

    const/16 v20, 0x4

    const/high16 v21, 0x43b40000    # 360.0f

    const/16 v22, 0x0

    const/16 v23, 0x6

    const/16 v25, 0x2

    .end local v11    # "lenMarker":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getLineNeutral()Z

    move-result v0

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->isNullStrokeFill(Z)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 354
    move v10, v12

    goto/16 :goto_12

    .line 355
    :cond_a
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v0

    .line 356
    .local v0, "yend":F
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v2

    .line 357
    .local v2, "xend":F
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v3

    .line 358
    .local v3, "ystart":F
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v4

    .line 359
    .local v4, "xstart":F
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v5

    .line 360
    .local v5, "b":F
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v6

    .line 361
    .local v6, "r":F
    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v8, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v8

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v7

    .line 362
    .local v7, "t":F
    iget-object v8, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v8

    .line 363
    .local v8, "l":F
    add-float v9, v6, v8

    div-float/2addr v9, v14

    .line 364
    .local v9, "cx":F
    add-float v10, v7, v5

    div-float/2addr v10, v14

    .line 365
    .local v10, "cy":F
    invoke-static {v9, v10, v4, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->getArc(FFFF)F

    move-result v11

    .line 366
    .local v11, "arc1":F
    invoke-static {v9, v10, v2, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->getArc(FFFF)F

    move-result v14

    .line 367
    .local v14, "arc2":F
    sub-float/2addr v14, v11

    .line 368
    cmpg-float v22, v14, v22

    if-gtz v22, :cond_b

    .line 369
    add-float v14, v14, v21

    .line 370
    :cond_b
    move/from16 v24, v2

    move/from16 v39, v3

    .end local v2    # "xend":F
    .end local v3    # "ystart":F
    .restart local v24    # "xend":F
    .local v39, "ystart":F
    float-to-double v2, v8

    move-wide/from16 v27, v2

    float-to-double v2, v5

    move-wide/from16 v29, v2

    float-to-double v2, v6

    move-wide/from16 v31, v2

    float-to-double v2, v7

    move-wide/from16 v33, v2

    float-to-double v2, v11

    move-wide/from16 v35, v2

    float-to-double v2, v14

    move-wide/from16 v37, v2

    invoke-static/range {v27 .. v38}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->bezierArc(DDDDDD)Ljava/util/List;

    move-result-object v2

    .line 371
    .local v2, "ar":Ljava/util/List;, "Ljava/util/List<[D>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_c

    .line 372
    move v10, v12

    goto/16 :goto_12

    .line 373
    :cond_c
    invoke-interface {v2, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [D

    .line 374
    .local v3, "pt":[D
    move/from16 v27, v15

    iget-object v15, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-object/from16 v21, v3

    move/from16 v28, v4

    .end local v3    # "pt":[D
    .end local v4    # "xstart":F
    .local v21, "pt":[D
    .local v28, "xstart":F
    float-to-double v3, v9

    move/from16 v29, v5

    move/from16 v30, v6

    .end local v5    # "b":F
    .end local v6    # "r":F
    .local v29, "b":F
    .local v30, "r":F
    float-to-double v5, v10

    invoke-virtual {v15, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 375
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    aget-wide v4, v21, v27

    move v15, v7

    const/16 v16, 0x1

    .end local v7    # "t":F
    .local v15, "t":F
    aget-wide v6, v21, v16

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 376
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_9
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_d

    .line 377
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v21, v4

    check-cast v21, [D

    .line 378
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    aget-wide v41, v21, v25

    aget-wide v43, v21, v17

    aget-wide v45, v21, v20

    aget-wide v47, v21, v19

    aget-wide v49, v21, v23

    aget-wide v51, v21, v18

    move-object/from16 v40, v4

    invoke-virtual/range {v40 .. v52}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->curveTo(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 376
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 380
    .end local v3    # "k":I
    :cond_d
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    float-to-double v4, v9

    float-to-double v6, v10

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 381
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->strokeAndFill()V

    .line 382
    move v10, v12

    goto/16 :goto_12

    .line 330
    .end local v0    # "yend":F
    .end local v2    # "ar":Ljava/util/List;, "Ljava/util/List<[D>;"
    .end local v8    # "l":F
    .end local v9    # "cx":F
    .end local v10    # "cy":F
    .end local v14    # "arc2":F
    .end local v15    # "t":F
    .end local v21    # "pt":[D
    .end local v24    # "xend":F
    .end local v26    # "lenMarker":I
    .end local v28    # "xstart":F
    .end local v29    # "b":F
    .end local v30    # "r":F
    .end local v39    # "ystart":F
    .local v11, "lenMarker":I
    :sswitch_4
    move/from16 v26, v11

    const/high16 v21, 0x43b40000    # 360.0f

    const/16 v22, 0x0

    .end local v11    # "lenMarker":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getLineNeutral()Z

    move-result v0

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->isNullStrokeFill(Z)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 331
    move v10, v12

    goto/16 :goto_12

    .line 332
    :cond_e
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v0

    .line 333
    .restart local v0    # "yend":F
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v2

    .line 334
    .local v2, "xend":F
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v3

    .line 335
    .local v3, "ystart":F
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v4

    .line 336
    .restart local v4    # "xstart":F
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v5

    .line 337
    .restart local v5    # "b":F
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v6

    .line 338
    .restart local v6    # "r":F
    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v8, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v8

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v7

    .line 339
    .restart local v7    # "t":F
    iget-object v8, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v8

    .line 340
    .restart local v8    # "l":F
    add-float v9, v6, v8

    div-float/2addr v9, v14

    .line 341
    .restart local v9    # "cx":F
    add-float v10, v7, v5

    div-float/2addr v10, v14

    .line 342
    .restart local v10    # "cy":F
    invoke-static {v9, v10, v4, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->getArc(FFFF)F

    move-result v11

    .line 343
    .local v11, "arc1":F
    invoke-static {v9, v10, v2, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->getArc(FFFF)F

    move-result v14

    .line 344
    .restart local v14    # "arc2":F
    sub-float/2addr v14, v11

    .line 345
    cmpg-float v15, v14, v22

    if-gtz v15, :cond_f

    .line 346
    add-float v14, v14, v21

    .line 347
    :cond_f
    iget-object v15, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move/from16 v17, v2

    move/from16 v18, v3

    .end local v2    # "xend":F
    .end local v3    # "ystart":F
    .local v17, "xend":F
    .local v18, "ystart":F
    float-to-double v2, v8

    move-wide/from16 v28, v2

    float-to-double v2, v5

    move-wide/from16 v30, v2

    float-to-double v2, v6

    move-wide/from16 v32, v2

    float-to-double v2, v7

    move-wide/from16 v34, v2

    float-to-double v2, v11

    move-wide/from16 v36, v2

    float-to-double v2, v14

    move-wide/from16 v38, v2

    move-object/from16 v27, v15

    invoke-virtual/range {v27 .. v39}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arc(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 348
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 349
    move v10, v12

    goto/16 :goto_12

    .line 432
    .end local v0    # "yend":F
    .end local v4    # "xstart":F
    .end local v5    # "b":F
    .end local v6    # "r":F
    .end local v7    # "t":F
    .end local v8    # "l":F
    .end local v9    # "cx":F
    .end local v10    # "cy":F
    .end local v14    # "arc2":F
    .end local v17    # "xend":F
    .end local v18    # "ystart":F
    .end local v26    # "lenMarker":I
    .local v11, "lenMarker":I
    :sswitch_5
    move/from16 v26, v11

    move/from16 v27, v15

    .end local v11    # "lenMarker":I
    .restart local v26    # "lenMarker":I
    const/4 v8, 0x1

    invoke-virtual {v1, v8}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->isNullStrokeFill(Z)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 433
    move v10, v12

    goto/16 :goto_12

    .line 434
    :cond_10
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    move/from16 v2, v27

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v0

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v2

    sub-float/2addr v0, v2

    .line 435
    .local v0, "h":F
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v2

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v3

    sub-float/2addr v2, v3

    .line 436
    .local v2, "w":F
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v3

    .line 437
    .local v3, "b":F
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v4

    .line 438
    .local v4, "r":F
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v5

    .line 439
    .local v5, "t":F
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v6

    .line 440
    .local v6, "l":F
    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    float-to-double v8, v6

    float-to-double v10, v3

    sub-float v14, v4, v6

    float-to-double v14, v14

    move/from16 v17, v0

    .end local v0    # "h":F
    .local v17, "h":F
    sub-float v0, v5, v3

    move/from16 v18, v2

    move/from16 v19, v3

    .end local v2    # "w":F
    .end local v3    # "b":F
    .local v18, "w":F
    .local v19, "b":F
    float-to-double v2, v0

    add-float v0, v17, v18

    const/high16 v20, 0x40800000    # 4.0f

    div-float v0, v0, v20

    move-wide/from16 v34, v2

    float-to-double v2, v0

    move-wide/from16 v36, v2

    move-object/from16 v27, v7

    move-wide/from16 v28, v8

    move-wide/from16 v30, v10

    move-wide/from16 v32, v14

    invoke-virtual/range {v27 .. v37}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->roundRectangle(DDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 441
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->strokeAndFill()V

    .line 442
    move v10, v12

    goto/16 :goto_12

    .line 295
    .end local v4    # "r":F
    .end local v5    # "t":F
    .end local v6    # "l":F
    .end local v17    # "h":F
    .end local v18    # "w":F
    .end local v19    # "b":F
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    :sswitch_6
    move/from16 v26, v11

    .end local v11    # "lenMarker":I
    .restart local v26    # "lenMarker":I
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->isNullStrokeFill(Z)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 296
    move v10, v12

    goto/16 :goto_12

    .line 297
    :cond_11
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v0

    .line 298
    .local v0, "numPoly":I
    new-array v2, v0, [I

    .line 299
    .local v2, "lens":[I
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_a
    array-length v4, v2

    if-ge v3, v4, :cond_12

    .line 300
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v4

    aput v4, v2, v3

    .line 299
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 301
    .end local v3    # "k":I
    :cond_12
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_b
    array-length v4, v2

    if-ge v3, v4, :cond_14

    .line 302
    aget v4, v2, v3

    .line 303
    .local v4, "len":I
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v5

    .line 304
    .local v5, "sx":I
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v6

    .line 305
    .local v6, "sy":I
    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    iget-object v8, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v8, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v8

    float-to-double v8, v8

    iget-object v10, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v10, v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v10

    float-to-double v10, v10

    invoke-virtual {v7, v8, v9, v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 306
    const/4 v7, 0x1

    .local v7, "k":I
    :goto_c
    if-ge v7, v4, :cond_13

    .line 307
    iget-object v8, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v8

    .line 308
    .local v8, "x":I
    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v9

    .line 309
    .local v9, "y":I
    iget-object v10, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    iget-object v11, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v11, v8}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v11

    float-to-double v14, v11

    iget-object v11, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v11, v9}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v11

    move-object/from16 v17, v2

    move/from16 v18, v3

    .end local v2    # "lens":[I
    .end local v3    # "j":I
    .local v17, "lens":[I
    .local v18, "j":I
    float-to-double v2, v11

    invoke-virtual {v10, v14, v15, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 306
    .end local v8    # "x":I
    .end local v9    # "y":I
    add-int/lit8 v7, v7, 0x1

    move-object/from16 v2, v17

    move/from16 v3, v18

    goto :goto_c

    .end local v17    # "lens":[I
    .end local v18    # "j":I
    .restart local v2    # "lens":[I
    .restart local v3    # "j":I
    :cond_13
    move-object/from16 v17, v2

    move/from16 v18, v3

    .line 311
    .end local v2    # "lens":[I
    .end local v3    # "j":I
    .end local v7    # "k":I
    .restart local v17    # "lens":[I
    .restart local v18    # "j":I
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v3

    float-to-double v7, v3

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v3, v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v3

    float-to-double v9, v3

    invoke-virtual {v2, v7, v8, v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 301
    .end local v4    # "len":I
    .end local v5    # "sx":I
    .end local v6    # "sy":I
    add-int/lit8 v3, v18, 0x1

    move-object/from16 v2, v17

    .end local v18    # "j":I
    .restart local v3    # "j":I
    goto :goto_b

    .end local v17    # "lens":[I
    .restart local v2    # "lens":[I
    :cond_14
    move-object/from16 v17, v2

    move/from16 v18, v3

    .line 313
    .end local v2    # "lens":[I
    .end local v3    # "j":I
    .restart local v17    # "lens":[I
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->strokeAndFill()V

    .line 314
    move v10, v12

    goto/16 :goto_12

    .line 491
    .end local v0    # "numPoly":I
    .end local v17    # "lens":[I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    :sswitch_7
    move/from16 v26, v11

    .end local v11    # "lenMarker":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v2

    .line 492
    .local v2, "count":I
    new-array v10, v2, [B

    .line 494
    .local v10, "text":[B
    const/4 v0, 0x0

    move v11, v0

    .local v11, "k":I
    :goto_d
    if-ge v11, v2, :cond_16

    .line 495
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readByte()I

    move-result v0

    int-to-byte v0, v0

    .line 496
    .local v0, "c":B
    if-nez v0, :cond_15

    .line 497
    goto :goto_e

    .line 498
    :cond_15
    aput-byte v0, v10, v11

    .line 494
    .end local v0    # "c":B
    add-int/lit8 v11, v11, 0x1

    goto :goto_d

    .line 502
    :cond_16
    :goto_e
    :try_start_5
    new-instance v0, Ljava/lang/String;

    const/4 v4, 0x0

    invoke-direct {v0, v10, v4, v11, v5}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_5 .. :try_end_5} :catch_5

    .line 506
    .local v0, "s":Ljava/lang/String;
    move-object v9, v0

    goto :goto_f

    .line 504
    .end local v0    # "s":Ljava/lang/String;
    :catch_5
    move-exception v0

    .line 505
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    invoke-direct {v3, v10, v4, v11}, Ljava/lang/String;-><init>([BII)V

    move-object v9, v3

    .line 507
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .local v9, "s":Ljava/lang/String;
    :goto_f
    add-int/lit8 v0, v2, 0x1

    const v3, 0xfffe

    and-int/2addr v0, v3

    .line 508
    .end local v2    # "count":I
    .local v0, "count":I
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    sub-int v3, v0, v11

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->skip(I)V

    .line 509
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    .line 510
    .local v3, "y":I
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    .line 511
    .local v2, "x":I
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v9}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->outputText(IIIIIIILjava/lang/String;)V

    .line 512
    move v10, v12

    goto/16 :goto_12

    .line 531
    .end local v0    # "count":I
    .end local v2    # "x":I
    .end local v3    # "y":I
    .end local v9    # "s":Ljava/lang/String;
    .end local v10    # "text":[B
    .end local v26    # "lenMarker":I
    .local v11, "lenMarker":I
    :sswitch_8
    move/from16 v26, v11

    .end local v11    # "lenMarker":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    .line 532
    .local v0, "color":Lcom/itextpdf/kernel/colors/Color;
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    .line 533
    .local v2, "y":I
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    .line 534
    .local v3, "x":I
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 535
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v4, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 536
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v5, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v5

    float-to-double v5, v5

    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v7, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v7

    float-to-double v7, v7

    const-wide v22, 0x3fc99999a0000000L    # 0.20000000298023224

    const-wide v24, 0x3fc99999a0000000L    # 0.20000000298023224

    move-object/from16 v17, v4

    move-wide/from16 v18, v5

    move-wide/from16 v20, v7

    invoke-virtual/range {v17 .. v25}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rectangle(DDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 537
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 538
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 539
    move v10, v12

    goto/16 :goto_12

    .line 420
    .end local v0    # "color":Lcom/itextpdf/kernel/colors/Color;
    .end local v2    # "y":I
    .end local v3    # "x":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    :sswitch_9
    move/from16 v26, v11

    .end local v11    # "lenMarker":I
    .restart local v26    # "lenMarker":I
    const/4 v8, 0x1

    invoke-virtual {v1, v8}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->isNullStrokeFill(Z)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 421
    move v10, v12

    goto/16 :goto_12

    .line 422
    :cond_17
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v0

    .line 423
    .local v0, "b":F
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v2

    .line 424
    .local v2, "r":F
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v3

    .line 425
    .local v3, "t":F
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v4

    .line 426
    .local v4, "l":F
    iget-object v14, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    float-to-double v5, v4

    float-to-double v9, v0

    sub-float v7, v2, v4

    move-wide/from16 v17, v9

    float-to-double v8, v7

    sub-float v7, v3, v0

    move v10, v12

    .end local v12    # "tsize":I
    .local v10, "tsize":I
    float-to-double v11, v7

    move-wide v15, v5

    move-wide/from16 v19, v8

    move-wide/from16 v21, v11

    invoke-virtual/range {v14 .. v22}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rectangle(DDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 427
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->strokeAndFill()V

    .line 428
    goto/16 :goto_12

    .line 318
    .end local v0    # "b":F
    .end local v2    # "r":F
    .end local v3    # "t":F
    .end local v4    # "l":F
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_a
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getLineNeutral()Z

    move-result v0

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->isNullStrokeFill(Z)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 319
    goto/16 :goto_12

    .line 320
    :cond_18
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v0

    .line 321
    .local v0, "b":I
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    .line 322
    .local v2, "r":I
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    .line 323
    .local v3, "t":I
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v4

    .line 324
    .local v4, "l":I
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v6, v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v6

    float-to-double v6, v6

    iget-object v8, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v8, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v8

    float-to-double v8, v8

    iget-object v11, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v11, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v11

    float-to-double v11, v11

    iget-object v14, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v14, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v14

    float-to-double v14, v14

    const-wide/16 v36, 0x0

    const-wide v38, 0x4076800000000000L    # 360.0

    move-object/from16 v27, v5

    move-wide/from16 v28, v6

    move-wide/from16 v30, v8

    move-wide/from16 v32, v11

    move-wide/from16 v34, v14

    invoke-virtual/range {v27 .. v39}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arc(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 325
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->strokeAndFill()V

    .line 326
    goto/16 :goto_12

    .line 446
    .end local v0    # "b":I
    .end local v2    # "r":I
    .end local v3    # "t":I
    .end local v4    # "l":I
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_b
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v0

    .line 447
    .local v0, "b":F
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v2

    .line 448
    .local v2, "r":F
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v3

    .line 449
    .local v3, "t":F
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v4

    .line 450
    .local v4, "l":F
    iget-object v14, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    float-to-double v5, v4

    float-to-double v7, v0

    sub-float v9, v2, v4

    float-to-double v11, v9

    sub-float v9, v3, v0

    move/from16 v24, v2

    move/from16 v25, v3

    .end local v2    # "r":F
    .end local v3    # "t":F
    .local v24, "r":F
    .local v25, "t":F
    float-to-double v2, v9

    move-wide/from16 v21, v2

    move-wide v15, v5

    move-wide/from16 v17, v7

    move-wide/from16 v19, v11

    invoke-virtual/range {v14 .. v22}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rectangle(DDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 451
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->eoClip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 452
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 453
    goto/16 :goto_12

    .line 263
    .end local v0    # "b":F
    .end local v4    # "l":F
    .end local v10    # "tsize":I
    .end local v24    # "r":F
    .end local v25    # "t":F
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_c
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setLineJoinPolygon(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 264
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v0

    .line 265
    .local v0, "len":I
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    .line 266
    .local v2, "x":I
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    .line 267
    .local v3, "y":I
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v5, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v5

    float-to-double v5, v5

    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v7, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v7

    float-to-double v7, v7

    invoke-virtual {v4, v5, v6, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 268
    const/4 v4, 0x1

    .local v4, "k":I
    :goto_10
    if-ge v4, v0, :cond_19

    .line 269
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    .line 270
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    .line 271
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v6, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v6

    float-to-double v6, v6

    iget-object v8, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v8, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v8

    float-to-double v8, v8

    invoke-virtual {v5, v6, v7, v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 268
    add-int/lit8 v4, v4, 0x1

    goto :goto_10

    .line 273
    .end local v4    # "k":I
    :cond_19
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 274
    goto/16 :goto_12

    .line 278
    .end local v0    # "len":I
    .end local v2    # "x":I
    .end local v3    # "y":I
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_d
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->isNullStrokeFill(Z)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 279
    goto/16 :goto_12

    .line 280
    :cond_1a
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v0

    .line 281
    .restart local v0    # "len":I
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    .line 282
    .local v2, "sx":I
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    .line 283
    .local v3, "sy":I
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v5, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v5

    float-to-double v5, v5

    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v7, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v7

    float-to-double v7, v7

    invoke-virtual {v4, v5, v6, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 284
    const/4 v4, 0x1

    .restart local v4    # "k":I
    :goto_11
    if-ge v4, v0, :cond_1b

    .line 285
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v5

    .line 286
    .local v5, "x":I
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v6

    .line 287
    .local v6, "y":I
    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    iget-object v8, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v8, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v8

    float-to-double v8, v8

    iget-object v11, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v11, v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v11

    float-to-double v11, v11

    invoke-virtual {v7, v8, v9, v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 284
    .end local v5    # "x":I
    .end local v6    # "y":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    .line 289
    .end local v4    # "k":I
    :cond_1b
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v5, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v5

    float-to-double v5, v5

    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v7, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v7

    float-to-double v7, v7

    invoke-virtual {v4, v5, v6, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 290
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->strokeAndFill()V

    .line 291
    goto/16 :goto_12

    .line 202
    .end local v0    # "len":I
    .end local v2    # "sx":I
    .end local v3    # "sy":I
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_e
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;-><init>()V

    .line 203
    .local v0, "brush":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;->init(Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;)V

    .line 204
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->addMetaObject(Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;)V

    .line 205
    goto/16 :goto_12

    .line 209
    .end local v0    # "brush":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_f
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;-><init>()V

    .line 210
    .local v0, "font":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->init(Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;)V

    .line 211
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->addMetaObject(Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;)V

    .line 212
    goto/16 :goto_12

    .line 195
    .end local v0    # "font":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_10
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;-><init>()V

    .line 196
    .local v0, "pen":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;->init(Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;)V

    .line 197
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->addMetaObject(Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;)V

    .line 198
    goto/16 :goto_12

    .line 245
    .end local v0    # "pen":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_11
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v0

    .line 246
    .local v0, "y":I
    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v3

    invoke-direct {v2, v3, v0}, Lcom/itextpdf/kernel/geom/Point;-><init>(II)V

    .line 247
    .local v2, "p":Lcom/itextpdf/kernel/geom/Point;
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setCurrentPoint(Lcom/itextpdf/kernel/geom/Point;)V

    .line 248
    goto/16 :goto_12

    .line 252
    .end local v0    # "y":I
    .end local v2    # "p":Lcom/itextpdf/kernel/geom/Point;
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_12
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v0

    .line 253
    .restart local v0    # "y":I
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    .line 254
    .local v2, "x":I
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getCurrentPoint()Lcom/itextpdf/kernel/geom/Point;

    move-result-object v3

    .line 255
    .local v3, "p":Lcom/itextpdf/kernel/geom/Point;
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v6

    double-to-int v6, v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v5

    float-to-double v5, v5

    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v8

    double-to-int v8, v8

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v7

    float-to-double v7, v7

    invoke-virtual {v4, v5, v6, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 256
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v5, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformX(I)F

    move-result v5

    float-to-double v5, v5

    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v7, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v7

    float-to-double v7, v7

    invoke-virtual {v4, v5, v6, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 257
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 258
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v5, v2, v0}, Lcom/itextpdf/kernel/geom/Point;-><init>(II)V

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setCurrentPoint(Lcom/itextpdf/kernel/geom/Point;)V

    .line 259
    goto/16 :goto_12

    .line 240
    .end local v0    # "y":I
    .end local v2    # "x":I
    .end local v3    # "p":Lcom/itextpdf/kernel/geom/Point;
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_13
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setExtentWy(I)V

    .line 241
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setExtentWx(I)V

    .line 242
    goto/16 :goto_12

    .line 236
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_14
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setOffsetWy(I)V

    .line 237
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setOffsetWx(I)V

    .line 238
    goto/16 :goto_12

    .line 518
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_15
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setCurrentTextColor(Lcom/itextpdf/kernel/colors/Color;)V

    .line 519
    goto/16 :goto_12

    .line 515
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_16
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setCurrentBackgroundColor(Lcom/itextpdf/kernel/colors/Color;)V

    .line 516
    goto/16 :goto_12

    .line 222
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_17
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v0

    .line 223
    .local v0, "idx":I
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->deleteMetaObject(I)V

    .line 224
    goto/16 :goto_12

    .line 521
    .end local v0    # "idx":I
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_18
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setTextAlign(I)V

    .line 522
    goto/16 :goto_12

    .line 216
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_19
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v0

    .line 217
    .restart local v0    # "idx":I
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v2, v0, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->selectMetaObject(ILcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 218
    goto :goto_12

    .line 231
    .end local v0    # "idx":I
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_1a
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v0

    .line 232
    .restart local v0    # "idx":I
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v2, v0, v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->restoreState(ILcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 233
    goto :goto_12

    .line 527
    .end local v0    # "idx":I
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_1b
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setPolyFillMode(I)V

    .line 528
    goto :goto_12

    .line 524
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_1c
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setBackgroundMode(I)V

    .line 525
    goto :goto_12

    .line 191
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_1d
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    new-instance v2, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;-><init>()V

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->addMetaObject(Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;)V

    .line 192
    goto :goto_12

    .line 227
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_1e
    move/from16 v26, v11

    move v10, v12

    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->saveState(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 228
    goto :goto_12

    .line 187
    .end local v10    # "tsize":I
    .end local v26    # "lenMarker":I
    .restart local v11    # "lenMarker":I
    .restart local v12    # "tsize":I
    :sswitch_1f
    move/from16 v26, v11

    move v10, v12

    .line 579
    .end local v11    # "lenMarker":I
    .end local v12    # "tsize":I
    .restart local v10    # "tsize":I
    .restart local v26    # "lenMarker":I
    :goto_12
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    mul-int/lit8 v12, v10, 0x2

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->in:Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->getLength()I

    move-result v2

    sub-int v2, v2, v26

    sub-int/2addr v12, v2

    invoke-virtual {v0, v12}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->skip(I)V

    .line 580
    .end local v26    # "lenMarker":I
    const/4 v10, 0x1

    goto/16 :goto_0

    .line 157
    .end local v10    # "tsize":I
    .end local v13    # "function":I
    :cond_1c
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Not a placeable windows metafile."

    invoke-direct {v0, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1f
        0x1e -> :sswitch_1e
        0xf7 -> :sswitch_1d
        0x102 -> :sswitch_1c
        0x106 -> :sswitch_1b
        0x127 -> :sswitch_1a
        0x12d -> :sswitch_19
        0x12e -> :sswitch_18
        0x142 -> :sswitch_1d
        0x1f0 -> :sswitch_17
        0x201 -> :sswitch_16
        0x209 -> :sswitch_15
        0x20b -> :sswitch_14
        0x20c -> :sswitch_13
        0x213 -> :sswitch_12
        0x214 -> :sswitch_11
        0x2fa -> :sswitch_10
        0x2fb -> :sswitch_f
        0x2fc -> :sswitch_e
        0x324 -> :sswitch_d
        0x325 -> :sswitch_c
        0x416 -> :sswitch_b
        0x418 -> :sswitch_a
        0x41b -> :sswitch_9
        0x41f -> :sswitch_8
        0x521 -> :sswitch_7
        0x538 -> :sswitch_6
        0x61c -> :sswitch_5
        0x6ff -> :sswitch_1d
        0x817 -> :sswitch_4
        0x81a -> :sswitch_3
        0x830 -> :sswitch_2
        0xa32 -> :sswitch_1
        0xb41 -> :sswitch_0
        0xf43 -> :sswitch_0
    .end sparse-switch
.end method

.method public strokeAndFill()V
    .locals 8

    .line 685
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getCurrentPen()Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;

    move-result-object v0

    .line 686
    .local v0, "pen":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getCurrentBrush()Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;

    move-result-object v1

    .line 687
    .local v1, "brush":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;->getStyle()I

    move-result v2

    .line 688
    .local v2, "penStyle":I
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;->getStyle()I

    move-result v3

    .line 689
    .local v3, "brushStyle":I
    const/4 v4, 0x5

    const/4 v5, 0x1

    if-ne v2, v4, :cond_1

    .line 690
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->closePath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 691
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getPolyFillMode()I

    move-result v4

    .line 695
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 691
    if-ne v4, v5, :cond_0

    .line 692
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->eoFill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_2

    .line 695
    :cond_0
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_2

    .line 699
    :cond_1
    if-eqz v3, :cond_3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_2

    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getBackgroundMode()I

    move-result v6

    if-ne v6, v4, :cond_2

    goto :goto_0

    :cond_2
    const/4 v4, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    move v4, v5

    .line 700
    .local v4, "isBrush":Z
    :goto_1
    if-eqz v4, :cond_5

    .line 701
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->state:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->getPolyFillMode()I

    move-result v6

    .line 704
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 701
    if-ne v6, v5, :cond_4

    .line 702
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->closePathEoFillStroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_2

    .line 704
    :cond_4
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->closePathFillStroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_2

    .line 707
    :cond_5
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaDo;->cb:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->closePathStroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 710
    .end local v4    # "isBrush":Z
    :goto_2
    return-void
.end method
