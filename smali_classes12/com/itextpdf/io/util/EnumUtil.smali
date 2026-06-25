.class public final Lcom/itextpdf/io/util/EnumUtil;
.super Ljava/lang/Object;
.source "EnumUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public static getAllValuesOfEnum(Ljava/lang/Class;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Enum<",
            "TT;>;>(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 44
    .local p0, "enumInstance":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    if-eqz p0, :cond_0

    .line 47
    invoke-virtual {p0}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 45
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Expected not null enum instance"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static throwIfNull(Ljava/lang/Enum;)Ljava/lang/Enum;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Enum<",
            "TT;>;>(TT;)TT;"
        }
    .end annotation

    .line 37
    .local p0, "enumInstance":Ljava/lang/Enum;, "TT;"
    if-eqz p0, :cond_0

    .line 40
    return-object p0

    .line 38
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Expected not null enum instance"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
