.class public final enum Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;
.super Ljava/lang/Enum;
.source "PlaceHolderTextUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/commons/utils/PlaceHolderTextUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PlaceHolderTextBy"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;

.field public static final enum CHARACTERS:Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;

.field public static final enum WORDS:Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 548
    new-instance v0, Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;

    const-string v1, "WORDS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;->WORDS:Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;

    .line 549
    new-instance v0, Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;

    const-string v1, "CHARACTERS"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;->CHARACTERS:Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;

    .line 547
    sget-object v0, Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;->WORDS:Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;

    sget-object v1, Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;->CHARACTERS:Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;

    filled-new-array {v0, v1}, [Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;->$VALUES:[Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 547
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 547
    const-class v0, Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;
    .locals 1

    .line 547
    sget-object v0, Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;->$VALUES:[Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;

    invoke-virtual {v0}, [Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/commons/utils/PlaceHolderTextUtil$PlaceHolderTextBy;

    return-object v0
.end method
