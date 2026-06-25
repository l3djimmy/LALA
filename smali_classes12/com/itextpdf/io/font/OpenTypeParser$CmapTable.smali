.class Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;
.super Ljava/lang/Object;
.source "OpenTypeParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/OpenTypeParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CmapTable"
.end annotation


# instance fields
.field cmap10:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[I>;"
        }
    .end annotation
.end field

.field cmap31:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[I>;"
        }
    .end annotation
.end field

.field cmapExt:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[I>;"
        }
    .end annotation
.end field

.field fontSpecific:Z


# direct methods
.method constructor <init>()V
    .locals 1

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;->fontSpecific:Z

    return-void
.end method
