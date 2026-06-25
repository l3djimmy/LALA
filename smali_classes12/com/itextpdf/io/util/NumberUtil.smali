.class public Lcom/itextpdf/io/util/NumberUtil;
.super Ljava/lang/Object;
.source "NumberUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method public static asFloat(Ljava/lang/Object;)Ljava/lang/Float;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;

    .line 36
    move-object v0, p0

    check-cast v0, Ljava/lang/Number;

    .line 37
    .local v0, "value":Ljava/lang/Number;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public static asInteger(Ljava/lang/Object;)Ljava/lang/Integer;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;

    .line 41
    move-object v0, p0

    check-cast v0, Ljava/lang/Number;

    .line 42
    .local v0, "value":Ljava/lang/Number;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method
