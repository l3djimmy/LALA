.class public final Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior$Companion;
.super Ljava/lang/Object;
.source "ToolbarTitleBehavior.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior$Companion;",
        "",
        "<init>",
        "()V",
        "fromXmlValue",
        "Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;",
        "value",
        "",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final fromXmlValue(I)Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;
    .locals 1
    .param p1, "value"    # I

    .line 18
    packed-switch p1, :pswitch_data_0

    .line 23
    sget-object v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->MULTI_LINE_WRAP:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    goto :goto_0

    .line 22
    :pswitch_0
    sget-object v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->MULTI_LINE_WRAP:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    goto :goto_0

    .line 21
    :pswitch_1
    sget-object v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->MULTI_LINE_ELLIPSIS:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    goto :goto_0

    .line 20
    :pswitch_2
    sget-object v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->SINGLE_LINE_SCROLLABLE:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    goto :goto_0

    .line 19
    :pswitch_3
    sget-object v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->SINGLE_LINE_ELLIPSIS:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    .line 18
    :goto_0
    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
