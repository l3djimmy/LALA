.class public final Lcom/rajat/pdfviewer/PdfViewerViewModel;
.super Landroidx/lifecycle/ViewModel;
.source "PdfViewerViewModel.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u0014\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0017\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/PdfViewerViewModel;",
        "Landroidx/lifecycle/ViewModel;",
        "<init>",
        "()V",
        "_downloadStatus",
        "Landroidx/lifecycle/MutableLiveData;",
        "Lcom/rajat/pdfviewer/util/DownloadStatus;",
        "downloadStatus",
        "Landroidx/lifecycle/LiveData;",
        "getDownloadStatus",
        "()Landroidx/lifecycle/LiveData;",
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


# instance fields
.field private final _downloadStatus:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Lcom/rajat/pdfviewer/util/DownloadStatus;",
            ">;"
        }
    .end annotation
.end field

.field private final downloadStatus:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "Lcom/rajat/pdfviewer/util/DownloadStatus;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/rajat/pdfviewer/PdfViewerViewModel;->$stable:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 7
    invoke-direct {p0}, Landroidx/lifecycle/ViewModel;-><init>()V

    .line 9
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    invoke-direct {v0}, Landroidx/lifecycle/MutableLiveData;-><init>()V

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfViewerViewModel;->_downloadStatus:Landroidx/lifecycle/MutableLiveData;

    .line 10
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewerViewModel;->_downloadStatus:Landroidx/lifecycle/MutableLiveData;

    check-cast v0, Landroidx/lifecycle/LiveData;

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfViewerViewModel;->downloadStatus:Landroidx/lifecycle/LiveData;

    .line 7
    return-void
.end method


# virtual methods
.method public final getDownloadStatus()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Lcom/rajat/pdfviewer/util/DownloadStatus;",
            ">;"
        }
    .end annotation

    .line 10
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewerViewModel;->downloadStatus:Landroidx/lifecycle/LiveData;

    return-object v0
.end method
