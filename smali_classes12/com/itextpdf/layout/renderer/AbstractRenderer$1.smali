.class synthetic Lcom/itextpdf/layout/renderer/AbstractRenderer$1;
.super Ljava/lang/Object;
.source "AbstractRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/AbstractRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$itextpdf$layout$properties$HorizontalAlignment:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 2230
    invoke-static {}, Lcom/itextpdf/layout/properties/HorizontalAlignment;->values()[Lcom/itextpdf/layout/properties/HorizontalAlignment;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/itextpdf/layout/renderer/AbstractRenderer$1;->$SwitchMap$com$itextpdf$layout$properties$HorizontalAlignment:[I

    :try_start_0
    sget-object v0, Lcom/itextpdf/layout/renderer/AbstractRenderer$1;->$SwitchMap$com$itextpdf$layout$properties$HorizontalAlignment:[I

    sget-object v1, Lcom/itextpdf/layout/properties/HorizontalAlignment;->RIGHT:Lcom/itextpdf/layout/properties/HorizontalAlignment;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/HorizontalAlignment;->ordinal()I

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
    sget-object v0, Lcom/itextpdf/layout/renderer/AbstractRenderer$1;->$SwitchMap$com$itextpdf$layout$properties$HorizontalAlignment:[I

    sget-object v1, Lcom/itextpdf/layout/properties/HorizontalAlignment;->CENTER:Lcom/itextpdf/layout/properties/HorizontalAlignment;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/HorizontalAlignment;->ordinal()I

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
