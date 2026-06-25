.class public final enum Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;
.super Ljava/lang/Enum;
.source "BackgroundPosition.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/properties/BackgroundPosition;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PositionX"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

.field public static final enum CENTER:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

.field public static final enum LEFT:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

.field public static final enum RIGHT:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 246
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

    const-string v1, "LEFT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;->LEFT:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

    .line 247
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

    const-string v1, "RIGHT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;->RIGHT:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

    .line 248
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

    const-string v1, "CENTER"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;->CENTER:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

    .line 245
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;->LEFT:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

    sget-object v1, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;->RIGHT:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

    sget-object v2, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;->CENTER:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

    filled-new-array {v0, v1, v2}, [Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;->$VALUES:[Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 245
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 245
    const-class v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;
    .locals 1

    .line 245
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;->$VALUES:[Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/BackgroundPosition$PositionX;

    return-object v0
.end method
