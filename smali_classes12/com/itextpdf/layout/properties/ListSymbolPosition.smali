.class public final enum Lcom/itextpdf/layout/properties/ListSymbolPosition;
.super Ljava/lang/Enum;
.source "ListSymbolPosition.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/ListSymbolPosition;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/ListSymbolPosition;

.field public static final enum DEFAULT:Lcom/itextpdf/layout/properties/ListSymbolPosition;

.field public static final enum INSIDE:Lcom/itextpdf/layout/properties/ListSymbolPosition;

.field public static final enum OUTSIDE:Lcom/itextpdf/layout/properties/ListSymbolPosition;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 29
    new-instance v0, Lcom/itextpdf/layout/properties/ListSymbolPosition;

    const-string v1, "DEFAULT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListSymbolPosition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListSymbolPosition;->DEFAULT:Lcom/itextpdf/layout/properties/ListSymbolPosition;

    .line 30
    new-instance v0, Lcom/itextpdf/layout/properties/ListSymbolPosition;

    const-string v1, "INSIDE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListSymbolPosition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListSymbolPosition;->INSIDE:Lcom/itextpdf/layout/properties/ListSymbolPosition;

    .line 31
    new-instance v0, Lcom/itextpdf/layout/properties/ListSymbolPosition;

    const-string v1, "OUTSIDE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListSymbolPosition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListSymbolPosition;->OUTSIDE:Lcom/itextpdf/layout/properties/ListSymbolPosition;

    .line 28
    sget-object v0, Lcom/itextpdf/layout/properties/ListSymbolPosition;->DEFAULT:Lcom/itextpdf/layout/properties/ListSymbolPosition;

    sget-object v1, Lcom/itextpdf/layout/properties/ListSymbolPosition;->INSIDE:Lcom/itextpdf/layout/properties/ListSymbolPosition;

    sget-object v2, Lcom/itextpdf/layout/properties/ListSymbolPosition;->OUTSIDE:Lcom/itextpdf/layout/properties/ListSymbolPosition;

    filled-new-array {v0, v1, v2}, [Lcom/itextpdf/layout/properties/ListSymbolPosition;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/ListSymbolPosition;->$VALUES:[Lcom/itextpdf/layout/properties/ListSymbolPosition;

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

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/ListSymbolPosition;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 28
    const-class v0, Lcom/itextpdf/layout/properties/ListSymbolPosition;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/ListSymbolPosition;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/ListSymbolPosition;
    .locals 1

    .line 28
    sget-object v0, Lcom/itextpdf/layout/properties/ListSymbolPosition;->$VALUES:[Lcom/itextpdf/layout/properties/ListSymbolPosition;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/ListSymbolPosition;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/ListSymbolPosition;

    return-object v0
.end method
