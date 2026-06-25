.class public final enum Lcom/itextpdf/layout/properties/AreaBreakType;
.super Ljava/lang/Enum;
.source "AreaBreakType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/AreaBreakType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/AreaBreakType;

.field public static final enum LAST_PAGE:Lcom/itextpdf/layout/properties/AreaBreakType;

.field public static final enum NEXT_AREA:Lcom/itextpdf/layout/properties/AreaBreakType;

.field public static final enum NEXT_PAGE:Lcom/itextpdf/layout/properties/AreaBreakType;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 30
    new-instance v0, Lcom/itextpdf/layout/properties/AreaBreakType;

    const-string v1, "NEXT_AREA"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/AreaBreakType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/AreaBreakType;->NEXT_AREA:Lcom/itextpdf/layout/properties/AreaBreakType;

    .line 31
    new-instance v0, Lcom/itextpdf/layout/properties/AreaBreakType;

    const-string v1, "NEXT_PAGE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/AreaBreakType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/AreaBreakType;->NEXT_PAGE:Lcom/itextpdf/layout/properties/AreaBreakType;

    .line 32
    new-instance v0, Lcom/itextpdf/layout/properties/AreaBreakType;

    const-string v1, "LAST_PAGE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/AreaBreakType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/AreaBreakType;->LAST_PAGE:Lcom/itextpdf/layout/properties/AreaBreakType;

    .line 29
    sget-object v0, Lcom/itextpdf/layout/properties/AreaBreakType;->NEXT_AREA:Lcom/itextpdf/layout/properties/AreaBreakType;

    sget-object v1, Lcom/itextpdf/layout/properties/AreaBreakType;->NEXT_PAGE:Lcom/itextpdf/layout/properties/AreaBreakType;

    sget-object v2, Lcom/itextpdf/layout/properties/AreaBreakType;->LAST_PAGE:Lcom/itextpdf/layout/properties/AreaBreakType;

    filled-new-array {v0, v1, v2}, [Lcom/itextpdf/layout/properties/AreaBreakType;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/AreaBreakType;->$VALUES:[Lcom/itextpdf/layout/properties/AreaBreakType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/AreaBreakType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 29
    const-class v0, Lcom/itextpdf/layout/properties/AreaBreakType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/AreaBreakType;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/AreaBreakType;
    .locals 1

    .line 29
    sget-object v0, Lcom/itextpdf/layout/properties/AreaBreakType;->$VALUES:[Lcom/itextpdf/layout/properties/AreaBreakType;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/AreaBreakType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/AreaBreakType;

    return-object v0
.end method
