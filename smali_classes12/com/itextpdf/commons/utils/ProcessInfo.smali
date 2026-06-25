.class public final Lcom/itextpdf/commons/utils/ProcessInfo;
.super Ljava/lang/Object;
.source "ProcessInfo.java"


# instance fields
.field private final exitCode:I

.field private final processErrOutput:Ljava/lang/String;

.field private final processStdOutput:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "exitCode"    # I
    .param p2, "processStdOutput"    # Ljava/lang/String;
    .param p3, "processErrOutput"    # Ljava/lang/String;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput p1, p0, Lcom/itextpdf/commons/utils/ProcessInfo;->exitCode:I

    .line 44
    iput-object p2, p0, Lcom/itextpdf/commons/utils/ProcessInfo;->processStdOutput:Ljava/lang/String;

    .line 45
    iput-object p3, p0, Lcom/itextpdf/commons/utils/ProcessInfo;->processErrOutput:Ljava/lang/String;

    .line 46
    return-void
.end method


# virtual methods
.method public getExitCode()I
    .locals 1

    .line 54
    iget v0, p0, Lcom/itextpdf/commons/utils/ProcessInfo;->exitCode:I

    return v0
.end method

.method public getProcessErrOutput()Ljava/lang/String;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/itextpdf/commons/utils/ProcessInfo;->processErrOutput:Ljava/lang/String;

    return-object v0
.end method

.method public getProcessStdOutput()Ljava/lang/String;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/itextpdf/commons/utils/ProcessInfo;->processStdOutput:Ljava/lang/String;

    return-object v0
.end method
