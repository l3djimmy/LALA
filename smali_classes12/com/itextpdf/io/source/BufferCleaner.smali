.class Lcom/itextpdf/io/source/BufferCleaner;
.super Ljava/lang/Object;
.source "BufferCleaner.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final method:Ljava/lang/reflect/Method;

.field final theUnsafe:Ljava/lang/Object;

.field unmappableBufferClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 33
    return-void
.end method

.method constructor <init>(Ljava/lang/Class;Ljava/lang/reflect/Method;Ljava/lang/Object;)V
    .locals 0
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "theUnsafe"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 38
    .local p1, "unmappableBufferClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/itextpdf/io/source/BufferCleaner;->unmappableBufferClass:Ljava/lang/Class;

    .line 40
    iput-object p2, p0, Lcom/itextpdf/io/source/BufferCleaner;->method:Ljava/lang/reflect/Method;

    .line 41
    iput-object p3, p0, Lcom/itextpdf/io/source/BufferCleaner;->theUnsafe:Ljava/lang/Object;

    .line 42
    return-void
.end method

.method static unmapHackImpl()Ljava/lang/Object;
    .locals 6

    .line 72
    :try_start_0
    const-string/jumbo v0, "sun.misc.Unsafe"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 73
    .local v0, "unsafeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "invokeCleaner"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/nio/ByteBuffer;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 74
    .local v1, "method":Ljava/lang/reflect/Method;
    const-string/jumbo v3, "theUnsafe"

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 75
    .local v3, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 76
    const/4 v2, 0x0

    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 77
    .local v2, "theUnsafe":Ljava/lang/Object;
    new-instance v4, Lcom/itextpdf/io/source/BufferCleaner;

    const-class v5, Ljava/nio/ByteBuffer;

    invoke-direct {v4, v5, v1, v2}, Lcom/itextpdf/io/source/BufferCleaner;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Method;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v4

    .line 78
    .end local v0    # "unsafeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method":Ljava/lang/reflect/Method;
    .end local v2    # "theUnsafe":Ljava/lang/Object;
    .end local v3    # "f":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v0

    .line 79
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method freeBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "resourceDescription"    # Ljava/lang/String;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 45
    sget-object v0, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    iget-object v1, p0, Lcom/itextpdf/io/source/BufferCleaner;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 46
    iget-object v0, p0, Lcom/itextpdf/io/source/BufferCleaner;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    array-length v0, v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_4

    .line 47
    const-class v0, Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/itextpdf/io/source/BufferCleaner;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 48
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 51
    iget-object v0, p0, Lcom/itextpdf/io/source/BufferCleaner;->unmappableBufferClass:Ljava/lang/Class;

    invoke-virtual {v0, p2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 54
    new-instance v0, Lcom/itextpdf/io/source/BufferCleaner$1;

    invoke-direct {v0, p0, p2}, Lcom/itextpdf/io/source/BufferCleaner$1;-><init>(Lcom/itextpdf/io/source/BufferCleaner;Ljava/nio/ByteBuffer;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    .line 64
    .local v0, "error":Ljava/lang/Throwable;
    if-nez v0, :cond_0

    .line 67
    return-void

    .line 65
    :cond_0
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to unmap the mapped buffer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 52
    .end local v0    # "error":Ljava/lang/Throwable;
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "buffer is not an instance of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/io/source/BufferCleaner;->unmappableBufferClass:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "unmapping only works with direct buffers"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 46
    :cond_4
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 45
    :cond_5
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method
