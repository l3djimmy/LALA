.class public final Lcom/itextpdf/commons/utils/JsonUtil;
.super Ljava/lang/Object;
.source "JsonUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/commons/utils/JsonUtil$MinimalPrinter;,
        Lcom/itextpdf/commons/utils/JsonUtil$CustomPrettyPrinter;
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 49
    const-class v0, Lcom/itextpdf/commons/utils/JsonUtil;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/commons/utils/JsonUtil;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method public static areTwoJsonObjectEquals(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p0, "expectedString"    # Ljava/lang/String;
    .param p1, "toCompare"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 66
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    .line 68
    .local v0, "mapper":Lcom/fasterxml/jackson/databind/ObjectMapper;
    invoke-virtual {v0, p0}, Lcom/fasterxml/jackson/databind/ObjectMapper;->readTree(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v1

    .line 69
    .local v1, "expectedObject":Lcom/fasterxml/jackson/databind/JsonNode;
    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/ObjectMapper;->readTree(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v2

    .line 71
    .local v2, "actualObject":Lcom/fasterxml/jackson/databind/JsonNode;
    invoke-virtual {v2, v1}, Lcom/fasterxml/jackson/databind/JsonNode;->equals(Ljava/lang/Object;)Z

    move-result v3

    return v3
.end method

.method private static createAndConfigureObjectWriter(Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .locals 4
    .param p0, "prettyPrinter"    # Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;

    .line 223
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    .line 224
    .local v0, "objectMapper":Lcom/fasterxml/jackson/databind/ObjectMapper;
    sget-object v1, Lcom/fasterxml/jackson/databind/SerializationFeature;->INDENT_OUTPUT:Lcom/fasterxml/jackson/databind/SerializationFeature;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/ObjectMapper;->enable(Lcom/fasterxml/jackson/databind/SerializationFeature;)Lcom/fasterxml/jackson/databind/ObjectMapper;

    .line 226
    sget-object v1, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->NON_NULL:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/ObjectMapper;->setSerializationInclusion(Lcom/fasterxml/jackson/annotation/JsonInclude$Include;)Lcom/fasterxml/jackson/databind/ObjectMapper;

    .line 227
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    const/4 v2, 0x0

    sget-object v3, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->AUTO_CLOSE_TARGET:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/ObjectMapper;->disable([Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Lcom/fasterxml/jackson/databind/ObjectMapper;

    .line 228
    invoke-virtual {v0, p0}, Lcom/fasterxml/jackson/databind/ObjectMapper;->writer(Lcom/fasterxml/jackson/core/PrettyPrinter;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object v1

    return-object v1
.end method

.method public static deserializeFromStream(Ljava/io/InputStream;Lcom/fasterxml/jackson/core/type/TypeReference;)Ljava/lang/Object;
    .locals 2
    .param p0, "content"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Lcom/fasterxml/jackson/core/type/TypeReference<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 141
    .local p1, "objectType":Lcom/fasterxml/jackson/core/type/TypeReference;, "Lcom/fasterxml/jackson/core/type/TypeReference<TT;>;"
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    .line 142
    .local v0, "objectMapper":Lcom/fasterxml/jackson/databind/ObjectMapper;
    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/ObjectMapper;->constructType(Lcom/fasterxml/jackson/core/type/TypeReference;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/itextpdf/commons/utils/JsonUtil;->deserializeFromStream(Ljava/io/InputStream;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static deserializeFromStream(Ljava/io/InputStream;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Object;
    .locals 5
    .param p0, "content"    # Ljava/io/InputStream;
    .param p1, "objectType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")TT;"
        }
    .end annotation

    .line 155
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    .line 156
    .local v0, "objectMapper":Lcom/fasterxml/jackson/databind/ObjectMapper;
    sget-object v1, Lcom/fasterxml/jackson/databind/DeserializationFeature;->FAIL_ON_UNKNOWN_PROPERTIES:Lcom/fasterxml/jackson/databind/DeserializationFeature;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/databind/ObjectMapper;->configure(Lcom/fasterxml/jackson/databind/DeserializationFeature;Z)Lcom/fasterxml/jackson/databind/ObjectMapper;

    .line 158
    :try_start_0
    invoke-virtual {v0, p0, p1}, Lcom/fasterxml/jackson/databind/ObjectMapper;->readValue(Ljava/io/InputStream;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 159
    :catch_0
    move-exception v1

    .line 160
    .local v1, "ex":Ljava/io/IOException;
    sget-object v2, Lcom/itextpdf/commons/utils/JsonUtil;->LOGGER:Lorg/slf4j/Logger;

    .line 161
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    .line 160
    const-string v4, "Unable to deserialize json. Exception {0} was thrown with the message: {1}."

    invoke-static {v4, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 162
    const/4 v2, 0x0

    return-object v2
.end method

.method public static deserializeFromStream(Ljava/io/InputStream;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .param p0, "content"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 127
    .local p1, "objectType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    .line 128
    .local v0, "objectMapper":Lcom/fasterxml/jackson/databind/ObjectMapper;
    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/ObjectMapper;->constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/itextpdf/commons/utils/JsonUtil;->deserializeFromStream(Ljava/io/InputStream;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static deserializeFromString(Ljava/lang/String;Lcom/fasterxml/jackson/core/type/TypeReference;)Ljava/lang/Object;
    .locals 2
    .param p0, "content"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/core/type/TypeReference<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 190
    .local p1, "objectType":Lcom/fasterxml/jackson/core/type/TypeReference;, "Lcom/fasterxml/jackson/core/type/TypeReference<TT;>;"
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    .line 191
    .local v0, "objectMapper":Lcom/fasterxml/jackson/databind/ObjectMapper;
    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/ObjectMapper;->constructType(Lcom/fasterxml/jackson/core/type/TypeReference;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/itextpdf/commons/utils/JsonUtil;->deserializeFromString(Ljava/lang/String;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static deserializeFromString(Ljava/lang/String;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Object;
    .locals 5
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "objectType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")TT;"
        }
    .end annotation

    .line 204
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    .line 205
    .local v0, "objectMapper":Lcom/fasterxml/jackson/databind/ObjectMapper;
    sget-object v1, Lcom/fasterxml/jackson/databind/DeserializationFeature;->FAIL_ON_UNKNOWN_PROPERTIES:Lcom/fasterxml/jackson/databind/DeserializationFeature;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/databind/ObjectMapper;->configure(Lcom/fasterxml/jackson/databind/DeserializationFeature;Z)Lcom/fasterxml/jackson/databind/ObjectMapper;

    .line 207
    :try_start_0
    invoke-virtual {v0, p0, p1}, Lcom/fasterxml/jackson/databind/ObjectMapper;->readValue(Ljava/lang/String;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Lcom/fasterxml/jackson/core/JsonProcessingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 208
    :catch_0
    move-exception v1

    .line 209
    .local v1, "ex":Lcom/fasterxml/jackson/core/JsonProcessingException;
    sget-object v2, Lcom/itextpdf/commons/utils/JsonUtil;->LOGGER:Lorg/slf4j/Logger;

    .line 210
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonProcessingException;->getMessage()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    .line 209
    const-string v4, "Unable to deserialize json. Exception {0} was thrown with the message: {1}."

    invoke-static {v4, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 211
    const/4 v2, 0x0

    return-object v2
.end method

.method public static deserializeFromString(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .param p0, "content"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 176
    .local p1, "objectType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    .line 177
    .local v0, "objectMapper":Lcom/fasterxml/jackson/databind/ObjectMapper;
    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/ObjectMapper;->constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/itextpdf/commons/utils/JsonUtil;->deserializeFromString(Ljava/lang/String;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static serializeToMinimalStream(Ljava/io/OutputStream;Ljava/lang/Object;)V
    .locals 1
    .param p0, "outputStream"    # Ljava/io/OutputStream;
    .param p1, "value"    # Ljava/lang/Object;

    .line 102
    new-instance v0, Lcom/itextpdf/commons/utils/JsonUtil$MinimalPrinter;

    invoke-direct {v0}, Lcom/itextpdf/commons/utils/JsonUtil$MinimalPrinter;-><init>()V

    invoke-static {p0, p1, v0}, Lcom/itextpdf/commons/utils/JsonUtil;->serializeToStream(Ljava/io/OutputStream;Ljava/lang/Object;Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;)V

    .line 103
    return-void
.end method

.method public static serializeToMinimalString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;

    .line 114
    new-instance v0, Lcom/itextpdf/commons/utils/JsonUtil$MinimalPrinter;

    invoke-direct {v0}, Lcom/itextpdf/commons/utils/JsonUtil$MinimalPrinter;-><init>()V

    invoke-static {p0, v0}, Lcom/itextpdf/commons/utils/JsonUtil;->serializeToString(Ljava/lang/Object;Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static serializeToStream(Ljava/io/OutputStream;Ljava/lang/Object;)V
    .locals 1
    .param p0, "outputStream"    # Ljava/io/OutputStream;
    .param p1, "value"    # Ljava/lang/Object;

    .line 81
    new-instance v0, Lcom/itextpdf/commons/utils/JsonUtil$CustomPrettyPrinter;

    invoke-direct {v0}, Lcom/itextpdf/commons/utils/JsonUtil$CustomPrettyPrinter;-><init>()V

    invoke-static {p0, p1, v0}, Lcom/itextpdf/commons/utils/JsonUtil;->serializeToStream(Ljava/io/OutputStream;Ljava/lang/Object;Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;)V

    .line 82
    return-void
.end method

.method private static serializeToStream(Ljava/io/OutputStream;Ljava/lang/Object;Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;)V
    .locals 4
    .param p0, "outputStream"    # Ljava/io/OutputStream;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "prettyPrinter"    # Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;

    .line 241
    :try_start_0
    invoke-static {p2}, Lcom/itextpdf/commons/utils/JsonUtil;->createAndConfigureObjectWriter(Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->writeValue(Ljava/io/OutputStream;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 245
    goto :goto_0

    .line 242
    :catch_0
    move-exception v0

    .line 243
    .local v0, "ex":Ljava/io/IOException;
    sget-object v1, Lcom/itextpdf/commons/utils/JsonUtil;->LOGGER:Lorg/slf4j/Logger;

    .line 244
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    .line 243
    const-string v3, "Unable to serialize object. Exception {0} was thrown with the message: {1}."

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 246
    .end local v0    # "ex":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method public static serializeToString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;

    .line 92
    new-instance v0, Lcom/itextpdf/commons/utils/JsonUtil$CustomPrettyPrinter;

    invoke-direct {v0}, Lcom/itextpdf/commons/utils/JsonUtil$CustomPrettyPrinter;-><init>()V

    invoke-static {p0, v0}, Lcom/itextpdf/commons/utils/JsonUtil;->serializeToString(Ljava/lang/Object;Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static serializeToString(Ljava/lang/Object;Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;)Ljava/lang/String;
    .locals 4
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "prettyPrinter"    # Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;

    .line 258
    :try_start_0
    invoke-static {p1}, Lcom/itextpdf/commons/utils/JsonUtil;->createAndConfigureObjectWriter(Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->writeValueAsString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Lcom/fasterxml/jackson/core/JsonProcessingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 259
    :catch_0
    move-exception v0

    .line 260
    .local v0, "ex":Lcom/fasterxml/jackson/core/JsonProcessingException;
    sget-object v1, Lcom/itextpdf/commons/utils/JsonUtil;->LOGGER:Lorg/slf4j/Logger;

    .line 261
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonProcessingException;->getMessage()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    .line 260
    const-string v3, "Unable to serialize object. Exception {0} was thrown with the message: {1}."

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 262
    const/4 v1, 0x0

    return-object v1
.end method
