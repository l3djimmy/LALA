.class public final synthetic Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IInputConversionFunction;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors;"
    method = "lambda$getByteBasedInputConvertor$0"
    proto = "(ID[BII)[D"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:D


# direct methods
.method public synthetic constructor <init>(ID)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$$ExternalSyntheticLambda1;->f$0:I

    iput-wide p2, p0, Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$$ExternalSyntheticLambda1;->f$1:D

    return-void
.end method


# virtual methods
.method public final convert([BII)[D
    .locals 6

    .line 0
    iget v0, p0, Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$$ExternalSyntheticLambda1;->f$0:I

    iget-wide v1, p0, Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$$ExternalSyntheticLambda1;->f$1:D

    move-object v3, p1

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors;->lambda$getByteBasedInputConvertor$0(ID[BII)[D

    move-result-object p1

    return-object p1
.end method
