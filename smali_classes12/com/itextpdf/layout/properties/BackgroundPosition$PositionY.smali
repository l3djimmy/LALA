.class public final enum Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;
.super Ljava/lang/Enum;
.source "BackgroundPosition.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/properties/BackgroundPosition;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PositionY"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

.field public static final enum BOTTOM:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

.field public static final enum CENTER:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

.field public static final enum TOP:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 255
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

    const-string v1, "TOP"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;->TOP:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

    .line 256
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

    const-string v1, "BOTTOM"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;->BOTTOM:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

    .line 257
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

    const-string v1, "CENTER"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;->CENTER:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

    .line 254
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;->TOP:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

    sget-object v1, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;->BOTTOM:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

    sget-object v2, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;->CENTER:Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

    filled-new-array {v0, v1, v2}, [Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;->$VALUES:[Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 254
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 254
    const-class v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;
    .locals 1

    .line 254
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;->$VALUES:[Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/BackgroundPosition$PositionY;

    return-object v0
.end method
