.class public Lcom/itextpdf/kernel/pdf/StampingProperties;
.super Lcom/itextpdf/kernel/pdf/DocumentProperties;
.source "StampingProperties.java"


# instance fields
.field protected appendMode:Z

.field protected preserveEncryption:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/DocumentProperties;-><init>()V

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    .line 30
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/StampingProperties;->preserveEncryption:Z

    .line 33
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/StampingProperties;)V
    .locals 1
    .param p1, "other"    # Lcom/itextpdf/kernel/pdf/StampingProperties;

    .line 36
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/DocumentProperties;-><init>(Lcom/itextpdf/kernel/pdf/DocumentProperties;)V

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    .line 30
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/StampingProperties;->preserveEncryption:Z

    .line 37
    iget-boolean v0, p1, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    .line 38
    iget-boolean v0, p1, Lcom/itextpdf/kernel/pdf/StampingProperties;->preserveEncryption:Z

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/StampingProperties;->preserveEncryption:Z

    .line 39
    return-void
.end method


# virtual methods
.method public preserveEncryption()Lcom/itextpdf/kernel/pdf/StampingProperties;
    .locals 1

    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/StampingProperties;->preserveEncryption:Z

    .line 57
    return-object p0
.end method

.method public useAppendMode()Lcom/itextpdf/kernel/pdf/StampingProperties;
    .locals 1

    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    .line 47
    return-object p0
.end method
