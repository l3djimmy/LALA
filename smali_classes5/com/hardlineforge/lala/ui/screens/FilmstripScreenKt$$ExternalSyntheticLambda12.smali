.class public final synthetic Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt;"
    method = "FilmstripScreen$lambda$30$lambda$29"
    proto = "(Lcom/hardlineforge/lala/data/VideoFrame;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/hardlineforge/lala/data/VideoFrame;


# direct methods
.method public synthetic constructor <init>(Lcom/hardlineforge/lala/data/VideoFrame;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$$ExternalSyntheticLambda12;->f$0:Lcom/hardlineforge/lala/data/VideoFrame;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$$ExternalSyntheticLambda12;->f$0:Lcom/hardlineforge/lala/data/VideoFrame;

    check-cast p1, Landroidx/compose/runtime/Composer;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-static {v0, p1, p2}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt;->FilmstripScreen$lambda$30$lambda$29(Lcom/hardlineforge/lala/data/VideoFrame;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
