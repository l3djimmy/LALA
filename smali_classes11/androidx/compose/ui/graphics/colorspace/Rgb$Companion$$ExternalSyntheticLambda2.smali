.class public final synthetic Landroidx/compose/ui/graphics/colorspace/Rgb$Companion$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/compose/ui/graphics/colorspace/DoubleFunction;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/compose/ui/graphics/colorspace/Rgb$Companion;"
    method = "generateEotf$lambda$6"
    proto = "(Landroidx/compose/ui/graphics/colorspace/TransferParameters;D)D"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/compose/ui/graphics/colorspace/TransferParameters;


# direct methods
.method public synthetic constructor <init>(Landroidx/compose/ui/graphics/colorspace/TransferParameters;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/compose/ui/graphics/colorspace/Rgb$Companion$$ExternalSyntheticLambda2;->f$0:Landroidx/compose/ui/graphics/colorspace/TransferParameters;

    return-void
.end method


# virtual methods
.method public final invoke(D)D
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/compose/ui/graphics/colorspace/Rgb$Companion$$ExternalSyntheticLambda2;->f$0:Landroidx/compose/ui/graphics/colorspace/TransferParameters;

    invoke-static {v0, p1, p2}, Landroidx/compose/ui/graphics/colorspace/Rgb$Companion;->generateEotf$lambda$6(Landroidx/compose/ui/graphics/colorspace/TransferParameters;D)D

    move-result-wide p1

    return-wide p1
.end method
