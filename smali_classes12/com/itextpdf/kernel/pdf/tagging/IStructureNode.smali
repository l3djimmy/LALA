.class public interface abstract Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
.super Ljava/lang/Object;
.source "IStructureNode.java"


# virtual methods
.method public abstract getKids()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
.end method

.method public abstract getRole()Lcom/itextpdf/kernel/pdf/PdfName;
.end method
