.class public final enum Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;
.super Ljava/lang/Enum;
.source "ToolbarTitleBehavior.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\r\u0008\u0086\u0081\u0002\u0018\u0000 \u00132\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0013B#\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011j\u0002\u0008\u0012\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;",
        "",
        "isSingleLine",
        "",
        "maxLines",
        "",
        "ellipsize",
        "Landroid/text/TextUtils$TruncateAt;",
        "<init>",
        "(Ljava/lang/String;IZILandroid/text/TextUtils$TruncateAt;)V",
        "()Z",
        "getMaxLines",
        "()I",
        "getEllipsize",
        "()Landroid/text/TextUtils$TruncateAt;",
        "SINGLE_LINE_ELLIPSIS",
        "SINGLE_LINE_SCROLLABLE",
        "MULTI_LINE_ELLIPSIS",
        "MULTI_LINE_WRAP",
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
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

.field public static final Companion:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior$Companion;

.field public static final enum MULTI_LINE_ELLIPSIS:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

.field public static final enum MULTI_LINE_WRAP:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

.field public static final enum SINGLE_LINE_ELLIPSIS:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

.field public static final enum SINGLE_LINE_SCROLLABLE:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;


# instance fields
.field private final ellipsize:Landroid/text/TextUtils$TruncateAt;

.field private final isSingleLine:Z

.field private final maxLines:I


# direct methods
.method private static final synthetic $values()[Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;
    .locals 4

    sget-object v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->SINGLE_LINE_ELLIPSIS:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    sget-object v1, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->SINGLE_LINE_SCROLLABLE:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    sget-object v2, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->MULTI_LINE_ELLIPSIS:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    sget-object v3, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->MULTI_LINE_WRAP:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    filled-new-array {v0, v1, v2, v3}, [Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 9

    .line 10
    new-instance v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    const/4 v4, 0x1

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    const-string v1, "SINGLE_LINE_ELLIPSIS"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct/range {v0 .. v5}, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;-><init>(Ljava/lang/String;IZILandroid/text/TextUtils$TruncateAt;)V

    sput-object v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->SINGLE_LINE_ELLIPSIS:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    .line 11
    new-instance v1, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    const/4 v5, 0x1

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    const-string v2, "SINGLE_LINE_SCROLLABLE"

    invoke-direct/range {v1 .. v6}, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;-><init>(Ljava/lang/String;IZILandroid/text/TextUtils$TruncateAt;)V

    sput-object v1, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->SINGLE_LINE_SCROLLABLE:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    .line 12
    new-instance v2, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    const/4 v6, 0x2

    sget-object v7, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    const-string v3, "MULTI_LINE_ELLIPSIS"

    const/4 v4, 0x2

    const/4 v5, 0x0

    invoke-direct/range {v2 .. v7}, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;-><init>(Ljava/lang/String;IZILandroid/text/TextUtils$TruncateAt;)V

    sput-object v2, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->MULTI_LINE_ELLIPSIS:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    .line 13
    new-instance v3, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    const v7, 0x7fffffff

    const/4 v8, 0x0

    const-string v4, "MULTI_LINE_WRAP"

    const/4 v5, 0x3

    const/4 v6, 0x0

    invoke-direct/range {v3 .. v8}, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;-><init>(Ljava/lang/String;IZILandroid/text/TextUtils$TruncateAt;)V

    sput-object v3, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->MULTI_LINE_WRAP:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    invoke-static {}, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->$values()[Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    move-result-object v0

    sput-object v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->$VALUES:[Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    sget-object v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->$VALUES:[Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->$ENTRIES:Lkotlin/enums/EnumEntries;

    new-instance v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->Companion:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior$Companion;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZILandroid/text/TextUtils$TruncateAt;)V
    .locals 0
    .param p1, "$enum$name"    # Ljava/lang/String;
    .param p2, "$enum$ordinal"    # I
    .param p3, "isSingleLine"    # Z
    .param p4, "maxLines"    # I
    .param p5, "ellipsize"    # Landroid/text/TextUtils$TruncateAt;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZI",
            "Landroid/text/TextUtils$TruncateAt;",
            ")V"
        }
    .end annotation

    .line 5
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 6
    iput-boolean p3, p0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->isSingleLine:Z

    .line 7
    iput p4, p0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->maxLines:I

    .line 8
    iput-object p5, p0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->ellipsize:Landroid/text/TextUtils$TruncateAt;

    .line 5
    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 27
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    const-class v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    .line 27
    check-cast v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    return-object v0
.end method

.method public static values()[Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;
    .locals 1

    sget-object v0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->$VALUES:[Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    .line 27
    check-cast v0, [Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    return-object v0
.end method


# virtual methods
.method public final getEllipsize()Landroid/text/TextUtils$TruncateAt;
    .locals 1

    .line 8
    iget-object v0, p0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->ellipsize:Landroid/text/TextUtils$TruncateAt;

    return-object v0
.end method

.method public final getMaxLines()I
    .locals 1

    .line 7
    iget v0, p0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->maxLines:I

    return v0
.end method

.method public final isSingleLine()Z
    .locals 1

    .line 6
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->isSingleLine:Z

    return v0
.end method
