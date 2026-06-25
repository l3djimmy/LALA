.class public Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;
.super Ljava/lang/Object;
.source "PdfDeveloperExtension.java"


# static fields
.field public static final ADOBE_1_7_EXTENSIONLEVEL3:Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;

.field public static final ESIC_1_7_EXTENSIONLEVEL2:Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;

.field public static final ESIC_1_7_EXTENSIONLEVEL5:Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;

.field public static final ISO_32001:Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;

.field public static final ISO_32002:Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;


# instance fields
.field protected baseVersion:Lcom/itextpdf/kernel/pdf/PdfName;

.field protected extensionLevel:I

.field private final extensionRevision:Ljava/lang/String;

.field private final isMultiValued:Z

.field protected prefix:Lcom/itextpdf/kernel/pdf/PdfName;

.field private final url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 40
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ADBE:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Pdf_Version_1_7:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v3, 0x3

    invoke-direct {v0, v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;-><init>(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->ADOBE_1_7_EXTENSIONLEVEL3:Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;

    .line 44
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ESIC:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Pdf_Version_1_7:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;-><init>(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->ESIC_1_7_EXTENSIONLEVEL2:Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;

    .line 48
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ESIC:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Pdf_Version_1_7:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;-><init>(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->ESIC_1_7_EXTENSIONLEVEL5:Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;

    .line 52
    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->ISO_:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Pdf_Version_2_0:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v9, ":2022"

    const/4 v10, 0x1

    const/16 v7, 0x7d01

    const-string v8, "https://www.iso.org/standard/45874.html"

    invoke-direct/range {v4 .. v10}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;-><init>(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;ILjava/lang/String;Ljava/lang/String;Z)V

    sput-object v4, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->ISO_32001:Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;

    .line 61
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->ISO_:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->Pdf_Version_2_0:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v10, ":2022"

    const/4 v11, 0x1

    const/16 v8, 0x7d02

    const-string v9, "https://www.iso.org/standard/45875.html"

    invoke-direct/range {v5 .. v11}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;-><init>(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;ILjava/lang/String;Ljava/lang/String;Z)V

    sput-object v5, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->ISO_32002:Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;

    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;I)V
    .locals 7
    .param p1, "prefix"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "baseVersion"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "extensionLevel"    # I

    .line 94
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    .end local p1    # "prefix":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local p2    # "baseVersion":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local p3    # "extensionLevel":I
    .local v1, "prefix":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v2, "baseVersion":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v3, "extensionLevel":I
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;-><init>(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;ILjava/lang/String;Ljava/lang/String;Z)V

    .line 95
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1, "prefix"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "baseVersion"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "extensionLevel"    # I
    .param p4, "url"    # Ljava/lang/String;
    .param p5, "extensionRevision"    # Ljava/lang/String;
    .param p6, "isMultiValued"    # Z

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->prefix:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 109
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->baseVersion:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 110
    iput p3, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->extensionLevel:I

    .line 111
    iput-object p4, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->url:Ljava/lang/String;

    .line 112
    iput-object p5, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->extensionRevision:Ljava/lang/String;

    .line 113
    iput-boolean p6, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->isMultiValued:Z

    .line 114
    return-void
.end method


# virtual methods
.method public getBaseVersion()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->baseVersion:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public getDeveloperExtensions()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 4

    .line 155
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 156
    .local v0, "developerextensions":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BaseVersion:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->baseVersion:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 157
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ExtensionLevel:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget v3, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->extensionLevel:I

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 158
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->url:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 159
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->URL:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->url:Ljava/lang/String;

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 161
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->extensionRevision:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 162
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ExtensionRevision:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->extensionRevision:Ljava/lang/String;

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 164
    :cond_1
    return-object v0
.end method

.method public getExtensionLevel()I
    .locals 1

    .line 137
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->extensionLevel:I

    return v0
.end method

.method public getPrefix()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->prefix:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public isMultiValued()Z
    .locals 1

    .line 146
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->isMultiValued:Z

    return v0
.end method
