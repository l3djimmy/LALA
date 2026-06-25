.class public final enum Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;
.super Ljava/lang/Enum;
.source "FlexWrapPropertyValue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

.field public static final enum NOWRAP:Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

.field public static final enum WRAP:Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

.field public static final enum WRAP_REVERSE:Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 29
    new-instance v0, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    const-string v1, "NOWRAP"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;->NOWRAP:Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    .line 30
    new-instance v0, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    const-string v1, "WRAP"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;->WRAP:Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    .line 31
    new-instance v0, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    const-string v1, "WRAP_REVERSE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;->WRAP_REVERSE:Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    .line 28
    sget-object v0, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;->NOWRAP:Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    sget-object v1, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;->WRAP:Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    sget-object v2, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;->WRAP_REVERSE:Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    filled-new-array {v0, v1, v2}, [Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;->$VALUES:[Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

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

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 28
    const-class v0, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;
    .locals 1

    .line 28
    sget-object v0, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;->$VALUES:[Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    return-object v0
.end method
