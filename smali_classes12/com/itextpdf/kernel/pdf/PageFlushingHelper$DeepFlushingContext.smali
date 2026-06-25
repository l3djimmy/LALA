.class Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;
.super Ljava/lang/Object;
.source "PageFlushingHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/PageFlushingHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DeepFlushingContext"
.end annotation


# instance fields
.field blackList:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;"
        }
    .end annotation
.end field

.field innerContexts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;",
            ">;"
        }
    .end annotation
.end field

.field unconditionalInnerContext:Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;)V
    .locals 1
    .param p1, "unconditionalInnerContext"    # Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;

    .line 535
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 536
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;->blackList:Ljava/util/Set;

    .line 537
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;->innerContexts:Ljava/util/Map;

    .line 538
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;->unconditionalInnerContext:Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;

    .line 539
    return-void
.end method

.method public constructor <init>(Ljava/util/Set;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;",
            ">;)V"
        }
    .end annotation

    .line 530
    .local p1, "blackList":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    .local p2, "innerContexts":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 531
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;->blackList:Ljava/util/Set;

    .line 532
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;->innerContexts:Ljava/util/Map;

    .line 533
    return-void
.end method


# virtual methods
.method public getInnerContextFor(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 546
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;->innerContexts:Ljava/util/Map;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;->unconditionalInnerContext:Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;->innerContexts:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;

    :goto_0
    return-object v0
.end method

.method public isKeyInBlackList(Lcom/itextpdf/kernel/pdf/PdfName;)Z
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 542
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;->blackList:Ljava/util/Set;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PageFlushingHelper$DeepFlushingContext;->blackList:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
