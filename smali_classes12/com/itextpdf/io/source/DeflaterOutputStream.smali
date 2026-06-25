.class public Lcom/itextpdf/io/source/DeflaterOutputStream;
.super Ljava/util/zip/DeflaterOutputStream;
.source "DeflaterOutputStream.java"


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;

    .line 40
    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/io/source/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;I)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "level"    # I

    .line 36
    const/16 v0, 0x200

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/io/source/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;II)V

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;II)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "level"    # I
    .param p3, "size"    # I

    .line 32
    new-instance v0, Ljava/util/zip/Deflater;

    invoke-direct {v0, p2}, Ljava/util/zip/Deflater;-><init>(I)V

    invoke-direct {p0, p1, v0, p3}, Ljava/util/zip/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Deflater;I)V

    .line 33
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

    .line 45
    invoke-virtual {p0}, Lcom/itextpdf/io/source/DeflaterOutputStream;->finish()V

    .line 46
    invoke-super {p0}, Ljava/util/zip/DeflaterOutputStream;->close()V

    .line 47
    return-void
.end method

.method public finish()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 51
    invoke-super {p0}, Ljava/util/zip/DeflaterOutputStream;->finish()V

    .line 52
    iget-object v0, p0, Lcom/itextpdf/io/source/DeflaterOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->end()V

    .line 53
    return-void
.end method
