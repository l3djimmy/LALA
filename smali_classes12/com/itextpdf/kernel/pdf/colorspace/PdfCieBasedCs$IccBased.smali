.class public Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;
.super Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs;
.source "PdfCieBasedCs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IccBased"
.end annotation


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 180
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 181
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "iccStream"    # Ljava/io/InputStream;

    .line 185
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;->getInitialPdfArray(Ljava/io/InputStream;[F)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 186
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;[F)V
    .locals 1
    .param p1, "iccStream"    # Ljava/io/InputStream;
    .param p2, "range"    # [F

    .line 189
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;->getInitialPdfArray(Ljava/io/InputStream;[F)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 190
    return-void
.end method

.method public static getIccProfileStream(Lcom/itextpdf/io/colors/IccProfile;)Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 4
    .param p0, "iccProfile"    # Lcom/itextpdf/io/colors/IccProfile;

    .line 208
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {p0}, Lcom/itextpdf/io/colors/IccProfile;->getData()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>([B)V

    .line 209
    .local v0, "stream":Lcom/itextpdf/kernel/pdf/PdfStream;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p0}, Lcom/itextpdf/io/colors/IccProfile;->getNumComponents()I

    move-result v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 210
    invoke-virtual {p0}, Lcom/itextpdf/io/colors/IccProfile;->getNumComponents()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 218
    :pswitch_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Alternate:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceCMYK:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 219
    goto :goto_0

    .line 215
    :pswitch_2
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Alternate:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceRGB:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 216
    goto :goto_0

    .line 212
    :pswitch_3
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Alternate:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceGray:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 213
    nop

    .line 223
    :goto_0
    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static getIccProfileStream(Lcom/itextpdf/io/colors/IccProfile;[F)Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 3
    .param p0, "iccProfile"    # Lcom/itextpdf/io/colors/IccProfile;
    .param p1, "range"    # [F

    .line 227
    invoke-static {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;->getIccProfileStream(Lcom/itextpdf/io/colors/IccProfile;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    .line 228
    .local v0, "stream":Lcom/itextpdf/kernel/pdf/PdfStream;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Range:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 229
    return-object v0
.end method

.method public static getIccProfileStream(Ljava/io/InputStream;)Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 2
    .param p0, "iccStream"    # Ljava/io/InputStream;

    .line 198
    invoke-static {p0}, Lcom/itextpdf/io/colors/IccProfile;->getInstance(Ljava/io/InputStream;)Lcom/itextpdf/io/colors/IccProfile;

    move-result-object v0

    .line 199
    .local v0, "iccProfile":Lcom/itextpdf/io/colors/IccProfile;
    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;->getIccProfileStream(Lcom/itextpdf/io/colors/IccProfile;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v1

    return-object v1
.end method

.method public static getIccProfileStream(Ljava/io/InputStream;[F)Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 2
    .param p0, "iccStream"    # Ljava/io/InputStream;
    .param p1, "range"    # [F

    .line 203
    invoke-static {p0}, Lcom/itextpdf/io/colors/IccProfile;->getInstance(Ljava/io/InputStream;)Lcom/itextpdf/io/colors/IccProfile;

    move-result-object v0

    .line 204
    .local v0, "iccProfile":Lcom/itextpdf/io/colors/IccProfile;
    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;->getIccProfileStream(Lcom/itextpdf/io/colors/IccProfile;[F)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v1

    return-object v1
.end method

.method private static getInitialPdfArray(Ljava/io/InputStream;[F)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2
    .param p0, "iccStream"    # Ljava/io/InputStream;
    .param p1, "range"    # [F

    .line 233
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 234
    .local v0, "tempArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ICCBased:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 235
    if-nez p1, :cond_0

    invoke-static {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;->getIccProfileStream(Ljava/io/InputStream;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v1

    goto :goto_0

    :cond_0
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;->getIccProfileStream(Ljava/io/InputStream;[F)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 236
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Ljava/util/List;)V

    return-object v1
.end method


# virtual methods
.method public getNumberOfComponents()I
    .locals 2

    .line 194
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsStream(I)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsInt(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method
