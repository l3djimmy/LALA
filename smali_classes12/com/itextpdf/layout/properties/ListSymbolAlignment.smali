.class public final enum Lcom/itextpdf/layout/properties/ListSymbolAlignment;
.super Ljava/lang/Enum;
.source "ListSymbolAlignment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/ListSymbolAlignment;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/ListSymbolAlignment;

.field public static final enum LEFT:Lcom/itextpdf/layout/properties/ListSymbolAlignment;

.field public static final enum RIGHT:Lcom/itextpdf/layout/properties/ListSymbolAlignment;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 39
    new-instance v0, Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    const-string v1, "RIGHT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListSymbolAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListSymbolAlignment;->RIGHT:Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    .line 40
    new-instance v0, Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    const-string v1, "LEFT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListSymbolAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListSymbolAlignment;->LEFT:Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    .line 38
    sget-object v0, Lcom/itextpdf/layout/properties/ListSymbolAlignment;->RIGHT:Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    sget-object v1, Lcom/itextpdf/layout/properties/ListSymbolAlignment;->LEFT:Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    filled-new-array {v0, v1}, [Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/ListSymbolAlignment;->$VALUES:[Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/ListSymbolAlignment;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 38
    const-class v0, Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/ListSymbolAlignment;
    .locals 1

    .line 38
    sget-object v0, Lcom/itextpdf/layout/properties/ListSymbolAlignment;->$VALUES:[Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/ListSymbolAlignment;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    return-object v0
.end method
