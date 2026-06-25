.class public final synthetic Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;"
    method = "lambda$processAction$4"
    proto = "(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;

.field public final synthetic f$1:Lcom/itextpdf/kernel/pdf/PdfDictionary;

.field public final synthetic f$2:Lcom/itextpdf/kernel/pdf/PdfObject;

.field public final synthetic f$3:Lcom/itextpdf/kernel/pdf/PdfName;


# direct methods
.method public synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda0;->f$0:Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;

    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda0;->f$1:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda0;->f$2:Lcom/itextpdf/kernel/pdf/PdfObject;

    iput-object p4, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda0;->f$3:Lcom/itextpdf/kernel/pdf/PdfName;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda0;->f$0:Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda0;->f$1:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda0;->f$2:Lcom/itextpdf/kernel/pdf/PdfObject;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda0;->f$3:Lcom/itextpdf/kernel/pdf/PdfName;

    check-cast p1, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    invoke-virtual {v0, v1, v2, v3, p1}, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->lambda$processAction$4$com-itextpdf-kernel-pdf-DestinationResolverCopyFilter(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V

    return-void
.end method
