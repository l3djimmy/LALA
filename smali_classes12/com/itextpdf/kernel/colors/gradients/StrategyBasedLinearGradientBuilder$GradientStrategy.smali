.class public final enum Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;
.super Ljava/lang/Enum;
.source "StrategyBasedLinearGradientBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "GradientStrategy"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

.field public static final enum TO_BOTTOM:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

.field public static final enum TO_BOTTOM_LEFT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

.field public static final enum TO_BOTTOM_RIGHT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

.field public static final enum TO_LEFT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

.field public static final enum TO_RIGHT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

.field public static final enum TO_TOP:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

.field public static final enum TO_TOP_LEFT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

.field public static final enum TO_TOP_RIGHT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 193
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    const-string v1, "TO_BOTTOM"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_BOTTOM:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    .line 199
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    const-string v1, "TO_BOTTOM_LEFT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_BOTTOM_LEFT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    .line 205
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    const-string v1, "TO_BOTTOM_RIGHT"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_BOTTOM_RIGHT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    .line 209
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    const-string v1, "TO_LEFT"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_LEFT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    .line 213
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    const-string v1, "TO_RIGHT"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_RIGHT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    .line 217
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    const-string v1, "TO_TOP"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_TOP:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    .line 223
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    const-string v1, "TO_TOP_LEFT"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_TOP_LEFT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    .line 229
    new-instance v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    const-string v1, "TO_TOP_RIGHT"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_TOP_RIGHT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    .line 189
    sget-object v3, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_BOTTOM:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    sget-object v4, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_BOTTOM_LEFT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    sget-object v5, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_BOTTOM_RIGHT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    sget-object v6, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_LEFT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    sget-object v7, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_RIGHT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    sget-object v8, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_TOP:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    sget-object v9, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_TOP_LEFT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    sget-object v10, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_TOP_RIGHT:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    filled-new-array/range {v3 .. v10}, [Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->$VALUES:[Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 189
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 189
    const-class v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;
    .locals 1

    .line 189
    sget-object v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->$VALUES:[Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    return-object v0
.end method
