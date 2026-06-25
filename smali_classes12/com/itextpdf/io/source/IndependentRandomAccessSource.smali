.class public Lcom/itextpdf/io/source/IndependentRandomAccessSource;
.super Ljava/lang/Object;
.source "IndependentRandomAccessSource.java"

# interfaces
.implements Lcom/itextpdf/io/source/IRandomAccessSource;


# instance fields
.field private final source:Lcom/itextpdf/io/source/IRandomAccessSource;


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V
    .locals 0
    .param p1, "source"    # Lcom/itextpdf/io/source/IRandomAccessSource;

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/itextpdf/io/source/IndependentRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    .line 42
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 70
    return-void
.end method

.method public get(J)I
    .locals 1
    .param p1, "position"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    iget-object v0, p0, Lcom/itextpdf/io/source/IndependentRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-interface {v0, p1, p2}, Lcom/itextpdf/io/source/IRandomAccessSource;->get(J)I

    move-result v0

    return v0
.end method

.method public get(J[BII)I
    .locals 6
    .param p1, "position"    # J
    .param p3, "bytes"    # [B
    .param p4, "off"    # I
    .param p5, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/itextpdf/io/source/IndependentRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    move-wide v1, p1

    move-object v3, p3

    move v4, p4

    move v5, p5

    .end local p1    # "position":J
    .end local p3    # "bytes":[B
    .end local p4    # "off":I
    .end local p5    # "len":I
    .local v1, "position":J
    .local v3, "bytes":[B
    .local v4, "off":I
    .local v5, "len":I
    invoke-interface/range {v0 .. v5}, Lcom/itextpdf/io/source/IRandomAccessSource;->get(J[BII)I

    move-result p1

    return p1
.end method

.method public length()J
    .locals 2

    .line 62
    iget-object v0, p0, Lcom/itextpdf/io/source/IndependentRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-interface {v0}, Lcom/itextpdf/io/source/IRandomAccessSource;->length()J

    move-result-wide v0

    return-wide v0
.end method
