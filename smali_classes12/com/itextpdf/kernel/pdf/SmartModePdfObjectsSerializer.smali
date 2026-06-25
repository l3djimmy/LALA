.class Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;
.super Ljava/lang/Object;
.source "SmartModePdfObjectsSerializer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer$SelfReferenceException;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private serializedContentToObj:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/itextpdf/kernel/pdf/SerializedObjectContent;",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;"
        }
    .end annotation
.end field

.field private sha512:Ljava/security/MessageDigest;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 32
    return-void
.end method

.method constructor <init>()V
    .locals 2

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->serializedContentToObj:Ljava/util/HashMap;

    .line 38
    :try_start_0
    const-string v0, "SHA-512"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->sha512:Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    nop

    .line 42
    return-void

    .line 39
    :catch_0
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private isKeyRefersBack(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Z
    .locals 1
    .param p1, "dic"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 162
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 163
    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 162
    :goto_0
    return v0
.end method

.method private serArray(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/io/source/ByteBuffer;ILjava/util/Map;)V
    .locals 2
    .param p1, "array"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p2, "bb"    # Lcom/itextpdf/io/source/ByteBuffer;
    .param p3, "level"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfArray;",
            "Lcom/itextpdf/io/source/ByteBuffer;",
            "I",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            "[B>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer$SelfReferenceException;
        }
    .end annotation

    .line 151
    .local p4, "serializedCache":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;[B>;"
    const-string v0, "$A"

    invoke-virtual {p2, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(Ljava/lang/String;)Lcom/itextpdf/io/source/ByteBuffer;

    .line 152
    if-gtz p3, :cond_0

    .line 153
    return-void

    .line 154
    :cond_0
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 155
    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(IZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-direct {p0, v1, p2, p3, p4}, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->serObject(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/io/source/ByteBuffer;ILjava/util/Map;)V

    .line 154
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 157
    .end local v0    # "k":I
    :cond_1
    const-string v0, "$\\A"

    invoke-virtual {p2, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(Ljava/lang/String;)Lcom/itextpdf/io/source/ByteBuffer;

    .line 158
    return-void
.end method

.method private serDic(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/io/source/ByteBuffer;ILjava/util/Map;)V
    .locals 3
    .param p1, "dic"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "bb"    # Lcom/itextpdf/io/source/ByteBuffer;
    .param p3, "level"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Lcom/itextpdf/io/source/ByteBuffer;",
            "I",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            "[B>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer$SelfReferenceException;
        }
    .end annotation

    .line 135
    .local p4, "serializedCache":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;[B>;"
    const-string v0, "$D"

    invoke-virtual {p2, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(Ljava/lang/String;)Lcom/itextpdf/io/source/ByteBuffer;

    .line 136
    if-gtz p3, :cond_0

    .line 137
    return-void

    .line 138
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 139
    .local v1, "key":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-direct {p0, p1, v1}, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->isKeyRefersBack(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 140
    goto :goto_0

    .line 142
    :cond_1
    invoke-direct {p0, v1, p2, p3, p4}, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->serObject(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/io/source/ByteBuffer;ILjava/util/Map;)V

    .line 143
    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-direct {p0, v2, p2, p3, p4}, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->serObject(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/io/source/ByteBuffer;ILjava/util/Map;)V

    .line 145
    .end local v1    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    goto :goto_0

    .line 146
    :cond_2
    const-string v0, "$\\D"

    invoke-virtual {p2, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(Ljava/lang/String;)Lcom/itextpdf/io/source/ByteBuffer;

    .line 147
    return-void
.end method

.method private serObject(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/io/source/ByteBuffer;ILjava/util/Map;)V
    .locals 5
    .param p1, "obj"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "bb"    # Lcom/itextpdf/io/source/ByteBuffer;
    .param p3, "level"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            "Lcom/itextpdf/io/source/ByteBuffer;",
            "I",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            "[B>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer$SelfReferenceException;
        }
    .end annotation

    .line 78
    .local p4, "serializedCache":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;[B>;"
    if-gtz p3, :cond_0

    .line 79
    return-void

    .line 81
    :cond_0
    if-nez p1, :cond_1

    .line 82
    const-string v0, "$Lnull"

    invoke-virtual {p2, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(Ljava/lang/String;)Lcom/itextpdf/io/source/ByteBuffer;

    .line 83
    return-void

    .line 85
    :cond_1
    const/4 v0, 0x0

    .line 86
    .local v0, "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    const/4 v1, 0x0

    .line 88
    .local v1, "savedBb":Lcom/itextpdf/io/source/ByteBuffer;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 89
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 90
    invoke-interface {p4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    .line 91
    .local v2, "cached":[B
    if-eqz v2, :cond_2

    .line 92
    invoke-virtual {p2, v2}, Lcom/itextpdf/io/source/ByteBuffer;->append([B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 93
    return-void

    .line 96
    :cond_2
    invoke-interface {p4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_3

    .line 100
    invoke-interface {p4, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    move-object v1, p2

    .line 103
    new-instance v3, Lcom/itextpdf/io/source/ByteBuffer;

    invoke-direct {v3}, Lcom/itextpdf/io/source/ByteBuffer;-><init>()V

    move-object p2, v3

    .line 104
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p1

    goto :goto_0

    .line 98
    :cond_3
    new-instance v3, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer$SelfReferenceException;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer$SelfReferenceException;-><init>(Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer$1;)V

    throw v3

    .line 108
    .end local v2    # "cached":[B
    :cond_4
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isStream()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_5

    .line 109
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    add-int/lit8 v4, p3, -0x1

    invoke-direct {p0, v2, p2, v4, p4}, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->serDic(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/io/source/ByteBuffer;ILjava/util/Map;)V

    .line 110
    const-string v2, "$B"

    invoke-virtual {p2, v2}, Lcom/itextpdf/io/source/ByteBuffer;->append(Ljava/lang/String;)Lcom/itextpdf/io/source/ByteBuffer;

    .line 111
    if-lez p3, :cond_a

    .line 112
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->sha512:Ljava/security/MessageDigest;

    move-object v4, p1

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes(Z)[B

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/itextpdf/io/source/ByteBuffer;->append([B)Lcom/itextpdf/io/source/ByteBuffer;

    goto :goto_1

    .line 114
    :cond_5
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 115
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    add-int/lit8 v4, p3, -0x1

    invoke-direct {p0, v2, p2, v4, p4}, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->serDic(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/io/source/ByteBuffer;ILjava/util/Map;)V

    goto :goto_1

    .line 116
    :cond_6
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 117
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    add-int/lit8 v4, p3, -0x1

    invoke-direct {p0, v2, p2, v4, p4}, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->serArray(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/io/source/ByteBuffer;ILjava/util/Map;)V

    goto :goto_1

    .line 118
    :cond_7
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isString()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 119
    const-string v2, "$S"

    invoke-virtual {p2, v2}, Lcom/itextpdf/io/source/ByteBuffer;->append(Ljava/lang/String;)Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/itextpdf/io/source/ByteBuffer;->append(Ljava/lang/String;)Lcom/itextpdf/io/source/ByteBuffer;

    goto :goto_1

    .line 120
    :cond_8
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isName()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 121
    const-string v2, "$N"

    invoke-virtual {p2, v2}, Lcom/itextpdf/io/source/ByteBuffer;->append(Ljava/lang/String;)Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/itextpdf/io/source/ByteBuffer;->append(Ljava/lang/String;)Lcom/itextpdf/io/source/ByteBuffer;

    goto :goto_1

    .line 124
    :cond_9
    const-string v2, "$L"

    invoke-virtual {p2, v2}, Lcom/itextpdf/io/source/ByteBuffer;->append(Ljava/lang/String;)Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/itextpdf/io/source/ByteBuffer;->append(Ljava/lang/String;)Lcom/itextpdf/io/source/ByteBuffer;

    .line 127
    :cond_a
    :goto_1
    if-eqz v1, :cond_b

    .line 128
    invoke-virtual {p2}, Lcom/itextpdf/io/source/ByteBuffer;->toByteArray()[B

    move-result-object v2

    invoke-interface {p4, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    invoke-virtual {p2}, Lcom/itextpdf/io/source/ByteBuffer;->getInternalBuffer()[B

    move-result-object v2

    invoke-virtual {p2}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/itextpdf/io/source/ByteBuffer;->append([BII)Lcom/itextpdf/io/source/ByteBuffer;

    .line 131
    :cond_b
    return-void
.end method


# virtual methods
.method public getSavedSerializedObject(Lcom/itextpdf/kernel/pdf/SerializedObjectContent;)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .locals 1
    .param p1, "serializedContent"    # Lcom/itextpdf/kernel/pdf/SerializedObjectContent;

    .line 49
    if-eqz p1, :cond_0

    .line 50
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->serializedContentToObj:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    return-object v0

    .line 52
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public saveSerializedObject(Lcom/itextpdf/kernel/pdf/SerializedObjectContent;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V
    .locals 1
    .param p1, "serializedContent"    # Lcom/itextpdf/kernel/pdf/SerializedObjectContent;
    .param p2, "objectReference"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 45
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->serializedContentToObj:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    return-void
.end method

.method public serializeObject(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/SerializedObjectContent;
    .locals 7
    .param p1, "obj"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 56
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isStream()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v0

    if-nez v0, :cond_0

    .line 57
    return-object v1

    .line 59
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    .line 60
    .local v0, "indRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v0, :cond_2

    .line 61
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfDocument;->serializedObjectsCache:Ljava/util/Map;

    .line 63
    .local v2, "serializedCache":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;[B>;"
    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    .line 64
    .local v3, "content":[B
    if-nez v3, :cond_1

    .line 65
    new-instance v4, Lcom/itextpdf/io/source/ByteBuffer;

    invoke-direct {v4}, Lcom/itextpdf/io/source/ByteBuffer;-><init>()V

    .line 66
    .local v4, "bb":Lcom/itextpdf/io/source/ByteBuffer;
    const/16 v5, 0x64

    .line 68
    .local v5, "level":I
    :try_start_0
    invoke-direct {p0, p1, v4, v5, v2}, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->serObject(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/io/source/ByteBuffer;ILjava/util/Map;)V
    :try_end_0
    .catch Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer$SelfReferenceException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    nop

    .line 72
    invoke-virtual {v4}, Lcom/itextpdf/io/source/ByteBuffer;->toByteArray()[B

    move-result-object v3

    goto :goto_0

    .line 69
    :catch_0
    move-exception v6

    .line 70
    .local v6, "e":Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer$SelfReferenceException;
    return-object v1

    .line 74
    .end local v4    # "bb":Lcom/itextpdf/io/source/ByteBuffer;
    .end local v5    # "level":I
    .end local v6    # "e":Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer$SelfReferenceException;
    :cond_1
    :goto_0
    new-instance v1, Lcom/itextpdf/kernel/pdf/SerializedObjectContent;

    invoke-direct {v1, v3}, Lcom/itextpdf/kernel/pdf/SerializedObjectContent;-><init>([B)V

    return-object v1

    .line 60
    .end local v2    # "serializedCache":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;[B>;"
    .end local v3    # "content":[B
    :cond_2
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method
