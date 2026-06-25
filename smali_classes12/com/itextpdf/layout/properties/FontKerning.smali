.class public final enum Lcom/itextpdf/layout/properties/FontKerning;
.super Ljava/lang/Enum;
.source "FontKerning.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/FontKerning;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/FontKerning;

.field public static final enum NO:Lcom/itextpdf/layout/properties/FontKerning;

.field public static final enum YES:Lcom/itextpdf/layout/properties/FontKerning;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 34
    new-instance v0, Lcom/itextpdf/layout/properties/FontKerning;

    const-string v1, "YES"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/FontKerning;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/FontKerning;->YES:Lcom/itextpdf/layout/properties/FontKerning;

    .line 35
    new-instance v0, Lcom/itextpdf/layout/properties/FontKerning;

    const-string v1, "NO"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/FontKerning;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/FontKerning;->NO:Lcom/itextpdf/layout/properties/FontKerning;

    .line 33
    sget-object v0, Lcom/itextpdf/layout/properties/FontKerning;->YES:Lcom/itextpdf/layout/properties/FontKerning;

    sget-object v1, Lcom/itextpdf/layout/properties/FontKerning;->NO:Lcom/itextpdf/layout/properties/FontKerning;

    filled-new-array {v0, v1}, [Lcom/itextpdf/layout/properties/FontKerning;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/FontKerning;->$VALUES:[Lcom/itextpdf/layout/properties/FontKerning;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/FontKerning;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 33
    const-class v0, Lcom/itextpdf/layout/properties/FontKerning;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/FontKerning;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/FontKerning;
    .locals 1

    .line 33
    sget-object v0, Lcom/itextpdf/layout/properties/FontKerning;->$VALUES:[Lcom/itextpdf/layout/properties/FontKerning;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/FontKerning;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/FontKerning;

    return-object v0
.end method
