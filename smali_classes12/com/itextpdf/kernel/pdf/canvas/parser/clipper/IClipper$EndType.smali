.class public final enum Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;
.super Ljava/lang/Enum;
.source "IClipper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EndType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

.field public static final enum CLOSED_LINE:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

.field public static final enum CLOSED_POLYGON:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

.field public static final enum OPEN_BUTT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

.field public static final enum OPEN_ROUND:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

.field public static final enum OPEN_SQUARE:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 44
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    const-string v1, "CLOSED_POLYGON"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;->CLOSED_POLYGON:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    const-string v1, "CLOSED_LINE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;->CLOSED_LINE:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    const-string v1, "OPEN_BUTT"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;->OPEN_BUTT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    const-string v1, "OPEN_SQUARE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;->OPEN_SQUARE:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    const-string v1, "OPEN_ROUND"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;->OPEN_ROUND:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    .line 43
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;->CLOSED_POLYGON:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;->CLOSED_LINE:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;->OPEN_BUTT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;->OPEN_SQUARE:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;->OPEN_ROUND:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 43
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 43
    const-class v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;
    .locals 1

    .line 43
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    return-object v0
.end method
