.class Lcom/itextpdf/commons/actions/producer/CopyrightToPlaceholderPopulator;
.super Ljava/lang/Object;
.source "CopyrightToPlaceholderPopulator.java"

# interfaces
.implements Lcom/itextpdf/commons/actions/producer/IPlaceholderPopulator;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method


# virtual methods
.method public populate(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
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

    .line 59
    .local p1, "events":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;>;"
    if-nez p2, :cond_2

    .line 66
    const/high16 v0, -0x80000000

    .line 67
    .local v0, "latestYear":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;

    .line 68
    .local v2, "event":Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;
    invoke-virtual {v2}, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;->getEvent()Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getProductData()Lcom/itextpdf/commons/actions/data/ProductData;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/commons/actions/data/ProductData;->getToCopyrightYear()I

    move-result v3

    .line 69
    .local v3, "currentYear":I
    if-le v3, v0, :cond_0

    .line 70
    move v0, v3

    .line 72
    .end local v2    # "event":Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;
    .end local v3    # "currentYear":I
    :cond_0
    goto :goto_0

    .line 73
    :cond_1
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 60
    .end local v0    # "latestYear":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "copyrightTo"

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Invalid usage of placeholder \"{0}\": any configuration is forbidden"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
