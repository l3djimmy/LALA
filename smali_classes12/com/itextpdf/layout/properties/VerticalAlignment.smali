.class public final enum Lcom/itextpdf/layout/properties/VerticalAlignment;
.super Ljava/lang/Enum;
.source "VerticalAlignment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/VerticalAlignment;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/VerticalAlignment;

.field public static final enum BOTTOM:Lcom/itextpdf/layout/properties/VerticalAlignment;

.field public static final enum MIDDLE:Lcom/itextpdf/layout/properties/VerticalAlignment;

.field public static final enum TOP:Lcom/itextpdf/layout/properties/VerticalAlignment;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 30
    new-instance v0, Lcom/itextpdf/layout/properties/VerticalAlignment;

    const-string v1, "TOP"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/VerticalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/VerticalAlignment;->TOP:Lcom/itextpdf/layout/properties/VerticalAlignment;

    .line 31
    new-instance v0, Lcom/itextpdf/layout/properties/VerticalAlignment;

    const-string v1, "MIDDLE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/VerticalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/VerticalAlignment;->MIDDLE:Lcom/itextpdf/layout/properties/VerticalAlignment;

    .line 32
    new-instance v0, Lcom/itextpdf/layout/properties/VerticalAlignment;

    const-string v1, "BOTTOM"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/VerticalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/VerticalAlignment;->BOTTOM:Lcom/itextpdf/layout/properties/VerticalAlignment;

    .line 29
    sget-object v0, Lcom/itextpdf/layout/properties/VerticalAlignment;->TOP:Lcom/itextpdf/layout/properties/VerticalAlignment;

    sget-object v1, Lcom/itextpdf/layout/properties/VerticalAlignment;->MIDDLE:Lcom/itextpdf/layout/properties/VerticalAlignment;

    sget-object v2, Lcom/itextpdf/layout/properties/VerticalAlignment;->BOTTOM:Lcom/itextpdf/layout/properties/VerticalAlignment;

    filled-new-array {v0, v1, v2}, [Lcom/itextpdf/layout/properties/VerticalAlignment;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/VerticalAlignment;->$VALUES:[Lcom/itextpdf/layout/properties/VerticalAlignment;

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

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/VerticalAlignment;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 29
    const-class v0, Lcom/itextpdf/layout/properties/VerticalAlignment;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/VerticalAlignment;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/VerticalAlignment;
    .locals 1

    .line 29
    sget-object v0, Lcom/itextpdf/layout/properties/VerticalAlignment;->$VALUES:[Lcom/itextpdf/layout/properties/VerticalAlignment;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/VerticalAlignment;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/VerticalAlignment;

    return-object v0
.end method
