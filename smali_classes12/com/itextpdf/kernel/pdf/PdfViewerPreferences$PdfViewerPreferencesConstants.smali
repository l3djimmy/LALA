.class public final enum Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;
.super Ljava/lang/Enum;
.source "PdfViewerPreferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PdfViewerPreferencesConstants"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum APP_DEFAULT:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum ART_BOX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum BLEED_BOX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum CROP_BOX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum DUPLEX_FLIP_LONG_EDGE:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum DUPLEX_FLIP_SHORT_EDGE:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum MEDIA_BOX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum NONE:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum PRINT_AREA:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum PRINT_CLIP:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum RIGHT_TO_LEFT:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum SIMPLEX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum TRIM_BOX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum USE_NONE:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum USE_OC:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum USE_OUTLINES:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum USE_THUMBS:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum VIEW_AREA:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

.field public static final enum VIEW_CLIP:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;


# direct methods
.method static constructor <clinit>()V
    .locals 23

    .line 35
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "USE_NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->USE_NONE:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 39
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "USE_OUTLINES"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->USE_OUTLINES:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 43
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "USE_THUMBS"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->USE_THUMBS:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 47
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "USE_OC"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->USE_OC:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 51
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "LEFT_TO_RIGHT"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 55
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "RIGHT_TO_LEFT"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->RIGHT_TO_LEFT:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 59
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "MEDIA_BOX"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->MEDIA_BOX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 63
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "CROP_BOX"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->CROP_BOX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 67
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "BLEED_BOX"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->BLEED_BOX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 71
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "TRIM_BOX"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->TRIM_BOX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 75
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "ART_BOX"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->ART_BOX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 79
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "VIEW_AREA"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->VIEW_AREA:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 83
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "VIEW_CLIP"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->VIEW_CLIP:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 87
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "PRINT_AREA"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->PRINT_AREA:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 91
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "PRINT_CLIP"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->PRINT_CLIP:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 95
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "NONE"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->NONE:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 99
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "APP_DEFAULT"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->APP_DEFAULT:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 103
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "SIMPLEX"

    const/16 v2, 0x11

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->SIMPLEX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 107
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "DUPLEX_FLIP_SHORT_EDGE"

    const/16 v2, 0x12

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->DUPLEX_FLIP_SHORT_EDGE:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 111
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    const-string v1, "DUPLEX_FLIP_LONG_EDGE"

    const/16 v2, 0x13

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->DUPLEX_FLIP_LONG_EDGE:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 31
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->USE_NONE:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->USE_OUTLINES:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->USE_THUMBS:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->USE_OC:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->RIGHT_TO_LEFT:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->MEDIA_BOX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->CROP_BOX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->BLEED_BOX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v12, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->TRIM_BOX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v13, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->ART_BOX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v14, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->VIEW_AREA:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v15, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->VIEW_CLIP:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v16, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->PRINT_AREA:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v17, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->PRINT_CLIP:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v18, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->NONE:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v19, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->APP_DEFAULT:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v20, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->SIMPLEX:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v21, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->DUPLEX_FLIP_SHORT_EDGE:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    sget-object v22, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->DUPLEX_FLIP_LONG_EDGE:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    filled-new-array/range {v3 .. v22}, [Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->$VALUES:[Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 31
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 31
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;
    .locals 1

    .line 31
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->$VALUES:[Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    return-object v0
.end method
