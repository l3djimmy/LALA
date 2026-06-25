.class Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator;
.super Lcom/itextpdf/commons/actions/producer/AbstractFormattedPlaceholderPopulator;
.source "UsedProductsPlaceholderPopulator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;
    }
.end annotation


# static fields
.field private static final PRODUCTS_SEPARATOR:Ljava/lang/String; = ", "

.field private static final PRODUCT_NAME:C = 'P'

.field private static final USAGE_TYPE:C = 'T'

.field private static final VERSION:C = 'V'


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 70
    invoke-direct {p0}, Lcom/itextpdf/commons/actions/producer/AbstractFormattedPlaceholderPopulator;-><init>()V

    .line 72
    return-void
.end method

.method private formatLetter(CLcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;)Ljava/lang/String;
    .locals 3
    .param p1, "letter"    # C
    .param p2, "product"    # Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;

    .line 131
    const/16 v0, 0x50

    if-ne p1, v0, :cond_0

    .line 132
    invoke-virtual {p2}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getProductName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 133
    :cond_0
    const/16 v0, 0x56

    if-ne p1, v0, :cond_1

    .line 134
    invoke-virtual {p2}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 135
    :cond_1
    const/16 v0, 0x54

    if-ne p1, v0, :cond_2

    .line 136
    invoke-virtual {p2}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;->getProductUsageType()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 138
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 139
    invoke-static {p1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 138
    const-string v2, "Pattern contains unexpected character {0}"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private formatProduct(Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "product"    # Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;
    .param p2, "format"    # Ljava/lang/String;

    .line 114
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 117
    .local v1, "formatArray":[C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_2

    .line 118
    aget-char v3, v1, v2

    const/16 v4, 0x27

    if-ne v3, v4, :cond_0

    .line 119
    invoke-virtual {p0, v2, v0, v1}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator;->attachQuotedString(ILjava/lang/StringBuilder;[C)I

    move-result v2

    goto :goto_1

    .line 120
    :cond_0
    aget-char v3, v1, v2

    invoke-virtual {p0, v3}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator;->isLetter(C)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 121
    aget-char v3, v1, v2

    invoke-direct {p0, v3, p1}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator;->formatLetter(CLcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 123
    :cond_1
    aget-char v3, v1, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 117
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 127
    .end local v2    # "i":I
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public populate(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p2, "parameter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 87
    .local p1, "events":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;>;"
    if-eqz p2, :cond_4

    .line 92
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 93
    .local v0, "usedProducts":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;

    .line 94
    .local v2, "event":Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;
    new-instance v3, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;

    invoke-direct {v3, v2}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;-><init>(Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;)V

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 95
    .end local v2    # "event":Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;
    goto :goto_0

    .line 97
    :cond_0
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 98
    .local v1, "usedProductsRepresentations":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;

    .line 99
    .local v3, "representation":Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;
    invoke-direct {p0, v3, p2}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator;->formatProduct(Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 100
    .end local v3    # "representation":Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;
    goto :goto_1

    .line 101
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .local v2, "result":Ljava/lang/StringBuilder;
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 103
    .local v4, "stringRepresentation":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_2

    .line 104
    const-string v5, ", "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    :cond_2
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .end local v4    # "stringRepresentation":Ljava/lang/String;
    goto :goto_2

    .line 110
    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 88
    .end local v0    # "usedProducts":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator$ProductRepresentation;>;"
    .end local v1    # "usedProductsRepresentations":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v2    # "result":Ljava/lang/StringBuilder;
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "usedProducts"

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Invalid usage of placeholder \"{0}\": format is required"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
