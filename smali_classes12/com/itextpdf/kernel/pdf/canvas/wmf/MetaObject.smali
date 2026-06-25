.class public Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;
.super Ljava/lang/Object;
.source "MetaObject.java"


# static fields
.field public static final META_BRUSH:I = 0x2

.field public static final META_FONT:I = 0x3

.field public static final META_NOT_SUPPORTED:I = 0x0

.field public static final META_PEN:I = 0x1


# instance fields
.field private type:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;->type:I

    .line 42
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "type"    # I

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;->type:I

    .line 50
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;->type:I

    .line 51
    return-void
.end method


# virtual methods
.method public getType()I
    .locals 1

    .line 59
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;->type:I

    return v0
.end method
