.class public final synthetic Lcom/itextpdf/kernel/pdf/function/PdfType3Function$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/function/IPdfFunctionFactory;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/itextpdf/kernel/pdf/function/PdfType3Function;"
    method = "lambda$static$0"
    proto = "(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/function/IPdfFunction;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final create(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
    .locals 0

    .line 0
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->lambda$static$0(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/function/IPdfFunction;

    move-result-object p1

    return-object p1
.end method
