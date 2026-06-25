.class Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;
.super Ljava/lang/Object;
.source "TernaryTree.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/hyphenation/TernaryTree;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TreeInsertionParams"
.end annotation


# instance fields
.field key:[C

.field p:C

.field start:I

.field val:C


# direct methods
.method public constructor <init>(C[CIC)V
    .locals 0
    .param p1, "p"    # C
    .param p2, "key"    # [C
    .param p3, "start"    # I
    .param p4, "val"    # C

    .line 595
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 596
    iput-char p1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;->p:C

    .line 597
    iput-object p2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;->key:[C

    .line 598
    iput p3, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;->start:I

    .line 599
    iput-char p4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;->val:C

    .line 600
    return-void
.end method
