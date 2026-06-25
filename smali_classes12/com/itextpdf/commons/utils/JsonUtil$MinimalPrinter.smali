.class Lcom/itextpdf/commons/utils/JsonUtil$MinimalPrinter;
.super Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;
.source "JsonUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/commons/utils/JsonUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MinimalPrinter"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 288
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;-><init>()V

    .line 289
    const-string v0, ":"

    iput-object v0, p0, Lcom/itextpdf/commons/utils/JsonUtil$MinimalPrinter;->_objectFieldValueSeparatorWithSpaces:Ljava/lang/String;

    .line 290
    new-instance v0, Lcom/fasterxml/jackson/core/util/DefaultIndenter;

    const-string v1, ""

    invoke-direct {v0, v1, v1}, Lcom/fasterxml/jackson/core/util/DefaultIndenter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/commons/utils/JsonUtil$MinimalPrinter;->indentArraysWith(Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter$Indenter;)V

    .line 291
    new-instance v0, Lcom/fasterxml/jackson/core/util/DefaultIndenter;

    invoke-direct {v0, v1, v1}, Lcom/fasterxml/jackson/core/util/DefaultIndenter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/commons/utils/JsonUtil$MinimalPrinter;->indentObjectsWith(Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter$Indenter;)V

    .line 292
    return-void
.end method


# virtual methods
.method public createInstance()Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;
    .locals 1

    .line 296
    new-instance v0, Lcom/itextpdf/commons/utils/JsonUtil$MinimalPrinter;

    invoke-direct {v0}, Lcom/itextpdf/commons/utils/JsonUtil$MinimalPrinter;-><init>()V

    return-object v0
.end method

.method public bridge synthetic createInstance()Ljava/lang/Object;
    .locals 1

    .line 287
    invoke-virtual {p0}, Lcom/itextpdf/commons/utils/JsonUtil$MinimalPrinter;->createInstance()Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;

    move-result-object v0

    return-object v0
.end method
