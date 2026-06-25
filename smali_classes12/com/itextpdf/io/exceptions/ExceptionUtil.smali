.class public final Lcom/itextpdf/io/exceptions/ExceptionUtil;
.super Ljava/lang/Object;
.source "ExceptionUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method public static isOutOfRange(Ljava/lang/Exception;)Z
    .locals 1
    .param p0, "e"    # Ljava/lang/Exception;

    .line 35
    instance-of v0, p0, Ljava/lang/IndexOutOfBoundsException;

    return v0
.end method
