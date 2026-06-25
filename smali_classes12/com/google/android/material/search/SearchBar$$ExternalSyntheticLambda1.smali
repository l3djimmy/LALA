.class public final synthetic Lcom/google/android/material/search/SearchBar$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/view/accessibility/AccessibilityManagerCompat$TouchExplorationStateChangeListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/google/android/material/search/SearchBar;"
    method = "lambda$new$0"
    proto = "(Z)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/google/android/material/search/SearchBar;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/material/search/SearchBar;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/search/SearchBar$$ExternalSyntheticLambda1;->f$0:Lcom/google/android/material/search/SearchBar;

    return-void
.end method


# virtual methods
.method public final onTouchExplorationStateChanged(Z)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/android/material/search/SearchBar$$ExternalSyntheticLambda1;->f$0:Lcom/google/android/material/search/SearchBar;

    invoke-virtual {v0, p1}, Lcom/google/android/material/search/SearchBar;->lambda$new$0$com-google-android-material-search-SearchBar(Z)V

    return-void
.end method
