.class public final synthetic Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;"
    method = "CameraCaptureScreen$lambda$49$lambda$48$lambda$30$lambda$29"
    proto = "(Landroidx/camera/view/PreviewView;Landroid/content/Context;)Landroidx/camera/view/PreviewView;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/view/PreviewView;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/view/PreviewView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$$ExternalSyntheticLambda5;->f$0:Landroidx/camera/view/PreviewView;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$$ExternalSyntheticLambda5;->f$0:Landroidx/camera/view/PreviewView;

    check-cast p1, Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->CameraCaptureScreen$lambda$49$lambda$48$lambda$30$lambda$29(Landroidx/camera/view/PreviewView;Landroid/content/Context;)Landroidx/camera/view/PreviewView;

    move-result-object p1

    return-object p1
.end method
