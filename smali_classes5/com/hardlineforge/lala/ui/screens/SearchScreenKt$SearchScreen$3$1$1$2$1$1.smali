.class final Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$1$1;
.super Ljava/lang/Object;
.source "SearchScreen.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/screens/SearchScreenKt;->SearchScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
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
.field final synthetic $entry:Lcom/hardlineforge/lala/data/LogEntry;

.field final synthetic $navController:Landroidx/navigation/NavHostController;


# direct methods
.method constructor <init>(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/data/LogEntry;)V
    .locals 0

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$1$1;->$navController:Landroidx/navigation/NavHostController;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$1$1;->$entry:Lcom/hardlineforge/lala/data/LogEntry;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 64
    invoke-virtual {p0}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$1$1;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 7

    .line 64
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$1$1;->$navController:Landroidx/navigation/NavHostController;

    move-object v1, v0

    check-cast v1, Landroidx/navigation/NavController;

    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$1$1;->$entry:Lcom/hardlineforge/lala/data/LogEntry;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/LogEntry;->getId()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "entry_detail/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Landroidx/navigation/NavController;->navigate$default(Landroidx/navigation/NavController;Ljava/lang/String;Landroidx/navigation/NavOptions;Landroidx/navigation/Navigator$Extras;ILjava/lang/Object;)V

    return-void
.end method
