.class public final enum Lcom/itextpdf/layout/properties/BackgroundBox;
.super Ljava/lang/Enum;
.source "BackgroundBox.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/BackgroundBox;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/BackgroundBox;

.field public static final enum BORDER_BOX:Lcom/itextpdf/layout/properties/BackgroundBox;

.field public static final enum CONTENT_BOX:Lcom/itextpdf/layout/properties/BackgroundBox;

.field public static final enum PADDING_BOX:Lcom/itextpdf/layout/properties/BackgroundBox;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 29
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundBox;

    const-string v1, "BORDER_BOX"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/BackgroundBox;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundBox;->BORDER_BOX:Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 30
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundBox;

    const-string v1, "PADDING_BOX"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/BackgroundBox;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundBox;->PADDING_BOX:Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 31
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundBox;

    const-string v1, "CONTENT_BOX"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/BackgroundBox;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundBox;->CONTENT_BOX:Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 28
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundBox;->BORDER_BOX:Lcom/itextpdf/layout/properties/BackgroundBox;

    sget-object v1, Lcom/itextpdf/layout/properties/BackgroundBox;->PADDING_BOX:Lcom/itextpdf/layout/properties/BackgroundBox;

    sget-object v2, Lcom/itextpdf/layout/properties/BackgroundBox;->CONTENT_BOX:Lcom/itextpdf/layout/properties/BackgroundBox;

    filled-new-array {v0, v1, v2}, [Lcom/itextpdf/layout/properties/BackgroundBox;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundBox;->$VALUES:[Lcom/itextpdf/layout/properties/BackgroundBox;

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

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/BackgroundBox;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 28
    const-class v0, Lcom/itextpdf/layout/properties/BackgroundBox;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/BackgroundBox;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/BackgroundBox;
    .locals 1

    .line 28
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundBox;->$VALUES:[Lcom/itextpdf/layout/properties/BackgroundBox;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/BackgroundBox;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/BackgroundBox;

    return-object v0
.end method
