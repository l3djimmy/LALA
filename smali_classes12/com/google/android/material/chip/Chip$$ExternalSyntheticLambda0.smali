.class public final synthetic Lcom/google/android/material/chip/Chip$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/google/android/material/chip/Chip;"
    method = "lambda$new$0"
    proto = "(Landroid/widget/CompoundButton;Z)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/google/android/material/chip/Chip;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/material/chip/Chip;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/chip/Chip$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/material/chip/Chip;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/android/material/chip/Chip$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/material/chip/Chip;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/material/chip/Chip;->lambda$new$0$com-google-android-material-chip-Chip(Landroid/widget/CompoundButton;Z)V

    return-void
.end method
