.class public final enum Lcom/rajat/pdfviewer/util/saveTo;
.super Ljava/lang/Enum;
.source "Enums.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/rajat/pdfviewer/util/saveTo;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0005\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/saveTo;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "DOWNLOADS",
        "ASK_EVERYTIME",
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

.field private static final synthetic $VALUES:[Lcom/rajat/pdfviewer/util/saveTo;

.field public static final enum ASK_EVERYTIME:Lcom/rajat/pdfviewer/util/saveTo;

.field public static final enum DOWNLOADS:Lcom/rajat/pdfviewer/util/saveTo;


# direct methods
.method private static final synthetic $values()[Lcom/rajat/pdfviewer/util/saveTo;
    .locals 2

    sget-object v0, Lcom/rajat/pdfviewer/util/saveTo;->DOWNLOADS:Lcom/rajat/pdfviewer/util/saveTo;

    sget-object v1, Lcom/rajat/pdfviewer/util/saveTo;->ASK_EVERYTIME:Lcom/rajat/pdfviewer/util/saveTo;

    filled-new-array {v0, v1}, [Lcom/rajat/pdfviewer/util/saveTo;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 11
    new-instance v0, Lcom/rajat/pdfviewer/util/saveTo;

    const-string v1, "DOWNLOADS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/rajat/pdfviewer/util/saveTo;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rajat/pdfviewer/util/saveTo;->DOWNLOADS:Lcom/rajat/pdfviewer/util/saveTo;

    .line 12
    new-instance v0, Lcom/rajat/pdfviewer/util/saveTo;

    const-string v1, "ASK_EVERYTIME"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/rajat/pdfviewer/util/saveTo;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/rajat/pdfviewer/util/saveTo;->ASK_EVERYTIME:Lcom/rajat/pdfviewer/util/saveTo;

    invoke-static {}, Lcom/rajat/pdfviewer/util/saveTo;->$values()[Lcom/rajat/pdfviewer/util/saveTo;

    move-result-object v0

    sput-object v0, Lcom/rajat/pdfviewer/util/saveTo;->$VALUES:[Lcom/rajat/pdfviewer/util/saveTo;

    sget-object v0, Lcom/rajat/pdfviewer/util/saveTo;->$VALUES:[Lcom/rajat/pdfviewer/util/saveTo;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lcom/rajat/pdfviewer/util/saveTo;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "$enum$name"    # Ljava/lang/String;
    .param p2, "$enum$ordinal"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 10
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lcom/rajat/pdfviewer/util/saveTo;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/rajat/pdfviewer/util/saveTo;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 13
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/rajat/pdfviewer/util/saveTo;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    const-class v0, Lcom/rajat/pdfviewer/util/saveTo;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    .line 13
    check-cast v0, Lcom/rajat/pdfviewer/util/saveTo;

    return-object v0
.end method

.method public static values()[Lcom/rajat/pdfviewer/util/saveTo;
    .locals 1

    sget-object v0, Lcom/rajat/pdfviewer/util/saveTo;->$VALUES:[Lcom/rajat/pdfviewer/util/saveTo;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    .line 13
    check-cast v0, [Lcom/rajat/pdfviewer/util/saveTo;

    return-object v0
.end method
