.class public final synthetic Ldagger/internal/MapProviderLazyFactory$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ldagger/internal/Provider;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Ldagger/internal/MapProviderLazyFactory;"
    method = "lambda$get$0"
    proto = "(Ljava/util/Map$Entry;)Ldagger/Lazy;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/util/Map$Entry;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Map$Entry;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldagger/internal/MapProviderLazyFactory$$ExternalSyntheticLambda0;->f$0:Ljava/util/Map$Entry;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Ldagger/internal/MapProviderLazyFactory$$ExternalSyntheticLambda0;->f$0:Ljava/util/Map$Entry;

    invoke-static {v0}, Ldagger/internal/MapProviderLazyFactory;->lambda$get$0(Ljava/util/Map$Entry;)Ldagger/Lazy;

    move-result-object v0

    return-object v0
.end method
