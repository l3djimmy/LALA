.class public final Lcom/itextpdf/kernel/actions/data/ITextCoreProductData;
.super Ljava/lang/Object;
.source "ITextCoreProductData.java"


# static fields
.field private static final CORE_COPYRIGHT_SINCE:I = 0x7d0

.field private static final CORE_COPYRIGHT_TO:I = 0x7e8

.field private static final CORE_PUBLIC_PRODUCT_NAME:Ljava/lang/String; = "Core"

.field private static final CORE_VERSION:Ljava/lang/String; = "8.0.4"

.field private static final ITEXT_PRODUCT_DATA:Lcom/itextpdf/commons/actions/data/ProductData;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 37
    new-instance v0, Lcom/itextpdf/commons/actions/data/ProductData;

    const/16 v4, 0x7d0

    const/16 v5, 0x7e8

    const-string v1, "Core"

    const-string v2, "itext-core"

    const-string v3, "8.0.4"

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/commons/actions/data/ProductData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V

    sput-object v0, Lcom/itextpdf/kernel/actions/data/ITextCoreProductData;->ITEXT_PRODUCT_DATA:Lcom/itextpdf/commons/actions/data/ProductData;

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
    sget-object v0, Lcom/itextpdf/kernel/actions/data/ITextCoreProductData;->ITEXT_PRODUCT_DATA:Lcom/itextpdf/commons/actions/data/ProductData;

    return-object v0
.end method
