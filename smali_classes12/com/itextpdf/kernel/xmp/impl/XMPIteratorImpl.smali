.class public Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;
.super Ljava/lang/Object;
.source "XMPIteratorImpl.java"

# interfaces
.implements Lcom/itextpdf/kernel/xmp/XMPIterator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;,
        Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;
    }
.end annotation


# instance fields
.field private baseNS:Ljava/lang/String;

.field private nodeIterator:Ljava/util/Iterator;

.field private options:Lcom/itextpdf/kernel/xmp/options/IteratorOptions;

.field protected skipSiblings:Z

.field protected skipSubtree:Z


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/IteratorOptions;)V
    .locals 11
    .param p1, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p2, "schemaNS"    # Ljava/lang/String;
    .param p3, "propPath"    # Ljava/lang/String;
    .param p4, "options"    # Lcom/itextpdf/kernel/xmp/options/IteratorOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->baseNS:Ljava/lang/String;

    .line 64
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->skipSiblings:Z

    .line 66
    iput-boolean v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->skipSubtree:Z

    .line 68
    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->nodeIterator:Ljava/util/Iterator;

    .line 84
    if-eqz p4, :cond_0

    move-object v2, p4

    goto :goto_0

    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/xmp/options/IteratorOptions;

    invoke-direct {v2}, Lcom/itextpdf/kernel/xmp/options/IteratorOptions;-><init>()V

    :goto_0
    iput-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->options:Lcom/itextpdf/kernel/xmp/options/IteratorOptions;

    .line 87
    const/4 v2, 0x0

    .line 88
    .local v2, "startNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v3, 0x0

    .line 89
    .local v3, "initialPath":Ljava/lang/String;
    const/4 v4, 0x1

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_1

    move v5, v4

    goto :goto_1

    :cond_1
    move v5, v1

    .line 90
    .local v5, "baseSchema":Z
    :goto_1
    if-eqz p3, :cond_2

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_2

    move v6, v4

    goto :goto_2

    :cond_2
    move v6, v1

    .line 92
    .local v6, "baseProperty":Z
    :goto_2
    if-nez v5, :cond_3

    if-nez v6, :cond_3

    .line 95
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .end local v2    # "startNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .local v0, "startNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_4

    .line 97
    .end local v0    # "startNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .restart local v2    # "startNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_3
    if-eqz v5, :cond_5

    if-eqz v6, :cond_5

    .line 100
    invoke-static {p2, p3}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v7

    .line 103
    .local v7, "path":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    new-instance v8, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    invoke-direct {v8}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;-><init>()V

    .line 104
    .local v8, "basePath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_3
    invoke-virtual {v7}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->size()I

    move-result v10

    sub-int/2addr v10, v4

    if-ge v9, v10, :cond_4

    .line 106
    invoke-virtual {v7, v9}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v10

    invoke-virtual {v8, v10}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->add(Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;)V

    .line 104
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 109
    .end local v9    # "i":I
    :cond_4
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v9

    invoke-static {v9, v7, v1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 110
    .end local v2    # "startNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .restart local v0    # "startNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    iput-object p2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->baseNS:Ljava/lang/String;

    .line 111
    invoke-virtual {v8}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->toString()Ljava/lang/String;

    move-result-object v3

    .line 112
    .end local v7    # "path":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    .end local v8    # "basePath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    goto :goto_4

    .line 113
    .end local v0    # "startNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .restart local v2    # "startNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_5
    if-eqz v5, :cond_8

    if-nez v6, :cond_8

    .line 116
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    invoke-static {v0, p2, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 126
    .end local v2    # "startNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .restart local v0    # "startNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :goto_4
    if-eqz v0, :cond_7

    .line 128
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->options:Lcom/itextpdf/kernel/xmp/options/IteratorOptions;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/IteratorOptions;->isJustChildren()Z

    move-result v1

    if-nez v1, :cond_6

    .line 130
    new-instance v1, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;

    invoke-direct {v1, p0, v0, v3, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;-><init>(Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;I)V

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->nodeIterator:Ljava/util/Iterator;

    goto :goto_5

    .line 134
    :cond_6
    new-instance v1, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;

    invoke-direct {v1, p0, v0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;-><init>(Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->nodeIterator:Ljava/util/Iterator;

    goto :goto_5

    .line 140
    :cond_7
    invoke-static {}, Ljava/util/Collections;->emptyIterator()Ljava/util/Iterator;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->nodeIterator:Ljava/util/Iterator;

    .line 142
    :goto_5
    return-void

    .line 121
    .end local v0    # "startNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .restart local v2    # "startNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_8
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Schema namespace URI is required"

    const/16 v4, 0x65

    invoke-direct {v0, v1, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method


# virtual methods
.method protected getBaseNS()Ljava/lang/String;
    .locals 1

    .line 205
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->baseNS:Ljava/lang/String;

    return-object v0
.end method

.method protected getOptions()Lcom/itextpdf/kernel/xmp/options/IteratorOptions;
    .locals 1

    .line 196
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->options:Lcom/itextpdf/kernel/xmp/options/IteratorOptions;

    return-object v0
.end method

.method public hasNext()Z
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->nodeIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->nodeIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .line 187
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "The XMPIterator does not support remove()."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected setBaseNS(Ljava/lang/String;)V
    .locals 0
    .param p1, "baseNS"    # Ljava/lang/String;

    .line 214
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->baseNS:Ljava/lang/String;

    .line 215
    return-void
.end method

.method public skipSiblings()V
    .locals 1

    .line 159
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->skipSubtree()V

    .line 160
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->skipSiblings:Z

    .line 161
    return-void
.end method

.method public skipSubtree()V
    .locals 1

    .line 150
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->skipSubtree:Z

    .line 151
    return-void
.end method
