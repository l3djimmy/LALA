.class public final synthetic Lcom/google/android/material/color/utilities/TemperatureCache$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Ljava/lang/Double;"
    method = "compareTo"
    proto = "(Ljava/lang/Double;)I"
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
    check-cast p1, Ljava/lang/Double;

    check-cast p2, Ljava/lang/Double;

    invoke-static {p1, p2}, Lcom/google/android/material/color/utilities/TemperatureCache;->$r8$lambda$hQjdIIwNZ3zUpaMt273Bn5gwl-w(Ljava/lang/Double;Ljava/lang/Double;)I

    move-result p1

    return p1
.end method
