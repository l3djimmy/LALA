.class synthetic Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperOffset$1;
.super Ljava/lang/Object;
.source "ClipperOffset.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperOffset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$JoinType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 494
    invoke-static {}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->values()[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperOffset$1;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$JoinType:[I

    :try_start_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperOffset$1;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$JoinType:[I

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->MITER:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->ordinal()I

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
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperOffset$1;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$JoinType:[I

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->BEVEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->ordinal()I

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
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperOffset$1;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$JoinType:[I

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->ROUND:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v0

    :goto_2
    return-void
.end method
