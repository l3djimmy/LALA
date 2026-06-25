.class public final Lcom/itextpdf/kernel/crypto/IVGenerator;
.super Ljava/lang/Object;
.source "IVGenerator.java"


# static fields
.field private static final arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 37
    new-instance v0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    invoke-direct {v0}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/crypto/IVGenerator;->arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    .line 38
    invoke-static {}, Lcom/itextpdf/commons/utils/SystemUtil;->getTimeBasedSeed()J

    move-result-wide v0

    .line 39
    .local v0, "time":J
    invoke-static {}, Lcom/itextpdf/commons/utils/SystemUtil;->getFreeMemory()J

    move-result-wide v2

    .line 40
    .local v2, "mem":J
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "+"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 41
    .local v4, "s":Ljava/lang/String;
    sget-object v5, Lcom/itextpdf/kernel/crypto/IVGenerator;->arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    sget-object v6, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-virtual {v4, v6}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->prepareARCFOURKey([B)V

    .line 42
    .end local v0    # "time":J
    .end local v2    # "mem":J
    .end local v4    # "s":Ljava/lang/String;
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method public static getIV()[B
    .locals 1

    .line 56
    const/16 v0, 0x10

    invoke-static {v0}, Lcom/itextpdf/kernel/crypto/IVGenerator;->getIV(I)[B

    move-result-object v0

    return-object v0
.end method

.method public static getIV(I)[B
    .locals 3
    .param p0, "len"    # I

    .line 66
    new-array v0, p0, [B

    .line 67
    .local v0, "b":[B
    sget-object v1, Lcom/itextpdf/kernel/crypto/IVGenerator;->arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    monitor-enter v1

    .line 68
    :try_start_0
    sget-object v2, Lcom/itextpdf/kernel/crypto/IVGenerator;->arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->encryptARCFOUR([B)V

    .line 69
    monitor-exit v1

    .line 70
    return-object v0

    .line 69
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method
