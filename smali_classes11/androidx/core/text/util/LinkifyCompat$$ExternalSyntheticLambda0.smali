.class public final synthetic Landroidx/core/text/util/LinkifyCompat$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/core/text/util/LinkifyCompat;"
    method = "lambda$static$0"
    proto = "(Landroidx/core/text/util/LinkifyCompat$LinkSpec;Landroidx/core/text/util/LinkifyCompat$LinkSpec;)I"
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
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 0
    check-cast p1, Landroidx/core/text/util/LinkifyCompat$LinkSpec;

    check-cast p2, Landroidx/core/text/util/LinkifyCompat$LinkSpec;

    invoke-static {p1, p2}, Landroidx/core/text/util/LinkifyCompat;->lambda$static$0(Landroidx/core/text/util/LinkifyCompat$LinkSpec;Landroidx/core/text/util/LinkifyCompat$LinkSpec;)I

    move-result p1

    return p1
.end method
