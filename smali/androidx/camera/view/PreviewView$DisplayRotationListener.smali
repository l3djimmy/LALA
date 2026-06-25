.class Landroidx/camera/view/PreviewView$DisplayRotationListener;
.super Ljava/lang/Object;
.source "PreviewView.java"

# interfaces
.implements Landroid/hardware/display/DisplayManager$DisplayListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/view/PreviewView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DisplayRotationListener"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/view/PreviewView;


# direct methods
.method constructor <init>(Landroidx/camera/view/PreviewView;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/view/PreviewView;

    .line 1095
    iput-object p1, p0, Landroidx/camera/view/PreviewView$DisplayRotationListener;->this$0:Landroidx/camera/view/PreviewView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDisplayAdded(I)V
    .locals 0
    .param p1, "displayId"    # I

    .line 1098
    return-void
.end method

.method public onDisplayChanged(I)V
    .locals 2
    .param p1, "displayId"    # I

    .line 1106
    iget-object v0, p0, Landroidx/camera/view/PreviewView$DisplayRotationListener;->this$0:Landroidx/camera/view/PreviewView;

    invoke-virtual {v0}, Landroidx/camera/view/PreviewView;->getDisplay()Landroid/view/Display;

    move-result-object v0

    .line 1107
    .local v0, "display":Landroid/view/Display;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/Display;->getDisplayId()I

    move-result v1

    if-ne v1, p1, :cond_0

    .line 1108
    iget-object v1, p0, Landroidx/camera/view/PreviewView$DisplayRotationListener;->this$0:Landroidx/camera/view/PreviewView;

    invoke-virtual {v1}, Landroidx/camera/view/PreviewView;->redrawPreview()V

    .line 1110
    :cond_0
    return-void
.end method

.method public onDisplayRemoved(I)V
    .locals 0
    .param p1, "displayId"    # I

    .line 1102
    return-void
.end method
