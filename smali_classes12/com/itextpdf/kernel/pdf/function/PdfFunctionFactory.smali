.class public final Lcom/itextpdf/kernel/pdf/function/PdfFunctionFactory;
.super Ljava/lang/Object;
.source "PdfFunctionFactory.java"


# static fields
.field public static final FUNCTION_TYPE_0:I = 0x0

.field public static final FUNCTION_TYPE_2:I = 0x2

.field public static final FUNCTION_TYPE_3:I = 0x3

.field public static final FUNCTION_TYPE_4:I = 0x4


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
    .locals 4
    .param p0, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 53
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isStream()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 77
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Invalid object type, a function must be either a Dictionary or a Stream"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_1
    :goto_0
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 56
    .local v0, "dict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FunctionType:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    const/16 v2, 0x9

    packed-switch v1, :pswitch_data_0

    .line 72
    :pswitch_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->FunctionType:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 74
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 72
    const-string v3, "Invalid function type {0}"

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 67
    :pswitch_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    if-ne v1, v2, :cond_2

    .line 70
    new-instance v1, Lcom/itextpdf/kernel/pdf/function/PdfType4Function;

    move-object v2, p0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/function/PdfType4Function;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    return-object v1

    .line 68
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Invalid object type, a function type 4 requires a stream object"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 65
    :pswitch_2
    new-instance v1, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v1

    .line 63
    :pswitch_3
    new-instance v1, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v1

    .line 58
    :pswitch_4
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    if-ne v1, v2, :cond_3

    .line 61
    new-instance v1, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;

    move-object v2, p0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    return-object v1

    .line 59
    :cond_3
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Invalid object type, a function type 0 requires a stream object"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
