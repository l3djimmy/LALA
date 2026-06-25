.class public final enum Lcom/itextpdf/layout/properties/CaptionSide;
.super Ljava/lang/Enum;
.source "CaptionSide.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/CaptionSide;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/CaptionSide;

.field public static final enum BOTTOM:Lcom/itextpdf/layout/properties/CaptionSide;

.field public static final enum TOP:Lcom/itextpdf/layout/properties/CaptionSide;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 30
    new-instance v0, Lcom/itextpdf/layout/properties/CaptionSide;

    const-string v1, "BOTTOM"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/CaptionSide;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/CaptionSide;->BOTTOM:Lcom/itextpdf/layout/properties/CaptionSide;

    .line 31
    new-instance v0, Lcom/itextpdf/layout/properties/CaptionSide;

    const-string v1, "TOP"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/CaptionSide;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/CaptionSide;->TOP:Lcom/itextpdf/layout/properties/CaptionSide;

    .line 29
    sget-object v0, Lcom/itextpdf/layout/properties/CaptionSide;->BOTTOM:Lcom/itextpdf/layout/properties/CaptionSide;

    sget-object v1, Lcom/itextpdf/layout/properties/CaptionSide;->TOP:Lcom/itextpdf/layout/properties/CaptionSide;

    filled-new-array {v0, v1}, [Lcom/itextpdf/layout/properties/CaptionSide;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/CaptionSide;->$VALUES:[Lcom/itextpdf/layout/properties/CaptionSide;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/CaptionSide;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 29
    const-class v0, Lcom/itextpdf/layout/properties/CaptionSide;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/CaptionSide;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/CaptionSide;
    .locals 1

    .line 29
    sget-object v0, Lcom/itextpdf/layout/properties/CaptionSide;->$VALUES:[Lcom/itextpdf/layout/properties/CaptionSide;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/CaptionSide;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/CaptionSide;

    return-object v0
.end method
