.class public final synthetic Lcom/google/android/material/datepicker/DateFormatTextWatcher$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/google/android/material/datepicker/DateFormatTextWatcher;"
    method = "lambda$createRangeErrorCallback$1"
    proto = "(J)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/google/android/material/datepicker/DateFormatTextWatcher;

.field public final synthetic f$1:J


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/material/datepicker/DateFormatTextWatcher;J)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/datepicker/DateFormatTextWatcher$$ExternalSyntheticLambda1;->f$0:Lcom/google/android/material/datepicker/DateFormatTextWatcher;

    iput-wide p2, p0, Lcom/google/android/material/datepicker/DateFormatTextWatcher$$ExternalSyntheticLambda1;->f$1:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/google/android/material/datepicker/DateFormatTextWatcher$$ExternalSyntheticLambda1;->f$0:Lcom/google/android/material/datepicker/DateFormatTextWatcher;

    iget-wide v1, p0, Lcom/google/android/material/datepicker/DateFormatTextWatcher$$ExternalSyntheticLambda1;->f$1:J

    invoke-virtual {v0, v1, v2}, Lcom/google/android/material/datepicker/DateFormatTextWatcher;->lambda$createRangeErrorCallback$1$com-google-android-material-datepicker-DateFormatTextWatcher(J)V

    return-void
.end method
