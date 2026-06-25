.class Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;
.super Ljava/lang/Object;
.source "ByteBufferRandomAccessSource.java"

# interfaces
.implements Lcom/itextpdf/io/source/IRandomAccessSource;


# static fields
.field private static final CLEANER:Lcom/itextpdf/io/source/BufferCleaner;

.field public static final UNMAP_SUPPORTED:Z

.field private static allowUnmapping:Z


# instance fields
.field private final byteBuffer:Ljava/nio/ByteBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 42
    const/4 v0, 0x1

    sput-boolean v0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->allowUnmapping:Z

    .line 149
    new-instance v1, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v1

    .line 151
    .local v1, "hack":Ljava/lang/Object;
    instance-of v2, v1, Lcom/itextpdf/io/source/BufferCleaner;

    if-eqz v2, :cond_0

    .line 152
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/io/source/BufferCleaner;

    sput-object v2, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->CLEANER:Lcom/itextpdf/io/source/BufferCleaner;

    .line 153
    sput-boolean v0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->UNMAP_SUPPORTED:Z

    goto :goto_0

    .line 155
    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->CLEANER:Lcom/itextpdf/io/source/BufferCleaner;

    .line 156
    const/4 v0, 0x0

    sput-boolean v0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->UNMAP_SUPPORTED:Z

    .line 158
    .end local v1    # "hack":Ljava/lang/Object;
    :goto_0
    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 56
    return-void
.end method

.method private static clean(Ljava/nio/ByteBuffer;)Z
    .locals 1
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;

    .line 168
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 172
    :cond_0
    new-instance v0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource$$ExternalSyntheticLambda0;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    .line 169
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method private static cleanByUnmapping(Ljava/nio/ByteBuffer;)Z
    .locals 7
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;

    .line 176
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 179
    .local v0, "success":Ljava/lang/Boolean;
    :try_start_0
    sget-boolean v1, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->UNMAP_SUPPORTED:Z

    if-eqz v1, :cond_0

    .line 180
    sget-object v1, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->CLEANER:Lcom/itextpdf/io/source/BufferCleaner;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p0}, Lcom/itextpdf/io/source/BufferCleaner;->freeBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    goto :goto_0

    .line 184
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "cleaner"

    const/4 v3, 0x0

    move-object v4, v3

    check-cast v4, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 185
    .local v1, "getCleanerMethod":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 186
    move-object v2, v3

    check-cast v2, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 187
    .local v2, "cleaner":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "clean"

    move-object v6, v3

    check-cast v6, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 188
    .local v4, "clean":Ljava/lang/reflect/Method;
    move-object v5, v3

    check-cast v5, [Ljava/lang/Object;

    invoke-virtual {v4, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    .end local v1    # "getCleanerMethod":Ljava/lang/reflect/Method;
    .end local v2    # "cleaner":Ljava/lang/Object;
    .end local v4    # "clean":Ljava/lang/reflect/Method;
    :goto_0
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 195
    goto :goto_1

    .line 191
    :catch_0
    move-exception v1

    .line 193
    .local v1, "e":Ljava/lang/Exception;
    const-class v2, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 194
    .local v2, "logger":Lorg/slf4j/Logger;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 196
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1
.end method

.method public static disableByteBufferMemoryUnmapping()V
    .locals 1

    .line 69
    const/4 v0, 0x0

    sput-boolean v0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->allowUnmapping:Z

    .line 70
    return-void
.end method

.method public static enableByteBufferMemoryUnmapping()V
    .locals 1

    .line 62
    const/4 v0, 0x0

    sput-boolean v0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->allowUnmapping:Z

    .line 63
    return-void
.end method

.method static synthetic lambda$clean$0(Ljava/nio/ByteBuffer;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;

    .line 172
    invoke-static {p0}, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->cleanByUnmapping(Ljava/nio/ByteBuffer;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 132
    sget-boolean v0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->allowUnmapping:Z

    if-eqz v0, :cond_0

    .line 133
    iget-object v0, p0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->clean(Ljava/nio/ByteBuffer;)Z

    .line 135
    :cond_0
    return-void
.end method

.method public get(J)I
    .locals 3
    .param p1, "position"    # J

    .line 80
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-gtz v0, :cond_1

    .line 85
    const/4 v0, -0x1

    :try_start_0
    iget-object v1, p0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    int-to-long v1, v1

    cmp-long v1, p1, v1

    if-ltz v1, :cond_0

    .line 86
    return v0

    .line 88
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v1

    long-to-int v2, p1

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0
    :try_end_0
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    and-int/lit16 v0, v0, 0xff

    return v0

    .line 89
    :catch_0
    move-exception v1

    .line 91
    .local v1, "e":Ljava/nio/BufferUnderflowException;
    return v0

    .line 81
    .end local v1    # "e":Ljava/nio/BufferUnderflowException;
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Position must be less than Integer.MAX_VALUE"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get(J[BII)I
    .locals 2
    .param p1, "position"    # J
    .param p3, "bytes"    # [B
    .param p4, "off"    # I
    .param p5, "len"    # I

    .line 103
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-gtz v0, :cond_1

    .line 107
    iget-object v0, p0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    int-to-long v0, v0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 108
    const/4 v0, -0x1

    return v0

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 112
    .local v0, "byteBufferCopy":Ljava/nio/ByteBuffer;
    long-to-int v1, p1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 113
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    invoke-static {p5, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 114
    .local v1, "bytesFromThisBuffer":I
    invoke-virtual {v0, p3, p4, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 116
    return v1

    .line 104
    .end local v0    # "byteBufferCopy":Ljava/nio/ByteBuffer;
    .end local v1    # "bytesFromThisBuffer":I
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Position must be less than Integer.MAX_VALUE"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public length()J
    .locals 2

    .line 124
    iget-object v0, p0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method
