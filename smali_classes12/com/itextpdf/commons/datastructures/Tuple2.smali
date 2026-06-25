.class public Lcom/itextpdf/commons/datastructures/Tuple2;
.super Ljava/lang/Object;
.source "Tuple2.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T1:",
        "Ljava/lang/Object;",
        "T2:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final first:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT1;"
        }
    .end annotation
.end field

.field private final second:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT2;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT1;TT2;)V"
        }
    .end annotation

    .line 41
    .local p0, "this":Lcom/itextpdf/commons/datastructures/Tuple2;, "Lcom/itextpdf/commons/datastructures/Tuple2<TT1;TT2;>;"
    .local p1, "first":Ljava/lang/Object;, "TT1;"
    .local p2, "second":Ljava/lang/Object;, "TT2;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/itextpdf/commons/datastructures/Tuple2;->first:Ljava/lang/Object;

    .line 43
    iput-object p2, p0, Lcom/itextpdf/commons/datastructures/Tuple2;->second:Ljava/lang/Object;

    .line 44
    return-void
.end method


# virtual methods
.method public getFirst()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT1;"
        }
    .end annotation

    .line 52
    .local p0, "this":Lcom/itextpdf/commons/datastructures/Tuple2;, "Lcom/itextpdf/commons/datastructures/Tuple2<TT1;TT2;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/Tuple2;->first:Ljava/lang/Object;

    return-object v0
.end method

.method public getSecond()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT2;"
        }
    .end annotation

    .line 61
    .local p0, "this":Lcom/itextpdf/commons/datastructures/Tuple2;, "Lcom/itextpdf/commons/datastructures/Tuple2<TT1;TT2;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/Tuple2;->second:Ljava/lang/Object;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 69
    .local p0, "this":Lcom/itextpdf/commons/datastructures/Tuple2;, "Lcom/itextpdf/commons/datastructures/Tuple2<TT1;TT2;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Tuple2{first="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/commons/datastructures/Tuple2;->first:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", second="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/commons/datastructures/Tuple2;->second:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
