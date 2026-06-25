.class public final Lcom/itextpdf/commons/actions/producer/ProducerBuilder;
.super Lcom/itextpdf/commons/actions/AbstractITextConfigurationEvent;
.source "ProducerBuilder.java"


# static fields
.field private static final COPYRIGHT_SINCE:Ljava/lang/String; = "copyrightSince"

.field private static final COPYRIGHT_TO:Ljava/lang/String; = "copyrightTo"

.field private static final CURRENT_DATE:Ljava/lang/String; = "currentDate"

.field private static final FORMAT_DELIMITER:C = ':'

.field private static final INSTANCE:Lcom/itextpdf/commons/actions/producer/ProducerBuilder;

.field private static final LOGGER:Lorg/slf4j/Logger;

.field private static final MODIFIED_USING:Ljava/lang/String; = "; modified using "

.field private static final PATTERN:Ljava/util/regex/Pattern;

.field private static final PATTERN_STRING:Ljava/lang/String; = "\\$\\{([^}]*)\\}"

.field private static final PLACEHOLDER_POPULATORS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/itextpdf/commons/actions/producer/IPlaceholderPopulator;",
            ">;"
        }
    .end annotation
.end field

.field private static final USED_PRODUCTS:Ljava/lang/String; = "usedProducts"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 47
    const-class v0, Lcom/itextpdf/commons/actions/producer/ProducerBuilder;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/commons/actions/producer/ProducerBuilder;->LOGGER:Lorg/slf4j/Logger;

    .line 49
    new-instance v0, Lcom/itextpdf/commons/actions/producer/ProducerBuilder;

    invoke-direct {v0}, Lcom/itextpdf/commons/actions/producer/ProducerBuilder;-><init>()V

    sput-object v0, Lcom/itextpdf/commons/actions/producer/ProducerBuilder;->INSTANCE:Lcom/itextpdf/commons/actions/producer/ProducerBuilder;

    .line 68
    const-string v0, "\\$\\{([^}]*)\\}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/commons/actions/producer/ProducerBuilder;->PATTERN:Ljava/util/regex/Pattern;

    .line 73
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 74
    .local v0, "populators":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/itextpdf/commons/actions/producer/IPlaceholderPopulator;>;"
    new-instance v1, Lcom/itextpdf/commons/actions/producer/CurrentDatePlaceholderPopulator;

    invoke-direct {v1}, Lcom/itextpdf/commons/actions/producer/CurrentDatePlaceholderPopulator;-><init>()V

    const-string v2, "currentDate"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    new-instance v1, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator;

    invoke-direct {v1}, Lcom/itextpdf/commons/actions/producer/UsedProductsPlaceholderPopulator;-><init>()V

    const-string/jumbo v2, "usedProducts"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    new-instance v1, Lcom/itextpdf/commons/actions/producer/CopyrightSincePlaceholderPopulator;

    invoke-direct {v1}, Lcom/itextpdf/commons/actions/producer/CopyrightSincePlaceholderPopulator;-><init>()V

    const-string v2, "copyrightSince"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    new-instance v1, Lcom/itextpdf/commons/actions/producer/CopyrightToPlaceholderPopulator;

    invoke-direct {v1}, Lcom/itextpdf/commons/actions/producer/CopyrightToPlaceholderPopulator;-><init>()V

    const-string v2, "copyrightTo"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    sput-object v1, Lcom/itextpdf/commons/actions/producer/ProducerBuilder;->PLACEHOLDER_POPULATORS:Ljava/util/Map;

    .line 80
    .end local v0    # "populators":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/itextpdf/commons/actions/producer/IPlaceholderPopulator;>;"
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 82
    invoke-direct {p0}, Lcom/itextpdf/commons/actions/AbstractITextConfigurationEvent;-><init>()V

    return-void
.end method

.method private static buildProducer(Ljava/util/List;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 129
    .local p0, "events":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;>;"
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 137
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;

    invoke-virtual {v0}, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;->getProducerLine()Ljava/lang/String;

    move-result-object v0

    .line 139
    .local v0, "producer":Ljava/lang/String;
    invoke-static {v0, p0}, Lcom/itextpdf/commons/actions/producer/ProducerBuilder;->populatePlaceholders(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 130
    .end local v0    # "producer":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No events were registered for the document!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static modifyProducer(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "oldProducer"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 98
    .local p0, "events":Ljava/util/List;, "Ljava/util/List<+Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 99
    .local v0, "confirmedEvents":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;>;"
    if-eqz p0, :cond_1

    .line 100
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    .line 101
    .local v2, "event":Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;
    instance-of v3, v2, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;

    if-eqz v3, :cond_0

    .line 102
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 104
    :cond_0
    sget-object v3, Lcom/itextpdf/commons/actions/producer/ProducerBuilder;->INSTANCE:Lcom/itextpdf/commons/actions/producer/ProducerBuilder;

    invoke-virtual {v2}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getProductName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/commons/actions/producer/ProducerBuilder;->getActiveProcessor(Ljava/lang/String;)Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;

    move-result-object v3

    .line 105
    .local v3, "processor":Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;
    new-instance v4, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;

    invoke-interface {v3}, Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;->getUsageType()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3}, Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;->getProducer()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v2, v5, v6}, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;-><init>(Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    .end local v2    # "event":Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;
    .end local v3    # "processor":Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;
    :goto_1
    goto :goto_0

    .line 110
    :cond_1
    invoke-static {v0}, Lcom/itextpdf/commons/actions/producer/ProducerBuilder;->buildProducer(Ljava/util/List;)Ljava/lang/String;

    move-result-object v1

    .line 111
    .local v1, "newProducer":Ljava/lang/String;
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_2

    .line 114
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; modified using "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 112
    :cond_3
    :goto_2
    return-object v1
.end method

.method private static populatePlaceholders(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .locals 11
    .param p0, "producerLine"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 143
    .local p1, "events":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;>;"
    const/4 v0, 0x0

    .line 144
    .local v0, "lastIndex":I
    sget-object v1, Lcom/itextpdf/commons/actions/producer/ProducerBuilder;->PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 146
    .local v1, "matcher":Ljava/util/regex/Matcher;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .local v2, "builder":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 148
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->start()I

    move-result v3

    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v0

    .line 151
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    .line 152
    .local v3, "placeholder":Ljava/lang/String;
    const/16 v4, 0x3a

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 154
    .local v5, "delimiterPosition":I
    const/4 v6, 0x0

    .line 155
    .local v6, "parameter":Ljava/lang/String;
    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v7, -0x1

    if-ne v4, v7, :cond_0

    .line 156
    move-object v4, v3

    .local v4, "placeholderName":Ljava/lang/String;
    goto :goto_1

    .line 158
    .end local v4    # "placeholderName":Ljava/lang/String;
    :cond_0
    const/4 v4, 0x0

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 159
    .restart local v4    # "placeholderName":Ljava/lang/String;
    add-int/lit8 v7, v5, 0x1

    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 162
    :goto_1
    sget-object v7, Lcom/itextpdf/commons/actions/producer/ProducerBuilder;->PLACEHOLDER_POPULATORS:Ljava/util/Map;

    invoke-interface {v7, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/commons/actions/producer/IPlaceholderPopulator;

    .line 163
    .local v7, "populator":Lcom/itextpdf/commons/actions/producer/IPlaceholderPopulator;
    if-nez v7, :cond_1

    .line 164
    sget-object v8, Lcom/itextpdf/commons/actions/producer/ProducerBuilder;->LOGGER:Lorg/slf4j/Logger;

    const-string v9, "Unknown placeholder {0} was ignored"

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    goto :goto_2

    .line 167
    :cond_1
    invoke-interface {v7, p1, v6}, Lcom/itextpdf/commons/actions/producer/IPlaceholderPopulator;->populate(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .end local v3    # "placeholder":Ljava/lang/String;
    .end local v4    # "placeholderName":Ljava/lang/String;
    .end local v5    # "delimiterPosition":I
    .end local v6    # "parameter":Ljava/lang/String;
    .end local v7    # "populator":Lcom/itextpdf/commons/actions/producer/IPlaceholderPopulator;
    :goto_2
    goto :goto_0

    .line 170
    :cond_2
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method protected doAction()V
    .locals 2

    .line 125
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Configuration events for util internal purposes are not expected to be sent"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
