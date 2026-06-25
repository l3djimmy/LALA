.class public final enum Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
.super Ljava/lang/Enum;
.source "IClipper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PolyFillType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

.field public static final enum EVEN_ODD:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

.field public static final enum NEGATIVE:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

.field public static final enum NON_ZERO:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

.field public static final enum POSITIVE:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 52
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    const-string v1, "EVEN_ODD"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->EVEN_ODD:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    const-string v1, "NON_ZERO"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->NON_ZERO:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    const-string v1, "POSITIVE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->POSITIVE:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    const-string v1, "NEGATIVE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->NEGATIVE:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 51
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->EVEN_ODD:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->NON_ZERO:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->POSITIVE:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->NEGATIVE:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    filled-new-array {v0, v1, v2, v3}, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 51
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 51
    const-class v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .locals 1

    .line 51
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    return-object v0
.end method
