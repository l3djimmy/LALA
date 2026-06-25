.class public final enum Lcom/itextpdf/layout/properties/RenderingMode;
.super Ljava/lang/Enum;
.source "RenderingMode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/RenderingMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/RenderingMode;

.field public static final enum DEFAULT_LAYOUT_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

.field public static final enum HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 34
    new-instance v0, Lcom/itextpdf/layout/properties/RenderingMode;

    const-string v1, "DEFAULT_LAYOUT_MODE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/RenderingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/RenderingMode;->DEFAULT_LAYOUT_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    .line 39
    new-instance v0, Lcom/itextpdf/layout/properties/RenderingMode;

    const-string v1, "HTML_MODE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/RenderingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/RenderingMode;->HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    .line 29
    sget-object v0, Lcom/itextpdf/layout/properties/RenderingMode;->DEFAULT_LAYOUT_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    sget-object v1, Lcom/itextpdf/layout/properties/RenderingMode;->HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    filled-new-array {v0, v1}, [Lcom/itextpdf/layout/properties/RenderingMode;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/RenderingMode;->$VALUES:[Lcom/itextpdf/layout/properties/RenderingMode;

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

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/RenderingMode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 29
    const-class v0, Lcom/itextpdf/layout/properties/RenderingMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/RenderingMode;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/RenderingMode;
    .locals 1

    .line 29
    sget-object v0, Lcom/itextpdf/layout/properties/RenderingMode;->$VALUES:[Lcom/itextpdf/layout/properties/RenderingMode;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/RenderingMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/RenderingMode;

    return-object v0
.end method
