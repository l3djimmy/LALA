.class public final enum Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;
.super Ljava/lang/Enum;
.source "GradientColorStop.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "OffsetType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

.field public static final enum ABSOLUTE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

.field public static final enum AUTO:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

.field public static final enum RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 214
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    const-string v1, "ABSOLUTE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->ABSOLUTE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    .line 222
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    const-string v1, "AUTO"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->AUTO:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    .line 227
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    const-string v1, "RELATIVE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    .line 210
    sget-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->ABSOLUTE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    sget-object v1, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->AUTO:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    sget-object v2, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    filled-new-array {v0, v1, v2}, [Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->$VALUES:[Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 210
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 210
    const-class v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;
    .locals 1

    .line 210
    sget-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->$VALUES:[Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    return-object v0
.end method
