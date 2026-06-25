.class public final Lcom/hardlineforge/lala/MainActivity;
.super Lcom/hardlineforge/lala/Hilt_MainActivity;
.source "MainActivity.kt"


# annotations
.annotation runtime Ldagger/hilt/android/AndroidEntryPoint;
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\u0004\u001a\u00020\u00052\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0014\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/hardlineforge/lala/MainActivity;",
        "Landroidx/activity/ComponentActivity;",
        "<init>",
        "()V",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "app_debug"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/MainActivity;->$stable:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/hardlineforge/lala/Hilt_MainActivity;-><init>()V

    .line 14
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 17
    invoke-super {p0, p1}, Lcom/hardlineforge/lala/Hilt_MainActivity;->onCreate(Landroid/os/Bundle;)V

    .line 18
    move-object v0, p0

    check-cast v0, Landroidx/activity/ComponentActivity;

    sget-object v1, Lcom/hardlineforge/lala/ComposableSingletons$MainActivityKt;->INSTANCE:Lcom/hardlineforge/lala/ComposableSingletons$MainActivityKt;

    invoke-virtual {v1}, Lcom/hardlineforge/lala/ComposableSingletons$MainActivityKt;->getLambda$-63898299$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v2, v3}, Landroidx/activity/compose/ComponentActivityKt;->setContent$default(Landroidx/activity/ComponentActivity;Landroidx/compose/runtime/CompositionContext;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)V

    .line 25
    return-void
.end method
