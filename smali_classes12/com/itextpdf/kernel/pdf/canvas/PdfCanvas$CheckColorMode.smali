.class final enum Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;
.super Ljava/lang/Enum;
.source "PdfCanvas.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "CheckColorMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

.field public static final enum FILL:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

.field public static final enum FILL_AND_STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

.field public static final enum NONE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

.field public static final enum STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 2568
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->NONE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    .line 2569
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    const-string v1, "FILL"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->FILL:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    .line 2570
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    const-string v1, "STROKE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    .line 2571
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    const-string v1, "FILL_AND_STROKE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->FILL_AND_STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    .line 2567
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->NONE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->FILL:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->FILL_AND_STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    filled-new-array {v0, v1, v2, v3}, [Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2567
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 2567
    const-class v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;
    .locals 1

    .line 2567
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    return-object v0
.end method
