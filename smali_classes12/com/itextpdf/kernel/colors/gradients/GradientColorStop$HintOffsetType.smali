.class public final enum Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;
.super Ljava/lang/Enum;
.source "GradientColorStop.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "HintOffsetType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

.field public static final enum ABSOLUTE_ON_GRADIENT:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

.field public static final enum NONE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

.field public static final enum RELATIVE_BETWEEN_COLORS:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

.field public static final enum RELATIVE_ON_GRADIENT:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 237
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    const-string v1, "ABSOLUTE_ON_GRADIENT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->ABSOLUTE_ON_GRADIENT:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    .line 242
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    const-string v1, "RELATIVE_ON_GRADIENT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->RELATIVE_ON_GRADIENT:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    .line 247
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    const-string v1, "RELATIVE_BETWEEN_COLORS"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->RELATIVE_BETWEEN_COLORS:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    .line 251
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    const-string v1, "NONE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->NONE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    .line 233
    sget-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->ABSOLUTE_ON_GRADIENT:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    sget-object v1, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->RELATIVE_ON_GRADIENT:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    sget-object v2, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->RELATIVE_BETWEEN_COLORS:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    sget-object v3, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->NONE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    filled-new-array {v0, v1, v2, v3}, [Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->$VALUES:[Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 233
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 233
    const-class v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;
    .locals 1

    .line 233
    sget-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->$VALUES:[Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    return-object v0
.end method
