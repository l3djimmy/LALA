.class public Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
.super Ljava/lang/Object;
.source "PdfCanvas.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;
    }
.end annotation


# static fields
.field private static final B:[B

.field private static final BDC:[B

.field private static final BI:[B

.field private static final BMC:[B

.field private static final BStar:[B

.field private static final BT:[B

.field private static final CS:[B

.field private static final Do:[B

.field private static final EI:[B

.field private static final EMC:[B

.field private static final ET:[B

.field private static final G:[B

.field private static final ID:[B

.field private static final IDENTITY_MATRIX_EPS:F = 1.0E-4f

.field private static final J:[B

.field private static final K:[B

.field private static final M:[B

.field private static final Q:[B

.field private static final RG:[B

.field private static final S:[B

.field private static final SCN:[B

.field private static final TD:[B

.field private static final TJ:[B

.field private static final TL:[B

.field private static final TStar:[B

.field private static final Tc:[B

.field private static final Td:[B

.field private static final Tf:[B

.field private static final Tj:[B

.field private static final Tm:[B

.field private static final Tr:[B

.field private static final Ts:[B

.field private static final Tw:[B

.field private static final Tz:[B

.field private static final W:[B

.field private static final WStar:[B

.field private static final b:[B

.field private static final bStar:[B

.field private static final c:[B

.field private static final cm:[B

.field private static final cmyk:Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Cmyk;

.field private static final cs:[B

.field private static final d:[B

.field private static final f:[B

.field private static final fStar:[B

.field private static final g:[B

.field private static final gray:Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Gray;

.field private static final gs:[B

.field private static final h:[B

.field private static final i:[B

.field private static final j:[B

.field private static final k:[B

.field private static final l:[B

.field private static final m:[B

.field private static final n:[B

.field private static final pattern:Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;

.field private static final q:[B

.field private static final re:[B

.field private static final rg:[B

.field private static final rgb:Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Rgb;

.field private static final ri:[B

.field private static final s:[B

.field private static final scn:[B

.field private static final sh:[B

.field private static final v:[B

.field private static final w:[B

.field private static final y:[B


# instance fields
.field protected contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

.field protected currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

.field private defaultDeviceGrayBlackColorCheckRequired:Z

.field protected document:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field protected drawingOnPage:Z

.field protected gsStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;",
            ">;"
        }
    .end annotation
.end field

.field protected layerDepth:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected mcDepth:I

.field protected resources:Lcom/itextpdf/kernel/pdf/PdfResources;

.field private tagStructureStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lcom/itextpdf/commons/datastructures/Tuple2<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 88
    const-string v0, "B\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->B:[B

    .line 89
    const-string v0, "b\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->b:[B

    .line 90
    const-string v0, "BDC\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->BDC:[B

    .line 91
    const-string v0, "BI\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->BI:[B

    .line 92
    const-string v0, "BMC\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->BMC:[B

    .line 93
    const-string v0, "B*\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->BStar:[B

    .line 94
    const-string v0, "b*\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->bStar:[B

    .line 95
    const-string v0, "BT\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->BT:[B

    .line 96
    const-string v0, "c\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->c:[B

    .line 97
    const-string v0, "cm\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->cm:[B

    .line 98
    const-string v0, "cs\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->cs:[B

    .line 99
    const-string v0, "CS\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->CS:[B

    .line 100
    const-string v0, "d\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->d:[B

    .line 101
    const-string v0, "Do\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Do:[B

    .line 102
    const-string v0, "EI\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->EI:[B

    .line 103
    const-string v0, "EMC\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->EMC:[B

    .line 104
    const-string v0, "ET\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->ET:[B

    .line 105
    const-string v0, "f\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->f:[B

    .line 106
    const-string v0, "f*\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fStar:[B

    .line 107
    const-string v0, "G\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->G:[B

    .line 108
    const-string v0, "g\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->g:[B

    .line 109
    const-string v0, "gs\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->gs:[B

    .line 110
    const-string v0, "h\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->h:[B

    .line 111
    const-string v0, "i\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->i:[B

    .line 112
    const-string v0, "ID\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->ID:[B

    .line 113
    const-string v0, "j\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->j:[B

    .line 114
    const-string v0, "J\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->J:[B

    .line 115
    const-string v0, "K\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->K:[B

    .line 116
    const-string v0, "k\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->k:[B

    .line 117
    const-string v0, "l\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->l:[B

    .line 118
    const-string v0, "m\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->m:[B

    .line 119
    const-string v0, "M\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->M:[B

    .line 120
    const-string v0, "n\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->n:[B

    .line 121
    const-string/jumbo v0, "q\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->q:[B

    .line 122
    const-string v0, "Q\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Q:[B

    .line 123
    const-string/jumbo v0, "re\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->re:[B

    .line 124
    const-string/jumbo v0, "rg\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rg:[B

    .line 125
    const-string v0, "RG\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->RG:[B

    .line 126
    const-string/jumbo v0, "ri\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->ri:[B

    .line 127
    const-string v0, "S\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->S:[B

    .line 128
    const-string/jumbo v0, "s\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->s:[B

    .line 129
    const-string/jumbo v0, "scn\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->scn:[B

    .line 130
    const-string v0, "SCN\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->SCN:[B

    .line 131
    const-string/jumbo v0, "sh\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->sh:[B

    .line 132
    const-string v0, "Tc\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tc:[B

    .line 133
    const-string v0, "Td\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Td:[B

    .line 134
    const-string v0, "TD\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->TD:[B

    .line 135
    const-string v0, "Tf\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tf:[B

    .line 136
    const-string v0, "TJ\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->TJ:[B

    .line 137
    const-string v0, "Tj\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tj:[B

    .line 138
    const-string v0, "TL\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->TL:[B

    .line 139
    const-string v0, "Tm\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tm:[B

    .line 140
    const-string v0, "Tr\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tr:[B

    .line 141
    const-string v0, "Ts\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Ts:[B

    .line 142
    const-string v0, "T*\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->TStar:[B

    .line 143
    const-string v0, "Tw\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tw:[B

    .line 144
    const-string v0, "Tz\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tz:[B

    .line 145
    const-string/jumbo v0, "v\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->v:[B

    .line 146
    const-string v0, "W\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->W:[B

    .line 147
    const-string/jumbo v0, "w\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->w:[B

    .line 148
    const-string v0, "W*\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->WStar:[B

    .line 149
    const-string/jumbo v0, "y\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->y:[B

    .line 151
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Gray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Gray;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->gray:Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Gray;

    .line 152
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Rgb;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Rgb;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rgb:Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Rgb;

    .line 153
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Cmyk;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Cmyk;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->cmyk:Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Cmyk;

    .line 154
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->pattern:Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;

    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;I)V
    .locals 1
    .param p1, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "pageNum"    # I

    .line 260
    invoke-virtual {p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;-><init>(Lcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 261
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfPage;)V
    .locals 1
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 216
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 217
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getContentStreamCount()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getLastContentStream()Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getLength()I

    move-result v0

    if-gtz v0, :cond_1

    .line 218
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getRotation()I

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->isIgnorePageRotationForContent()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 216
    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;-><init>(Lcom/itextpdf/kernel/pdf/PdfPage;Z)V

    .line 219
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfPage;Z)V
    .locals 3
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p2, "wrapOldContent"    # Z

    .line 229
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getPageStream(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getResources()Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 230
    if-eqz p2, :cond_0

    .line 232
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->newContentStreamBefore()Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    const-string/jumbo v1, "q\n"

    invoke-static {v1}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 233
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    const-string v1, "Q\n"

    invoke-static {v1}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 235
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getRotation()I

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->isIgnorePageRotationForContent()Z

    move-result v0

    if-eqz v0, :cond_2

    if-nez p2, :cond_1

    .line 236
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->isPageRotationInverseMatrixWritten()Z

    move-result v0

    if-nez v0, :cond_2

    .line 237
    :cond_1
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->applyRotation(Lcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 238
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->setPageRotationInverseMatrixWritten()V

    .line 240
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->drawingOnPage:Z

    .line 241
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "contentStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p2, "resources"    # Lcom/itextpdf/kernel/pdf/PdfResources;
    .param p3, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->defaultDeviceGrayBlackColorCheckRequired:Z

    .line 165
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->gsStack:Ljava/util/Stack;

    .line 169
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    .line 194
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->tagStructureStack:Ljava/util/Stack;

    .line 195
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->drawingOnPage:Z

    .line 205
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->ensureStreamDataIsReadyToBeProcessed(Lcom/itextpdf/kernel/pdf/PdfStream;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 206
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 207
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 208
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 2
    .param p1, "xObj"    # Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 250
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getResources()Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v1

    invoke-direct {p0, v0, v1, p2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 251
    return-void
.end method

.method private addFormAt(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;FF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 20
    .param p1, "form"    # Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .param p2, "x"    # F
    .param p3, "y"    # F

    .line 2320
    move/from16 v0, p2

    move/from16 v1, p3

    invoke-static/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->calculateBBoxMultipliedByMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    .line 2321
    .local v2, "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v3, Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v4

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v5

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v3, v4, v5, v6}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    .line 2322
    .local v3, "bBoxMin":Lcom/itextpdf/kernel/geom/Vector;
    new-instance v4, Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v5

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v7

    invoke-direct {v4, v5, v7, v6}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    .line 2323
    .local v4, "bBoxMax":Lcom/itextpdf/kernel/geom/Vector;
    new-instance v5, Lcom/itextpdf/kernel/geom/Vector;

    invoke-direct {v5, v0, v1, v6}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    .line 2324
    .local v5, "rectMin":Lcom/itextpdf/kernel/geom/Vector;
    new-instance v7, Lcom/itextpdf/kernel/geom/Vector;

    const/4 v8, 0x0

    invoke-virtual {v4, v8}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v9

    add-float/2addr v9, v0

    invoke-virtual {v3, v8}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v10

    sub-float/2addr v9, v10

    .line 2325
    const/4 v10, 0x1

    invoke-virtual {v4, v10}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v11

    add-float/2addr v11, v1

    invoke-virtual {v3, v10}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v12

    sub-float/2addr v11, v12

    invoke-direct {v7, v9, v11, v6}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    .line 2327
    .local v7, "rectMax":Lcom/itextpdf/kernel/geom/Vector;
    invoke-static {v5, v7, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->calculateTransformationMatrix(Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;)[F

    move-result-object v6

    .line 2328
    .local v6, "result":[F
    aget v13, v6, v8

    aget v14, v6, v10

    const/4 v8, 0x2

    aget v15, v6, v8

    const/4 v8, 0x3

    aget v16, v6, v8

    const/4 v8, 0x4

    aget v17, v6, v8

    const/4 v8, 0x5

    aget v18, v6, v8

    const/16 v19, 0x0

    move-object/from16 v11, p0

    move-object/from16 v12, p1

    invoke-direct/range {v11 .. v19}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addFormWithTransformationMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;FFFFFFZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v8

    return-object v8
.end method

.method private addFormFittedIntoRectangle(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 16
    .param p1, "form"    # Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .param p2, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2339
    invoke-static/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->calculateBBoxMultipliedByMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 2340
    .local v0, "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v1, Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v2

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v3

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    .line 2341
    .local v1, "bBoxMin":Lcom/itextpdf/kernel/geom/Vector;
    new-instance v2, Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v3

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v5

    invoke-direct {v2, v3, v5, v4}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    .line 2342
    .local v2, "bBoxMax":Lcom/itextpdf/kernel/geom/Vector;
    new-instance v3, Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v5

    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v6

    invoke-direct {v3, v5, v6, v4}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    .line 2343
    .local v3, "rectMin":Lcom/itextpdf/kernel/geom/Vector;
    new-instance v5, Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v6

    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v7

    invoke-direct {v5, v6, v7, v4}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    .line 2345
    .local v5, "rectMax":Lcom/itextpdf/kernel/geom/Vector;
    invoke-static {v3, v5, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->calculateTransformationMatrix(Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;)[F

    move-result-object v4

    .line 2346
    .local v4, "result":[F
    const/4 v6, 0x0

    aget v9, v4, v6

    const/4 v6, 0x1

    aget v10, v4, v6

    const/4 v6, 0x2

    aget v11, v4, v6

    const/4 v6, 0x3

    aget v12, v4, v6

    const/4 v6, 0x4

    aget v13, v4, v6

    const/4 v6, 0x5

    aget v14, v4, v6

    const/4 v15, 0x0

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    invoke-direct/range {v7 .. v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addFormWithTransformationMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;FFFFFFZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v6

    return-object v6
.end method

.method private addFormWithTransformationMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;FFFFFFZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 18
    .param p1, "form"    # Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .param p2, "a"    # F
    .param p3, "b"    # F
    .param p4, "c"    # F
    .param p5, "d"    # F
    .param p6, "e"    # F
    .param p7, "f"    # F
    .param p8, "writeIdentityMatrix"    # Z

    .line 2301
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2302
    if-nez p8, :cond_1

    invoke-static/range {p2 .. p7}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->isIdentityMatrix(FFFFFF)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    move-object/from16 v0, p0

    move/from16 v13, p2

    move/from16 v14, p3

    move/from16 v15, p4

    goto :goto_1

    .line 2303
    :cond_1
    :goto_0
    move/from16 v13, p2

    float-to-double v1, v13

    move/from16 v14, p3

    float-to-double v3, v14

    move/from16 v15, p4

    float-to-double v5, v15

    move/from16 v0, p5

    float-to-double v7, v0

    move/from16 v9, p6

    float-to-double v10, v9

    move/from16 v12, p7

    move-wide/from16 v16, v1

    float-to-double v0, v12

    move-wide v9, v10

    move-wide v11, v0

    move-wide/from16 v1, v16

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->concatMatrix(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2305
    :goto_1
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    move-object/from16 v2, p1

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfResources;->addForm(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    .line 2306
    .local v1, "name":Lcom/itextpdf/kernel/pdf/PdfName;
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Do:[B

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 2307
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2308
    return-object v0
.end method

.method private addImageAt(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;FF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 8
    .param p1, "image"    # Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    .param p2, "x"    # F
    .param p3, "y"    # F

    .line 2384
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getWidth()F

    move-result v2

    const/4 v4, 0x0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getHeight()F

    move-result v5

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move v6, p2

    move v7, p3

    .end local p1    # "image":Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    .end local p2    # "x":F
    .end local p3    # "y":F
    .local v1, "image":Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    .local v6, "x":F
    .local v7, "y":F
    invoke-direct/range {v0 .. v7}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addImageWithTransformationMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;FFFFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object p1

    return-object p1
.end method

.method private addImageFittedIntoRectangle(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 8
    .param p1, "image"    # Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    .param p2, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2395
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v6

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v7

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    .end local p1    # "image":Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    .local v1, "image":Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    invoke-direct/range {v0 .. v7}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addImageWithTransformationMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;FFFFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object p1

    return-object p1
.end method

.method private addImageWithTransformationMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;FFFFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 16
    .param p1, "xObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .param p2, "a"    # F
    .param p3, "b"    # F
    .param p4, "c"    # F
    .param p5, "d"    # F
    .param p6, "e"    # F
    .param p7, "f"    # F

    .line 2362
    move-object/from16 v13, p1

    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2363
    move/from16 v14, p2

    float-to-double v1, v14

    move/from16 v15, p3

    float-to-double v3, v15

    move/from16 v0, p4

    float-to-double v5, v0

    move/from16 v7, p5

    float-to-double v8, v7

    move/from16 v10, p6

    float-to-double v11, v10

    move/from16 v14, p7

    move-wide v7, v8

    move-wide v9, v11

    float-to-double v11, v14

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->concatMatrix(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2365
    instance-of v1, v13, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    .line 2368
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 2365
    if-eqz v1, :cond_0

    .line 2366
    move-object v1, v13

    check-cast v1, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfResources;->addImage(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    .local v1, "name":Lcom/itextpdf/kernel/pdf/PdfName;
    goto :goto_0

    .line 2368
    .end local v1    # "name":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_0
    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfResources;->addImage(Lcom/itextpdf/kernel/pdf/PdfStream;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    .line 2370
    .restart local v1    # "name":Lcom/itextpdf/kernel/pdf/PdfName;
    :goto_0
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Do:[B

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 2371
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2372
    return-object v0
.end method

.method private addToPropertiesAndBeginLayer(Lcom/itextpdf/kernel/pdf/layer/IPdfOCG;)V
    .locals 3
    .param p1, "layer"    # Lcom/itextpdf/kernel/pdf/layer/IPdfOCG;

    .line 2436
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/layer/IPdfOCG;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfResources;->addProperties(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 2437
    .local v0, "name":Lcom/itextpdf/kernel/pdf/PdfName;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->OC:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 2438
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->BDC:[B

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeNewLine()Ljava/io/OutputStream;

    .line 2439
    return-void
.end method

.method private applyRotation(Lcom/itextpdf/kernel/pdf/PdfPage;)V
    .locals 29
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 2468
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPageSizeWithRotation()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 2469
    .local v0, "rectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getRotation()I

    move-result v1

    .line 2470
    .local v1, "rotation":I
    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    .line 2478
    :sswitch_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v2

    float-to-double v14, v2

    const-wide/16 v4, 0x0

    const-wide/high16 v6, -0x4010000000000000L    # -1.0

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x0

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->concatMatrix(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_0

    .line 2475
    :sswitch_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v2

    float-to-double v2, v2

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v4

    float-to-double v4, v4

    const-wide/high16 v17, -0x4010000000000000L    # -1.0

    const-wide/16 v19, 0x0

    const-wide/16 v21, 0x0

    const-wide/high16 v23, -0x4010000000000000L    # -1.0

    move-object/from16 v16, p0

    move-wide/from16 v25, v2

    move-wide/from16 v27, v4

    invoke-virtual/range {v16 .. v28}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->concatMatrix(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2476
    goto :goto_0

    .line 2472
    :sswitch_2
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v2

    float-to-double v2, v2

    const-wide/16 v27, 0x0

    const-wide/16 v17, 0x0

    const-wide/high16 v19, 0x3ff0000000000000L    # 1.0

    const-wide/high16 v21, -0x4010000000000000L    # -1.0

    const-wide/16 v23, 0x0

    move-object/from16 v16, p0

    move-wide/from16 v25, v2

    invoke-virtual/range {v16 .. v28}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->concatMatrix(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2473
    nop

    .line 2481
    :goto_0
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x5a -> :sswitch_2
        0xb4 -> :sswitch_1
        0x10e -> :sswitch_0
    .end sparse-switch
.end method

.method public static bezierArc(DDDDDD)Ljava/util/List;
    .locals 58
    .param p0, "x1"    # D
    .param p2, "y1"    # D
    .param p4, "x2"    # D
    .param p6, "y2"    # D
    .param p8, "startAng"    # D
    .param p10, "extent"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DDDDDD)",
            "Ljava/util/List<",
            "[D>;"
        }
    .end annotation

    .line 1124
    cmpl-double v0, p0, p4

    if-lez v0, :cond_0

    .line 1125
    move-wide/from16 v0, p0

    .line 1126
    .local v0, "tmp":D
    move-wide/from16 v2, p4

    .line 1127
    .end local p0    # "x1":D
    .local v2, "x1":D
    move-wide v4, v0

    .end local p4    # "x2":D
    .local v4, "x2":D
    goto :goto_0

    .line 1124
    .end local v0    # "tmp":D
    .end local v2    # "x1":D
    .end local v4    # "x2":D
    .restart local p0    # "x1":D
    .restart local p4    # "x2":D
    :cond_0
    move-wide/from16 v2, p0

    move-wide/from16 v4, p4

    .line 1129
    .end local p0    # "x1":D
    .end local p4    # "x2":D
    .restart local v2    # "x1":D
    .restart local v4    # "x2":D
    :goto_0
    cmpl-double v0, p6, p2

    if-lez v0, :cond_1

    .line 1130
    move-wide/from16 v0, p2

    .line 1131
    .restart local v0    # "tmp":D
    move-wide/from16 v6, p6

    .line 1132
    .end local p2    # "y1":D
    .local v6, "y1":D
    move-wide v8, v0

    .end local p6    # "y2":D
    .local v8, "y2":D
    goto :goto_1

    .line 1129
    .end local v0    # "tmp":D
    .end local v6    # "y1":D
    .end local v8    # "y2":D
    .restart local p2    # "y1":D
    .restart local p6    # "y2":D
    :cond_1
    move-wide/from16 v6, p2

    move-wide/from16 v8, p6

    .line 1137
    .end local p2    # "y1":D
    .end local p6    # "y2":D
    .restart local v6    # "y1":D
    .restart local v8    # "y2":D
    :goto_1
    invoke-static/range {p10 .. p11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    const-wide v10, 0x4056800000000000L    # 90.0

    cmpg-double v0, v0, v10

    if-gtz v0, :cond_2

    .line 1138
    move-wide/from16 v0, p10

    .line 1139
    .local v0, "fragAngle":D
    const/4 v10, 0x1

    .local v10, "Nfrag":I
    goto :goto_2

    .line 1141
    .end local v0    # "fragAngle":D
    .end local v10    # "Nfrag":I
    :cond_2
    invoke-static/range {p10 .. p11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    div-double/2addr v0, v10

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v10, v0

    .line 1142
    .restart local v10    # "Nfrag":I
    int-to-double v0, v10

    div-double v0, p10, v0

    .line 1144
    .restart local v0    # "fragAngle":D
    :goto_2
    add-double v11, v2, v4

    const-wide/high16 v13, 0x4000000000000000L    # 2.0

    div-double/2addr v11, v13

    .line 1145
    .local v11, "x_cen":D
    add-double v15, v6, v8

    div-double/2addr v15, v13

    .line 1146
    .local v15, "y_cen":D
    sub-double v17, v4, v2

    div-double v17, v17, v13

    .line 1147
    .local v17, "rx":D
    sub-double v19, v8, v6

    div-double v19, v19, v13

    .line 1148
    .local v19, "ry":D
    const-wide v13, 0x400921fb54442d18L    # Math.PI

    mul-double v21, v0, v13

    const-wide v23, 0x4076800000000000L    # 360.0

    div-double v21, v21, v23

    .line 1149
    .local v21, "halfAng":D
    const-wide/high16 v23, 0x3ff0000000000000L    # 1.0

    invoke-static/range {v21 .. v22}, Ljava/lang/Math;->cos(D)D

    move-result-wide v25

    sub-double v23, v23, v25

    const-wide v25, 0x3ff5555555555555L    # 1.3333333333333333

    mul-double v23, v23, v25

    invoke-static/range {v21 .. v22}, Ljava/lang/Math;->sin(D)D

    move-result-wide v25

    div-double v23, v23, v25

    invoke-static/range {v23 .. v24}, Ljava/lang/Math;->abs(D)D

    move-result-wide v23

    .line 1150
    .local v23, "kappa":D
    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 p0, v25

    .line 1151
    .local p0, "pointList":Ljava/util/List;, "Ljava/util/List<[D>;"
    const/16 v25, 0x0

    move-wide/from16 p1, v13

    move/from16 v13, v25

    .local v13, "iter":I
    :goto_3
    if-ge v13, v10, :cond_4

    .line 1152
    move-wide/from16 p3, v0

    .end local v0    # "fragAngle":D
    .local p3, "fragAngle":D
    int-to-double v0, v13

    mul-double v0, v0, p3

    add-double v0, p8, v0

    mul-double v0, v0, p1

    const-wide v25, 0x4066800000000000L    # 180.0

    div-double v0, v0, v25

    .line 1153
    .local v0, "theta0":D
    add-int/lit8 v14, v13, 0x1

    move-wide/from16 p5, v0

    .end local v0    # "theta0":D
    .local p5, "theta0":D
    int-to-double v0, v14

    mul-double v0, v0, p3

    add-double v0, p8, v0

    mul-double v0, v0, p1

    div-double v0, v0, v25

    .line 1154
    .local v0, "theta1":D
    invoke-static/range {p5 .. p6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v25

    .line 1155
    .local v25, "cos0":D
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v27

    .line 1156
    .local v27, "cos1":D
    invoke-static/range {p5 .. p6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v29

    .line 1157
    .local v29, "sin0":D
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v31

    .line 1158
    .local v31, "sin1":D
    const-wide/16 v33, 0x0

    cmpl-double v14, p3, v33

    const/16 v33, 0x7

    const/16 v34, 0x6

    const/16 v35, 0x5

    const/16 v36, 0x4

    const/16 v37, 0x3

    const/16 v38, 0x2

    const/16 v39, 0x0

    move-wide/from16 v40, v0

    .end local v0    # "theta1":D
    .local v40, "theta1":D
    const/16 v0, 0x8

    const/4 v1, 0x1

    if-lez v14, :cond_3

    .line 1159
    mul-double v42, v17, v25

    add-double v42, v11, v42

    mul-double v44, v19, v29

    sub-double v44, v15, v44

    mul-double v46, v23, v29

    sub-double v46, v25, v46

    mul-double v46, v46, v17

    add-double v46, v11, v46

    mul-double v48, v23, v25

    add-double v48, v29, v48

    mul-double v48, v48, v19

    sub-double v48, v15, v48

    mul-double v50, v23, v31

    add-double v50, v27, v50

    mul-double v50, v50, v17

    add-double v50, v11, v50

    mul-double v52, v23, v27

    sub-double v52, v31, v52

    mul-double v52, v52, v19

    sub-double v52, v15, v52

    mul-double v54, v17, v27

    add-double v54, v11, v54

    mul-double v56, v19, v31

    sub-double v56, v15, v56

    new-array v0, v0, [D

    aput-wide v42, v0, v39

    aput-wide v44, v0, v1

    aput-wide v46, v0, v38

    aput-wide v48, v0, v37

    aput-wide v50, v0, v36

    aput-wide v52, v0, v35

    aput-wide v54, v0, v34

    aput-wide v56, v0, v33

    move-object/from16 v14, p0

    .end local p0    # "pointList":Ljava/util/List;, "Ljava/util/List<[D>;"
    .local v14, "pointList":Ljava/util/List;, "Ljava/util/List<[D>;"
    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 1168
    .end local v14    # "pointList":Ljava/util/List;, "Ljava/util/List<[D>;"
    .restart local p0    # "pointList":Ljava/util/List;, "Ljava/util/List<[D>;"
    :cond_3
    move-object/from16 v14, p0

    .end local p0    # "pointList":Ljava/util/List;, "Ljava/util/List<[D>;"
    .restart local v14    # "pointList":Ljava/util/List;, "Ljava/util/List<[D>;"
    mul-double v42, v17, v25

    add-double v42, v11, v42

    mul-double v44, v19, v29

    sub-double v44, v15, v44

    mul-double v46, v23, v29

    add-double v46, v25, v46

    mul-double v46, v46, v17

    add-double v46, v11, v46

    mul-double v48, v23, v25

    sub-double v48, v29, v48

    mul-double v48, v48, v19

    sub-double v48, v15, v48

    mul-double v50, v23, v31

    sub-double v50, v27, v50

    mul-double v50, v50, v17

    add-double v50, v11, v50

    mul-double v52, v23, v27

    add-double v52, v31, v52

    mul-double v52, v52, v19

    sub-double v52, v15, v52

    mul-double v54, v17, v27

    add-double v54, v11, v54

    mul-double v56, v19, v31

    sub-double v56, v15, v56

    new-array v0, v0, [D

    aput-wide v42, v0, v39

    aput-wide v44, v0, v1

    aput-wide v46, v0, v38

    aput-wide v48, v0, v37

    aput-wide v50, v0, v36

    aput-wide v52, v0, v35

    aput-wide v54, v0, v34

    aput-wide v56, v0, v33

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1151
    .end local v25    # "cos0":D
    .end local v27    # "cos1":D
    .end local v29    # "sin0":D
    .end local v31    # "sin1":D
    .end local v40    # "theta1":D
    .end local p5    # "theta0":D
    :goto_4
    add-int/lit8 v13, v13, 0x1

    move-wide/from16 v0, p3

    move-object/from16 p0, v14

    goto/16 :goto_3

    .end local v14    # "pointList":Ljava/util/List;, "Ljava/util/List<[D>;"
    .end local p3    # "fragAngle":D
    .local v0, "fragAngle":D
    .restart local p0    # "pointList":Ljava/util/List;, "Ljava/util/List<[D>;"
    :cond_4
    move-object/from16 v14, p0

    .line 1178
    .end local v13    # "iter":I
    .end local p0    # "pointList":Ljava/util/List;, "Ljava/util/List<[D>;"
    .restart local v14    # "pointList":Ljava/util/List;, "Ljava/util/List<[D>;"
    return-object v14
.end method

.method private static calculateTransformationMatrix(Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;)[F
    .locals 6
    .param p0, "expectedMin"    # Lcom/itextpdf/kernel/geom/Vector;
    .param p1, "expectedMax"    # Lcom/itextpdf/kernel/geom/Vector;
    .param p2, "actualMin"    # Lcom/itextpdf/kernel/geom/Vector;
    .param p3, "actualMax"    # Lcom/itextpdf/kernel/geom/Vector;

    .line 2552
    const/4 v0, 0x6

    new-array v0, v0, [F

    .line 2553
    .local v0, "result":[F
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v2

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v3

    sub-float/2addr v2, v3

    invoke-virtual {p2, v1}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v3

    invoke-virtual {p3, v1}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v4

    sub-float/2addr v3, v4

    div-float/2addr v2, v3

    aput v2, v0, v1

    .line 2554
    const/4 v2, 0x1

    const/4 v3, 0x0

    aput v3, v0, v2

    .line 2555
    const/4 v4, 0x2

    aput v3, v0, v4

    .line 2556
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v3

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v4

    sub-float/2addr v3, v4

    invoke-virtual {p2, v2}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v4

    invoke-virtual {p3, v2}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v5

    sub-float/2addr v4, v5

    div-float/2addr v3, v4

    const/4 v4, 0x3

    aput v3, v0, v4

    .line 2557
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v3

    invoke-virtual {p2, v1}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v5

    aget v1, v0, v1

    mul-float/2addr v5, v1

    sub-float/2addr v3, v5

    const/4 v1, 0x4

    aput v3, v0, v1

    .line 2558
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v1

    invoke-virtual {p2, v2}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v2

    aget v3, v0, v4

    mul-float/2addr v2, v3

    sub-float/2addr v1, v2

    const/4 v2, 0x5

    aput v1, v0, v2

    .line 2559
    return-object v0
.end method

.method private checkDefaultDeviceGrayBlackColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;)V
    .locals 6
    .param p1, "checkColorMode"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    .line 2504
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->defaultDeviceGrayBlackColorCheckRequired:Z

    if-eqz v0, :cond_3

    .line 2507
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFillColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/colors/DeviceGray;->BLACK:Lcom/itextpdf/kernel/colors/DeviceGray;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->FILL:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    if-eq p1, v0, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->FILL_AND_STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    if-ne p1, v0, :cond_1

    .line 2509
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    sget-object v3, Lcom/itextpdf/kernel/pdf/IsoKey;->FILL_COLOR:Lcom/itextpdf/kernel/pdf/IsoKey;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0, v1, v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 2510
    iput-boolean v2, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->defaultDeviceGrayBlackColorCheckRequired:Z

    goto :goto_0

    .line 2511
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getStrokeColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/colors/DeviceGray;->BLACK:Lcom/itextpdf/kernel/colors/DeviceGray;

    if-ne v0, v1, :cond_3

    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    if-eq p1, v0, :cond_2

    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->FILL_AND_STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    if-ne p1, v0, :cond_3

    .line 2513
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    sget-object v3, Lcom/itextpdf/kernel/pdf/IsoKey;->STROKE_COLOR:Lcom/itextpdf/kernel/pdf/IsoKey;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0, v1, v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 2514
    iput-boolean v2, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->defaultDeviceGrayBlackColorCheckRequired:Z

    .line 2519
    :cond_3
    :goto_0
    return-void
.end method

.method private checkIsoConformanceWritingOnContent()V
    .locals 3

    .line 2430
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->drawingOnPage:Z

    if-eqz v0, :cond_0

    .line 2431
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->tagStructureStack:Ljava/util/Stack;

    sget-object v2, Lcom/itextpdf/kernel/pdf/IsoKey;->CANVAS_WRITING_CONTENT:Lcom/itextpdf/kernel/pdf/IsoKey;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;)V

    .line 2433
    :cond_0
    return-void
.end method

.method private createColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FLcom/itextpdf/kernel/pdf/colorspace/PdfPattern;)Lcom/itextpdf/kernel/colors/Color;
    .locals 3
    .param p1, "colorSpace"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p2, "colorValue"    # [F
    .param p3, "pattern"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;

    .line 2442
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;

    if-eqz v0, :cond_0

    .line 2443
    new-instance v0, Lcom/itextpdf/kernel/colors/PatternColor;

    move-object v1, p3

    check-cast v1, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;

    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;->getUnderlyingColorSpace()Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v2

    invoke-direct {v0, v1, v2, p2}, Lcom/itextpdf/kernel/colors/PatternColor;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    return-object v0

    .line 2444
    :cond_0
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;

    if-eqz v0, :cond_1

    .line 2445
    new-instance v0, Lcom/itextpdf/kernel/colors/PatternColor;

    invoke-direct {v0, p3}, Lcom/itextpdf/kernel/colors/PatternColor;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;)V

    return-object v0

    .line 2447
    :cond_1
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/colors/Color;->makeColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    return-object v0
.end method

.method private drawArc(DDDDDDZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 16
    .param p1, "x1"    # D
    .param p3, "y1"    # D
    .param p5, "x2"    # D
    .param p7, "y2"    # D
    .param p9, "startAng"    # D
    .param p11, "extent"    # D
    .param p13, "continuous"    # Z

    .line 2485
    move-object/from16 v0, p0

    invoke-static/range {p1 .. p12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->bezierArc(DDDDDD)Ljava/util/List;

    move-result-object v13

    .line 2486
    .local v13, "ar":Ljava/util/List;, "Ljava/util/List<[D>;"
    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2487
    return-object v0

    .line 2490
    :cond_0
    const/4 v1, 0x0

    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [D

    .line 2491
    .local v2, "pt":[D
    const/4 v3, 0x1

    if-eqz p13, :cond_1

    .line 2492
    aget-wide v4, v2, v1

    aget-wide v6, v2, v3

    invoke-virtual {v0, v4, v5, v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_0

    .line 2494
    :cond_1
    aget-wide v4, v2, v1

    aget-wide v6, v2, v3

    invoke-virtual {v0, v4, v5, v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2496
    :goto_0
    const/4 v1, 0x0

    move v14, v1

    .local v14, "index":I
    :goto_1
    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v1

    if-ge v14, v1, :cond_2

    .line 2497
    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v15, v1

    check-cast v15, [D

    .line 2498
    .end local v2    # "pt":[D
    .local v15, "pt":[D
    const/4 v1, 0x2

    aget-wide v1, v15, v1

    const/4 v3, 0x3

    aget-wide v3, v15, v3

    const/4 v5, 0x4

    aget-wide v5, v15, v5

    const/4 v7, 0x5

    aget-wide v7, v15, v7

    const/4 v9, 0x6

    aget-wide v9, v15, v9

    const/4 v11, 0x7

    aget-wide v11, v15, v11

    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->curveTo(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2496
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    move-object v2, v15

    goto :goto_1

    .line 2500
    .end local v14    # "index":I
    .end local v15    # "pt":[D
    .restart local v2    # "pt":[D
    :cond_2
    return-object p0
.end method

.method private ensureStreamDataIsReadyToBeProcessed(Lcom/itextpdf/kernel/pdf/PdfStream;)Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 1
    .param p1, "stream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 2399
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2400
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2402
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->setData([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2405
    goto :goto_0

    .line 2403
    :catch_0
    move-exception v0

    .line 2408
    :cond_1
    :goto_0
    return-object p1
.end method

.method private getColorKeyForText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;
    .locals 1

    .line 2522
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getTextRenderingMode()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 2533
    :pswitch_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->NONE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    return-object v0

    .line 2531
    :pswitch_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->FILL_AND_STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    return-object v0

    .line 2528
    :pswitch_2
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    return-object v0

    .line 2525
    :pswitch_3
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->FILL:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private getDashPatternArray(F)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 1
    .param p1, "phase"    # F

    .line 2451
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getDashPatternArray([FF)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method private getDashPatternArray([FF)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 8
    .param p1, "dashArray"    # [F
    .param p2, "phase"    # F

    .line 2455
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 2456
    .local v0, "dashPatternArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 2457
    .local v1, "dArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz p1, :cond_0

    .line 2458
    array-length v2, p1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget v4, p1, v3

    .line 2459
    .local v4, "fl":F
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v6, v4

    invoke-direct {v5, v6, v7}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 2458
    .end local v4    # "fl":F
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2462
    :cond_0
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 2463
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v3, p2

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 2464
    return-object v0
.end method

.method private static getPageStream(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 2
    .param p0, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 2538
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getLastContentStream()Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    .line 2539
    .local v0, "stream":Lcom/itextpdf/kernel/pdf/PdfStream;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    move-object v1, v0

    goto :goto_1

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->newContentStreamAfter()Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v1

    :goto_1
    return-object v1
.end method

.method private getSubrangeWidth(Lcom/itextpdf/io/font/otf/GlyphLine;II)F
    .locals 8
    .param p1, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p2, "from"    # I
    .param p3, "to"    # I

    .line 865
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFontSize()F

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v0

    .line 866
    .local v0, "fontSize":F
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getCharSpacing()F

    move-result v1

    .line 867
    .local v1, "charSpacing":F
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getHorizontalScaling()F

    move-result v2

    const/high16 v3, 0x42c80000    # 100.0f

    div-float/2addr v2, v3

    .line 868
    .local v2, "scaling":F
    const/4 v3, 0x0

    .line 869
    .local v3, "width":F
    move v4, p2

    .local v4, "iter":I
    :goto_0
    if-gt v4, p3, :cond_2

    .line 870
    invoke-virtual {p1, v4}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v5

    .line 871
    .local v5, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->hasPlacement()Z

    move-result v6

    if-nez v6, :cond_0

    .line 872
    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v0

    add-float/2addr v6, v1

    invoke-direct {p0, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getWordSpacingAddition(Lcom/itextpdf/io/font/otf/Glyph;)F

    move-result v7

    add-float/2addr v6, v7

    mul-float/2addr v6, v2

    add-float/2addr v3, v6

    .line 875
    :cond_0
    if-le v4, p2, :cond_1

    .line 876
    add-int/lit8 v6, v4, -0x1

    invoke-virtual {p1, v6}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/io/font/otf/Glyph;->getXAdvance()S

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v0

    mul-float/2addr v6, v2

    add-float/2addr v3, v6

    .line 869
    .end local v5    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 880
    .end local v4    # "iter":I
    :cond_2
    return v3
.end method

.method private getSubrangeYDelta(Lcom/itextpdf/io/font/otf/GlyphLine;II)F
    .locals 4
    .param p1, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p2, "from"    # I
    .param p3, "to"    # I

    .line 884
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFontSize()F

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v0

    .line 885
    .local v0, "fontSize":F
    const/4 v1, 0x0

    .line 886
    .local v1, "yDelta":F
    move v2, p2

    .local v2, "iter":I
    :goto_0
    if-ge v2, p3, :cond_0

    .line 887
    invoke-virtual {p1, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getYAdvance()S

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v0

    add-float/2addr v1, v3

    .line 886
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 889
    .end local v2    # "iter":I
    :cond_0
    return v1
.end method

.method private getWordSpacingAddition(Lcom/itextpdf/io/font/otf/Glyph;)F
    .locals 2
    .param p1, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 896
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    instance-of v0, v0, Lcom/itextpdf/kernel/font/PdfType0Font;

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->hasValidUnicode()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getWordSpacing()F

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isIdentityMatrix(FFFFFF)Z
    .locals 3
    .param p0, "a"    # F
    .param p1, "b"    # F
    .param p2, "c"    # F
    .param p3, "d"    # F
    .param p4, "e"    # F
    .param p5, "f"    # F

    .line 2563
    const/high16 v0, 0x3f800000    # 1.0f

    sub-float v1, v0, p0

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const v2, 0x38d1b717    # 1.0E-4f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    sub-float/2addr v0, p3

    .line 2564
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, v2

    if-gez v0, :cond_0

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, v2

    if-gez v0, :cond_0

    invoke-static {p5}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 2563
    :goto_0
    return v0
.end method

.method private static iteratorToList(Ljava/util/Iterator;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Iterator<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 2543
    .local p0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2544
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2545
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2547
    :cond_0
    return-object v0
.end method

.method private showTextInt(Ljava/lang/String;)V
    .locals 7
    .param p1, "text"    # Ljava/lang/String;

    .line 2418
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    sget-object v2, Lcom/itextpdf/kernel/pdf/IsoKey;->FONT_GLYPHS:Lcom/itextpdf/kernel/pdf/IsoKey;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 2419
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2423
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkIsoConformanceWritingOnContent()V

    .line 2424
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    sget-object v3, Lcom/itextpdf/kernel/pdf/IsoKey;->FONT:Lcom/itextpdf/kernel/pdf/IsoKey;

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v6

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v2, p1

    .end local p1    # "text":Ljava/lang/String;
    .local v2, "text":Ljava/lang/String;
    invoke-virtual/range {v1 .. v6}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;Ljava/lang/Object;)V

    .line 2426
    iget-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object p1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Lcom/itextpdf/kernel/font/PdfFont;->writeText(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfOutputStream;)V

    .line 2427
    return-void

    .line 2420
    .end local v2    # "text":Ljava/lang/String;
    .restart local p1    # "text":Ljava/lang/String;
    :cond_0
    move-object v2, p1

    .end local p1    # "text":Ljava/lang/String;
    .restart local v2    # "text":Ljava/lang/String;
    new-instance p1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v0, "Font and size must be set before writing any text."

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-direct {p1, v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1
.end method


# virtual methods
.method public addImageAt(Lcom/itextpdf/io/image/ImageData;FFZ)Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .locals 9
    .param p1, "image"    # Lcom/itextpdf/io/image/ImageData;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "asInline"    # Z

    .line 1991
    invoke-virtual {p1}, Lcom/itextpdf/io/image/ImageData;->getOriginalType()Lcom/itextpdf/io/image/ImageType;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/io/image/ImageType;->WMF:Lcom/itextpdf/io/image/ImageType;

    if-ne v0, v1, :cond_0

    .line 1992
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageHelper;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageHelper;-><init>(Lcom/itextpdf/io/image/ImageData;)V

    .line 1993
    .local v0, "wmf":Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageHelper;
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageHelper;->createFormXObject(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    move-result-object v2

    .line 1995
    .local v2, "xObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    move-object v1, p0

    move v7, p2

    move v8, p3

    invoke-virtual/range {v1 .. v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addXObjectWithTransformationMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;FFFFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1996
    return-object v2

    .line 1998
    .end local v0    # "wmf":Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageHelper;
    .end local v2    # "xObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;-><init>(Lcom/itextpdf/io/image/ImageData;)V

    .line 1999
    .local v2, "imageXObject":Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    if-eqz p4, :cond_1

    invoke-virtual {p1}, Lcom/itextpdf/io/image/ImageData;->canImageBeInline()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2000
    invoke-virtual {p1}, Lcom/itextpdf/io/image/ImageData;->getWidth()F

    move-result v3

    const/4 v5, 0x0

    invoke-virtual {p1}, Lcom/itextpdf/io/image/ImageData;->getHeight()F

    move-result v6

    const/4 v4, 0x0

    move-object v1, p0

    move v7, p2

    move v8, p3

    invoke-virtual/range {v1 .. v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addInlineImage(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;FFFFFF)V

    .line 2001
    const/4 v0, 0x0

    return-object v0

    .line 2003
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/io/image/ImageData;->getWidth()F

    move-result v3

    const/4 v5, 0x0

    invoke-virtual {p1}, Lcom/itextpdf/io/image/ImageData;->getHeight()F

    move-result v6

    const/4 v4, 0x0

    move-object v1, p0

    move v7, p2

    move v8, p3

    invoke-direct/range {v1 .. v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addImageWithTransformationMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;FFFFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2004
    return-object v2
.end method

.method public addImageFittedIntoRectangle(Lcom/itextpdf/io/image/ImageData;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .locals 9
    .param p1, "image"    # Lcom/itextpdf/io/image/ImageData;
    .param p2, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "asInline"    # Z

    .line 1977
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    .line 1978
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v6

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v7

    .line 1977
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v8, p3

    .end local p1    # "image":Lcom/itextpdf/io/image/ImageData;
    .end local p3    # "asInline":Z
    .local v1, "image":Lcom/itextpdf/io/image/ImageData;
    .local v8, "asInline":Z
    invoke-virtual/range {v0 .. v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addImageWithTransformationMatrix(Lcom/itextpdf/io/image/ImageData;FFFFFFZ)Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    move-result-object p1

    return-object p1
.end method

.method public addImageWithTransformationMatrix(Lcom/itextpdf/io/image/ImageData;FFFFFF)Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .locals 9
    .param p1, "image"    # Lcom/itextpdf/io/image/ImageData;
    .param p2, "a"    # F
    .param p3, "b"    # F
    .param p4, "c"    # F
    .param p5, "d"    # F
    .param p6, "e"    # F
    .param p7, "f"    # F

    .line 1922
    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    invoke-virtual/range {v0 .. v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addImageWithTransformationMatrix(Lcom/itextpdf/io/image/ImageData;FFFFFFZ)Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    move-result-object v8

    return-object v8
.end method

.method public addImageWithTransformationMatrix(Lcom/itextpdf/io/image/ImageData;FFFFFFZ)Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .locals 9
    .param p1, "image"    # Lcom/itextpdf/io/image/ImageData;
    .param p2, "a"    # F
    .param p3, "b"    # F
    .param p4, "c"    # F
    .param p5, "d"    # F
    .param p6, "e"    # F
    .param p7, "f"    # F
    .param p8, "asInline"    # Z

    .line 1943
    invoke-virtual {p1}, Lcom/itextpdf/io/image/ImageData;->getOriginalType()Lcom/itextpdf/io/image/ImageType;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/io/image/ImageType;->WMF:Lcom/itextpdf/io/image/ImageType;

    if-ne v0, v1, :cond_0

    .line 1944
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageHelper;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageHelper;-><init>(Lcom/itextpdf/io/image/ImageData;)V

    .line 1945
    .local v0, "wmf":Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageHelper;
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageHelper;->createFormXObject(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    move-result-object v2

    .line 1946
    .local v2, "xObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    move-object v1, p0

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    move/from16 v8, p7

    invoke-virtual/range {v1 .. v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addXObjectWithTransformationMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;FFFFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1947
    return-object v2

    .line 1949
    .end local v0    # "wmf":Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageHelper;
    .end local v2    # "xObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;-><init>(Lcom/itextpdf/io/image/ImageData;)V

    .line 1950
    .local v2, "imageXObject":Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    if-eqz p8, :cond_1

    invoke-virtual {p1}, Lcom/itextpdf/io/image/ImageData;->canImageBeInline()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1951
    move-object v1, p0

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    move/from16 v8, p7

    invoke-virtual/range {v1 .. v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addInlineImage(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;FFFFFF)V

    .line 1952
    const/4 v0, 0x0

    return-object v0

    .line 1954
    :cond_1
    move-object v1, p0

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    move/from16 v8, p7

    invoke-direct/range {v1 .. v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addImageWithTransformationMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;FFFFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1955
    return-object v2
.end method

.method protected addInlineImage(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;FFFFFF)V
    .locals 16
    .param p1, "imageXObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    .param p2, "a"    # F
    .param p3, "b"    # F
    .param p4, "c"    # F
    .param p5, "d"    # F
    .param p6, "e"    # F
    .param p7, "f"    # F

    .line 2262
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/pdf/IsoKey;->INLINE_IMAGE:Lcom/itextpdf/kernel/pdf/IsoKey;

    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 2263
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2264
    move/from16 v13, p2

    float-to-double v1, v13

    move/from16 v14, p3

    float-to-double v3, v14

    move/from16 v15, p4

    float-to-double v5, v15

    move/from16 v7, p5

    float-to-double v8, v7

    move/from16 v10, p6

    float-to-double v11, v10

    move/from16 v13, p7

    move-wide v7, v8

    move-wide v9, v11

    float-to-double v11, v13

    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->concatMatrix(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2265
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    .line 2266
    .local v1, "os":Lcom/itextpdf/kernel/pdf/PdfOutputStream;
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->BI:[B

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 2267
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfStream;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes(Z)[B

    move-result-object v2

    .line 2268
    .local v2, "imageBytes":[B
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 2269
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 2270
    .local v5, "key":Lcom/itextpdf/kernel/pdf/PdfName;
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v6, v5}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v6, v5}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v6, v5}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 2271
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v1, v6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    .line 2272
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v1, v6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeNewLine()Ljava/io/OutputStream;

    .line 2274
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    .end local v5    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_0
    goto :goto_0

    .line 2275
    :cond_1
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPdfVersion()Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v3

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v3

    if-ltz v3, :cond_2

    .line 2276
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    .line 2277
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    array-length v4, v2

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeNewLine()Ljava/io/OutputStream;

    .line 2279
    :cond_2
    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->ID:[B

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 2280
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeNewLine()Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->EI:[B

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeNewLine()Ljava/io/OutputStream;

    .line 2281
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2282
    return-void
.end method

.method public addXObject(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 10
    .param p1, "xObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    .line 2083
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    if-eqz v0, :cond_0

    .line 2084
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    move-object v1, p0

    invoke-direct/range {v1 .. v9}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addFormWithTransformationMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;FFFFFFZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0

    .line 2085
    :cond_0
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    if-eqz v0, :cond_1

    .line 2086
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addImageAt(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;FF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0

    .line 2088
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "PdfFormXObject or PdfImageXObject expected."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addXObjectAt(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;FF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "xObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .param p2, "x"    # F
    .param p3, "y"    # F

    .line 2044
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    if-eqz v0, :cond_0

    .line 2045
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    invoke-direct {p0, v0, p2, p3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addFormAt(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;FF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0

    .line 2046
    :cond_0
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    if-eqz v0, :cond_1

    .line 2047
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    invoke-direct {p0, v0, p2, p3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addImageAt(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;FF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0

    .line 2049
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "PdfFormXObject or PdfImageXObject expected."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addXObjectFittedIntoRectangle(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "xObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .param p2, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2063
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    if-eqz v0, :cond_0

    .line 2064
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    invoke-direct {p0, v0, p2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addFormFittedIntoRectangle(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0

    .line 2065
    :cond_0
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    if-eqz v0, :cond_1

    .line 2066
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    invoke-direct {p0, v0, p2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addImageFittedIntoRectangle(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0

    .line 2068
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "PdfFormXObject or PdfImageXObject expected."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addXObjectWithTransformationMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;FFFFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 10
    .param p1, "xObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .param p2, "a"    # F
    .param p3, "b"    # F
    .param p4, "c"    # F
    .param p5, "d"    # F
    .param p6, "e"    # F
    .param p7, "f"    # F

    .line 2026
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    if-eqz v0, :cond_0

    .line 2027
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    const/4 v9, 0x1

    move-object v1, p0

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    invoke-direct/range {v1 .. v9}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addFormWithTransformationMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;FFFFFFZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0

    .line 2028
    :cond_0
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    if-eqz v0, :cond_1

    .line 2029
    invoke-direct/range {p0 .. p7}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addImageWithTransformationMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;FFFFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0

    .line 2031
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "PdfFormXObject or PdfImageXObject expected."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public arc(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 14
    .param p1, "x1"    # D
    .param p3, "y1"    # D
    .param p5, "x2"    # D
    .param p7, "y2"    # D
    .param p9, "startAng"    # D
    .param p11, "extent"    # D

    .line 1062
    const/4 v13, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-wide/from16 v3, p3

    move-wide/from16 v5, p5

    move-wide/from16 v7, p7

    move-wide/from16 v9, p9

    move-wide/from16 v11, p11

    invoke-direct/range {v0 .. v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->drawArc(DDDDDDZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v13

    return-object v13
.end method

.method public arcContinuous(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 14
    .param p1, "x1"    # D
    .param p3, "y1"    # D
    .param p5, "x2"    # D
    .param p7, "y2"    # D
    .param p9, "startAng"    # D
    .param p11, "extent"    # D

    .line 1082
    const/4 v13, 0x1

    move-object v0, p0

    move-wide v1, p1

    move-wide/from16 v3, p3

    move-wide/from16 v5, p5

    move-wide/from16 v7, p7

    move-wide/from16 v9, p9

    move-wide/from16 v11, p11

    invoke-direct/range {v0 .. v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->drawArc(DDDDDDZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v13

    return-object v13
.end method

.method public attachContentStream(Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 0
    .param p1, "contentStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 288
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 289
    return-void
.end method

.method public beginLayer(Lcom/itextpdf/kernel/pdf/layer/IPdfOCG;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 4
    .param p1, "layer"    # Lcom/itextpdf/kernel/pdf/layer/IPdfOCG;

    .line 1864
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getTitle()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1865
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Illegal layer argument."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1866
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->layerDepth:Ljava/util/List;

    if-nez v0, :cond_2

    .line 1867
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->layerDepth:Ljava/util/List;

    .line 1868
    :cond_2
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;

    if-eqz v0, :cond_3

    .line 1869
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->layerDepth:Ljava/util/List;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1870
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addToPropertiesAndBeginLayer(Lcom/itextpdf/kernel/pdf/layer/IPdfOCG;)V

    goto :goto_2

    .line 1871
    :cond_3
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    if-eqz v0, :cond_6

    .line 1872
    const/4 v0, 0x0

    .line 1873
    .local v0, "num":I
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 1874
    .local v1, "la":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    :goto_1
    if-eqz v1, :cond_5

    .line 1875
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getTitle()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_4

    .line 1876
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addToPropertiesAndBeginLayer(Lcom/itextpdf/kernel/pdf/layer/IPdfOCG;)V

    .line 1877
    add-int/lit8 v0, v0, 0x1

    .line 1879
    :cond_4
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getParent()Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    move-result-object v1

    goto :goto_1

    .line 1881
    :cond_5
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->layerDepth:Ljava/util/List;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1882
    .end local v0    # "num":I
    .end local v1    # "la":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    nop

    .line 1884
    :goto_2
    return-object p0

    .line 1883
    :cond_6
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Unsupported type for operand: layer"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public beginMarkedContent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1
    .param p1, "tag"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 2126
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->beginMarkedContent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public beginMarkedContent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 8
    .param p1, "tag"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "properties"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 2137
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->mcDepth:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->mcDepth:I

    .line 2138
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 2139
    .local v0, "out":Lcom/itextpdf/kernel/pdf/PdfOutputStream;
    if-nez p2, :cond_0

    .line 2140
    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->BMC:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    goto :goto_0

    .line 2141
    :cond_0
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    if-nez v1, :cond_1

    .line 2142
    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->BDC:[B

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    goto :goto_0

    .line 2144
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-virtual {v1, p2}, Lcom/itextpdf/kernel/pdf/PdfResources;->addProperties(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->BDC:[B

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 2146
    :goto_0
    new-instance v1, Lcom/itextpdf/commons/datastructures/Tuple2;

    invoke-direct {v1, p1, p2}, Lcom/itextpdf/commons/datastructures/Tuple2;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v7, v1

    .line 2147
    .local v7, "tuple2":Lcom/itextpdf/commons/datastructures/Tuple2;, "Lcom/itextpdf/commons/datastructures/Tuple2<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    iget-boolean v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->drawingOnPage:Z

    if-eqz v1, :cond_2

    .line 2148
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->tagStructureStack:Ljava/util/Stack;

    sget-object v4, Lcom/itextpdf/kernel/pdf/IsoKey;->CANVAS_BEGIN_MARKED_CONTENT:Lcom/itextpdf/kernel/pdf/IsoKey;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;Ljava/lang/Object;)V

    .line 2150
    :cond_2
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->tagStructureStack:Ljava/util/Stack;

    invoke-virtual {v1, v7}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2151
    return-object p0
.end method

.method public beginText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 405
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->BT:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 406
    return-object p0
.end method

.method public beginVariableText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1

    .line 425
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Tx:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->beginMarkedContent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public circle(DDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 19
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "r"    # D

    .line 1256
    move-object/from16 v0, p0

    move-wide/from16 v13, p3

    const-wide v15, 0x3fe1ac7100000000L    # 0.552299976348877

    .line 1257
    .local v15, "curve":D
    add-double v1, p1, p5

    invoke-virtual {v0, v1, v2, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1258
    add-double v1, p1, p5

    const-wide v17, 0x3fe1ac7100000000L    # 0.552299976348877

    mul-double v3, p5, v17

    add-double/2addr v3, v13

    mul-double v5, p5, v17

    add-double v5, p1, v5

    add-double v7, v13, p5

    add-double v11, v13, p5

    move-wide/from16 v9, p1

    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->curveTo(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1259
    mul-double v0, p5, v17

    sub-double v1, p1, v0

    add-double v3, v13, p5

    sub-double v5, p1, p5

    mul-double v7, p5, v17

    add-double/2addr v7, v13

    sub-double v9, p1, p5

    move-object/from16 v0, p0

    move-wide v11, v13

    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->curveTo(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1260
    sub-double v1, p1, p5

    mul-double v3, p5, v17

    sub-double v3, p3, v3

    mul-double v5, p5, v17

    sub-double v5, p1, v5

    sub-double v7, p3, p5

    sub-double v11, p3, p5

    move-wide/from16 v9, p1

    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->curveTo(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1261
    mul-double v0, p5, v17

    add-double v1, p1, v0

    sub-double v3, p3, p5

    add-double v5, p1, p5

    mul-double v17, v17, p5

    sub-double v7, p3, v17

    add-double v9, p1, p5

    move-object/from16 v0, p0

    move-wide/from16 v11, p3

    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->curveTo(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1262
    return-object p0
.end method

.method public clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 1342
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->W:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1343
    return-object p0
.end method

.method public closePath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 1284
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->h:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1285
    return-object p0
.end method

.method public closePathEoFillStroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 1294
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkIsoConformanceWritingOnContent()V

    .line 1295
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->FILL_AND_STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkDefaultDeviceGrayBlackColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;)V

    .line 1297
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->bStar:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1298
    return-object p0
.end method

.method public closePathFillStroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 1307
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->FILL_AND_STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkDefaultDeviceGrayBlackColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;)V

    .line 1309
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->b:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1310
    return-object p0
.end method

.method public closePathStroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 1363
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkIsoConformanceWritingOnContent()V

    .line 1364
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->s:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1365
    return-object p0
.end method

.method public closeTag()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1

    .line 2204
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endMarkedContent()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public concatMatrix(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 21
    .param p1, "a"    # D
    .param p3, "b"    # D
    .param p5, "c"    # D
    .param p7, "d"    # D
    .param p9, "e"    # D
    .param p11, "f"    # D

    .line 353
    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move-wide/from16 v3, p3

    move-wide/from16 v5, p5

    move-wide/from16 v7, p7

    move-wide/from16 v9, p9

    move-wide/from16 v11, p11

    iget-object v13, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    double-to-float v14, v1

    double-to-float v15, v3

    move-object/from16 v16, v13

    double-to-float v13, v5

    move/from16 v17, v13

    double-to-float v13, v7

    move/from16 v18, v13

    double-to-float v13, v9

    move/from16 v19, v13

    double-to-float v13, v11

    move/from16 v20, v19

    move/from16 v19, v13

    move-object/from16 v13, v16

    move/from16 v16, v17

    move/from16 v17, v18

    move/from16 v18, v20

    invoke-virtual/range {v13 .. v19}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->updateCtm(FFFFFF)V

    .line 354
    iget-object v13, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v13

    invoke-virtual {v13, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 355
    invoke-virtual {v13, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 356
    invoke-virtual {v13, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 357
    invoke-virtual {v13, v7, v8}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 358
    invoke-virtual {v13, v9, v10}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 359
    invoke-virtual {v13, v11, v12}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v14, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->cm:[B

    invoke-virtual {v13, v14}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 360
    return-object v0
.end method

.method public concatMatrix(Lcom/itextpdf/kernel/geom/AffineTransform;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 16
    .param p1, "transform"    # Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 394
    const/4 v0, 0x6

    new-array v0, v0, [F

    .line 395
    .local v0, "matrix":[F
    move-object/from16 v1, p1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/AffineTransform;->getMatrix([F)V

    .line 396
    const/4 v2, 0x0

    aget v2, v0, v2

    float-to-double v4, v2

    const/4 v2, 0x1

    aget v2, v0, v2

    float-to-double v6, v2

    const/4 v2, 0x2

    aget v2, v0, v2

    float-to-double v8, v2

    const/4 v2, 0x3

    aget v2, v0, v2

    float-to-double v10, v2

    const/4 v2, 0x4

    aget v2, v0, v2

    float-to-double v12, v2

    const/4 v2, 0x5

    aget v2, v0, v2

    float-to-double v14, v2

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->concatMatrix(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    return-object v2
.end method

.method public concatMatrix(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 14
    .param p1, "array"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 373
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v0

    const/4 v1, 0x6

    if-eq v0, v1, :cond_0

    .line 375
    return-object p0

    .line 377
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 378
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isNumber()Z

    move-result v1

    if-nez v1, :cond_1

    .line 379
    return-object p0

    .line 377
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 382
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->doubleValue()D

    move-result-wide v2

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->doubleValue()D

    move-result-wide v4

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->doubleValue()D

    move-result-wide v6

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->doubleValue()D

    move-result-wide v8

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->doubleValue()D

    move-result-wide v10

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->doubleValue()D

    move-result-wide v12

    move-object v1, p0

    invoke-virtual/range {v1 .. v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->concatMatrix(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public curveFromTo(DDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "x1"    # D
    .param p3, "y1"    # D
    .param p5, "x3"    # D
    .param p7, "y3"    # D

    .line 1034
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 1035
    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1036
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1037
    invoke-virtual {v0, p3, p4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1038
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1039
    invoke-virtual {v0, p5, p6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1040
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1041
    invoke-virtual {v0, p7, p8}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->y:[B

    .line 1042
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1043
    return-object p0
.end method

.method public curveTo(DDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "x2"    # D
    .param p3, "y2"    # D
    .param p5, "x3"    # D
    .param p7, "y3"    # D

    .line 1012
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 1013
    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1014
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1015
    invoke-virtual {v0, p3, p4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1016
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1017
    invoke-virtual {v0, p5, p6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1018
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1019
    invoke-virtual {v0, p7, p8}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->v:[B

    .line 1020
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1021
    return-object p0
.end method

.method public curveTo(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "x1"    # D
    .param p3, "y1"    # D
    .param p5, "x2"    # D
    .param p7, "y2"    # D
    .param p9, "x3"    # D
    .param p11, "y3"    # D

    .line 985
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 986
    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 987
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 988
    invoke-virtual {v0, p3, p4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 989
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 990
    invoke-virtual {v0, p5, p6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 991
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 992
    invoke-virtual {v0, p7, p8}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 993
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 994
    invoke-virtual {v0, p9, p10}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 995
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 996
    invoke-virtual {v0, p11, p12}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 997
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->c:[B

    .line 998
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 999
    return-object p0
.end method

.method public ellipse(DDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 13
    .param p1, "x1"    # D
    .param p3, "y1"    # D
    .param p5, "x2"    # D
    .param p7, "y2"    # D

    .line 1095
    const-wide/16 v9, 0x0

    const-wide v11, 0x4076800000000000L    # 360.0

    move-object v0, p0

    move-wide v1, p1

    move-wide/from16 v3, p3

    move-wide/from16 v5, p5

    move-wide/from16 v7, p7

    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arc(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v9

    return-object v9
.end method

.method public endLayer()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 3

    .line 1894
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->layerDepth:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->layerDepth:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1895
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->layerDepth:Ljava/util/List;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->layerDepth:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1896
    .local v0, "num":I
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->layerDepth:Ljava/util/List;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->layerDepth:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 1900
    :goto_0
    add-int/lit8 v1, v0, -0x1

    .end local v0    # "num":I
    .local v1, "num":I
    if-lez v0, :cond_0

    .line 1901
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->EMC:[B

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeNewLine()Ljava/io/OutputStream;

    move v0, v1

    goto :goto_0

    .line 1902
    :cond_0
    return-object p0

    .line 1898
    .end local v1    # "num":I
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Unbalanced layer operators."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public endMarkedContent()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 2160
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->mcDepth:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->mcDepth:I

    if-ltz v0, :cond_0

    .line 2162
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->EMC:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 2163
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->tagStructureStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 2164
    return-object p0

    .line 2161
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Unbalanced begin/end marked content operators."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 1319
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->n:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1320
    return-object p0
.end method

.method public endText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 415
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->ET:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 416
    return-object p0
.end method

.method public endVariableText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1

    .line 434
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endMarkedContent()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public eoClip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 1353
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->WStar:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1354
    return-object p0
.end method

.method public eoFill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 1400
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkIsoConformanceWritingOnContent()V

    .line 1401
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->FILL:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkDefaultDeviceGrayBlackColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;)V

    .line 1403
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fStar:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1404
    return-object p0
.end method

.method public eoFillStroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 1413
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkIsoConformanceWritingOnContent()V

    .line 1414
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->FILL_AND_STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkDefaultDeviceGrayBlackColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;)V

    .line 1416
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->BStar:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1417
    return-object p0
.end method

.method public fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 1374
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkIsoConformanceWritingOnContent()V

    .line 1375
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->FILL:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkDefaultDeviceGrayBlackColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;)V

    .line 1377
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->f:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1378
    return-object p0
.end method

.method public fillStroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 1387
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkIsoConformanceWritingOnContent()V

    .line 1388
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->FILL_AND_STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkDefaultDeviceGrayBlackColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;)V

    .line 1390
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->B:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1391
    return-object p0
.end method

.method public getContentStream()Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 1

    .line 2247
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    return-object v0
.end method

.method public getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 278
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    return-object v0
.end method

.method public getGraphicsState()Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;
    .locals 1

    .line 297
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    return-object v0
.end method

.method public getResources()Lcom/itextpdf/kernel/pdf/PdfResources;
    .locals 1

    .line 269
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    return-object v0
.end method

.method public lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "x"    # D
    .param p3, "y"    # D

    .line 965
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 966
    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 967
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 968
    invoke-virtual {v0, p3, p4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->l:[B

    .line 969
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 970
    return-object p0
.end method

.method public moveText(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "x"    # D
    .param p3, "y"    # D

    .line 464
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 465
    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 466
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 467
    invoke-virtual {v0, p3, p4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Td:[B

    .line 468
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 469
    return-object p0
.end method

.method public moveTextWithLeading(FF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "x"    # F
    .param p2, "y"    # F

    .line 503
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    neg-float v1, p2

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setLeading(F)V

    .line 504
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 505
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 506
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 507
    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 508
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->TD:[B

    .line 509
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 510
    return-object p0
.end method

.method public moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "x"    # D
    .param p3, "y"    # D

    .line 948
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 949
    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 950
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 951
    invoke-virtual {v0, p3, p4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->m:[B

    .line 952
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 953
    return-object p0
.end method

.method public newlineShowText(FFLjava/lang/String;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "wordSpacing"    # F
    .param p2, "charSpacing"    # F
    .param p3, "text"    # Ljava/lang/String;

    .line 549
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getColorKeyForText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkDefaultDeviceGrayBlackColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;)V

    .line 551
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 552
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 553
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 554
    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    .line 555
    invoke-direct {p0, p3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->showTextInt(Ljava/lang/String;)V

    .line 556
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 557
    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 558
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeNewLine()Ljava/io/OutputStream;

    .line 561
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setCharSpacing(F)V

    .line 562
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setWordSpacing(F)V

    .line 563
    return-object p0
.end method

.method public newlineShowText(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .line 531
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getColorKeyForText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkDefaultDeviceGrayBlackColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;)V

    .line 533
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->showTextInt(Ljava/lang/String;)V

    .line 534
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 535
    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 536
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeNewLine()Ljava/io/OutputStream;

    .line 537
    return-object p0
.end method

.method public newlineText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 519
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->TStar:[B

    .line 520
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 521
    return-object p0
.end method

.method public openTag(Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "tag"    # Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;

    .line 2174
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2175
    return-object p0

    .line 2176
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->getProperties()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->beginMarkedContent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public openTag(Lcom/itextpdf/kernel/pdf/tagutils/TagReference;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 5
    .param p1, "tagReference"    # Lcom/itextpdf/kernel/pdf/tagutils/TagReference;

    .line 2190
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagReference;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2191
    return-object p0

    .line 2192
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagReference;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;-><init>(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 2193
    .local v0, "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagReference;->getProperties()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->setProperties(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->MCID:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    .line 2194
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagReference;->createNextMcid()I

    move-result v4

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->addProperty(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;

    .line 2195
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->openTag(Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    return-object v1
.end method

.method public paintShading(Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 3
    .param p1, "shading"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;

    .line 1272
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfResources;->addShading(Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 1273
    .local v0, "shadingName":Lcom/itextpdf/kernel/pdf/PdfName;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->sh:[B

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1274
    return-object p0
.end method

.method public rectangle(DDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "width"    # D
    .param p7, "height"    # D

    .line 1191
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1192
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1193
    invoke-virtual {v0, p3, p4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1194
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1195
    invoke-virtual {v0, p5, p6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1196
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1197
    invoke-virtual {v0, p7, p8}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1198
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->re:[B

    .line 1199
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1200
    return-object p0
.end method

.method public rectangle(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 10
    .param p1, "rectangle"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1210
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v0

    float-to-double v2, v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v0

    float-to-double v4, v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    float-to-double v6, v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    float-to-double v8, v0

    move-object v1, p0

    invoke-virtual/range {v1 .. v9}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rectangle(DDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public release()V
    .locals 1

    .line 305
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->gsStack:Ljava/util/Stack;

    .line 306
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    .line 307
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 308
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 309
    return-void
.end method

.method public resetFillColorCmyk()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 1841
    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0, v0, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColorCmyk(FFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public resetFillColorGray()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1

    .line 1735
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColorGray(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public resetFillColorRgb()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1

    .line 1797
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resetFillColorGray()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public resetStrokeColorCmyk()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 1850
    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0, v0, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColorCmyk(FFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public resetStrokeColorGray()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1

    .line 1744
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColorGray(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public resetStrokeColorRgb()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1

    .line 1806
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resetStrokeColorGray()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 3

    .line 330
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    const/16 v1, 0x51

    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/kernel/pdf/IsoKey;->CANVAS_STACK:Lcom/itextpdf/kernel/pdf/IsoKey;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;)V

    .line 331
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->gsStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 334
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->gsStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    .line 335
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Q:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 336
    return-object p0

    .line 332
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Unbalanced save restore state operators."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public roundRectangle(DDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 27
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "width"    # D
    .param p7, "height"    # D
    .param p9, "radius"    # D

    .line 1224
    move-object/from16 v0, p0

    move-wide/from16 v1, p5

    move-wide/from16 v3, p7

    move-wide/from16 v5, p9

    const-wide/16 v7, 0x0

    cmpg-double v9, v1, v7

    if-gez v9, :cond_0

    .line 1225
    add-double v9, p1, v1

    .line 1226
    .end local p1    # "x":D
    .local v9, "x":D
    neg-double v1, v1

    move-wide v13, v9

    move-wide v15, v1

    .end local p5    # "width":D
    .local v1, "width":D
    goto :goto_0

    .line 1224
    .end local v1    # "width":D
    .end local v9    # "x":D
    .restart local p1    # "x":D
    .restart local p5    # "width":D
    :cond_0
    move-wide/from16 v13, p1

    move-wide v15, v1

    .line 1228
    .end local p1    # "x":D
    .end local p5    # "width":D
    .local v13, "x":D
    .local v15, "width":D
    :goto_0
    cmpg-double v1, v3, v7

    if-gez v1, :cond_1

    .line 1229
    add-double v1, p3, v3

    .line 1230
    .end local p3    # "y":D
    .local v1, "y":D
    neg-double v3, v3

    move-wide/from16 v17, v3

    move-wide v3, v1

    .end local p7    # "height":D
    .local v3, "height":D
    goto :goto_1

    .line 1228
    .end local v1    # "y":D
    .end local v3    # "height":D
    .restart local p3    # "y":D
    .restart local p7    # "height":D
    :cond_1
    move-wide/from16 v17, v3

    move-wide/from16 v3, p3

    .line 1232
    .end local p3    # "y":D
    .end local p7    # "height":D
    .local v3, "y":D
    .local v17, "height":D
    :goto_1
    cmpg-double v1, v5, v7

    if-gez v1, :cond_2

    .line 1233
    neg-double v1, v5

    move-wide/from16 v19, v1

    .end local p9    # "radius":D
    .local v1, "radius":D
    goto :goto_2

    .line 1232
    .end local v1    # "radius":D
    .restart local p9    # "radius":D
    :cond_2
    move-wide/from16 v19, v5

    .line 1234
    .end local p9    # "radius":D
    .local v19, "radius":D
    :goto_2
    const-wide v21, 0x3fdca71de0000000L    # 0.44769999384880066

    .line 1235
    .local v21, "curv":D
    add-double v1, v13, v19

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1236
    add-double v1, v13, v15

    sub-double v1, v1, v19

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1237
    add-double v1, v13, v15

    const-wide v23, 0x3fdca71de0000000L    # 0.44769999384880066

    mul-double v5, v19, v23

    sub-double/2addr v1, v5

    add-double v5, v13, v15

    mul-double v7, v19, v23

    add-double/2addr v7, v3

    add-double v9, v13, v15

    add-double v11, v3, v19

    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->curveTo(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1238
    move-wide/from16 v25, v3

    .end local v3    # "y":D
    .local v25, "y":D
    add-double v1, v13, v15

    add-double v3, v25, v17

    sub-double v3, v3, v19

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1239
    add-double v1, v13, v15

    add-double v3, v25, v17

    mul-double v5, v19, v23

    sub-double/2addr v3, v5

    add-double v5, v13, v15

    mul-double v7, v19, v23

    sub-double/2addr v5, v7

    add-double v7, v25, v17

    add-double v9, v13, v15

    sub-double v9, v9, v19

    add-double v11, v25, v17

    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->curveTo(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1240
    add-double v1, v13, v19

    add-double v3, v25, v17

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1241
    mul-double v1, v19, v23

    add-double/2addr v1, v13

    add-double v3, v25, v17

    add-double v5, v25, v17

    mul-double v7, v19, v23

    sub-double v7, v5, v7

    add-double v5, v25, v17

    sub-double v11, v5, v19

    move-wide v9, v13

    move-wide v5, v13

    .end local v13    # "x":D
    .local v5, "x":D
    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->curveTo(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1242
    add-double v3, v25, v19

    invoke-virtual {v0, v5, v6, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1243
    mul-double v1, v19, v23

    add-double v3, v25, v1

    mul-double v23, v23, v19

    add-double v13, v5, v23

    add-double v9, v5, v19

    move-wide/from16 v11, v25

    move-wide v1, v5

    move-wide v5, v13

    move-wide/from16 v7, v25

    .end local v5    # "x":D
    .end local v25    # "y":D
    .local v1, "x":D
    .local v7, "y":D
    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->curveTo(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1244
    move-wide v5, v1

    .end local v1    # "x":D
    .restart local v5    # "x":D
    return-object p0
.end method

.method public saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 3

    .line 317
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    const/16 v1, 0x71

    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/kernel/pdf/IsoKey;->CANVAS_STACK:Lcom/itextpdf/kernel/pdf/IsoKey;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;)V

    .line 318
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->gsStack:Ljava/util/Stack;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;-><init>(Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    .line 320
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->q:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 321
    return-object p0
.end method

.method public setCharacterSpacing(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "charSpacing"    # F

    .line 618
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setCharSpacing(F)V

    .line 619
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 620
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tc:[B

    .line 621
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 622
    return-object p0
.end method

.method public setColor(Lcom/itextpdf/kernel/colors/Color;Z)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 3
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "fill"    # Z

    .line 1642
    instance-of v0, p1, Lcom/itextpdf/kernel/colors/PatternColor;

    if-eqz v0, :cond_0

    .line 1643
    invoke-virtual {p1}, Lcom/itextpdf/kernel/colors/Color;->getColorSpace()Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/colors/Color;->getColorValue()[F

    move-result-object v1

    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/colors/PatternColor;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/colors/PatternColor;->getPattern()Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2, p2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FLcom/itextpdf/kernel/pdf/colorspace/PdfPattern;Z)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0

    .line 1645
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/colors/Color;->getColorSpace()Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/colors/Color;->getColorValue()[F

    move-result-object v1

    invoke-virtual {p0, v0, v1, p2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public setColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FLcom/itextpdf/kernel/pdf/colorspace/PdfPattern;Z)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 8
    .param p1, "colorSpace"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p2, "colorValue"    # [F
    .param p3, "pattern"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;
    .param p4, "fill"    # Z

    .line 1671
    const/4 v0, 0x0

    .line 1672
    .local v0, "setColorValueOnly":Z
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    if-eqz p4, :cond_0

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFillColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v1

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getStrokeColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v1

    .line 1673
    .local v1, "oldColor":Lcom/itextpdf/kernel/colors/Color;
    :goto_0
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->createColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FLcom/itextpdf/kernel/pdf/colorspace/PdfPattern;)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v2

    .line 1674
    .local v2, "newColor":Lcom/itextpdf/kernel/colors/Color;
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/colors/Color;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1675
    return-object p0

    .line 1677
    :cond_1
    nop

    .line 1680
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    .line 1677
    if-eqz p4, :cond_2

    .line 1678
    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)V

    goto :goto_1

    .line 1680
    :cond_2
    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)V

    .line 1682
    :goto_1
    invoke-virtual {v1}, Lcom/itextpdf/kernel/colors/Color;->getColorSpace()Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1683
    const/4 v0, 0x1

    .line 1686
    :cond_3
    instance-of v3, p1, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Gray;

    if-eqz v3, :cond_5

    .line 1687
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    invoke-virtual {v3, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloats([F)Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    if-eqz p4, :cond_4

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->g:[B

    goto :goto_2

    :cond_4
    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->G:[B

    :goto_2
    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    goto/16 :goto_b

    .line 1688
    :cond_5
    instance-of v3, p1, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Rgb;

    if-eqz v3, :cond_7

    .line 1689
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    invoke-virtual {v3, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloats([F)Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    if-eqz p4, :cond_6

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rg:[B

    goto :goto_3

    :cond_6
    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->RG:[B

    :goto_3
    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    goto/16 :goto_b

    .line 1690
    :cond_7
    instance-of v3, p1, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Cmyk;

    if-eqz v3, :cond_9

    .line 1691
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    invoke-virtual {v3, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloats([F)Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    if-eqz p4, :cond_8

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->k:[B

    goto :goto_4

    :cond_8
    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->K:[B

    :goto_4
    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    goto/16 :goto_b

    .line 1692
    :cond_9
    instance-of v3, p1, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;

    if-eqz v3, :cond_c

    .line 1693
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-virtual {v4, p1}, Lcom/itextpdf/kernel/pdf/PdfResources;->addColorSpace(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    if-eqz p4, :cond_a

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->cs:[B

    goto :goto_5

    :cond_a
    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->CS:[B

    :goto_5
    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1694
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeNewLine()Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v3, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloats([F)Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-virtual {v4, p3}, Lcom/itextpdf/kernel/pdf/PdfResources;->addPattern(Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    if-eqz p4, :cond_b

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->scn:[B

    goto :goto_6

    :cond_b
    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->SCN:[B

    :goto_6
    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    goto/16 :goto_b

    .line 1695
    :cond_c
    instance-of v3, p1, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;

    if-eqz v3, :cond_f

    .line 1696
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Pattern:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    if-eqz p4, :cond_d

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->cs:[B

    goto :goto_7

    :cond_d
    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->CS:[B

    :goto_7
    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1697
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeNewLine()Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-virtual {v4, p3}, Lcom/itextpdf/kernel/pdf/PdfResources;->addPattern(Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    if-eqz p4, :cond_e

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->scn:[B

    goto :goto_8

    :cond_e
    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->SCN:[B

    :goto_8
    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    goto :goto_b

    .line 1698
    :cond_f
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirect()Z

    move-result v3

    if-eqz v3, :cond_13

    .line 1699
    if-nez v0, :cond_11

    .line 1700
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-virtual {v3, p1}, Lcom/itextpdf/kernel/pdf/PdfResources;->addColorSpace(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v3

    .line 1701
    .local v3, "name":Lcom/itextpdf/kernel/pdf/PdfName;
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    if-eqz p4, :cond_10

    sget-object v5, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->cs:[B

    goto :goto_9

    :cond_10
    sget-object v5, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->CS:[B

    :goto_9
    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1703
    .end local v3    # "name":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_11
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    invoke-virtual {v3, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloats([F)Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    if-eqz p4, :cond_12

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->scn:[B

    goto :goto_a

    :cond_12
    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->SCN:[B

    :goto_a
    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1705
    :cond_13
    :goto_b
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    if-eqz p4, :cond_14

    sget-object v5, Lcom/itextpdf/kernel/pdf/IsoKey;->FILL_COLOR:Lcom/itextpdf/kernel/pdf/IsoKey;

    goto :goto_c

    :cond_14
    sget-object v5, Lcom/itextpdf/kernel/pdf/IsoKey;->STROKE_COLOR:Lcom/itextpdf/kernel/pdf/IsoKey;

    :goto_c
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 1706
    return-object p0
.end method

.method public setColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1
    .param p1, "colorSpace"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p2, "colorValue"    # [F
    .param p3, "fill"    # Z

    .line 1658
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FLcom/itextpdf/kernel/pdf/colorspace/PdfPattern;Z)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public setDrawingOnPage(Z)V
    .locals 0
    .param p1, "drawingOnPage"    # Z

    .line 856
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->drawingOnPage:Z

    .line 857
    return-void
.end method

.method public setExtGState(Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 6
    .param p1, "extGState"    # Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    .line 2099
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2100
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->updateFromExtGState(Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 2101
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfResources;->addExtGState(Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 2102
    .local v0, "name":Lcom/itextpdf/kernel/pdf/PdfName;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->gs:[B

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 2103
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    sget-object v3, Lcom/itextpdf/kernel/pdf/IsoKey;->EXTENDED_GRAPHICS_STATE:Lcom/itextpdf/kernel/pdf/IsoKey;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 2104
    return-object p0
.end method

.method public setExtGState(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 1
    .param p1, "extGState"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 2114
    new-instance v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 2115
    .local v0, "egs":Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setExtGState(Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2116
    return-object v0
.end method

.method public setFillColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;

    .line 1621
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/colors/Color;Z)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public setFillColorCmyk(FFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 4
    .param p1, "c"    # F
    .param p2, "m"    # F
    .param p3, "y"    # F
    .param p4, "k"    # F

    .line 1819
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->cmyk:Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Cmyk;

    const/4 v1, 0x4

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v2, 0x1

    aput p2, v1, v2

    const/4 v3, 0x2

    aput p3, v1, v3

    const/4 v3, 0x3

    aput p4, v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public setFillColorGray(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 4
    .param p1, "g"    # F

    .line 1716
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->gray:Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Gray;

    const/4 v1, 0x1

    new-array v2, v1, [F

    const/4 v3, 0x0

    aput p1, v2, v3

    invoke-virtual {p0, v0, v2, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public setFillColorRgb(FFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 4
    .param p1, "r"    # F
    .param p2, "g"    # F
    .param p3, "b"    # F

    .line 1756
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rgb:Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Rgb;

    const/4 v1, 0x3

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v2, 0x1

    aput p2, v1, v2

    const/4 v3, 0x2

    aput p3, v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public setFillColorShading(Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Shading;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 3
    .param p1, "shading"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Shading;

    .line 1778
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->pattern:Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, p1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FLcom/itextpdf/kernel/pdf/colorspace/PdfPattern;Z)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public setFlatnessTolerance(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "flatnessTolerance"    # F

    .line 1605
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFlatnessTolerance()F

    move-result v0

    cmpl-float v0, v0, p1

    if-nez v0, :cond_0

    .line 1606
    return-object p0

    .line 1607
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setFlatnessTolerance(F)V

    .line 1608
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 1609
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->i:[B

    .line 1610
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1611
    return-object p0
.end method

.method public setFontAndSize(Lcom/itextpdf/kernel/font/PdfFont;F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 3
    .param p1, "font"    # Lcom/itextpdf/kernel/font/PdfFont;
    .param p2, "size"    # F

    .line 445
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setFontSize(F)V

    .line 446
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfResources;->addFont(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/font/PdfFont;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 447
    .local v0, "fontName":Lcom/itextpdf/kernel/pdf/PdfName;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setFont(Lcom/itextpdf/kernel/font/PdfFont;)V

    .line 448
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    .line 449
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    .line 450
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 451
    invoke-virtual {v1, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tf:[B

    .line 452
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 453
    return-object p0
.end method

.method public setHorizontalScaling(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "scale"    # F

    .line 632
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setHorizontalScaling(F)V

    .line 633
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 634
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 635
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tz:[B

    .line 636
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 637
    return-object p0
.end method

.method public setLeading(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "leading"    # F

    .line 483
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setLeading(F)V

    .line 484
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 485
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 486
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->TL:[B

    .line 487
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 489
    return-object p0
.end method

.method public setLineCapStyle(I)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "lineCapStyle"    # I

    .line 1446
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getLineCapStyle()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 1447
    return-object p0

    .line 1448
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setLineCapStyle(I)V

    .line 1449
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 1450
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeInteger(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->J:[B

    .line 1451
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1452
    return-object p0
.end method

.method public setLineDash(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "phase"    # F

    .line 1502
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getDashPatternArray(F)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setDashPattern(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 1503
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1504
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->d:[B

    .line 1505
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1506
    return-object p0
.end method

.method public setLineDash(FF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 3
    .param p1, "unitsOn"    # F
    .param p2, "phase"    # F

    .line 1522
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    const/4 v1, 0x1

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    invoke-direct {p0, v1, p2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getDashPatternArray([FF)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setDashPattern(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 1523
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1524
    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->d:[B

    .line 1525
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1527
    return-object p0
.end method

.method public setLineDash(FFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 3
    .param p1, "unitsOn"    # F
    .param p2, "unitsOff"    # F
    .param p3, "phase"    # F

    .line 1544
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v2, 0x1

    aput p2, v1, v2

    invoke-direct {p0, v1, p3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getDashPatternArray([FF)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setDashPattern(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 1545
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1546
    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 1547
    invoke-virtual {v0, p3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->d:[B

    .line 1548
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1549
    return-object p0
.end method

.method public setLineDash([FF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 3
    .param p1, "array"    # [F
    .param p2, "phase"    # F

    .line 1565
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getDashPatternArray([FF)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setDashPattern(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 1566
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 1567
    .local v0, "out":Lcom/itextpdf/kernel/pdf/PdfOutputStream;
    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    .line 1568
    const/4 v1, 0x0

    .local v1, "iter":I
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 1569
    aget v2, p1, v1

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    .line 1570
    array-length v2, p1

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_0

    .line 1571
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    .line 1568
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1573
    .end local v1    # "iter":I
    :cond_1
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v1, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->d:[B

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1574
    return-object p0
.end method

.method public setLineJoinStyle(I)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "lineJoinStyle"    # I

    .line 1464
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getLineJoinStyle()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 1465
    return-object p0

    .line 1466
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setLineJoinStyle(I)V

    .line 1467
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 1468
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeInteger(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->j:[B

    .line 1469
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1470
    return-object p0
.end method

.method public setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "lineWidth"    # F

    .line 1427
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getLineWidth()F

    move-result v0

    cmpl-float v0, v0, p1

    if-nez v0, :cond_0

    .line 1428
    return-object p0

    .line 1430
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setLineWidth(F)V

    .line 1431
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 1432
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->w:[B

    .line 1433
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1434
    return-object p0
.end method

.method public setMiterLimit(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "miterLimit"    # F

    .line 1481
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getMiterLimit()F

    move-result v0

    cmpl-float v0, v0, p1

    if-nez v0, :cond_0

    .line 1482
    return-object p0

    .line 1483
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setMiterLimit(F)V

    .line 1484
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 1485
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->M:[B

    .line 1486
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1487
    return-object p0
.end method

.method public setRenderingIntent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "renderingIntent"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 1585
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    sget-object v1, Lcom/itextpdf/kernel/pdf/IsoKey;->RENDERING_INTENT:Lcom/itextpdf/kernel/pdf/IsoKey;

    invoke-virtual {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;)V

    .line 1586
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getRenderingIntent()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1587
    return-object p0

    .line 1588
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setRenderingIntent(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 1589
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 1590
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->ri:[B

    .line 1591
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1592
    return-object p0
.end method

.method public setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;

    .line 1631
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/colors/Color;Z)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public setStrokeColorCmyk(FFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 4
    .param p1, "c"    # F
    .param p2, "m"    # F
    .param p3, "y"    # F
    .param p4, "k"    # F

    .line 1832
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->cmyk:Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Cmyk;

    const/4 v1, 0x4

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v3, 0x1

    aput p2, v1, v3

    const/4 v3, 0x2

    aput p3, v1, v3

    const/4 v3, 0x3

    aput p4, v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public setStrokeColorGray(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 3
    .param p1, "g"    # F

    .line 1726
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->gray:Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Gray;

    const/4 v1, 0x1

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public setStrokeColorRgb(FFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 4
    .param p1, "r"    # F
    .param p2, "g"    # F
    .param p3, "b"    # F

    .line 1768
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rgb:Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Rgb;

    const/4 v1, 0x3

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v3, 0x1

    aput p2, v1, v3

    const/4 v3, 0x2

    aput p3, v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FZ)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public setStrokeColorShading(Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Shading;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 3
    .param p1, "shading"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Shading;

    .line 1788
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->pattern:Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, p1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FLcom/itextpdf/kernel/pdf/colorspace/PdfPattern;Z)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public setTextMatrix(FF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 7
    .param p1, "x"    # F
    .param p2, "y"    # F

    .line 688
    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    move-object v0, p0

    move v5, p1

    move v6, p2

    .end local p1    # "x":F
    .end local p2    # "y":F
    .local v5, "x":F
    .local v6, "y":F
    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setTextMatrix(FFFFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object p1

    return-object p1
.end method

.method public setTextMatrix(FFFFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "a"    # F
    .param p2, "b"    # F
    .param p3, "c"    # F
    .param p4, "d"    # F
    .param p5, "x"    # F
    .param p6, "y"    # F

    .line 652
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 653
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 654
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 655
    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 656
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 657
    invoke-virtual {v0, p3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 658
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 659
    invoke-virtual {v0, p4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 660
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 661
    invoke-virtual {v0, p5}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 662
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 663
    invoke-virtual {v0, p6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tm:[B

    .line 664
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 665
    return-object p0
.end method

.method public setTextMatrix(Lcom/itextpdf/kernel/geom/AffineTransform;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 9
    .param p1, "transform"    # Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 675
    const/4 v0, 0x6

    new-array v0, v0, [F

    .line 676
    .local v0, "matrix":[F
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/geom/AffineTransform;->getMatrix([F)V

    .line 677
    const/4 v1, 0x0

    aget v3, v0, v1

    const/4 v1, 0x1

    aget v4, v0, v1

    const/4 v1, 0x2

    aget v5, v0, v1

    const/4 v1, 0x3

    aget v6, v0, v1

    const/4 v1, 0x4

    aget v7, v0, v1

    const/4 v1, 0x5

    aget v8, v0, v1

    move-object v2, p0

    invoke-virtual/range {v2 .. v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setTextMatrix(FFFFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    return-object v1
.end method

.method public setTextRenderingMode(I)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "textRenderingMode"    # I

    .line 573
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setTextRenderingMode(I)V

    .line 574
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 575
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeInteger(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tr:[B

    .line 576
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 577
    return-object p0
.end method

.method public setTextRise(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "textRise"    # F

    .line 590
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setTextRise(F)V

    .line 591
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 592
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Ts:[B

    .line 593
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 594
    return-object p0
.end method

.method public setWordSpacing(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "wordSpacing"    # F

    .line 604
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->setWordSpacing(F)V

    .line 605
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 606
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tw:[B

    .line 607
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 608
    return-object p0
.end method

.method public showText(Lcom/itextpdf/io/font/otf/GlyphLine;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1
    .param p1, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 712
    new-instance v0, Lcom/itextpdf/io/font/otf/ActualTextIterator;

    invoke-direct {v0, p1}, Lcom/itextpdf/io/font/otf/ActualTextIterator;-><init>(Lcom/itextpdf/io/font/otf/GlyphLine;)V

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->showText(Lcom/itextpdf/io/font/otf/GlyphLine;Ljava/util/Iterator;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method

.method public showText(Lcom/itextpdf/io/font/otf/GlyphLine;Ljava/util/Iterator;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 20
    .param p1, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/otf/GlyphLine;",
            "Ljava/util/Iterator<",
            "Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;",
            ">;)",
            "Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;"
        }
    .end annotation

    .line 724
    .local p2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getColorKeyForText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkDefaultDeviceGrayBlackColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;)V

    .line 725
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    sget-object v4, Lcom/itextpdf/kernel/pdf/IsoKey;->FONT_GLYPHS:Lcom/itextpdf/kernel/pdf/IsoKey;

    const/4 v5, 0x0

    iget-object v6, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 726
    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkIsoConformanceWritingOnContent()V

    .line 728
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v2

    move-object v3, v2

    .local v3, "font":Lcom/itextpdf/kernel/font/PdfFont;
    if-eqz v2, :cond_12

    .line 733
    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/otf/GlyphLine;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/itextpdf/kernel/pdf/IsoKey;->FONT:Lcom/itextpdf/kernel/pdf/IsoKey;

    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v9

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v4 .. v9}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;Ljava/lang/Object;)V

    .line 735
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFontSize()F

    move-result v2

    invoke-static {v2}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v2

    .line 736
    .local v2, "fontSize":F
    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getCharSpacing()F

    move-result v4

    .line 737
    .local v4, "charSpacing":F
    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getHorizontalScaling()F

    move-result v5

    const/high16 v6, 0x42c80000    # 100.0f

    div-float/2addr v5, v6

    .line 738
    .local v5, "scaling":F
    invoke-static/range {p2 .. p2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->iteratorToList(Ljava/util/Iterator;)Ljava/util/List;

    move-result-object v6

    .line 739
    .local v6, "glyphLineParts":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;>;"
    const/4 v7, 0x0

    .local v7, "partIndex":I
    :goto_0
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v8

    if-ge v7, v8, :cond_11

    .line 740
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;

    .line 741
    .local v8, "glyphLinePart":Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;
    iget-object v9, v8, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->actualText:Ljava/lang/String;

    const/4 v10, 0x1

    if-eqz v9, :cond_0

    .line 742
    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 743
    .local v9, "properties":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->ActualText:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v12, Lcom/itextpdf/kernel/pdf/PdfString;

    iget-object v13, v8, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->actualText:Ljava/lang/String;

    const-string v14, "UnicodeBig"

    invoke-direct {v12, v13, v14}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v12, v10}, Lcom/itextpdf/kernel/pdf/PdfString;->setHexWriting(Z)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v12

    invoke-virtual {v9, v11, v12}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 744
    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->Span:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v11, v9}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->beginMarkedContent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .end local v9    # "properties":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    goto :goto_1

    .line 745
    :cond_0
    iget-boolean v9, v8, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->reversed:Z

    if-eqz v9, :cond_1

    .line 746
    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->ReversedChars:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v9}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->beginMarkedContent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_2

    .line 745
    :cond_1
    :goto_1
    nop

    .line 748
    :goto_2
    iget v9, v8, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->start:I

    .line 749
    .local v9, "sub":I
    iget v11, v8, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->start:I

    .local v11, "i":I
    :goto_3
    iget v12, v8, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->end:I

    const/4 v13, 0x0

    if-ge v11, v12, :cond_c

    .line 750
    invoke-virtual {v1, v11}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v12

    .line 751
    .local v12, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v12}, Lcom/itextpdf/io/font/otf/Glyph;->hasOffsets()Z

    move-result v14

    if-eqz v14, :cond_b

    .line 752
    add-int/lit8 v14, v11, -0x1

    sub-int/2addr v14, v9

    if-ltz v14, :cond_2

    .line 753
    add-int/lit8 v14, v11, -0x1

    iget-object v15, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v15

    invoke-virtual {v3, v1, v9, v14, v15}, Lcom/itextpdf/kernel/font/PdfFont;->writeText(Lcom/itextpdf/io/font/otf/GlyphLine;IILcom/itextpdf/kernel/pdf/PdfOutputStream;)V

    .line 754
    iget-object v14, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v14

    sget-object v15, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tj:[B

    invoke-virtual {v14, v15}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 755
    iget-object v14, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v14

    add-int/lit8 v15, v11, -0x1

    .line 756
    invoke-direct {v0, v1, v9, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getSubrangeWidth(Lcom/itextpdf/io/font/otf/GlyphLine;II)F

    move-result v15

    invoke-virtual {v14, v15, v10}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(FZ)Ljava/io/OutputStream;

    move-result-object v14

    check-cast v14, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 757
    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v14

    check-cast v14, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 758
    invoke-virtual {v14, v13}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 759
    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v14, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Td:[B

    .line 760
    invoke-virtual {v13, v14}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 762
    :cond_2
    const/high16 v13, 0x7fc00000    # Float.NaN

    .line 763
    .local v13, "xPlacement":F
    const/high16 v14, 0x7fc00000    # Float.NaN

    .line 764
    .local v14, "yPlacement":F
    invoke-virtual {v12}, Lcom/itextpdf/io/font/otf/Glyph;->hasPlacement()Z

    move-result v15

    if-eqz v15, :cond_7

    .line 767
    const/4 v15, 0x0

    .line 768
    .local v15, "xPlacementAddition":F
    move/from16 v16, v11

    .line 769
    .local v16, "currentGlyphIndex":I
    invoke-virtual {v1, v11}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v17

    move/from16 v10, v16

    .line 771
    .end local v16    # "currentGlyphIndex":I
    .local v10, "currentGlyphIndex":I
    .local v17, "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    :goto_4
    if-eqz v17, :cond_4

    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/io/font/otf/Glyph;->getAnchorDelta()S

    move-result v18

    if-eqz v18, :cond_4

    .line 772
    move/from16 v18, v2

    .end local v2    # "fontSize":F
    .local v18, "fontSize":F
    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/io/font/otf/Glyph;->getXPlacement()S

    move-result v2

    int-to-float v2, v2

    add-float/2addr v15, v2

    .line 773
    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/io/font/otf/Glyph;->getAnchorDelta()S

    move-result v2

    if-nez v2, :cond_3

    .line 774
    goto :goto_5

    .line 776
    :cond_3
    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/io/font/otf/Glyph;->getAnchorDelta()S

    move-result v2

    add-int/2addr v10, v2

    .line 777
    invoke-virtual {v1, v10}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v17

    move/from16 v2, v18

    goto :goto_4

    .line 771
    .end local v18    # "fontSize":F
    .restart local v2    # "fontSize":F
    :cond_4
    move/from16 v18, v2

    .line 780
    .end local v2    # "fontSize":F
    .restart local v18    # "fontSize":F
    :goto_5
    invoke-direct {v0, v1, v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getSubrangeWidth(Lcom/itextpdf/io/font/otf/GlyphLine;II)F

    move-result v2

    neg-float v2, v2

    mul-float v19, v15, v18

    mul-float v19, v19, v5

    add-float v13, v2, v19

    .line 784
    .end local v10    # "currentGlyphIndex":I
    .end local v15    # "xPlacementAddition":F
    .end local v17    # "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    const/4 v2, 0x0

    .line 785
    .local v2, "yPlacementAddition":F
    move v10, v11

    .line 786
    .restart local v10    # "currentGlyphIndex":I
    invoke-virtual {v1, v11}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v15

    .line 787
    .local v15, "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    :goto_6
    if-eqz v15, :cond_6

    invoke-virtual {v15}, Lcom/itextpdf/io/font/otf/Glyph;->getYPlacement()S

    move-result v17

    if-eqz v17, :cond_6

    .line 788
    move/from16 v17, v2

    .end local v2    # "yPlacementAddition":F
    .local v17, "yPlacementAddition":F
    invoke-virtual {v15}, Lcom/itextpdf/io/font/otf/Glyph;->getYPlacement()S

    move-result v2

    int-to-float v2, v2

    add-float v2, v17, v2

    .line 789
    .end local v17    # "yPlacementAddition":F
    .restart local v2    # "yPlacementAddition":F
    invoke-virtual {v15}, Lcom/itextpdf/io/font/otf/Glyph;->getAnchorDelta()S

    move-result v17

    if-nez v17, :cond_5

    .line 790
    goto :goto_7

    .line 792
    :cond_5
    invoke-virtual {v15}, Lcom/itextpdf/io/font/otf/Glyph;->getAnchorDelta()S

    move-result v17

    add-int v10, v10, v17

    .line 793
    invoke-virtual {v1, v10}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v15

    goto :goto_6

    .line 787
    :cond_6
    move/from16 v17, v2

    .line 796
    .end local v2    # "yPlacementAddition":F
    .restart local v17    # "yPlacementAddition":F
    move/from16 v2, v17

    .end local v17    # "yPlacementAddition":F
    .restart local v2    # "yPlacementAddition":F
    :goto_7
    move/from16 v17, v2

    .end local v2    # "yPlacementAddition":F
    .restart local v17    # "yPlacementAddition":F
    invoke-direct {v0, v1, v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getSubrangeYDelta(Lcom/itextpdf/io/font/otf/GlyphLine;II)F

    move-result v2

    neg-float v2, v2

    mul-float v19, v17, v18

    add-float v14, v2, v19

    .line 799
    .end local v10    # "currentGlyphIndex":I
    .end local v15    # "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v17    # "yPlacementAddition":F
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v2

    .line 800
    const/4 v10, 0x1

    invoke-virtual {v2, v13, v10}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(FZ)Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 801
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 802
    invoke-virtual {v2, v14, v10}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(FZ)Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 803
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v10, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Td:[B

    .line 804
    invoke-virtual {v2, v10}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    goto :goto_8

    .line 764
    .end local v18    # "fontSize":F
    .local v2, "fontSize":F
    :cond_7
    move/from16 v18, v2

    .line 806
    .end local v2    # "fontSize":F
    .restart local v18    # "fontSize":F
    :goto_8
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v2

    invoke-virtual {v3, v1, v11, v11, v2}, Lcom/itextpdf/kernel/font/PdfFont;->writeText(Lcom/itextpdf/io/font/otf/GlyphLine;IILcom/itextpdf/kernel/pdf/PdfOutputStream;)V

    .line 807
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v2

    sget-object v10, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tj:[B

    invoke-virtual {v2, v10}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 808
    invoke-static {v13}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-nez v2, :cond_8

    .line 809
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v2

    neg-float v10, v13

    .line 810
    const/4 v15, 0x1

    invoke-virtual {v2, v10, v15}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(FZ)Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 811
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    neg-float v10, v14

    .line 812
    invoke-virtual {v2, v10, v15}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(FZ)Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 813
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v10, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Td:[B

    .line 814
    invoke-virtual {v2, v10}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 817
    :cond_8
    invoke-virtual {v12}, Lcom/itextpdf/io/font/otf/Glyph;->hasAdvance()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 818
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v2

    .line 820
    invoke-virtual {v12}, Lcom/itextpdf/io/font/otf/Glyph;->hasPlacement()Z

    move-result v10

    if-eqz v10, :cond_9

    const/4 v10, 0x0

    goto :goto_9

    :cond_9
    invoke-virtual {v12}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v10

    :goto_9
    invoke-virtual {v12}, Lcom/itextpdf/io/font/otf/Glyph;->getXAdvance()S

    move-result v15

    add-int/2addr v10, v15

    int-to-float v10, v10

    mul-float v10, v10, v18

    add-float/2addr v10, v4

    invoke-direct {v0, v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getWordSpacingAddition(Lcom/itextpdf/io/font/otf/Glyph;)F

    move-result v15

    add-float/2addr v10, v15

    mul-float/2addr v10, v5

    const/4 v15, 0x1

    invoke-virtual {v2, v10, v15}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(FZ)Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 821
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 822
    invoke-virtual {v12}, Lcom/itextpdf/io/font/otf/Glyph;->getYAdvance()S

    move-result v10

    int-to-float v10, v10

    mul-float v10, v10, v18

    invoke-virtual {v2, v10, v15}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(FZ)Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 823
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v10, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Td:[B

    .line 824
    invoke-virtual {v2, v10}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 826
    :cond_a
    add-int/lit8 v2, v11, 0x1

    move v9, v2

    .end local v9    # "sub":I
    .local v2, "sub":I
    goto :goto_a

    .line 751
    .end local v13    # "xPlacement":F
    .end local v14    # "yPlacement":F
    .end local v18    # "fontSize":F
    .local v2, "fontSize":F
    .restart local v9    # "sub":I
    :cond_b
    move/from16 v18, v2

    .line 749
    .end local v2    # "fontSize":F
    .end local v12    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    .restart local v18    # "fontSize":F
    :goto_a
    add-int/lit8 v11, v11, 0x1

    move/from16 v2, v18

    const/4 v10, 0x1

    goto/16 :goto_3

    .end local v18    # "fontSize":F
    .restart local v2    # "fontSize":F
    :cond_c
    move/from16 v18, v2

    .line 829
    .end local v2    # "fontSize":F
    .end local v11    # "i":I
    .restart local v18    # "fontSize":F
    iget v2, v8, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->end:I

    sub-int/2addr v2, v9

    if-lez v2, :cond_d

    .line 830
    iget v2, v8, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->end:I

    const/16 v16, 0x1

    add-int/lit8 v2, v2, -0x1

    iget-object v10, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v10

    invoke-virtual {v3, v1, v9, v2, v10}, Lcom/itextpdf/kernel/font/PdfFont;->writeText(Lcom/itextpdf/io/font/otf/GlyphLine;IILcom/itextpdf/kernel/pdf/PdfOutputStream;)V

    .line 831
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v2

    sget-object v10, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tj:[B

    invoke-virtual {v2, v10}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 833
    :cond_d
    iget-object v2, v8, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->actualText:Ljava/lang/String;

    if-eqz v2, :cond_e

    .line 834
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endMarkedContent()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_b

    .line 835
    :cond_e
    iget-boolean v2, v8, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->reversed:Z

    if-eqz v2, :cond_f

    .line 836
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endMarkedContent()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 838
    :cond_f
    :goto_b
    iget v2, v8, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->end:I

    if-le v2, v9, :cond_10

    add-int/lit8 v2, v7, 0x1

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v10

    if-ge v2, v10, :cond_10

    .line 839
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v2

    iget v10, v8, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->end:I

    const/4 v15, 0x1

    sub-int/2addr v10, v15

    .line 840
    invoke-direct {v0, v1, v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getSubrangeWidth(Lcom/itextpdf/io/font/otf/GlyphLine;II)F

    move-result v10

    invoke-virtual {v2, v10, v15}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(FZ)Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 841
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 842
    invoke-virtual {v2, v13}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 843
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v10, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Td:[B

    .line 844
    invoke-virtual {v2, v10}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 739
    .end local v8    # "glyphLinePart":Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;
    .end local v9    # "sub":I
    :cond_10
    add-int/lit8 v7, v7, 0x1

    move/from16 v2, v18

    goto/16 :goto_0

    .line 847
    .end local v7    # "partIndex":I
    .end local v18    # "fontSize":F
    .restart local v2    # "fontSize":F
    :cond_11
    return-object v0

    .line 729
    .end local v2    # "fontSize":F
    .end local v4    # "charSpacing":F
    .end local v5    # "scaling":F
    .end local v6    # "glyphLineParts":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;>;"
    :cond_12
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v4, "Font and size must be set before writing any text."

    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-direct {v2, v4, v5}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v2
.end method

.method public showText(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 10
    .param p1, "textArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 910
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getColorKeyForText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkDefaultDeviceGrayBlackColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;)V

    .line 911
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    sget-object v2, Lcom/itextpdf/kernel/pdf/IsoKey;->FONT_GLYPHS:Lcom/itextpdf/kernel/pdf/IsoKey;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 912
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkIsoConformanceWritingOnContent()V

    .line 913
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 919
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 920
    .local v0, "text":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 921
    .local v2, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v3, v2, Lcom/itextpdf/kernel/pdf/PdfString;

    if-eqz v3, :cond_0

    .line 922
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 924
    .end local v2    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    goto :goto_0

    .line 925
    :cond_1
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/itextpdf/kernel/pdf/IsoKey;->FONT:Lcom/itextpdf/kernel/pdf/IsoKey;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v9

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v4 .. v9}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;Ljava/lang/Object;)V

    .line 927
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    const-string v2, "["

    invoke-static {v2}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 928
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 929
    .restart local v2    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfObject;->isString()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 930
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    move-object v4, v2

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfString;->getValueBytes()[B

    move-result-object v4

    invoke-static {v3, v4}, Lcom/itextpdf/io/util/StreamUtil;->writeEscapedString(Ljava/io/OutputStream;[B)V

    goto :goto_2

    .line 931
    :cond_2
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfObject;->isNumber()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 932
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    move-object v4, v2

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    .line 934
    .end local v2    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_3
    :goto_2
    goto :goto_1

    .line 935
    :cond_4
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    const-string v2, "]"

    invoke-static {v2}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 936
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->TJ:[B

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 937
    return-object p0

    .line 914
    .end local v0    # "text":Ljava/lang/StringBuilder;
    :cond_5
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Font and size must be set before writing any text."

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->currentGs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method public showText(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .line 698
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getColorKeyForText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkDefaultDeviceGrayBlackColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;)V

    .line 700
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->showTextInt(Ljava/lang/String;)V

    .line 701
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->Tj:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 702
    return-object p0
.end method

.method public stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 2

    .line 1329
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;->STROKE:Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->checkDefaultDeviceGrayBlackColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas$CheckColorMode;)V

    .line 1331
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->S:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 1332
    return-object p0
.end method

.method public writeLiteral(C)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1
    .param p1, "c"    # C

    .line 2225
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeInteger(I)Ljava/io/OutputStream;

    .line 2226
    return-object p0
.end method

.method public writeLiteral(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1
    .param p1, "n"    # F

    .line 2236
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeFloat(F)Ljava/io/OutputStream;

    .line 2237
    return-object p0
.end method

.method public writeLiteral(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .line 2214
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    .line 2215
    return-object p0
.end method
