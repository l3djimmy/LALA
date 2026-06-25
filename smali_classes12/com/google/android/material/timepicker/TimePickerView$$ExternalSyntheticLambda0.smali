.class public final synthetic Lcom/google/android/material/timepicker/TimePickerView$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/material/button/MaterialButtonToggleGroup$OnButtonCheckedListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/google/android/material/timepicker/TimePickerView;"
    method = "lambda$new$0"
    proto = "(Lcom/google/android/material/button/MaterialButtonToggleGroup;IZ)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/google/android/material/timepicker/TimePickerView;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/material/timepicker/TimePickerView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/timepicker/TimePickerView$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/material/timepicker/TimePickerView;

    return-void
.end method


# virtual methods
.method public final onButtonChecked(Lcom/google/android/material/button/MaterialButtonToggleGroup;IZ)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/android/material/timepicker/TimePickerView$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/material/timepicker/TimePickerView;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/material/timepicker/TimePickerView;->lambda$new$0$com-google-android-material-timepicker-TimePickerView(Lcom/google/android/material/button/MaterialButtonToggleGroup;IZ)V

    return-void
.end method
