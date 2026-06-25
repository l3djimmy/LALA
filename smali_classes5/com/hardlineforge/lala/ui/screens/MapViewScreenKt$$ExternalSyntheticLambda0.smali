.class public final synthetic Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt;"
    method = "MapViewScreen$lambda$8$lambda$7$lambda$6$lambda$5"
    proto = "(Ljava/util/List;DDDDJLandroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/util/List;

.field public final synthetic f$1:D

.field public final synthetic f$2:D

.field public final synthetic f$3:D

.field public final synthetic f$4:D

.field public final synthetic f$5:J


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;DDDDJ)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda0;->f$0:Ljava/util/List;

    iput-wide p2, p0, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda0;->f$1:D

    iput-wide p4, p0, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda0;->f$2:D

    iput-wide p6, p0, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda0;->f$3:D

    iput-wide p8, p0, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda0;->f$4:D

    iput-wide p10, p0, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda0;->f$5:J

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    .line 0
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda0;->f$0:Ljava/util/List;

    iget-wide v1, p0, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda0;->f$1:D

    iget-wide v3, p0, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda0;->f$2:D

    iget-wide v5, p0, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda0;->f$3:D

    iget-wide v7, p0, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda0;->f$4:D

    iget-wide v9, p0, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda0;->f$5:J

    move-object v11, p1

    check-cast v11, Landroidx/compose/ui/graphics/drawscope/DrawScope;

    invoke-static/range {v0 .. v11}, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt;->MapViewScreen$lambda$8$lambda$7$lambda$6$lambda$5(Ljava/util/List;DDDDJLandroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
