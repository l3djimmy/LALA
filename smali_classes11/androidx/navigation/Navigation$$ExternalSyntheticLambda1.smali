.class public final synthetic Landroidx/navigation/Navigation$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/navigation/Navigation;"
    method = "createNavigateOnClickListener$lambda$0"
    proto = "(ILandroid/os/Bundle;Landroid/view/View;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(ILandroid/os/Bundle;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Landroidx/navigation/Navigation$$ExternalSyntheticLambda1;->f$0:I

    iput-object p2, p0, Landroidx/navigation/Navigation$$ExternalSyntheticLambda1;->f$1:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 0
    iget v0, p0, Landroidx/navigation/Navigation$$ExternalSyntheticLambda1;->f$0:I

    iget-object v1, p0, Landroidx/navigation/Navigation$$ExternalSyntheticLambda1;->f$1:Landroid/os/Bundle;

    invoke-static {v0, v1, p1}, Landroidx/navigation/Navigation;->createNavigateOnClickListener$lambda$0(ILandroid/os/Bundle;Landroid/view/View;)V

    return-void
.end method
