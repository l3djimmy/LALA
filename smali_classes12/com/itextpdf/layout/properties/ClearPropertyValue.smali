.class public final enum Lcom/itextpdf/layout/properties/ClearPropertyValue;
.super Ljava/lang/Enum;
.source "ClearPropertyValue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/ClearPropertyValue;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/ClearPropertyValue;

.field public static final enum BOTH:Lcom/itextpdf/layout/properties/ClearPropertyValue;

.field public static final enum LEFT:Lcom/itextpdf/layout/properties/ClearPropertyValue;

.field public static final enum NONE:Lcom/itextpdf/layout/properties/ClearPropertyValue;

.field public static final enum RIGHT:Lcom/itextpdf/layout/properties/ClearPropertyValue;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 29
    new-instance v0, Lcom/itextpdf/layout/properties/ClearPropertyValue;

    const-string v1, "LEFT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ClearPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ClearPropertyValue;->LEFT:Lcom/itextpdf/layout/properties/ClearPropertyValue;

    .line 30
    new-instance v0, Lcom/itextpdf/layout/properties/ClearPropertyValue;

    const-string v1, "NONE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ClearPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ClearPropertyValue;->NONE:Lcom/itextpdf/layout/properties/ClearPropertyValue;

    .line 31
    new-instance v0, Lcom/itextpdf/layout/properties/ClearPropertyValue;

    const-string v1, "RIGHT"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ClearPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ClearPropertyValue;->RIGHT:Lcom/itextpdf/layout/properties/ClearPropertyValue;

    .line 32
    new-instance v0, Lcom/itextpdf/layout/properties/ClearPropertyValue;

    const-string v1, "BOTH"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ClearPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ClearPropertyValue;->BOTH:Lcom/itextpdf/layout/properties/ClearPropertyValue;

    .line 28
    sget-object v0, Lcom/itextpdf/layout/properties/ClearPropertyValue;->LEFT:Lcom/itextpdf/layout/properties/ClearPropertyValue;

    sget-object v1, Lcom/itextpdf/layout/properties/ClearPropertyValue;->NONE:Lcom/itextpdf/layout/properties/ClearPropertyValue;

    sget-object v2, Lcom/itextpdf/layout/properties/ClearPropertyValue;->RIGHT:Lcom/itextpdf/layout/properties/ClearPropertyValue;

    sget-object v3, Lcom/itextpdf/layout/properties/ClearPropertyValue;->BOTH:Lcom/itextpdf/layout/properties/ClearPropertyValue;

    filled-new-array {v0, v1, v2, v3}, [Lcom/itextpdf/layout/properties/ClearPropertyValue;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/ClearPropertyValue;->$VALUES:[Lcom/itextpdf/layout/properties/ClearPropertyValue;

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

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/ClearPropertyValue;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 28
    const-class v0, Lcom/itextpdf/layout/properties/ClearPropertyValue;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/ClearPropertyValue;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/ClearPropertyValue;
    .locals 1

    .line 28
    sget-object v0, Lcom/itextpdf/layout/properties/ClearPropertyValue;->$VALUES:[Lcom/itextpdf/layout/properties/ClearPropertyValue;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/ClearPropertyValue;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/ClearPropertyValue;

    return-object v0
.end method
