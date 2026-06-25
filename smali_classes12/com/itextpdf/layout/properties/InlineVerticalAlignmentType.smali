.class public final enum Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;
.super Ljava/lang/Enum;
.source "InlineVerticalAlignmentType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

.field public static final enum BASELINE:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

.field public static final enum BOTTOM:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

.field public static final enum FIXED:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

.field public static final enum FRACTION:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

.field public static final enum MIDDLE:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

.field public static final enum SUB:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

.field public static final enum SUPER:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

.field public static final enum TEXT_BOTTOM:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

.field public static final enum TEXT_TOP:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

.field public static final enum TOP:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 30
    new-instance v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    const-string v1, "BASELINE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->BASELINE:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    .line 31
    new-instance v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    const-string v1, "TEXT_TOP"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->TEXT_TOP:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    .line 32
    new-instance v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    const-string v1, "TEXT_BOTTOM"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->TEXT_BOTTOM:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    .line 33
    new-instance v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    const-string v1, "SUB"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->SUB:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    .line 34
    new-instance v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    const-string v1, "SUPER"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->SUPER:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    .line 39
    new-instance v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    const-string v1, "FIXED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->FIXED:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    .line 44
    new-instance v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    const-string v1, "FRACTION"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->FRACTION:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    .line 46
    new-instance v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    const-string v1, "MIDDLE"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->MIDDLE:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    .line 48
    new-instance v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    const-string v1, "TOP"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->TOP:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    .line 49
    new-instance v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    const-string v1, "BOTTOM"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->BOTTOM:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    .line 28
    sget-object v3, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->BASELINE:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    sget-object v4, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->TEXT_TOP:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    sget-object v5, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->TEXT_BOTTOM:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    sget-object v6, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->SUB:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    sget-object v7, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->SUPER:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    sget-object v8, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->FIXED:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    sget-object v9, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->FRACTION:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    sget-object v10, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->MIDDLE:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    sget-object v11, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->TOP:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    sget-object v12, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->BOTTOM:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    filled-new-array/range {v3 .. v12}, [Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->$VALUES:[Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 28
    const-class v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;
    .locals 1

    .line 28
    sget-object v0, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->$VALUES:[Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    return-object v0
.end method
