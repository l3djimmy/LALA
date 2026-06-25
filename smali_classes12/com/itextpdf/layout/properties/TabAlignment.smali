.class public final enum Lcom/itextpdf/layout/properties/TabAlignment;
.super Ljava/lang/Enum;
.source "TabAlignment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/TabAlignment;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/TabAlignment;

.field public static final enum ANCHOR:Lcom/itextpdf/layout/properties/TabAlignment;

.field public static final enum CENTER:Lcom/itextpdf/layout/properties/TabAlignment;

.field public static final enum LEFT:Lcom/itextpdf/layout/properties/TabAlignment;

.field public static final enum RIGHT:Lcom/itextpdf/layout/properties/TabAlignment;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 30
    new-instance v0, Lcom/itextpdf/layout/properties/TabAlignment;

    const-string v1, "LEFT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/TabAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/TabAlignment;->LEFT:Lcom/itextpdf/layout/properties/TabAlignment;

    .line 31
    new-instance v0, Lcom/itextpdf/layout/properties/TabAlignment;

    const-string v1, "RIGHT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/TabAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/TabAlignment;->RIGHT:Lcom/itextpdf/layout/properties/TabAlignment;

    .line 32
    new-instance v0, Lcom/itextpdf/layout/properties/TabAlignment;

    const-string v1, "CENTER"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/TabAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/TabAlignment;->CENTER:Lcom/itextpdf/layout/properties/TabAlignment;

    .line 33
    new-instance v0, Lcom/itextpdf/layout/properties/TabAlignment;

    const-string v1, "ANCHOR"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/TabAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/TabAlignment;->ANCHOR:Lcom/itextpdf/layout/properties/TabAlignment;

    .line 29
    sget-object v0, Lcom/itextpdf/layout/properties/TabAlignment;->LEFT:Lcom/itextpdf/layout/properties/TabAlignment;

    sget-object v1, Lcom/itextpdf/layout/properties/TabAlignment;->RIGHT:Lcom/itextpdf/layout/properties/TabAlignment;

    sget-object v2, Lcom/itextpdf/layout/properties/TabAlignment;->CENTER:Lcom/itextpdf/layout/properties/TabAlignment;

    sget-object v3, Lcom/itextpdf/layout/properties/TabAlignment;->ANCHOR:Lcom/itextpdf/layout/properties/TabAlignment;

    filled-new-array {v0, v1, v2, v3}, [Lcom/itextpdf/layout/properties/TabAlignment;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/TabAlignment;->$VALUES:[Lcom/itextpdf/layout/properties/TabAlignment;

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

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/TabAlignment;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 29
    const-class v0, Lcom/itextpdf/layout/properties/TabAlignment;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/TabAlignment;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/TabAlignment;
    .locals 1

    .line 29
    sget-object v0, Lcom/itextpdf/layout/properties/TabAlignment;->$VALUES:[Lcom/itextpdf/layout/properties/TabAlignment;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/TabAlignment;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/TabAlignment;

    return-object v0
.end method
