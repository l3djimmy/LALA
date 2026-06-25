.class public final synthetic Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;"
    method = "lambda$addEntry$0"
    proto = "(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfDocument;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/itextpdf/kernel/pdf/PdfString;


# direct methods
.method public synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/PdfString;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree$$ExternalSyntheticLambda0;->f$0:Lcom/itextpdf/kernel/pdf/PdfString;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree$$ExternalSyntheticLambda0;->f$0:Lcom/itextpdf/kernel/pdf/PdfString;

    check-cast p1, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;->lambda$addEntry$0(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    return-void
.end method
