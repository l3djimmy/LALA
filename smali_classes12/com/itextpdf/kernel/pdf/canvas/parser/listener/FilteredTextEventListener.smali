.class public Lcom/itextpdf/kernel/pdf/canvas/parser/listener/FilteredTextEventListener;
.super Lcom/itextpdf/kernel/pdf/canvas/parser/listener/FilteredEventListener;
.source "FilteredTextEventListener.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;


# direct methods
.method public varargs constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;[Lcom/itextpdf/kernel/pdf/canvas/parser/filter/IEventFilter;)V
    .locals 0
    .param p1, "delegate"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;
    .param p2, "filterSet"    # [Lcom/itextpdf/kernel/pdf/canvas/parser/filter/IEventFilter;

    .line 41
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/FilteredEventListener;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;[Lcom/itextpdf/kernel/pdf/canvas/parser/filter/IEventFilter;)V

    .line 42
    return-void
.end method


# virtual methods
.method public getResultantText()Ljava/lang/String;
    .locals 4

    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/FilteredTextEventListener;->delegates:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;

    .line 53
    .local v2, "delegate":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;
    instance-of v3, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;

    if-eqz v3, :cond_0

    .line 54
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;

    invoke-interface {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;->getResultantText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .end local v2    # "delegate":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;
    :cond_0
    goto :goto_0

    .line 57
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
