.class public final Lcom/rajat/pdfviewer/util/DownloadStatus$Failure;
.super Lcom/rajat/pdfviewer/util/DownloadStatus;
.source "Enums.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rajat/pdfviewer/util/DownloadStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Failure"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/DownloadStatus$Failure;",
        "Lcom/rajat/pdfviewer/util/DownloadStatus;",
        "<init>",
        "()V",
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

.field public static final INSTANCE:Lcom/rajat/pdfviewer/util/DownloadStatus$Failure;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/rajat/pdfviewer/util/DownloadStatus$Failure;

    invoke-direct {v0}, Lcom/rajat/pdfviewer/util/DownloadStatus$Failure;-><init>()V

    sput-object v0, Lcom/rajat/pdfviewer/util/DownloadStatus$Failure;->INSTANCE:Lcom/rajat/pdfviewer/util/DownloadStatus$Failure;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 6
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/rajat/pdfviewer/util/DownloadStatus;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method
