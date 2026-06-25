.class public final Lcom/itextpdf/kernel/xmp/XMPMetaFactory;
.super Ljava/lang/Object;
.source "XMPMetaFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;
    }
.end annotation


# static fields
.field private static schema:Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;

.field private static final staticLock:Ljava/lang/Object;

.field private static versionInfo:Lcom/itextpdf/kernel/xmp/XMPVersionInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 50
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->staticLock:Ljava/lang/Object;

    .line 55
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->schema:Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;

    .line 59
    const/4 v0, 0x0

    sput-object v0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->versionInfo:Lcom/itextpdf/kernel/xmp/XMPVersionInfo;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    return-void
.end method

.method private static assertImplementation(Lcom/itextpdf/kernel/xmp/XMPMeta;)V
    .locals 2
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/XMPMeta;

    .line 231
    instance-of v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    if-eqz v0, :cond_0

    .line 235
    return-void

    .line 232
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "The serializing service works onlywith the XMPMeta implementation of this library"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static create()Lcom/itextpdf/kernel/xmp/XMPMeta;
    .locals 1

    .line 79
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;-><init>()V

    return-object v0
.end method

.method public static getSchemaRegistry()Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;
    .locals 1

    .line 72
    sget-object v0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->schema:Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;

    return-object v0
.end method

.method public static getVersionInfo()Lcom/itextpdf/kernel/xmp/XMPVersionInfo;
    .locals 14

    .line 253
    sget-object v1, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->staticLock:Ljava/lang/Object;

    monitor-enter v1

    .line 254
    :try_start_0
    sget-object v0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->versionInfo:Lcom/itextpdf/kernel/xmp/XMPVersionInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v0, :cond_0

    .line 256
    const/4 v0, 0x5

    .line 257
    .local v0, "major":I
    const/4 v2, 0x1

    .line 258
    .local v2, "minor":I
    const/4 v3, 0x0

    .line 259
    .local v3, "micro":I
    const/4 v4, 0x3

    .line 260
    .local v4, "engBuild":I
    const/4 v5, 0x0

    .line 263
    .local v5, "debug":Z
    :try_start_1
    const-string v6, "Adobe XMP Core 5.1.0-jc003"

    .line 265
    .local v6, "message":Ljava/lang/String;
    new-instance v7, Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;

    const-string v13, "Adobe XMP Core 5.1.0-jc003"

    const/4 v8, 0x5

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x3

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v13}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;-><init>(IIIIZLjava/lang/String;)V

    sput-object v7, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->versionInfo:Lcom/itextpdf/kernel/xmp/XMPVersionInfo;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 269
    .end local v0    # "major":I
    .end local v2    # "minor":I
    .end local v3    # "micro":I
    .end local v4    # "engBuild":I
    .end local v5    # "debug":Z
    .end local v6    # "message":Ljava/lang/String;
    goto :goto_0

    .line 266
    :catchall_0
    move-exception v0

    .line 268
    .local v0, "e":Ljava/lang/Throwable;
    :try_start_2
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 271
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    sget-object v0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->versionInfo:Lcom/itextpdf/kernel/xmp/XMPVersionInfo;

    monitor-exit v1

    return-object v0

    .line 272
    :catchall_1
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0
.end method

.method public static parse(Ljava/io/InputStream;)Lcom/itextpdf/kernel/xmp/XMPMeta;
    .locals 1
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 91
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->parse(Ljava/io/InputStream;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lcom/itextpdf/kernel/xmp/XMPMeta;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/io/InputStream;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lcom/itextpdf/kernel/xmp/XMPMeta;
    .locals 1
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 117
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->parse(Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lcom/itextpdf/kernel/xmp/XMPMeta;

    move-result-object v0

    return-object v0
.end method

.method public static parseFromBuffer([B)Lcom/itextpdf/kernel/xmp/XMPMeta;
    .locals 1
    .param p0, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 155
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->parseFromBuffer([BLcom/itextpdf/kernel/xmp/options/ParseOptions;)Lcom/itextpdf/kernel/xmp/XMPMeta;

    move-result-object v0

    return-object v0
.end method

.method public static parseFromBuffer([BLcom/itextpdf/kernel/xmp/options/ParseOptions;)Lcom/itextpdf/kernel/xmp/XMPMeta;
    .locals 1
    .param p0, "buffer"    # [B
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 169
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->parse(Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lcom/itextpdf/kernel/xmp/XMPMeta;

    move-result-object v0

    return-object v0
.end method

.method public static parseFromString(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/XMPMeta;
    .locals 1
    .param p0, "packet"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 129
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->parseFromString(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lcom/itextpdf/kernel/xmp/XMPMeta;

    move-result-object v0

    return-object v0
.end method

.method public static parseFromString(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lcom/itextpdf/kernel/xmp/XMPMeta;
    .locals 1
    .param p0, "packet"    # Ljava/lang/String;
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 143
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->parse(Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lcom/itextpdf/kernel/xmp/XMPMeta;

    move-result-object v0

    return-object v0
.end method

.method public static reset()V
    .locals 1

    .line 243
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->schema:Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;

    .line 244
    return-void
.end method

.method public static serialize(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/io/OutputStream;)V
    .locals 1
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 181
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->serialize(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/io/OutputStream;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)V

    .line 182
    return-void
.end method

.method public static serialize(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/io/OutputStream;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)V
    .locals 1
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "options"    # Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 194
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->assertImplementation(Lcom/itextpdf/kernel/xmp/XMPMeta;)V

    .line 195
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    invoke-static {v0, p1, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerHelper;->serialize(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Ljava/io/OutputStream;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)V

    .line 196
    return-void
.end method

.method public static serializeToBuffer(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)[B
    .locals 1
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 208
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->assertImplementation(Lcom/itextpdf/kernel/xmp/XMPMeta;)V

    .line 209
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerHelper;->serializeToBuffer(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)[B

    move-result-object v0

    return-object v0
.end method

.method public static serializeToString(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)Ljava/lang/String;
    .locals 1
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 223
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->assertImplementation(Lcom/itextpdf/kernel/xmp/XMPMeta;)V

    .line 224
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerHelper;->serializeToString(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
