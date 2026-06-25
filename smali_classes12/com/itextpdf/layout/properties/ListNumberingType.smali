.class public final enum Lcom/itextpdf/layout/properties/ListNumberingType;
.super Ljava/lang/Enum;
.source "ListNumberingType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/ListNumberingType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/ListNumberingType;

.field public static final enum DECIMAL:Lcom/itextpdf/layout/properties/ListNumberingType;

.field public static final enum DECIMAL_LEADING_ZERO:Lcom/itextpdf/layout/properties/ListNumberingType;

.field public static final enum ENGLISH_LOWER:Lcom/itextpdf/layout/properties/ListNumberingType;

.field public static final enum ENGLISH_UPPER:Lcom/itextpdf/layout/properties/ListNumberingType;

.field public static final enum GREEK_LOWER:Lcom/itextpdf/layout/properties/ListNumberingType;

.field public static final enum GREEK_UPPER:Lcom/itextpdf/layout/properties/ListNumberingType;

.field public static final enum ROMAN_LOWER:Lcom/itextpdf/layout/properties/ListNumberingType;

.field public static final enum ROMAN_UPPER:Lcom/itextpdf/layout/properties/ListNumberingType;

.field public static final enum ZAPF_DINGBATS_1:Lcom/itextpdf/layout/properties/ListNumberingType;

.field public static final enum ZAPF_DINGBATS_2:Lcom/itextpdf/layout/properties/ListNumberingType;

.field public static final enum ZAPF_DINGBATS_3:Lcom/itextpdf/layout/properties/ListNumberingType;

.field public static final enum ZAPF_DINGBATS_4:Lcom/itextpdf/layout/properties/ListNumberingType;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 34
    new-instance v0, Lcom/itextpdf/layout/properties/ListNumberingType;

    const-string v1, "DECIMAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListNumberingType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->DECIMAL:Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 35
    new-instance v0, Lcom/itextpdf/layout/properties/ListNumberingType;

    const-string v1, "DECIMAL_LEADING_ZERO"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListNumberingType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->DECIMAL_LEADING_ZERO:Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 36
    new-instance v0, Lcom/itextpdf/layout/properties/ListNumberingType;

    const-string v1, "ROMAN_LOWER"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListNumberingType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->ROMAN_LOWER:Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 37
    new-instance v0, Lcom/itextpdf/layout/properties/ListNumberingType;

    const-string v1, "ROMAN_UPPER"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListNumberingType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->ROMAN_UPPER:Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 38
    new-instance v0, Lcom/itextpdf/layout/properties/ListNumberingType;

    const-string v1, "ENGLISH_LOWER"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListNumberingType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->ENGLISH_LOWER:Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 39
    new-instance v0, Lcom/itextpdf/layout/properties/ListNumberingType;

    const-string v1, "ENGLISH_UPPER"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListNumberingType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->ENGLISH_UPPER:Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 40
    new-instance v0, Lcom/itextpdf/layout/properties/ListNumberingType;

    const-string v1, "GREEK_LOWER"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListNumberingType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->GREEK_LOWER:Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 41
    new-instance v0, Lcom/itextpdf/layout/properties/ListNumberingType;

    const-string v1, "GREEK_UPPER"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListNumberingType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->GREEK_UPPER:Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 43
    new-instance v0, Lcom/itextpdf/layout/properties/ListNumberingType;

    const-string v1, "ZAPF_DINGBATS_1"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListNumberingType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_1:Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 45
    new-instance v0, Lcom/itextpdf/layout/properties/ListNumberingType;

    const-string v1, "ZAPF_DINGBATS_2"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListNumberingType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_2:Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 47
    new-instance v0, Lcom/itextpdf/layout/properties/ListNumberingType;

    const-string v1, "ZAPF_DINGBATS_3"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListNumberingType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_3:Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 49
    new-instance v0, Lcom/itextpdf/layout/properties/ListNumberingType;

    const-string v1, "ZAPF_DINGBATS_4"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/ListNumberingType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_4:Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 33
    sget-object v3, Lcom/itextpdf/layout/properties/ListNumberingType;->DECIMAL:Lcom/itextpdf/layout/properties/ListNumberingType;

    sget-object v4, Lcom/itextpdf/layout/properties/ListNumberingType;->DECIMAL_LEADING_ZERO:Lcom/itextpdf/layout/properties/ListNumberingType;

    sget-object v5, Lcom/itextpdf/layout/properties/ListNumberingType;->ROMAN_LOWER:Lcom/itextpdf/layout/properties/ListNumberingType;

    sget-object v6, Lcom/itextpdf/layout/properties/ListNumberingType;->ROMAN_UPPER:Lcom/itextpdf/layout/properties/ListNumberingType;

    sget-object v7, Lcom/itextpdf/layout/properties/ListNumberingType;->ENGLISH_LOWER:Lcom/itextpdf/layout/properties/ListNumberingType;

    sget-object v8, Lcom/itextpdf/layout/properties/ListNumberingType;->ENGLISH_UPPER:Lcom/itextpdf/layout/properties/ListNumberingType;

    sget-object v9, Lcom/itextpdf/layout/properties/ListNumberingType;->GREEK_LOWER:Lcom/itextpdf/layout/properties/ListNumberingType;

    sget-object v10, Lcom/itextpdf/layout/properties/ListNumberingType;->GREEK_UPPER:Lcom/itextpdf/layout/properties/ListNumberingType;

    sget-object v11, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_1:Lcom/itextpdf/layout/properties/ListNumberingType;

    sget-object v12, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_2:Lcom/itextpdf/layout/properties/ListNumberingType;

    sget-object v13, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_3:Lcom/itextpdf/layout/properties/ListNumberingType;

    sget-object v14, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_4:Lcom/itextpdf/layout/properties/ListNumberingType;

    filled-new-array/range {v3 .. v14}, [Lcom/itextpdf/layout/properties/ListNumberingType;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->$VALUES:[Lcom/itextpdf/layout/properties/ListNumberingType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/ListNumberingType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 33
    const-class v0, Lcom/itextpdf/layout/properties/ListNumberingType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/ListNumberingType;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/ListNumberingType;
    .locals 1

    .line 33
    sget-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->$VALUES:[Lcom/itextpdf/layout/properties/ListNumberingType;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/ListNumberingType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/ListNumberingType;

    return-object v0
.end method
