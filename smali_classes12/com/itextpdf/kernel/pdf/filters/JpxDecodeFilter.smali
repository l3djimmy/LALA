.class public Lcom/itextpdf/kernel/pdf/filters/JpxDecodeFilter;
.super Ljava/lang/Object;
.source "JpxDecodeFilter.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 39
    const-class v0, Lcom/itextpdf/kernel/pdf/filters/JpxDecodeFilter;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/filters/JpxDecodeFilter;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public decode([BLcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDictionary;)[B
    .locals 2
    .param p1, "b"    # [B
    .param p2, "filterName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "decodeParams"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p4, "streamDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 43
    sget-object v0, Lcom/itextpdf/kernel/pdf/filters/JpxDecodeFilter;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "JPXDecode filter decoding into the bit map is not supported. The stream data would be left in JPEG2000 format"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 44
    return-object p1
.end method
