.class Lcom/itextpdf/kernel/utils/CompareTool$PngFileFilter;
.super Ljava/lang/Object;
.source "CompareTool.java"

# interfaces
.implements Ljava/io/FileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/utils/CompareTool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PngFileFilter"
.end annotation


# instance fields
.field private currentOutPdfName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "currentOutPdfName"    # Ljava/lang/String;

    .line 1910
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1911
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/CompareTool$PngFileFilter;->currentOutPdfName:Ljava/lang/String;

    .line 1912
    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .locals 4
    .param p1, "pathname"    # Ljava/io/File;

    .line 1915
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 1916
    .local v0, "ap":Ljava/lang/String;
    const-string v1, ".png"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    .line 1917
    .local v1, "b1":Z
    const-string v2, "cmp_"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    .line 1918
    .local v2, "b2":Z
    if-eqz v1, :cond_0

    if-nez v2, :cond_0

    iget-object v3, p0, Lcom/itextpdf/kernel/utils/CompareTool$PngFileFilter;->currentOutPdfName:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    return v3
.end method
