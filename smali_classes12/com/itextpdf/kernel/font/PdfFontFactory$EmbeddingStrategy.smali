.class public final enum Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
.super Ljava/lang/Enum;
.source "PdfFontFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/font/PdfFontFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EmbeddingStrategy"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

.field public static final enum FORCE_EMBEDDED:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

.field public static final enum FORCE_NOT_EMBEDDED:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

.field public static final enum PREFER_EMBEDDED:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

.field public static final enum PREFER_NOT_EMBEDDED:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 729
    new-instance v0, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    const-string v1, "FORCE_EMBEDDED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->FORCE_EMBEDDED:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    .line 734
    new-instance v0, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    const-string v1, "FORCE_NOT_EMBEDDED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->FORCE_NOT_EMBEDDED:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    .line 738
    new-instance v0, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    const-string v1, "PREFER_EMBEDDED"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->PREFER_EMBEDDED:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    .line 742
    new-instance v0, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    const-string v1, "PREFER_NOT_EMBEDDED"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->PREFER_NOT_EMBEDDED:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    .line 725
    sget-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->FORCE_EMBEDDED:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    sget-object v1, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->FORCE_NOT_EMBEDDED:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    sget-object v2, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->PREFER_EMBEDDED:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    sget-object v3, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->PREFER_NOT_EMBEDDED:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    filled-new-array {v0, v1, v2, v3}, [Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->$VALUES:[Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 725
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 725
    const-class v0, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    .locals 1

    .line 725
    sget-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->$VALUES:[Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    return-object v0
.end method
