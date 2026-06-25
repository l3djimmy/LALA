.class public Lcom/itextpdf/kernel/pdf/DocumentProperties;
.super Ljava/lang/Object;
.source "DocumentProperties.java"


# instance fields
.field protected metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/DocumentProperties;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/DocumentProperties;)V
    .locals 1
    .param p1, "other"    # Lcom/itextpdf/kernel/pdf/DocumentProperties;

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/DocumentProperties;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 48
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/DocumentProperties;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/DocumentProperties;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 49
    return-void
.end method


# virtual methods
.method public isEventCountingMetaInfoSet()Z
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/DocumentProperties;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;
    .locals 0
    .param p1, "metaInfo"    # Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 58
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/DocumentProperties;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 59
    return-object p0
.end method
