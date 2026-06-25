.class public final Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;
.super Ljava/lang/Object;
.source "StandardCMapCharsets.java"


# static fields
.field private static final UCS2_ENCODER:Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

.field private static final UTF16_ENCODER:Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

.field private static final encoders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->encoders:Ljava/util/Map;

    .line 32
    new-instance v0, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_16BE:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1}, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;-><init>(Ljava/nio/charset/Charset;)V

    sput-object v0, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->UTF16_ENCODER:Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    .line 33
    new-instance v0, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_16BE:Ljava/nio/charset/Charset;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;-><init>(Ljava/nio/charset/Charset;Z)V

    sput-object v0, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->UCS2_ENCODER:Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    .line 45
    invoke-static {}, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->registerEncoder()V

    .line 46
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method public static disableCharsetEncoders()V
    .locals 1

    .line 78
    sget-object v0, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->encoders:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 79
    return-void
.end method

.method public static enableCharsetEncoders()V
    .locals 1

    .line 85
    sget-object v0, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->encoders:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 86
    invoke-static {}, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->registerEncoder()V

    .line 88
    :cond_0
    return-void
.end method

.method public static getEncoder(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;
    .locals 1
    .param p0, "stdCmapName"    # Ljava/lang/String;

    .line 71
    sget-object v0, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->encoders:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    return-object v0
.end method

.method private static registerEncoder()V
    .locals 2

    .line 52
    const-string v0, "UniGB-UCS2"

    sget-object v1, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->UCS2_ENCODER:Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->registerHV(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;)V

    .line 53
    const-string v0, "UniGB-UTF16"

    sget-object v1, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->UTF16_ENCODER:Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->registerHV(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;)V

    .line 56
    const-string v0, "UniCNS-UCS2"

    sget-object v1, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->UCS2_ENCODER:Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->registerHV(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;)V

    .line 57
    const-string v0, "UniCNS-UTF16"

    sget-object v1, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->UTF16_ENCODER:Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->registerHV(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;)V

    .line 60
    const-string v0, "UniJIS-UCS2"

    sget-object v1, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->UCS2_ENCODER:Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->registerHV(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;)V

    .line 61
    const-string v0, "UniJIS-UCS2-HW"

    sget-object v1, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->UCS2_ENCODER:Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->registerHV(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;)V

    .line 62
    const-string v0, "UniJIS2004-UTF16"

    sget-object v1, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->UTF16_ENCODER:Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->registerHV(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;)V

    .line 63
    const-string v0, "UniJIS-UTF16"

    sget-object v1, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->UTF16_ENCODER:Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->registerHV(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;)V

    .line 66
    const-string v0, "UniKS-UCS2"

    sget-object v1, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->UCS2_ENCODER:Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->registerHV(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;)V

    .line 67
    const-string v0, "UniKS-UTF16"

    sget-object v1, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->UTF16_ENCODER:Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->registerHV(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;)V

    .line 68
    return-void
.end method

.method private static registerHV(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;)V
    .locals 3
    .param p0, "cmapPrefix"    # Ljava/lang/String;
    .param p1, "encoder"    # Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    .line 40
    sget-object v0, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->encoders:Ljava/util/Map;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "-H"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->encoders:Ljava/util/Map;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "-V"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    return-void
.end method
