.class synthetic Lcom/itextpdf/layout/renderer/FlexUtil$1;
.super Ljava/lang/Object;
.source "FlexUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/FlexUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$itextpdf$layout$properties$AlignmentPropertyValue:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 738
    invoke-static {}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->values()[Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/itextpdf/layout/renderer/FlexUtil$1;->$SwitchMap$com$itextpdf$layout$properties$AlignmentPropertyValue:[I

    :try_start_0
    sget-object v0, Lcom/itextpdf/layout/renderer/FlexUtil$1;->$SwitchMap$com$itextpdf$layout$properties$AlignmentPropertyValue:[I

    sget-object v1, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->SELF_END:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->ordinal()I

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
    sget-object v0, Lcom/itextpdf/layout/renderer/FlexUtil$1;->$SwitchMap$com$itextpdf$layout$properties$AlignmentPropertyValue:[I

    sget-object v1, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->END:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    :goto_1
    :try_start_2
    sget-object v0, Lcom/itextpdf/layout/renderer/FlexUtil$1;->$SwitchMap$com$itextpdf$layout$properties$AlignmentPropertyValue:[I

    sget-object v1, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->FLEX_END:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v0

    :goto_2
    :try_start_3
    sget-object v0, Lcom/itextpdf/layout/renderer/FlexUtil$1;->$SwitchMap$com$itextpdf$layout$properties$AlignmentPropertyValue:[I

    sget-object v1, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->CENTER:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception v0

    :goto_3
    :try_start_4
    sget-object v0, Lcom/itextpdf/layout/renderer/FlexUtil$1;->$SwitchMap$com$itextpdf$layout$properties$AlignmentPropertyValue:[I

    sget-object v1, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->FLEX_START:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_4
    move-exception v0

    :goto_4
    :try_start_5
    sget-object v0, Lcom/itextpdf/layout/renderer/FlexUtil$1;->$SwitchMap$com$itextpdf$layout$properties$AlignmentPropertyValue:[I

    sget-object v1, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->START:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_5

    :catch_5
    move-exception v0

    :goto_5
    :try_start_6
    sget-object v0, Lcom/itextpdf/layout/renderer/FlexUtil$1;->$SwitchMap$com$itextpdf$layout$properties$AlignmentPropertyValue:[I

    sget-object v1, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->BASELINE:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_6

    :catch_6
    move-exception v0

    :goto_6
    :try_start_7
    sget-object v0, Lcom/itextpdf/layout/renderer/FlexUtil$1;->$SwitchMap$com$itextpdf$layout$properties$AlignmentPropertyValue:[I

    sget-object v1, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->SELF_START:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    goto :goto_7

    :catch_7
    move-exception v0

    :goto_7
    :try_start_8
    sget-object v0, Lcom/itextpdf/layout/renderer/FlexUtil$1;->$SwitchMap$com$itextpdf$layout$properties$AlignmentPropertyValue:[I

    sget-object v1, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->STRETCH:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    goto :goto_8

    :catch_8
    move-exception v0

    :goto_8
    :try_start_9
    sget-object v0, Lcom/itextpdf/layout/renderer/FlexUtil$1;->$SwitchMap$com$itextpdf$layout$properties$AlignmentPropertyValue:[I

    sget-object v1, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->NORMAL:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    goto :goto_9

    :catch_9
    move-exception v0

    :goto_9
    return-void
.end method
