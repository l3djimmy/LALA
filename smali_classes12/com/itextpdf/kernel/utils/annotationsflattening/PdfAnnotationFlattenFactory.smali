.class public Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;
.super Ljava/lang/Object;
.source "PdfAnnotationFlattenFactory.java"


# static fields
.field private static final UNKNOWN:Lcom/itextpdf/kernel/pdf/PdfName;

.field private static final map:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Ljava/util/function/Supplier<",
            "Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 32
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v1, "Unknown"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->UNKNOWN:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 35
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    .line 36
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Link:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda0;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Popup:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda11;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda11;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Widget:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda18;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda18;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Screen:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda19;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda19;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->_3D:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda20;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda20;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Highlight:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda21;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda21;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Underline:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda22;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda22;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Squiggly:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda23;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda23;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StrikeOut:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda24;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda24;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Caret:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda25;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda25;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Text:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda1;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda1;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Sound:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda2;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda2;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Stamp:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda3;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda3;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FileAttachment:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda4;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda4;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Ink:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda5;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda5;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->PrinterMark:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda6;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda6;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->TrapNet:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda7;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda7;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FreeText:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda8;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda8;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Square:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda9;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda9;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Circle:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda10;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda10;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Line:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda12;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda12;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Polygon:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda13;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda13;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->PolyLine:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda14;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda14;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Redact:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda15;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda15;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Watermark:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda16;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda16;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v1, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->UNKNOWN:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda17;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory$$ExternalSyntheticLambda17;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    return-void
.end method

.method static synthetic lambda$static$0()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 36
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$1()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 37
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/RemoveWithoutDrawingFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/RemoveWithoutDrawingFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$10()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 46
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$11()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 47
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$12()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 48
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$13()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 49
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$14()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 50
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$15()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 51
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$16()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 53
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$17()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 54
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$18()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 55
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$19()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 56
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$2()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 38
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/WarnFormfieldFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/WarnFormfieldFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$20()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 57
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$21()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 58
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$22()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 59
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$23()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 60
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$24()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 61
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$25()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 63
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/NotSupportedFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/NotSupportedFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$3()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 39
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$4()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 40
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$5()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 41
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/HighLightTextMarkupAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/HighLightTextMarkupAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$6()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 42
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/UnderlineTextMarkupAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/UnderlineTextMarkupAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$7()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 43
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/SquigglyTextMarkupAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/SquigglyTextMarkupAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$8()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 44
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/StrikeOutTextMarkupAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/StrikeOutTextMarkupAnnotationFlattener;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$static$9()Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 1

    .line 45
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-object v0
.end method


# virtual methods
.method public getAnnotationFlattenWorker(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .locals 3
    .param p1, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 82
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/function/Supplier;

    .line 83
    .local v0, "worker":Ljava/util/function/Supplier;, "Ljava/util/function/Supplier<Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;>;"
    if-nez v0, :cond_0

    .line 84
    sget-object v1, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->map:Ljava/util/HashMap;

    sget-object v2, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->UNKNOWN:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Ljava/util/function/Supplier;

    .line 86
    :cond_0
    invoke-interface {v0}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;

    return-object v1
.end method
