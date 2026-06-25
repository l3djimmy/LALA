.class public final synthetic Landroidx/core/view/ViewConfigurationCompat$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/util/Supplier;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroid/view/ViewConfiguration;"
    method = "getScaledMaximumFlingVelocity"
    proto = "()I"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/view/ViewConfiguration;


# direct methods
.method public synthetic constructor <init>(Landroid/view/ViewConfiguration;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/core/view/ViewConfigurationCompat$$ExternalSyntheticLambda0;->f$0:Landroid/view/ViewConfiguration;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/core/view/ViewConfigurationCompat$$ExternalSyntheticLambda0;->f$0:Landroid/view/ViewConfiguration;

    invoke-static {v0}, Landroidx/core/view/ViewConfigurationCompat;->$r8$lambda$u_xUdJpIAAO3758SdHprtx7JUP0(Landroid/view/ViewConfiguration;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
