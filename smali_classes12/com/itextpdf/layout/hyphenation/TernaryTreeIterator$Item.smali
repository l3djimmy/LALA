.class Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;
.super Ljava/lang/Object;
.source "TernaryTreeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Item"
.end annotation


# instance fields
.field child:C

.field parent:C

.field final synthetic this$0:Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;)V
    .locals 0

    .line 58
    iput-object p1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->this$0:Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    const/4 p1, 0x0

    iput-char p1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->parent:C

    .line 60
    iput-char p1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->child:C

    .line 61
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;CC)V
    .locals 0
    .param p2, "p"    # C
    .param p3, "c"    # C

    .line 69
    iput-object p1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->this$0:Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-char p2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->parent:C

    .line 71
    iput-char p3, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->child:C

    .line 72
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;)V
    .locals 0
    .param p2, "i"    # Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;

    .line 79
    iput-object p1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->this$0:Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iget-char p1, p2, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->parent:C

    iput-char p1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->parent:C

    .line 81
    iget-char p1, p2, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->child:C

    iput-char p1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->child:C

    .line 82
    return-void
.end method
