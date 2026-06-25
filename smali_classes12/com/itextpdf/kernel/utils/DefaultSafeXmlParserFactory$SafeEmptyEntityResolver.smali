.class Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory$SafeEmptyEntityResolver;
.super Ljava/lang/Object;
.source "DefaultSafeXmlParserFactory.java"

# interfaces
.implements Lorg/xml/sax/EntityResolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SafeEmptyEntityResolver"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 221
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 223
    return-void
.end method


# virtual methods
.method public resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;
    .locals 2
    .param p1, "publicId"    # Ljava/lang/String;
    .param p2, "systemId"    # Ljava/lang/String;

    .line 226
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "External entity element found in XML. This entity will not be parsed to prevent XML attacks."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
