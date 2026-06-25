.class Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;
.super Ljava/lang/Object;
.source "LocationTextExtractionStrategy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TextChunkMarks"
.end annotation


# instance fields
.field preceding:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;",
            ">;"
        }
    .end annotation
.end field

.field succeeding:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 322
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 323
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;->preceding:Ljava/util/List;

    .line 324
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;->succeeding:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$1;

    .line 322
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;-><init>()V

    return-void
.end method
