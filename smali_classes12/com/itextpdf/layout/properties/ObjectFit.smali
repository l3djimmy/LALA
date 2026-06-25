.class public final enum Lcom/itextpdf/layout/properties/ObjectFit;
.super Ljava/lang/Enum;
.source "ObjectFit.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/ObjectFit;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/ObjectFit;

.field public static final enum CONTAIN:Lcom/itextpdf/layout/properties/ObjectFit;

.field public static final enum COVER:Lcom/itextpdf/layout/properties/ObjectFit;

.field public static final enum FILL:Lcom/itextpdf/layout/properties/ObjectFit;

.field public static final enum NONE:Lcom/itextpdf/layout/properties/ObjectFit;

.field public static final enum SCALE_DOWN:Lcom/itextpdf/layout/properties/ObjectFit;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 34
    new-instance v0, Lcom/itextpdf/layout/properties/ObjectFit;

    const-string v1, "FILL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ObjectFit;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ObjectFit;->FILL:Lcom/itextpdf/layout/properties/ObjectFit;

    .line 40
    new-instance v0, Lcom/itextpdf/layout/properties/ObjectFit;

    const-string v1, "CONTAIN"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ObjectFit;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ObjectFit;->CONTAIN:Lcom/itextpdf/layout/properties/ObjectFit;

    .line 45
    new-instance v0, Lcom/itextpdf/layout/properties/ObjectFit;

    const-string v1, "COVER"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ObjectFit;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ObjectFit;->COVER:Lcom/itextpdf/layout/properties/ObjectFit;

    .line 52
    new-instance v0, Lcom/itextpdf/layout/properties/ObjectFit;

    const-string v1, "SCALE_DOWN"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ObjectFit;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ObjectFit;->SCALE_DOWN:Lcom/itextpdf/layout/properties/ObjectFit;

    .line 58
    new-instance v0, Lcom/itextpdf/layout/properties/ObjectFit;

    const-string v1, "NONE"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ObjectFit;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ObjectFit;->NONE:Lcom/itextpdf/layout/properties/ObjectFit;

    .line 29
    sget-object v0, Lcom/itextpdf/layout/properties/ObjectFit;->FILL:Lcom/itextpdf/layout/properties/ObjectFit;

    sget-object v1, Lcom/itextpdf/layout/properties/ObjectFit;->CONTAIN:Lcom/itextpdf/layout/properties/ObjectFit;

    sget-object v2, Lcom/itextpdf/layout/properties/ObjectFit;->COVER:Lcom/itextpdf/layout/properties/ObjectFit;

    sget-object v3, Lcom/itextpdf/layout/properties/ObjectFit;->SCALE_DOWN:Lcom/itextpdf/layout/properties/ObjectFit;

    sget-object v4, Lcom/itextpdf/layout/properties/ObjectFit;->NONE:Lcom/itextpdf/layout/properties/ObjectFit;

    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/itextpdf/layout/properties/ObjectFit;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/ObjectFit;->$VALUES:[Lcom/itextpdf/layout/properties/ObjectFit;

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

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/ObjectFit;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 29
    const-class v0, Lcom/itextpdf/layout/properties/ObjectFit;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/ObjectFit;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/ObjectFit;
    .locals 1

    .line 29
    sget-object v0, Lcom/itextpdf/layout/properties/ObjectFit;->$VALUES:[Lcom/itextpdf/layout/properties/ObjectFit;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/ObjectFit;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/ObjectFit;

    return-object v0
.end method
