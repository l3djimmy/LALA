.class public Lcom/itextpdf/kernel/colors/ColorConstants;
.super Ljava/lang/Object;
.source "ColorConstants.java"


# static fields
.field public static final BLACK:Lcom/itextpdf/kernel/colors/Color;

.field public static final BLUE:Lcom/itextpdf/kernel/colors/Color;

.field public static final CYAN:Lcom/itextpdf/kernel/colors/Color;

.field public static final DARK_GRAY:Lcom/itextpdf/kernel/colors/Color;

.field public static final GRAY:Lcom/itextpdf/kernel/colors/Color;

.field public static final GREEN:Lcom/itextpdf/kernel/colors/Color;

.field public static final LIGHT_GRAY:Lcom/itextpdf/kernel/colors/Color;

.field public static final MAGENTA:Lcom/itextpdf/kernel/colors/Color;

.field public static final ORANGE:Lcom/itextpdf/kernel/colors/Color;

.field public static final PINK:Lcom/itextpdf/kernel/colors/Color;

.field public static final RED:Lcom/itextpdf/kernel/colors/Color;

.field public static final WHITE:Lcom/itextpdf/kernel/colors/Color;

.field public static final YELLOW:Lcom/itextpdf/kernel/colors/Color;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 34
    sget-object v0, Lcom/itextpdf/kernel/colors/DeviceRgb;->BLACK:Lcom/itextpdf/kernel/colors/Color;

    sput-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->BLACK:Lcom/itextpdf/kernel/colors/Color;

    .line 38
    sget-object v0, Lcom/itextpdf/kernel/colors/DeviceRgb;->BLUE:Lcom/itextpdf/kernel/colors/Color;

    sput-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->BLUE:Lcom/itextpdf/kernel/colors/Color;

    .line 42
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    const/4 v1, 0x0

    const/16 v2, 0xff

    invoke-direct {v0, v1, v2, v2}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    sput-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->CYAN:Lcom/itextpdf/kernel/colors/Color;

    .line 46
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    const/16 v3, 0x40

    invoke-direct {v0, v3, v3, v3}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    sput-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->DARK_GRAY:Lcom/itextpdf/kernel/colors/Color;

    .line 50
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    const/16 v3, 0x80

    invoke-direct {v0, v3, v3, v3}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    sput-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->GRAY:Lcom/itextpdf/kernel/colors/Color;

    .line 54
    sget-object v0, Lcom/itextpdf/kernel/colors/DeviceRgb;->GREEN:Lcom/itextpdf/kernel/colors/Color;

    sput-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->GREEN:Lcom/itextpdf/kernel/colors/Color;

    .line 58
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    const/16 v3, 0xc0

    invoke-direct {v0, v3, v3, v3}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    sput-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->LIGHT_GRAY:Lcom/itextpdf/kernel/colors/Color;

    .line 62
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    invoke-direct {v0, v2, v1, v2}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    sput-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->MAGENTA:Lcom/itextpdf/kernel/colors/Color;

    .line 66
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    const/16 v3, 0xc8

    invoke-direct {v0, v2, v3, v1}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    sput-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->ORANGE:Lcom/itextpdf/kernel/colors/Color;

    .line 70
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    const/16 v3, 0xaf

    invoke-direct {v0, v2, v3, v3}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    sput-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->PINK:Lcom/itextpdf/kernel/colors/Color;

    .line 74
    sget-object v0, Lcom/itextpdf/kernel/colors/DeviceRgb;->RED:Lcom/itextpdf/kernel/colors/Color;

    sput-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->RED:Lcom/itextpdf/kernel/colors/Color;

    .line 78
    sget-object v0, Lcom/itextpdf/kernel/colors/DeviceRgb;->WHITE:Lcom/itextpdf/kernel/colors/Color;

    sput-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->WHITE:Lcom/itextpdf/kernel/colors/Color;

    .line 82
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    invoke-direct {v0, v2, v2, v1}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    sput-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->YELLOW:Lcom/itextpdf/kernel/colors/Color;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
