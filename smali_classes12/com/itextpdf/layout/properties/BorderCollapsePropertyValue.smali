.class public final enum Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;
.super Ljava/lang/Enum;
.source "BorderCollapsePropertyValue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

.field public static final enum COLLAPSE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

.field public static final enum SEPARATE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 29
    new-instance v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    const-string v1, "COLLAPSE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->COLLAPSE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    .line 30
    new-instance v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    const-string v1, "SEPARATE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->SEPARATE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    .line 28
    sget-object v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->COLLAPSE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    sget-object v1, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->SEPARATE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    filled-new-array {v0, v1}, [Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->$VALUES:[Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

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

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 28
    const-class v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;
    .locals 1

    .line 28
    sget-object v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->$VALUES:[Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    return-object v0
.end method
