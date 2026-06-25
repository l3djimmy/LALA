.class public final enum Lcom/itextpdf/layout/properties/BlendMode;
.super Ljava/lang/Enum;
.source "BlendMode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/BlendMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum COLOR:Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum COLOR_BURN:Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum COLOR_DODGE:Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum DARKEN:Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum DIFFERENCE:Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum EXCLUSION:Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum HARD_LIGHT:Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum HUE:Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum LIGHTEN:Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum LUMINOSITY:Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum MULTIPLY:Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum NORMAL:Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum OVERLAY:Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum SATURATION:Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum SCREEN:Lcom/itextpdf/layout/properties/BlendMode;

.field public static final enum SOFT_LIGHT:Lcom/itextpdf/layout/properties/BlendMode;


# instance fields
.field private final pdfRepresentation:Lcom/itextpdf/kernel/pdf/PdfName;


# direct methods
.method static constructor <clinit>()V
    .locals 20

    .line 34
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/4 v1, 0x0

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_NORMAL:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "NORMAL"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->NORMAL:Lcom/itextpdf/layout/properties/BlendMode;

    .line 35
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/4 v1, 0x1

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_MULTIPLY:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "MULTIPLY"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->MULTIPLY:Lcom/itextpdf/layout/properties/BlendMode;

    .line 36
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/4 v1, 0x2

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_SCREEN:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "SCREEN"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->SCREEN:Lcom/itextpdf/layout/properties/BlendMode;

    .line 37
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/4 v1, 0x3

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_OVERLAY:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "OVERLAY"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->OVERLAY:Lcom/itextpdf/layout/properties/BlendMode;

    .line 38
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/4 v1, 0x4

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_DARKEN:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "DARKEN"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->DARKEN:Lcom/itextpdf/layout/properties/BlendMode;

    .line 39
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/4 v1, 0x5

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_LIGHTEN:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "LIGHTEN"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->LIGHTEN:Lcom/itextpdf/layout/properties/BlendMode;

    .line 40
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/4 v1, 0x6

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_COLOR_DODGE:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "COLOR_DODGE"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->COLOR_DODGE:Lcom/itextpdf/layout/properties/BlendMode;

    .line 41
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/4 v1, 0x7

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_COLOR_BURN:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "COLOR_BURN"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->COLOR_BURN:Lcom/itextpdf/layout/properties/BlendMode;

    .line 42
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/16 v1, 0x8

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_HARD_LIGHT:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "HARD_LIGHT"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->HARD_LIGHT:Lcom/itextpdf/layout/properties/BlendMode;

    .line 43
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/16 v1, 0x9

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_SOFT_LIGHT:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "SOFT_LIGHT"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->SOFT_LIGHT:Lcom/itextpdf/layout/properties/BlendMode;

    .line 44
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/16 v1, 0xa

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_DIFFERENCE:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "DIFFERENCE"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->DIFFERENCE:Lcom/itextpdf/layout/properties/BlendMode;

    .line 45
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/16 v1, 0xb

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_EXCLUSION:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "EXCLUSION"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->EXCLUSION:Lcom/itextpdf/layout/properties/BlendMode;

    .line 47
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/16 v1, 0xc

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_HUE:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "HUE"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->HUE:Lcom/itextpdf/layout/properties/BlendMode;

    .line 48
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/16 v1, 0xd

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_SATURATION:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "SATURATION"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->SATURATION:Lcom/itextpdf/layout/properties/BlendMode;

    .line 49
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/16 v1, 0xe

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_COLOR:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "COLOR"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->COLOR:Lcom/itextpdf/layout/properties/BlendMode;

    .line 50
    new-instance v0, Lcom/itextpdf/layout/properties/BlendMode;

    const/16 v1, 0xf

    sget-object v2, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_LUMINOSITY:Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v3, "LUMINOSITY"

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/layout/properties/BlendMode;-><init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->LUMINOSITY:Lcom/itextpdf/layout/properties/BlendMode;

    .line 31
    sget-object v4, Lcom/itextpdf/layout/properties/BlendMode;->NORMAL:Lcom/itextpdf/layout/properties/BlendMode;

    sget-object v5, Lcom/itextpdf/layout/properties/BlendMode;->MULTIPLY:Lcom/itextpdf/layout/properties/BlendMode;

    sget-object v6, Lcom/itextpdf/layout/properties/BlendMode;->SCREEN:Lcom/itextpdf/layout/properties/BlendMode;

    sget-object v7, Lcom/itextpdf/layout/properties/BlendMode;->OVERLAY:Lcom/itextpdf/layout/properties/BlendMode;

    sget-object v8, Lcom/itextpdf/layout/properties/BlendMode;->DARKEN:Lcom/itextpdf/layout/properties/BlendMode;

    sget-object v9, Lcom/itextpdf/layout/properties/BlendMode;->LIGHTEN:Lcom/itextpdf/layout/properties/BlendMode;

    sget-object v10, Lcom/itextpdf/layout/properties/BlendMode;->COLOR_DODGE:Lcom/itextpdf/layout/properties/BlendMode;

    sget-object v11, Lcom/itextpdf/layout/properties/BlendMode;->COLOR_BURN:Lcom/itextpdf/layout/properties/BlendMode;

    sget-object v12, Lcom/itextpdf/layout/properties/BlendMode;->HARD_LIGHT:Lcom/itextpdf/layout/properties/BlendMode;

    sget-object v13, Lcom/itextpdf/layout/properties/BlendMode;->SOFT_LIGHT:Lcom/itextpdf/layout/properties/BlendMode;

    sget-object v14, Lcom/itextpdf/layout/properties/BlendMode;->DIFFERENCE:Lcom/itextpdf/layout/properties/BlendMode;

    sget-object v15, Lcom/itextpdf/layout/properties/BlendMode;->EXCLUSION:Lcom/itextpdf/layout/properties/BlendMode;

    sget-object v16, Lcom/itextpdf/layout/properties/BlendMode;->HUE:Lcom/itextpdf/layout/properties/BlendMode;

    sget-object v17, Lcom/itextpdf/layout/properties/BlendMode;->SATURATION:Lcom/itextpdf/layout/properties/BlendMode;

    sget-object v18, Lcom/itextpdf/layout/properties/BlendMode;->COLOR:Lcom/itextpdf/layout/properties/BlendMode;

    sget-object v19, Lcom/itextpdf/layout/properties/BlendMode;->LUMINOSITY:Lcom/itextpdf/layout/properties/BlendMode;

    filled-new-array/range {v4 .. v19}, [Lcom/itextpdf/layout/properties/BlendMode;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/BlendMode;->$VALUES:[Lcom/itextpdf/layout/properties/BlendMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 0
    .param p3, "pdfRepresentation"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ")V"
        }
    .end annotation

    .line 54
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 55
    iput-object p3, p0, Lcom/itextpdf/layout/properties/BlendMode;->pdfRepresentation:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 56
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/BlendMode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 31
    const-class v0, Lcom/itextpdf/layout/properties/BlendMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/BlendMode;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/BlendMode;
    .locals 1

    .line 31
    sget-object v0, Lcom/itextpdf/layout/properties/BlendMode;->$VALUES:[Lcom/itextpdf/layout/properties/BlendMode;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/BlendMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/BlendMode;

    return-object v0
.end method


# virtual methods
.method public getPdfRepresentation()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BlendMode;->pdfRepresentation:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method
