.class public final Lcom/itextpdf/io/font/constants/FontDescriptorFlags;
.super Ljava/lang/Object;
.source "FontDescriptorFlags.java"


# static fields
.field public static AllCap:I

.field public static FixedPitch:I

.field public static ForceBold:I

.field public static Italic:I

.field public static Nonsymbolic:I

.field public static Script:I

.field public static Serif:I

.field public static SmallCap:I

.field public static Symbolic:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 32
    const/4 v0, 0x1

    sput v0, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->FixedPitch:I

    .line 33
    const/4 v0, 0x2

    sput v0, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->Serif:I

    .line 34
    const/4 v0, 0x4

    sput v0, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->Symbolic:I

    .line 35
    const/16 v0, 0x8

    sput v0, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->Script:I

    .line 36
    const/16 v0, 0x20

    sput v0, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->Nonsymbolic:I

    .line 37
    const/16 v0, 0x40

    sput v0, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->Italic:I

    .line 38
    const/high16 v0, 0x10000

    sput v0, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->AllCap:I

    .line 39
    const/high16 v0, 0x20000

    sput v0, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->SmallCap:I

    .line 40
    const/high16 v0, 0x40000

    sput v0, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->ForceBold:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method
