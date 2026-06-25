.class public final synthetic Lcom/rajat/pdfviewer/util/FileUtils$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/io/FilenameFilter;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/rajat/pdfviewer/util/FileUtils;"
    method = "clearPdfCache$lambda$3"
    proto = "(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)Z"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/rajat/pdfviewer/util/FileUtils$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/io/File;Ljava/lang/String;)Z
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/rajat/pdfviewer/util/FileUtils$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    invoke-static {v0, p1, p2}, Lcom/rajat/pdfviewer/util/FileUtils;->clearPdfCache$lambda$3(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
