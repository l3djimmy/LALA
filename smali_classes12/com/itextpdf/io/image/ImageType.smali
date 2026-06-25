.class public final enum Lcom/itextpdf/io/image/ImageType;
.super Ljava/lang/Enum;
.source "ImageType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/io/image/ImageType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/io/image/ImageType;

.field public static final enum BMP:Lcom/itextpdf/io/image/ImageType;

.field public static final enum GIF:Lcom/itextpdf/io/image/ImageType;

.field public static final enum JBIG2:Lcom/itextpdf/io/image/ImageType;

.field public static final enum JPEG:Lcom/itextpdf/io/image/ImageType;

.field public static final enum JPEG2000:Lcom/itextpdf/io/image/ImageType;

.field public static final enum NONE:Lcom/itextpdf/io/image/ImageType;

.field public static final enum PNG:Lcom/itextpdf/io/image/ImageType;

.field public static final enum PS:Lcom/itextpdf/io/image/ImageType;

.field public static final enum RAW:Lcom/itextpdf/io/image/ImageType;

.field public static final enum TIFF:Lcom/itextpdf/io/image/ImageType;

.field public static final enum WMF:Lcom/itextpdf/io/image/ImageType;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 26
    new-instance v0, Lcom/itextpdf/io/image/ImageType;

    const-string v1, "JPEG"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/image/ImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/image/ImageType;->JPEG:Lcom/itextpdf/io/image/ImageType;

    .line 27
    new-instance v0, Lcom/itextpdf/io/image/ImageType;

    const-string v1, "PNG"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/image/ImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/image/ImageType;->PNG:Lcom/itextpdf/io/image/ImageType;

    .line 28
    new-instance v0, Lcom/itextpdf/io/image/ImageType;

    const-string v1, "GIF"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/image/ImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/image/ImageType;->GIF:Lcom/itextpdf/io/image/ImageType;

    .line 29
    new-instance v0, Lcom/itextpdf/io/image/ImageType;

    const-string v1, "BMP"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/image/ImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/image/ImageType;->BMP:Lcom/itextpdf/io/image/ImageType;

    .line 30
    new-instance v0, Lcom/itextpdf/io/image/ImageType;

    const-string v1, "TIFF"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/image/ImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/image/ImageType;->TIFF:Lcom/itextpdf/io/image/ImageType;

    .line 31
    new-instance v0, Lcom/itextpdf/io/image/ImageType;

    const-string v1, "WMF"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/image/ImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/image/ImageType;->WMF:Lcom/itextpdf/io/image/ImageType;

    .line 32
    new-instance v0, Lcom/itextpdf/io/image/ImageType;

    const-string v1, "PS"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/image/ImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/image/ImageType;->PS:Lcom/itextpdf/io/image/ImageType;

    .line 33
    new-instance v0, Lcom/itextpdf/io/image/ImageType;

    const-string v1, "JPEG2000"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/image/ImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/image/ImageType;->JPEG2000:Lcom/itextpdf/io/image/ImageType;

    .line 34
    new-instance v0, Lcom/itextpdf/io/image/ImageType;

    const-string v1, "JBIG2"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/image/ImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/image/ImageType;->JBIG2:Lcom/itextpdf/io/image/ImageType;

    .line 35
    new-instance v0, Lcom/itextpdf/io/image/ImageType;

    const-string v1, "RAW"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/image/ImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/image/ImageType;->RAW:Lcom/itextpdf/io/image/ImageType;

    .line 36
    new-instance v0, Lcom/itextpdf/io/image/ImageType;

    const-string v1, "NONE"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/image/ImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/image/ImageType;->NONE:Lcom/itextpdf/io/image/ImageType;

    .line 25
    sget-object v3, Lcom/itextpdf/io/image/ImageType;->JPEG:Lcom/itextpdf/io/image/ImageType;

    sget-object v4, Lcom/itextpdf/io/image/ImageType;->PNG:Lcom/itextpdf/io/image/ImageType;

    sget-object v5, Lcom/itextpdf/io/image/ImageType;->GIF:Lcom/itextpdf/io/image/ImageType;

    sget-object v6, Lcom/itextpdf/io/image/ImageType;->BMP:Lcom/itextpdf/io/image/ImageType;

    sget-object v7, Lcom/itextpdf/io/image/ImageType;->TIFF:Lcom/itextpdf/io/image/ImageType;

    sget-object v8, Lcom/itextpdf/io/image/ImageType;->WMF:Lcom/itextpdf/io/image/ImageType;

    sget-object v9, Lcom/itextpdf/io/image/ImageType;->PS:Lcom/itextpdf/io/image/ImageType;

    sget-object v10, Lcom/itextpdf/io/image/ImageType;->JPEG2000:Lcom/itextpdf/io/image/ImageType;

    sget-object v11, Lcom/itextpdf/io/image/ImageType;->JBIG2:Lcom/itextpdf/io/image/ImageType;

    sget-object v12, Lcom/itextpdf/io/image/ImageType;->RAW:Lcom/itextpdf/io/image/ImageType;

    sget-object v13, Lcom/itextpdf/io/image/ImageType;->NONE:Lcom/itextpdf/io/image/ImageType;

    filled-new-array/range {v3 .. v13}, [Lcom/itextpdf/io/image/ImageType;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/image/ImageType;->$VALUES:[Lcom/itextpdf/io/image/ImageType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/io/image/ImageType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 25
    const-class v0, Lcom/itextpdf/io/image/ImageType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/image/ImageType;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/io/image/ImageType;
    .locals 1

    .line 25
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->$VALUES:[Lcom/itextpdf/io/image/ImageType;

    invoke-virtual {v0}, [Lcom/itextpdf/io/image/ImageType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/io/image/ImageType;

    return-object v0
.end method
