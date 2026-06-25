.class Lcom/itextpdf/layout/font/FontSetCollection$1;
.super Ljava/lang/Object;
.source "FontSetCollection.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/itextpdf/layout/font/FontSetCollection;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/itextpdf/layout/font/FontInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private i:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "Lcom/itextpdf/layout/font/FontInfo;",
            ">;"
        }
    .end annotation
.end field

.field isPrimary:Z

.field final synthetic this$0:Lcom/itextpdf/layout/font/FontSetCollection;


# direct methods
.method constructor <init>(Lcom/itextpdf/layout/font/FontSetCollection;)V
    .locals 1
    .param p1, "this$0"    # Lcom/itextpdf/layout/font/FontSetCollection;

    .line 44
    iput-object p1, p0, Lcom/itextpdf/layout/font/FontSetCollection$1;->this$0:Lcom/itextpdf/layout/font/FontSetCollection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iget-object v0, p0, Lcom/itextpdf/layout/font/FontSetCollection$1;->this$0:Lcom/itextpdf/layout/font/FontSetCollection;

    invoke-static {v0}, Lcom/itextpdf/layout/font/FontSetCollection;->access$000(Lcom/itextpdf/layout/font/FontSetCollection;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/font/FontSetCollection$1;->i:Ljava/util/Iterator;

    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/font/FontSetCollection$1;->isPrimary:Z

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 49
    iget-object v0, p0, Lcom/itextpdf/layout/font/FontSetCollection$1;->i:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    .line 50
    .local v0, "hasNext":Z
    if-nez v0, :cond_0

    iget-boolean v1, p0, Lcom/itextpdf/layout/font/FontSetCollection$1;->isPrimary:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/itextpdf/layout/font/FontSetCollection$1;->this$0:Lcom/itextpdf/layout/font/FontSetCollection;

    invoke-static {v1}, Lcom/itextpdf/layout/font/FontSetCollection;->access$100(Lcom/itextpdf/layout/font/FontSetCollection;)Ljava/util/Collection;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 51
    iget-object v1, p0, Lcom/itextpdf/layout/font/FontSetCollection$1;->this$0:Lcom/itextpdf/layout/font/FontSetCollection;

    invoke-static {v1}, Lcom/itextpdf/layout/font/FontSetCollection;->access$100(Lcom/itextpdf/layout/font/FontSetCollection;)Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/layout/font/FontSetCollection$1;->i:Ljava/util/Iterator;

    .line 52
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/itextpdf/layout/font/FontSetCollection$1;->isPrimary:Z

    .line 53
    iget-object v1, p0, Lcom/itextpdf/layout/font/FontSetCollection$1;->i:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    return v1

    .line 55
    :cond_0
    return v0
.end method

.method public next()Lcom/itextpdf/layout/font/FontInfo;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/itextpdf/layout/font/FontSetCollection$1;->i:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/font/FontInfo;

    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 44
    invoke-virtual {p0}, Lcom/itextpdf/layout/font/FontSetCollection$1;->next()Lcom/itextpdf/layout/font/FontInfo;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 1

    .line 64
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
