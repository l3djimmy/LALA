.class public final enum Lcom/itextpdf/layout/properties/HorizontalAlignment;
.super Ljava/lang/Enum;
.source "HorizontalAlignment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/HorizontalAlignment;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/HorizontalAlignment;

.field public static final enum CENTER:Lcom/itextpdf/layout/properties/HorizontalAlignment;

.field public static final enum LEFT:Lcom/itextpdf/layout/properties/HorizontalAlignment;

.field public static final enum RIGHT:Lcom/itextpdf/layout/properties/HorizontalAlignment;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 29
    new-instance v0, Lcom/itextpdf/layout/properties/HorizontalAlignment;

    const-string v1, "LEFT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/HorizontalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/HorizontalAlignment;->LEFT:Lcom/itextpdf/layout/properties/HorizontalAlignment;

    .line 30
    new-instance v0, Lcom/itextpdf/layout/properties/HorizontalAlignment;

    const-string v1, "CENTER"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/HorizontalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/HorizontalAlignment;->CENTER:Lcom/itextpdf/layout/properties/HorizontalAlignment;

    .line 31
    new-instance v0, Lcom/itextpdf/layout/properties/HorizontalAlignment;

    const-string v1, "RIGHT"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/HorizontalAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/HorizontalAlignment;->RIGHT:Lcom/itextpdf/layout/properties/HorizontalAlignment;

    .line 28
    sget-object v0, Lcom/itextpdf/layout/properties/HorizontalAlignment;->LEFT:Lcom/itextpdf/layout/properties/HorizontalAlignment;

    sget-object v1, Lcom/itextpdf/layout/properties/HorizontalAlignment;->CENTER:Lcom/itextpdf/layout/properties/HorizontalAlignment;

    sget-object v2, Lcom/itextpdf/layout/properties/HorizontalAlignment;->RIGHT:Lcom/itextpdf/layout/properties/HorizontalAlignment;

    filled-new-array {v0, v1, v2}, [Lcom/itextpdf/layout/properties/HorizontalAlignment;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/HorizontalAlignment;->$VALUES:[Lcom/itextpdf/layout/properties/HorizontalAlignment;

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

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/HorizontalAlignment;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 28
    const-class v0, Lcom/itextpdf/layout/properties/HorizontalAlignment;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/HorizontalAlignment;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/HorizontalAlignment;
    .locals 1

    .line 28
    sget-object v0, Lcom/itextpdf/layout/properties/HorizontalAlignment;->$VALUES:[Lcom/itextpdf/layout/properties/HorizontalAlignment;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/HorizontalAlignment;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/HorizontalAlignment;

    return-object v0
.end method
