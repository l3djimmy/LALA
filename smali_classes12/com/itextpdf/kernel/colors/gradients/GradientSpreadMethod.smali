.class public final enum Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;
.super Ljava/lang/Enum;
.source "GradientSpreadMethod.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

.field public static final enum NONE:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

.field public static final enum PAD:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

.field public static final enum REFLECT:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

.field public static final enum REPEAT:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 32
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    const-string v1, "PAD"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->PAD:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    .line 36
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    const-string v1, "REFLECT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->REFLECT:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    .line 40
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    const-string v1, "REPEAT"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->REPEAT:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    .line 44
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    const-string v1, "NONE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->NONE:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    .line 28
    sget-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->PAD:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    sget-object v1, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->REFLECT:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    sget-object v2, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->REPEAT:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    sget-object v3, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->NONE:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    filled-new-array {v0, v1, v2, v3}, [Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->$VALUES:[Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 28
    const-class v0, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;
    .locals 1

    .line 28
    sget-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->$VALUES:[Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    return-object v0
.end method
