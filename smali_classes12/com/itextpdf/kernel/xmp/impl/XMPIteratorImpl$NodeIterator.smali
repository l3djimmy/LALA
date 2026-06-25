.class Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;
.super Ljava/lang/Object;
.source "XMPIteratorImpl.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NodeIterator"
.end annotation


# static fields
.field protected static final ITERATE_CHILDREN:I = 0x1

.field protected static final ITERATE_NODE:I = 0x0

.field protected static final ITERATE_QUALIFIER:I = 0x2


# instance fields
.field private childrenIterator:Ljava/util/Iterator;

.field private index:I

.field private path:Ljava/lang/String;

.field private returnProperty:Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;

.field private state:I

.field private subIterator:Ljava/util/Iterator;

.field final synthetic this$0:Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;

.field private visitedNode:Lcom/itextpdf/kernel/xmp/impl/XMPNode;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;)V
    .locals 1

    .line 257
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->this$0:Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 238
    const/4 p1, 0x0

    iput p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->state:I

    .line 244
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->childrenIterator:Ljava/util/Iterator;

    .line 246
    iput p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->index:I

    .line 248
    invoke-static {}, Ljava/util/Collections;->emptyIterator()Ljava/util/Iterator;

    move-result-object p1

    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->subIterator:Ljava/util/Iterator;

    .line 250
    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->returnProperty:Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;

    .line 259
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;I)V
    .locals 3
    .param p2, "visitedNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p3, "parentPath"    # Ljava/lang/String;
    .param p4, "index"    # I

    .line 269
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->this$0:Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 238
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->state:I

    .line 244
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->childrenIterator:Ljava/util/Iterator;

    .line 246
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->index:I

    .line 248
    invoke-static {}, Ljava/util/Collections;->emptyIterator()Ljava/util/Iterator;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->subIterator:Ljava/util/Iterator;

    .line 250
    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->returnProperty:Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;

    .line 270
    iput-object p2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->visitedNode:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 271
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->state:I

    .line 272
    invoke-virtual {p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 274
    invoke-virtual {p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->setBaseNS(Ljava/lang/String;)V

    .line 278
    :cond_0
    invoke-virtual {p0, p2, p3, p4}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->accumulatePath(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->path:Ljava/lang/String;

    .line 279
    return-void
.end method

.method private iterateChildren(Ljava/util/Iterator;)Z
    .locals 7
    .param p1, "iterator"    # Ljava/util/Iterator;

    .line 356
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->this$0:Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;

    iget-boolean v0, v0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->skipSiblings:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 359
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->this$0:Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;

    iput-boolean v1, v0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->skipSiblings:Z

    .line 360
    invoke-static {}, Ljava/util/Collections;->emptyIterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->subIterator:Ljava/util/Iterator;

    .line 365
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->subIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 367
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 368
    .local v0, "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    iget v3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->index:I

    add-int/2addr v3, v2

    iput v3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->index:I

    .line 369
    new-instance v3, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;

    iget-object v4, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->this$0:Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;

    iget-object v5, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->path:Ljava/lang/String;

    iget v6, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->index:I

    invoke-direct {v3, v4, v0, v5, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;-><init>(Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;I)V

    iput-object v3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->subIterator:Ljava/util/Iterator;

    .line 372
    .end local v0    # "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->subIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 374
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->subIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->returnProperty:Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;

    .line 375
    return v2

    .line 379
    :cond_2
    return v1
.end method


# virtual methods
.method protected accumulatePath(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;I)Ljava/lang/String;
    .locals 3
    .param p1, "currNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "parentPath"    # Ljava/lang/String;
    .param p3, "currentIndex"    # I

    .line 426
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getParent()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 430
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getParent()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 432
    const-string v0, ""

    .line 433
    .local v0, "separator":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .local v1, "segmentName":Ljava/lang/String;
    goto :goto_0

    .line 437
    .end local v0    # "separator":Ljava/lang/String;
    .end local v1    # "segmentName":Ljava/lang/String;
    :cond_1
    const-string v0, "/"

    .line 438
    .restart local v0    # "separator":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v1

    .line 442
    .restart local v1    # "segmentName":Ljava/lang/String;
    :goto_0
    if-eqz p2, :cond_5

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    goto :goto_2

    .line 446
    :cond_2
    iget-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->this$0:Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->getOptions()Lcom/itextpdf/kernel/xmp/options/IteratorOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/IteratorOptions;->isJustLeafname()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 448
    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    move-object v2, v1

    goto :goto_1

    .line 450
    :cond_3
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 448
    :goto_1
    return-object v2

    .line 454
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 444
    :cond_5
    :goto_2
    return-object v1

    .line 428
    .end local v0    # "separator":Ljava/lang/String;
    .end local v1    # "segmentName":Ljava/lang/String;
    :cond_6
    :goto_3
    const/4 v0, 0x0

    return-object v0
.end method

.method protected createPropertyInfo(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;
    .locals 7
    .param p1, "node"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "baseNS"    # Ljava/lang/String;
    .param p3, "path"    # Ljava/lang/String;

    .line 469
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v0

    :goto_0
    move-object v6, v0

    .line 471
    .local v6, "value":Ljava/lang/String;
    new-instance v1, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator$1;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    .end local p1    # "node":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local p2    # "baseNS":Ljava/lang/String;
    .end local p3    # "path":Ljava/lang/String;
    .local v3, "node":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .local v4, "baseNS":Ljava/lang/String;
    .local v5, "path":Ljava/lang/String;
    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator$1;-><init>(Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method protected getChildrenIterator()Ljava/util/Iterator;
    .locals 1

    .line 516
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->childrenIterator:Ljava/util/Iterator;

    return-object v0
.end method

.method protected getReturnProperty()Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;
    .locals 1

    .line 534
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->returnProperty:Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;

    return-object v0
.end method

.method public hasNext()Z
    .locals 3

    .line 289
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->returnProperty:Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 292
    return v1

    .line 296
    :cond_0
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->state:I

    if-nez v0, :cond_1

    .line 298
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->reportNode()Z

    move-result v0

    return v0

    .line 300
    :cond_1
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->state:I

    .line 319
    iget-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->childrenIterator:Ljava/util/Iterator;

    .line 300
    if-ne v0, v1, :cond_4

    .line 302
    if-nez v2, :cond_2

    .line 304
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->visitedNode:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->childrenIterator:Ljava/util/Iterator;

    .line 307
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->childrenIterator:Ljava/util/Iterator;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->iterateChildren(Ljava/util/Iterator;)Z

    move-result v0

    .line 309
    .local v0, "hasNext":Z
    if-nez v0, :cond_3

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->visitedNode:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->this$0:Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->getOptions()Lcom/itextpdf/kernel/xmp/options/IteratorOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/IteratorOptions;->isOmitQualifiers()Z

    move-result v1

    if-nez v1, :cond_3

    .line 311
    const/4 v1, 0x2

    iput v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->state:I

    .line 312
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->childrenIterator:Ljava/util/Iterator;

    .line 313
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->hasNext()Z

    move-result v0

    .line 315
    :cond_3
    return v0

    .line 319
    .end local v0    # "hasNext":Z
    :cond_4
    if-nez v2, :cond_5

    .line 321
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->visitedNode:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->childrenIterator:Ljava/util/Iterator;

    .line 324
    :cond_5
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->childrenIterator:Ljava/util/Iterator;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->iterateChildren(Ljava/util/Iterator;)Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 2

    .line 393
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 395
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->returnProperty:Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;

    .line 396
    .local v0, "result":Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->returnProperty:Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;

    .line 397
    return-object v0

    .line 401
    .end local v0    # "result":Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "There are no more nodes to return"

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public remove()V
    .locals 1

    .line 412
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected reportNode()Z
    .locals 4

    .line 335
    const/4 v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->state:I

    .line 336
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->visitedNode:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getParent()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->this$0:Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;

    .line 337
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->getOptions()Lcom/itextpdf/kernel/xmp/options/IteratorOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/IteratorOptions;->isJustLeafnodes()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->visitedNode:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v1

    if-nez v1, :cond_1

    .line 339
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->visitedNode:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    iget-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->this$0:Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;->getBaseNS()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->path:Ljava/lang/String;

    invoke-virtual {p0, v1, v2, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->createPropertyInfo(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->returnProperty:Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;

    .line 340
    return v0

    .line 344
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method protected setChildrenIterator(Ljava/util/Iterator;)V
    .locals 0
    .param p1, "childrenIterator"    # Ljava/util/Iterator;

    .line 525
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->childrenIterator:Ljava/util/Iterator;

    .line 526
    return-void
.end method

.method protected setReturnProperty(Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;)V
    .locals 0
    .param p1, "returnProperty"    # Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;

    .line 543
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->returnProperty:Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;

    .line 544
    return-void
.end method
