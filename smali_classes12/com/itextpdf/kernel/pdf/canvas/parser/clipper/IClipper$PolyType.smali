.class public final enum Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;
.super Ljava/lang/Enum;
.source "IClipper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PolyType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

.field public static final enum CLIP:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

.field public static final enum SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 56
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    const-string v1, "SUBJECT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    const-string v1, "CLIP"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->CLIP:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    .line 55
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->CLIP:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    filled-new-array {v0, v1}, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 55
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 55
    const-class v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;
    .locals 1

    .line 55
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    return-object v0
.end method
