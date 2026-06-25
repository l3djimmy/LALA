.class Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$StructElemCopyingParams;
.super Ljava/lang/Object;
.source "StructureTreeCopier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StructElemCopyingParams"
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

.field private final copyFromDestDocument:Z

.field private final objectsToCopy:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation
.end field

.field private final page2page:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ">;"
        }
    .end annotation
.end field

.field private final toDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;


# direct methods
.method public constructor <init>(Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/Map;Z)V
    .locals 1
    .param p2, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p4, "copyFromDestDocument"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ">;Z)V"
        }
    .end annotation

    .line 661
    .local p1, "objectsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    .local p3, "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 662
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$StructElemCopyingParams;->objectsToCopy:Ljava/util/Set;

    .line 663
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$StructElemCopyingParams;->toDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 664
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$StructElemCopyingParams;->page2page:Ljava/util/Map;

    .line 665
    iput-boolean p4, p0, Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$StructElemCopyingParams;->copyFromDestDocument:Z

    .line 666
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$StructElemCopyingParams;->copiedNamespaces:Ljava/util/Set;

    .line 667
    return-void
.end method


# virtual methods
.method public addCopiedNamespace(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 1
    .param p1, "copiedNs"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 686
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$StructElemCopyingParams;->copiedNamespaces:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 687
    return-void
.end method

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

    .line 690
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$StructElemCopyingParams;->copiedNamespaces:Ljava/util/Set;

    return-object v0
.end method

.method public getObjectsToCopy()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation

    .line 670
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$StructElemCopyingParams;->objectsToCopy:Ljava/util/Set;

    return-object v0
.end method

.method public getPage2page()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ">;"
        }
    .end annotation

    .line 678
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$StructElemCopyingParams;->page2page:Ljava/util/Map;

    return-object v0
.end method

.method public getToDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 674
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$StructElemCopyingParams;->toDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    return-object v0
.end method

.method public isCopyFromDestDocument()Z
    .locals 1

    .line 682
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/tagging/StructureTreeCopier$StructElemCopyingParams;->copyFromDestDocument:Z

    return v0
.end method
