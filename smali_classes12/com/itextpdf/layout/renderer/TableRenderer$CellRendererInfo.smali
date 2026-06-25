.class Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;
.super Ljava/lang/Object;
.source "TableRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/TableRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CellRendererInfo"
.end annotation


# instance fields
.field public cellRenderer:Lcom/itextpdf/layout/renderer/CellRenderer;

.field public column:I

.field public finishRowInd:I


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/renderer/CellRenderer;II)V
    .locals 0
    .param p1, "cellRenderer"    # Lcom/itextpdf/layout/renderer/CellRenderer;
    .param p2, "column"    # I
    .param p3, "finishRow"    # I

    .line 1871
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1872
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;->cellRenderer:Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 1873
    iput p2, p0, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;->column:I

    .line 1876
    iput p3, p0, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;->finishRowInd:I

    .line 1877
    return-void
.end method
