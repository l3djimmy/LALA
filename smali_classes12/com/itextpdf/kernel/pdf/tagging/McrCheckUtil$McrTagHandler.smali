.class Lcom/itextpdf/kernel/pdf/tagging/McrCheckUtil$McrTagHandler;
.super Ljava/lang/Object;
.source "McrCheckUtil.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/tagutils/ITagTreeIteratorHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/tagging/McrCheckUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "McrTagHandler"
.end annotation


# instance fields
.field private haveMcr:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/tagging/McrCheckUtil$McrTagHandler;->haveMcr:Z

    .line 75
    return-void
.end method


# virtual methods
.method public nextElement(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;)V
    .locals 1
    .param p1, "elem"    # Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    .line 82
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    if-eqz v0, :cond_0

    .line 83
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/tagging/McrCheckUtil$McrTagHandler;->haveMcr:Z

    .line 85
    :cond_0
    return-void
.end method

.method public tagTreeHaveMcr()Z
    .locals 1

    .line 67
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/tagging/McrCheckUtil$McrTagHandler;->haveMcr:Z

    return v0
.end method
