.class public final synthetic Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;"
    method = "lambda$processLinkAnnotion$1"
    proto = "(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V"
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
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 0
    check-cast p1, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->lambda$processLinkAnnotion$1(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V

    return-void
.end method
