.class final Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$3$1$2$1$2$1$1;
.super Ljava/lang/Object;
.source "FilmstripScreen.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt;->FilmstripScreen(Landroidx/navigation/NavHostController;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $frame:Lcom/hardlineforge/lala/data/VideoFrame;

.field final synthetic $selectedFrame$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Lcom/hardlineforge/lala/data/VideoFrame;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/data/VideoFrame;Landroidx/compose/runtime/MutableState;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/VideoFrame;",
            "Landroidx/compose/runtime/MutableState<",
            "Lcom/hardlineforge/lala/data/VideoFrame;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$3$1$2$1$2$1$1;->$frame:Lcom/hardlineforge/lala/data/VideoFrame;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$3$1$2$1$2$1$1;->$selectedFrame$delegate:Landroidx/compose/runtime/MutableState;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 110
    invoke-virtual {p0}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$3$1$2$1$2$1$1;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 2

    .line 110
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$3$1$2$1$2$1$1;->$selectedFrame$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$3$1$2$1$2$1$1;->$frame:Lcom/hardlineforge/lala/data/VideoFrame;

    invoke-static {v0, v1}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt;->access$FilmstripScreen$lambda$8(Landroidx/compose/runtime/MutableState;Lcom/hardlineforge/lala/data/VideoFrame;)V

    return-void
.end method
