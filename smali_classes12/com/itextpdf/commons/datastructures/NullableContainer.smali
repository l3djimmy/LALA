.class public Lcom/itextpdf/commons/datastructures/NullableContainer;
.super Ljava/lang/Object;
.source "NullableContainer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 40
    .local p0, "this":Lcom/itextpdf/commons/datastructures/NullableContainer;, "Lcom/itextpdf/commons/datastructures/NullableContainer<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/itextpdf/commons/datastructures/NullableContainer;->value:Ljava/lang/Object;

    .line 42
    return-void
.end method


# virtual methods
.method public getValue()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 50
    .local p0, "this":Lcom/itextpdf/commons/datastructures/NullableContainer;, "Lcom/itextpdf/commons/datastructures/NullableContainer<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/NullableContainer;->value:Ljava/lang/Object;

    return-object v0
.end method
