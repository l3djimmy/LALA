.class public final Lcom/itextpdf/commons/actions/data/CommonsProductData;
.super Ljava/lang/Object;
.source "CommonsProductData.java"


# static fields
.field static final COMMONS_COPYRIGHT_SINCE:I = 0x7d0

.field static final COMMONS_COPYRIGHT_TO:I = 0x7e8

.field private static final COMMONS_PRODUCT_DATA:Lcom/itextpdf/commons/actions/data/ProductData;

.field static final COMMONS_PRODUCT_NAME:Ljava/lang/String; = "commons"

.field static final COMMONS_PUBLIC_PRODUCT_NAME:Ljava/lang/String; = "Commons"

.field static final COMMONS_VERSION:Ljava/lang/String; = "8.0.4"

.field static final MINIMAL_COMPATIBLE_LICENSEKEY_VERSION:Ljava/lang/String; = "4.1.0"


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 36
    new-instance v0, Lcom/itextpdf/commons/actions/data/ProductData;

    const/16 v5, 0x7d0

    const/16 v6, 0x7e8

    const-string v1, "Commons"

    const-string v2, "commons"

    const-string v3, "8.0.4"

    const-string v4, "4.1.0"

    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/commons/actions/data/ProductData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V

    sput-object v0, Lcom/itextpdf/commons/actions/data/CommonsProductData;->COMMONS_PRODUCT_DATA:Lcom/itextpdf/commons/actions/data/ProductData;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method

.method public static getInstance()Lcom/itextpdf/commons/actions/data/ProductData;
    .locals 1

    .line 50
    sget-object v0, Lcom/itextpdf/commons/actions/data/CommonsProductData;->COMMONS_PRODUCT_DATA:Lcom/itextpdf/commons/actions/data/ProductData;

    return-object v0
.end method
