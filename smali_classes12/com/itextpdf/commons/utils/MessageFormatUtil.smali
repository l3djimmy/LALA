.class public final Lcom/itextpdf/commons/utils/MessageFormatUtil;
.super Ljava/lang/Object;
.source "MessageFormatUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method

.method public static varargs format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 4
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "arguments"    # [Ljava/lang/Object;

    .line 62
    new-instance v0, Ljava/text/MessageFormat;

    .line 63
    const-string v1, "\'"

    const-string v2, "\'\'"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 64
    const-string/jumbo v2, "{{{"

    const-string v3, "\'{\'{"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 65
    const-string/jumbo v2, "}}}"

    const-string/jumbo v3, "}\'}\'"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 66
    const-string/jumbo v2, "{{"

    const-string v3, "\'{\'"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 67
    const-string/jumbo v2, "}}"

    const-string v3, "\'}\'"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 68
    invoke-virtual {v0, p1}, Ljava/text/MessageFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 62
    return-object v0
.end method
