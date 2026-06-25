.class public final Lcom/itextpdf/commons/actions/data/ProductData;
.super Ljava/lang/Object;
.source "ProductData.java"


# instance fields
.field private final minimalCompatibleLicenseKeyVersion:Ljava/lang/String;

.field private final productName:Ljava/lang/String;

.field private final publicProductName:Ljava/lang/String;

.field private final sinceCopyrightYear:I

.field private final toCopyrightYear:I

.field private final version:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 7
    .param p1, "publicProductName"    # Ljava/lang/String;
    .param p2, "productName"    # Ljava/lang/String;
    .param p3, "version"    # Ljava/lang/String;
    .param p4, "sinceCopyrightYear"    # I
    .param p5, "toCopyrightYear"    # I

    .line 49
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    move v6, p5

    .end local p1    # "publicProductName":Ljava/lang/String;
    .end local p2    # "productName":Ljava/lang/String;
    .end local p3    # "version":Ljava/lang/String;
    .end local p4    # "sinceCopyrightYear":I
    .end local p5    # "toCopyrightYear":I
    .local v1, "publicProductName":Ljava/lang/String;
    .local v2, "productName":Ljava/lang/String;
    .local v3, "version":Ljava/lang/String;
    .local v5, "sinceCopyrightYear":I
    .local v6, "toCopyrightYear":I
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/commons/actions/data/ProductData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 0
    .param p1, "publicProductName"    # Ljava/lang/String;
    .param p2, "productName"    # Ljava/lang/String;
    .param p3, "version"    # Ljava/lang/String;
    .param p4, "minimalCompatibleLicenseKeyVersion"    # Ljava/lang/String;
    .param p5, "sinceCopyrightYear"    # I
    .param p6, "toCopyrightYear"    # I

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lcom/itextpdf/commons/actions/data/ProductData;->publicProductName:Ljava/lang/String;

    .line 65
    iput-object p2, p0, Lcom/itextpdf/commons/actions/data/ProductData;->productName:Ljava/lang/String;

    .line 66
    iput-object p3, p0, Lcom/itextpdf/commons/actions/data/ProductData;->version:Ljava/lang/String;

    .line 67
    iput-object p4, p0, Lcom/itextpdf/commons/actions/data/ProductData;->minimalCompatibleLicenseKeyVersion:Ljava/lang/String;

    .line 68
    iput p5, p0, Lcom/itextpdf/commons/actions/data/ProductData;->sinceCopyrightYear:I

    .line 69
    iput p6, p0, Lcom/itextpdf/commons/actions/data/ProductData;->toCopyrightYear:I

    .line 70
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 128
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 129
    return v0

    .line 132
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 136
    :cond_1
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/commons/actions/data/ProductData;

    .line 137
    .local v2, "other":Lcom/itextpdf/commons/actions/data/ProductData;
    iget-object v3, p0, Lcom/itextpdf/commons/actions/data/ProductData;->publicProductName:Ljava/lang/String;

    iget-object v4, v2, Lcom/itextpdf/commons/actions/data/ProductData;->publicProductName:Ljava/lang/String;

    invoke-static {v3, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/itextpdf/commons/actions/data/ProductData;->productName:Ljava/lang/String;

    iget-object v4, v2, Lcom/itextpdf/commons/actions/data/ProductData;->productName:Ljava/lang/String;

    .line 138
    invoke-static {v3, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/itextpdf/commons/actions/data/ProductData;->version:Ljava/lang/String;

    iget-object v4, v2, Lcom/itextpdf/commons/actions/data/ProductData;->version:Ljava/lang/String;

    .line 139
    invoke-static {v3, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget v3, p0, Lcom/itextpdf/commons/actions/data/ProductData;->sinceCopyrightYear:I

    iget v4, v2, Lcom/itextpdf/commons/actions/data/ProductData;->sinceCopyrightYear:I

    if-ne v3, v4, :cond_2

    iget v3, p0, Lcom/itextpdf/commons/actions/data/ProductData;->toCopyrightYear:I

    iget v4, v2, Lcom/itextpdf/commons/actions/data/ProductData;->toCopyrightYear:I

    if-ne v3, v4, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    .line 137
    :goto_0
    return v0

    .line 133
    .end local v2    # "other":Lcom/itextpdf/commons/actions/data/ProductData;
    :cond_3
    :goto_1
    return v1
.end method

.method public getMinCompatibleLicensingModuleVersion()Ljava/lang/String;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/itextpdf/commons/actions/data/ProductData;->minimalCompatibleLicenseKeyVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getProductName()Ljava/lang/String;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/itextpdf/commons/actions/data/ProductData;->productName:Ljava/lang/String;

    return-object v0
.end method

.method public getPublicProductName()Ljava/lang/String;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/itextpdf/commons/actions/data/ProductData;->publicProductName:Ljava/lang/String;

    return-object v0
.end method

.method public getSinceCopyrightYear()I
    .locals 1

    .line 105
    iget v0, p0, Lcom/itextpdf/commons/actions/data/ProductData;->sinceCopyrightYear:I

    return v0
.end method

.method public getToCopyrightYear()I
    .locals 1

    .line 114
    iget v0, p0, Lcom/itextpdf/commons/actions/data/ProductData;->toCopyrightYear:I

    return v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/itextpdf/commons/actions/data/ProductData;->version:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 145
    iget-object v0, p0, Lcom/itextpdf/commons/actions/data/ProductData;->publicProductName:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/commons/actions/data/ProductData;->publicProductName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    .line 146
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lcom/itextpdf/commons/actions/data/ProductData;->productName:Ljava/lang/String;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/itextpdf/commons/actions/data/ProductData;->productName:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_1

    :cond_1
    move v3, v1

    :goto_1
    add-int/2addr v2, v3

    add-int/2addr v0, v2

    .line 147
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lcom/itextpdf/commons/actions/data/ProductData;->version:Ljava/lang/String;

    if-eqz v3, :cond_2

    iget-object v1, p0, Lcom/itextpdf/commons/actions/data/ProductData;->version:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_2
    add-int/2addr v2, v1

    add-int/2addr v0, v2

    .line 148
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/itextpdf/commons/actions/data/ProductData;->sinceCopyrightYear:I

    add-int/2addr v1, v2

    add-int/2addr v0, v1

    .line 149
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/itextpdf/commons/actions/data/ProductData;->toCopyrightYear:I

    add-int/2addr v1, v2

    add-int/2addr v0, v1

    .line 150
    return v0
.end method
