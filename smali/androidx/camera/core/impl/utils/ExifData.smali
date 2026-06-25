.class public Landroidx/camera/core/impl/utils/ExifData;
.super Ljava/lang/Object;
.source "ExifData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/utils/ExifData$Builder;,
        Landroidx/camera/core/impl/utils/ExifData$WhiteBalanceMode;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field static final EXIF_POINTER_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

.field static final EXIF_TAGS:[[Landroidx/camera/core/impl/utils/ExifTag;

.field private static final IFD_EXIF_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

.field static final IFD_FORMAT_NAMES:[Ljava/lang/String;

.field private static final IFD_GPS_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

.field private static final IFD_INTEROPERABILITY_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

.field private static final IFD_TIFF_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

.field static final IFD_TYPE_EXIF:I = 0x1

.field static final IFD_TYPE_GPS:I = 0x2

.field static final IFD_TYPE_INTEROPERABILITY:I = 0x3

.field static final IFD_TYPE_PRIMARY:I = 0x0

.field private static final MM_IN_MICRONS:I = 0x3e8

.field private static final TAG:Ljava/lang/String; = "ExifData"

.field static final TAG_EXIF_IFD_POINTER:Ljava/lang/String; = "ExifIFDPointer"

.field static final TAG_GPS_INFO_IFD_POINTER:Ljava/lang/String; = "GPSInfoIFDPointer"

.field static final TAG_INTEROPERABILITY_IFD_POINTER:Ljava/lang/String; = "InteroperabilityIFDPointer"

.field static final TAG_SUB_IFD_POINTER:Ljava/lang/String; = "SubIFDPointer"

.field static final sTagSetForCompatibility:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mAttributes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroidx/camera/core/impl/utils/ExifAttribute;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mByteOrder:Ljava/nio/ByteOrder;


# direct methods
.method static constructor <clinit>()V
    .locals 23

    .line 164
    const/16 v0, 0xe

    new-array v1, v0, [Ljava/lang/String;

    const-string v2, ""

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "BYTE"

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const-string/jumbo v2, "STRING"

    const/4 v5, 0x2

    aput-object v2, v1, v5

    const-string/jumbo v2, "USHORT"

    const/4 v6, 0x3

    aput-object v2, v1, v6

    const-string/jumbo v2, "ULONG"

    const/4 v7, 0x4

    aput-object v2, v1, v7

    const-string/jumbo v2, "URATIONAL"

    const/4 v8, 0x5

    aput-object v2, v1, v8

    const-string/jumbo v2, "SBYTE"

    const/4 v9, 0x6

    aput-object v2, v1, v9

    const-string/jumbo v2, "UNDEFINED"

    const/4 v10, 0x7

    aput-object v2, v1, v10

    const-string/jumbo v2, "SSHORT"

    const/16 v11, 0x8

    aput-object v2, v1, v11

    const-string/jumbo v2, "SLONG"

    const/16 v12, 0x9

    aput-object v2, v1, v12

    const-string/jumbo v2, "SRATIONAL"

    const/16 v13, 0xa

    aput-object v2, v1, v13

    const-string/jumbo v2, "SINGLE"

    const/16 v14, 0xb

    aput-object v2, v1, v14

    const-string v2, "DOUBLE"

    const/16 v15, 0xc

    aput-object v2, v1, v15

    const-string v2, "IFD"

    move/from16 v16, v11

    const/16 v11, 0xd

    aput-object v2, v1, v11

    sput-object v1, Landroidx/camera/core/impl/utils/ExifData;->IFD_FORMAT_NAMES:[Ljava/lang/String;

    .line 182
    new-array v1, v0, [Landroidx/camera/core/impl/utils/ExifTag;

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    move/from16 v17, v12

    const-string v12, "ImageWidth"

    move/from16 v18, v14

    const/16 v14, 0x100

    invoke-direct {v2, v12, v14, v6, v7}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;III)V

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v12, "ImageLength"

    const/16 v14, 0x101

    invoke-direct {v2, v12, v14, v6, v7}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;III)V

    aput-object v2, v1, v4

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v12, "Make"

    const/16 v14, 0x10f

    invoke-direct {v2, v12, v14, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v5

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v12, "Model"

    const/16 v14, 0x110

    invoke-direct {v2, v12, v14, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v6

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v12, "Orientation"

    const/16 v14, 0x112

    invoke-direct {v2, v12, v14, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v7

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v12, "XResolution"

    const/16 v14, 0x11a

    invoke-direct {v2, v12, v14, v8}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v8

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v12, "YResolution"

    const/16 v14, 0x11b

    invoke-direct {v2, v12, v14, v8}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v9

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v12, "ResolutionUnit"

    const/16 v14, 0x128

    invoke-direct {v2, v12, v14, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v10

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v12, "Software"

    const/16 v14, 0x131

    invoke-direct {v2, v12, v14, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v16

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v12, "DateTime"

    const/16 v14, 0x132

    invoke-direct {v2, v12, v14, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v17

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v12, "YCbCrPositioning"

    const/16 v14, 0x213

    invoke-direct {v2, v12, v14, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v13

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v12, "SubIFDPointer"

    const/16 v14, 0x14a

    invoke-direct {v2, v12, v14, v7}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v18

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v14, "ExifIFDPointer"

    move/from16 v19, v0

    const v0, 0x8769

    invoke-direct {v2, v14, v0, v7}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v15

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v0, "GPSInfoIFDPointer"

    move/from16 v20, v15

    const v15, 0x8825

    invoke-direct {v2, v0, v15, v7}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v11

    sput-object v1, Landroidx/camera/core/impl/utils/ExifData;->IFD_TIFF_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    .line 202
    const/16 v1, 0x25

    new-array v1, v1, [Landroidx/camera/core/impl/utils/ExifTag;

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const v15, 0x829a

    move/from16 v21, v9

    const-string v9, "ExposureTime"

    invoke-direct {v2, v9, v15, v8}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v15, "FNumber"

    const v3, 0x829d

    invoke-direct {v2, v15, v3, v8}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v4

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "ExposureProgram"

    const v15, 0x8822

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v5

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v3, "PhotographicSensitivity"

    const v15, 0x8827

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v6

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v3, "SensitivityType"

    const v15, 0x8830

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v7

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "ExifVersion"

    const v15, 0x9000

    invoke-direct {v2, v3, v15, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v8

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "DateTimeOriginal"

    const v15, 0x9003

    invoke-direct {v2, v3, v15, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v21

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "DateTimeDigitized"

    const v15, 0x9004

    invoke-direct {v2, v3, v15, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v10

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "ComponentsConfiguration"

    const v15, 0x9101

    invoke-direct {v2, v3, v15, v10}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v16

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v3, "ShutterSpeedValue"

    const v15, 0x9201

    invoke-direct {v2, v3, v15, v13}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v17

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "ApertureValue"

    const v15, 0x9202

    invoke-direct {v2, v3, v15, v8}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v13

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "BrightnessValue"

    const v15, 0x9203

    invoke-direct {v2, v3, v15, v13}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v18

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "ExposureBiasValue"

    const v15, 0x9204

    invoke-direct {v2, v3, v15, v13}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v20

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "MaxApertureValue"

    const v15, 0x9205

    invoke-direct {v2, v3, v15, v8}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v11

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "MeteringMode"

    const v15, 0x9207

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v19

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "LightSource"

    const v15, 0x9208

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0xf

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "Flash"

    const v15, 0x9209

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x10

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "FocalLength"

    const v15, 0x920a

    invoke-direct {v2, v3, v15, v8}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x11

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v3, "SubSecTime"

    const v15, 0x9290

    invoke-direct {v2, v3, v15, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x12

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v3, "SubSecTimeOriginal"

    const v15, 0x9291

    invoke-direct {v2, v3, v15, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x13

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v3, "SubSecTimeDigitized"

    const v15, 0x9292

    invoke-direct {v2, v3, v15, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x14

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "FlashpixVersion"

    const v15, 0xa000

    invoke-direct {v2, v3, v15, v10}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x15

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "ColorSpace"

    const v15, 0xa001

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x16

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v3, "PixelXDimension"

    const v15, 0xa002

    invoke-direct {v2, v3, v15, v6, v7}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;III)V

    const/16 v3, 0x17

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v3, "PixelYDimension"

    const v15, 0xa003

    invoke-direct {v2, v3, v15, v6, v7}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;III)V

    const/16 v3, 0x18

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "InteroperabilityIFDPointer"

    const v15, 0xa005

    invoke-direct {v2, v3, v15, v7}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x19

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "FocalPlaneResolutionUnit"

    const v15, 0xa210

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x1a

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v3, "SensingMethod"

    const v15, 0xa217

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x1b

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "FileSource"

    const v15, 0xa300

    invoke-direct {v2, v3, v15, v10}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x1c

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v3, "SceneType"

    const v15, 0xa301

    invoke-direct {v2, v3, v15, v10}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x1d

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "CustomRendered"

    const v15, 0xa401

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x1e

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "ExposureMode"

    const v15, 0xa402

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x1f

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v3, "WhiteBalance"

    const v15, 0xa403

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x20

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v3, "SceneCaptureType"

    const v15, 0xa406

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x21

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "Contrast"

    const v15, 0xa408

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x22

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v3, "Saturation"

    const v15, 0xa409

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x23

    aput-object v2, v1, v3

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string/jumbo v3, "Sharpness"

    const v15, 0xa40a

    invoke-direct {v2, v3, v15, v6}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v3, 0x24

    aput-object v2, v1, v3

    sput-object v1, Landroidx/camera/core/impl/utils/ExifData;->IFD_EXIF_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    .line 244
    new-array v1, v11, [Landroidx/camera/core/impl/utils/ExifTag;

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "GPSVersionID"

    const/4 v11, 0x0

    invoke-direct {v2, v3, v11, v4}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v11

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "GPSLatitudeRef"

    invoke-direct {v2, v3, v4, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v4

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "GPSLatitude"

    invoke-direct {v2, v3, v5, v8, v13}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;III)V

    aput-object v2, v1, v5

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "GPSLongitudeRef"

    invoke-direct {v2, v3, v6, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v6

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "GPSLongitude"

    invoke-direct {v2, v3, v7, v8, v13}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;III)V

    aput-object v2, v1, v7

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "GPSAltitudeRef"

    invoke-direct {v2, v3, v8, v4}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v8

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "GPSAltitude"

    move/from16 v11, v21

    invoke-direct {v2, v3, v11, v8}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v11

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "GPSTimeStamp"

    invoke-direct {v2, v3, v10, v8}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v10

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "GPSSpeedRef"

    move/from16 v8, v20

    invoke-direct {v2, v3, v8, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v16

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "GPSTrackRef"

    move/from16 v8, v19

    invoke-direct {v2, v3, v8, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v17

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "GPSImgDirectionRef"

    const/16 v8, 0x10

    invoke-direct {v2, v3, v8, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v13

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "GPSDestBearingRef"

    const/16 v8, 0x17

    invoke-direct {v2, v3, v8, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v18

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v3, "GPSDestDistanceRef"

    const/16 v8, 0x19

    invoke-direct {v2, v3, v8, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v20, 0xc

    aput-object v2, v1, v20

    sput-object v1, Landroidx/camera/core/impl/utils/ExifData;->IFD_GPS_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    .line 263
    new-array v1, v7, [Landroidx/camera/core/impl/utils/ExifTag;

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const/16 v3, 0x14a

    invoke-direct {v2, v12, v3, v7}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v22, 0x0

    aput-object v2, v1, v22

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const v3, 0x8769

    invoke-direct {v2, v14, v3, v7}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v4

    new-instance v2, Landroidx/camera/core/impl/utils/ExifTag;

    const v3, 0x8825

    invoke-direct {v2, v0, v3, v7}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v2, v1, v5

    new-instance v0, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v2, "InteroperabilityIFDPointer"

    const v3, 0xa005

    invoke-direct {v0, v2, v3, v7}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    aput-object v0, v1, v6

    sput-object v1, Landroidx/camera/core/impl/utils/ExifData;->EXIF_POINTER_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    .line 271
    new-array v0, v4, [Landroidx/camera/core/impl/utils/ExifTag;

    new-instance v1, Landroidx/camera/core/impl/utils/ExifTag;

    const-string v2, "InteroperabilityIndex"

    invoke-direct {v1, v2, v4, v5}, Landroidx/camera/core/impl/utils/ExifTag;-><init>(Ljava/lang/String;II)V

    const/16 v22, 0x0

    aput-object v1, v0, v22

    sput-object v0, Landroidx/camera/core/impl/utils/ExifData;->IFD_INTEROPERABILITY_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    .line 276
    new-array v0, v7, [[Landroidx/camera/core/impl/utils/ExifTag;

    sget-object v1, Landroidx/camera/core/impl/utils/ExifData;->IFD_TIFF_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    aput-object v1, v0, v22

    sget-object v1, Landroidx/camera/core/impl/utils/ExifData;->IFD_EXIF_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    aput-object v1, v0, v4

    sget-object v1, Landroidx/camera/core/impl/utils/ExifData;->IFD_GPS_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    aput-object v1, v0, v5

    sget-object v1, Landroidx/camera/core/impl/utils/ExifData;->IFD_INTEROPERABILITY_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    aput-object v1, v0, v6

    sput-object v0, Landroidx/camera/core/impl/utils/ExifData;->EXIF_TAGS:[[Landroidx/camera/core/impl/utils/ExifTag;

    .line 287
    new-instance v0, Ljava/util/HashSet;

    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "FNumber"

    const/16 v22, 0x0

    aput-object v2, v1, v22

    aput-object v9, v1, v4

    const-string v2, "GPSTimeStamp"

    aput-object v2, v1, v5

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Landroidx/camera/core/impl/utils/ExifData;->sTagSetForCompatibility:Ljava/util/HashSet;

    return-void
.end method

.method constructor <init>(Ljava/nio/ByteOrder;Ljava/util/List;)V
    .locals 2
    .param p1, "order"    # Ljava/nio/ByteOrder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteOrder;",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroidx/camera/core/impl/utils/ExifAttribute;",
            ">;>;)V"
        }
    .end annotation

    .line 295
    .local p2, "attributes":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Landroidx/camera/core/impl/utils/ExifAttribute;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 296
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    sget-object v1, Landroidx/camera/core/impl/utils/ExifData;->EXIF_TAGS:[[Landroidx/camera/core/impl/utils/ExifTag;

    array-length v1, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Malformed attributes list. Number of IFDs mismatch."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 298
    iput-object p1, p0, Landroidx/camera/core/impl/utils/ExifData;->mByteOrder:Ljava/nio/ByteOrder;

    .line 299
    iput-object p2, p0, Landroidx/camera/core/impl/utils/ExifData;->mAttributes:Ljava/util/List;

    .line 300
    return-void
.end method

.method public static builderForDevice()Landroidx/camera/core/impl/utils/ExifData$Builder;
    .locals 4

    .line 415
    new-instance v0, Landroidx/camera/core/impl/utils/ExifData$Builder;

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-direct {v0, v1}, Landroidx/camera/core/impl/utils/ExifData$Builder;-><init>(Ljava/nio/ByteOrder;)V

    .line 416
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Orientation"

    invoke-virtual {v0, v3, v2}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setAttribute(Ljava/lang/String;Ljava/lang/String;)Landroidx/camera/core/impl/utils/ExifData$Builder;

    move-result-object v0

    .line 417
    const-string/jumbo v2, "XResolution"

    const-string v3, "72/1"

    invoke-virtual {v0, v2, v3}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setAttribute(Ljava/lang/String;Ljava/lang/String;)Landroidx/camera/core/impl/utils/ExifData$Builder;

    move-result-object v0

    .line 418
    const-string/jumbo v2, "YResolution"

    invoke-virtual {v0, v2, v3}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setAttribute(Ljava/lang/String;Ljava/lang/String;)Landroidx/camera/core/impl/utils/ExifData$Builder;

    move-result-object v0

    .line 419
    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "ResolutionUnit"

    invoke-virtual {v0, v3, v2}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setAttribute(Ljava/lang/String;Ljava/lang/String;)Landroidx/camera/core/impl/utils/ExifData$Builder;

    move-result-object v0

    .line 421
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 420
    const-string/jumbo v2, "YCbCrPositioning"

    invoke-virtual {v0, v2, v1}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setAttribute(Ljava/lang/String;Ljava/lang/String;)Landroidx/camera/core/impl/utils/ExifData$Builder;

    move-result-object v0

    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 423
    const-string v2, "Make"

    invoke-virtual {v0, v2, v1}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setAttribute(Ljava/lang/String;Ljava/lang/String;)Landroidx/camera/core/impl/utils/ExifData$Builder;

    move-result-object v0

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 424
    const-string v2, "Model"

    invoke-virtual {v0, v2, v1}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setAttribute(Ljava/lang/String;Ljava/lang/String;)Landroidx/camera/core/impl/utils/ExifData$Builder;

    move-result-object v0

    .line 415
    return-object v0
.end method

.method public static create(Landroidx/camera/core/ImageProxy;I)Landroidx/camera/core/impl/utils/ExifData;
    .locals 3
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p1, "rotationDegrees"    # I

    .line 310
    invoke-static {}, Landroidx/camera/core/impl/utils/ExifData;->builderForDevice()Landroidx/camera/core/impl/utils/ExifData$Builder;

    move-result-object v0

    .line 311
    .local v0, "builder":Landroidx/camera/core/impl/utils/ExifData$Builder;
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getImageInfo()Landroidx/camera/core/ImageInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 312
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getImageInfo()Landroidx/camera/core/ImageInfo;

    move-result-object v1

    invoke-interface {v1, v0}, Landroidx/camera/core/ImageInfo;->populateExifData(Landroidx/camera/core/impl/utils/ExifData$Builder;)V

    .line 318
    :cond_0
    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setOrientationDegrees(I)Landroidx/camera/core/impl/utils/ExifData$Builder;

    .line 320
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setImageWidth(I)Landroidx/camera/core/impl/utils/ExifData$Builder;

    move-result-object v1

    .line 321
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v2

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setImageHeight(I)Landroidx/camera/core/impl/utils/ExifData$Builder;

    move-result-object v1

    .line 322
    invoke-virtual {v1}, Landroidx/camera/core/impl/utils/ExifData$Builder;->build()Landroidx/camera/core/impl/utils/ExifData;

    move-result-object v1

    .line 320
    return-object v1
.end method

.method private getExifAttribute(Ljava/lang/String;)Landroidx/camera/core/impl/utils/ExifAttribute;
    .locals 2
    .param p1, "tag"    # Ljava/lang/String;

    .line 391
    const-string v0, "ISOSpeedRatings"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 396
    const-string/jumbo p1, "PhotographicSensitivity"

    .line 400
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Landroidx/camera/core/impl/utils/ExifData;->EXIF_TAGS:[[Landroidx/camera/core/impl/utils/ExifTag;

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 401
    iget-object v1, p0, Landroidx/camera/core/impl/utils/ExifData;->mAttributes:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/utils/ExifAttribute;

    .line 402
    .local v1, "value":Landroidx/camera/core/impl/utils/ExifAttribute;
    if-eqz v1, :cond_1

    .line 403
    return-object v1

    .line 400
    .end local v1    # "value":Landroidx/camera/core/impl/utils/ExifAttribute;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 406
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "tag"    # Ljava/lang/String;

    .line 349
    invoke-direct {p0, p1}, Landroidx/camera/core/impl/utils/ExifData;->getExifAttribute(Ljava/lang/String;)Landroidx/camera/core/impl/utils/ExifAttribute;

    move-result-object v0

    .line 350
    .local v0, "attribute":Landroidx/camera/core/impl/utils/ExifAttribute;
    const/4 v1, 0x0

    if-eqz v0, :cond_5

    .line 351
    sget-object v2, Landroidx/camera/core/impl/utils/ExifData;->sTagSetForCompatibility:Ljava/util/HashSet;

    invoke-virtual {v2, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 352
    iget-object v1, p0, Landroidx/camera/core/impl/utils/ExifData;->mByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/utils/ExifAttribute;->getStringValue(Ljava/nio/ByteOrder;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 354
    :cond_0
    const-string v2, "GPSTimeStamp"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 356
    iget v2, v0, Landroidx/camera/core/impl/utils/ExifAttribute;->format:I

    const/4 v3, 0x5

    const-string v4, "ExifData"

    if-eq v2, v3, :cond_1

    iget v2, v0, Landroidx/camera/core/impl/utils/ExifAttribute;->format:I

    const/16 v3, 0xa

    if-eq v2, v3, :cond_1

    .line 358
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "GPS Timestamp format is not rational. format="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Landroidx/camera/core/impl/utils/ExifAttribute;->format:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    return-object v1

    .line 362
    :cond_1
    iget-object v2, p0, Landroidx/camera/core/impl/utils/ExifData;->mByteOrder:Ljava/nio/ByteOrder;

    .line 363
    invoke-virtual {v0, v2}, Landroidx/camera/core/impl/utils/ExifAttribute;->getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Landroidx/camera/core/impl/utils/LongRational;

    .line 364
    .local v2, "array":[Landroidx/camera/core/impl/utils/LongRational;
    if-eqz v2, :cond_3

    array-length v3, v2

    const/4 v5, 0x3

    if-eq v3, v5, :cond_2

    goto :goto_0

    .line 368
    :cond_2
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v3, 0x0

    aget-object v4, v2, v3

    .line 369
    invoke-virtual {v4}, Landroidx/camera/core/impl/utils/LongRational;->getNumerator()J

    move-result-wide v4

    long-to-float v4, v4

    aget-object v3, v2, v3

    invoke-virtual {v3}, Landroidx/camera/core/impl/utils/LongRational;->getDenominator()J

    move-result-wide v5

    long-to-float v3, v5

    div-float/2addr v4, v3

    float-to-int v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aget-object v5, v2, v4

    .line 370
    invoke-virtual {v5}, Landroidx/camera/core/impl/utils/LongRational;->getNumerator()J

    move-result-wide v5

    long-to-float v5, v5

    aget-object v4, v2, v4

    invoke-virtual {v4}, Landroidx/camera/core/impl/utils/LongRational;->getDenominator()J

    move-result-wide v6

    long-to-float v4, v6

    div-float/2addr v5, v4

    float-to-int v4, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x2

    aget-object v6, v2, v5

    .line 371
    invoke-virtual {v6}, Landroidx/camera/core/impl/utils/LongRational;->getNumerator()J

    move-result-wide v6

    long-to-float v6, v6

    aget-object v5, v2, v5

    invoke-virtual {v5}, Landroidx/camera/core/impl/utils/LongRational;->getDenominator()J

    move-result-wide v7

    long-to-float v5, v7

    div-float/2addr v6, v5

    float-to-int v5, v6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v3, v4, v5}, [Ljava/lang/Object;

    move-result-object v3

    .line 368
    const-string v4, "%02d:%02d:%02d"

    invoke-static {v1, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 365
    :cond_3
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid GPS Timestamp array. array="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    return-object v1

    .line 374
    .end local v2    # "array":[Landroidx/camera/core/impl/utils/LongRational;
    :cond_4
    :try_start_0
    iget-object v2, p0, Landroidx/camera/core/impl/utils/ExifData;->mByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v2}, Landroidx/camera/core/impl/utils/ExifAttribute;->getDoubleValue(Ljava/nio/ByteOrder;)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 375
    :catch_0
    move-exception v2

    .line 376
    .local v2, "e":Ljava/lang/NumberFormatException;
    return-object v1

    .line 379
    .end local v2    # "e":Ljava/lang/NumberFormatException;
    :cond_5
    return-object v1
.end method

.method getAttributes(I)Ljava/util/Map;
    .locals 3
    .param p1, "ifdIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroidx/camera/core/impl/utils/ExifAttribute;",
            ">;"
        }
    .end annotation

    .line 335
    sget-object v0, Landroidx/camera/core/impl/utils/ExifData;->EXIF_TAGS:[[Landroidx/camera/core/impl/utils/ExifTag;

    array-length v0, v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid IFD index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ". Index should be between [0, EXIF_TAGS.length] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v1}, Landroidx/core/util/Preconditions;->checkArgumentInRange(IIILjava/lang/String;)I

    .line 338
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ExifData;->mAttributes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    return-object v0
.end method

.method public getByteOrder()Ljava/nio/ByteOrder;
    .locals 1

    .line 330
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ExifData;->mByteOrder:Ljava/nio/ByteOrder;

    return-object v0
.end method
