.class synthetic Lcom/itextpdf/layout/renderer/BlockRenderer$1;
.super Ljava/lang/Object;
.source "BlockRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/BlockRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$itextpdf$layout$properties$VerticalAlignment:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 727
    invoke-static {}, Lcom/itextpdf/layout/properties/VerticalAlignment;->values()[Lcom/itextpdf/layout/properties/VerticalAlignment;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/itextpdf/layout/renderer/BlockRenderer$1;->$SwitchMap$com$itextpdf$layout$properties$VerticalAlignment:[I

    :try_start_0
    sget-object v0, Lcom/itextpdf/layout/renderer/BlockRenderer$1;->$SwitchMap$com$itextpdf$layout$properties$VerticalAlignment:[I

    sget-object v1, Lcom/itextpdf/layout/properties/VerticalAlignment;->BOTTOM:Lcom/itextpdf/layout/properties/VerticalAlignment;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/VerticalAlignment;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    :try_start_1
    sget-object v0, Lcom/itextpdf/layout/renderer/BlockRenderer$1;->$SwitchMap$com$itextpdf$layout$properties$VerticalAlignment:[I

    sget-object v1, Lcom/itextpdf/layout/properties/VerticalAlignment;->MIDDLE:Lcom/itextpdf/layout/properties/VerticalAlignment;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/VerticalAlignment;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    :goto_1
    return-void
.end method
