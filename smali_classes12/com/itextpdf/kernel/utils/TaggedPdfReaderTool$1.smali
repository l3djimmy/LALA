.class synthetic Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$1;
.super Ljava/lang/Object;
.source "TaggedPdfReaderTool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$EventType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 335
    invoke-static {}, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->values()[Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$1;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$EventType:[I

    :try_start_0
    sget-object v0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$1;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$EventType:[I

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->RENDER_TEXT:Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    return-void
.end method
