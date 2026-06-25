.class public interface abstract Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;
.super Ljava/lang/Object;
.source "IPdfNameTreeAccess.java"


# virtual methods
.method public abstract getEntry(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/PdfObject;
.end method

.method public abstract getEntry(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfObject;
.end method

.method public abstract getKeys()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            ">;"
        }
    .end annotation
.end method
