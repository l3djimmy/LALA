.class public final Lcom/rajat/pdfviewer/util/CommonUtils;
.super Ljava/lang/Object;
.source "CommonUtils.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rajat/pdfviewer/util/CommonUtils$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0004\u0008\u0007\u0018\u0000 \u00042\u00020\u0001:\u0001\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/CommonUtils;",
        "",
        "<init>",
        "()V",
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
.field public static final $stable:I = 0x0

.field public static final Companion:Lcom/rajat/pdfviewer/util/CommonUtils$Companion;

.field public static final MAX_CACHED_PDFS:I = 0x5


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/rajat/pdfviewer/util/CommonUtils$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/rajat/pdfviewer/util/CommonUtils;->Companion:Lcom/rajat/pdfviewer/util/CommonUtils$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
