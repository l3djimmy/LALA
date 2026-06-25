.class synthetic Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;
.super Ljava/lang/Object;
.source "AccessibleAttributesApplier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$itextpdf$layout$properties$HorizontalAlignment:[I

.field static final synthetic $SwitchMap$com$itextpdf$layout$properties$ListNumberingType:[I

.field static final synthetic $SwitchMap$com$itextpdf$layout$properties$TextAlignment:[I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 552
    invoke-static {}, Lcom/itextpdf/layout/properties/ListNumberingType;->values()[Lcom/itextpdf/layout/properties/ListNumberingType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$ListNumberingType:[I

    const/4 v0, 0x1

    :try_start_0
    sget-object v1, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$ListNumberingType:[I

    sget-object v2, Lcom/itextpdf/layout/properties/ListNumberingType;->DECIMAL:Lcom/itextpdf/layout/properties/ListNumberingType;

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/ListNumberingType;->ordinal()I

    move-result v2

    aput v0, v1, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    :goto_0
    const/4 v1, 0x2

    :try_start_1
    sget-object v2, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$ListNumberingType:[I

    sget-object v3, Lcom/itextpdf/layout/properties/ListNumberingType;->DECIMAL_LEADING_ZERO:Lcom/itextpdf/layout/properties/ListNumberingType;

    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/ListNumberingType;->ordinal()I

    move-result v3

    aput v1, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v2

    :goto_1
    const/4 v2, 0x3

    :try_start_2
    sget-object v3, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$ListNumberingType:[I

    sget-object v4, Lcom/itextpdf/layout/properties/ListNumberingType;->ROMAN_UPPER:Lcom/itextpdf/layout/properties/ListNumberingType;

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/ListNumberingType;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v3

    :goto_2
    const/4 v3, 0x4

    :try_start_3
    sget-object v4, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$ListNumberingType:[I

    sget-object v5, Lcom/itextpdf/layout/properties/ListNumberingType;->ROMAN_LOWER:Lcom/itextpdf/layout/properties/ListNumberingType;

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/ListNumberingType;->ordinal()I

    move-result v5

    aput v3, v4, v5
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception v4

    :goto_3
    const/4 v4, 0x5

    :try_start_4
    sget-object v5, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$ListNumberingType:[I

    sget-object v6, Lcom/itextpdf/layout/properties/ListNumberingType;->ENGLISH_UPPER:Lcom/itextpdf/layout/properties/ListNumberingType;

    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/ListNumberingType;->ordinal()I

    move-result v6

    aput v4, v5, v6
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_4
    move-exception v5

    :goto_4
    :try_start_5
    sget-object v5, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$ListNumberingType:[I

    sget-object v6, Lcom/itextpdf/layout/properties/ListNumberingType;->GREEK_UPPER:Lcom/itextpdf/layout/properties/ListNumberingType;

    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/ListNumberingType;->ordinal()I

    move-result v6

    const/4 v7, 0x6

    aput v7, v5, v6
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_5

    :catch_5
    move-exception v5

    :goto_5
    :try_start_6
    sget-object v5, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$ListNumberingType:[I

    sget-object v6, Lcom/itextpdf/layout/properties/ListNumberingType;->ENGLISH_LOWER:Lcom/itextpdf/layout/properties/ListNumberingType;

    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/ListNumberingType;->ordinal()I

    move-result v6

    const/4 v7, 0x7

    aput v7, v5, v6
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_6

    :catch_6
    move-exception v5

    :goto_6
    :try_start_7
    sget-object v5, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$ListNumberingType:[I

    sget-object v6, Lcom/itextpdf/layout/properties/ListNumberingType;->GREEK_LOWER:Lcom/itextpdf/layout/properties/ListNumberingType;

    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/ListNumberingType;->ordinal()I

    move-result v6

    const/16 v7, 0x8

    aput v7, v5, v6
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    goto :goto_7

    :catch_7
    move-exception v5

    .line 505
    :goto_7
    invoke-static {}, Lcom/itextpdf/layout/properties/HorizontalAlignment;->values()[Lcom/itextpdf/layout/properties/HorizontalAlignment;

    move-result-object v5

    array-length v5, v5

    new-array v5, v5, [I

    sput-object v5, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$HorizontalAlignment:[I

    :try_start_8
    sget-object v5, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$HorizontalAlignment:[I

    sget-object v6, Lcom/itextpdf/layout/properties/HorizontalAlignment;->LEFT:Lcom/itextpdf/layout/properties/HorizontalAlignment;

    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/HorizontalAlignment;->ordinal()I

    move-result v6

    aput v0, v5, v6
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    goto :goto_8

    :catch_8
    move-exception v5

    :goto_8
    :try_start_9
    sget-object v5, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$HorizontalAlignment:[I

    sget-object v6, Lcom/itextpdf/layout/properties/HorizontalAlignment;->CENTER:Lcom/itextpdf/layout/properties/HorizontalAlignment;

    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/HorizontalAlignment;->ordinal()I

    move-result v6

    aput v1, v5, v6
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    goto :goto_9

    :catch_9
    move-exception v5

    :goto_9
    :try_start_a
    sget-object v5, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$HorizontalAlignment:[I

    sget-object v6, Lcom/itextpdf/layout/properties/HorizontalAlignment;->RIGHT:Lcom/itextpdf/layout/properties/HorizontalAlignment;

    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/HorizontalAlignment;->ordinal()I

    move-result v6

    aput v2, v5, v6
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_a

    goto :goto_a

    :catch_a
    move-exception v5

    .line 479
    :goto_a
    invoke-static {}, Lcom/itextpdf/layout/properties/TextAlignment;->values()[Lcom/itextpdf/layout/properties/TextAlignment;

    move-result-object v5

    array-length v5, v5

    new-array v5, v5, [I

    sput-object v5, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$TextAlignment:[I

    :try_start_b
    sget-object v5, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$TextAlignment:[I

    sget-object v6, Lcom/itextpdf/layout/properties/TextAlignment;->LEFT:Lcom/itextpdf/layout/properties/TextAlignment;

    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/TextAlignment;->ordinal()I

    move-result v6

    aput v0, v5, v6
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_b

    goto :goto_b

    :catch_b
    move-exception v0

    :goto_b
    :try_start_c
    sget-object v0, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$TextAlignment:[I

    sget-object v5, Lcom/itextpdf/layout/properties/TextAlignment;->CENTER:Lcom/itextpdf/layout/properties/TextAlignment;

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/TextAlignment;->ordinal()I

    move-result v5

    aput v1, v0, v5
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_c

    goto :goto_c

    :catch_c
    move-exception v0

    :goto_c
    :try_start_d
    sget-object v0, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$TextAlignment:[I

    sget-object v1, Lcom/itextpdf/layout/properties/TextAlignment;->RIGHT:Lcom/itextpdf/layout/properties/TextAlignment;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/TextAlignment;->ordinal()I

    move-result v1

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_d

    goto :goto_d

    :catch_d
    move-exception v0

    :goto_d
    :try_start_e
    sget-object v0, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$TextAlignment:[I

    sget-object v1, Lcom/itextpdf/layout/properties/TextAlignment;->JUSTIFIED:Lcom/itextpdf/layout/properties/TextAlignment;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/TextAlignment;->ordinal()I

    move-result v1

    aput v3, v0, v1
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_e

    goto :goto_e

    :catch_e
    move-exception v0

    :goto_e
    :try_start_f
    sget-object v0, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$TextAlignment:[I

    sget-object v1, Lcom/itextpdf/layout/properties/TextAlignment;->JUSTIFIED_ALL:Lcom/itextpdf/layout/properties/TextAlignment;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/TextAlignment;->ordinal()I

    move-result v1

    aput v4, v0, v1
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_f} :catch_f

    goto :goto_f

    :catch_f
    move-exception v0

    :goto_f
    return-void
.end method
