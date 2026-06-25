.class Lcom/itextpdf/io/codec/brotli/dec/Dictionary$DataLoader;
.super Ljava/lang/Object;
.source "Dictionary.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/codec/brotli/dec/Dictionary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DataLoader"
.end annotation


# static fields
.field static final OK:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 27
    const/4 v0, 0x1

    .line 29
    .local v0, "ok":Z
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Lcom/itextpdf/io/codec/brotli/dec/Dictionary;

    invoke-virtual {v2}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".DictionaryData"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    goto :goto_0

    .line 30
    :catchall_0
    move-exception v1

    .line 31
    .local v1, "ex":Ljava/lang/Throwable;
    const/4 v0, 0x0

    .line 33
    .end local v1    # "ex":Ljava/lang/Throwable;
    :goto_0
    sput-boolean v0, Lcom/itextpdf/io/codec/brotli/dec/Dictionary$DataLoader;->OK:Z

    .line 34
    .end local v0    # "ok":Z
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
