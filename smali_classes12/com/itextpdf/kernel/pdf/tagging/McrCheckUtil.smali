.class public final Lcom/itextpdf/kernel/pdf/tagging/McrCheckUtil;
.super Ljava/lang/Object;
.source "McrCheckUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/tagging/McrCheckUtil$McrTagHandler;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method

.method public static isTrContainsMcr(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z
    .locals 3
    .param p0, "elementTR"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 49
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreeIterator;

    new-instance v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-direct {v1, p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreeIterator;-><init>(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;)V

    .line 50
    .local v0, "tagTreeIterator":Lcom/itextpdf/kernel/pdf/tagutils/TagTreeIterator;
    new-instance v1, Lcom/itextpdf/kernel/pdf/tagging/McrCheckUtil$McrTagHandler;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/tagging/McrCheckUtil$McrTagHandler;-><init>()V

    .line 51
    .local v1, "handler":Lcom/itextpdf/kernel/pdf/tagging/McrCheckUtil$McrTagHandler;
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreeIterator;->addHandler(Lcom/itextpdf/kernel/pdf/tagutils/ITagTreeIteratorHandler;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreeIterator;

    .line 52
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreeIterator;->traverse()V

    .line 53
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/McrCheckUtil$McrTagHandler;->tagTreeHaveMcr()Z

    move-result v2

    return v2
.end method
