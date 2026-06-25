.class public final synthetic Lcom/itextpdf/io/source/ByteBufferRandomAccessSource$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/itextpdf/io/source/BufferCleaner;"
    method = "unmapHackImpl"
    proto = "()Ljava/lang/Object;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 1

    .line 0
    invoke-static {}, Lcom/itextpdf/io/source/BufferCleaner;->unmapHackImpl()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
