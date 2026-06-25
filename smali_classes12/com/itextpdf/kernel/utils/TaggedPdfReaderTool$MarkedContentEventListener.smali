.class Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$MarkedContentEventListener;
.super Ljava/lang/Object;
.source "TaggedPdfReaderTool.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarkedContentEventListener"
.end annotation


# instance fields
.field private contentByMcid:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;


# direct methods
.method private constructor <init>(Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;)V
    .locals 0

    .line 322
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$MarkedContentEventListener;->this$0:Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 323
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$MarkedContentEventListener;->contentByMcid:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;
    .param p2, "x1"    # Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$1;

    .line 322
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$MarkedContentEventListener;-><init>(Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;)V

    return-void
.end method


# virtual methods
.method public eventOccurred(Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;)V
    .locals 5
    .param p1, "data"    # Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;
    .param p2, "type"    # Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    .line 335
    sget-object v0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$1;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$EventType:[I

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 337
    :pswitch_0
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    .line 338
    .local v0, "textInfo":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getMcid()I

    move-result v1

    .line 339
    .local v1, "mcid":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 340
    iget-object v2, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$MarkedContentEventListener;->contentByMcid:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;

    .line 341
    .local v2, "textExtractionStrategy":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;
    if-nez v2, :cond_0

    .line 342
    new-instance v3, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;-><init>()V

    move-object v2, v3

    .line 343
    iget-object v3, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$MarkedContentEventListener;->contentByMcid:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    :cond_0
    invoke-interface {v2, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;->eventOccurred(Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;)V

    .line 346
    .end local v2    # "textExtractionStrategy":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;
    nop

    .line 351
    .end local v0    # "textInfo":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    .end local v1    # "mcid":I
    :cond_1
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getMcidContent()Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 326
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 327
    .local v0, "content":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$MarkedContentEventListener;->contentByMcid:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 328
    .local v2, "id":I
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v4, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$MarkedContentEventListener;->contentByMcid:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;

    invoke-interface {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;->getResultantText()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    .end local v2    # "id":I
    goto :goto_0

    .line 330
    :cond_0
    return-object v0
.end method

.method public getSupportedEvents()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;",
            ">;"
        }
    .end annotation

    .line 355
    const/4 v0, 0x0

    return-object v0
.end method
