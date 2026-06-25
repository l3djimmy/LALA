.class public final enum Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;
.super Ljava/lang/Enum;
.source "IClipper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "JoinType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

.field public static final enum BEVEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

.field public static final enum MITER:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

.field public static final enum ROUND:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 48
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    const-string v1, "BEVEL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->BEVEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    const-string v1, "ROUND"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->ROUND:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    const-string v1, "MITER"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->MITER:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    .line 47
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->BEVEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->ROUND:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->MITER:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    filled-new-array {v0, v1, v2}, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 47
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 47
    const-class v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;
    .locals 1

    .line 47
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    return-object v0
.end method
