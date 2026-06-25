.class public final synthetic Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt;"
    method = "TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$lambda$10"
    proto = "(Lcom/hardlineforge/lala/data/LogEntry;)Ljava/lang/Object;"
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
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 0
    check-cast p1, Lcom/hardlineforge/lala/data/LogEntry;

    invoke-static {p1}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt;->TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$lambda$10(Lcom/hardlineforge/lala/data/LogEntry;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
