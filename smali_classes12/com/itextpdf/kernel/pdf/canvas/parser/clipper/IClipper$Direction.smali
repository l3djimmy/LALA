.class public final enum Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
.super Ljava/lang/Enum;
.source "IClipper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Direction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

.field public static final enum LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

.field public static final enum RIGHT_TO_LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 40
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    const-string v1, "RIGHT_TO_LEFT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->RIGHT_TO_LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    const-string v1, "LEFT_TO_RIGHT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    .line 39
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->RIGHT_TO_LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    filled-new-array {v0, v1}, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 39
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 39
    const-class v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .locals 1

    .line 39
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    return-object v0
.end method
