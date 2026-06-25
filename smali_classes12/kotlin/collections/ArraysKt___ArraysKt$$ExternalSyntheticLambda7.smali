.class public final synthetic Lkotlin/collections/ArraysKt___ArraysKt$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lkotlin/collections/ArraysKt___ArraysKt;"
    method = "withIndex$lambda$3$ArraysKt___ArraysKt"
    proto = "([I)Ljava/util/Iterator;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:[I


# direct methods
.method public synthetic constructor <init>([I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkotlin/collections/ArraysKt___ArraysKt$$ExternalSyntheticLambda7;->f$0:[I

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Lkotlin/collections/ArraysKt___ArraysKt$$ExternalSyntheticLambda7;->f$0:[I

    invoke-static {v0}, Lkotlin/collections/ArraysKt___ArraysKt;->$r8$lambda$z6R0YLR2U6I7mPyUV23AVH6EBco([I)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method
