.class public final synthetic Landroidx/camera/view/PreviewView$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/view/PreviewView;"
    method = "lambda$new$0"
    proto = "(Landroid/view/View;IIIIIIII)V"
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

    iput-object p1, p0, Landroidx/camera/view/PreviewView$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/view/PreviewView;

    return-void
.end method


# virtual methods
.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 10

    .line 0
    iget-object v0, p0, Landroidx/camera/view/PreviewView$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/view/PreviewView;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    invoke-virtual/range {v0 .. v9}, Landroidx/camera/view/PreviewView;->lambda$new$0$androidx-camera-view-PreviewView(Landroid/view/View;IIIIIIII)V

    return-void
.end method
