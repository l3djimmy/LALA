.class public final enum Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
.super Ljava/lang/Enum;
.source "IClipper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ClipType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

.field public static final enum DIFFERENCE:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

.field public static final enum INTERSECTION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

.field public static final enum UNION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

.field public static final enum XOR:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 36
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    const-string v1, "INTERSECTION"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->INTERSECTION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    const-string v1, "UNION"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->UNION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    const-string v1, "DIFFERENCE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->DIFFERENCE:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    const-string v1, "XOR"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->XOR:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    .line 35
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->INTERSECTION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->UNION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->DIFFERENCE:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->XOR:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    filled-new-array {v0, v1, v2, v3}, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 35
    const-class v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
    .locals 1

    .line 35
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    return-object v0
.end method
