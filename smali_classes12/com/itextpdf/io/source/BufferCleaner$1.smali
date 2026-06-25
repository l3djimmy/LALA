.class Lcom/itextpdf/io/source/BufferCleaner$1;
.super Ljava/lang/Object;
.source "BufferCleaner.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/itextpdf/io/source/BufferCleaner;->freeBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedAction<",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/itextpdf/io/source/BufferCleaner;

.field final synthetic val$buffer:Ljava/nio/ByteBuffer;


# direct methods
.method constructor <init>(Lcom/itextpdf/io/source/BufferCleaner;Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/itextpdf/io/source/BufferCleaner;

    .line 54
    iput-object p1, p0, Lcom/itextpdf/io/source/BufferCleaner$1;->this$0:Lcom/itextpdf/io/source/BufferCleaner;

    iput-object p2, p0, Lcom/itextpdf/io/source/BufferCleaner$1;->val$buffer:Ljava/nio/ByteBuffer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1

    .line 54
    invoke-virtual {p0}, Lcom/itextpdf/io/source/BufferCleaner$1;->run()Ljava/lang/Throwable;

    move-result-object v0

    return-object v0
.end method

.method public run()Ljava/lang/Throwable;
    .locals 3

    .line 57
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/io/source/BufferCleaner$1;->this$0:Lcom/itextpdf/io/source/BufferCleaner;

    iget-object v0, v0, Lcom/itextpdf/io/source/BufferCleaner;->method:Ljava/lang/reflect/Method;

    iget-object v1, p0, Lcom/itextpdf/io/source/BufferCleaner$1;->this$0:Lcom/itextpdf/io/source/BufferCleaner;

    iget-object v1, v1, Lcom/itextpdf/io/source/BufferCleaner;->theUnsafe:Ljava/lang/Object;

    iget-object v2, p0, Lcom/itextpdf/io/source/BufferCleaner$1;->val$buffer:Ljava/nio/ByteBuffer;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    const/4 v0, 0x0

    return-object v0

    .line 59
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 60
    .local v0, "e":Ljava/lang/ReflectiveOperationException;
    :goto_0
    return-object v0
.end method
