.class public abstract Lcom/itextpdf/commons/actions/sequence/AbstractIdentifiableElement;
.super Ljava/lang/Object;
.source "AbstractIdentifiableElement.java"


# instance fields
.field private sequenceId:Lcom/itextpdf/commons/actions/sequence/SequenceId;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method getSequenceId()Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/itextpdf/commons/actions/sequence/AbstractIdentifiableElement;->sequenceId:Lcom/itextpdf/commons/actions/sequence/SequenceId;

    return-object v0
.end method

.method setSequenceId(Lcom/itextpdf/commons/actions/sequence/SequenceId;)V
    .locals 0
    .param p1, "sequenceId"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;

    .line 48
    iput-object p1, p0, Lcom/itextpdf/commons/actions/sequence/AbstractIdentifiableElement;->sequenceId:Lcom/itextpdf/commons/actions/sequence/SequenceId;

    .line 49
    return-void
.end method
