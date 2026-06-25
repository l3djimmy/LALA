.class public final synthetic Lcom/google/android/material/search/SearchView$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/view/OnApplyWindowInsetsListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/google/android/material/search/SearchView;"
    method = "lambda$setUpDividerInsetListener$6"
    proto = "(Landroid/view/ViewGroup$MarginLayoutParams;IILandroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/view/ViewGroup$MarginLayoutParams;

.field public final synthetic f$1:I

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Landroid/view/ViewGroup$MarginLayoutParams;II)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/search/SearchView$$ExternalSyntheticLambda0;->f$0:Landroid/view/ViewGroup$MarginLayoutParams;

    iput p2, p0, Lcom/google/android/material/search/SearchView$$ExternalSyntheticLambda0;->f$1:I

    iput p3, p0, Lcom/google/android/material/search/SearchView$$ExternalSyntheticLambda0;->f$2:I

    return-void
.end method


# virtual methods
.method public final onApplyWindowInsets(Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/google/android/material/search/SearchView$$ExternalSyntheticLambda0;->f$0:Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, p0, Lcom/google/android/material/search/SearchView$$ExternalSyntheticLambda0;->f$1:I

    iget v2, p0, Lcom/google/android/material/search/SearchView$$ExternalSyntheticLambda0;->f$2:I

    invoke-static {v0, v1, v2, p1, p2}, Lcom/google/android/material/search/SearchView;->lambda$setUpDividerInsetListener$6(Landroid/view/ViewGroup$MarginLayoutParams;IILandroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object p1

    return-object p1
.end method
