.class public final synthetic Landroidx/compose/ui/text/TextInclusionStrategy$Companion$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/compose/ui/text/TextInclusionStrategy;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/compose/ui/text/TextInclusionStrategy$Companion;"
    method = "ContainsCenter$lambda$2"
    proto = "(Landroidx/compose/ui/geometry/Rect;Landroidx/compose/ui/geometry/Rect;)Z"
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
.method public final isIncluded(Landroidx/compose/ui/geometry/Rect;Landroidx/compose/ui/geometry/Rect;)Z
    .locals 0

    .line 0
    invoke-static {p1, p2}, Landroidx/compose/ui/text/TextInclusionStrategy$Companion;->ContainsCenter$lambda$2(Landroidx/compose/ui/geometry/Rect;Landroidx/compose/ui/geometry/Rect;)Z

    move-result p1

    return p1
.end method
