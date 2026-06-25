.class public final enum Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;
.super Ljava/lang/Enum;
.source "EventConfirmationType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

.field public static final enum ON_CLOSE:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

.field public static final enum ON_DEMAND:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

.field public static final enum UNCONFIRMABLE:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 37
    new-instance v0, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    const-string v1, "ON_DEMAND"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;->ON_DEMAND:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    .line 42
    new-instance v0, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    const-string v1, "ON_CLOSE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;->ON_CLOSE:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    .line 46
    new-instance v0, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    const-string v1, "UNCONFIRMABLE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;->UNCONFIRMABLE:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    .line 32
    sget-object v0, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;->ON_DEMAND:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    sget-object v1, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;->ON_CLOSE:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    sget-object v2, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;->UNCONFIRMABLE:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    filled-new-array {v0, v1, v2}, [Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;->$VALUES:[Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 32
    const-class v0, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;
    .locals 1

    .line 32
    sget-object v0, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;->$VALUES:[Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    invoke-virtual {v0}, [Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    return-object v0
.end method
