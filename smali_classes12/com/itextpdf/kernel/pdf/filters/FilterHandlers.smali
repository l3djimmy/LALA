.class public final Lcom/itextpdf/kernel/pdf/filters/FilterHandlers;
.super Ljava/lang/Object;
.source "FilterHandlers.java"


# static fields
.field private static final defaults:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 48
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;>;"
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FlateDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Fl:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ASCIIHexDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/filters/ASCIIHexDecodeFilter;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/filters/ASCIIHexDecodeFilter;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AHx:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/filters/ASCIIHexDecodeFilter;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/filters/ASCIIHexDecodeFilter;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ASCII85Decode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/filters/ASCII85DecodeFilter;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/filters/ASCII85DecodeFilter;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->A85:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/filters/ASCII85DecodeFilter;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/filters/ASCII85DecodeFilter;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->LZWDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/filters/LZWDecodeFilter;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/filters/LZWDecodeFilter;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CCITTFaxDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/filters/CCITTFaxDecodeFilter;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/filters/CCITTFaxDecodeFilter;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Crypt:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/filters/DoNothingFilter;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/filters/DoNothingFilter;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->RunLengthDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/filters/RunLengthDecodeFilter;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/filters/RunLengthDecodeFilter;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DCTDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/filters/DctDecodeFilter;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/filters/DctDecodeFilter;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->JPXDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/filters/JpxDecodeFilter;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/filters/JpxDecodeFilter;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    sput-object v1, Lcom/itextpdf/kernel/pdf/filters/FilterHandlers;->defaults:Ljava/util/Map;

    .line 62
    .end local v0    # "map":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;>;"
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDefaultFilterHandlers()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;",
            ">;"
        }
    .end annotation

    .line 68
    sget-object v0, Lcom/itextpdf/kernel/pdf/filters/FilterHandlers;->defaults:Ljava/util/Map;

    return-object v0
.end method
