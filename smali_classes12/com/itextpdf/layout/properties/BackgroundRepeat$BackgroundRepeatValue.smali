.class public final enum Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;
.super Ljava/lang/Enum;
.source "BackgroundRepeat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/properties/BackgroundRepeat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BackgroundRepeatValue"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

.field public static final enum NO_REPEAT:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

.field public static final enum REPEAT:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

.field public static final enum ROUND:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

.field public static final enum SPACE:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 190
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    const-string v1, "NO_REPEAT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->NO_REPEAT:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    .line 195
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    const-string v1, "REPEAT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->REPEAT:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    .line 202
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    const-string v1, "ROUND"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->ROUND:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    .line 208
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    const-string v1, "SPACE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->SPACE:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    .line 185
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->NO_REPEAT:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    sget-object v1, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->REPEAT:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    sget-object v2, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->ROUND:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    sget-object v3, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->SPACE:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    filled-new-array {v0, v1, v2, v3}, [Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->$VALUES:[Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 185
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 185
    const-class v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;
    .locals 1

    .line 185
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->$VALUES:[Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    return-object v0
.end method
