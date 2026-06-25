.class public final synthetic Lcom/itextpdf/layout/renderer/MulticolRenderer$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/itextpdf/layout/renderer/MulticolRenderer;"
    method = "lambda$drawBorder$0"
    proto = "(Lcom/itextpdf/layout/borders/Border;ZLcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/itextpdf/layout/renderer/MulticolRenderer;

.field public final synthetic f$1:Lcom/itextpdf/layout/borders/Border;

.field public final synthetic f$2:Z

.field public final synthetic f$3:Lcom/itextpdf/layout/renderer/DrawContext;


# direct methods
.method public synthetic constructor <init>(Lcom/itextpdf/layout/renderer/MulticolRenderer;Lcom/itextpdf/layout/borders/Border;ZLcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$$ExternalSyntheticLambda0;->f$0:Lcom/itextpdf/layout/renderer/MulticolRenderer;

    iput-object p2, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$$ExternalSyntheticLambda0;->f$1:Lcom/itextpdf/layout/borders/Border;

    iput-boolean p3, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$$ExternalSyntheticLambda0;->f$2:Z

    iput-object p4, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$$ExternalSyntheticLambda0;->f$3:Lcom/itextpdf/layout/renderer/DrawContext;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$$ExternalSyntheticLambda0;->f$0:Lcom/itextpdf/layout/renderer/MulticolRenderer;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$$ExternalSyntheticLambda0;->f$1:Lcom/itextpdf/layout/borders/Border;

    iget-boolean v2, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$$ExternalSyntheticLambda0;->f$2:Z

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$$ExternalSyntheticLambda0;->f$3:Lcom/itextpdf/layout/renderer/DrawContext;

    check-cast p1, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v0, v1, v2, v3, p1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->lambda$drawBorder$0$com-itextpdf-layout-renderer-MulticolRenderer(Lcom/itextpdf/layout/borders/Border;ZLcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    return-void
.end method
