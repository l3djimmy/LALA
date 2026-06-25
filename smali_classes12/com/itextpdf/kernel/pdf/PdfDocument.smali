.class public Lcom/itextpdf/kernel/pdf/PdfDocument;
.super Ljava/lang/Object;
.source "PdfDocument.java"

# interfaces
.implements Lcom/itextpdf/kernel/events/IEventDispatcher;
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/PdfDocument$DestinationMutationInfo;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final PDF_NAMES_TO_REMOVE_FROM_ORIGINAL_TRAILER:[Lcom/itextpdf/kernel/pdf/PdfName;

.field private static final pdfPageFactory:Lcom/itextpdf/kernel/pdf/IPdfPageFactory;


# instance fields
.field protected catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

.field protected closeReader:Z

.field protected closeWriter:Z

.field protected closed:Z

.field private defaultFont:Lcom/itextpdf/kernel/font/PdfFont;

.field private defaultPageSize:Lcom/itextpdf/kernel/geom/PageSize;

.field private final diContainer:Lcom/itextpdf/commons/utils/DIContainer;

.field private final documentFonts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            "Lcom/itextpdf/kernel/font/PdfFont;",
            ">;"
        }
    .end annotation
.end field

.field private final documentId:Lcom/itextpdf/commons/actions/sequence/SequenceId;

.field private encryptedEmbeddedStreamsHandler:Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;

.field protected eventDispatcher:Lcom/itextpdf/kernel/events/EventDispatcher;

.field protected fingerPrint:Lcom/itextpdf/kernel/pdf/FingerPrint;

.field protected flushUnusedObjects:Z

.field protected info:Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

.field protected isClosing:Z

.field memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

.field private modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

.field private originalDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

.field protected pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

.field private final pendingDestinationMutations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfDocument$DestinationMutationInfo;",
            ">;"
        }
    .end annotation
.end field

.field protected final properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

.field protected reader:Lcom/itextpdf/kernel/pdf/PdfReader;

.field protected serializeOptions:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

.field serializedObjectsCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            "[B>;"
        }
    .end annotation
.end field

.field protected structParentIndex:I

.field protected structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

.field protected tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

.field protected trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

.field protected writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

.field protected xmpMetadata:[B

.field final xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 91
    nop

    .line 93
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v1, 0x0

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Encrypt:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Size:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Prev:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Root:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Info:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->XRefStm:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfDocument;->PDF_NAMES_TO_REMOVE_FROM_ORIGINAL_TRAILER:[Lcom/itextpdf/kernel/pdf/PdfName;

    .line 103
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfPageFactory;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfPageFactory;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pdfPageFactory:Lcom/itextpdf/kernel/pdf/IPdfPageFactory;

    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfReader;)V
    .locals 1
    .param p1, "reader"    # Lcom/itextpdf/kernel/pdf/PdfReader;

    .line 195
    new-instance v0, Lcom/itextpdf/kernel/pdf/DocumentProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/DocumentProperties;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/DocumentProperties;)V

    .line 196
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/DocumentProperties;)V
    .locals 3
    .param p1, "reader"    # Lcom/itextpdf/kernel/pdf/PdfReader;
    .param p2, "properties"    # Lcom/itextpdf/kernel/pdf/DocumentProperties;

    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    .line 109
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->documentFonts:Ljava/util/Map;

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pendingDestinationMutations:Ljava/util/List;

    .line 118
    new-instance v0, Lcom/itextpdf/kernel/events/EventDispatcher;

    invoke-direct {v0}, Lcom/itextpdf/kernel/events/EventDispatcher;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->eventDispatcher:Lcom/itextpdf/kernel/events/EventDispatcher;

    .line 123
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    .line 129
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    .line 133
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xmpMetadata:[B

    .line 137
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 141
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 145
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->info:Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 149
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_1_7:Lcom/itextpdf/kernel/pdf/PdfVersion;

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 151
    new-instance v1, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-direct {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->serializeOptions:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    .line 153
    const/4 v1, -0x1

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structParentIndex:I

    .line 154
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closeReader:Z

    .line 155
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closeWriter:Z

    .line 156
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->isClosing:Z

    .line 157
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closed:Z

    .line 161
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->flushUnusedObjects:Z

    .line 166
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->serializedObjectsCache:Ljava/util/Map;

    .line 170
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    .line 175
    sget-object v1, Lcom/itextpdf/kernel/geom/PageSize;->DEFAULT:Lcom/itextpdf/kernel/geom/PageSize;

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->defaultPageSize:Lcom/itextpdf/kernel/geom/PageSize;

    .line 184
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->defaultFont:Lcom/itextpdf/kernel/font/PdfFont;

    .line 187
    new-instance v1, Lcom/itextpdf/commons/utils/DIContainer;

    invoke-direct {v1}, Lcom/itextpdf/commons/utils/DIContainer;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->diContainer:Lcom/itextpdf/commons/utils/DIContainer;

    .line 205
    if-eqz p1, :cond_0

    .line 208
    new-instance v1, Lcom/itextpdf/commons/actions/sequence/SequenceId;

    invoke-direct {v1}, Lcom/itextpdf/commons/actions/sequence/SequenceId;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->documentId:Lcom/itextpdf/commons/actions/sequence/SequenceId;

    .line 209
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    .line 211
    new-instance v1, Lcom/itextpdf/kernel/pdf/StampingProperties;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/StampingProperties;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    .line 212
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-object v2, p2, Lcom/itextpdf/kernel/pdf/DocumentProperties;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/StampingProperties;->setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;

    .line 213
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->open(Lcom/itextpdf/kernel/pdf/PdfVersion;)V

    .line 214
    return-void

    .line 206
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The reader in PdfDocument constructor can not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/PdfWriter;)V
    .locals 1
    .param p1, "reader"    # Lcom/itextpdf/kernel/pdf/PdfReader;
    .param p2, "writer"    # Lcom/itextpdf/kernel/pdf/PdfWriter;

    .line 253
    new-instance v0, Lcom/itextpdf/kernel/pdf/StampingProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/StampingProperties;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/PdfWriter;Lcom/itextpdf/kernel/pdf/StampingProperties;)V

    .line 254
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/PdfWriter;Lcom/itextpdf/kernel/pdf/StampingProperties;)V
    .locals 4
    .param p1, "reader"    # Lcom/itextpdf/kernel/pdf/PdfReader;
    .param p2, "writer"    # Lcom/itextpdf/kernel/pdf/PdfWriter;
    .param p3, "properties"    # Lcom/itextpdf/kernel/pdf/StampingProperties;

    .line 263
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    .line 109
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->documentFonts:Ljava/util/Map;

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pendingDestinationMutations:Ljava/util/List;

    .line 118
    new-instance v0, Lcom/itextpdf/kernel/events/EventDispatcher;

    invoke-direct {v0}, Lcom/itextpdf/kernel/events/EventDispatcher;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->eventDispatcher:Lcom/itextpdf/kernel/events/EventDispatcher;

    .line 123
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    .line 129
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    .line 133
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xmpMetadata:[B

    .line 137
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 141
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 145
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->info:Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 149
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_1_7:Lcom/itextpdf/kernel/pdf/PdfVersion;

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 151
    new-instance v1, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-direct {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->serializeOptions:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    .line 153
    const/4 v1, -0x1

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structParentIndex:I

    .line 154
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closeReader:Z

    .line 155
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closeWriter:Z

    .line 156
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->isClosing:Z

    .line 157
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closed:Z

    .line 161
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->flushUnusedObjects:Z

    .line 166
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->serializedObjectsCache:Ljava/util/Map;

    .line 170
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    .line 175
    sget-object v1, Lcom/itextpdf/kernel/geom/PageSize;->DEFAULT:Lcom/itextpdf/kernel/geom/PageSize;

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->defaultPageSize:Lcom/itextpdf/kernel/geom/PageSize;

    .line 184
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->defaultFont:Lcom/itextpdf/kernel/font/PdfFont;

    .line 187
    new-instance v0, Lcom/itextpdf/commons/utils/DIContainer;

    invoke-direct {v0}, Lcom/itextpdf/commons/utils/DIContainer;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->diContainer:Lcom/itextpdf/commons/utils/DIContainer;

    .line 264
    if-eqz p1, :cond_3

    .line 267
    if-eqz p2, :cond_2

    .line 270
    new-instance v0, Lcom/itextpdf/commons/actions/sequence/SequenceId;

    invoke-direct {v0}, Lcom/itextpdf/commons/actions/sequence/SequenceId;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->documentId:Lcom/itextpdf/commons/actions/sequence/SequenceId;

    .line 271
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    .line 272
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    .line 273
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    .line 275
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->writerHasEncryption()Z

    move-result v0

    .line 276
    .local v0, "writerHasEncryption":Z
    iget-boolean v1, p3, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    const-class v2, Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 277
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 278
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v3, "Writer encryption will be ignored, because append mode is used. Document will preserve the original encryption (or will stay unencrypted)"

    invoke-interface {v1, v3}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 280
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_0
    iget-boolean v1, p3, Lcom/itextpdf/kernel/pdf/StampingProperties;->preserveEncryption:Z

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    .line 281
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 282
    .restart local v1    # "logger":Lorg/slf4j/Logger;
    const-string v2, "Writer encryption will be ignored, because preservation of encryption is enabled. Document will preserve the original encryption (or will stay unencrypted)"

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 285
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_1
    iget-object v1, p2, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/WriterProperties;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->open(Lcom/itextpdf/kernel/pdf/PdfVersion;)V

    .line 286
    return-void

    .line 268
    .end local v0    # "writerHasEncryption":Z
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The writer in PdfDocument constructor can not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 265
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The reader in PdfDocument constructor can not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfWriter;)V
    .locals 1
    .param p1, "writer"    # Lcom/itextpdf/kernel/pdf/PdfWriter;

    .line 223
    new-instance v0, Lcom/itextpdf/kernel/pdf/DocumentProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/DocumentProperties;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfWriter;Lcom/itextpdf/kernel/pdf/DocumentProperties;)V

    .line 224
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfWriter;Lcom/itextpdf/kernel/pdf/DocumentProperties;)V
    .locals 2
    .param p1, "writer"    # Lcom/itextpdf/kernel/pdf/PdfWriter;
    .param p2, "properties"    # Lcom/itextpdf/kernel/pdf/DocumentProperties;

    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    .line 109
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->documentFonts:Ljava/util/Map;

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pendingDestinationMutations:Ljava/util/List;

    .line 118
    new-instance v0, Lcom/itextpdf/kernel/events/EventDispatcher;

    invoke-direct {v0}, Lcom/itextpdf/kernel/events/EventDispatcher;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->eventDispatcher:Lcom/itextpdf/kernel/events/EventDispatcher;

    .line 123
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    .line 129
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    .line 133
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xmpMetadata:[B

    .line 137
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 141
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 145
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->info:Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 149
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_1_7:Lcom/itextpdf/kernel/pdf/PdfVersion;

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 151
    new-instance v1, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-direct {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->serializeOptions:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    .line 153
    const/4 v1, -0x1

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structParentIndex:I

    .line 154
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closeReader:Z

    .line 155
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closeWriter:Z

    .line 156
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->isClosing:Z

    .line 157
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closed:Z

    .line 161
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->flushUnusedObjects:Z

    .line 166
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->serializedObjectsCache:Ljava/util/Map;

    .line 170
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    .line 175
    sget-object v1, Lcom/itextpdf/kernel/geom/PageSize;->DEFAULT:Lcom/itextpdf/kernel/geom/PageSize;

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->defaultPageSize:Lcom/itextpdf/kernel/geom/PageSize;

    .line 184
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->defaultFont:Lcom/itextpdf/kernel/font/PdfFont;

    .line 187
    new-instance v0, Lcom/itextpdf/commons/utils/DIContainer;

    invoke-direct {v0}, Lcom/itextpdf/commons/utils/DIContainer;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->diContainer:Lcom/itextpdf/commons/utils/DIContainer;

    .line 234
    if-eqz p1, :cond_0

    .line 237
    new-instance v0, Lcom/itextpdf/commons/actions/sequence/SequenceId;

    invoke-direct {v0}, Lcom/itextpdf/commons/actions/sequence/SequenceId;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->documentId:Lcom/itextpdf/commons/actions/sequence/SequenceId;

    .line 238
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    .line 240
    new-instance v0, Lcom/itextpdf/kernel/pdf/StampingProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/StampingProperties;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    .line 241
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-object v1, p2, Lcom/itextpdf/kernel/pdf/DocumentProperties;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/StampingProperties;->setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;

    .line 242
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/WriterProperties;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->open(Lcom/itextpdf/kernel/pdf/PdfVersion;)V

    .line 243
    return-void

    .line 235
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The writer in PdfDocument constructor can not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private cloneOutlines(Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfOutline;Lcom/itextpdf/kernel/pdf/PdfOutline;Ljava/util/Map;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 10
    .param p2, "newParent"    # Lcom/itextpdf/kernel/pdf/PdfOutline;
    .param p3, "oldParent"    # Lcom/itextpdf/kernel/pdf/PdfOutline;
    .param p5, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfOutline;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfOutline;",
            "Lcom/itextpdf/kernel/pdf/PdfOutline;",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ")V"
        }
    .end annotation

    .line 2526
    .local p1, "outlinesToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    .local p4, "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    if-nez p3, :cond_0

    .line 2527
    return-void

    .line 2529
    :cond_0
    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getAllChildren()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 2530
    .local v5, "outline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    invoke-interface {p1, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 2531
    const/4 v1, 0x0

    .line 2532
    .local v1, "copiedDest":Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getDestination()Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 2533
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getDestination()Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    .line 2534
    .local v2, "destObjToCopy":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v3

    invoke-virtual {v3, v2, p4, p5}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->copyDestination(Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/util/Map;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    move-result-object v1

    .line 2536
    .end local v2    # "destObjToCopy":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/itextpdf/kernel/pdf/PdfOutline;->addOutline(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfOutline;

    move-result-object v4

    .line 2537
    .local v4, "child":Lcom/itextpdf/kernel/pdf/PdfOutline;
    if-eqz v1, :cond_2

    .line 2538
    invoke-virtual {v4, v1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->addDestination(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V

    .line 2540
    :cond_2
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getStyle()Ljava/lang/Integer;

    move-result-object v8

    .line 2541
    .local v8, "copiedStyle":Ljava/lang/Integer;
    if-eqz v8, :cond_3

    .line 2542
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/pdf/PdfOutline;->setStyle(I)V

    .line 2544
    :cond_3
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v9

    .line 2545
    .local v9, "copiedColor":Lcom/itextpdf/kernel/colors/Color;
    if-eqz v9, :cond_4

    .line 2546
    invoke-virtual {v4, v9}, Lcom/itextpdf/kernel/pdf/PdfOutline;->setColor(Lcom/itextpdf/kernel/colors/Color;)V

    .line 2548
    :cond_4
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfOutline;->isOpen()Z

    move-result v2

    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/pdf/PdfOutline;->setOpen(Z)V

    .line 2550
    move-object v2, p0

    move-object v3, p1

    move-object v6, p4

    move-object v7, p5

    .end local p1    # "outlinesToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    .end local p4    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .end local p5    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v3, "outlinesToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    .local v6, "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .local v7, "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    invoke-direct/range {v2 .. v7}, Lcom/itextpdf/kernel/pdf/PdfDocument;->cloneOutlines(Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfOutline;Lcom/itextpdf/kernel/pdf/PdfOutline;Ljava/util/Map;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    goto :goto_1

    .line 2530
    .end local v1    # "copiedDest":Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    .end local v3    # "outlinesToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    .end local v4    # "child":Lcom/itextpdf/kernel/pdf/PdfOutline;
    .end local v6    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .end local v7    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v8    # "copiedStyle":Ljava/lang/Integer;
    .end local v9    # "copiedColor":Lcom/itextpdf/kernel/colors/Color;
    .restart local p1    # "outlinesToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    .restart local p4    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .restart local p5    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_5
    move-object v3, p1

    move-object v6, p4

    move-object v7, p5

    .line 2552
    .end local v5    # "outline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    .end local p1    # "outlinesToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    .end local p4    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .end local p5    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v3    # "outlinesToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    .restart local v6    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .restart local v7    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :goto_1
    move-object p1, v3

    move-object p4, v6

    move-object p5, v7

    goto :goto_0

    .line 2553
    .end local v3    # "outlinesToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    .end local v6    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .end local v7    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outlinesToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    .restart local p4    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .restart local p5    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_6
    return-void
.end method

.method private copyOutlines(Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/Map;)V
    .locals 7
    .param p2, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfOutline;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;)V"
        }
    .end annotation

    .line 2484
    .local p1, "outlines":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    .local p3, "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    move-object v2, v0

    .line 2485
    .local v2, "outlinesToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    invoke-interface {v2, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 2487
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 2488
    .local v1, "outline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    invoke-direct {p0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getAllOutlinesToCopy(Lcom/itextpdf/kernel/pdf/PdfOutline;Ljava/util/Set;)V

    .line 2489
    .end local v1    # "outline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    goto :goto_0

    .line 2491
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getOutlines(Z)Lcom/itextpdf/kernel/pdf/PdfOutline;

    move-result-object v1

    .line 2492
    .local v1, "rootOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    if-nez v1, :cond_1

    .line 2493
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfOutline;

    invoke-direct {v3, p2}, Lcom/itextpdf/kernel/pdf/PdfOutline;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    move-object v1, v3

    .line 2494
    const-string v3, "Outlines"

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfOutline;->setTitle(Ljava/lang/String;)V

    move-object v3, v1

    goto :goto_1

    .line 2492
    :cond_1
    move-object v3, v1

    .line 2497
    .end local v1    # "rootOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    .local v3, "rootOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    :goto_1
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getOutlines(Z)Lcom/itextpdf/kernel/pdf/PdfOutline;

    move-result-object v4

    move-object v1, p0

    move-object v6, p2

    move-object v5, p3

    .end local p2    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p3    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .local v5, "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .local v6, "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/kernel/pdf/PdfDocument;->cloneOutlines(Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfOutline;Lcom/itextpdf/kernel/pdf/PdfOutline;Ljava/util/Map;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 2498
    return-void
.end method

.method private ensureTreeRootAddedToNames(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 3
    .param p1, "treeRoot"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "treeType"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 2556
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Names:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 2557
    .local v0, "names":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v0, :cond_0

    .line 2558
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    move-object v0, v1

    .line 2559
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Names:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 2560
    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 2562
    :cond_0
    invoke-virtual {v0, p2, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 2563
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 2564
    return-void
.end method

.method private getAllOutlinesToCopy(Lcom/itextpdf/kernel/pdf/PdfOutline;Ljava/util/Set;)V
    .locals 3
    .param p1, "outline"    # Lcom/itextpdf/kernel/pdf/PdfOutline;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfOutline;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfOutline;",
            ">;)V"
        }
    .end annotation

    .line 2507
    .local p2, "outlinesToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getParent()Lcom/itextpdf/kernel/pdf/PdfOutline;

    move-result-object v0

    .line 2510
    .local v0, "parent":Lcom/itextpdf/kernel/pdf/PdfOutline;
    const-string v1, "Outlines"

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {p2, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 2513
    :cond_0
    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2514
    invoke-direct {p0, v0, p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getAllOutlinesToCopy(Lcom/itextpdf/kernel/pdf/PdfOutline;Ljava/util/Set;)V

    .line 2515
    return-void

    .line 2511
    :cond_1
    :goto_0
    return-void
.end method

.method private static isXmpMetaHasProperty(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "xmpMeta"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 2622
    invoke-interface {p0, p1, p2}, Lcom/itextpdf/kernel/xmp/XMPMeta;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static overrideFullCompressionInWriterProperties(Lcom/itextpdf/kernel/pdf/WriterProperties;Z)V
    .locals 3
    .param p0, "properties"    # Lcom/itextpdf/kernel/pdf/WriterProperties;
    .param p1, "readerHasXrefStream"    # Z

    .line 2611
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->isFullCompression:Ljava/lang/Boolean;

    const-class v2, Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-ne v0, v1, :cond_0

    if-nez p1, :cond_0

    .line 2612
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 2613
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Full compression mode requested in append mode but the original document has cross-reference table, not cross-reference stream. Falling back to cross-reference table in appended document and switching full compression off"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .end local v0    # "logger":Lorg/slf4j/Logger;
    goto :goto_0

    .line 2614
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->isFullCompression:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_1

    if-eqz p1, :cond_1

    .line 2615
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 2616
    .restart local v0    # "logger":Lorg/slf4j/Logger;
    const-string v1, "Full compression mode was requested to be switched off in append mode but the original document has cross-reference stream, not cross-reference table. Falling back to cross-reference stream in appended document and switching full compression on"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    goto :goto_1

    .line 2614
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_1
    :goto_0
    nop

    .line 2618
    :goto_1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->isFullCompression:Ljava/lang/Boolean;

    .line 2619
    return-void
.end method

.method private processReadingError(Ljava/lang/String;)V
    .locals 2
    .param p1, "errorMessage"    # Ljava/lang/String;

    .line 2601
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;->CONSERVATIVE:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfReader;->getStrictnessLevel()Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;->isStricter(Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2602
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 2603
    .local v0, "logger":Lorg/slf4j/Logger;
    invoke-interface {v0, p1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 2604
    .end local v0    # "logger":Lorg/slf4j/Logger;
    nop

    .line 2607
    return-void

    .line 2605
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readDocumentIds()V
    .locals 3

    .line 2586
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 2588
    .local v0, "id":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v0, :cond_2

    .line 2589
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 2590
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsString(I)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->originalDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 2591
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsString(I)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 2594
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->originalDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    if-nez v1, :cond_2

    .line 2595
    :cond_1
    const-string v1, "The document original and/or modified id is corrupted"

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->processReadingError(Ljava/lang/String;)V

    .line 2598
    :cond_2
    return-void
.end method

.method private removeUnusedWidgetsFromFields(Lcom/itextpdf/kernel/pdf/PdfPage;)V
    .locals 7
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 2444
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->isFlushed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2445
    return-void

    .line 2448
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AcroForm:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 2449
    .local v0, "acroForm":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v0, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Fields:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    .line 2451
    .local v1, "fields":Lcom/itextpdf/kernel/pdf/PdfArray;
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getAnnotations()Ljava/util/List;

    move-result-object v2

    .line 2452
    .local v2, "annots":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 2453
    .local v4, "annot":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v5

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Widget:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 2454
    move-object v5, v4

    check-cast v5, Lcom/itextpdf/kernel/pdf/annot/PdfWidgetAnnotation;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/annot/PdfWidgetAnnotation;->releaseFormFieldFromWidgetAnnotation()V

    .line 2455
    if-eqz v1, :cond_2

    .line 2456
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->remove(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 2459
    .end local v4    # "annot":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    :cond_2
    goto :goto_1

    .line 2460
    :cond_3
    return-void
.end method

.method private resolveDestinations(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/Map;)V
    .locals 5
    .param p1, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;)V"
        }
    .end annotation

    .line 2463
    .local p2, "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pendingDestinationMutations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 2464
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pendingDestinationMutations:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDocument$DestinationMutationInfo;

    .line 2465
    .local v1, "mutation":Lcom/itextpdf/kernel/pdf/PdfDocument$DestinationMutationInfo;
    const/4 v2, 0x0

    .line 2466
    .local v2, "copiedDest":Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v3

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument$DestinationMutationInfo;->getOriginalDestination()Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {v3, v4, p2, p1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->copyDestination(Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/util/Map;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    move-result-object v2

    .line 2468
    if-nez v2, :cond_0

    .line 2469
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument$DestinationMutationInfo;->handleDestinationUnavailable()V

    goto :goto_1

    .line 2471
    :cond_0
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument$DestinationMutationInfo;->handleDestinationAvailable(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V

    .line 2463
    .end local v1    # "mutation":Lcom/itextpdf/kernel/pdf/PdfDocument$DestinationMutationInfo;
    .end local v2    # "copiedDest":Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2474
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method private tryFlushTagStructure(Z)V
    .locals 3
    .param p1, "isAppendMode"    # Z

    .line 2417
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    if-eqz v0, :cond_0

    .line 2418
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->prepareToDocumentClosing()V

    .line 2420
    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isModified()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2421
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->flush()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2426
    :cond_2
    nop

    .line 2427
    return-void

    .line 2423
    :catch_0
    move-exception v0

    .line 2424
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Tag structure flushing failed: it might be corrupted."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private updatePdfVersionFromCatalog()V
    .locals 2

    .line 2571
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Version:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2575
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Version:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/PdfVersion;->fromPdfName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v0

    .line 2576
    .local v0, "catalogVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v1

    if-lez v1, :cond_0

    .line 2577
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2581
    .end local v0    # "catalogVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    :cond_0
    goto :goto_0

    .line 2579
    :catch_0
    move-exception v0

    .line 2580
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const-string v1, "The document version specified in catalog is corrupted"

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->processReadingError(Ljava/lang/String;)V

    .line 2583
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_1
    :goto_0
    return-void
.end method

.method private updateValueInMarkInfoDict(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 3
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 2430
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->MarkInfo:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 2431
    .local v0, "markInfo":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v0, :cond_0

    .line 2432
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    move-object v0, v1

    .line 2433
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->MarkInfo:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 2435
    :cond_0
    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 2436
    return-void
.end method

.method private writerHasEncryption()Z
    .locals 1

    .line 2567
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/WriterProperties;->isStandardEncryptionUsed()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/WriterProperties;->isPublicKeyEncryptionUsed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method


# virtual methods
.method public addAssociatedFile(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)V
    .locals 3
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "fs"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    .line 1657
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AFRelationship:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1658
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 1659
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "For associated files their associated file specification dictionaries shall include the AFRelationship key."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1662
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 1663
    .local v0, "afArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_1

    .line 1664
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    invoke-virtual {v1, p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 1665
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 1667
    :cond_1
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1669
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->addFileAttachment(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)V

    .line 1670
    return-void
.end method

.method protected addCustomMetadataExtensions(Lcom/itextpdf/kernel/xmp/XMPMeta;)V
    .locals 0
    .param p1, "xmpMeta"    # Lcom/itextpdf/kernel/xmp/XMPMeta;

    .line 2237
    return-void
.end method

.method public addEventHandler(Ljava/lang/String;Lcom/itextpdf/kernel/events/IEventHandler;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "handler"    # Lcom/itextpdf/kernel/events/IEventHandler;

    .line 736
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->eventDispatcher:Lcom/itextpdf/kernel/events/EventDispatcher;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/events/EventDispatcher;->addEventHandler(Ljava/lang/String;Lcom/itextpdf/kernel/events/IEventHandler;)V

    .line 737
    return-void
.end method

.method public addFileAttachment(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "fs"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    .line 1637
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 1638
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->EmbeddedFiles:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->addNameToNameTree(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 1639
    return-void
.end method

.method public addFont(Lcom/itextpdf/kernel/font/PdfFont;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 2
    .param p1, "font"    # Lcom/itextpdf/kernel/font/PdfFont;

    .line 1892
    invoke-virtual {p1, p0}, Lcom/itextpdf/kernel/font/PdfFont;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 1894
    invoke-virtual {p1}, Lcom/itextpdf/kernel/font/PdfFont;->setForbidRelease()V

    .line 1895
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->documentFonts:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/font/PdfFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1896
    return-object p1
.end method

.method public addNamedDestination(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 2
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1521
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 1522
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isNumber()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1523
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    const-string v1, "When destination\'s not associated with a Remote or Embedded Go-To action, it shall specify page dictionary instead of page number. Otherwise destination might be considered invalid"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 1525
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->addNamedDestination(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1526
    return-void
.end method

.method public addNamedDestination(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1510
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->addNamedDestination(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1511
    return-void
.end method

.method public addNewPage()Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1

    .line 451
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDefaultPageSize()Lcom/itextpdf/kernel/geom/PageSize;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->addNewPage(Lcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    return-object v0
.end method

.method public addNewPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1
    .param p1, "index"    # I

    .line 480
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDefaultPageSize()Lcom/itextpdf/kernel/geom/PageSize;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->addNewPage(ILcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    return-object v0
.end method

.method public addNewPage(ILcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 3
    .param p1, "index"    # I
    .param p2, "pageSize"    # Lcom/itextpdf/kernel/geom/PageSize;

    .line 494
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 495
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPageFactory()Lcom/itextpdf/kernel/pdf/IPdfPageFactory;

    move-result-object v0

    invoke-interface {v0, p0, p2}, Lcom/itextpdf/kernel/pdf/IPdfPageFactory;->createPdfPage(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    .line 496
    .local v0, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkAndAddPage(ILcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 497
    new-instance v1, Lcom/itextpdf/kernel/events/PdfDocumentEvent;

    const-string v2, "StartPdfPage"

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/events/PdfDocumentEvent;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfPage;)V

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->dispatchEvent(Lcom/itextpdf/kernel/events/Event;)V

    .line 498
    new-instance v1, Lcom/itextpdf/kernel/events/PdfDocumentEvent;

    const-string v2, "InsertPdfPage"

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/events/PdfDocumentEvent;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfPage;)V

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->dispatchEvent(Lcom/itextpdf/kernel/events/Event;)V

    .line 499
    return-object v0
.end method

.method public addNewPage(Lcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 3
    .param p1, "pageSize"    # Lcom/itextpdf/kernel/geom/PageSize;

    .line 462
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 463
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPageFactory()Lcom/itextpdf/kernel/pdf/IPdfPageFactory;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lcom/itextpdf/kernel/pdf/IPdfPageFactory;->createPdfPage(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    .line 464
    .local v0, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkAndAddPage(Lcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 465
    new-instance v1, Lcom/itextpdf/kernel/events/PdfDocumentEvent;

    const-string v2, "StartPdfPage"

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/events/PdfDocumentEvent;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfPage;)V

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->dispatchEvent(Lcom/itextpdf/kernel/events/Event;)V

    .line 466
    new-instance v1, Lcom/itextpdf/kernel/events/PdfDocumentEvent;

    const-string v2, "InsertPdfPage"

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/events/PdfDocumentEvent;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfPage;)V

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->dispatchEvent(Lcom/itextpdf/kernel/events/Event;)V

    .line 467
    return-object v0
.end method

.method public addOutputIntent(Lcom/itextpdf/kernel/pdf/PdfOutputIntent;)V
    .locals 3
    .param p1, "outputIntent"    # Lcom/itextpdf/kernel/pdf/PdfOutputIntent;

    .line 1564
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 1565
    if-nez p1, :cond_0

    .line 1566
    return-void

    .line 1569
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OutputIntents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 1570
    .local v0, "outputIntents":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_1

    .line 1571
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v0, v1

    .line 1572
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->OutputIntents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 1574
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1575
    return-void
.end method

.method public addPage(ILcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 2
    .param p1, "index"    # I
    .param p2, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 529
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 530
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkAndAddPage(ILcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 531
    new-instance v0, Lcom/itextpdf/kernel/events/PdfDocumentEvent;

    const-string v1, "InsertPdfPage"

    invoke-direct {v0, v1, p2}, Lcom/itextpdf/kernel/events/PdfDocumentEvent;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfPage;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->dispatchEvent(Lcom/itextpdf/kernel/events/Event;)V

    .line 532
    return-object p2
.end method

.method public addPage(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 2
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 512
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 513
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkAndAddPage(Lcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 514
    new-instance v0, Lcom/itextpdf/kernel/events/PdfDocumentEvent;

    const-string v1, "InsertPdfPage"

    invoke-direct {v0, v1, p1}, Lcom/itextpdf/kernel/events/PdfDocumentEvent;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfPage;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->dispatchEvent(Lcom/itextpdf/kernel/events/Event;)V

    .line 515
    return-object p1
.end method

.method protected checkAndAddPage(ILcom/itextpdf/kernel/pdf/PdfPage;)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 2328
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfPage;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2331
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    if-ne p0, v0, :cond_0

    goto :goto_0

    .line 2332
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The passed page belongs to document {0} (page {1} of the document) and therefore cannot be added to this document ({2})."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .line 2335
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPageNumber(Lcom/itextpdf/kernel/pdf/PdfPage;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2, p0}, [Ljava/lang/Object;

    move-result-object v1

    .line 2334
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v0

    throw v0

    .line 2337
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->addPage(ILcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 2338
    return-void

    .line 2329
    :cond_2
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Flushed page cannot be added or inserted."

    invoke-direct {v0, v1, p2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method protected checkAndAddPage(Lcom/itextpdf/kernel/pdf/PdfPage;)V
    .locals 3
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 2346
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2349
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    if-ne p0, v0, :cond_0

    goto :goto_0

    .line 2350
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The passed page belongs to document {0} (page {1} of the document) and therefore cannot be added to this document ({2})."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .line 2353
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPageNumber(Lcom/itextpdf/kernel/pdf/PdfPage;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2, p0}, [Ljava/lang/Object;

    move-result-object v1

    .line 2352
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v0

    throw v0

    .line 2355
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->addPage(Lcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 2356
    return-void

    .line 2347
    :cond_2
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Flushed page cannot be added or inserted."

    invoke-direct {v0, v1, p1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method protected checkClosingStatus()V
    .locals 2

    .line 2362
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closed:Z

    if-nez v0, :cond_0

    .line 2365
    return-void

    .line 2363
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Document was closed. It is impossible to execute action."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected checkIsoConformance()V
    .locals 3

    .line 1998
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDiContainer()Lcom/itextpdf/commons/utils/DIContainer;

    move-result-object v0

    const-class v1, Lcom/itextpdf/kernel/utils/ValidationContainer;

    invoke-virtual {v0, v1}, Lcom/itextpdf/commons/utils/DIContainer;->isRegistered(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1999
    return-void

    .line 2001
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDiContainer()Lcom/itextpdf/commons/utils/DIContainer;

    move-result-object v0

    const-class v1, Lcom/itextpdf/kernel/utils/ValidationContainer;

    invoke-virtual {v0, v1}, Lcom/itextpdf/commons/utils/DIContainer;->getInstance(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/utils/ValidationContainer;

    .line 2002
    .local v0, "container":Lcom/itextpdf/kernel/utils/ValidationContainer;
    if-nez v0, :cond_1

    .line 2003
    return-void

    .line 2005
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/utils/ValidationContext;

    invoke-direct {v1}, Lcom/itextpdf/kernel/utils/ValidationContext;-><init>()V

    .line 2006
    invoke-virtual {v1, p0}, Lcom/itextpdf/kernel/utils/ValidationContext;->withPdfDocument(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/utils/ValidationContext;

    move-result-object v1

    .line 2007
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentFonts()Ljava/util/Collection;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/utils/ValidationContext;->withFonts(Ljava/util/Collection;)Lcom/itextpdf/kernel/utils/ValidationContext;

    move-result-object v1

    .line 2008
    .local v1, "context":Lcom/itextpdf/kernel/utils/ValidationContext;
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/utils/ValidationContainer;->validate(Lcom/itextpdf/kernel/utils/ValidationContext;)V

    .line 2009
    return-void
.end method

.method public checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;)V
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "key"    # Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 1584
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 1585
    return-void
.end method

.method public checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 6
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "key"    # Lcom/itextpdf/kernel/pdf/IsoKey;
    .param p3, "resources"    # Lcom/itextpdf/kernel/pdf/PdfResources;
    .param p4, "contentStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 1596
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .end local p1    # "obj":Ljava/lang/Object;
    .end local p2    # "key":Lcom/itextpdf/kernel/pdf/IsoKey;
    .end local p3    # "resources":Lcom/itextpdf/kernel/pdf/PdfResources;
    .end local p4    # "contentStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .local v1, "obj":Ljava/lang/Object;
    .local v2, "key":Lcom/itextpdf/kernel/pdf/IsoKey;
    .local v3, "resources":Lcom/itextpdf/kernel/pdf/PdfResources;
    .local v4, "contentStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;Ljava/lang/Object;)V

    .line 1597
    return-void
.end method

.method public checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;Ljava/lang/Object;)V
    .locals 7
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "key"    # Lcom/itextpdf/kernel/pdf/IsoKey;
    .param p3, "resources"    # Lcom/itextpdf/kernel/pdf/PdfResources;
    .param p4, "contentStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p5, "extra"    # Ljava/lang/Object;

    .line 1610
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDiContainer()Lcom/itextpdf/commons/utils/DIContainer;

    move-result-object v0

    const-class v1, Lcom/itextpdf/kernel/utils/ValidationContainer;

    invoke-virtual {v0, v1}, Lcom/itextpdf/commons/utils/DIContainer;->isRegistered(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1611
    return-void

    .line 1613
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDiContainer()Lcom/itextpdf/commons/utils/DIContainer;

    move-result-object v0

    const-class v1, Lcom/itextpdf/kernel/utils/ValidationContainer;

    invoke-virtual {v0, v1}, Lcom/itextpdf/commons/utils/DIContainer;->getInstance(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/utils/ValidationContainer;

    .line 1614
    .local v1, "container":Lcom/itextpdf/kernel/utils/ValidationContainer;
    if-nez v1, :cond_1

    .line 1615
    return-void

    .line 1617
    :cond_1
    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    .end local p1    # "obj":Ljava/lang/Object;
    .end local p2    # "key":Lcom/itextpdf/kernel/pdf/IsoKey;
    .end local p3    # "resources":Lcom/itextpdf/kernel/pdf/PdfResources;
    .end local p4    # "contentStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local p5    # "extra":Ljava/lang/Object;
    .local v2, "obj":Ljava/lang/Object;
    .local v3, "key":Lcom/itextpdf/kernel/pdf/IsoKey;
    .local v4, "resources":Lcom/itextpdf/kernel/pdf/PdfResources;
    .local v5, "contentStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .local v6, "extra":Ljava/lang/Object;
    invoke-virtual/range {v1 .. v6}, Lcom/itextpdf/kernel/utils/ValidationContainer;->validate(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;Ljava/lang/Object;)V

    .line 1618
    return-void
.end method

.method public checkShowTextIsoConformance(Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;Lcom/itextpdf/kernel/pdf/PdfResources;)V
    .locals 0
    .param p1, "gState"    # Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;
    .param p2, "resources"    # Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 1628
    return-void
.end method

.method public close()V
    .locals 13

    .line 843
    const-string v0, "PdfReader closing failed due to the error occurred!"

    const-string v1, "PdfWriter closing failed due to the error occurred!"

    const-class v2, Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-boolean v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closed:Z

    if-eqz v3, :cond_0

    .line 844
    return-void

    .line 846
    :cond_0
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->isClosing:Z

    .line 848
    :try_start_0
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    if-eqz v4, :cond_1f

    .line 849
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->isFlushed()Z

    move-result v4

    if-nez v4, :cond_1e

    .line 854
    invoke-static {}, Lcom/itextpdf/commons/actions/EventManager;->getInstance()Lcom/itextpdf/commons/actions/EventManager;

    move-result-object v4

    .line 855
    .local v4, "manager":Lcom/itextpdf/commons/actions/EventManager;
    new-instance v5, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsEvent;

    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->getNumberOfPages()I

    move-result v6

    .line 856
    invoke-static {}, Lcom/itextpdf/kernel/actions/data/ITextCoreProductData;->getInstance()Lcom/itextpdf/commons/actions/data/ProductData;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsEvent;-><init>(ILcom/itextpdf/commons/actions/data/ProductData;)V

    .line 855
    invoke-virtual {v4, v5}, Lcom/itextpdf/commons/actions/EventManager;->onEvent(Lcom/itextpdf/commons/actions/IEvent;)V

    .line 858
    new-instance v5, Lcom/itextpdf/kernel/actions/events/FlushPdfDocumentEvent;

    invoke-direct {v5, p0}, Lcom/itextpdf/kernel/actions/events/FlushPdfDocumentEvent;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    invoke-virtual {v4, v5}, Lcom/itextpdf/commons/actions/EventManager;->onEvent(Lcom/itextpdf/commons/actions/IEvent;)V

    .line 860
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->updateXmpMetadata()V

    .line 862
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v5

    const/4 v6, 0x0

    if-ltz v5, :cond_1

    .line 863
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->PDF20_DEPRECATED_KEYS:[Lcom/itextpdf/kernel/pdf/PdfName;

    array-length v7, v5

    move v8, v6

    :goto_0
    if-ge v8, v7, :cond_1

    aget-object v9, v5, v8

    .line 864
    .local v9, "deprecatedKey":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentInfo()Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v10

    invoke-virtual {v10, v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 863
    nop

    .end local v9    # "deprecatedKey":Lcom/itextpdf/kernel/pdf/PdfName;
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 867
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXmpMetadata()[B

    move-result-object v5

    if-eqz v5, :cond_3

    .line 868
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->Metadata:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v5

    .line 869
    .local v5, "xmp":Lcom/itextpdf/kernel/pdf/PdfStream;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isAppendMode()Z

    move-result v7

    if-eqz v7, :cond_2

    if-eqz v5, :cond_2

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfStream;->isFlushed()Z

    move-result v7

    if-nez v7, :cond_2

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 871
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xmpMetadata:[B

    invoke-virtual {v5, v7}, Lcom/itextpdf/kernel/pdf/PdfStream;->setData([B)V

    .line 872
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfStream;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_1

    .line 875
    :cond_2
    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v7}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>()V

    invoke-virtual {v7, p0}, Lcom/itextpdf/kernel/pdf/PdfStream;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfStream;

    move-object v5, v7

    .line 876
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v7

    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xmpMetadata:[B

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write([B)V

    .line 877
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Metadata:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v8, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 878
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 880
    :goto_1
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Metadata:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v7, v8}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 881
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->XML:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v7, v8}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 882
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v7, v7, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v7, v7, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->isMetadataEncrypted()Z

    move-result v7

    if-nez v7, :cond_3

    .line 883
    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v7}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 884
    .local v7, "ar":Lcom/itextpdf/kernel/pdf/PdfArray;
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Crypt:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 885
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v8, v7}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 889
    .end local v5    # "xmp":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v7    # "ar":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_3
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v5, v5, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    if-nez v5, :cond_4

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->isOCPropertiesMayHaveChanged()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 890
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->OCProperties:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v8, v6}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getOCProperties(Z)Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 893
    :cond_4
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance()V

    .line 895
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v5

    if-nez v5, :cond_5

    .line 898
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->addNewPage()Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 901
    :cond_5
    const/4 v5, 0x0

    .line 902
    .local v5, "crypto":Lcom/itextpdf/kernel/pdf/PdfObject;
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 903
    .local v7, "forbiddenToFlush":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v8, v8, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    if-eqz v8, :cond_11

    .line 904
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    if-eqz v8, :cond_6

    .line 905
    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->tryFlushTagStructure(Z)V

    .line 907
    :cond_6
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->isOCPropertiesMayHaveChanged()Z

    move-result v8

    if-eqz v8, :cond_7

    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v8, v6}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getOCProperties(Z)Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 908
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isModified()Z

    move-result v8

    if-eqz v8, :cond_7

    .line 909
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v8, v6}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getOCProperties(Z)Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->flush()V

    .line 911
    :cond_7
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    iget-object v8, v8, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pageLabels:Lcom/itextpdf/kernel/pdf/PdfNumTree;

    if-eqz v8, :cond_8

    .line 912
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->PageLabels:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    iget-object v10, v10, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pageLabels:Lcom/itextpdf/kernel/pdf/PdfNumTree;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfNumTree;->buildTree()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 915
    :cond_8
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    iget-object v8, v8, Lcom/itextpdf/kernel/pdf/PdfCatalog;->nameTrees:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_a

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 916
    .local v9, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfNameTree;>;"
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/pdf/PdfNameTree;

    .line 917
    .local v10, "tree":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->isModified()Z

    move-result v11

    if-eqz v11, :cond_9

    .line 918
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->buildTree()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v11

    invoke-virtual {v11, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v11

    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v11, v12}, Lcom/itextpdf/kernel/pdf/PdfDocument;->ensureTreeRootAddedToNames(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 920
    .end local v9    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfNameTree;>;"
    .end local v10    # "tree":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    :cond_9
    goto :goto_2

    .line 922
    :cond_a
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->generateTree()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    .line 923
    .local v8, "pageRoot":Lcom/itextpdf/kernel/pdf/PdfObject;
    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v9, v9, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    invoke-virtual {p0, v9}, Lcom/itextpdf/kernel/pdf/PdfDocument;->flushInfoDictionary(Z)V

    .line 924
    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isModified()Z

    move-result v9

    if-nez v9, :cond_b

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfObject;->isModified()Z

    move-result v9

    if-eqz v9, :cond_c

    .line 925
    :cond_b
    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfName;->Pages:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v9, v10, v8}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 926
    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v9, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->flush(Z)V

    .line 928
    :cond_c
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->flushFonts()V

    .line 930
    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v9, v9, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    if-eqz v9, :cond_e

    .line 931
    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v9, v9, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v9

    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v10, v10, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    .line 932
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v10

    if-ne v9, v10, :cond_d

    .line 933
    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v9, v9, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v9

    move-object v5, v9

    .line 934
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v9

    if-eqz v9, :cond_e

    .line 936
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v9

    invoke-interface {v7, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 931
    :cond_d
    new-instance v3, Ljava/lang/AssertionError;

    const-string v6, "Conflict with source encryption"

    invoke-direct {v3, v6}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 940
    :cond_e
    :goto_3
    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    invoke-virtual {v9, v7}, Lcom/itextpdf/kernel/pdf/PdfWriter;->flushModifiedWaitingObjects(Ljava/util/Set;)V

    .line 941
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_4
    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->size()I

    move-result v10

    if-ge v9, v10, :cond_10

    .line 942
    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    invoke-virtual {v10, v9}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v10

    .line 943
    .local v10, "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v10, :cond_f

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v11

    if-nez v11, :cond_f

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v11

    if-eqz v11, :cond_f

    .line 944
    invoke-virtual {v10, v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v11

    if-nez v11, :cond_f

    .line 945
    invoke-interface {v7, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_f

    .line 946
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setFree()V

    .line 941
    .end local v10    # "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_f
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    .line 949
    .end local v8    # "pageRoot":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v9    # "i":I
    :cond_10
    goto/16 :goto_9

    .line 950
    :cond_11
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->isOCPropertiesMayHaveChanged()Z

    move-result v8

    if-eqz v8, :cond_12

    .line 951
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v8, v6}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getOCProperties(Z)Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->flush()V

    .line 953
    :cond_12
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    iget-object v8, v8, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pageLabels:Lcom/itextpdf/kernel/pdf/PdfNumTree;

    if-eqz v8, :cond_13

    .line 954
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->PageLabels:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    iget-object v10, v10, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pageLabels:Lcom/itextpdf/kernel/pdf/PdfNumTree;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfNumTree;->buildTree()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 957
    :cond_13
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->Pages:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->generateTree()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 959
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    iget-object v8, v8, Lcom/itextpdf/kernel/pdf/PdfCatalog;->nameTrees:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_5
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_15

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 960
    .local v9, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfNameTree;>;"
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/pdf/PdfNameTree;

    .line 961
    .local v10, "tree":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->isModified()Z

    move-result v11

    if-eqz v11, :cond_14

    .line 962
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->buildTree()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v11

    invoke-virtual {v11, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v11

    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v11, v12}, Lcom/itextpdf/kernel/pdf/PdfDocument;->ensureTreeRootAddedToNames(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 964
    .end local v9    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfNameTree;>;"
    .end local v10    # "tree":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    :cond_14
    goto :goto_5

    .line 966
    :cond_15
    const/4 v8, 0x1

    .local v8, "pageNum":I
    :goto_6
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v9

    if-gt v8, v9, :cond_17

    .line 967
    invoke-virtual {p0, v8}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v9

    .line 968
    .local v9, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    if-eqz v9, :cond_16

    .line 969
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfPage;->flush()V

    .line 966
    .end local v9    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    :cond_16
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 972
    .end local v8    # "pageNum":I
    :cond_17
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    if-eqz v8, :cond_18

    .line 973
    invoke-direct {p0, v6}, Lcom/itextpdf/kernel/pdf/PdfDocument;->tryFlushTagStructure(Z)V

    .line 975
    :cond_18
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v8, v8, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    invoke-virtual {p0, v8}, Lcom/itextpdf/kernel/pdf/PdfDocument;->flushInfoDictionary(Z)V

    .line 976
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v8, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->flush(Z)V

    .line 977
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->flushFonts()V

    .line 979
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v8, v8, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    if-eqz v8, :cond_19

    .line 980
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v8, v8, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    move-object v5, v8

    .line 981
    invoke-virtual {v5, p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 982
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 985
    :cond_19
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    invoke-virtual {v8, v7}, Lcom/itextpdf/kernel/pdf/PdfWriter;->flushWaitingObjects(Ljava/util/Set;)V

    .line 986
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_7
    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->size()I

    move-result v9

    if-ge v8, v9, :cond_1c

    .line 987
    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    invoke-virtual {v9, v8}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v9

    .line 988
    .local v9, "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v9, :cond_1b

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v10

    if-nez v10, :cond_1b

    invoke-virtual {v9, v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v10

    if-nez v10, :cond_1b

    .line 989
    invoke-interface {v7, v9}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_1b

    .line 991
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isFlushUnusedObjects()Z

    move-result v10

    if-eqz v10, :cond_1a

    const/16 v10, 0x10

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v10

    if-nez v10, :cond_1a

    .line 993
    invoke-virtual {v9, v6}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v10

    move-object v11, v10

    .local v11, "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v10, :cond_1a

    .line 994
    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/PdfObject;->flush()V

    goto :goto_8

    .line 996
    .end local v11    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1a
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setFree()V

    .line 986
    .end local v9    # "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_1b
    :goto_8
    add-int/lit8 v8, v8, 0x1

    goto :goto_7

    .line 1004
    .end local v8    # "i":I
    :cond_1c
    :goto_9
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    const/4 v9, 0x0

    iput-object v9, v8, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    .line 1005
    sget-object v8, Lcom/itextpdf/kernel/pdf/IsoKey;->CRYPTO:Lcom/itextpdf/kernel/pdf/IsoKey;

    invoke-virtual {p0, v5, v8}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;)V

    .line 1007
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v8, v8, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    if-nez v8, :cond_1d

    if-eqz v5, :cond_1d

    .line 1009
    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfObject;->flush(Z)V

    .line 1015
    :cond_1d
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Root:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1020
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->originalDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v6

    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 1021
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v8

    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v9, v9, Lcom/itextpdf/kernel/pdf/StampingProperties;->preserveEncryption:Z

    .line 1020
    invoke-static {v6, v8, v9}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->createInfoId([B[BZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    .line 1022
    .local v6, "fileId":Lcom/itextpdf/kernel/pdf/PdfObject;
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    invoke-virtual {v8, p0, v6, v5}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->writeXrefTableAndTrailer(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1023
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfWriter;->flush()V

    .line 1024
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfWriter;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v8

    instance-of v8, v8, Lcom/itextpdf/kernel/pdf/CountOutputStream;

    if-eqz v8, :cond_1f

    .line 1025
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfWriter;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/CountOutputStream;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/CountOutputStream;->getAmountOfWrittenBytes()J

    move-result-wide v8

    .line 1026
    .local v8, "amountOfBytes":J
    new-instance v10, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsEvent;

    invoke-static {}, Lcom/itextpdf/kernel/actions/data/ITextCoreProductData;->getInstance()Lcom/itextpdf/commons/actions/data/ProductData;

    move-result-object v11

    invoke-direct {v10, v8, v9, v11}, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsEvent;-><init>(JLcom/itextpdf/commons/actions/data/ProductData;)V

    invoke-virtual {v4, v10}, Lcom/itextpdf/commons/actions/EventManager;->onEvent(Lcom/itextpdf/commons/actions/IEvent;)V

    goto :goto_a

    .line 850
    .end local v4    # "manager":Lcom/itextpdf/commons/actions/EventManager;
    .end local v5    # "crypto":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v6    # "fileId":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v7    # "forbiddenToFlush":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .end local v8    # "amountOfBytes":J
    :cond_1e
    new-instance v3, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v4, "Cannot close document with already flushed PDF Catalog."

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1029
    :cond_1f
    :goto_a
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->clearPageRefs()V

    .line 1030
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->removeAllHandlers()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1034
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    if-eqz v4, :cond_20

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isCloseWriter()Z

    move-result v4

    if-eqz v4, :cond_20

    .line 1036
    :try_start_1
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfWriter;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1040
    goto :goto_b

    .line 1037
    :catch_0
    move-exception v4

    .line 1038
    .local v4, "e":Ljava/lang/Exception;
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 1039
    .local v5, "logger":Lorg/slf4j/Logger;
    invoke-interface {v5, v1, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1043
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v5    # "logger":Lorg/slf4j/Logger;
    :cond_20
    :goto_b
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    if-eqz v1, :cond_21

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isCloseReader()Z

    move-result v1

    if-eqz v1, :cond_21

    .line 1045
    :try_start_2
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_c

    .line 1046
    :catch_1
    move-exception v1

    .line 1047
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 1048
    .local v2, "logger":Lorg/slf4j/Logger;
    invoke-interface {v2, v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1049
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :goto_c
    nop

    .line 1053
    :cond_21
    iput-boolean v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closed:Z

    .line 1054
    return-void

    .line 1034
    :catchall_0
    move-exception v3

    goto :goto_d

    .line 1031
    :catch_2
    move-exception v3

    .line 1032
    .local v3, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v4, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v5, "Cannot close document."

    invoke-direct {v4, v5, v3, p0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/Object;)V

    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1034
    .end local v3    # "e":Ljava/io/IOException;
    :goto_d
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    if-eqz v4, :cond_22

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isCloseWriter()Z

    move-result v4

    if-eqz v4, :cond_22

    .line 1036
    :try_start_4
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfWriter;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 1040
    goto :goto_e

    .line 1037
    :catch_3
    move-exception v4

    .line 1038
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 1039
    .restart local v5    # "logger":Lorg/slf4j/Logger;
    invoke-interface {v5, v1, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1043
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v5    # "logger":Lorg/slf4j/Logger;
    :cond_22
    :goto_e
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    if-eqz v1, :cond_23

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isCloseReader()Z

    move-result v1

    if-eqz v1, :cond_23

    .line 1045
    :try_start_5
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    .line 1049
    goto :goto_f

    .line 1046
    :catch_4
    move-exception v1

    .line 1047
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 1048
    .restart local v2    # "logger":Lorg/slf4j/Logger;
    invoke-interface {v2, v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1052
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_23
    :goto_f
    throw v3
.end method

.method public copyPagesTo(IILcom/itextpdf/kernel/pdf/PdfDocument;)Ljava/util/List;
    .locals 1
    .param p1, "pageFrom"    # I
    .param p2, "pageTo"    # I
    .param p3, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;"
        }
    .end annotation

    .line 1216
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->copyPagesTo(IILcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public copyPagesTo(IILcom/itextpdf/kernel/pdf/PdfDocument;I)Ljava/util/List;
    .locals 6
    .param p1, "pageFrom"    # I
    .param p2, "pageTo"    # I
    .param p3, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p4, "insertBeforePage"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;"
        }
    .end annotation

    .line 1153
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    .end local p1    # "pageFrom":I
    .end local p2    # "pageTo":I
    .end local p3    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p4    # "insertBeforePage":I
    .local v1, "pageFrom":I
    .local v2, "pageTo":I
    .local v3, "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v4, "insertBeforePage":I
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->copyPagesTo(IILcom/itextpdf/kernel/pdf/PdfDocument;ILcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public copyPagesTo(IILcom/itextpdf/kernel/pdf/PdfDocument;ILcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Ljava/util/List;
    .locals 3
    .param p1, "pageFrom"    # I
    .param p2, "pageTo"    # I
    .param p3, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p4, "insertBeforePage"    # I
    .param p5, "copier"    # Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "I",
            "Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;"
        }
    .end annotation

    .line 1190
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1191
    .local v0, "pages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move v1, p1

    .local v1, "i":I
    :goto_0
    if-gt v1, p2, :cond_0

    .line 1192
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1191
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1194
    .end local v1    # "i":I
    :cond_0
    invoke-virtual {p0, v0, p3, p4, p5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->copyPagesTo(Ljava/util/List;Lcom/itextpdf/kernel/pdf/PdfDocument;ILcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public copyPagesTo(IILcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Ljava/util/List;
    .locals 7
    .param p1, "pageFrom"    # I
    .param p2, "pageTo"    # I
    .param p3, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p4, "copier"    # Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;"
        }
    .end annotation

    .line 1241
    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v0

    add-int/lit8 v5, v0, 0x1

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move-object v6, p4

    .end local p1    # "pageFrom":I
    .end local p2    # "pageTo":I
    .end local p3    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p4    # "copier":Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;
    .local v2, "pageFrom":I
    .local v3, "pageTo":I
    .local v4, "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v6, "copier":Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;
    invoke-virtual/range {v1 .. v6}, Lcom/itextpdf/kernel/pdf/PdfDocument;->copyPagesTo(IILcom/itextpdf/kernel/pdf/PdfDocument;ILcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public copyPagesTo(Ljava/util/List;Lcom/itextpdf/kernel/pdf/PdfDocument;)Ljava/util/List;
    .locals 1
    .param p2, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;"
        }
    .end annotation

    .line 1381
    .local p1, "pagesToCopy":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->copyPagesTo(Ljava/util/List;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public copyPagesTo(Ljava/util/List;Lcom/itextpdf/kernel/pdf/PdfDocument;I)Ljava/util/List;
    .locals 1
    .param p2, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "insertBeforePage"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;"
        }
    .end annotation

    .line 1261
    .local p1, "pagesToCopy":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->copyPagesTo(Ljava/util/List;Lcom/itextpdf/kernel/pdf/PdfDocument;ILcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public copyPagesTo(Ljava/util/List;Lcom/itextpdf/kernel/pdf/PdfDocument;ILcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Ljava/util/List;
    .locals 20
    .param p2, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "insertBeforePage"    # I
    .param p4, "copier"    # Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "I",
            "Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;"
        }
    .end annotation

    .line 1285
    .local p1, "pagesToCopy":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1286
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 1288
    :cond_0
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/PdfDocument;->pendingDestinationMutations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1289
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 1290
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v4, v0

    .line 1291
    .local v4, "copiedPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    move-object v5, v0

    .line 1292
    .local v5, "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    move-object v6, v0

    .line 1294
    .local v6, "outlinesToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v7, v0

    .line 1295
    .local v7, "rangesOfPagesWithIncreasingNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;>;"
    const/4 v0, 0x0

    move-object/from16 v8, p1

    invoke-interface {v8, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 1297
    .local v9, "lastCopiedPageNum":I
    move/from16 v10, p3

    .line 1298
    .local v10, "pageInsertIndex":I
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v11

    const/4 v12, 0x1

    add-int/2addr v11, v12

    move/from16 v13, p3

    if-ge v13, v11, :cond_1

    move v11, v12

    goto :goto_0

    :cond_1
    move v11, v0

    .line 1300
    .local v11, "insertInBetween":Z
    :goto_0
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_1
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_6

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Integer;

    .line 1301
    .local v15, "pageNum":Ljava/lang/Integer;
    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    .line 1302
    .local v0, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    if-eqz v11, :cond_2

    move v8, v10

    goto :goto_2

    :cond_2
    const/16 v17, -0x1

    move/from16 v8, v17

    :goto_2
    invoke-virtual {v0, v2, v3, v12, v8}, Lcom/itextpdf/kernel/pdf/PdfPage;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;ZI)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v8

    .line 1304
    .local v8, "newPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1305
    invoke-interface {v5, v0, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1307
    move/from16 v17, v12

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v12

    if-lt v9, v12, :cond_3

    .line 1308
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v7, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1310
    :cond_3
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    .line 1311
    .local v12, "lastRangeInd":I
    invoke-interface {v7, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v19, v4

    .end local v4    # "copiedPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .local v19, "copiedPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    move-object/from16 v4, v18

    check-cast v4, Ljava/util/Map;

    invoke-interface {v4, v0, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1313
    add-int/lit8 v10, v10, 0x1

    .line 1314
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->hasOutlines()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1315
    move-object/from16 v16, v7

    const/4 v4, 0x0

    .end local v7    # "rangesOfPagesWithIncreasingNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;>;"
    .local v16, "rangesOfPagesWithIncreasingNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;>;"
    invoke-virtual {v0, v4}, Lcom/itextpdf/kernel/pdf/PdfPage;->getOutlines(Z)Ljava/util/List;

    move-result-object v7

    .line 1316
    .local v7, "pageOutlines":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    if-eqz v7, :cond_5

    .line 1317
    invoke-interface {v6, v7}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_3

    .line 1314
    .end local v16    # "rangesOfPagesWithIncreasingNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;>;"
    .local v7, "rangesOfPagesWithIncreasingNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;>;"
    :cond_4
    move-object/from16 v16, v7

    const/4 v4, 0x0

    .line 1320
    .end local v7    # "rangesOfPagesWithIncreasingNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;>;"
    .restart local v16    # "rangesOfPagesWithIncreasingNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;>;"
    :cond_5
    :goto_3
    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 1321
    .end local v0    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local v8    # "newPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local v12    # "lastRangeInd":I
    .end local v15    # "pageNum":Ljava/lang/Integer;
    move-object/from16 v8, p1

    move v0, v4

    move-object/from16 v7, v16

    move/from16 v12, v17

    move-object/from16 v4, v19

    goto :goto_1

    .line 1323
    .end local v16    # "rangesOfPagesWithIncreasingNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;>;"
    .end local v19    # "copiedPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .restart local v4    # "copiedPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .restart local v7    # "rangesOfPagesWithIncreasingNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;>;"
    :cond_6
    move-object/from16 v19, v4

    move-object/from16 v16, v7

    move/from16 v17, v12

    .end local v4    # "copiedPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .end local v7    # "rangesOfPagesWithIncreasingNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;>;"
    .restart local v16    # "rangesOfPagesWithIncreasingNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;>;"
    .restart local v19    # "copiedPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    invoke-direct {v1, v2, v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->resolveDestinations(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/Map;)V

    .line 1326
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->OCProperties:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 1327
    invoke-static {v1, v2, v5}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->copyOCGProperties(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/Map;)V

    .line 1328
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    move/from16 v4, v17

    invoke-virtual {v0, v4}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->setOcgCopied(Z)V

    .line 1333
    :cond_7
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 1334
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1336
    :try_start_0
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .end local p3    # "insertBeforePage":I
    .local v13, "insertBeforePage":I
    :goto_4
    :try_start_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    .line 1337
    .local v4, "increasingPagesRange":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    if-eqz v11, :cond_8

    .line 1338
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v7

    invoke-virtual {v7, v2, v13, v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;ILjava/util/Map;)V

    goto :goto_5

    .line 1340
    :cond_8
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v7

    invoke-virtual {v7, v2, v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/Map;)V

    .line 1342
    :goto_5
    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v7

    add-int/2addr v13, v7

    .line 1343
    .end local v4    # "increasingPagesRange":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    goto :goto_4

    .line 1344
    :cond_9
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->normalizeDocumentRootTag()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1350
    nop

    .line 1351
    instance-of v0, v3, Lcom/itextpdf/kernel/pdf/IPdfPageFormCopier;

    if-eqz v0, :cond_b

    .line 1352
    move-object v0, v3

    check-cast v0, Lcom/itextpdf/kernel/pdf/IPdfPageFormCopier;

    invoke-interface {v0, v2}, Lcom/itextpdf/kernel/pdf/IPdfPageFormCopier;->recreateAcroformToProcessCopiedFields(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    goto :goto_7

    .line 1345
    :catch_0
    move-exception v0

    goto :goto_6

    .end local v13    # "insertBeforePage":I
    .restart local p3    # "insertBeforePage":I
    :catch_1
    move-exception v0

    .line 1346
    .end local p3    # "insertBeforePage":I
    .local v0, "ex":Ljava/lang/Exception;
    .restart local v13    # "insertBeforePage":I
    :goto_6
    new-instance v4, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v7, "Tag structure copying failed: it might be corrupted in one of the documents."

    invoke-direct {v4, v7, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 1355
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v13    # "insertBeforePage":I
    .restart local p3    # "insertBeforePage":I
    :cond_a
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 1356
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v4, "Not tagged pages are copied to the tagged document. Destination document now may contain not tagged content."

    invoke-interface {v0, v4}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 1359
    .end local v0    # "logger":Lorg/slf4j/Logger;
    .end local p3    # "insertBeforePage":I
    .restart local v13    # "insertBeforePage":I
    :cond_b
    :goto_7
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->isOutlineMode()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 1360
    invoke-direct {v1, v6, v2, v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->copyOutlines(Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/Map;)V

    .line 1362
    :cond_c
    return-object v19
.end method

.method public copyPagesTo(Ljava/util/List;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Ljava/util/List;
    .locals 1
    .param p2, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "copier"    # Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;"
        }
    .end annotation

    .line 1403
    .local p1, "pagesToCopy":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->copyPagesTo(Ljava/util/List;Lcom/itextpdf/kernel/pdf/PdfDocument;ILcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public createNextIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .locals 1

    .line 815
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 816
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->createNextIndirectReference(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    return-object v0
.end method

.method public dispatchEvent(Lcom/itextpdf/kernel/events/Event;)V
    .locals 1
    .param p1, "event"    # Lcom/itextpdf/kernel/events/Event;

    .line 744
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->eventDispatcher:Lcom/itextpdf/kernel/events/EventDispatcher;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/events/EventDispatcher;->dispatchEvent(Lcom/itextpdf/kernel/events/Event;)V

    .line 745
    return-void
.end method

.method public dispatchEvent(Lcom/itextpdf/kernel/events/Event;Z)V
    .locals 1
    .param p1, "event"    # Lcom/itextpdf/kernel/events/Event;
    .param p2, "delayed"    # Z

    .line 752
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->eventDispatcher:Lcom/itextpdf/kernel/events/EventDispatcher;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/events/EventDispatcher;->dispatchEvent(Lcom/itextpdf/kernel/events/Event;Z)V

    .line 753
    return-void
.end method

.method doesStreamBelongToEmbeddedFile(Lcom/itextpdf/kernel/pdf/PdfStream;)Z
    .locals 1
    .param p1, "stream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 2408
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->encryptedEmbeddedStreamsHandler:Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;->isStreamStoredAsEmbedded(Lcom/itextpdf/kernel/pdf/PdfStream;)Z

    move-result v0

    return v0
.end method

.method public findFont(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 3
    .param p1, "fontProgram"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;

    .line 1928
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->documentFonts:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/font/PdfFont;

    .line 1929
    .local v1, "font":Lcom/itextpdf/kernel/font/PdfFont;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/font/PdfFont;->isFlushed()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1, p1, p2}, Lcom/itextpdf/kernel/font/PdfFont;->isBuiltWith(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1930
    return-object v1

    .line 1932
    .end local v1    # "font":Lcom/itextpdf/kernel/font/PdfFont;
    :cond_0
    goto :goto_0

    .line 1933
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public flushCopiedObjects(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 3
    .param p1, "sourceDoc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 1416
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1417
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfWriter;->flushCopiedObjects(J)V

    .line 1419
    :cond_0
    return-void
.end method

.method protected flushFonts()V
    .locals 4

    .line 2307
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v0, v0, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    if-eqz v0, :cond_3

    .line 2308
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentFonts()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/font/PdfFont;

    .line 2309
    .local v1, "font":Lcom/itextpdf/kernel/font/PdfFont;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/font/PdfFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    const/16 v3, 0x40

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->checkState(S)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Lcom/itextpdf/kernel/font/PdfFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 2310
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2311
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/font/PdfFont;->flush()V

    .line 2313
    .end local v1    # "font":Lcom/itextpdf/kernel/font/PdfFont;
    :cond_1
    goto :goto_0

    :cond_2
    goto :goto_2

    .line 2315
    :cond_3
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentFonts()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/font/PdfFont;

    .line 2316
    .restart local v1    # "font":Lcom/itextpdf/kernel/font/PdfFont;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/font/PdfFont;->flush()V

    .line 2317
    .end local v1    # "font":Lcom/itextpdf/kernel/font/PdfFont;
    goto :goto_1

    .line 2319
    :cond_4
    :goto_2
    return-void
.end method

.method protected flushInfoDictionary(Z)V
    .locals 3
    .param p1, "appendMode"    # Z

    .line 2245
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentInfo()Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 2246
    .local v0, "infoDictObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz p1, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isModified()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2247
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->flush(Z)V

    .line 2253
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Info:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 2254
    return-void
.end method

.method protected flushObject(Lcom/itextpdf/kernel/pdf/PdfObject;Z)V
    .locals 1
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "canBeInObjStm"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2031
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfWriter;->flushObject(Lcom/itextpdf/kernel/pdf/PdfObject;Z)V

    .line 2032
    return-void
.end method

.method public getAssociatedFiles()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 1678
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 1679
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;
    .locals 1

    .line 834
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 835
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    return-object v0
.end method

.method public getConformanceLevel()Lcom/itextpdf/kernel/pdf/IConformanceLevel;
    .locals 1

    .line 1163
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDefaultFont()Lcom/itextpdf/kernel/font/PdfFont;
    .locals 3

    .line 1868
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->defaultFont:Lcom/itextpdf/kernel/font/PdfFont;

    if-nez v0, :cond_1

    .line 1870
    :try_start_0
    invoke-static {}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->defaultFont:Lcom/itextpdf/kernel/font/PdfFont;

    .line 1871
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    if-eqz v0, :cond_0

    .line 1872
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->defaultFont:Lcom/itextpdf/kernel/font/PdfFont;

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/font/PdfFont;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1878
    :cond_0
    goto :goto_0

    .line 1874
    :catch_0
    move-exception v0

    .line 1875
    .local v0, "e":Ljava/io/IOException;
    const-class v1, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 1876
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v2, "Exception while creating default font (Helvetica, WinAnsi)"

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1877
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->defaultFont:Lcom/itextpdf/kernel/font/PdfFont;

    .line 1880
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->defaultFont:Lcom/itextpdf/kernel/font/PdfFont;

    return-object v0
.end method

.method public getDefaultPageSize()Lcom/itextpdf/kernel/geom/PageSize;
    .locals 1

    .line 718
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->defaultPageSize:Lcom/itextpdf/kernel/geom/PageSize;

    return-object v0
.end method

.method public getDiContainer()Lcom/itextpdf/commons/utils/DIContainer;
    .locals 1

    .line 668
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->diContainer:Lcom/itextpdf/commons/utils/DIContainer;

    return-object v0
.end method

.method protected getDocumentFonts()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/kernel/font/PdfFont;",
            ">;"
        }
    .end annotation

    .line 2300
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->documentFonts:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getDocumentId()J
    .locals 2

    .line 1942
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->documentId:Lcom/itextpdf/commons/actions/sequence/SequenceId;

    invoke-virtual {v0}, Lcom/itextpdf/commons/actions/sequence/SequenceId;->getId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getDocumentIdWrapper()Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .locals 1

    .line 1951
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->documentId:Lcom/itextpdf/commons/actions/sequence/SequenceId;

    return-object v0
.end method

.method public getDocumentInfo()Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;
    .locals 3

    .line 678
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 679
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->info:Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    if-nez v0, :cond_1

    .line 680
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Info:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 681
    .local v0, "infoDict":Lcom/itextpdf/kernel/pdf/PdfObject;
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    instance-of v2, v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v2, :cond_0

    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    goto :goto_0

    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    :goto_0
    invoke-direct {v1, v2, p0}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->info:Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 683
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xmpMetadata:[B

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->info:Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    invoke-static {v1, v2}, Lcom/itextpdf/kernel/pdf/XmpMetaInfoConverter;->appendMetadataToInfo([BLcom/itextpdf/kernel/pdf/PdfDocumentInfo;)V

    .line 685
    .end local v0    # "infoDict":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->info:Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    return-object v0
.end method

.method public getEncryptedPayloadDocument()Lcom/itextpdf/kernel/pdf/PdfEncryptedPayloadDocument;
    .locals 10

    .line 1689
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfReader;->isEncrypted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1690
    return-object v1

    .line 1692
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getCollection()Lcom/itextpdf/kernel/pdf/collection/PdfCollection;

    move-result-object v0

    .line 1693
    .local v0, "collection":Lcom/itextpdf/kernel/pdf/collection/PdfCollection;
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->isViewHidden()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1694
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->getInitialDocument()Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v2

    .line 1695
    .local v2, "documentName":Lcom/itextpdf/kernel/pdf/PdfString;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v3

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->EmbeddedFiles:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getNameTree(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNameTree;

    move-result-object v3

    .line 1696
    .local v3, "embeddedFiles":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->getNames()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1697
    .local v4, "fileSpecObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v4, :cond_3

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1699
    :try_start_0
    move-object v5, v4

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-static {v5}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->wrap(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object v5

    .line 1700
    .local v5, "fileSpec":Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    if-eqz v5, :cond_2

    .line 1701
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->EF:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 1702
    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v6

    .line 1704
    .local v6, "embeddedDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->UF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v7

    .line 1705
    .local v7, "stream":Lcom/itextpdf/kernel/pdf/PdfStream;
    if-nez v7, :cond_1

    .line 1706
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v6, v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v8

    move-object v7, v8

    .line 1708
    :cond_1
    if-eqz v7, :cond_2

    .line 1709
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v8

    .line 1710
    .local v8, "documentNameUnicode":Ljava/lang/String;
    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayloadDocument;

    invoke-direct {v9, v7, v5, v8}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayloadDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/itextpdf/kernel/exceptions/PdfException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v9

    .line 1715
    .end local v5    # "fileSpec":Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .end local v6    # "embeddedDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v7    # "stream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v8    # "documentNameUnicode":Ljava/lang/String;
    :cond_2
    goto :goto_0

    .line 1713
    :catch_0
    move-exception v5

    .line 1714
    .local v5, "e":Lcom/itextpdf/kernel/exceptions/PdfException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v6}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v6

    invoke-virtual {v5}, Lcom/itextpdf/kernel/exceptions/PdfException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1718
    .end local v2    # "documentName":Lcom/itextpdf/kernel/pdf/PdfString;
    .end local v3    # "embeddedFiles":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    .end local v4    # "fileSpecObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v5    # "e":Lcom/itextpdf/kernel/exceptions/PdfException;
    :cond_3
    :goto_0
    return-object v1
.end method

.method public getFingerPrint()Lcom/itextpdf/kernel/pdf/FingerPrint;
    .locals 1

    .line 1916
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->fingerPrint:Lcom/itextpdf/kernel/pdf/FingerPrint;

    return-object v0
.end method

.method public getFirstPage()Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1

    .line 412
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 413
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    return-object v0
.end method

.method public getFont(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 2
    .param p1, "dictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1853
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    .line 1854
    .local v0, "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->documentFonts:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1855
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->documentFonts:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/font/PdfFont;

    return-object v1

    .line 1857
    :cond_0
    invoke-static {p1}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->addFont(Lcom/itextpdf/kernel/font/PdfFont;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v1

    return-object v1
.end method

.method public getLastPage()Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1

    .line 422
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    return-object v0
.end method

.method public getMemoryLimitsAwareHandler()Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;
    .locals 1

    .line 431
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    return-object v0
.end method

.method public getModifiedDocumentId()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 1

    .line 708
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    return-object v0
.end method

.method public getNextStructParentIndex()I
    .locals 2

    .line 1113
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structParentIndex:I

    if-gez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structParentIndex:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structParentIndex:I

    :goto_0
    return v0
.end method

.method public getNumberOfPages()I
    .locals 1

    .line 541
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 542
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->getNumberOfPages()I

    move-result v0

    return v0
.end method

.method public getNumberOfPdfObjects()I
    .locals 1

    .line 377
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->size()I

    move-result v0

    return v0
.end method

.method public getOriginalDocumentId()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 1

    .line 696
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->originalDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    return-object v0
.end method

.method public getOutlines(Z)Lcom/itextpdf/kernel/pdf/PdfOutline;
    .locals 1
    .param p1, "updateOutlines"    # Z

    .line 1490
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 1491
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getOutlines(Z)Lcom/itextpdf/kernel/pdf/PdfOutline;

    move-result-object v0

    return-object v0
.end method

.method public getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1
    .param p1, "pageNum"    # I

    .line 390
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 391
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    return-object v0
.end method

.method public getPage(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1
    .param p1, "pageDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 402
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 403
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->getPage(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    return-object v0
.end method

.method protected getPageFactory()Lcom/itextpdf/kernel/pdf/IPdfPageFactory;
    .locals 1

    .line 2373
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pdfPageFactory:Lcom/itextpdf/kernel/pdf/IPdfPageFactory;

    return-object v0
.end method

.method public getPageLabels()[Ljava/lang/String;
    .locals 11

    .line 1765
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageLabelsTree(Z)Lcom/itextpdf/kernel/pdf/PdfNumTree;

    move-result-object v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 1766
    return-object v2

    .line 1768
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageLabelsTree(Z)Lcom/itextpdf/kernel/pdf/PdfNumTree;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumTree;->getNumbers()Ljava/util/Map;

    move-result-object v0

    .line 1769
    .local v0, "pageLabels":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 1770
    return-object v2

    .line 1772
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    .line 1773
    .local v2, "labelStrings":[Ljava/lang/String;
    const/4 v3, 0x1

    .line 1774
    .local v3, "pageCount":I
    const-string v4, ""

    .line 1775
    .local v4, "prefix":Ljava/lang/String;
    const-string v5, "D"

    .line 1776
    .local v5, "type":Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v7

    if-ge v6, v7, :cond_7

    .line 1777
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 1778
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1779
    .local v7, "labelDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->St:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v8

    .line 1780
    .local v8, "pageRange":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v8, :cond_2

    .line 1781
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v3

    goto :goto_1

    .line 1783
    :cond_2
    const/4 v3, 0x1

    .line 1785
    :goto_1
    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v9

    .line 1786
    .local v9, "p":Lcom/itextpdf/kernel/pdf/PdfString;
    if-eqz v9, :cond_3

    .line 1787
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    .line 1789
    :cond_3
    const-string v4, ""

    .line 1791
    :goto_2
    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v10

    .line 1792
    .local v10, "t":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v10, :cond_4

    .line 1793
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    .line 1795
    :cond_4
    const-string v5, "e"

    .line 1798
    .end local v7    # "labelDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v8    # "pageRange":Lcom/itextpdf/kernel/pdf/PdfNumber;
    .end local v9    # "p":Lcom/itextpdf/kernel/pdf/PdfString;
    .end local v10    # "t":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_5
    :goto_3
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_0

    :cond_6
    goto :goto_4

    :sswitch_0
    const-string/jumbo v7, "r"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    const/4 v7, 0x1

    goto :goto_5

    :sswitch_1
    const-string v7, "e"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    const/4 v7, 0x4

    goto :goto_5

    :sswitch_2
    const-string v7, "a"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    const/4 v7, 0x3

    goto :goto_5

    :sswitch_3
    const-string v7, "R"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    move v7, v1

    goto :goto_5

    :sswitch_4
    const-string v7, "A"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    const/4 v7, 0x2

    goto :goto_5

    :goto_4
    const/4 v7, -0x1

    :goto_5
    packed-switch v7, :pswitch_data_0

    .line 1815
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v6

    goto :goto_6

    .line 1812
    :pswitch_0
    aput-object v4, v2, v6

    .line 1813
    goto :goto_6

    .line 1809
    :pswitch_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v3}, Lcom/itextpdf/kernel/numbering/EnglishAlphabetNumbering;->toLatinAlphabetNumberLowerCase(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v6

    .line 1810
    goto :goto_6

    .line 1806
    :pswitch_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v3}, Lcom/itextpdf/kernel/numbering/EnglishAlphabetNumbering;->toLatinAlphabetNumberUpperCase(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v6

    .line 1807
    goto :goto_6

    .line 1803
    :pswitch_3
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v3}, Lcom/itextpdf/kernel/numbering/RomanNumbering;->toRomanLowerCase(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v6

    .line 1804
    goto :goto_6

    .line 1800
    :pswitch_4
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v3}, Lcom/itextpdf/kernel/numbering/RomanNumbering;->toRomanUpperCase(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v6

    .line 1801
    nop

    .line 1818
    :goto_6
    add-int/lit8 v3, v3, 0x1

    .line 1776
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    .line 1820
    .end local v6    # "i":I
    :cond_7
    return-object v2

    nop

    :sswitch_data_0
    .sparse-switch
        0x41 -> :sswitch_4
        0x52 -> :sswitch_3
        0x61 -> :sswitch_2
        0x65 -> :sswitch_1
        0x72 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getPageNumber(Lcom/itextpdf/kernel/pdf/PdfDictionary;)I
    .locals 1
    .param p1, "pageDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 565
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->getPageNumber(Lcom/itextpdf/kernel/pdf/PdfDictionary;)I

    move-result v0

    return v0
.end method

.method public getPageNumber(Lcom/itextpdf/kernel/pdf/PdfPage;)I
    .locals 1
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 553
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 554
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->getPageNumber(Lcom/itextpdf/kernel/pdf/PdfPage;)I

    move-result v0

    return v0
.end method

.method public getPdfObject(I)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2
    .param p1, "objNum"    # I

    .line 361
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 362
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    .line 363
    .local v0, "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-nez v0, :cond_0

    .line 364
    const/4 v1, 0x0

    return-object v1

    .line 366
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    return-object v1
.end method

.method public getPdfVersion()Lcom/itextpdf/kernel/pdf/PdfVersion;
    .locals 1

    .line 825
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    return-object v0
.end method

.method public getReader()Lcom/itextpdf/kernel/pdf/PdfReader;
    .locals 1

    .line 795
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 796
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    return-object v0
.end method

.method public getSerializeOptions()Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .locals 1

    .line 1960
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->serializeOptions:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    return-object v0
.end method

.method public getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;
    .locals 1

    .line 1101
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    return-object v0
.end method

.method public getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;
    .locals 2

    .line 1123
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 1124
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    if-nez v0, :cond_1

    .line 1125
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1129
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->initTagStructureContext()V

    goto :goto_0

    .line 1126
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Must be a tagged document."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1132
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    return-object v0
.end method

.method public getTrailer()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 1

    .line 1551
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 1552
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    return-object v0
.end method

.method public getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;
    .locals 1

    .line 785
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 786
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    return-object v0
.end method

.method public getXmpMetadata()[B
    .locals 1

    .line 328
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXmpMetadata(Z)[B

    move-result-object v0

    return-object v0
.end method

.method public getXmpMetadata(Z)[B
    .locals 4
    .param p1, "createNew"    # Z

    .line 339
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xmpMetadata:[B

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 340
    invoke-static {}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->create()Lcom/itextpdf/kernel/xmp/XMPMeta;

    move-result-object v0

    .line 341
    .local v0, "xmpMeta":Lcom/itextpdf/kernel/xmp/XMPMeta;
    const-string/jumbo v1, "xmpmeta"

    invoke-interface {v0, v1}, Lcom/itextpdf/kernel/xmp/XMPMeta;->setObjectName(Ljava/lang/String;)V

    .line 342
    const-string v1, ""

    invoke-interface {v0, v1}, Lcom/itextpdf/kernel/xmp/XMPMeta;->setObjectName(Ljava/lang/String;)V

    .line 343
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->addCustomMetadataExtensions(Lcom/itextpdf/kernel/xmp/XMPMeta;)V

    .line 345
    :try_start_0
    const-string v1, "http://purl.org/dc/elements/1.1/"

    const-string v2, "format"

    const-string v3, "application/pdf"

    invoke-interface {v0, v1, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPMeta;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 346
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->setXmpMetadata(Lcom/itextpdf/kernel/xmp/XMPMeta;)V
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 348
    goto :goto_0

    .line 347
    :catch_0
    move-exception v1

    .line 350
    .end local v0    # "xmpMeta":Lcom/itextpdf/kernel/xmp/XMPMeta;
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xmpMetadata:[B

    return-object v0
.end method

.method getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .locals 1

    .line 2400
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    return-object v0
.end method

.method hasAcroForm()Z
    .locals 2

    .line 2412
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AcroForm:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    return v0
.end method

.method public hasEventHandler(Ljava/lang/String;)Z
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .line 760
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->eventDispatcher:Lcom/itextpdf/kernel/events/EventDispatcher;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/events/EventDispatcher;->hasEventHandler(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasOutlines()Z
    .locals 1

    .line 1829
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->hasOutlines()Z

    move-result v0

    return v0
.end method

.method protected initTagStructureContext()V
    .locals 1

    .line 1976
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    .line 1977
    return-void
.end method

.method public initializeOutlines()V
    .locals 1

    .line 1498
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 1499
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getOutlines(Z)Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 1500
    return-void
.end method

.method public isAppendMode()Z
    .locals 1

    .line 805
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 806
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v0, v0, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    return v0
.end method

.method public isCloseReader()Z
    .locals 1

    .line 1427
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closeReader:Z

    return v0
.end method

.method public isCloseWriter()Z
    .locals 1

    .line 1446
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closeWriter:Z

    return v0
.end method

.method public isClosed()Z
    .locals 1

    .line 1062
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closed:Z

    return v0
.end method

.method isDocumentFont(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Z
    .locals 1
    .param p1, "indRef"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 2404
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->documentFonts:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFlushUnusedObjects()Z
    .locals 1

    .line 1466
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->flushUnusedObjects:Z

    return v0
.end method

.method public isTagged()Z
    .locals 1

    .line 1071
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public listIndirectReferences()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;"
        }
    .end annotation

    .line 1534
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 1535
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1536
    .local v0, "indRefs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 1537
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    .line 1538
    .local v2, "indref":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v2, :cond_0

    .line 1539
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1536
    .end local v2    # "indref":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1542
    .end local v1    # "i":I
    :cond_1
    return-object v0
.end method

.method protected markObjectAsMustBeFlushed(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 2
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 2017
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2018
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 2020
    :cond_0
    return-void
.end method

.method public markStreamAsEmbeddedFile(Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 1
    .param p1, "stream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 442
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->encryptedEmbeddedStreamsHandler:Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;->storeEmbeddedStream(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 443
    return-void
.end method

.method public movePage(II)V
    .locals 3
    .param p1, "pageNumber"    # I
    .param p2, "insertBefore"    # I

    .line 593
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 594
    const/4 v0, 0x1

    if-lt p2, v0, :cond_2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v1

    add-int/2addr v1, v0

    if-gt p2, v1, :cond_2

    .line 599
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    .line 600
    .local v0, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 601
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->move(Lcom/itextpdf/kernel/pdf/PdfPage;I)V

    .line 602
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->normalizeDocumentRootTag()V

    .line 604
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->removePage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v1

    .line 605
    .local v1, "removedPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    if-le p2, p1, :cond_1

    .line 606
    add-int/lit8 p2, p2, -0x1

    .line 608
    :cond_1
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    move-result-object v2

    invoke-virtual {v2, p2, v1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->addPage(ILcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 609
    return-void

    .line 595
    .end local v0    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local v1    # "removedPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    :cond_2
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    .line 597
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 596
    const-string v2, "Requested page number {0} is out of bounds."

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public movePage(Lcom/itextpdf/kernel/pdf/PdfPage;I)Z
    .locals 2
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p2, "insertBefore"    # I

    .line 577
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 578
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPageNumber(Lcom/itextpdf/kernel/pdf/PdfPage;)I

    move-result v0

    .line 579
    .local v0, "pageNum":I
    if-lez v0, :cond_0

    .line 580
    invoke-virtual {p0, v0, p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->movePage(II)V

    .line 581
    const/4 v1, 0x1

    return v1

    .line 583
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method protected open(Lcom/itextpdf/kernel/pdf/PdfVersion;)V
    .locals 8
    .param p1, "newPdfVersion"    # Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 2042
    new-instance v0, Lcom/itextpdf/kernel/pdf/FingerPrint;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/FingerPrint;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->fingerPrint:Lcom/itextpdf/kernel/pdf/FingerPrint;

    .line 2043
    new-instance v0, Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->encryptedEmbeddedStreamsHandler:Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;

    .line 2046
    :try_start_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentIdWrapper()Lcom/itextpdf/commons/actions/sequence/SequenceId;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/StampingProperties;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    if-nez v2, :cond_0

    sget-object v2, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;->ON_DEMAND:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    goto :goto_0

    :cond_0
    sget-object v2, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;->ON_CLOSE:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    :goto_0
    invoke-static {v0, v1, v2}, Lcom/itextpdf/kernel/actions/events/ITextCoreProductEvent;->createProcessPdfEvent(Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;)Lcom/itextpdf/kernel/actions/events/ITextCoreProductEvent;

    move-result-object v0

    .line 2049
    .local v0, "event":Lcom/itextpdf/kernel/actions/events/ITextCoreProductEvent;
    invoke-static {}, Lcom/itextpdf/commons/actions/EventManager;->getInstance()Lcom/itextpdf/commons/actions/EventManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/commons/actions/EventManager;->onEvent(Lcom/itextpdf/commons/actions/IEvent;)V

    .line 2050
    const/4 v1, 0x0

    .line 2051
    .local v1, "embeddedStreamsSavedOnReading":Z
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    const/4 v3, 0x1

    if-eqz v2, :cond_8

    .line 2052
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-nez v2, :cond_7

    .line 2055
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iput-object p0, v2, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 2056
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfReader;->properties:Lcom/itextpdf/kernel/pdf/ReaderProperties;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/ReaderProperties;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    .line 2057
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    if-nez v2, :cond_1

    .line 2058
    new-instance v2, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v4, v4, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->getSafeFile()Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v4

    invoke-direct {v2, v4, v5}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;-><init>(J)V

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    .line 2060
    :cond_1
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->setMemoryLimitsAwareHandler(Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;)V

    .line 2061
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfReader;->readPdf()V

    .line 2062
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->isEmbeddedFilesOnly()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2063
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->encryptedEmbeddedStreamsHandler:Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;->storeAllEmbeddedStreams()V

    .line 2064
    const/4 v1, 0x1

    .line 2066
    :cond_2
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfReader;->headerPdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 2067
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v4, v4, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 2069
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->readDocumentIds()V

    .line 2071
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Root:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v4, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 2072
    .local v2, "catalogDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v2, :cond_6

    .line 2075
    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-direct {v4, v2}, Lcom/itextpdf/kernel/pdf/PdfCatalog;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    iput-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 2076
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->updatePdfVersionFromCatalog()V

    .line 2077
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Metadata:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v4

    .line 2078
    .local v4, "xmpMetadataStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    if-eqz v4, :cond_3

    .line 2079
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes()[B

    move-result-object v5

    iput-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xmpMetadata:[B

    .line 2080
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-class v6, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 2083
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfReader;->getPdfAConformanceLevel()Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    .line 2084
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentInfo()Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 2088
    :cond_3
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->StructTreeRoot:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v5

    .line 2089
    .local v5, "str":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v5, :cond_4

    .line 2090
    invoke-virtual {p0, v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->tryInitTagStructure(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 2092
    :cond_4
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v6, v6, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    if-eqz v6, :cond_8

    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfReader;->hasRebuiltXref()Z

    move-result v6

    if-nez v6, :cond_5

    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfReader;->hasFixedXref()Z

    move-result v6

    if-nez v6, :cond_5

    goto :goto_1

    .line 2093
    :cond_5
    new-instance v3, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v6, "Append mode requires a document without errors, even if recovery is possible."

    invoke-direct {v3, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .end local p1    # "newPdfVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    throw v3

    .line 2073
    .end local v4    # "xmpMetadataStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v5    # "str":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local p1    # "newPdfVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    :cond_6
    new-instance v3, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v4, "The trailer is corrupted: the catalog is corrupted or cannot be referenced from the file\'s trailer. The PDF cannot be opened."

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .end local p1    # "newPdfVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    throw v3

    .line 2053
    .end local v2    # "catalogDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local p1    # "newPdfVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    :cond_7
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "Given PdfReader instance has already been utilized. The PdfReader cannot be reused, please create a new instance."

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .end local p1    # "newPdfVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    throw v2

    .line 2097
    .restart local p1    # "newPdfVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    :cond_8
    :goto_1
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xref:Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    invoke-virtual {v2, p0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->initFreeReferencesList(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 2098
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    const/4 v4, 0x0

    if-eqz v2, :cond_1a

    .line 2099
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    if-eqz v2, :cond_9

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfReader;->hasXrefStm()Z

    move-result v2

    if-eqz v2, :cond_9

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/WriterProperties;->isFullCompression:Ljava/lang/Boolean;

    if-nez v2, :cond_9

    .line 2100
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, v2, Lcom/itextpdf/kernel/pdf/WriterProperties;->isFullCompression:Ljava/lang/Boolean;

    .line 2102
    :cond_9
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    if-eqz v2, :cond_b

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfReader;->isOpenedWithFullPermission()Z

    move-result v2

    if-eqz v2, :cond_a

    goto :goto_2

    .line 2103
    :cond_a
    new-instance v2, Lcom/itextpdf/kernel/exceptions/BadPasswordException;

    const-string v3, "PdfReader is not opened with owner password"

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/exceptions/BadPasswordException;-><init>(Ljava/lang/String;)V

    .end local p1    # "newPdfVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    throw v2

    .line 2105
    .restart local p1    # "newPdfVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    :cond_b
    :goto_2
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    if-eqz v2, :cond_c

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v2, v2, Lcom/itextpdf/kernel/pdf/StampingProperties;->preserveEncryption:Z

    if-eqz v2, :cond_c

    .line 2106
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    iput-object v3, v2, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    .line 2108
    :cond_c
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iput-object p0, v2, Lcom/itextpdf/kernel/pdf/PdfWriter;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 2109
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    if-nez v2, :cond_d

    .line 2110
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-direct {v2, p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 2111
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    invoke-direct {v2, p0}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->addCreationDate()Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->info:Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 2113
    :cond_d
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentInfo()Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->addModDate()Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 2115
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-nez v2, :cond_e

    .line 2116
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 2120
    :cond_e
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->size()I

    move-result v2

    if-lez v2, :cond_f

    .line 2121
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfDocument;->PDF_NAMES_TO_REMOVE_FROM_ORIGINAL_TRAILER:[Lcom/itextpdf/kernel/pdf/PdfName;

    array-length v3, v2

    move v5, v4

    :goto_3
    if-ge v5, v3, :cond_f

    aget-object v6, v2, v5

    .line 2122
    .local v6, "key":Lcom/itextpdf/kernel/pdf/PdfName;
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v7, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 2121
    nop

    .end local v6    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 2126
    :cond_f
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Root:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 2128
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    if-eqz v2, :cond_10

    .line 2130
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 2131
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v5, v5, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 2135
    :cond_10
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    if-eqz v2, :cond_17

    .line 2136
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 2137
    .local v2, "readerModifiedId":Lcom/itextpdf/kernel/pdf/PdfString;
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/WriterProperties;->initialDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    if-eqz v3, :cond_12

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    if-eqz v3, :cond_11

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    if-eqz v3, :cond_11

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v3, v3, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    if-nez v3, :cond_12

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v3, v3, Lcom/itextpdf/kernel/pdf/StampingProperties;->preserveEncryption:Z

    if-nez v3, :cond_12

    .line 2139
    :cond_11
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/WriterProperties;->initialDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->originalDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 2141
    :cond_12
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/WriterProperties;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    if-eqz v3, :cond_13

    .line 2142
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/WriterProperties;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 2144
    :cond_13
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->originalDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    if-nez v3, :cond_14

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    if-eqz v3, :cond_14

    .line 2145
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->originalDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 2147
    :cond_14
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    if-nez v3, :cond_16

    .line 2148
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->originalDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    if-nez v3, :cond_15

    .line 2149
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-static {}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->generateNewDocumentId()[B

    move-result-object v5

    invoke-direct {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>([B)V

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->originalDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 2151
    :cond_15
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->originalDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 2153
    :cond_16
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/WriterProperties;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    if-nez v3, :cond_17

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfString;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    .line 2154
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-static {}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->generateNewDocumentId()[B

    move-result-object v5

    invoke-direct {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>([B)V

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 2158
    .end local v2    # "readerModifiedId":Lcom/itextpdf/kernel/pdf/PdfString;
    :cond_17
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->originalDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    if-eqz v2, :cond_19

    .line 2159
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    if-eqz v2, :cond_18

    goto :goto_4

    :cond_18
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    .end local p1    # "newPdfVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    throw v2

    .line 2158
    .restart local p1    # "newPdfVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    :cond_19
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    .end local p1    # "newPdfVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    throw v2

    .line 2161
    .restart local p1    # "newPdfVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    :cond_1a
    :goto_4
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v2, v2, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    if-eqz v2, :cond_1d

    .line 2163
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    if-eqz v2, :cond_1c

    .line 2164
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/PdfTokenizer;->getSafeFile()Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move-result-object v2

    .line 2166
    .local v2, "file":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    const/16 v3, 0x2000

    new-array v3, v3, [B

    .line 2167
    .local v3, "buffer":[B
    :goto_5
    invoke-virtual {v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read([B)I

    move-result v5

    move v6, v5

    .local v6, "n":I
    if-lez v5, :cond_1b

    .line 2168
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    invoke-virtual {v5, v3, v4, v6}, Lcom/itextpdf/kernel/pdf/PdfWriter;->write([BII)V

    goto :goto_5

    .line 2170
    :cond_1b
    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V

    .line 2171
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfWriter;->write(I)V

    .line 2173
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v4, v4, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfReader;->hasXrefStm()Z

    move-result v5

    invoke-static {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->overrideFullCompressionInWriterProperties(Lcom/itextpdf/kernel/pdf/WriterProperties;Z)V

    .line 2175
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v5, v5, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    iput-object v5, v4, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    .line 2177
    if-eqz p1, :cond_22

    .line 2181
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_1_4:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v4

    if-ltz v4, :cond_22

    .line 2187
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-object v4, v4, Lcom/itextpdf/kernel/pdf/PdfReader;->headerPdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v4

    if-lez v4, :cond_22

    .line 2188
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Version:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfVersion;->toPdfName()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 2189
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 2190
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    goto/16 :goto_6

    .line 2163
    .end local v2    # "file":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local v3    # "buffer":[B
    .end local v6    # "n":I
    :cond_1c
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    .end local p1    # "newPdfVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    throw v2

    .line 2197
    .restart local p1    # "newPdfVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    :cond_1d
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    if-eqz v2, :cond_22

    .line 2198
    if-eqz p1, :cond_1e

    .line 2199
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 2201
    :cond_1e
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfWriter;->writeHeader()V

    .line 2203
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    if-nez v2, :cond_1f

    .line 2204
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfWriter;->initCryptoIfSpecified(Lcom/itextpdf/kernel/pdf/PdfVersion;)V

    .line 2206
    :cond_1f
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    if-eqz v2, :cond_23

    .line 2207
    if-nez v1, :cond_20

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->isEmbeddedFilesOnly()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 2208
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->encryptedEmbeddedStreamsHandler:Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;->storeAllEmbeddedStreams()V

    .line 2210
    :cond_20
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getCryptoMode()I

    move-result v2

    const/4 v3, 0x3

    if-ge v2, v3, :cond_21

    .line 2211
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    const-string v3, "Encryption algorithms STANDARD_ENCRYPTION_40, STANDARD_ENCRYPTION_128 and ENCRYPTION_AES_128 (see com.itextpdf.kernel.pdf.EncryptionConstants) are deprecated in PDF 2.0. It is highly recommended not to use it."

    invoke-static {p0, v2, v3}, Lcom/itextpdf/kernel/pdf/VersionConforming;->validatePdfVersionForDeprecatedFeatureLogWarn(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfVersion;Ljava/lang/String;)Z

    goto :goto_7

    .line 2213
    :cond_21
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getCryptoMode()I

    move-result v2

    if-ne v2, v3, :cond_23

    .line 2214
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v2

    .line 2215
    .local v2, "r":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v2, :cond_23

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v3

    const/4 v4, 0x5

    if-ne v3, v4, :cond_23

    .line 2216
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    const-string v4, "It seems that PDF 1.7 document encrypted with AES256 was updated to PDF 2.0 version and StampingProperties#preserveEncryption flag was set: encryption shall be updated via WriterProperties#setStandardEncryption method. Standard security handler was found with revision 5, which is deprecated and shall not be used in PDF 2.0 documents."

    invoke-static {p0, v3, v4}, Lcom/itextpdf/kernel/pdf/VersionConforming;->validatePdfVersionForDeprecatedFeatureLogWarn(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfVersion;Ljava/lang/String;)Z

    goto :goto_7

    .line 2197
    .end local v2    # "r":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :cond_22
    :goto_6
    nop

    .line 2222
    :cond_23
    :goto_7
    sget-object v2, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;->ON_DEMAND:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/actions/events/ITextCoreProductEvent;->getConfirmationType()Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    move-result-object v3

    if-ne v2, v3, :cond_24

    .line 2224
    invoke-static {}, Lcom/itextpdf/commons/actions/EventManager;->getInstance()Lcom/itextpdf/commons/actions/EventManager;

    move-result-object v2

    new-instance v3, Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;

    invoke-direct {v3, v0}, Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;-><init>(Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;)V

    invoke-virtual {v2, v3}, Lcom/itextpdf/commons/actions/EventManager;->onEvent(Lcom/itextpdf/commons/actions/IEvent;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2228
    .end local v0    # "event":Lcom/itextpdf/kernel/actions/events/ITextCoreProductEvent;
    .end local v1    # "embeddedStreamsSavedOnReading":Z
    :cond_24
    nop

    .line 2229
    return-void

    .line 2226
    :catch_0
    move-exception v0

    .line 2227
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Cannot open document."

    invoke-direct {v1, v2, v0, p0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/Object;)V

    throw v1
.end method

.method public registerProduct(Lcom/itextpdf/commons/actions/data/ProductData;)Z
    .locals 1
    .param p1, "productData"    # Lcom/itextpdf/commons/actions/data/ProductData;

    .line 1907
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->fingerPrint:Lcom/itextpdf/kernel/pdf/FingerPrint;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/FingerPrint;->registerProduct(Lcom/itextpdf/commons/actions/data/ProductData;)Z

    move-result v0

    return v0
.end method

.method public removeAllHandlers()V
    .locals 1

    .line 776
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->eventDispatcher:Lcom/itextpdf/kernel/events/EventDispatcher;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/events/EventDispatcher;->removeAllHandlers()V

    .line 777
    return-void
.end method

.method public removeEventHandler(Ljava/lang/String;Lcom/itextpdf/kernel/events/IEventHandler;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "handler"    # Lcom/itextpdf/kernel/events/IEventHandler;

    .line 768
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->eventDispatcher:Lcom/itextpdf/kernel/events/EventDispatcher;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/events/EventDispatcher;->removeEventHandler(Ljava/lang/String;Lcom/itextpdf/kernel/events/IEventHandler;)V

    .line 769
    return-void
.end method

.method public removePage(I)V
    .locals 3
    .param p1, "pageNum"    # I

    .line 637
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 639
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    .line 640
    .local v0, "removedPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->isFlushed()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->hasAcroForm()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 641
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Flushed page cannot be removed from a document which is tagged or has an AcroForm"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 644
    :cond_1
    :goto_0
    if-eqz v0, :cond_4

    .line 645
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->removeOutlines(Lcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 646
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->removeUnusedWidgetsFromFields(Lcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 647
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 648
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->removePageTags(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    .line 650
    :cond_2
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->isFlushed()Z

    move-result v1

    if-nez v1, :cond_3

    .line 651
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 652
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setFree()V

    .line 655
    :cond_3
    new-instance v1, Lcom/itextpdf/kernel/events/PdfDocumentEvent;

    const-string v2, "RemovePdfPage"

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/events/PdfDocumentEvent;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfPage;)V

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->dispatchEvent(Lcom/itextpdf/kernel/events/Event;)V

    .line 658
    :cond_4
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->removePage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 659
    return-void
.end method

.method public removePage(Lcom/itextpdf/kernel/pdf/PdfPage;)Z
    .locals 2
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 622
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 623
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPageNumber(Lcom/itextpdf/kernel/pdf/PdfPage;)I

    move-result v0

    .line 624
    .local v0, "pageNum":I
    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 625
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->removePage(I)V

    .line 626
    return v1

    .line 628
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method public setCloseReader(Z)V
    .locals 0
    .param p1, "closeReader"    # Z

    .line 1436
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 1437
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closeReader:Z

    .line 1438
    return-void
.end method

.method public setCloseWriter(Z)V
    .locals 0
    .param p1, "closeWriter"    # Z

    .line 1455
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 1456
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->closeWriter:Z

    .line 1457
    return-void
.end method

.method public setDefaultPageSize(Lcom/itextpdf/kernel/geom/PageSize;)V
    .locals 0
    .param p1, "pageSize"    # Lcom/itextpdf/kernel/geom/PageSize;

    .line 728
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->defaultPageSize:Lcom/itextpdf/kernel/geom/PageSize;

    .line 729
    return-void
.end method

.method public setEncryptedPayload(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)V
    .locals 4
    .param p1, "fs"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    .line 1729
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 1733
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->writerHasEncryption()Z

    move-result v0

    if-nez v0, :cond_3

    .line 1736
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptedPayload:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->AFRelationship:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1737
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 1738
    const-string v1, "Encrypted payload file spec shall have \'AFRelationship\' filed equal to \'EncryptedPayload\'"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1740
    :cond_0
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->extractFrom(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;

    move-result-object v0

    .line 1741
    .local v0, "encryptedPayload":Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    if-eqz v0, :cond_2

    .line 1745
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getCollection()Lcom/itextpdf/kernel/pdf/collection/PdfCollection;

    move-result-object v1

    .line 1746
    .local v1, "collection":Lcom/itextpdf/kernel/pdf/collection/PdfCollection;
    if-eqz v1, :cond_1

    .line 1747
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 1748
    const-string v3, "Collection dictionary already exists. It will be modified."

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    goto :goto_0

    .line 1750
    :cond_1
    new-instance v2, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;-><init>()V

    move-object v1, v2

    .line 1751
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->setCollection(Lcom/itextpdf/kernel/pdf/collection/PdfCollection;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 1753
    :goto_0
    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->setView(I)Lcom/itextpdf/kernel/pdf/collection/PdfCollection;

    .line 1754
    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->generateFileDisplay(Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Ljava/lang/String;

    move-result-object v2

    .line 1755
    .local v2, "displayName":Ljava/lang/String;
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->setInitialDocument(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/collection/PdfCollection;

    .line 1756
    invoke-virtual {p0, v2, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->addAssociatedFile(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)V

    .line 1757
    return-void

    .line 1742
    .end local v1    # "collection":Lcom/itextpdf/kernel/pdf/collection/PdfCollection;
    .end local v2    # "displayName":Ljava/lang/String;
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Encrypted payload file spec shall have encrypted payload dictionary."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1734
    .end local v0    # "encryptedPayload":Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    :cond_3
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot set encrypted payload to an encrypted document."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1730
    :cond_4
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot set encrypted payload to a document opened in read only mode."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setFlushUnusedObjects(Z)V
    .locals 0
    .param p1, "flushUnusedObjects"    # Z

    .line 1476
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 1477
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->flushUnusedObjects:Z

    .line 1478
    return-void
.end method

.method public setSerializeOptions(Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)V
    .locals 0
    .param p1, "serializeOptions"    # Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    .line 1969
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->serializeOptions:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    .line 1970
    return-void
.end method

.method public setTagged()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 3

    .line 1081
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkClosingStatus()V

    .line 1082
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    if-nez v0, :cond_0

    .line 1083
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    .line 1084
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StructTreeRoot:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1085
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Marked:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfBoolean;->TRUE:Lcom/itextpdf/kernel/pdf/PdfBoolean;

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->updateValueInMarkInfoDict(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1087
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structParentIndex:I

    .line 1089
    :cond_0
    return-object p0
.end method

.method public setUserProperties(Z)V
    .locals 2
    .param p1, "userProperties"    # Z

    .line 1838
    if-eqz p1, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfBoolean;->TRUE:Lcom/itextpdf/kernel/pdf/PdfBoolean;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfBoolean;->FALSE:Lcom/itextpdf/kernel/pdf/PdfBoolean;

    .line 1839
    .local v0, "userPropsVal":Lcom/itextpdf/kernel/pdf/PdfBoolean;
    :goto_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->UserProperties:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->updateValueInMarkInfoDict(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1840
    return-void
.end method

.method public setXmpMetadata(Lcom/itextpdf/kernel/xmp/XMPMeta;)V
    .locals 2
    .param p1, "xmpMeta"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 318
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->serializeOptions:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    const/16 v1, 0x7d0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setPadding(I)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    .line 319
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->serializeOptions:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->setXmpMetadata(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)V

    .line 320
    return-void
.end method

.method public setXmpMetadata(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)V
    .locals 1
    .param p1, "xmpMeta"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p2, "serializeOptions"    # Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 297
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->serializeOptions:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    .line 298
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->serializeToBuffer(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->setXmpMetadata([B)V

    .line 299
    return-void
.end method

.method protected setXmpMetadata([B)V
    .locals 0
    .param p1, "xmpMetadata"    # [B

    .line 307
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xmpMetadata:[B

    .line 308
    return-void
.end method

.method protected storeDestinationToReaddress(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;Ljava/util/function/Consumer;Ljava/util/function/Consumer;)V
    .locals 2
    .param p1, "destination"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;",
            "Ljava/util/function/Consumer<",
            "Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;",
            ">;",
            "Ljava/util/function/Consumer<",
            "Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;",
            ">;)V"
        }
    .end annotation

    .line 1991
    .local p2, "onPageAvailable":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;>;"
    .local p3, "onPageNotAvailable":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pendingDestinationMutations:Ljava/util/List;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDocument$DestinationMutationInfo;

    invoke-direct {v1, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/PdfDocument$DestinationMutationInfo;-><init>(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;Ljava/util/function/Consumer;Ljava/util/function/Consumer;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1992
    return-void
.end method

.method protected tryInitTagStructure(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 3
    .param p1, "str"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 2384
    :try_start_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-direct {v0, p1, p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    .line 2385
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getParentTreeNextKey()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structParentIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2391
    goto :goto_0

    .line 2386
    :catch_0
    move-exception v0

    .line 2387
    .local v0, "ex":Ljava/lang/Exception;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    .line 2388
    const/4 v1, -0x1

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->structParentIndex:I

    .line 2389
    const-class v1, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 2390
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v2, "Tag structure initialization failed, tag structure is ignored, it might be corrupted."

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2392
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :goto_0
    return-void
.end method

.method protected updateDefaultXmpMetadata()Lcom/itextpdf/kernel/xmp/XMPMeta;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 2282
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXmpMetadata(Z)[B

    move-result-object v1

    invoke-static {v1}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->parseFromBuffer([B)Lcom/itextpdf/kernel/xmp/XMPMeta;

    move-result-object v1

    .line 2283
    .local v1, "xmpMeta":Lcom/itextpdf/kernel/xmp/XMPMeta;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentInfo()Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/itextpdf/kernel/pdf/XmpMetaInfoConverter;->appendDocumentInfoToMetadata(Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;Lcom/itextpdf/kernel/xmp/XMPMeta;)V

    .line 2285
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget-boolean v2, v2, Lcom/itextpdf/kernel/pdf/WriterProperties;->addUAXmpMetadata:Z

    if-eqz v2, :cond_0

    const-string v2, "http://www.aiim.org/pdfua/ns/id/"

    const-string/jumbo v3, "part"

    invoke-static {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isXmpMetaHasProperty(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 2287
    new-instance v4, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    const/high16 v5, 0x40000000    # 2.0f

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>(I)V

    invoke-interface {v1, v2, v3, v0, v4}, Lcom/itextpdf/kernel/xmp/XMPMeta;->setPropertyInteger(Ljava/lang/String;Ljava/lang/String;ILcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 2291
    :cond_0
    return-object v1
.end method

.method protected updateXmpMetadata()V
    .locals 3

    .line 2264
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->xmpMetadata:[B

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->writer:Lcom/itextpdf/kernel/pdf/PdfWriter;

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget-boolean v0, v0, Lcom/itextpdf/kernel/pdf/WriterProperties;->addXmpMetadata:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocument;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 2265
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v0

    if-ltz v0, :cond_1

    .line 2266
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->updateDefaultXmpMetadata()Lcom/itextpdf/kernel/xmp/XMPMeta;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->setXmpMetadata(Lcom/itextpdf/kernel/xmp/XMPMeta;)V
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2271
    :cond_1
    goto :goto_0

    .line 2268
    :catch_0
    move-exception v0

    .line 2269
    .local v0, "e":Lcom/itextpdf/kernel/xmp/XMPException;
    const-class v1, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 2270
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v2, "Exception while updating XmpMetadata"

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2272
    .end local v0    # "e":Lcom/itextpdf/kernel/xmp/XMPException;
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :goto_0
    return-void
.end method
