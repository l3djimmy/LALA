.class public final enum Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;
.super Ljava/lang/Enum;
.source "OverflowWrapPropertyValue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

.field public static final enum ANYWHERE:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

.field public static final enum BREAK_WORD:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

.field public static final enum NORMAL:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 37
    new-instance v0, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    const-string v1, "ANYWHERE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->ANYWHERE:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    .line 38
    new-instance v0, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    const-string v1, "BREAK_WORD"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->BREAK_WORD:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    .line 39
    new-instance v0, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    const-string v1, "NORMAL"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->NORMAL:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    .line 36
    sget-object v0, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->ANYWHERE:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    sget-object v1, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->BREAK_WORD:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    sget-object v2, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->NORMAL:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    filled-new-array {v0, v1, v2}, [Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->$VALUES:[Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 36
    const-class v0, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;
    .locals 1

    .line 36
    sget-object v0, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->$VALUES:[Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    return-object v0
.end method
