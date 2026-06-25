.class Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationBasedComparator;
.super Ljava/lang/Object;
.source "TextChunkLocationBasedComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;",
        ">;"
    }
.end annotation


# instance fields
.field private locationComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Comparator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;",
            ">;)V"
        }
    .end annotation

    .line 30
    .local p1, "locationComparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationBasedComparator;->locationComparator:Ljava/util/Comparator;

    .line 32
    return-void
.end method


# virtual methods
.method public compare(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;)I
    .locals 3
    .param p1, "o1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    .param p2, "o2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;

    .line 36
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationBasedComparator;->locationComparator:Ljava/util/Comparator;

    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->location:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    iget-object v2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->location:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    invoke-interface {v0, v1, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 27
    check-cast p1, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;

    check-cast p2, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;

    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationBasedComparator;->compare(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;)I

    move-result p1

    return p1
.end method
