.class Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;
.super Ljava/lang/Object;
.source "UsedProductsPlaceholderPopulator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ProductRepresentation"
.end annotation


# static fields
.field private static final PRODUCT_USAGE_TYPE_TO_HUMAN_READABLE_FORM:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final productName:Ljava/lang/String;

.field private final productUsageType:Ljava/lang/String;

.field private final version:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 151
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 152
    .local v0, "productUsageTypeMapping":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "nonproduction"

    const-string/jumbo v2, "non-production"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    sput-object v1, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->PRODUCT_USAGE_TYPE_TO_HUMAN_READABLE_FORM:Ljava/util/Map;

    .line 154
    .end local v0    # "productUsageTypeMapping":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;)V
    .locals 2
    .param p1, "event"    # Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;

    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 157
    invoke-virtual {p1}, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;->getEvent()Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getProductData()Lcom/itextpdf/commons/actions/data/ProductData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/commons/actions/data/ProductData;->getPublicProductName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->productName:Ljava/lang/String;

    .line 158
    sget-object v0, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->PRODUCT_USAGE_TYPE_TO_HUMAN_READABLE_FORM:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;->getProductUsageType()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 159
    sget-object v0, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->PRODUCT_USAGE_TYPE_TO_HUMAN_READABLE_FORM:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;->getProductUsageType()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->productUsageType:Ljava/lang/String;

    goto :goto_0

    .line 161
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;->getProductUsageType()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->productUsageType:Ljava/lang/String;

    .line 163
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;->getEvent()Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getProductData()Lcom/itextpdf/commons/actions/data/ProductData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/commons/actions/data/ProductData;->getVersion()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->version:Ljava/lang/String;

    .line 164
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 180
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 181
    return v0

    .line 183
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_8

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_3

    .line 187
    :cond_1
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;

    .line 189
    .local v2, "that":Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;
    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getProductName()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    .line 190
    invoke-virtual {v2}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getProductName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getProductName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getProductName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 191
    :goto_0
    return v1

    .line 193
    :cond_3
    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getProductUsageType()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_4

    .line 194
    invoke-virtual {v2}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getProductUsageType()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_5

    goto :goto_1

    :cond_4
    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getProductUsageType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getProductUsageType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 195
    :goto_1
    return v1

    .line 197
    :cond_5
    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getVersion()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_7

    invoke-virtual {v2}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getVersion()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_6

    goto :goto_2

    :cond_6
    move v0, v1

    goto :goto_2

    :cond_7
    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_2
    return v0

    .line 184
    .end local v2    # "that":Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;
    :cond_8
    :goto_3
    return v1
.end method

.method public getProductName()Ljava/lang/String;
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->productName:Ljava/lang/String;

    return-object v0
.end method

.method public getProductUsageType()Ljava/lang/String;
    .locals 1

    .line 171
    iget-object v0, p0, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->productUsageType:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .line 175
    iget-object v0, p0, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->version:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 202
    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getProductName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getProductName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 203
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getProductUsageType()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getProductUsageType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1
    add-int/2addr v2, v3

    .line 204
    .end local v0    # "result":I
    .local v2, "result":I
    mul-int/lit8 v0, v2, 0x1f

    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getVersion()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_2
    add-int/2addr v0, v1

    .line 205
    .end local v2    # "result":I
    .restart local v0    # "result":I
    return v0
.end method
