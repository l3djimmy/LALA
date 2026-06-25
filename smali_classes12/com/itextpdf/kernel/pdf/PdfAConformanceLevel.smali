.class public Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;
.super Ljava/lang/Object;
.source "PdfAConformanceLevel.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/IConformanceLevel;


# static fields
.field public static final PDF_A_1A:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

.field public static final PDF_A_1B:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

.field public static final PDF_A_2A:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

.field public static final PDF_A_2B:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

.field public static final PDF_A_2U:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

.field public static final PDF_A_3A:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

.field public static final PDF_A_3B:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

.field public static final PDF_A_3U:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

.field public static final PDF_A_4:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

.field public static final PDF_A_4E:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

.field public static final PDF_A_4F:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

.field public static final PDF_A_4_REVISION:Ljava/lang/String; = "2020"


# instance fields
.field private final conformance:Ljava/lang/String;

.field private final part:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 36
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    const-string v1, "1"

    const-string v2, "A"

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_1A:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    .line 37
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    const-string v3, "B"

    invoke-direct {v0, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_1B:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    .line 38
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    const-string v1, "2"

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_2A:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    .line 39
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    invoke-direct {v0, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_2B:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    .line 40
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    const-string v4, "U"

    invoke-direct {v0, v1, v4}, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_2U:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    .line 41
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    const-string v1, "3"

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_3A:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    .line 42
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    invoke-direct {v0, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_3B:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    .line 43
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    invoke-direct {v0, v1, v4}, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_3U:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    .line 44
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    const/4 v1, 0x0

    const-string v2, "4"

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_4:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    .line 45
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    const-string v1, "E"

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_4E:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    .line 46
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    const-string v1, "F"

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_4F:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "part"    # Ljava/lang/String;
    .param p2, "conformance"    # Ljava/lang/String;

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->conformance:Ljava/lang/String;

    .line 54
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->part:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public static getConformanceLevel(Lcom/itextpdf/kernel/xmp/XMPMeta;)Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;
    .locals 5
    .param p0, "meta"    # Lcom/itextpdf/kernel/xmp/XMPMeta;

    .line 107
    const-string v0, "http://www.aiim.org/pdfa/ns/id/"

    const/4 v1, 0x0

    .line 108
    .local v1, "conformanceXmpProperty":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    const/4 v2, 0x0

    .line 110
    .local v2, "partXmpProperty":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    :try_start_0
    const-string v3, "conformance"

    invoke-interface {p0, v0, v3}, Lcom/itextpdf/kernel/xmp/XMPMeta;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;

    move-result-object v3

    move-object v1, v3

    .line 111
    const-string/jumbo v3, "part"

    invoke-interface {p0, v0, v3}, Lcom/itextpdf/kernel/xmp/XMPMeta;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;

    move-result-object v0
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, v0

    .line 113
    goto :goto_0

    .line 112
    :catch_0
    move-exception v0

    .line 114
    :goto_0
    const/4 v0, 0x0

    if-eqz v2, :cond_2

    if-nez v1, :cond_0

    const-string v3, "4"

    invoke-interface {v2}, Lcom/itextpdf/kernel/xmp/properties/XMPProperty;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_2

    .line 117
    :cond_0
    invoke-interface {v2}, Lcom/itextpdf/kernel/xmp/properties/XMPProperty;->getValue()Ljava/lang/String;

    move-result-object v3

    if-nez v1, :cond_1

    goto :goto_1

    .line 118
    :cond_1
    invoke-interface {v1}, Lcom/itextpdf/kernel/xmp/properties/XMPProperty;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 117
    :goto_1
    invoke-static {v3, v0}, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->getConformanceLevel(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    move-result-object v0

    return-object v0

    .line 115
    :cond_2
    :goto_2
    return-object v0
.end method

.method public static getConformanceLevel(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;
    .locals 8
    .param p0, "part"    # Ljava/lang/String;
    .param p1, "conformance"    # Ljava/lang/String;

    .line 66
    const/4 v0, 0x0

    if-nez p1, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    .line 67
    .local v1, "lowLetter":Ljava/lang/String;
    :goto_0
    const-string v2, "A"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 68
    .local v2, "aLevel":Z
    const-string v3, "B"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 69
    .local v3, "bLevel":Z
    const-string v4, "U"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 70
    .local v4, "uLevel":Z
    const-string v5, "E"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 71
    .local v5, "eLevel":Z
    const-string v6, "F"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 73
    .local v6, "fLevel":Z
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v7

    packed-switch v7, :pswitch_data_0

    :cond_1
    goto :goto_1

    :pswitch_0
    const-string v7, "4"

    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/4 v7, 0x3

    goto :goto_2

    :pswitch_1
    const-string v7, "3"

    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/4 v7, 0x2

    goto :goto_2

    :pswitch_2
    const-string v7, "2"

    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/4 v7, 0x1

    goto :goto_2

    :pswitch_3
    const-string v7, "1"

    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/4 v7, 0x0

    goto :goto_2

    :goto_1
    const/4 v7, -0x1

    :goto_2
    packed-switch v7, :pswitch_data_1

    goto :goto_3

    .line 97
    :pswitch_4
    if-eqz v5, :cond_2

    .line 98
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_4E:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    return-object v0

    .line 99
    :cond_2
    if-eqz v6, :cond_3

    .line 100
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_4F:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    return-object v0

    .line 101
    :cond_3
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_4:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    return-object v0

    .line 89
    :pswitch_5
    if-eqz v2, :cond_4

    .line 90
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_3A:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    return-object v0

    .line 91
    :cond_4
    if-eqz v3, :cond_5

    .line 92
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_3B:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    return-object v0

    .line 93
    :cond_5
    if-eqz v4, :cond_9

    .line 94
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_3U:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    return-object v0

    .line 81
    :pswitch_6
    if-eqz v2, :cond_6

    .line 82
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_2A:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    return-object v0

    .line 83
    :cond_6
    if-eqz v3, :cond_7

    .line 84
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_2B:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    return-object v0

    .line 85
    :cond_7
    if-eqz v4, :cond_9

    .line 86
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_2U:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    return-object v0

    .line 75
    :pswitch_7
    if-eqz v2, :cond_8

    .line 76
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_1A:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    return-object v0

    .line 77
    :cond_8
    if-eqz v3, :cond_9

    .line 78
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->PDF_A_1B:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    return-object v0

    .line 103
    :cond_9
    :goto_3
    return-object v0

    :pswitch_data_0
    .packed-switch 0x31
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method

.method public static getPDFAConformance(Lcom/itextpdf/kernel/pdf/IConformanceLevel;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;
    .locals 2
    .param p0, "possibleConformance"    # Lcom/itextpdf/kernel/pdf/IConformanceLevel;
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 132
    instance-of v0, p0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    if-eqz v0, :cond_0

    .line 133
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    return-object v0

    .line 135
    :cond_0
    const/4 v0, 0x0

    if-nez p1, :cond_1

    .line 136
    return-object v0

    .line 138
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getConformanceLevel()Lcom/itextpdf/kernel/pdf/IConformanceLevel;

    move-result-object v1

    instance-of v1, v1, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    if-eqz v1, :cond_2

    .line 139
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getConformanceLevel()Lcom/itextpdf/kernel/pdf/IConformanceLevel;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    return-object v0

    .line 141
    :cond_2
    return-object v0
.end method


# virtual methods
.method public getConformance()Ljava/lang/String;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->conformance:Ljava/lang/String;

    return-object v0
.end method

.method public getPart()Ljava/lang/String;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->part:Ljava/lang/String;

    return-object v0
.end method
