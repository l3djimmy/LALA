.class Lcom/hardlineforge/lala/Hilt_MainActivity$1;
.super Ljava/lang/Object;
.source "Hilt_MainActivity.java"

# interfaces
.implements Landroidx/activity/contextaware/OnContextAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/Hilt_MainActivity;->_initHiltInternal()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/hardlineforge/lala/Hilt_MainActivity;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/Hilt_MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/hardlineforge/lala/Hilt_MainActivity;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 39
    iput-object p1, p0, Lcom/hardlineforge/lala/Hilt_MainActivity$1;->this$0:Lcom/hardlineforge/lala/Hilt_MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onContextAvailable(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lcom/hardlineforge/lala/Hilt_MainActivity$1;->this$0:Lcom/hardlineforge/lala/Hilt_MainActivity;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/Hilt_MainActivity;->inject()V

    .line 43
    return-void
.end method
