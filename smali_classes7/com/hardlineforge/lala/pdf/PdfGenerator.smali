.class public final Lcom/hardlineforge/lala/pdf/PdfGenerator;
.super Ljava/lang/Object;
.source "PdfGenerator.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPdfGenerator.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PdfGenerator.kt\ncom/hardlineforge/lala/pdf/PdfGenerator\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,64:1\n1869#2:65\n1870#2:67\n1#3:66\n*S KotlinDebug\n*F\n+ 1 PdfGenerator.kt\ncom/hardlineforge/lala/pdf/PdfGenerator\n*L\n43#1:65\n43#1:67\n*E\n"
.end annotation

.annotation runtime Ljavax/inject/Singleton;
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u0013\u0008\u0007\u0012\u0008\u0008\u0001\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001c\u0010\u0006\u001a\u00020\u00072\u000c\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\n0\t2\u0006\u0010\u000b\u001a\u00020\u0007R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/hardlineforge/lala/pdf/PdfGenerator;",
        "",
        "context",
        "Landroid/content/Context;",
        "<init>",
        "(Landroid/content/Context;)V",
        "generate",
        "Ljava/io/File;",
        "entries",
        "",
        "Lcom/hardlineforge/lala/data/LogEntry;",
        "file",
        "app_debug"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/pdf/PdfGenerator;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation runtime Ldagger/hilt/android/qualifiers/ApplicationContext;
        .end annotation
    .end param
    .annotation runtime Ljavax/inject/Inject;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/hardlineforge/lala/pdf/PdfGenerator;->context:Landroid/content/Context;

    .line 19
    return-void
.end method


# virtual methods
.method public final generate(Ljava/util/List;Ljava/io/File;)Ljava/io/File;
    .locals 17
    .param p1, "entries"    # Ljava/util/List;
    .param p2, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;",
            "Ljava/io/File;",
            ")",
            "Ljava/io/File;"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    const-string v2, "entries"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "file"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfWriter;

    invoke-direct {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfWriter;-><init>(Ljava/io/File;)V

    .line 24
    .local v2, "writer":Lcom/itextpdf/kernel/pdf/PdfWriter;
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfWriter;)V

    .line 25
    .local v3, "pdfDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    new-instance v4, Lcom/itextpdf/layout/Document;

    sget-object v5, Lcom/itextpdf/kernel/geom/PageSize;->LETTER:Lcom/itextpdf/kernel/geom/PageSize;

    invoke-direct {v4, v3, v5}, Lcom/itextpdf/layout/Document;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/geom/PageSize;)V

    .line 27
    .local v4, "document":Lcom/itextpdf/layout/Document;
    nop

    .line 28
    new-instance v5, Lcom/itextpdf/layout/element/Paragraph;

    const-string v6, "LALA \u2014 LOCAL AREA LOG REPORT"

    invoke-direct {v5, v6}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Ljava/lang/String;)V

    .line 29
    sget-object v6, Lcom/itextpdf/layout/properties/TextAlignment;->CENTER:Lcom/itextpdf/layout/properties/TextAlignment;

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/element/Paragraph;->setTextAlignment(Lcom/itextpdf/layout/properties/TextAlignment;)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/element/Paragraph;

    .line 30
    const/high16 v6, 0x41900000    # 18.0f

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/element/Paragraph;->setFontSize(F)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/element/Paragraph;

    .line 31
    invoke-virtual {v5}, Lcom/itextpdf/layout/element/Paragraph;->setBold()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/element/IBlockElement;

    .line 27
    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/Document;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/Document;

    .line 33
    nop

    .line 34
    new-instance v5, Lcom/itextpdf/layout/element/Paragraph;

    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Generated: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Ljava/lang/String;)V

    .line 35
    sget-object v6, Lcom/itextpdf/layout/properties/TextAlignment;->CENTER:Lcom/itextpdf/layout/properties/TextAlignment;

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/element/Paragraph;->setTextAlignment(Lcom/itextpdf/layout/properties/TextAlignment;)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/element/Paragraph;

    .line 36
    const/high16 v6, 0x41200000    # 10.0f

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/element/Paragraph;->setFontSize(F)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/element/IBlockElement;

    .line 33
    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/Document;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/Document;

    .line 38
    new-instance v5, Lcom/itextpdf/layout/element/Paragraph;

    const-string v6, "\n"

    invoke-direct {v5, v6}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Ljava/lang/String;)V

    check-cast v5, Lcom/itextpdf/layout/element/IBlockElement;

    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/Document;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/Document;

    .line 40
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 41
    new-instance v5, Lcom/itextpdf/layout/element/Paragraph;

    const-string v6, "No entries to report."

    invoke-direct {v5, v6}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Ljava/lang/String;)V

    check-cast v5, Lcom/itextpdf/layout/element/IBlockElement;

    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/Document;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/Document;

    goto/16 :goto_1

    .line 43
    :cond_0
    move-object v5, v0

    check-cast v5, Ljava/lang/Iterable;

    .local v5, "$this$forEach\\1":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 65
    .local v7, "$i$f$forEach\\1\\43":I
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .local v9, "element\\1":Ljava/lang/Object;
    move-object v10, v9

    check-cast v10, Lcom/hardlineforge/lala/data/LogEntry;

    .local v10, "entry\\2":Lcom/hardlineforge/lala/data/LogEntry;
    const/4 v11, 0x0

    .line 44
    .local v11, "$i$a$-forEach-PdfGenerator$generate$1\\2\\65\\0":I
    const-string v12, "MMMM d, yyyy  h:mm a z"

    invoke-static {v12}, Ljava/time/format/DateTimeFormatter;->ofPattern(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    move-result-object v12

    .line 45
    .local v12, "fmt\\2":Ljava/time/format/DateTimeFormatter;
    invoke-virtual {v10}, Lcom/hardlineforge/lala/data/LogEntry;->getTimestamp()Ljava/time/Instant;

    move-result-object v13

    invoke-virtual {v10}, Lcom/hardlineforge/lala/data/LogEntry;->getTimezone()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/time/ZoneId;->of(Ljava/lang/String;)Ljava/time/ZoneId;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/time/Instant;->atZone(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/time/ZonedDateTime;->format(Ljava/time/format/DateTimeFormatter;)Ljava/lang/String;

    move-result-object v13

    .line 47
    .local v13, "ts\\2":Ljava/lang/String;
    new-instance v14, Lcom/itextpdf/layout/element/Paragraph;

    const-string v15, "\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

    invoke-direct {v14, v15}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Ljava/lang/String;)V

    const/high16 v15, 0x41000000    # 8.0f

    invoke-virtual {v14, v15}, Lcom/itextpdf/layout/element/Paragraph;->setFontSize(F)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v14

    check-cast v14, Lcom/itextpdf/layout/element/IBlockElement;

    invoke-virtual {v4, v14}, Lcom/itextpdf/layout/Document;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/Document;

    .line 48
    new-instance v14, Lcom/itextpdf/layout/element/Paragraph;

    invoke-virtual {v10}, Lcom/hardlineforge/lala/data/LogEntry;->getCategory()Ljava/lang/String;

    move-result-object v15

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Entry: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v14, v0}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Lcom/itextpdf/layout/element/Paragraph;->setBold()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/IBlockElement;

    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/Document;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/Document;

    .line 49
    new-instance v0, Lcom/itextpdf/layout/element/Paragraph;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Date/Time: "

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Ljava/lang/String;)V

    check-cast v0, Lcom/itextpdf/layout/element/IBlockElement;

    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/Document;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/Document;

    .line 50
    invoke-virtual {v10}, Lcom/hardlineforge/lala/data/LogEntry;->getLocationName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 66
    .local v0, "it\\3":Ljava/lang/String;
    const/4 v1, 0x0

    .line 50
    .local v1, "$i$a$-let-PdfGenerator$generate$1$1\\3\\50\\2":I
    new-instance v14, Lcom/itextpdf/layout/element/Paragraph;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v16, v1

    .end local v1    # "$i$a$-let-PdfGenerator$generate$1$1\\3\\50\\2":I
    .local v16, "$i$a$-let-PdfGenerator$generate$1$1\\3\\50\\2":I
    const-string v1, "Location: "

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v14, v1}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Ljava/lang/String;)V

    check-cast v14, Lcom/itextpdf/layout/element/IBlockElement;

    invoke-virtual {v4, v14}, Lcom/itextpdf/layout/Document;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/Document;

    .line 51
    .end local v0    # "it\\3":Ljava/lang/String;
    .end local v16    # "$i$a$-let-PdfGenerator$generate$1$1\\3\\50\\2":I
    :cond_1
    invoke-virtual {v10}, Lcom/hardlineforge/lala/data/LogEntry;->getGpsLat()Ljava/lang/Double;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v10}, Lcom/hardlineforge/lala/data/LogEntry;->getGpsLon()Ljava/lang/Double;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 52
    new-instance v0, Lcom/itextpdf/layout/element/Paragraph;

    invoke-virtual {v10}, Lcom/hardlineforge/lala/data/LogEntry;->getGpsLat()Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v10}, Lcom/hardlineforge/lala/data/LogEntry;->getGpsLon()Ljava/lang/Double;

    move-result-object v14

    filled-new-array {v1, v14}, [Ljava/lang/Object;

    move-result-object v1

    const/4 v14, 0x2

    invoke-static {v1, v14}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    const-string v14, "GPS: %.6f, %.6f"

    invoke-static {v14, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v14, "format(...)"

    invoke-static {v1, v14}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Ljava/lang/String;)V

    check-cast v0, Lcom/itextpdf/layout/element/IBlockElement;

    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/Document;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/Document;

    .line 54
    :cond_2
    new-instance v0, Lcom/itextpdf/layout/element/Paragraph;

    const-string v1, "Comment:"

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Paragraph;->setItalic()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/IBlockElement;

    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/Document;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/Document;

    .line 55
    new-instance v0, Lcom/itextpdf/layout/element/Paragraph;

    invoke-virtual {v10}, Lcom/hardlineforge/lala/data/LogEntry;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Ljava/lang/String;)V

    check-cast v0, Lcom/itextpdf/layout/element/IBlockElement;

    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/Document;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/Document;

    .line 56
    new-instance v0, Lcom/itextpdf/layout/element/Paragraph;

    invoke-direct {v0, v6}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Ljava/lang/String;)V

    check-cast v0, Lcom/itextpdf/layout/element/IBlockElement;

    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/Document;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/Document;

    .line 57
    nop

    .line 65
    .end local v10    # "entry\\2":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v11    # "$i$a$-forEach-PdfGenerator$generate$1\\2\\65\\0":I
    .end local v12    # "fmt\\2":Ljava/time/format/DateTimeFormatter;
    .end local v13    # "ts\\2":Ljava/lang/String;
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    .end local v9    # "element\\1":Ljava/lang/Object;
    goto/16 :goto_0

    .line 67
    :cond_3
    nop

    .line 60
    .end local v5    # "$this$forEach\\1":Ljava/lang/Iterable;
    .end local v7    # "$i$f$forEach\\1\\43":I
    :goto_1
    invoke-virtual {v4}, Lcom/itextpdf/layout/Document;->close()V

    .line 61
    return-object p2
.end method
