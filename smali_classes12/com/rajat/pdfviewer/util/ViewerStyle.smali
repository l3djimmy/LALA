.class public final Lcom/rajat/pdfviewer/util/ViewerStyle;
.super Ljava/lang/Object;
.source "ViewerStyle.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rajat/pdfviewer/util/ViewerStyle$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008\u0087\u0008\u0018\u0000 \u00172\u00020\u0001:\u0001\u0017B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000e\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\rJ\t\u0010\u000e\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u000f\u001a\u00020\u0003H\u00c6\u0003J\u001d\u0010\u0010\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0003H\u00c6\u0001J\u0013\u0010\u0011\u001a\u00020\u00122\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0014\u001a\u00020\u0003H\u00d6\u0001J\t\u0010\u0015\u001a\u00020\u0016H\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\u0008\u00a8\u0006\u0018"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/ViewerStyle;",
        "",
        "backgroundColor",
        "",
        "progressBarDrawableResId",
        "<init>",
        "(II)V",
        "getBackgroundColor",
        "()I",
        "getProgressBarDrawableResId",
        "applyTo",
        "",
        "binding",
        "Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;",
        "component1",
        "component2",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "toString",
        "",
        "Companion",
        "pdfViewer_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I

.field public static final Companion:Lcom/rajat/pdfviewer/util/ViewerStyle$Companion;


# instance fields
.field private final backgroundColor:I

.field private final progressBarDrawableResId:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/rajat/pdfviewer/util/ViewerStyle$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/rajat/pdfviewer/util/ViewerStyle$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/rajat/pdfviewer/util/ViewerStyle;->Companion:Lcom/rajat/pdfviewer/util/ViewerStyle$Companion;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "backgroundColor"    # I
    .param p2, "progressBarDrawableResId"    # I

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput p1, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->backgroundColor:I

    .line 14
    iput p2, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->progressBarDrawableResId:I

    .line 12
    return-void
.end method

.method public static synthetic copy$default(Lcom/rajat/pdfviewer/util/ViewerStyle;IIILjava/lang/Object;)Lcom/rajat/pdfviewer/util/ViewerStyle;
    .locals 0

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    iget p1, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->backgroundColor:I

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    iget p2, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->progressBarDrawableResId:I

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/util/ViewerStyle;->copy(II)Lcom/rajat/pdfviewer/util/ViewerStyle;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final applyTo(Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;)V
    .locals 3
    .param p1, "binding"    # Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;

    const-string v0, "binding"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    nop

    .line 18
    :try_start_0
    iget-object v0, p1, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;->parentLayout:Landroidx/constraintlayout/widget/ConstraintLayout;

    iget v1, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->backgroundColor:I

    invoke-virtual {v0, v1}, Landroidx/constraintlayout/widget/ConstraintLayout;->setBackgroundColor(I)V

    .line 19
    iget-object v0, p1, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;->progressBar:Landroid/widget/ProgressBar;

    .line 20
    invoke-virtual {p1}, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/constraintlayout/widget/ConstraintLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->progressBarDrawableResId:I

    .line 19
    invoke-static {v1, v2}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 22
    :catch_0
    move-exception v0

    .line 23
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to apply style: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ViewerStyle"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public final component1()I
    .locals 1

    iget v0, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->backgroundColor:I

    return v0
.end method

.method public final component2()I
    .locals 1

    iget v0, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->progressBarDrawableResId:I

    return v0
.end method

.method public final copy(II)Lcom/rajat/pdfviewer/util/ViewerStyle;
    .locals 1

    new-instance v0, Lcom/rajat/pdfviewer/util/ViewerStyle;

    invoke-direct {v0, p1, p2}, Lcom/rajat/pdfviewer/util/ViewerStyle;-><init>(II)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/rajat/pdfviewer/util/ViewerStyle;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/rajat/pdfviewer/util/ViewerStyle;

    iget v3, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->backgroundColor:I

    iget v4, v1, Lcom/rajat/pdfviewer/util/ViewerStyle;->backgroundColor:I

    if-eq v3, v4, :cond_2

    return v2

    :cond_2
    iget v3, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->progressBarDrawableResId:I

    iget v1, v1, Lcom/rajat/pdfviewer/util/ViewerStyle;->progressBarDrawableResId:I

    if-eq v3, v1, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public final getBackgroundColor()I
    .locals 1

    .line 13
    iget v0, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->backgroundColor:I

    return v0
.end method

.method public final getProgressBarDrawableResId()I
    .locals 1

    .line 14
    iget v0, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->progressBarDrawableResId:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    iget v0, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->backgroundColor:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->progressBarDrawableResId:I

    invoke-static {v2}, Ljava/lang/Integer;->hashCode(I)I

    move-result v2

    add-int/2addr v1, v2

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ViewerStyle(backgroundColor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->backgroundColor:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", progressBarDrawableResId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/rajat/pdfviewer/util/ViewerStyle;->progressBarDrawableResId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
