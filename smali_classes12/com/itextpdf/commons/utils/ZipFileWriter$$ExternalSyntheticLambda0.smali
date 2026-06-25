.class public final synthetic Lcom/itextpdf/commons/utils/ZipFileWriter$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/itextpdf/commons/utils/ZipFileWriter$ZipWriter;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/itextpdf/commons/utils/ZipFileWriter;"
    method = "lambda$addJsonEntry$1"
    proto = "(Ljava/lang/Object;Ljava/util/zip/ZipOutputStream;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/itextpdf/commons/utils/ZipFileWriter$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final write(Ljava/util/zip/ZipOutputStream;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/itextpdf/commons/utils/ZipFileWriter$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    invoke-static {v0, p1}, Lcom/itextpdf/commons/utils/ZipFileWriter;->lambda$addJsonEntry$1(Ljava/lang/Object;Ljava/util/zip/ZipOutputStream;)V

    return-void
.end method
