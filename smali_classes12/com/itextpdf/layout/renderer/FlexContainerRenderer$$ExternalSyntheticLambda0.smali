.class public final synthetic Lcom/itextpdf/layout/renderer/FlexContainerRenderer$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/itextpdf/layout/renderer/FlexContainerRenderer;"
    method = "lambda$createSplitAndOverflowRenderers$0"
    proto = "(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/FlexItemInfo;)Z"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/itextpdf/layout/renderer/IRenderer;


# direct methods
.method public synthetic constructor <init>(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer$$ExternalSyntheticLambda0;->f$0:Lcom/itextpdf/layout/renderer/IRenderer;

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer$$ExternalSyntheticLambda0;->f$0:Lcom/itextpdf/layout/renderer/IRenderer;

    check-cast p1, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    invoke-static {v0, p1}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lambda$createSplitAndOverflowRenderers$0(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/FlexItemInfo;)Z

    move-result p1

    return p1
.end method
