.class public Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
.super Ljava/lang/Object;
.source "TextChunk.java"


# instance fields
.field protected final location:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

.field protected final text:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)V
    .locals 0
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "loc"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->text:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->location:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    .line 38
    return-void
.end method


# virtual methods
.method public getLocation()Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->location:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->text:Ljava/lang/String;

    return-object v0
.end method

.method printDiagnostics()V
    .locals 3

    .line 52
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Text (@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->location:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    invoke-interface {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getStartLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->location:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    invoke-interface {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getEndLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->text:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 53
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "orientationMagnitude: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->location:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    invoke-interface {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->orientationMagnitude()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 54
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "distPerpendicular: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->location:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    invoke-interface {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->distPerpendicular()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 55
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "distParallel: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->location:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    invoke-interface {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->distParallelStart()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 56
    return-void
.end method

.method sameLine(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;)Z
    .locals 2
    .param p1, "lastChunk"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;

    .line 59
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->getLocation()Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->getLocation()Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->sameLine(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)Z

    move-result v0

    return v0
.end method
