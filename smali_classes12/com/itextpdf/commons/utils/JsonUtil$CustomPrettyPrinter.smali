.class Lcom/itextpdf/commons/utils/JsonUtil$CustomPrettyPrinter;
.super Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;
.source "JsonUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/commons/utils/JsonUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CustomPrettyPrinter"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 271
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;-><init>()V

    .line 272
    const-string v0, ": "

    iput-object v0, p0, Lcom/itextpdf/commons/utils/JsonUtil$CustomPrettyPrinter;->_objectFieldValueSeparatorWithSpaces:Ljava/lang/String;

    .line 273
    sget-object v0, Lcom/fasterxml/jackson/core/util/DefaultIndenter;->SYSTEM_LINEFEED_INSTANCE:Lcom/fasterxml/jackson/core/util/DefaultIndenter;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/util/DefaultIndenter;->withLinefeed(Ljava/lang/String;)Lcom/fasterxml/jackson/core/util/DefaultIndenter;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/commons/utils/JsonUtil$CustomPrettyPrinter;->indentArraysWith(Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter$Indenter;)V

    .line 274
    sget-object v0, Lcom/fasterxml/jackson/core/util/DefaultIndenter;->SYSTEM_LINEFEED_INSTANCE:Lcom/fasterxml/jackson/core/util/DefaultIndenter;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/util/DefaultIndenter;->withLinefeed(Ljava/lang/String;)Lcom/fasterxml/jackson/core/util/DefaultIndenter;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/commons/utils/JsonUtil$CustomPrettyPrinter;->indentObjectsWith(Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter$Indenter;)V

    .line 275
    return-void
.end method


# virtual methods
.method public createInstance()Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;
    .locals 1

    .line 279
    new-instance v0, Lcom/itextpdf/commons/utils/JsonUtil$CustomPrettyPrinter;

    invoke-direct {v0}, Lcom/itextpdf/commons/utils/JsonUtil$CustomPrettyPrinter;-><init>()V

    return-object v0
.end method

.method public bridge synthetic createInstance()Ljava/lang/Object;
    .locals 1

    .line 270
    invoke-virtual {p0}, Lcom/itextpdf/commons/utils/JsonUtil$CustomPrettyPrinter;->createInstance()Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;

    move-result-object v0

    return-object v0
.end method
