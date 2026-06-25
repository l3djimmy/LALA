.class public final synthetic Lcom/google/android/material/slider/BaseSlider$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnScrollChangedListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/google/android/material/slider/BaseSlider;"
    method = "updateLabels"
    proto = "()V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/google/android/material/slider/BaseSlider;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/material/slider/BaseSlider;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/slider/BaseSlider$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/material/slider/BaseSlider;

    return-void
.end method


# virtual methods
.method public final onScrollChanged()V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/material/slider/BaseSlider;

    invoke-static {v0}, Lcom/google/android/material/slider/BaseSlider;->$r8$lambda$WXiNVeXFM7RTh57Z9Tr5jBbN9l4(Lcom/google/android/material/slider/BaseSlider;)V

    return-void
.end method
