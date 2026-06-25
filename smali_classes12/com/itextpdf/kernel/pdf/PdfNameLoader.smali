.class final Lcom/itextpdf/kernel/pdf/PdfNameLoader;
.super Ljava/lang/Object;
.source "PdfNameLoader.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static loadNames()Ljava/util/Map;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;"
        }
    .end annotation

    .line 33
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 34
    .local v0, "fields":[Ljava/lang/reflect/Field;
    new-instance v1, Ljava/util/HashMap;

    array-length v2, v0

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 35
    .local v1, "staticNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;>;"
    const/16 v2, 0x19

    .line 37
    .local v2, "flags":I
    const/4 v3, 0x0

    :try_start_0
    array-length v4, v0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_1

    aget-object v6, v0, v5

    .line 38
    .local v6, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v7

    const/16 v8, 0x19

    and-int/2addr v7, v8

    if-ne v7, v8, :cond_0

    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    const-class v8, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 39
    invoke-virtual {v6, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 40
    .local v7, "name":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v1, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .end local v6    # "field":Ljava/lang/reflect/Field;
    .end local v7    # "name":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 45
    :cond_1
    nop

    .line 46
    return-object v1

    .line 43
    :catch_0
    move-exception v4

    .line 44
    .local v4, "e":Ljava/lang/Exception;
    return-object v3
.end method
