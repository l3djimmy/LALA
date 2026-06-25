.class public Lcom/itextpdf/kernel/pdf/DocumentRevision;
.super Ljava/lang/Object;
.source "DocumentRevision.java"


# instance fields
.field private final eofOffset:J

.field private final modifiedObjects:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(JLjava/util/Set;)V
    .locals 0
    .param p1, "eofOffset"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;)V"
        }
    .end annotation

    .line 41
    .local p3, "modifiedObjects":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-wide p1, p0, Lcom/itextpdf/kernel/pdf/DocumentRevision;->eofOffset:J

    .line 43
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/DocumentRevision;->modifiedObjects:Ljava/util/Set;

    .line 44
    return-void
.end method


# virtual methods
.method public getEofOffset()J
    .locals 2

    .line 52
    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/DocumentRevision;->eofOffset:J

    return-wide v0
.end method

.method public getModifiedObjects()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;"
        }
    .end annotation

    .line 61
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/DocumentRevision;->modifiedObjects:Ljava/util/Set;

    return-object v0
.end method
