.class public final Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;
.super Ljava/lang/Object;
.source "InlineImageParsingUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils$InlineImageParseException;
    }
.end annotation


# static fields
.field private static final EI:[B

.field private static final inlineImageColorSpaceAbbreviationMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;"
        }
    .end annotation
.end field

.field private static final inlineImageEntryAbbreviationMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;"
        }
    .end annotation
.end field

.field private static final inlineImageFilterAbbreviationMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 50
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->EI:[B

    .line 84
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    .line 87
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BitsPerComponent:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->BitsPerComponent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ColorSpace:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ColorSpace:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Decode:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Decode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DecodeParms:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DecodeParms:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Height:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Height:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ImageMask:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ImageMask:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Intent:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Intent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Interpolate:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Interpolate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Width:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Width:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v2, "BPC"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->BitsPerComponent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v2, "CS"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ColorSpace:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v2, "D"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Decode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v2, "DP"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DecodeParms:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v2, "F"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v2, "H"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Height:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v2, "IM"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ImageMask:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v2, "I"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Interpolate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "W"

    invoke-direct {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Width:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageColorSpaceAbbreviationMap:Ljava/util/Map;

    .line 112
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageColorSpaceAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "G"

    invoke-direct {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceGray:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageColorSpaceAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "RGB"

    invoke-direct {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceRGB:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageColorSpaceAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "CMYK"

    invoke-direct {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceCMYK:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageColorSpaceAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Indexed:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageFilterAbbreviationMap:Ljava/util/Map;

    .line 120
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageFilterAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v2, "AHx"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ASCIIHexDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageFilterAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v2, "A85"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ASCII85Decode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageFilterAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v2, "LZW"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->LZWDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageFilterAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v2, "Fl"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->FlateDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageFilterAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v2, "RL"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->RunLengthDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageFilterAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v2, "CCF"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->CCITTFaxDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageFilterAbbreviationMap:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v2, "DCT"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DCTDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    return-void

    :array_0
    .array-data 1
        0x45t
        0x49t
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method private static computeBytesPerRow(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)I
    .locals 6
    .param p0, "imageDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p1, "colorSpaceDic"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 252
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Width:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 253
    .local v0, "wObj":Lcom/itextpdf/kernel/pdf/PdfNumber;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BitsPerComponent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    .line 254
    .local v1, "bpcObj":Lcom/itextpdf/kernel/pdf/PdfNumber;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ColorSpace:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->getComponentsPerPixel(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)I

    move-result v2

    .line 256
    .local v2, "cpp":I
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v3

    .line 257
    .local v3, "w":I
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v4

    goto :goto_0

    :cond_0
    const/4 v4, 0x1

    .line 259
    .local v4, "bpc":I
    :goto_0
    mul-int v5, v3, v4

    mul-int/2addr v5, v2

    add-int/lit8 v5, v5, 0x7

    div-int/lit8 v5, v5, 0x8

    return v5
.end method

.method private static getAlternateValue(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 5
    .param p0, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p1, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 219
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    if-ne p0, v0, :cond_4

    .line 220
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/PdfName;

    if-eqz v0, :cond_1

    .line 221
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageFilterAbbreviationMap:Ljava/util/Map;

    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 222
    .local v0, "altValue":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v0, :cond_0

    .line 223
    return-object v0

    .line 222
    .end local v0    # "altValue":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_0
    goto :goto_1

    .line 225
    :cond_1
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz v0, :cond_3

    .line 226
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 227
    .local v0, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 228
    .local v1, "altArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    .line 229
    .local v2, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v2, :cond_2

    .line 230
    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->getAlternateValue(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 229
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 232
    .end local v3    # "i":I
    :cond_2
    return-object v1

    .line 225
    .end local v0    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v1    # "altArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v2    # "count":I
    :cond_3
    :goto_1
    goto :goto_2

    .line 234
    :cond_4
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ColorSpace:Lcom/itextpdf/kernel/pdf/PdfName;

    if-ne p0, v0, :cond_5

    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/PdfName;

    if-eqz v0, :cond_5

    .line 235
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageColorSpaceAbbreviationMap:Ljava/util/Map;

    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 236
    .local v0, "altValue":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v0, :cond_5

    .line 237
    return-object v0

    .line 240
    .end local v0    # "altValue":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_5
    :goto_2
    return-object p1
.end method

.method static getComponentsPerPixel(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)I
    .locals 5
    .param p0, "colorSpaceName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p1, "colorSpaceDic"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 152
    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 153
    return v0

    .line 154
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceGray:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 155
    return v0

    .line 156
    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceRGB:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 157
    const/4 v0, 0x3

    return v0

    .line 158
    :cond_2
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceCMYK:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 159
    const/4 v0, 0x4

    return v0

    .line 161
    :cond_3
    if-eqz p1, :cond_7

    .line 162
    invoke-virtual {p1, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    .line 163
    .local v1, "colorSpace":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v1, :cond_5

    .line 164
    invoke-virtual {p1, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 165
    .local v0, "tempName":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v0, :cond_4

    .line 166
    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->getComponentsPerPixel(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)I

    move-result v2

    return v2

    .line 168
    .end local v0    # "tempName":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_4
    goto :goto_0

    .line 169
    :cond_5
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Indexed:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsName(I)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 170
    return v0

    .line 172
    :cond_6
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ICCBased:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsName(I)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 173
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsStream(I)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v0

    return v0

    .line 178
    .end local v1    # "colorSpace":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_7
    :goto_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils$InlineImageParseException;

    const-string v1, "Unexpected ColorSpace: {0}."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils$InlineImageParseException;-><init>(Ljava/lang/String;)V

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils$InlineImageParseException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v0

    throw v0
.end method

.method private static imageColorSpaceIsKnown(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z
    .locals 3
    .param p0, "imageDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p1, "colorSpaceDic"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 367
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ColorSpace:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 368
    .local v0, "cs":Lcom/itextpdf/kernel/pdf/PdfName;
    const/4 v1, 0x1

    if-eqz v0, :cond_2

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceGray:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceRGB:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceCMYK:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 371
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 369
    :cond_2
    :goto_1
    return v1
.end method

.method private static inlineImageStreamBytesAreComplete([BLcom/itextpdf/kernel/pdf/PdfDictionary;)Z
    .locals 3
    .param p0, "samples"    # [B
    .param p1, "imageDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 386
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-static {}, Lcom/itextpdf/kernel/pdf/filters/FilterHandlers;->getDefaultFilterHandlers()Ljava/util/Map;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 387
    .local v0, "filters":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;>;"
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->JBIG2Decode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/filters/DoNothingFilter;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/filters/DoNothingFilter;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 388
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FlateDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeStrictFilter;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeStrictFilter;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    invoke-static {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfReader;->decodeBytes([BLcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Map;)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 392
    nop

    .line 393
    .end local v0    # "filters":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;>;"
    const/4 v0, 0x1

    return v0

    .line 390
    :catch_0
    move-exception v0

    .line 391
    .local v0, "ex":Ljava/lang/Exception;
    const/4 v1, 0x0

    return v1
.end method

.method public static parse(Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 3
    .param p0, "ps"    # Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;
    .param p1, "colorSpaceDic"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 140
    invoke-static {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->parseDictionary(Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 141
    .local v0, "inlineImageDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-static {v0, p1, p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->parseSamples(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;)[B

    move-result-object v1

    .line 142
    .local v1, "samples":[B
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>([B)V

    .line 143
    .local v2, "inlineImageAsStreamObject":Lcom/itextpdf/kernel/pdf/PdfStream;
    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->putAll(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 144
    return-object v2
.end method

.method private static parseDictionary(Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 5
    .param p0, "ps"    # Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 191
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 193
    .local v0, "dict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;->readObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .local v1, "key":Lcom/itextpdf/kernel/pdf/PdfObject;
    :goto_0
    if-eqz v1, :cond_1

    const-string v2, "ID"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 194
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;->readObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    .line 195
    .local v2, "value":Lcom/itextpdf/kernel/pdf/PdfObject;
    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageEntryAbbreviationMap:Ljava/util/Map;

    move-object v4, v1

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 196
    .local v3, "resolvedKey":Lcom/itextpdf/kernel/pdf/PdfName;
    if-nez v3, :cond_0

    .line 197
    move-object v3, v1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 199
    :cond_0
    invoke-static {v3, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->getAlternateValue(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 193
    .end local v2    # "value":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v3    # "resolvedKey":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;->readObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    goto :goto_0

    .line 202
    .end local v1    # "key":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;->getTokeniser()Lcom/itextpdf/io/source/PdfTokenizer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->read()I

    move-result v1

    .line 203
    .local v1, "ch":I
    invoke-static {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->isWhitespace(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 208
    return-object v0

    .line 204
    :cond_2
    new-instance v2, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils$InlineImageParseException;

    const-string v3, "Unexpected character {0} found after ID in inline image."

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils$InlineImageParseException;-><init>(Ljava/lang/String;)V

    .line 206
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils$InlineImageParseException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v2

    throw v2
.end method

.method private static parseSamples(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;)[B
    .locals 7
    .param p0, "imageDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p1, "colorSpaceDic"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "ps"    # Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 329
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->imageColorSpaceIsKnown(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 330
    invoke-static {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->parseUnfilteredSamples(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;)[B

    move-result-object v0

    return-object v0

    .line 336
    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 338
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    .line 339
    .local v1, "found":I
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;->getTokeniser()Lcom/itextpdf/io/source/PdfTokenizer;

    move-result-object v2

    .line 340
    .local v2, "tokeniser":Lcom/itextpdf/io/source/PdfTokenizer;
    :goto_0
    invoke-virtual {v2}, Lcom/itextpdf/io/source/PdfTokenizer;->read()I

    move-result v3

    move v4, v3

    .local v4, "ch":I
    const/4 v5, -0x1

    if-eq v3, v5, :cond_4

    .line 341
    const/16 v3, 0x45

    const/4 v5, 0x0

    if-ne v4, v3, :cond_1

    .line 343
    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->EI:[B

    invoke-virtual {v0, v3, v5, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 345
    const/4 v1, 0x1

    goto :goto_0

    .line 346
    :cond_1
    const/4 v3, 0x1

    if-ne v1, v3, :cond_2

    const/16 v3, 0x49

    if-ne v4, v3, :cond_2

    .line 348
    const/4 v1, 0x2

    goto :goto_0

    .line 350
    :cond_2
    const/4 v3, 0x2

    if-ne v1, v3, :cond_3

    invoke-static {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->isWhitespace(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 351
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 352
    .local v3, "tmp":[B
    invoke-static {v3, p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->inlineImageStreamBytesAreComplete([BLcom/itextpdf/kernel/pdf/PdfDictionary;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 353
    return-object v3

    .line 357
    .end local v3    # "tmp":[B
    :cond_3
    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->EI:[B

    invoke-virtual {v0, v3, v5, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 358
    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 359
    const/4 v1, 0x0

    goto :goto_0

    .line 363
    :cond_4
    new-instance v3, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils$InlineImageParseException;

    const-string v5, "Cannot find image data or EI."

    invoke-direct {v3, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils$InlineImageParseException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private static parseUnfilteredSamples(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;)[B
    .locals 10
    .param p0, "imageDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p1, "colorSpaceDic"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "ps"    # Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 276
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 279
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Height:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 281
    .local v0, "h":Lcom/itextpdf/kernel/pdf/PdfNumber;
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils;->computeBytesPerRow(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)I

    move-result v1

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v2

    mul-int/2addr v1, v2

    .line 282
    .local v1, "bytesToRead":I
    new-array v2, v1, [B

    .line 283
    .local v2, "bytes":[B
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;->getTokeniser()Lcom/itextpdf/io/source/PdfTokenizer;

    move-result-object v3

    .line 286
    .local v3, "tokeniser":Lcom/itextpdf/io/source/PdfTokenizer;
    invoke-virtual {v3}, Lcom/itextpdf/io/source/PdfTokenizer;->read()I

    move-result v4

    .line 289
    .local v4, "shouldBeWhiteSpace":I
    const/4 v5, 0x0

    .line 290
    .local v5, "startIndex":I
    invoke-static {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->isWhitespace(I)Z

    move-result v6

    if-eqz v6, :cond_0

    if-nez v4, :cond_1

    .line 292
    :cond_0
    const/4 v6, 0x0

    int-to-byte v7, v4

    aput-byte v7, v2, v6

    .line 293
    add-int/lit8 v5, v5, 0x1

    .line 295
    :cond_1
    move v6, v5

    .local v6, "i":I
    :goto_0
    if-ge v6, v1, :cond_3

    .line 296
    invoke-virtual {v3}, Lcom/itextpdf/io/source/PdfTokenizer;->read()I

    move-result v7

    .line 297
    .local v7, "ch":I
    const/4 v8, -0x1

    if-eq v7, v8, :cond_2

    .line 301
    int-to-byte v8, v7

    aput-byte v8, v2, v6

    .line 295
    .end local v7    # "ch":I
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 298
    .restart local v7    # "ch":I
    :cond_2
    new-instance v8, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils$InlineImageParseException;

    const-string v9, "End of content stream reached before end of image data."

    invoke-direct {v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils$InlineImageParseException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 303
    .end local v6    # "i":I
    .end local v7    # "ch":I
    :cond_3
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;->readObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    .line 304
    .local v6, "ei":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "EI"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 307
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/PdfCanvasParser;->readObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    .line 308
    .local v7, "ei2":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    goto :goto_1

    .line 309
    :cond_4
    new-instance v8, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils$InlineImageParseException;

    const-string v9, "Operator EI not found after the end of image data."

    invoke-direct {v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/util/InlineImageParsingUtils$InlineImageParseException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 312
    .end local v7    # "ei2":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_5
    :goto_1
    return-object v2

    .line 277
    .end local v0    # "h":Lcom/itextpdf/kernel/pdf/PdfNumber;
    .end local v1    # "bytesToRead":I
    .end local v2    # "bytes":[B
    .end local v3    # "tokeniser":Lcom/itextpdf/io/source/PdfTokenizer;
    .end local v4    # "shouldBeWhiteSpace":I
    .end local v5    # "startIndex":I
    .end local v6    # "ei":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Dictionary contains filters"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
