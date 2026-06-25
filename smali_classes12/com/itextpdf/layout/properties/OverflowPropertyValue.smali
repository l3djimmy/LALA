.class public final enum Lcom/itextpdf/layout/properties/OverflowPropertyValue;
.super Ljava/lang/Enum;
.source "OverflowPropertyValue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/OverflowPropertyValue;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/OverflowPropertyValue;

.field public static final enum FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

.field public static final enum HIDDEN:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

.field public static final enum VISIBLE:Lcom/itextpdf/layout/properties/OverflowPropertyValue;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 30
    new-instance v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    const-string v1, "FIT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/OverflowPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 31
    new-instance v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    const-string v1, "VISIBLE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/OverflowPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->VISIBLE:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 32
    new-instance v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    const-string v1, "HIDDEN"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/OverflowPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->HIDDEN:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 29
    sget-object v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    sget-object v1, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->VISIBLE:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    sget-object v2, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->HIDDEN:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    filled-new-array {v0, v1, v2}, [Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->$VALUES:[Lcom/itextpdf/layout/properties/OverflowPropertyValue;

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

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 29
    const-class v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .locals 1

    .line 29
    sget-object v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->$VALUES:[Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/OverflowPropertyValue;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    return-object v0
.end method
