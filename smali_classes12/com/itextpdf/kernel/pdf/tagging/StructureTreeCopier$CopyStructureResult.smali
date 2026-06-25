.class Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$CopyStructureResult;
.super Ljava/lang/Object;
.source "StructureTreeCopier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CopyStructureResult"
.end annotation


# instance fields
.field private final copiedNamespaces:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation
.end field

.field private final topsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ">;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;)V"
        }
    .end annotation

    .line 698
    .local p1, "topsList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    .local p2, "copiedNamespaces":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 699
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$CopyStructureResult;->topsList:Ljava/util/List;

    .line 700
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$CopyStructureResult;->copiedNamespaces:Ljava/util/Set;

    .line 701
    return-void
.end method


# virtual methods
.method public getCopiedNamespaces()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation

    .line 704
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$CopyStructureResult;->copiedNamespaces:Ljava/util/Set;

    return-object v0
.end method

.method public getTopsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ">;"
        }
    .end annotation

    .line 708
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$CopyStructureResult;->topsList:Ljava/util/List;

    return-object v0
.end method
