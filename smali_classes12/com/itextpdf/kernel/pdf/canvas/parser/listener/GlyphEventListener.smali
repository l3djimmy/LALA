.class public Lcom/itextpdf/kernel/pdf/canvas/parser/listener/GlyphEventListener;
.super Ljava/lang/Object;
.source "GlyphEventListener.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;


# instance fields
.field protected final delegate:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;)V
    .locals 0
    .param p1, "delegate"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/GlyphEventListener;->delegate:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;

    .line 45
    return-void
.end method


# virtual methods
.method public eventOccurred(Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;)V
    .locals 4
    .param p1, "data"    # Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;
    .param p2, "type"    # Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    .line 49
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->RENDER_TEXT:Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 50
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    .line 51
    .local v0, "textRenderInfo":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getCharacterRenderInfos()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    .line 52
    .local v2, "glyphRenderInfo":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/GlyphEventListener;->delegate:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;

    invoke-interface {v3, v2, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;->eventOccurred(Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;)V

    .line 53
    .end local v2    # "glyphRenderInfo":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    goto :goto_0

    .line 54
    .end local v0    # "textRenderInfo":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    :cond_0
    goto :goto_1

    .line 55
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/GlyphEventListener;->delegate:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;

    invoke-interface {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;->eventOccurred(Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;)V

    .line 57
    :goto_1
    return-void
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

    .line 61
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/GlyphEventListener;->delegate:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;

    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;->getSupportedEvents()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method
