.class public Lcom/itextpdf/commons/actions/contexts/UnknownContext;
.super Ljava/lang/Object;
.source "UnknownContext.java"

# interfaces
.implements Lcom/itextpdf/commons/actions/contexts/IContext;


# static fields
.field public static final PERMISSIVE:Lcom/itextpdf/commons/actions/contexts/IContext;

.field public static final RESTRICTIVE:Lcom/itextpdf/commons/actions/contexts/IContext;


# instance fields
.field private final allowEvents:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 35
    new-instance v0, Lcom/itextpdf/commons/actions/contexts/UnknownContext;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/itextpdf/commons/actions/contexts/UnknownContext;-><init>(Z)V

    sput-object v0, Lcom/itextpdf/commons/actions/contexts/UnknownContext;->RESTRICTIVE:Lcom/itextpdf/commons/actions/contexts/IContext;

    .line 39
    new-instance v0, Lcom/itextpdf/commons/actions/contexts/UnknownContext;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/itextpdf/commons/actions/contexts/UnknownContext;-><init>(Z)V

    sput-object v0, Lcom/itextpdf/commons/actions/contexts/UnknownContext;->PERMISSIVE:Lcom/itextpdf/commons/actions/contexts/IContext;

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0
    .param p1, "allowEvents"    # Z

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-boolean p1, p0, Lcom/itextpdf/commons/actions/contexts/UnknownContext;->allowEvents:Z

    .line 50
    return-void
.end method


# virtual methods
.method public isAllowed(Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;)Z
    .locals 1
    .param p1, "event"    # Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;

    .line 62
    iget-boolean v0, p0, Lcom/itextpdf/commons/actions/contexts/UnknownContext;->allowEvents:Z

    return v0
.end method
