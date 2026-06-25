.class public final enum Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;
.super Ljava/lang/Enum;
.source "PdfUserProperty.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ValueType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

.field public static final enum BOOLEAN:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

.field public static final enum NUMBER:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

.field public static final enum TEXT:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

.field public static final enum UNKNOWN:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 37
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->UNKNOWN:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    .line 38
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    const-string v1, "TEXT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->TEXT:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    .line 39
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    const-string v1, "NUMBER"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->NUMBER:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    .line 40
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    const-string v1, "BOOLEAN"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->BOOLEAN:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    .line 36
    sget-object v0, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->UNKNOWN:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    sget-object v1, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->TEXT:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    sget-object v2, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->NUMBER:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    sget-object v3, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->BOOLEAN:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    filled-new-array {v0, v1, v2, v3}, [Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->$VALUES:[Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 36
    const-class v0, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;
    .locals 1

    .line 36
    sget-object v0, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->$VALUES:[Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    return-object v0
.end method
