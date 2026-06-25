.class public final synthetic Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;"
    method = "lambda$processLinkAnnotion$2"
    proto = "(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;

.field public final synthetic f$1:Lcom/itextpdf/kernel/pdf/PdfObject;

.field public final synthetic f$2:Lcom/itextpdf/kernel/pdf/PdfObject;


# direct methods
.method public synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda4;->f$0:Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;

    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda4;->f$1:Lcom/itextpdf/kernel/pdf/PdfObject;

    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda4;->f$2:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda4;->f$0:Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda4;->f$1:Lcom/itextpdf/kernel/pdf/PdfObject;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda4;->f$2:Lcom/itextpdf/kernel/pdf/PdfObject;

    check-cast p1, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    invoke-virtual {v0, v1, v2, p1}, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->lambda$processLinkAnnotion$2$com-itextpdf-kernel-pdf-DestinationResolverCopyFilter(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V

    return-void
.end method
