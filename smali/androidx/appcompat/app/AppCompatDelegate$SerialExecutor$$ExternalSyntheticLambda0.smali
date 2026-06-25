.class public final synthetic Landroidx/appcompat/app/AppCompatDelegate$SerialExecutor$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/appcompat/app/AppCompatDelegate$SerialExecutor;"
    method = "lambda$execute$0"
    proto = "(Ljava/lang/Runnable;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/appcompat/app/AppCompatDelegate$SerialExecutor;

.field public final synthetic f$1:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Landroidx/appcompat/app/AppCompatDelegate$SerialExecutor;Ljava/lang/Runnable;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/appcompat/app/AppCompatDelegate$SerialExecutor$$ExternalSyntheticLambda0;->f$0:Landroidx/appcompat/app/AppCompatDelegate$SerialExecutor;

    iput-object p2, p0, Landroidx/appcompat/app/AppCompatDelegate$SerialExecutor$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegate$SerialExecutor$$ExternalSyntheticLambda0;->f$0:Landroidx/appcompat/app/AppCompatDelegate$SerialExecutor;

    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegate$SerialExecutor$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatDelegate$SerialExecutor;->lambda$execute$0$androidx-appcompat-app-AppCompatDelegate$SerialExecutor(Ljava/lang/Runnable;)V

    return-void
.end method
