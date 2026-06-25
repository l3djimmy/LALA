.class public Lcom/itextpdf/kernel/utils/CompareTool;
.super Ljava/lang/Object;
.source "CompareTool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/utils/CompareTool$CompareToolExecutionException;,
        Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;,
        Lcom/itextpdf/kernel/utils/CompareTool$ImageNameComparator;,
        Lcom/itextpdf/kernel/utils/CompareTool$DiffPngFileFilter;,
        Lcom/itextpdf/kernel/utils/CompareTool$CmpPngFileFilter;,
        Lcom/itextpdf/kernel/utils/CompareTool$PngFileFilter;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final COPYRIGHT_REGEXP:Ljava/lang/String; = "\u00a9\\d+-\\d+ (?:iText Group NV|Apryse Group NV)"

.field private static final COPYRIGHT_REPLACEMENT:Ljava/lang/String; = "\u00a9<copyright years> Apryse Group NV"

.field private static final DIFFERENT_PAGES:Ljava/lang/String; = "File file://<filename> differs on page <pagenumber>."

.field private static final FILE_PROTOCOL:Ljava/lang/String; = "file://"

.field private static final IGNORED_AREAS_PREFIX:Ljava/lang/String; = "ignored_areas_"

.field private static final NEW_LINES:Ljava/lang/String; = "\\r|\\n"

.field private static final UNEXPECTED_NUMBER_OF_PAGES:Ljava/lang/String; = "Unexpected number of pages for <filename>."

.field private static final VERSION_REGEXP:Ljava/lang/String; = "(\\d+\\.)+\\d+(-SNAPSHOT)?"

.field private static final VERSION_REPLACEMENT:Ljava/lang/String; = "<version>"


# instance fields
.field private cmpImage:Ljava/lang/String;

.field private cmpPagesRef:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;"
        }
    .end annotation
.end field

.field private cmpPdf:Ljava/lang/String;

.field private cmpPdfName:Ljava/lang/String;

.field private cmpProps:Lcom/itextpdf/kernel/pdf/ReaderProperties;

.field private compareByContentErrorsLimit:I

.field private compareExec:Ljava/lang/String;

.field private encryptionCompareEnabled:Z

.field private generateCompareByContentXmlReport:Z

.field private gsExec:Ljava/lang/String;

.field private metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

.field private outImage:Ljava/lang/String;

.field private outPagesRef:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;"
        }
    .end annotation
.end field

.field private outPdf:Ljava/lang/String;

.field private outPdfName:Ljava/lang/String;

.field private outProps:Lcom/itextpdf/kernel/pdf/ReaderProperties;

.field private useCachedPagesForComparison:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 113
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    const/16 v0, 0x3e8

    iput v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->compareByContentErrorsLimit:I

    .line 140
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->generateCompareByContentXmlReport:Z

    .line 142
    iput-boolean v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->encryptionCompareEnabled:Z

    .line 144
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->useCachedPagesForComparison:Z

    .line 151
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "gsExec"    # Ljava/lang/String;
    .param p2, "compareExec"    # Ljava/lang/String;

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    const/16 v0, 0x3e8

    iput v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->compareByContentErrorsLimit:I

    .line 140
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->generateCompareByContentXmlReport:Z

    .line 142
    iput-boolean v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->encryptionCompareEnabled:Z

    .line 144
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->useCachedPagesForComparison:Z

    .line 154
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/CompareTool;->gsExec:Ljava/lang/String;

    .line 155
    iput-object p2, p0, Lcom/itextpdf/kernel/utils/CompareTool;->compareExec:Ljava/lang/String;

    .line 156
    return-void
.end method

.method public static cleanup(Ljava/lang/String;)V
    .locals 0
    .param p0, "path"    # Ljava/lang/String;

    .line 219
    invoke-static {p0}, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->cleanup(Ljava/lang/String;)V

    .line 220
    return-void
.end method

.method private compareArraysExtended(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z
    .locals 5
    .param p1, "outArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p2, "cmpArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p3, "currentPath"    # Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .param p4, "compareResult"    # Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;

    .line 1681
    const/4 v0, 0x0

    if-nez p1, :cond_1

    .line 1682
    if-eqz p4, :cond_0

    if-eqz p3, :cond_0

    .line 1683
    const-string v1, "Found null. Expected PdfArray."

    invoke-virtual {p4, p3, v1}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1684
    :cond_0
    return v0

    .line 1685
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    if-eq v1, v2, :cond_3

    .line 1686
    if-eqz p4, :cond_2

    if-eqz p3, :cond_2

    .line 1687
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "PdfArrays. Lengths are different. Expected: {0}. Found: {1}."

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p4, p3, v1}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1688
    :cond_2
    return v0

    .line 1690
    :cond_3
    const/4 v1, 0x1

    .line 1691
    .local v1, "arraysAreEqual":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_9

    .line 1692
    if-eqz p3, :cond_4

    .line 1693
    invoke-virtual {p3, v2}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->pushArrayItemToPath(I)V

    .line 1694
    :cond_4
    invoke-virtual {p1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(IZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {p2, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(IZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {p0, v3, v4, p3, p4}, Lcom/itextpdf/kernel/utils/CompareTool;->compareObjects(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v3

    if-eqz v3, :cond_5

    if-eqz v1, :cond_5

    const/4 v3, 0x1

    goto :goto_1

    :cond_5
    move v3, v0

    :goto_1
    move v1, v3

    .line 1695
    if-eqz p3, :cond_6

    .line 1696
    invoke-virtual {p3}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->pop()V

    .line 1697
    :cond_6
    if-nez v1, :cond_8

    if-eqz p3, :cond_7

    if-eqz p4, :cond_7

    invoke-virtual {p4}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->isMessageLimitReached()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 1698
    :cond_7
    return v0

    .line 1691
    :cond_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1701
    .end local v2    # "i":I
    :cond_9
    return v1
.end method

.method private compareBooleansExtended(Lcom/itextpdf/kernel/pdf/PdfBoolean;Lcom/itextpdf/kernel/pdf/PdfBoolean;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z
    .locals 2
    .param p1, "outBoolean"    # Lcom/itextpdf/kernel/pdf/PdfBoolean;
    .param p2, "cmpBoolean"    # Lcom/itextpdf/kernel/pdf/PdfBoolean;
    .param p3, "currentPath"    # Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .param p4, "compareResult"    # Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;

    .line 1798
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->getValue()Z

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->getValue()Z

    move-result v1

    if-ne v0, v1, :cond_0

    .line 1799
    const/4 v0, 0x1

    return v0

    .line 1801
    :cond_0
    if-eqz p4, :cond_1

    if-eqz p3, :cond_1

    .line 1802
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->getValue()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->getValue()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "PdfBoolean. Expected: {0}. Found: {1}."

    invoke-static {v1, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, p3, v0}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1803
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private compareByContent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 18
    .param p1, "outPath"    # Ljava/lang/String;
    .param p2, "differenceImagePrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1232
    .local p3, "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    move-object/from16 v1, p0

    invoke-direct {v1}, Lcom/itextpdf/kernel/utils/CompareTool;->printOutCmpDirectories()V

    .line 1233
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Comparing by content.........."

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 1235
    iget-object v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->outPdf:Ljava/lang/String;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/utils/CompareTool;->getOutReaderProperties()Lcom/itextpdf/kernel/pdf/ReaderProperties;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/itextpdf/kernel/utils/CompareTool;->createOutputReader(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/ReaderProperties;)Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v7

    .line 1236
    .local v7, "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    :try_start_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDocument;

    new-instance v2, Lcom/itextpdf/kernel/pdf/DocumentProperties;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/DocumentProperties;-><init>()V

    iget-object v3, v1, Lcom/itextpdf/kernel/utils/CompareTool;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 1237
    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/DocumentProperties;->setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;

    move-result-object v2

    invoke-direct {v0, v7, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/DocumentProperties;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_b

    move-object v8, v0

    .line 1235
    .local v8, "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    nop

    .line 1238
    :try_start_1
    iget-object v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdf:Ljava/lang/String;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/utils/CompareTool;->getCmpReaderProperties()Lcom/itextpdf/kernel/pdf/ReaderProperties;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/itextpdf/kernel/utils/CompareTool;->createOutputReader(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/ReaderProperties;)Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_8

    move-object v9, v0

    .line 1235
    .local v9, "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    nop

    .line 1239
    :try_start_2
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDocument;

    new-instance v2, Lcom/itextpdf/kernel/pdf/DocumentProperties;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/DocumentProperties;-><init>()V

    iget-object v3, v1, Lcom/itextpdf/kernel/utils/CompareTool;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 1240
    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/DocumentProperties;->setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;

    move-result-object v2

    invoke-direct {v0, v9, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/DocumentProperties;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    move-object v10, v0

    .line 1235
    .local v10, "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    nop

    .line 1242
    :try_start_3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v11, v0

    .line 1243
    .local v11, "outPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->outPagesRef:Ljava/util/List;

    .line 1244
    iget-object v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->outPagesRef:Ljava/util/List;

    invoke-direct {v1, v8, v11, v0}, Lcom/itextpdf/kernel/utils/CompareTool;->loadPagesFromReader(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;Ljava/util/List;)V

    .line 1246
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v12, v0

    .line 1247
    .local v12, "cmpPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPagesRef:Ljava/util/List;

    .line 1248
    iget-object v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPagesRef:Ljava/util/List;

    invoke-direct {v1, v10, v12, v0}, Lcom/itextpdf/kernel/utils/CompareTool;->loadPagesFromReader(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;Ljava/util/List;)V

    .line 1250
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v2

    if-eq v0, v2, :cond_2

    .line 1251
    iget-object v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->outPdf:Ljava/lang/String;

    invoke-static {v0}, Lcom/itextpdf/kernel/utils/CompareTool;->writeOnDisk(Ljava/lang/String;)V

    .line 1252
    iget-object v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdf:Ljava/lang/String;

    invoke-static {v0}, Lcom/itextpdf/kernel/utils/CompareTool;->writeOnDiskIfNotExists(Ljava/lang/String;)V

    .line 1253
    const-string v2, "Documents have different numbers of pages."

    const/4 v6, 0x0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/kernel/utils/CompareTool;->compareVisuallyAndCombineReports(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)Ljava/lang/String;

    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 1294
    :try_start_4
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_5

    if-eqz v9, :cond_0

    :try_start_5
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_8

    :cond_0
    :try_start_6
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_b

    if-eqz v7, :cond_1

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V

    .line 1253
    :cond_1
    return-object v0

    .line 1256
    :cond_2
    :try_start_7
    new-instance v5, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;

    iget v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->compareByContentErrorsLimit:I

    invoke-direct {v5, v0}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;-><init>(I)V

    .line 1257
    .local v5, "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    new-instance v6, Ljava/util/ArrayList;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {v6, v0}, Ljava/util/ArrayList;-><init>(I)V

    move-object v13, v6

    .line 1258
    .local v13, "equalPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_4

    .line 1259
    new-instance v2, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    iget-object v3, v1, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPagesRef:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget-object v4, v1, Lcom/itextpdf/kernel/utils/CompareTool;->outPagesRef:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;-><init>(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    .line 1260
    .local v2, "currentPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    invoke-interface {v11, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-interface {v12, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1, v3, v4, v2, v5}, Lcom/itextpdf/kernel/utils/CompareTool;->compareDictionariesExtended(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1261
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v13, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1258
    .end local v2    # "currentPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1264
    .end local v0    # "i":I
    :cond_4
    new-instance v4, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    .line 1265
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-direct {v4, v0, v2}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;-><init>(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    .line 1266
    .local v4, "catalogPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    new-instance v6, Ljava/util/LinkedHashSet;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Pages:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v14, 0x0

    aput-object v2, v0, v14

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Metadata:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v3, 0x1

    aput-object v2, v0, v3

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v6, v0}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 1267
    .local v6, "ignoredCatalogEntries":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/kernel/utils/CompareTool;->compareDictionariesExtended(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;Ljava/util/Set;)Z

    move-object/from16 v16, v4

    move-object v15, v5

    move-object/from16 v17, v6

    .line 1270
    .end local v4    # "catalogPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .end local v5    # "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    .end local v6    # "ignoredCatalogEntries":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    .local v15, "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    .local v16, "catalogPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .local v17, "ignoredCatalogEntries":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    iget-boolean v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->encryptionCompareEnabled:Z

    if-eqz v0, :cond_5

    .line 1271
    invoke-direct {v1, v8, v10, v15}, Lcom/itextpdf/kernel/utils/CompareTool;->compareDocumentsEncryption(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)V

    .line 1273
    :cond_5
    iget-boolean v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->generateCompareByContentXmlReport:Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    if-eqz v0, :cond_6

    .line 1274
    :try_start_8
    new-instance v0, Ljava/io/File;

    iget-object v2, v1, Lcom/itextpdf/kernel/utils/CompareTool;->outPdf:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    move-object v2, v0

    .line 1275
    .local v2, "outPdfName":Ljava/lang/String;
    new-instance v0, Ljava/io/FileOutputStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    move-object/from16 v4, p1

    :try_start_9
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "/"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x3

    invoke-virtual {v2, v14, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "report.xml"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    move-object v3, v0

    .line 1277
    .local v3, "xml":Ljava/io/FileOutputStream;
    :try_start_a
    invoke-virtual {v15, v3}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->writeReportToXml(Ljava/io/OutputStream;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 1281
    :try_start_b
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 1282
    goto :goto_2

    .line 1281
    :catchall_0
    move-exception v0

    goto :goto_1

    .line 1278
    :catch_0
    move-exception v0

    .line 1279
    .local v0, "e":Ljava/lang/Exception;
    :try_start_c
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local v2    # "outPdfName":Ljava/lang/String;
    .end local v3    # "xml":Ljava/io/FileOutputStream;
    .end local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v8    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v10    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v11    # "outPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    .end local v12    # "cmpPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    .end local v13    # "equalPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v15    # "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    .end local v16    # "catalogPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .end local v17    # "ignoredCatalogEntries":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "differenceImagePrefix":Ljava/lang/String;
    .end local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    throw v5
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 1281
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "outPdfName":Ljava/lang/String;
    .restart local v3    # "xml":Ljava/io/FileOutputStream;
    .restart local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v8    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v10    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v11    # "outPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    .restart local v12    # "cmpPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    .restart local v13    # "equalPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v15    # "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    .restart local v16    # "catalogPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .restart local v17    # "ignoredCatalogEntries":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "differenceImagePrefix":Ljava/lang/String;
    .restart local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :goto_1
    :try_start_d
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 1282
    nop

    .end local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v8    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v10    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "differenceImagePrefix":Ljava/lang/String;
    .end local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    throw v0

    .line 1235
    .end local v2    # "outPdfName":Ljava/lang/String;
    .end local v3    # "xml":Ljava/io/FileOutputStream;
    .end local v11    # "outPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    .end local v12    # "cmpPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    .end local v13    # "equalPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v15    # "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    .end local v16    # "catalogPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .end local v17    # "ignoredCatalogEntries":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    .restart local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v8    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v10    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "differenceImagePrefix":Ljava/lang/String;
    .restart local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_1
    move-exception v0

    move-object/from16 v4, p1

    goto :goto_3

    .line 1273
    .restart local v11    # "outPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    .restart local v12    # "cmpPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    .restart local v13    # "equalPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v15    # "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    .restart local v16    # "catalogPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .restart local v17    # "ignoredCatalogEntries":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    :cond_6
    move-object/from16 v4, p1

    .line 1285
    :goto_2
    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v2

    if-ne v0, v2, :cond_9

    invoke-virtual {v15}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->isOk()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 1286
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "OK"

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1287
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->flush()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 1288
    nop

    .line 1294
    :try_start_e
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    if-eqz v9, :cond_7

    :try_start_f
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_8

    :cond_7
    :try_start_10
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_b

    if-eqz v7, :cond_8

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V

    .line 1288
    :cond_8
    const/4 v0, 0x0

    return-object v0

    .line 1290
    :cond_9
    :try_start_11
    iget-object v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->outPdf:Ljava/lang/String;

    invoke-static {v0}, Lcom/itextpdf/kernel/utils/CompareTool;->writeOnDisk(Ljava/lang/String;)V

    .line 1291
    iget-object v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdf:Ljava/lang/String;

    invoke-static {v0}, Lcom/itextpdf/kernel/utils/CompareTool;->writeOnDiskIfNotExists(Ljava/lang/String;)V

    .line 1292
    invoke-virtual {v15}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->getReport()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v5, p3

    move-object v3, v4

    move-object v6, v13

    move-object/from16 v4, p2

    .end local v13    # "equalPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v6, "equalPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/kernel/utils/CompareTool;->compareVisuallyAndCombineReports(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)Ljava/lang/String;

    move-result-object v0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    .line 1294
    :try_start_12
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_5

    if-eqz v9, :cond_a

    :try_start_13
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_8

    :cond_a
    :try_start_14
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_b

    if-eqz v7, :cond_b

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V

    .line 1292
    :cond_b
    return-object v0

    .line 1235
    .end local v6    # "equalPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v11    # "outPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    .end local v12    # "cmpPages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    .end local v15    # "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    .end local v16    # "catalogPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .end local v17    # "ignoredCatalogEntries":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    :catchall_2
    move-exception v0

    :goto_3
    move-object v1, v0

    .end local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v8    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v10    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "differenceImagePrefix":Ljava/lang/String;
    .end local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :try_start_15
    throw v1
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_3

    .line 1294
    .restart local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v8    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v10    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "differenceImagePrefix":Ljava/lang/String;
    .restart local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_3
    move-exception v0

    move-object v2, v0

    :try_start_16
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_4

    goto :goto_4

    :catchall_4
    move-exception v0

    :try_start_17
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v8    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "differenceImagePrefix":Ljava/lang/String;
    .end local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :goto_4
    throw v2
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_5

    .line 1235
    .end local v10    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v8    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "differenceImagePrefix":Ljava/lang/String;
    .restart local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_5
    move-exception v0

    move-object v1, v0

    .end local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v8    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "differenceImagePrefix":Ljava/lang/String;
    .end local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :try_start_18
    throw v1
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_6

    .line 1294
    .restart local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v8    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "differenceImagePrefix":Ljava/lang/String;
    .restart local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_6
    move-exception v0

    move-object v2, v0

    if-eqz v9, :cond_c

    :try_start_19
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_7

    goto :goto_5

    :catchall_7
    move-exception v0

    :try_start_1a
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v8    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "differenceImagePrefix":Ljava/lang/String;
    .end local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :cond_c
    :goto_5
    throw v2
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_8

    .line 1235
    .end local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v8    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "differenceImagePrefix":Ljava/lang/String;
    .restart local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_8
    move-exception v0

    move-object v1, v0

    .end local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v8    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "differenceImagePrefix":Ljava/lang/String;
    .end local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :try_start_1b
    throw v1
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_9

    .line 1294
    .restart local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v8    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "differenceImagePrefix":Ljava/lang/String;
    .restart local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_9
    move-exception v0

    move-object v2, v0

    :try_start_1c
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_a

    goto :goto_6

    :catchall_a
    move-exception v0

    :try_start_1d
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "differenceImagePrefix":Ljava/lang/String;
    .end local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :goto_6
    throw v2
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_b

    .line 1235
    .end local v8    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "differenceImagePrefix":Ljava/lang/String;
    .restart local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_b
    move-exception v0

    move-object v1, v0

    .end local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "differenceImagePrefix":Ljava/lang/String;
    .end local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :try_start_1e
    throw v1
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_c

    .line 1294
    .restart local v7    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "differenceImagePrefix":Ljava/lang/String;
    .restart local p3    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_c
    move-exception v0

    move-object v2, v0

    if-eqz v7, :cond_d

    :try_start_1f
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_d

    goto :goto_7

    :catchall_d
    move-exception v0

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_d
    :goto_7
    throw v2
.end method

.method private compareDictionariesExtended(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z
    .locals 6
    .param p1, "outDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "cmpDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p3, "currentPath"    # Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .param p4, "compareResult"    # Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;

    .line 1391
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .end local p1    # "outDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local p2    # "cmpDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local p3    # "currentPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .end local p4    # "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    .local v1, "outDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v2, "cmpDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v3, "currentPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .local v4, "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/utils/CompareTool;->compareDictionariesExtended(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;Ljava/util/Set;)Z

    move-result p1

    return p1
.end method

.method private compareDictionariesExtended(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;Ljava/util/Set;)Z
    .locals 17
    .param p1, "outDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "cmpDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p3, "currentPath"    # Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .param p4, "compareResult"    # Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;",
            "Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;)Z"
        }
    .end annotation

    .line 1395
    .local p5, "excludedKeys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    const/4 v6, 0x0

    if-eqz v2, :cond_0

    if-eqz v1, :cond_1

    :cond_0
    if-eqz v1, :cond_2

    if-nez v2, :cond_2

    .line 1396
    :cond_1
    const-string v7, "One of the dictionaries is null, the other is not."

    invoke-virtual {v4, v3, v7}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1397
    return v6

    .line 1399
    :cond_2
    const/4 v7, 0x1

    .line 1401
    .local v7, "dictsAreSame":Z
    new-instance v8, Ljava/util/TreeSet;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 1402
    .local v8, "mergedKeys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 1403
    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1e

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 1404
    .local v10, "key":Lcom/itextpdf/kernel/pdf/PdfName;
    if-nez v7, :cond_4

    if-eqz v3, :cond_3

    if-eqz v4, :cond_3

    invoke-virtual {v4}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->isMessageLimitReached()Z

    move-result v11

    if-eqz v11, :cond_4

    .line 1405
    :cond_3
    return v6

    .line 1408
    :cond_4
    if-eqz v5, :cond_5

    invoke-interface {v5, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 1409
    goto/16 :goto_6

    .line 1411
    :cond_5
    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1d

    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1d

    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->ModDate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    goto/16 :goto_6

    .line 1412
    :cond_6
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isStream()Z

    move-result v11

    if-eqz v11, :cond_7

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isStream()Z

    move-result v11

    if-eqz v11, :cond_7

    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1d

    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 1413
    goto/16 :goto_6

    .line 1414
    :cond_7
    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->BaseFont:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_8

    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->FontName:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_e

    .line 1415
    :cond_8
    invoke-virtual {v2, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v11

    .line 1416
    .local v11, "cmpObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v11, :cond_e

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/PdfObject;->isName()Z

    move-result v12

    if-eqz v12, :cond_e

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    const/16 v13, 0x2b

    invoke-virtual {v12, v13}, Ljava/lang/String;->indexOf(I)I

    move-result v12

    if-lez v12, :cond_e

    .line 1417
    invoke-virtual {v1, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v12

    .line 1418
    .local v12, "outObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/PdfObject;->isName()Z

    move-result v14

    const-string v15, "PdfDictionary {0} entry: Expected: {1}. Found: {2}"

    if-eqz v14, :cond_c

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/String;->indexOf(I)I

    move-result v14

    const/4 v6, -0x1

    if-ne v14, v6, :cond_9

    goto :goto_3

    .line 1423
    :cond_9
    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/String;->indexOf(I)I

    move-result v14

    invoke-virtual {v6, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 1424
    .local v6, "cmpName":Ljava/lang/String;
    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v13}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    invoke-virtual {v14, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 1425
    .local v5, "outName":Ljava/lang/String;
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_b

    .line 1426
    if-eqz v4, :cond_a

    if-eqz v3, :cond_a

    .line 1427
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfName;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v16, v5

    .end local v5    # "outName":Ljava/lang/String;
    .local v16, "outName":Ljava/lang/String;
    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    filled-new-array {v13, v14, v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v15, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    goto :goto_1

    .line 1426
    .end local v16    # "outName":Ljava/lang/String;
    .restart local v5    # "outName":Ljava/lang/String;
    :cond_a
    move-object/from16 v16, v5

    .line 1428
    .end local v5    # "outName":Ljava/lang/String;
    .restart local v16    # "outName":Ljava/lang/String;
    :goto_1
    const/4 v5, 0x0

    move v7, v5

    .end local v7    # "dictsAreSame":Z
    .local v5, "dictsAreSame":Z
    goto :goto_2

    .line 1425
    .end local v16    # "outName":Ljava/lang/String;
    .local v5, "outName":Ljava/lang/String;
    .restart local v7    # "dictsAreSame":Z
    :cond_b
    move-object/from16 v16, v5

    .line 1431
    .end local v5    # "outName":Ljava/lang/String;
    .end local v6    # "cmpName":Ljava/lang/String;
    :goto_2
    move-object/from16 v5, p5

    const/4 v6, 0x0

    goto/16 :goto_0

    .line 1419
    :cond_c
    :goto_3
    if-eqz v4, :cond_d

    if-eqz v3, :cond_d

    .line 1420
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfName;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    filled-new-array {v5, v6, v13}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v15, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1421
    :cond_d
    const/4 v7, 0x0

    move-object/from16 v5, p5

    const/4 v6, 0x0

    goto/16 :goto_0

    .line 1436
    .end local v11    # "cmpObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v12    # "outObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_e
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->ParentTree:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v10, v5}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_13

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->PageLabels:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v10, v5}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_f

    const/4 v5, 0x0

    goto :goto_5

    .line 1485
    :cond_f
    if-eqz v3, :cond_10

    .line 1486
    invoke-virtual {v3, v10}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->pushDictItemToPath(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 1488
    :cond_10
    const/4 v5, 0x0

    invoke-virtual {v1, v10, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    invoke-virtual {v2, v10, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v11

    invoke-virtual {v0, v6, v11, v3, v4}, Lcom/itextpdf/kernel/utils/CompareTool;->compareObjects(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v6

    if-eqz v6, :cond_11

    if-eqz v7, :cond_11

    const/4 v6, 0x1

    goto :goto_4

    :cond_11
    move v6, v5

    :goto_4
    move v7, v6

    .line 1489
    if-eqz v3, :cond_12

    .line 1490
    invoke-virtual {v3}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->pop()V

    .line 1492
    .end local v10    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_12
    move v6, v5

    move-object/from16 v5, p5

    goto/16 :goto_0

    .line 1436
    .restart local v10    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_13
    const/4 v5, 0x0

    .line 1437
    :goto_5
    if-eqz v3, :cond_14

    .line 1438
    invoke-virtual {v3, v10}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->pushDictItemToPath(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 1440
    :cond_14
    invoke-virtual {v1, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v6

    .line 1441
    .local v6, "outNumTree":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {v2, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v11

    .line 1442
    .local v11, "cmpNumTree":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v12, Ljava/util/LinkedList;

    invoke-direct {v12}, Ljava/util/LinkedList;-><init>()V

    .line 1443
    .local v12, "outItems":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    new-instance v13, Ljava/util/LinkedList;

    invoke-direct {v13}, Ljava/util/LinkedList;-><init>()V

    .line 1444
    .local v13, "cmpItems":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const/4 v14, 0x0

    invoke-direct {v0, v6, v14, v12}, Lcom/itextpdf/kernel/utils/CompareTool;->flattenNumTree(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfNumber;Ljava/util/LinkedList;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v15

    .line 1445
    .local v15, "outLeftover":Lcom/itextpdf/kernel/pdf/PdfNumber;
    invoke-direct {v0, v11, v14, v13}, Lcom/itextpdf/kernel/utils/CompareTool;->flattenNumTree(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfNumber;Ljava/util/LinkedList;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v14

    .line 1446
    .local v14, "cmpLeftover":Lcom/itextpdf/kernel/pdf/PdfNumber;
    const-string v5, "Number tree ends with a key which is invalid according to the PDF specification."

    const-class v16, Lcom/itextpdf/kernel/utils/CompareTool;

    if-eqz v15, :cond_16

    .line 1447
    invoke-static/range {v16 .. v16}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    invoke-interface {v1, v5}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 1448
    if-nez v14, :cond_16

    .line 1449
    if-eqz v4, :cond_15

    if-eqz v3, :cond_15

    .line 1450
    const-string v1, "Number tree unexpectedly ends with a key"

    invoke-virtual {v4, v3, v1}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1452
    :cond_15
    const/4 v7, 0x0

    .line 1455
    :cond_16
    if-eqz v14, :cond_18

    .line 1456
    invoke-static/range {v16 .. v16}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    invoke-interface {v1, v5}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 1457
    if-nez v15, :cond_18

    .line 1458
    if-eqz v4, :cond_17

    if-eqz v3, :cond_17

    .line 1459
    const-string v1, "Number tree was expected to end with a key (although it is invalid according to the specification), but ended with a value"

    invoke-virtual {v4, v3, v1}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1461
    :cond_17
    const/4 v7, 0x0

    .line 1464
    :cond_18
    if-eqz v15, :cond_1a

    if-eqz v14, :cond_1a

    invoke-virtual {v0, v15, v14}, Lcom/itextpdf/kernel/utils/CompareTool;->compareNumbers(Lcom/itextpdf/kernel/pdf/PdfNumber;Lcom/itextpdf/kernel/pdf/PdfNumber;)Z

    move-result v1

    if-nez v1, :cond_1a

    .line 1465
    if-eqz v4, :cond_19

    if-eqz v3, :cond_19

    .line 1466
    const-string v1, "Number tree was expected to end with a different key (although it is invalid according to the specification)"

    invoke-virtual {v4, v3, v1}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1468
    :cond_19
    const/4 v7, 0x0

    .line 1470
    :cond_1a
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v12}, Ljava/util/LinkedList;->size()I

    move-result v5

    invoke-direct {v1, v12, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Ljava/lang/Iterable;I)V

    .line 1471
    .local v1, "outArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v13}, Ljava/util/LinkedList;->size()I

    move-result v2

    invoke-direct {v5, v13, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Ljava/lang/Iterable;I)V

    .line 1472
    .local v5, "cmpArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-direct {v0, v1, v5, v3, v4}, Lcom/itextpdf/kernel/utils/CompareTool;->compareArraysExtended(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v2

    if-nez v2, :cond_1c

    .line 1473
    if-eqz v4, :cond_1b

    if-eqz v3, :cond_1b

    .line 1474
    const-string v2, "Number trees were flattened, compared and found to be different."

    invoke-virtual {v4, v3, v2}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1476
    :cond_1b
    const/4 v2, 0x0

    move v7, v2

    .line 1479
    :cond_1c
    if-eqz v3, :cond_1d

    .line 1480
    invoke-virtual {v3}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->pop()V

    .line 1403
    .end local v1    # "outArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v5    # "cmpArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v6    # "outNumTree":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v10    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v11    # "cmpNumTree":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v12    # "outItems":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    .end local v13    # "cmpItems":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    .end local v14    # "cmpLeftover":Lcom/itextpdf/kernel/pdf/PdfNumber;
    .end local v15    # "outLeftover":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :cond_1d
    :goto_6
    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v5, p5

    const/4 v6, 0x0

    goto/16 :goto_0

    .line 1493
    :cond_1e
    return v7
.end method

.method private compareDocumentsEncryption(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)V
    .locals 19
    .param p1, "outDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "cmpDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "compareResult"    # Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;

    .line 1333
    move-object/from16 v4, p3

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTrailer()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Encrypt:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 1334
    .local v1, "outEncrypt":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTrailer()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Encrypt:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 1336
    .local v2, "cmpEncrypt":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v1, :cond_0

    if-nez v2, :cond_0

    .line 1337
    return-void

    .line 1340
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    invoke-direct {v0, v7, v6}, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    move-object v8, v0

    .line 1341
    .local v8, "trailerPath":Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;
    if-nez v1, :cond_1

    .line 1342
    const-string v0, "Expected encrypted document."

    invoke-virtual {v4, v8, v0}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1343
    return-void

    .line 1345
    :cond_1
    if-nez v2, :cond_2

    .line 1346
    const-string v0, "Expected not encrypted document."

    invoke-virtual {v4, v8, v0}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1347
    return-void

    .line 1350
    :cond_2
    new-instance v5, Ljava/util/LinkedHashSet;

    const/4 v0, 0x7

    new-array v0, v0, [Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->O:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v9, 0x0

    aput-object v3, v0, v9

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->U:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v10, 0x1

    aput-object v3, v0, v10

    const/4 v3, 0x2

    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->OE:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v11, v0, v3

    const/4 v3, 0x3

    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->UE:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v11, v0, v3

    const/4 v3, 0x4

    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->Perms:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v11, v0, v3

    const/4 v3, 0x5

    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->CF:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v11, v0, v3

    const/4 v3, 0x6

    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->Recipients:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v11, v0, v3

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v5, v0}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 1351
    .local v5, "ignoredEncryptEntries":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    new-instance v3, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v11

    invoke-direct {v3, v0, v11}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;-><init>(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    .line 1352
    .local v3, "objectPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/utils/CompareTool;->compareDictionariesExtended(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;Ljava/util/Set;)Z

    .line 1354
    move-object v11, v1

    move-object v12, v2

    move-object v13, v5

    .end local v1    # "outEncrypt":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v2    # "cmpEncrypt":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v5    # "ignoredEncryptEntries":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    .local v11, "outEncrypt":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v12, "cmpEncrypt":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v13, "ignoredEncryptEntries":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->CF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v11, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v14

    .line 1355
    .local v14, "outCfDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->CF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v12, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v15

    .line 1356
    .local v15, "cmpCfDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v15, :cond_3

    if-eqz v14, :cond_8

    .line 1357
    :cond_3
    if-eqz v15, :cond_4

    if-eqz v14, :cond_5

    :cond_4
    if-nez v15, :cond_6

    .line 1358
    :cond_5
    const-string v0, "One of the dictionaries is null, the other is not."

    invoke-virtual {v4, v3, v0}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    goto :goto_1

    .line 1360
    :cond_6
    new-instance v0, Ljava/util/TreeSet;

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 1361
    .local v0, "mergedKeys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    invoke-virtual {v15}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 1362
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 1363
    .local v1, "key":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->pushDictItemToPath(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 1364
    new-instance v5, Ljava/util/LinkedHashSet;

    new-array v2, v10, [Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v17, Lcom/itextpdf/kernel/pdf/PdfName;->Recipients:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v17, v2, v9

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v5, v2}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 1365
    .local v5, "excludedKeys":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    invoke-virtual {v14, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    move-object/from16 v17, v2

    invoke-virtual {v15, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    move-object/from16 v18, v1

    move-object/from16 v1, v17

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    .end local v0    # "mergedKeys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    .end local v1    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v17, "mergedKeys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    .local v18, "key":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/utils/CompareTool;->compareDictionariesExtended(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;Ljava/util/Set;)Z

    .line 1366
    invoke-virtual {v3}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->pop()V

    .line 1367
    .end local v5    # "excludedKeys":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    .end local v18    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    move-object/from16 v4, p3

    move-object/from16 v0, v17

    goto :goto_0

    .line 1362
    .end local v17    # "mergedKeys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    .restart local v0    # "mergedKeys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    :cond_7
    move-object/from16 v17, v0

    .line 1370
    .end local v0    # "mergedKeys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    :cond_8
    :goto_1
    return-void
.end method

.method private compareImagesOfPdfs(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .locals 20
    .param p1, "outPath"    # Ljava/lang/String;
    .param p2, "differenceImagePrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1086
    .local p3, "equalPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p3

    new-instance v0, Lcom/itextpdf/kernel/utils/CompareTool$PngFileFilter;

    iget-object v4, v1, Lcom/itextpdf/kernel/utils/CompareTool;->outPdfName:Ljava/lang/String;

    invoke-direct {v0, v4}, Lcom/itextpdf/kernel/utils/CompareTool$PngFileFilter;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v0}, Lcom/itextpdf/commons/utils/FileUtil;->listFilesInDirectoryByFilter(Ljava/lang/String;Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v4

    .line 1087
    .local v4, "imageFiles":[Ljava/io/File;
    new-instance v0, Lcom/itextpdf/kernel/utils/CompareTool$CmpPngFileFilter;

    iget-object v5, v1, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdfName:Ljava/lang/String;

    invoke-direct {v0, v5}, Lcom/itextpdf/kernel/utils/CompareTool$CmpPngFileFilter;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v0}, Lcom/itextpdf/commons/utils/FileUtil;->listFilesInDirectoryByFilter(Ljava/lang/String;Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v5

    .line 1088
    .local v5, "cmpImageFiles":[Ljava/io/File;
    const/4 v0, 0x0

    .line 1089
    .local v0, "bUnexpectedNumberOfPages":Z
    array-length v6, v4

    array-length v7, v5

    if-eq v6, v7, :cond_0

    .line 1090
    const/4 v0, 0x1

    move v6, v0

    goto :goto_0

    .line 1089
    :cond_0
    move v6, v0

    .line 1092
    .end local v0    # "bUnexpectedNumberOfPages":Z
    .local v6, "bUnexpectedNumberOfPages":Z
    :goto_0
    array-length v0, v4

    array-length v7, v5

    invoke-static {v0, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 1093
    .local v7, "cnt":I
    const/4 v0, 0x1

    if-lt v7, v0, :cond_9

    .line 1097
    new-instance v0, Lcom/itextpdf/kernel/utils/CompareTool$ImageNameComparator;

    const/4 v8, 0x0

    invoke-direct {v0, v8}, Lcom/itextpdf/kernel/utils/CompareTool$ImageNameComparator;-><init>(Lcom/itextpdf/kernel/utils/CompareTool$1;)V

    invoke-static {v4, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 1098
    new-instance v0, Lcom/itextpdf/kernel/utils/CompareTool$ImageNameComparator;

    invoke-direct {v0, v8}, Lcom/itextpdf/kernel/utils/CompareTool$ImageNameComparator;-><init>(Lcom/itextpdf/kernel/utils/CompareTool$1;)V

    invoke-static {v5, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 1101
    const/4 v9, 0x0

    .line 1102
    .local v9, "imageMagickInitError":Ljava/lang/String;
    const/4 v10, 0x0

    .line 1104
    .local v10, "imageMagickHelper":Lcom/itextpdf/io/util/ImageMagickHelper;
    :try_start_0
    new-instance v0, Lcom/itextpdf/io/util/ImageMagickHelper;

    iget-object v11, v1, Lcom/itextpdf/kernel/utils/CompareTool;->compareExec:Ljava/lang/String;

    invoke-direct {v0, v11}, Lcom/itextpdf/io/util/ImageMagickHelper;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v10, v0

    .line 1105
    const/4 v0, 0x1

    .line 1110
    .local v0, "compareExecIsOk":Z
    goto :goto_1

    .line 1106
    .end local v0    # "compareExecIsOk":Z
    :catch_0
    move-exception v0

    .line 1107
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const/4 v11, 0x0

    .line 1108
    .local v11, "compareExecIsOk":Z
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v9

    .line 1109
    const-class v12, Lcom/itextpdf/kernel/utils/CompareTool;

    invoke-static {v12}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v12

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    move v0, v11

    .line 1112
    .end local v11    # "compareExecIsOk":Z
    .local v0, "compareExecIsOk":Z
    :goto_1
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 1113
    .local v11, "diffPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v12, 0x0

    .line 1115
    .local v12, "differentPagesFail":Ljava/lang/String;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_2
    if-ge v13, v7, :cond_5

    .line 1116
    if-eqz v3, :cond_1

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-interface {v3, v14}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 1117
    move-object/from16 v15, p2

    move/from16 v18, v0

    move-object/from16 v16, v8

    goto/16 :goto_4

    .line 1118
    :cond_1
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v16, v8

    const-string v8, "Comparing page "

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    add-int/lit8 v17, v13, 0x1

    move/from16 v18, v0

    .end local v0    # "compareExecIsOk":Z
    .local v18, "compareExecIsOk":Z
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v15, ": "

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget-object v17, v4, v13

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/itextpdf/io/util/UrlUtil;->getNormalizedFileUriString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " ..."

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1119
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    add-int/lit8 v14, v13, 0x1

    invoke-static {v14}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v14, v4, v13

    invoke-virtual {v14}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/itextpdf/io/util/UrlUtil;->getNormalizedFileUriString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1120
    new-instance v0, Ljava/io/FileInputStream;

    aget-object v3, v4, v13

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 1121
    .local v0, "is1":Ljava/io/FileInputStream;
    new-instance v3, Ljava/io/FileInputStream;

    aget-object v8, v5, v13

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v3, v8}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 1122
    .local v3, "is2":Ljava/io/FileInputStream;
    invoke-direct {v1, v0, v3}, Lcom/itextpdf/kernel/utils/CompareTool;->compareStreams(Ljava/io/InputStream;Ljava/io/InputStream;)Z

    move-result v8

    .line 1123
    .local v8, "cmpResult":Z
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 1124
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 1125
    if-nez v8, :cond_4

    .line 1126
    const-string v12, "Page is different!"

    .line 1127
    add-int/lit8 v14, v13, 0x1

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-interface {v11, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1128
    if-eqz v18, :cond_3

    .line 1129
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v15, p2

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    add-int/lit8 v17, v13, 0x1

    move-object/from16 v19, v0

    .end local v0    # "is1":Ljava/io/FileInputStream;
    .local v19, "is1":Ljava/io/FileInputStream;
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v14, ".png"

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1130
    .local v0, "diffName":Ljava/lang/String;
    aget-object v14, v4, v13

    invoke-virtual {v14}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v14

    aget-object v17, v5, v13

    .line 1131
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 1130
    invoke-virtual {v10, v14, v2, v0}, Lcom/itextpdf/io/util/ImageMagickHelper;->runImageMagickImageCompare(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1132
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1133
    .local v2, "diffFile":Ljava/io/File;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v17, v0

    .end local v0    # "diffName":Ljava/lang/String;
    .local v17, "diffName":Ljava/lang/String;
    const-string v0, "\nPlease, examine file://"

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1134
    invoke-static {v2}, Lcom/itextpdf/io/util/UrlUtil;->toNormalizedURI(Ljava/io/File;)Ljava/net/URI;

    move-result-object v14

    invoke-virtual {v14}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v14, " for more details."

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    goto :goto_3

    .line 1130
    .end local v2    # "diffFile":Ljava/io/File;
    .end local v17    # "diffName":Ljava/lang/String;
    .restart local v0    # "diffName":Ljava/lang/String;
    :cond_2
    move-object/from16 v17, v0

    .end local v0    # "diffName":Ljava/lang/String;
    .restart local v17    # "diffName":Ljava/lang/String;
    goto :goto_3

    .line 1128
    .end local v17    # "diffName":Ljava/lang/String;
    .end local v19    # "is1":Ljava/io/FileInputStream;
    .local v0, "is1":Ljava/io/FileInputStream;
    :cond_3
    move-object/from16 v15, p2

    move-object/from16 v19, v0

    .line 1137
    .end local v0    # "is1":Ljava/io/FileInputStream;
    .restart local v19    # "is1":Ljava/io/FileInputStream;
    :goto_3
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_4

    .line 1139
    .end local v19    # "is1":Ljava/io/FileInputStream;
    .restart local v0    # "is1":Ljava/io/FileInputStream;
    :cond_4
    move-object/from16 v15, p2

    move-object/from16 v19, v0

    .end local v0    # "is1":Ljava/io/FileInputStream;
    .restart local v19    # "is1":Ljava/io/FileInputStream;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, " done."

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1115
    .end local v3    # "is2":Ljava/io/FileInputStream;
    .end local v8    # "cmpResult":Z
    .end local v19    # "is1":Ljava/io/FileInputStream;
    :goto_4
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v2, p1

    move-object/from16 v3, p3

    move-object/from16 v8, v16

    move/from16 v0, v18

    goto/16 :goto_2

    .end local v18    # "compareExecIsOk":Z
    .local v0, "compareExecIsOk":Z
    :cond_5
    move-object/from16 v15, p2

    move/from16 v18, v0

    move-object/from16 v16, v8

    .line 1142
    .end local v0    # "compareExecIsOk":Z
    .end local v13    # "i":I
    .restart local v18    # "compareExecIsOk":Z
    const-string v0, "<filename>"

    if-eqz v12, :cond_7

    .line 1143
    iget-object v2, v1, Lcom/itextpdf/kernel/utils/CompareTool;->outPdf:Ljava/lang/String;

    invoke-static {v2}, Lcom/itextpdf/io/util/UrlUtil;->toNormalizedURI(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "File file://<filename> differs on page <pagenumber>."

    invoke-virtual {v3, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "<pagenumber>"

    invoke-direct {v1, v11}, Lcom/itextpdf/kernel/utils/CompareTool;->listDiffPagesAsString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 1144
    .local v0, "errorMessage":Ljava/lang/String;
    if-nez v18, :cond_6

    .line 1145
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1147
    :cond_6
    return-object v0

    .line 1149
    .end local v0    # "errorMessage":Ljava/lang/String;
    :cond_7
    if-eqz v6, :cond_8

    .line 1150
    const-string v2, "Unexpected number of pages for <filename>."

    iget-object v3, v1, Lcom/itextpdf/kernel/utils/CompareTool;->outPdf:Ljava/lang/String;

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1153
    :cond_8
    return-object v16

    .line 1094
    .end local v9    # "imageMagickInitError":Ljava/lang/String;
    .end local v10    # "imageMagickHelper":Lcom/itextpdf/io/util/ImageMagickHelper;
    .end local v11    # "diffPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v12    # "differentPagesFail":Ljava/lang/String;
    .end local v18    # "compareExecIsOk":Z
    :cond_9
    move-object/from16 v15, p2

    new-instance v0, Lcom/itextpdf/kernel/utils/CompareTool$CompareToolExecutionException;

    const-string v2, "No files for comparing. The result or sample pdf file is not processed by GhostScript."

    invoke-direct {v0, v2}, Lcom/itextpdf/kernel/utils/CompareTool$CompareToolExecutionException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private compareLinkAnnotations(Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)Z
    .locals 13
    .param p1, "cmpLink"    # Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    .param p2, "outLink"    # Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    .param p3, "cmpDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p4, "outDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 1820
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getDestinationObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 1821
    .local v0, "cmpDestObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getDestinationObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 1823
    .local v1, "outDestObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    const/4 v2, 0x0

    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    .line 1824
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v3

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v4

    if-eq v3, v4, :cond_0

    .line 1825
    return v2

    .line 1827
    :cond_0
    const/4 v3, 0x0

    .line 1828
    .local v3, "explicitCmpDest":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v4, 0x0

    .line 1829
    .local v4, "explicitOutDest":Lcom/itextpdf/kernel/pdf/PdfArray;
    nop

    .line 1830
    invoke-virtual/range {p3 .. p3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v5

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Dests:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getNameTree(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNameTree;

    move-result-object v5

    .line 1831
    .local v5, "cmpNamedDestinations":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    nop

    .line 1832
    invoke-virtual/range {p4 .. p4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v6

    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->Dests:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getNameTree(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNameTree;

    move-result-object v6

    .line 1833
    .local v6, "outNamedDestinations":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v7

    sparse-switch v7, :sswitch_data_0

    goto :goto_0

    .line 1845
    :sswitch_0
    move-object v7, v0

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfString;

    .line 1846
    invoke-virtual {v5, v7}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->getEntry(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    move-object v3, v7

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 1847
    move-object v7, v1

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfString;

    .line 1848
    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->getEntry(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    move-object v4, v7

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 1849
    goto :goto_0

    .line 1839
    :sswitch_1
    move-object v7, v0

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v7

    .line 1840
    .local v7, "cmpDestName":Ljava/lang/String;
    invoke-virtual {v5, v7}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->getEntry(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    move-object v3, v8

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 1841
    move-object v8, v1

    check-cast v8, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v8

    .line 1842
    .local v8, "outDestName":Ljava/lang/String;
    invoke-virtual {v6, v8}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->getEntry(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v9

    move-object v4, v9

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 1843
    goto :goto_0

    .line 1835
    .end local v7    # "cmpDestName":Ljava/lang/String;
    .end local v8    # "outDestName":Ljava/lang/String;
    :sswitch_2
    move-object v3, v0

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 1836
    move-object v4, v1

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 1837
    nop

    .line 1854
    :goto_0
    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/utils/CompareTool;->getExplicitDestinationPageNum(Lcom/itextpdf/kernel/pdf/PdfArray;)I

    move-result v7

    invoke-direct {p0, v4}, Lcom/itextpdf/kernel/utils/CompareTool;->getExplicitDestinationPageNum(Lcom/itextpdf/kernel/pdf/PdfArray;)I

    move-result v8

    if-eq v7, v8, :cond_1

    .line 1855
    return v2

    .line 1860
    .end local v3    # "explicitCmpDest":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v4    # "explicitOutDest":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v5    # "cmpNamedDestinations":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    .end local v6    # "outNamedDestinations":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1861
    .local v3, "cmpDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1862
    .local v4, "outDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->size()I

    move-result v5

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->size()I

    move-result v6

    if-eq v5, v6, :cond_2

    .line 1863
    return v2

    .line 1865
    :cond_2
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Rect:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsRectangle(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    .line 1866
    .local v5, "cmpRect":Lcom/itextpdf/kernel/geom/Rectangle;
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Rect:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsRectangle(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    .line 1868
    .local v6, "outRect":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v7

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v8

    cmpl-float v7, v7, v8

    if-nez v7, :cond_8

    .line 1869
    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v7

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v8

    cmpl-float v7, v7, v8

    if-nez v7, :cond_8

    .line 1870
    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v7

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v8

    cmpl-float v7, v7, v8

    if-nez v7, :cond_8

    .line 1871
    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v7

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v8

    cmpl-float v7, v7, v8

    if-eqz v7, :cond_3

    goto :goto_3

    .line 1874
    :cond_3
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map$Entry;

    .line 1875
    .local v8, "cmpEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1876
    .local v9, "cmpObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v10

    if-nez v10, :cond_4

    .line 1877
    return v2

    .line 1878
    :cond_4
    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v10

    .line 1879
    .local v10, "outObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v11

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v12

    if-eq v11, v12, :cond_5

    .line 1880
    return v2

    .line 1882
    :cond_5
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v11

    packed-switch v11, :pswitch_data_0

    :pswitch_0
    goto :goto_2

    .line 1888
    :pswitch_1
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_6

    .line 1889
    return v2

    .line 1892
    .end local v8    # "cmpEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    .end local v9    # "cmpObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v10    # "outObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_6
    :goto_2
    goto :goto_1

    .line 1893
    :cond_7
    const/4 v2, 0x1

    return v2

    .line 1872
    :cond_8
    :goto_3
    return v2

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_2
        0x6 -> :sswitch_1
        0xa -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private compareNamesExtended(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z
    .locals 2
    .param p1, "outName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "cmpName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "currentPath"    # Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .param p4, "compareResult"    # Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;

    .line 1705
    invoke-virtual {p2, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1706
    const/4 v0, 0x1

    return v0

    .line 1708
    :cond_0
    if-eqz p4, :cond_1

    if-eqz p3, :cond_1

    .line 1709
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfName;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfName;->toString()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "PdfName. Expected: {0}. Found: {1}"

    invoke-static {v1, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, p3, v0}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1710
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private compareNumbersExtended(Lcom/itextpdf/kernel/pdf/PdfNumber;Lcom/itextpdf/kernel/pdf/PdfNumber;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z
    .locals 4
    .param p1, "outNumber"    # Lcom/itextpdf/kernel/pdf/PdfNumber;
    .param p2, "cmpNumber"    # Lcom/itextpdf/kernel/pdf/PdfNumber;
    .param p3, "currentPath"    # Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .param p4, "compareResult"    # Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;

    .line 1715
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->getValue()D

    move-result-wide v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->getValue()D

    move-result-wide v2

    cmpl-double v0, v0, v2

    if-nez v0, :cond_0

    .line 1716
    const/4 v0, 0x1

    return v0

    .line 1718
    :cond_0
    if-eqz p4, :cond_1

    if-eqz p3, :cond_1

    .line 1719
    const-string v0, "PdfNumber. Expected: {0}. Found: {1}"

    filled-new-array {p2, p1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, p3, v0}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1720
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private compareStreams(Ljava/io/InputStream;Ljava/io/InputStream;)Z
    .locals 6
    .param p1, "is1"    # Ljava/io/InputStream;
    .param p2, "is2"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1373
    const/high16 v0, 0x10000

    new-array v1, v0, [B

    .line 1374
    .local v1, "buffer1":[B
    new-array v0, v0, [B

    .line 1378
    .local v0, "buffer2":[B
    :cond_0
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 1379
    .local v2, "len1":I
    invoke-virtual {p2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .line 1380
    .local v3, "len2":I
    const/4 v4, 0x0

    if-eq v2, v3, :cond_1

    .line 1381
    return v4

    .line 1382
    :cond_1
    invoke-static {v1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v5

    if-nez v5, :cond_2

    .line 1383
    return v4

    .line 1384
    :cond_2
    const/4 v4, -0x1

    if-ne v2, v4, :cond_0

    .line 1385
    nop

    .line 1387
    const/4 v4, 0x1

    return v4
.end method

.method private compareStreamsExtended(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z
    .locals 6
    .param p1, "outStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p2, "cmpStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p3, "currentPath"    # Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .param p4, "compareResult"    # Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;

    .line 1616
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->FlateDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1617
    .local v0, "toDecode":Z
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes(Z)[B

    move-result-object v1

    .line 1618
    .local v1, "outStreamBytes":[B
    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes(Z)[B

    move-result-object v2

    .line 1619
    .local v2, "cmpStreamBytes":[B
    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1620
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/utils/CompareTool;->compareDictionariesExtended(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v3

    return v3

    .line 1622
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 1623
    .local v3, "errorMessage":Ljava/lang/StringBuilder;
    array-length v4, v2

    array-length v5, v1

    if-eq v4, v5, :cond_1

    .line 1624
    array-length v4, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    array-length v5, v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v4, v5}, [Ljava/lang/Object;

    move-result-object v4

    const-string v5, "PdfStream. Lengths are different. Expected: {0}. Found: {1}\n"

    invoke-static {v5, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1626
    :cond_1
    const-string v4, "PdfStream. Bytes are different.\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1628
    :goto_0
    invoke-direct {p0, v1, v2, v3}, Lcom/itextpdf/kernel/utils/CompareTool;->findBytesDifference([B[BLjava/lang/StringBuilder;)I

    move-result v4

    .line 1630
    .local v4, "firstDifferenceOffset":I
    if-eqz p4, :cond_2

    if-eqz p3, :cond_2

    .line 1631
    invoke-virtual {p3, v4}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->pushOffsetToPath(I)V

    .line 1632
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p4, p3, v5}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1633
    invoke-virtual {p3}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->pop()V

    .line 1635
    :cond_2
    const/4 v5, 0x0

    return v5
.end method

.method private compareStringsExtended(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z
    .locals 5
    .param p1, "outString"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .param p2, "cmpString"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .param p3, "currentPath"    # Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .param p4, "compareResult"    # Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;

    .line 1725
    invoke-direct {p0, p2}, Lcom/itextpdf/kernel/utils/CompareTool;->convertPdfStringToBytes(Lcom/itextpdf/kernel/pdf/PdfString;)[B

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/utils/CompareTool;->convertPdfStringToBytes(Lcom/itextpdf/kernel/pdf/PdfString;)[B

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1726
    const/4 v0, 0x1

    return v0

    .line 1728
    :cond_0
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v0

    .line 1729
    .local v0, "cmpStr":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v1

    .line 1730
    .local v1, "outStr":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1731
    .local v2, "errorMessage":Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-eq v3, v4, :cond_1

    .line 1732
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "PdfString. Lengths are different. Expected: {0}. Found: {1}\n"

    invoke-static {v4, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1734
    :cond_1
    const-string v3, "PdfString. Characters are different.\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1736
    :goto_0
    invoke-direct {p0, v1, v0, v2}, Lcom/itextpdf/kernel/utils/CompareTool;->findStringDifference(Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)I

    move-result v3

    .line 1738
    .local v3, "firstDifferenceOffset":I
    if-eqz p4, :cond_2

    if-eqz p3, :cond_2

    .line 1739
    invoke-virtual {p3, v3}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->pushOffsetToPath(I)V

    .line 1740
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p4, p3, v4}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1741
    invoke-virtual {p3}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->pop()V

    .line 1743
    :cond_2
    const/4 v4, 0x0

    return v4
.end method

.method private compareVisually(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 1
    .param p1, "outPath"    # Ljava/lang/String;
    .param p2, "differenceImagePrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1049
    .local p3, "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/itextpdf/kernel/utils/CompareTool;->compareVisually(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private compareVisually(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)Ljava/lang/String;
    .locals 4
    .param p1, "outPath"    # Ljava/lang/String;
    .param p2, "differenceImagePrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;>;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1053
    .local p3, "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    .local p4, "equalPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1054
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1056
    :cond_0
    if-nez p2, :cond_2

    .line 1057
    const-string v0, ""

    .line 1058
    .local v0, "fileBasedPrefix":Ljava/lang/String;
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPdfName:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 1060
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPdfName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1062
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "diff_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 1065
    .end local v0    # "fileBasedPrefix":Ljava/lang/String;
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/utils/CompareTool;->prepareOutputDirs(Ljava/lang/String;Ljava/lang/String;)V

    .line 1067
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Comparing visually.........."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1069
    if-eqz p3, :cond_3

    invoke-interface {p3}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 1070
    invoke-direct {p0, p1, p3}, Lcom/itextpdf/kernel/utils/CompareTool;->createIgnoredAreasPdfs(Ljava/lang/String;Ljava/util/Map;)V

    .line 1073
    :cond_3
    const/4 v0, 0x0

    .line 1075
    .local v0, "ghostscriptHelper":Lcom/itextpdf/io/util/GhostscriptHelper;
    :try_start_0
    new-instance v1, Lcom/itextpdf/io/util/GhostscriptHelper;

    iget-object v2, p0, Lcom/itextpdf/kernel/utils/CompareTool;->gsExec:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/itextpdf/io/util/GhostscriptHelper;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1078
    .end local v0    # "ghostscriptHelper":Lcom/itextpdf/io/util/GhostscriptHelper;
    .local v1, "ghostscriptHelper":Lcom/itextpdf/io/util/GhostscriptHelper;
    nop

    .line 1080
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPdf:Ljava/lang/String;

    iget-object v2, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outImage:Ljava/lang/String;

    invoke-virtual {v1, v0, p1, v2}, Lcom/itextpdf/io/util/GhostscriptHelper;->runGhostScriptImageGeneration(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1081
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdf:Ljava/lang/String;

    iget-object v2, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpImage:Ljava/lang/String;

    invoke-virtual {v1, v0, p1, v2}, Lcom/itextpdf/io/util/GhostscriptHelper;->runGhostScriptImageGeneration(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1082
    invoke-direct {p0, p1, p2, p4}, Lcom/itextpdf/kernel/utils/CompareTool;->compareImagesOfPdfs(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1076
    .end local v1    # "ghostscriptHelper":Lcom/itextpdf/io/util/GhostscriptHelper;
    .restart local v0    # "ghostscriptHelper":Lcom/itextpdf/io/util/GhostscriptHelper;
    :catch_0
    move-exception v1

    .line 1077
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Lcom/itextpdf/kernel/utils/CompareTool$CompareToolExecutionException;

    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/utils/CompareTool$CompareToolExecutionException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private compareVisuallyAndCombineReports(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .param p1, "compareByFailContentReason"    # Ljava/lang/String;
    .param p2, "outPath"    # Ljava/lang/String;
    .param p3, "differenceImagePrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;>;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1313
    .local p4, "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    .local p5, "equalPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Fail"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1314
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->flush()V

    .line 1315
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Compare by content report:\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1316
    .local v0, "compareByContentReport":Ljava/lang/String;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1317
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/io/PrintStream;->flush()V

    .line 1318
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/itextpdf/kernel/utils/CompareTool;->compareVisually(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)Ljava/lang/String;

    move-result-object v1

    .line 1319
    .local v1, "message":Ljava/lang/String;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 1321
    :cond_0
    return-object v1

    .line 1320
    :cond_1
    :goto_0
    const-string v2, "Compare by content fails. No visual differences"

    return-object v2
.end method

.method private convertPdfStringToBytes(Lcom/itextpdf/kernel/pdf/PdfString;)[B
    .locals 3
    .param p1, "pdfString"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 1788
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 1789
    .local v0, "value":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->getEncoding()Ljava/lang/String;

    move-result-object v1

    .line 1790
    .local v1, "encoding":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string v2, "UnicodeBig"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {v0}, Lcom/itextpdf/io/font/PdfEncodings;->isPdfDocEncoding(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1791
    const-string v2, "PDF"

    invoke-static {v0, v2}, Lcom/itextpdf/io/font/PdfEncodings;->convertToBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v2

    .local v2, "bytes":[B
    goto :goto_0

    .line 1793
    .end local v2    # "bytes":[B
    :cond_0
    invoke-static {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings;->convertToBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v2

    .line 1794
    .restart local v2    # "bytes":[B
    :goto_0
    return-object v2
.end method

.method private createIgnoredAreasPdfs(Ljava/lang/String;Ljava/util/Map;)V
    .locals 19
    .param p1, "outPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1169
    .local p2, "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    new-instance v0, Lcom/itextpdf/kernel/pdf/StampingProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/StampingProperties;-><init>()V

    move-object v3, v0

    .line 1170
    .local v3, "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    iget-object v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/pdf/StampingProperties;->setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;

    .line 1171
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfWriter;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ignored_areas_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, v1, Lcom/itextpdf/kernel/utils/CompareTool;->outPdfName:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/itextpdf/kernel/pdf/PdfWriter;-><init>(Ljava/lang/String;)V

    move-object v4, v0

    .line 1172
    .local v4, "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    :try_start_0
    iget-object v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->outPdf:Ljava/lang/String;

    invoke-static {v0}, Lcom/itextpdf/kernel/utils/CompareTool;->createOutputReader(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_f

    move-object v6, v0

    .line 1171
    .local v6, "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    nop

    .line 1173
    :try_start_1
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v0, v6, v4, v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/PdfWriter;Lcom/itextpdf/kernel/pdf/StampingProperties;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_c

    move-object v7, v0

    .line 1171
    .local v7, "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    nop

    .line 1174
    :try_start_2
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfWriter;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v1, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdfName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v0, v8}, Lcom/itextpdf/kernel/pdf/PdfWriter;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_9

    move-object v8, v0

    .line 1171
    .local v8, "cmpWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    nop

    .line 1175
    :try_start_3
    iget-object v0, v1, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdf:Ljava/lang/String;

    invoke-static {v0}, Lcom/itextpdf/kernel/utils/CompareTool;->createOutputReader(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_6

    move-object v9, v0

    .line 1171
    .local v9, "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    nop

    .line 1176
    :try_start_4
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v0, v9, v8, v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/PdfWriter;Lcom/itextpdf/kernel/pdf/StampingProperties;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    move-object v10, v0

    .line 1171
    .local v10, "pdfCmpDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    nop

    .line 1177
    :try_start_5
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/Map$Entry;

    .line 1178
    .local v11, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Integer;

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    .line 1179
    .local v12, "pageNumber":I
    invoke-interface {v11}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;

    .line 1181
    .local v13, "rectangles":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    if-eqz v13, :cond_1

    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_1

    .line 1182
    new-instance v14, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {v7, v12}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v15

    invoke-direct {v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;-><init>(Lcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 1183
    .local v14, "outCanvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    new-instance v15, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-object/from16 v16, v0

    invoke-virtual {v10, v12}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    invoke-direct {v15, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;-><init>(Lcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 1185
    .local v15, "cmpCanvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1186
    invoke-virtual {v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1187
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/itextpdf/kernel/geom/Rectangle;

    move-object/from16 v18, v17

    .line 1188
    .local v18, "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    move-object/from16 v17, v0

    move-object/from16 v0, v18

    .end local v18    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v0, "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v14, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rectangle(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1189
    invoke-virtual {v15, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rectangle(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1190
    move-object/from16 v0, v17

    .end local v0    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    goto :goto_1

    .line 1191
    :cond_0
    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1192
    invoke-virtual {v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2

    .line 1181
    .end local v14    # "outCanvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .end local v15    # "cmpCanvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    :cond_1
    move-object/from16 v16, v0

    .line 1194
    .end local v11    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    .end local v12    # "pageNumber":I
    .end local v13    # "rectangles":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :goto_2
    move-object/from16 v0, v16

    goto :goto_0

    .line 1195
    :cond_2
    :try_start_6
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .end local v10    # "pdfCmpDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v9, :cond_3

    :try_start_7
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_6

    .end local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    :cond_3
    :try_start_8
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfWriter;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_9

    .end local v8    # "cmpWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    :try_start_9
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_c

    .end local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v6, :cond_4

    :try_start_a
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_f

    .end local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    :cond_4
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfWriter;->close()V

    .line 1197
    .end local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, v1, Lcom/itextpdf/kernel/utils/CompareTool;->outPdfName:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdfName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v0, v4}, Lcom/itextpdf/kernel/utils/CompareTool;->init(Ljava/lang/String;Ljava/lang/String;)V

    .line 1198
    return-void

    .line 1171
    .restart local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v8    # "cmpWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v10    # "pdfCmpDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :catchall_0
    move-exception v0

    move-object v5, v0

    .end local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .end local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v8    # "cmpWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v10    # "pdfCmpDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :try_start_b
    throw v5
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 1195
    .restart local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .restart local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v8    # "cmpWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v10    # "pdfCmpDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_1
    move-exception v0

    move-object v11, v0

    :try_start_c
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    goto :goto_3

    :catchall_2
    move-exception v0

    :try_start_d
    invoke-virtual {v5, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .end local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v8    # "cmpWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :goto_3
    throw v11
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .line 1171
    .end local v10    # "pdfCmpDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .restart local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v8    # "cmpWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_3
    move-exception v0

    move-object v5, v0

    .end local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .end local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v8    # "cmpWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :try_start_e
    throw v5
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    .line 1195
    .restart local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .restart local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v8    # "cmpWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_4
    move-exception v0

    move-object v10, v0

    if-eqz v9, :cond_5

    :try_start_f
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    goto :goto_4

    :catchall_5
    move-exception v0

    :try_start_10
    invoke-virtual {v5, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .end local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v8    # "cmpWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :cond_5
    :goto_4
    throw v10
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    .line 1171
    .end local v9    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .restart local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v8    # "cmpWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_6
    move-exception v0

    move-object v5, v0

    .end local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .end local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v8    # "cmpWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :try_start_11
    throw v5
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_7

    .line 1195
    .restart local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .restart local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v8    # "cmpWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_7
    move-exception v0

    move-object v9, v0

    :try_start_12
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfWriter;->close()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_8

    goto :goto_5

    :catchall_8
    move-exception v0

    :try_start_13
    invoke-virtual {v5, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .end local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :goto_5
    throw v9
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_9

    .line 1171
    .end local v8    # "cmpWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .restart local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_9
    move-exception v0

    move-object v5, v0

    .end local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .end local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :try_start_14
    throw v5
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_a

    .line 1195
    .restart local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .restart local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_a
    move-exception v0

    move-object v8, v0

    :try_start_15
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_b

    goto :goto_6

    :catchall_b
    move-exception v0

    :try_start_16
    invoke-virtual {v5, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .end local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :goto_6
    throw v8
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_c

    .line 1171
    .end local v7    # "pdfOutDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .restart local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_c
    move-exception v0

    move-object v5, v0

    .end local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .end local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :try_start_17
    throw v5
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_d

    .line 1195
    .restart local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .restart local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_d
    move-exception v0

    move-object v7, v0

    if-eqz v6, :cond_6

    :try_start_18
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_e

    goto :goto_7

    :catchall_e
    move-exception v0

    :try_start_19
    invoke-virtual {v5, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .end local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :cond_6
    :goto_7
    throw v7
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_f

    .line 1171
    .end local v6    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .restart local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_f
    move-exception v0

    move-object v5, v0

    .end local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .end local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local p1    # "outPath":Ljava/lang/String;
    .end local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :try_start_1a
    throw v5
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_10

    .line 1195
    .restart local v3    # "properties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .restart local v4    # "outWriter":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local p1    # "outPath":Ljava/lang/String;
    .restart local p2    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    :catchall_10
    move-exception v0

    move-object v6, v0

    :try_start_1b
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfWriter;->close()V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_11

    goto :goto_8

    :catchall_11
    move-exception v0

    invoke-virtual {v5, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_8
    throw v6
.end method

.method public static createOutputReader(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfReader;
    .locals 1
    .param p0, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 193
    new-instance v0, Lcom/itextpdf/kernel/pdf/ReaderProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/ReaderProperties;-><init>()V

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/utils/CompareTool;->createOutputReader(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/ReaderProperties;)Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v0

    return-object v0
.end method

.method public static createOutputReader(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/ReaderProperties;)Lcom/itextpdf/kernel/pdf/PdfReader;
    .locals 4
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "properties"    # Lcom/itextpdf/kernel/pdf/ReaderProperties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 205
    invoke-static {p0}, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->get(Ljava/lang/String;)Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;

    move-result-object v0

    .line 206
    .local v0, "outWriter":Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;
    if-eqz v0, :cond_0

    .line 207
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfReader;

    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->getBAOutputStream()Ljava/io/ByteArrayOutputStream;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v1, v2, p1}, Lcom/itextpdf/kernel/pdf/PdfReader;-><init>(Ljava/io/InputStream;Lcom/itextpdf/kernel/pdf/ReaderProperties;)V

    return-object v1

    .line 209
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-direct {v1, p0, p1}, Lcom/itextpdf/kernel/pdf/PdfReader;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/ReaderProperties;)V

    return-object v1
.end method

.method public static createTestPdfWriter(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfWriter;
    .locals 1
    .param p0, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 168
    new-instance v0, Lcom/itextpdf/kernel/pdf/WriterProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/WriterProperties;-><init>()V

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/utils/CompareTool;->createTestPdfWriter(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/WriterProperties;)Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v0

    return-object v0
.end method

.method public static createTestPdfWriter(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/WriterProperties;)Lcom/itextpdf/kernel/pdf/PdfWriter;
    .locals 1
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "properties"    # Lcom/itextpdf/kernel/pdf/WriterProperties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 182
    new-instance v0, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;

    invoke-direct {v0, p0, p1}, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/WriterProperties;)V

    return-object v0
.end method

.method private findBytesDifference([B[BLjava/lang/StringBuilder;)I
    .locals 23
    .param p1, "outStreamBytes"    # [B
    .param p2, "cmpStreamBytes"    # [B
    .param p3, "errorMessage"    # Ljava/lang/StringBuilder;

    .line 1643
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    const/4 v2, 0x0

    .line 1644
    .local v2, "numberOfDifferentBytes":I
    const/4 v3, 0x0

    .line 1645
    .local v3, "firstDifferenceOffset":I
    array-length v4, v1

    array-length v5, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 1646
    .local v4, "minLength":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    const/4 v6, 0x1

    if-ge v5, v4, :cond_1

    .line 1647
    aget-byte v7, v1, v5

    aget-byte v8, v0, v5

    if-eq v7, v8, :cond_0

    .line 1648
    add-int/lit8 v2, v2, 0x1

    .line 1649
    if-ne v2, v6, :cond_0

    .line 1650
    move v3, v5

    .line 1646
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1654
    .end local v5    # "i":I
    :cond_1
    const/4 v5, 0x0

    .line 1655
    .local v5, "bytesDifference":Ljava/lang/String;
    if-lez v2, :cond_2

    .line 1656
    const/16 v7, 0xa

    .line 1657
    .local v7, "diffBytesAreaL":I
    const/16 v8, 0xa

    .line 1658
    .local v8, "diffBytesAreaR":I
    sub-int v9, v3, v7

    const/4 v10, 0x0

    invoke-static {v10, v9}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 1659
    .local v9, "lCmp":I
    array-length v11, v1

    add-int v12, v3, v8

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v11

    .line 1660
    .local v11, "rCmp":I
    sub-int v12, v3, v7

    invoke-static {v10, v12}, Ljava/lang/Math;->max(II)I

    move-result v12

    .line 1661
    .local v12, "lOut":I
    array-length v13, v0

    add-int v14, v3, v8

    invoke-static {v13, v14}, Ljava/lang/Math;->min(II)I

    move-result v13

    .line 1664
    .local v13, "rOut":I
    new-instance v14, Ljava/lang/String;

    aget-byte v15, v1, v3

    move/from16 v16, v10

    new-array v10, v6, [B

    aput-byte v15, v10, v16

    sget-object v15, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {v14, v10, v15}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    move-object/from16 v18, v14

    .line 1665
    .local v18, "cmpByte":Ljava/lang/String;
    new-instance v10, Ljava/lang/String;

    sub-int v14, v11, v9

    sget-object v15, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {v10, v1, v9, v14, v15}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    const-string v14, "\\r|\\n"

    const-string v15, " "

    invoke-virtual {v10, v14, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 1666
    .local v19, "cmpByteNeighbours":Ljava/lang/String;
    new-instance v10, Ljava/lang/String;

    aget-byte v17, v0, v3

    new-array v6, v6, [B

    aput-byte v17, v6, v16

    sget-object v1, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {v10, v6, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    move-object/from16 v20, v10

    .line 1667
    .local v20, "outByte":Ljava/lang/String;
    new-instance v1, Ljava/lang/String;

    sub-int v6, v13, v12

    sget-object v10, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {v1, v0, v12, v6, v10}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    invoke-virtual {v1, v14, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 1668
    .local v21, "outBytesNeighbours":Ljava/lang/String;
    nop

    .line 1669
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    filled-new-array/range {v17 .. v22}, [Ljava/lang/Object;

    move-result-object v1

    .line 1668
    const-string v6, "First bytes difference is encountered at index {0}. Expected: {1} ({2}). Found: {3} ({4}). Total number of different bytes: {5}"

    invoke-static {v6, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1670
    .end local v5    # "bytesDifference":Ljava/lang/String;
    .end local v7    # "diffBytesAreaL":I
    .end local v8    # "diffBytesAreaR":I
    .end local v9    # "lCmp":I
    .end local v11    # "rCmp":I
    .end local v12    # "lOut":I
    .end local v13    # "rOut":I
    .end local v18    # "cmpByte":Ljava/lang/String;
    .end local v19    # "cmpByteNeighbours":Ljava/lang/String;
    .end local v20    # "outByte":Ljava/lang/String;
    .end local v21    # "outBytesNeighbours":Ljava/lang/String;
    .local v1, "bytesDifference":Ljava/lang/String;
    goto :goto_1

    .line 1672
    .end local v1    # "bytesDifference":Ljava/lang/String;
    .restart local v5    # "bytesDifference":Ljava/lang/String;
    :cond_2
    move v3, v4

    .line 1673
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v6, "Bytes of the shorter array are the same as the first {0} bytes of the longer one."

    invoke-static {v6, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1676
    .end local v5    # "bytesDifference":Ljava/lang/String;
    .restart local v1    # "bytesDifference":Ljava/lang/String;
    :goto_1
    move-object/from16 v5, p3

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1677
    return v3
.end method

.method private findStringDifference(Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)I
    .locals 19
    .param p1, "outString"    # Ljava/lang/String;
    .param p2, "cmpString"    # Ljava/lang/String;
    .param p3, "errorMessage"    # Ljava/lang/StringBuilder;

    .line 1748
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    const/4 v2, 0x0

    .line 1749
    .local v2, "numberOfDifferentChars":I
    const/4 v3, 0x0

    .line 1750
    .local v3, "firstDifferenceOffset":I
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 1751
    .local v4, "minLength":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v4, :cond_1

    .line 1752
    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-eq v6, v7, :cond_0

    .line 1753
    add-int/lit8 v2, v2, 0x1

    .line 1754
    const/4 v6, 0x1

    if-ne v2, v6, :cond_0

    .line 1755
    move v3, v5

    .line 1751
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1759
    .end local v5    # "i":I
    :cond_1
    const/4 v5, 0x0

    .line 1760
    .local v5, "stringDifference":Ljava/lang/String;
    if-lez v2, :cond_2

    .line 1761
    const/16 v6, 0xf

    .line 1762
    .local v6, "diffBytesAreaL":I
    const/16 v7, 0xf

    .line 1763
    .local v7, "diffBytesAreaR":I
    sub-int v8, v3, v6

    const/4 v9, 0x0

    invoke-static {v9, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 1764
    .local v8, "lCmp":I
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    add-int v11, v3, v7

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v10

    .line 1765
    .local v10, "rCmp":I
    sub-int v11, v3, v6

    invoke-static {v9, v11}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 1766
    .local v9, "lOut":I
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v11

    add-int v12, v3, v7

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v11

    .line 1769
    .local v11, "rOut":I
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v14

    .line 1770
    .local v14, "cmpByte":Ljava/lang/String;
    invoke-virtual {v1, v8, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    const-string v13, "\\r|\\n"

    const-string v15, " "

    invoke-virtual {v12, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 1771
    .local v12, "cmpByteNeighbours":Ljava/lang/String;
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v16

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v16

    .line 1772
    .local v16, "outByte":Ljava/lang/String;
    invoke-virtual {v0, v9, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 1773
    .local v17, "outBytesNeighbours":Ljava/lang/String;
    nop

    .line 1774
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object v15, v12

    .end local v12    # "cmpByteNeighbours":Ljava/lang/String;
    .local v15, "cmpByteNeighbours":Ljava/lang/String;
    filled-new-array/range {v13 .. v18}, [Ljava/lang/Object;

    move-result-object v1

    .line 1773
    const-string v12, "First characters difference is encountered at index {0}.\nExpected: {1} ({2}).\nFound: {3} ({4}).\nTotal number of different characters: {5}"

    invoke-static {v12, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1775
    .end local v5    # "stringDifference":Ljava/lang/String;
    .end local v6    # "diffBytesAreaL":I
    .end local v7    # "diffBytesAreaR":I
    .end local v8    # "lCmp":I
    .end local v9    # "lOut":I
    .end local v10    # "rCmp":I
    .end local v11    # "rOut":I
    .end local v14    # "cmpByte":Ljava/lang/String;
    .end local v15    # "cmpByteNeighbours":Ljava/lang/String;
    .end local v16    # "outByte":Ljava/lang/String;
    .end local v17    # "outBytesNeighbours":Ljava/lang/String;
    .local v1, "stringDifference":Ljava/lang/String;
    goto :goto_1

    .line 1778
    .end local v1    # "stringDifference":Ljava/lang/String;
    .restart local v5    # "stringDifference":Ljava/lang/String;
    :cond_2
    move v3, v4

    .line 1779
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v6, "All characters of the shorter string are the same as the first {0} characters of the longer one."

    invoke-static {v6, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1782
    .end local v5    # "stringDifference":Ljava/lang/String;
    .restart local v1    # "stringDifference":Ljava/lang/String;
    :goto_1
    move-object/from16 v5, p3

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1783
    return v3
.end method

.method private flattenNumTree(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfNumber;Ljava/util/LinkedList;)Lcom/itextpdf/kernel/pdf/PdfNumber;
    .locals 5
    .param p1, "dictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "leftOver"    # Lcom/itextpdf/kernel/pdf/PdfNumber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Lcom/itextpdf/kernel/pdf/PdfNumber;",
            "Ljava/util/LinkedList<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;)",
            "Lcom/itextpdf/kernel/pdf/PdfNumber;"
        }
    .end annotation

    .line 1497
    .local p3, "items":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Nums:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 1498
    .local v0, "nums":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v0, :cond_3

    .line 1499
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 1501
    if-nez p2, :cond_0

    .line 1502
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "k":I
    .local v2, "k":I
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    move v4, v2

    move-object v2, v1

    move v1, v4

    .local v1, "number":Lcom/itextpdf/kernel/pdf/PdfNumber;
    goto :goto_1

    .line 1504
    .end local v2    # "k":I
    .local v1, "k":I
    :cond_0
    move-object v2, p2

    .line 1505
    .local v2, "number":Lcom/itextpdf/kernel/pdf/PdfNumber;
    const/4 p2, 0x0

    .line 1507
    :goto_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 1508
    invoke-virtual {p3, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1509
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(IZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1499
    .end local v2    # "number":Lcom/itextpdf/kernel/pdf/PdfNumber;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1511
    .restart local v2    # "number":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :cond_1
    return-object v2

    .line 1499
    .end local v1    # "k":I
    .end local v2    # "number":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :cond_2
    goto :goto_3

    .line 1514
    :cond_3
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    move-object v0, v1

    if-eqz v1, :cond_4

    .line 1515
    const/4 v1, 0x0

    .restart local v1    # "k":I
    :goto_2
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 1516
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 1517
    .local v2, "kid":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-direct {p0, v2, p2, p3}, Lcom/itextpdf/kernel/utils/CompareTool;->flattenNumTree(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfNumber;Ljava/util/LinkedList;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object p2

    .line 1515
    .end local v2    # "kid":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 1520
    .end local v1    # "k":I
    :cond_4
    :goto_3
    const/4 v1, 0x0

    return-object v1
.end method

.method private getExplicitDestinationPageNum(Lcom/itextpdf/kernel/pdf/PdfArray;)I
    .locals 4
    .param p1, "explicitDest"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 1897
    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(IZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 1899
    .local v0, "pageReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    .line 1900
    .local v1, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v3

    if-gt v2, v3, :cond_1

    .line 1901
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1902
    return v2

    .line 1900
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1904
    .end local v2    # "i":I
    :cond_1
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "PdfLinkAnnotation comparison: Page not found."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private getLinkAnnotations(ILcom/itextpdf/kernel/pdf/PdfDocument;)Ljava/util/List;
    .locals 6
    .param p1, "pageNum"    # I
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;",
            ">;"
        }
    .end annotation

    .line 1808
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1809
    .local v0, "linkAnnotations":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;>;"
    invoke-virtual {p2, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getAnnotations()Ljava/util/List;

    move-result-object v1

    .line 1810
    .local v1, "annotations":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 1811
    .local v3, "annotation":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Link:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1812
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1814
    .end local v3    # "annotation":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    :cond_0
    goto :goto_0

    .line 1815
    :cond_1
    return-object v0
.end method

.method private init(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "outPdf"    # Ljava/lang/String;
    .param p2, "cmpPdf"    # Ljava/lang/String;

    .line 1027
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPdf:Ljava/lang/String;

    .line 1028
    iput-object p2, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdf:Ljava/lang/String;

    .line 1029
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPdfName:Ljava/lang/String;

    .line 1030
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdfName:Ljava/lang/String;

    .line 1031
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPdfName:Ljava/lang/String;

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outImage:Ljava/lang/String;

    .line 1032
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdfName:Ljava/lang/String;

    const-string v1, "cmp_"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1033
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdfName:Ljava/lang/String;

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpImage:Ljava/lang/String;

    goto :goto_0

    .line 1035
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdfName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpImage:Ljava/lang/String;

    .line 1037
    :goto_0
    return-void
.end method

.method private listDiffPagesAsString(Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1157
    .local p1, "diffPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1158
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 1159
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1160
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_0

    .line 1161
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1158
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1164
    .end local v1    # "i":I
    :cond_1
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1165
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private loadPagesFromReader(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .param p1, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ">;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;)V"
        }
    .end annotation

    .line 1325
    .local p2, "pages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    .local p3, "pagesRef":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v0

    .line 1326
    .local v0, "numOfPages":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 1327
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1328
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1326
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1330
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method private prepareOutputDirs(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "outPath"    # Ljava/lang/String;
    .param p2, "differenceImagePrefix"    # Ljava/lang/String;

    .line 1205
    invoke-static {p1}, Lcom/itextpdf/commons/utils/FileUtil;->directoryExists(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1206
    invoke-static {p1}, Lcom/itextpdf/commons/utils/FileUtil;->createDirectories(Ljava/lang/String;)V

    goto :goto_3

    .line 1208
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/utils/CompareTool$PngFileFilter;

    iget-object v1, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdfName:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/utils/CompareTool$PngFileFilter;-><init>(Ljava/lang/String;)V

    invoke-static {p1, v0}, Lcom/itextpdf/commons/utils/FileUtil;->listFilesInDirectoryByFilter(Ljava/lang/String;Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v0

    .line 1209
    .local v0, "imageFiles":[Ljava/io/File;
    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 1210
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 1209
    .end local v4    # "file":Ljava/io/File;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1212
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/utils/CompareTool$CmpPngFileFilter;

    iget-object v3, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdfName:Ljava/lang/String;

    invoke-direct {v1, v3}, Lcom/itextpdf/kernel/utils/CompareTool$CmpPngFileFilter;-><init>(Ljava/lang/String;)V

    invoke-static {p1, v1}, Lcom/itextpdf/commons/utils/FileUtil;->listFilesInDirectoryByFilter(Ljava/lang/String;Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v1

    .line 1213
    .local v1, "cmpImageFiles":[Ljava/io/File;
    array-length v3, v1

    move v4, v2

    :goto_1
    if-ge v4, v3, :cond_2

    aget-object v5, v1, v4

    .line 1214
    .local v5, "file":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 1213
    .end local v5    # "file":Ljava/io/File;
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1217
    :cond_2
    new-instance v3, Lcom/itextpdf/kernel/utils/CompareTool$DiffPngFileFilter;

    invoke-direct {v3, p2}, Lcom/itextpdf/kernel/utils/CompareTool$DiffPngFileFilter;-><init>(Ljava/lang/String;)V

    invoke-static {p1, v3}, Lcom/itextpdf/commons/utils/FileUtil;->listFilesInDirectoryByFilter(Ljava/lang/String;Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v3

    .line 1218
    .local v3, "diffFiles":[Ljava/io/File;
    array-length v4, v3

    :goto_2
    if-ge v2, v4, :cond_3

    aget-object v5, v3, v2

    .line 1219
    .restart local v5    # "file":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 1218
    .end local v5    # "file":Ljava/io/File;
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1222
    .end local v0    # "imageFiles":[Ljava/io/File;
    .end local v1    # "cmpImageFiles":[Ljava/io/File;
    .end local v3    # "diffFiles":[Ljava/io/File;
    :cond_3
    :goto_3
    return-void
.end method

.method private printOutCmpDirectories()V
    .locals 4

    .line 1225
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Out file folder: file://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPdf:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1226
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Lcom/itextpdf/io/util/UrlUtil;->toNormalizedURI(Ljava/io/File;)Ljava/net/URI;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1225
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1227
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cmp file folder: file://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdf:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1228
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Lcom/itextpdf/io/util/UrlUtil;->toNormalizedURI(Ljava/io/File;)Ljava/net/URI;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1227
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1229
    return-void
.end method

.method private setPassword([B[B)V
    .locals 1
    .param p1, "outPass"    # [B
    .param p2, "cmpPass"    # [B

    .line 1040
    if-eqz p1, :cond_0

    .line 1041
    invoke-virtual {p0}, Lcom/itextpdf/kernel/utils/CompareTool;->getOutReaderProperties()Lcom/itextpdf/kernel/pdf/ReaderProperties;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/ReaderProperties;->setPassword([B)Lcom/itextpdf/kernel/pdf/ReaderProperties;

    .line 1043
    :cond_0
    if-eqz p2, :cond_1

    .line 1044
    invoke-virtual {p0}, Lcom/itextpdf/kernel/utils/CompareTool;->getCmpReaderProperties()Lcom/itextpdf/kernel/pdf/ReaderProperties;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/ReaderProperties;->setPassword([B)Lcom/itextpdf/kernel/pdf/ReaderProperties;

    .line 1046
    :cond_1
    return-void
.end method

.method private static writeOnDisk(Ljava/lang/String;)V
    .locals 1
    .param p0, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1298
    invoke-static {p0}, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->get(Ljava/lang/String;)Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;

    move-result-object v0

    .line 1299
    .local v0, "outWriter":Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;
    if-eqz v0, :cond_0

    .line 1300
    invoke-virtual {v0}, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->dump()V

    .line 1302
    :cond_0
    return-void
.end method

.method private static writeOnDiskIfNotExists(Ljava/lang/String;)V
    .locals 1
    .param p0, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1305
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1306
    invoke-static {p0}, Lcom/itextpdf/kernel/utils/CompareTool;->writeOnDisk(Ljava/lang/String;)V

    .line 1308
    :cond_0
    return-void
.end method


# virtual methods
.method public compareArrays(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfArray;)Z
    .locals 1
    .param p1, "outArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p2, "cmpArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 704
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Lcom/itextpdf/kernel/utils/CompareTool;->compareArraysExtended(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v0

    return v0
.end method

.method public compareBooleans(Lcom/itextpdf/kernel/pdf/PdfBoolean;Lcom/itextpdf/kernel/pdf/PdfBoolean;)Z
    .locals 2
    .param p1, "outBoolean"    # Lcom/itextpdf/kernel/pdf/PdfBoolean;
    .param p2, "cmpBoolean"    # Lcom/itextpdf/kernel/pdf/PdfBoolean;

    .line 748
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->getValue()Z

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->getValue()Z

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public compareByCatalog(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    .locals 9
    .param p1, "outDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "cmpDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 241
    const/4 v0, 0x0

    .line 242
    .local v0, "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    new-instance v1, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;

    iget v2, p0, Lcom/itextpdf/kernel/utils/CompareTool;->compareByContentErrorsLimit:I

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;-><init>(I)V

    move-object v7, v1

    .line 243
    .end local v0    # "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    .local v7, "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    new-instance v6, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    .line 244
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-direct {v6, v0, v1}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;-><init>(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    .line 245
    .local v6, "catalogPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    new-instance v8, Ljava/util/LinkedHashSet;

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v1, 0x0

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Metadata:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v8, v0}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 246
    .local v8, "ignoredCatalogEntries":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-object v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/itextpdf/kernel/utils/CompareTool;->compareDictionariesExtended(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;Ljava/util/Set;)Z

    .line 251
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPagesRef:Ljava/util/List;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPagesRef:Ljava/util/List;

    if-nez v0, :cond_0

    goto :goto_2

    .line 255
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPagesRef:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPagesRef:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eq v0, v1, :cond_1

    invoke-virtual {v7}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->isMessageLimitReached()Z

    move-result v0

    if-nez v0, :cond_1

    .line 256
    const-string v0, "Documents have different numbers of pages."

    invoke-virtual {v7, v6, v0}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 258
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPagesRef:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget-object v2, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPagesRef:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 259
    invoke-virtual {v7}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->isMessageLimitReached()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 260
    goto :goto_1

    .line 262
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    iget-object v2, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPagesRef:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget-object v3, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPagesRef:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;-><init>(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    .line 263
    .local v1, "currentPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    iget-object v2, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPagesRef:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 264
    .local v2, "outPageDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v3, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPagesRef:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 265
    .local v3, "cmpPageDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-direct {p0, v2, v3, v1, v7}, Lcom/itextpdf/kernel/utils/CompareTool;->compareDictionariesExtended(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    .line 258
    .end local v1    # "currentPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .end local v2    # "outPageDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v3    # "cmpPageDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 267
    .end local v0    # "i":I
    :cond_3
    :goto_1
    return-object v7

    .line 252
    :cond_4
    :goto_2
    return-object v7
.end method

.method public compareByContent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "outPdf"    # Ljava/lang/String;
    .param p2, "cmpPdf"    # Ljava/lang/String;
    .param p3, "outPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 462
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "outPath":Ljava/lang/String;
    .local v1, "outPdf":Ljava/lang/String;
    .local v2, "cmpPdf":Ljava/lang/String;
    .local v3, "outPath":Ljava/lang/String;
    invoke-virtual/range {v0 .. v7}, Lcom/itextpdf/kernel/utils/CompareTool;->compareByContent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;[B[B)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public compareByContent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "outPdf"    # Ljava/lang/String;
    .param p2, "cmpPdf"    # Ljava/lang/String;
    .param p3, "outPath"    # Ljava/lang/String;
    .param p4, "differenceImagePrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 489
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "outPath":Ljava/lang/String;
    .end local p4    # "differenceImagePrefix":Ljava/lang/String;
    .local v1, "outPdf":Ljava/lang/String;
    .local v2, "cmpPdf":Ljava/lang/String;
    .local v3, "outPath":Ljava/lang/String;
    .local v4, "differenceImagePrefix":Ljava/lang/String;
    invoke-virtual/range {v0 .. v7}, Lcom/itextpdf/kernel/utils/CompareTool;->compareByContent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;[B[B)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public compareByContent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 8
    .param p1, "outPdf"    # Ljava/lang/String;
    .param p2, "cmpPdf"    # Ljava/lang/String;
    .param p3, "outPath"    # Ljava/lang/String;
    .param p4, "differenceImagePrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 550
    .local p5, "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "outPath":Ljava/lang/String;
    .end local p4    # "differenceImagePrefix":Ljava/lang/String;
    .end local p5    # "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    .local v1, "outPdf":Ljava/lang/String;
    .local v2, "cmpPdf":Ljava/lang/String;
    .local v3, "outPath":Ljava/lang/String;
    .local v4, "differenceImagePrefix":Ljava/lang/String;
    .local v5, "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    invoke-virtual/range {v0 .. v7}, Lcom/itextpdf/kernel/utils/CompareTool;->compareByContent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;[B[B)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public compareByContent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;[B[B)Ljava/lang/String;
    .locals 3
    .param p1, "outPdf"    # Ljava/lang/String;
    .param p2, "cmpPdf"    # Ljava/lang/String;
    .param p3, "outPath"    # Ljava/lang/String;
    .param p4, "differenceImagePrefix"    # Ljava/lang/String;
    .param p6, "outPass"    # [B
    .param p7, "cmpPass"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;>;[B[B)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 583
    .local p5, "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/utils/CompareTool;->init(Ljava/lang/String;Ljava/lang/String;)V

    .line 584
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Out pdf: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/itextpdf/io/util/UrlUtil;->getNormalizedFileUriString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 585
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cmp pdf: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p2}, Lcom/itextpdf/io/util/UrlUtil;->getNormalizedFileUriString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 586
    invoke-direct {p0, p6, p7}, Lcom/itextpdf/kernel/utils/CompareTool;->setPassword([B[B)V

    .line 587
    invoke-direct {p0, p3, p4, p5}, Lcom/itextpdf/kernel/utils/CompareTool;->compareByContent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public compareByContent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B[B)Ljava/lang/String;
    .locals 8
    .param p1, "outPdf"    # Ljava/lang/String;
    .param p2, "cmpPdf"    # Ljava/lang/String;
    .param p3, "outPath"    # Ljava/lang/String;
    .param p4, "differenceImagePrefix"    # Ljava/lang/String;
    .param p5, "outPass"    # [B
    .param p6, "cmpPass"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 522
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, p5

    move-object v7, p6

    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "outPath":Ljava/lang/String;
    .end local p4    # "differenceImagePrefix":Ljava/lang/String;
    .end local p5    # "outPass":[B
    .end local p6    # "cmpPass":[B
    .local v1, "outPdf":Ljava/lang/String;
    .local v2, "cmpPdf":Ljava/lang/String;
    .local v3, "outPath":Ljava/lang/String;
    .local v4, "differenceImagePrefix":Ljava/lang/String;
    .local v6, "outPass":[B
    .local v7, "cmpPass":[B
    invoke-virtual/range {v0 .. v7}, Lcom/itextpdf/kernel/utils/CompareTool;->compareByContent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;[B[B)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public compareDictionaries(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z
    .locals 1
    .param p1, "outDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "cmpDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 599
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Lcom/itextpdf/kernel/utils/CompareTool;->compareDictionariesExtended(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v0

    return v0
.end method

.method public compareDictionariesStructure(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    .locals 1
    .param p1, "outDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "cmpDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 620
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/utils/CompareTool;->compareDictionariesStructure(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;)Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;

    move-result-object v0

    return-object v0
.end method

.method public compareDictionariesStructure(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;)Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    .locals 8
    .param p1, "outDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "cmpDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;)",
            "Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;"
        }
    .end annotation

    .line 643
    .local p3, "excludedKeys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 647
    new-instance v0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;

    iget v1, p0, Lcom/itextpdf/kernel/utils/CompareTool;->compareByContentErrorsLimit:I

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;-><init>(I)V

    move-object v6, v0

    .line 648
    .local v6, "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    new-instance v5, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-direct {v5, v0, v1}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;-><init>(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    .line 649
    .local v5, "currentPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v7, p3

    .end local p1    # "outDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local p2    # "cmpDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local p3    # "excludedKeys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    .local v3, "outDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v4, "cmpDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v7, "excludedKeys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    invoke-direct/range {v2 .. v7}, Lcom/itextpdf/kernel/utils/CompareTool;->compareDictionariesExtended(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;Ljava/util/Set;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 650
    invoke-virtual {v6}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->isOk()Z

    move-result p1

    if-nez p1, :cond_0

    .line 651
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->getReport()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 652
    return-object v6

    .line 650
    :cond_0
    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1}, Ljava/lang/AssertionError;-><init>()V

    throw p1

    .line 654
    :cond_1
    invoke-virtual {v6}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->isOk()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 655
    const/4 p1, 0x0

    return-object p1

    .line 654
    :cond_2
    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1}, Ljava/lang/AssertionError;-><init>()V

    throw p1

    .line 643
    .end local v3    # "outDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v4    # "cmpDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v5    # "currentPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .end local v6    # "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    .end local v7    # "excludedKeys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    .restart local p1    # "outDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local p2    # "cmpDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local p3    # "excludedKeys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    :cond_3
    move-object v3, p1

    move-object v4, p2

    move-object v7, p3

    .line 644
    .end local p1    # "outDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local p2    # "cmpDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local p3    # "excludedKeys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    .restart local v3    # "outDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v4    # "cmpDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v7    # "excludedKeys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The \'outDict\' and \'cmpDict\' objects shall have indirect references."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public compareDocumentInfo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "outPdf"    # Ljava/lang/String;
    .param p2, "cmpPdf"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 895
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/itextpdf/kernel/utils/CompareTool;->compareDocumentInfo(Ljava/lang/String;Ljava/lang/String;[B[B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public compareDocumentInfo(Ljava/lang/String;Ljava/lang/String;[B[B)Ljava/lang/String;
    .locals 11
    .param p1, "outPdf"    # Ljava/lang/String;
    .param p2, "cmpPdf"    # Ljava/lang/String;
    .param p3, "outPass"    # [B
    .param p4, "cmpPass"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 857
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "[itext] INFO  Comparing document info......."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 858
    const/4 v0, 0x0

    .line 859
    .local v0, "message":Ljava/lang/String;
    invoke-direct {p0, p3, p4}, Lcom/itextpdf/kernel/utils/CompareTool;->setPassword([B[B)V

    .line 860
    invoke-virtual {p0}, Lcom/itextpdf/kernel/utils/CompareTool;->getOutReaderProperties()Lcom/itextpdf/kernel/pdf/ReaderProperties;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/itextpdf/kernel/utils/CompareTool;->createOutputReader(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/ReaderProperties;)Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v1

    .line 861
    .local v1, "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    :try_start_0
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDocument;

    new-instance v3, Lcom/itextpdf/kernel/pdf/DocumentProperties;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/DocumentProperties;-><init>()V

    iget-object v4, p0, Lcom/itextpdf/kernel/utils/CompareTool;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 862
    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/DocumentProperties;->setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/DocumentProperties;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_9

    .line 860
    .local v2, "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    nop

    .line 863
    :try_start_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/utils/CompareTool;->getCmpReaderProperties()Lcom/itextpdf/kernel/pdf/ReaderProperties;

    move-result-object v3

    invoke-static {p2, v3}, Lcom/itextpdf/kernel/utils/CompareTool;->createOutputReader(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/ReaderProperties;)Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_6

    .line 860
    .local v3, "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    nop

    .line 864
    :try_start_2
    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfDocument;

    new-instance v5, Lcom/itextpdf/kernel/pdf/DocumentProperties;

    invoke-direct {v5}, Lcom/itextpdf/kernel/pdf/DocumentProperties;-><init>()V

    iget-object v6, p0, Lcom/itextpdf/kernel/utils/CompareTool;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 865
    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/DocumentProperties;->setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;

    move-result-object v5

    invoke-direct {v4, v3, v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/DocumentProperties;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 860
    .local v4, "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    nop

    .line 866
    :try_start_3
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentInfo()Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/itextpdf/kernel/utils/CompareTool;->convertDocInfoToStrings(Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;)[Ljava/lang/String;

    move-result-object v5

    .line 867
    .local v5, "cmpInfo":[Ljava/lang/String;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentInfo()Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/itextpdf/kernel/utils/CompareTool;->convertDocInfoToStrings(Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;)[Ljava/lang/String;

    move-result-object v6

    .line 868
    .local v6, "outInfo":[Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    array-length v8, v5

    if-ge v7, v8, :cond_1

    .line 869
    aget-object v8, v5, v7

    aget-object v9, v6, v7

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 870
    const-string v8, "Document info fail. Expected: \"{0}\", actual: \"{1}\""

    aget-object v9, v5, v7

    aget-object v10, v6, v7

    filled-new-array {v9, v10}, [Ljava/lang/Object;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 871
    .end local v0    # "message":Ljava/lang/String;
    .local v8, "message":Ljava/lang/String;
    move-object v0, v8

    goto :goto_1

    .line 868
    .end local v8    # "message":Ljava/lang/String;
    .restart local v0    # "message":Ljava/lang/String;
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 874
    .end local v5    # "cmpInfo":[Ljava/lang/String;
    .end local v6    # "outInfo":[Ljava/lang/String;
    .end local v7    # "i":I
    :cond_1
    :goto_1
    :try_start_4
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .end local v4    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v3, :cond_2

    :try_start_5
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_6

    .end local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    :cond_2
    :try_start_6
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_9

    .end local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V

    .line 875
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    :cond_3
    if-nez v0, :cond_4

    .line 876
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "OK"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2

    .line 878
    :cond_4
    invoke-static {p1}, Lcom/itextpdf/kernel/utils/CompareTool;->writeOnDisk(Ljava/lang/String;)V

    .line 879
    invoke-static {p2}, Lcom/itextpdf/kernel/utils/CompareTool;->writeOnDiskIfNotExists(Ljava/lang/String;)V

    .line 880
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Fail"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 882
    :goto_2
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/io/PrintStream;->flush()V

    .line 883
    return-object v0

    .line 860
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v4    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :catchall_0
    move-exception v5

    .end local v0    # "message":Ljava/lang/String;
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v4    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "outPass":[B
    .end local p4    # "cmpPass":[B
    :try_start_7
    throw v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 874
    .restart local v0    # "message":Ljava/lang/String;
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v4    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    .restart local p3    # "outPass":[B
    .restart local p4    # "cmpPass":[B
    :catchall_1
    move-exception v6

    :try_start_8
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    goto :goto_3

    :catchall_2
    move-exception v7

    :try_start_9
    invoke-virtual {v5, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "message":Ljava/lang/String;
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "outPass":[B
    .end local p4    # "cmpPass":[B
    :goto_3
    throw v6
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 860
    .end local v4    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v0    # "message":Ljava/lang/String;
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    .restart local p3    # "outPass":[B
    .restart local p4    # "cmpPass":[B
    :catchall_3
    move-exception v4

    .end local v0    # "message":Ljava/lang/String;
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "outPass":[B
    .end local p4    # "cmpPass":[B
    :try_start_a
    throw v4
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 874
    .restart local v0    # "message":Ljava/lang/String;
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    .restart local p3    # "outPass":[B
    .restart local p4    # "cmpPass":[B
    :catchall_4
    move-exception v5

    if-eqz v3, :cond_5

    :try_start_b
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    goto :goto_4

    :catchall_5
    move-exception v6

    :try_start_c
    invoke-virtual {v4, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "message":Ljava/lang/String;
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "outPass":[B
    .end local p4    # "cmpPass":[B
    :cond_5
    :goto_4
    throw v5
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    .line 860
    .end local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v0    # "message":Ljava/lang/String;
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    .restart local p3    # "outPass":[B
    .restart local p4    # "cmpPass":[B
    :catchall_6
    move-exception v3

    .end local v0    # "message":Ljava/lang/String;
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "outPass":[B
    .end local p4    # "cmpPass":[B
    :try_start_d
    throw v3
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    .line 874
    .restart local v0    # "message":Ljava/lang/String;
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    .restart local p3    # "outPass":[B
    .restart local p4    # "cmpPass":[B
    :catchall_7
    move-exception v4

    :try_start_e
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_8

    goto :goto_5

    :catchall_8
    move-exception v5

    :try_start_f
    invoke-virtual {v3, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "message":Ljava/lang/String;
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "outPass":[B
    .end local p4    # "cmpPass":[B
    :goto_5
    throw v4
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_9

    .line 860
    .end local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v0    # "message":Ljava/lang/String;
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    .restart local p3    # "outPass":[B
    .restart local p4    # "cmpPass":[B
    :catchall_9
    move-exception v2

    .end local v0    # "message":Ljava/lang/String;
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "outPass":[B
    .end local p4    # "cmpPass":[B
    :try_start_10
    throw v2
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_a

    .line 874
    .restart local v0    # "message":Ljava/lang/String;
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    .restart local p3    # "outPass":[B
    .restart local p4    # "cmpPass":[B
    :catchall_a
    move-exception v3

    if-eqz v1, :cond_6

    :try_start_11
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_b

    goto :goto_6

    :catchall_b
    move-exception v4

    invoke-virtual {v2, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_6
    :goto_6
    throw v3
.end method

.method public compareLinkAnnotations(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p1, "outPdf"    # Ljava/lang/String;
    .param p2, "cmpPdf"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 907
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "[itext] INFO  Comparing link annotations...."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 908
    const/4 v0, 0x0

    .line 909
    .local v0, "message":Ljava/lang/String;
    invoke-static {p1}, Lcom/itextpdf/kernel/utils/CompareTool;->createOutputReader(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v1

    .line 910
    .local v1, "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    :try_start_0
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDocument;

    new-instance v3, Lcom/itextpdf/kernel/pdf/DocumentProperties;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/DocumentProperties;-><init>()V

    iget-object v4, p0, Lcom/itextpdf/kernel/utils/CompareTool;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 911
    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/DocumentProperties;->setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/DocumentProperties;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_9

    .line 909
    .local v2, "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    nop

    .line 912
    :try_start_1
    invoke-static {p2}, Lcom/itextpdf/kernel/utils/CompareTool;->createOutputReader(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_6

    .line 909
    .local v3, "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    nop

    .line 913
    :try_start_2
    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfDocument;

    new-instance v5, Lcom/itextpdf/kernel/pdf/DocumentProperties;

    invoke-direct {v5}, Lcom/itextpdf/kernel/pdf/DocumentProperties;-><init>()V

    iget-object v6, p0, Lcom/itextpdf/kernel/utils/CompareTool;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 914
    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/DocumentProperties;->setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;

    move-result-object v5

    invoke-direct {v4, v3, v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/DocumentProperties;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 909
    .local v4, "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    nop

    .line 915
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    :try_start_3
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v6

    if-ge v5, v6, :cond_3

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 916
    add-int/lit8 v6, v5, 0x1

    invoke-direct {p0, v6, v2}, Lcom/itextpdf/kernel/utils/CompareTool;->getLinkAnnotations(ILcom/itextpdf/kernel/pdf/PdfDocument;)Ljava/util/List;

    move-result-object v6

    .line 917
    .local v6, "outLinks":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;>;"
    add-int/lit8 v7, v5, 0x1

    invoke-direct {p0, v7, v4}, Lcom/itextpdf/kernel/utils/CompareTool;->getLinkAnnotations(ILcom/itextpdf/kernel/pdf/PdfDocument;)Ljava/util/List;

    move-result-object v7

    .line 919
    .local v7, "cmpLinks":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;>;"
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    if-eq v8, v9, :cond_0

    .line 920
    const-string v8, "Different number of links on page {0}."

    add-int/lit8 v9, v5, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 921
    .end local v0    # "message":Ljava/lang/String;
    .local v8, "message":Ljava/lang/String;
    move-object v0, v8

    goto :goto_3

    .line 923
    .end local v8    # "message":Ljava/lang/String;
    .restart local v0    # "message":Ljava/lang/String;
    :cond_0
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_1
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v9

    if-ge v8, v9, :cond_2

    .line 924
    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    invoke-interface {v6, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    invoke-direct {p0, v9, v10, v4, v2}, Lcom/itextpdf/kernel/utils/CompareTool;->compareLinkAnnotations(Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 925
    const-string v9, "Different links on page {0}.\n{1}\n{2}"

    add-int/lit8 v10, v5, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v6, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    filled-new-array {v10, v11, v12}, [Ljava/lang/Object;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v0, v9

    .line 926
    goto :goto_2

    .line 923
    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 915
    .end local v6    # "outLinks":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;>;"
    .end local v7    # "cmpLinks":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;>;"
    .end local v8    # "j":I
    :cond_2
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 930
    .end local v5    # "i":I
    :cond_3
    :goto_3
    :try_start_4
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .end local v4    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v3, :cond_4

    :try_start_5
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_6

    .end local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    :cond_4
    :try_start_6
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_9

    .end local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v1, :cond_5

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V

    .line 931
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    :cond_5
    if-nez v0, :cond_6

    .line 932
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "OK"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_4

    .line 934
    :cond_6
    invoke-static {p1}, Lcom/itextpdf/kernel/utils/CompareTool;->writeOnDisk(Ljava/lang/String;)V

    .line 935
    invoke-static {p2}, Lcom/itextpdf/kernel/utils/CompareTool;->writeOnDiskIfNotExists(Ljava/lang/String;)V

    .line 936
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Fail"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 938
    :goto_4
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/io/PrintStream;->flush()V

    .line 939
    return-object v0

    .line 909
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v4    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :catchall_0
    move-exception v5

    .end local v0    # "message":Ljava/lang/String;
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v4    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :try_start_7
    throw v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 930
    .restart local v0    # "message":Ljava/lang/String;
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v4    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_1
    move-exception v6

    :try_start_8
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    goto :goto_5

    :catchall_2
    move-exception v7

    :try_start_9
    invoke-virtual {v5, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "message":Ljava/lang/String;
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :goto_5
    throw v6
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 909
    .end local v4    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v0    # "message":Ljava/lang/String;
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_3
    move-exception v4

    .end local v0    # "message":Ljava/lang/String;
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :try_start_a
    throw v4
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 930
    .restart local v0    # "message":Ljava/lang/String;
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_4
    move-exception v5

    if-eqz v3, :cond_7

    :try_start_b
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    goto :goto_6

    :catchall_5
    move-exception v6

    :try_start_c
    invoke-virtual {v4, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "message":Ljava/lang/String;
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :cond_7
    :goto_6
    throw v5
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    .line 909
    .end local v3    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v0    # "message":Ljava/lang/String;
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_6
    move-exception v3

    .end local v0    # "message":Ljava/lang/String;
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :try_start_d
    throw v3
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    .line 930
    .restart local v0    # "message":Ljava/lang/String;
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_7
    move-exception v4

    :try_start_e
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_8

    goto :goto_7

    :catchall_8
    move-exception v5

    :try_start_f
    invoke-virtual {v3, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "message":Ljava/lang/String;
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :goto_7
    throw v4
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_9

    .line 909
    .end local v2    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v0    # "message":Ljava/lang/String;
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_9
    move-exception v2

    .end local v0    # "message":Ljava/lang/String;
    .end local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :try_start_10
    throw v2
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_a

    .line 930
    .restart local v0    # "message":Ljava/lang/String;
    .restart local v1    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_a
    move-exception v3

    if-eqz v1, :cond_8

    :try_start_11
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_b

    goto :goto_8

    :catchall_b
    move-exception v4

    invoke-virtual {v2, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_8
    :goto_8
    throw v3
.end method

.method public compareNames(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)Z
    .locals 1
    .param p1, "outName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "cmpName"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 715
    invoke-virtual {p2, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public compareNumbers(Lcom/itextpdf/kernel/pdf/PdfNumber;Lcom/itextpdf/kernel/pdf/PdfNumber;)Z
    .locals 4
    .param p1, "outNumber"    # Lcom/itextpdf/kernel/pdf/PdfNumber;
    .param p2, "cmpNumber"    # Lcom/itextpdf/kernel/pdf/PdfNumber;

    .line 726
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->getValue()D

    move-result-wide v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->getValue()D

    move-result-wide v2

    cmpl-double v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected compareObjects(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z
    .locals 9
    .param p1, "outObj"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "cmpObj"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p3, "currentPath"    # Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .param p4, "compareResult"    # Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;

    .line 1524
    const/4 v0, 0x0

    .line 1525
    .local v0, "outDirectObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    const/4 v1, 0x0

    .line 1526
    .local v1, "cmpDirectObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    const/4 v2, 0x0

    if-eqz p1, :cond_1

    .line 1527
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v3

    if-eqz v3, :cond_0

    move-object v3, p1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    goto :goto_0

    :cond_0
    move-object v3, p1

    :goto_0
    move-object v0, v3

    .line 1528
    :cond_1
    if-eqz p2, :cond_3

    .line 1529
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v3

    if-eqz v3, :cond_2

    move-object v3, p2

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    goto :goto_1

    :cond_2
    move-object v3, p2

    :goto_1
    move-object v1, v3

    .line 1531
    :cond_3
    const/4 v3, 0x1

    if-nez v1, :cond_4

    if-nez v0, :cond_4

    .line 1532
    return v3

    .line 1534
    :cond_4
    if-nez v0, :cond_5

    .line 1535
    const-string v3, "Expected object was not found."

    invoke-virtual {p4, p3, v3}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1536
    return v2

    .line 1537
    :cond_5
    if-nez v1, :cond_6

    .line 1538
    const-string v3, "Found object which was not expected to be found."

    invoke-virtual {p4, p3, v3}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1539
    return v2

    .line 1540
    :cond_6
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v4

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v5

    if-eq v4, v5, :cond_7

    .line 1541
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Types do not match. Expected: {0}. Found: {1}."

    invoke-static {v4, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p4, p3, v3}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1542
    return v2

    .line 1543
    :cond_7
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v4

    if-nez v4, :cond_8

    .line 1544
    const-string v3, "Expected indirect object."

    invoke-virtual {p4, p3, v3}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1545
    return v2

    .line 1546
    :cond_8
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v4

    if-nez v4, :cond_9

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 1547
    const-string v3, "Expected direct object."

    invoke-virtual {p4, p3, v3}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1548
    return v2

    .line 1551
    :cond_9
    if-eqz p3, :cond_b

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v4

    if-eqz v4, :cond_b

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 1552
    move-object v4, p2

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-object v5, p1

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {p3, v4, v5}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->isComparing(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 1553
    return v3

    .line 1554
    :cond_a
    move-object v4, p2

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-object v5, p1

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {p3, v4, v5}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->resetDirectPath(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    move-result-object p3

    .line 1557
    :cond_b
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v4

    if-eqz v4, :cond_16

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Page:Lcom/itextpdf/kernel/pdf/PdfName;

    move-object v5, v1

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_16

    iget-boolean v4, p0, Lcom/itextpdf/kernel/utils/CompareTool;->useCachedPagesForComparison:Z

    if-eqz v4, :cond_16

    .line 1559
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v4

    if-eqz v4, :cond_14

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Page:Lcom/itextpdf/kernel/pdf/PdfName;

    move-object v5, v0

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_c

    goto/16 :goto_6

    .line 1564
    :cond_c
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v4

    if-eqz v4, :cond_d

    move-object v4, p2

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    goto :goto_2

    :cond_d
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v4

    .line 1565
    .local v4, "cmpRefKey":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :goto_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v5

    if-eqz v5, :cond_e

    move-object v5, p1

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    goto :goto_3

    :cond_e
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v5

    .line 1567
    .local v5, "outRefKey":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :goto_3
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPagesRef:Ljava/util/List;

    if-nez v6, :cond_f

    .line 1568
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPagesRef:Ljava/util/List;

    .line 1569
    const/4 v6, 0x1

    .local v6, "i":I
    :goto_4
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v7

    if-gt v6, v7, :cond_f

    .line 1570
    iget-object v7, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPagesRef:Ljava/util/List;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v8

    invoke-virtual {v8, v6}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1569
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 1573
    .end local v6    # "i":I
    :cond_f
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPagesRef:Ljava/util/List;

    if-nez v6, :cond_10

    .line 1574
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPagesRef:Ljava/util/List;

    .line 1575
    const/4 v6, 0x1

    .restart local v6    # "i":I
    :goto_5
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v7

    if-gt v6, v7, :cond_10

    .line 1576
    iget-object v7, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPagesRef:Ljava/util/List;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v8

    invoke-virtual {v8, v6}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1575
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 1583
    .end local v6    # "i":I
    :cond_10
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPagesRef:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_11

    iget-object v6, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPagesRef:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_16

    .line 1584
    :cond_11
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPagesRef:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    iget-object v6, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPagesRef:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v6

    iget-object v7, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPagesRef:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v7

    if-ne v6, v7, :cond_12

    .line 1585
    return v3

    .line 1587
    :cond_12
    if-eqz p4, :cond_13

    if-eqz p3, :cond_13

    .line 1588
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPagesRef:Ljava/util/List;

    .line 1589
    invoke-interface {v6, v4}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v6

    add-int/2addr v6, v3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v7, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outPagesRef:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v7

    add-int/2addr v7, v3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v6, v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 1588
    const-string v6, "The dictionaries refer to different pages. Expected page number: {0}. Found: {1}"

    invoke-static {v6, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p4, p3, v3}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1590
    :cond_13
    return v2

    .line 1560
    .end local v4    # "cmpRefKey":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v5    # "outRefKey":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_14
    :goto_6
    if-eqz p4, :cond_15

    if-eqz p3, :cond_15

    .line 1561
    const-string v3, "Expected a page. Found not a page."

    invoke-virtual {p4, p3, v3}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V

    .line 1562
    :cond_15
    return v2

    .line 1594
    :cond_16
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v2

    if-eqz v2, :cond_17

    .line 1595
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-object v3, v1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {p0, v2, v3, p3, p4}, Lcom/itextpdf/kernel/utils/CompareTool;->compareDictionariesExtended(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v2

    return v2

    .line 1596
    :cond_17
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isStream()Z

    move-result v2

    if-eqz v2, :cond_18

    .line 1597
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfStream;

    move-object v3, v1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {p0, v2, v3, p3, p4}, Lcom/itextpdf/kernel/utils/CompareTool;->compareStreamsExtended(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v2

    return v2

    .line 1598
    :cond_18
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 1599
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    move-object v3, v1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {p0, v2, v3, p3, p4}, Lcom/itextpdf/kernel/utils/CompareTool;->compareArraysExtended(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v2

    return v2

    .line 1600
    :cond_19
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isName()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 1601
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfName;

    move-object v3, v1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v2, v3, p3, p4}, Lcom/itextpdf/kernel/utils/CompareTool;->compareNamesExtended(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v2

    return v2

    .line 1602
    :cond_1a
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isNumber()Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 1603
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-object v3, v1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {p0, v2, v3, p3, p4}, Lcom/itextpdf/kernel/utils/CompareTool;->compareNumbersExtended(Lcom/itextpdf/kernel/pdf/PdfNumber;Lcom/itextpdf/kernel/pdf/PdfNumber;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v2

    return v2

    .line 1604
    :cond_1b
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isString()Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 1605
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfString;

    move-object v3, v1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {p0, v2, v3, p3, p4}, Lcom/itextpdf/kernel/utils/CompareTool;->compareStringsExtended(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v2

    return v2

    .line 1606
    :cond_1c
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isBoolean()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 1607
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-object v3, v1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfBoolean;

    invoke-direct {p0, v2, v3, p3, p4}, Lcom/itextpdf/kernel/utils/CompareTool;->compareBooleansExtended(Lcom/itextpdf/kernel/pdf/PdfBoolean;Lcom/itextpdf/kernel/pdf/PdfBoolean;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v2

    return v2

    .line 1608
    :cond_1d
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isNull()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isNull()Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 1609
    return v3

    .line 1611
    :cond_1e
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v2}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v2
.end method

.method public compareStreams(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfStream;)Z
    .locals 1
    .param p1, "outStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p2, "cmpStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 692
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Lcom/itextpdf/kernel/utils/CompareTool;->compareStreamsExtended(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v0

    return v0
.end method

.method public compareStreamsStructure(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfStream;)Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    .locals 4
    .param p1, "outStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p2, "cmpStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 671
    new-instance v0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;

    iget v1, p0, Lcom/itextpdf/kernel/utils/CompareTool;->compareByContentErrorsLimit:I

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;-><init>(I)V

    .line 672
    .local v0, "compareResult":Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
    new-instance v1, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    .line 673
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;-><init>(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    .line 674
    .local v1, "currentPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    invoke-direct {p0, p1, p2, v1, v0}, Lcom/itextpdf/kernel/utils/CompareTool;->compareStreamsExtended(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 675
    invoke-virtual {v0}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->isOk()Z

    move-result v2

    if-nez v2, :cond_0

    .line 676
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->getReport()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 677
    return-object v0

    .line 675
    :cond_0
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 679
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->isOk()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 680
    const/4 v2, 0x0

    return-object v2

    .line 679
    :cond_2
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
.end method

.method public compareStrings(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfString;)Z
    .locals 2
    .param p1, "outString"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .param p2, "cmpString"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 737
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public compareTagStructures(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "outPdf"    # Ljava/lang/String;
    .param p2, "cmpPdf"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 958
    const-string/jumbo v0, "root"

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "[itext] INFO  Comparing tag structures......"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 960
    const-string v1, ".xml"

    const-string v2, ".pdf"

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 961
    .local v1, "outXmlPath":Ljava/lang/String;
    const-string v3, ".cmp.xml"

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 963
    .local v2, "cmpXmlPath":Ljava/lang/String;
    const/4 v3, 0x0

    .line 964
    .local v3, "message":Ljava/lang/String;
    invoke-static {p1}, Lcom/itextpdf/kernel/utils/CompareTool;->createOutputReader(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v4

    .line 965
    .local v4, "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    :try_start_0
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfDocument;

    new-instance v6, Lcom/itextpdf/kernel/pdf/DocumentProperties;

    invoke-direct {v6}, Lcom/itextpdf/kernel/pdf/DocumentProperties;-><init>()V

    iget-object v7, p0, Lcom/itextpdf/kernel/utils/CompareTool;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 966
    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/DocumentProperties;->setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;

    move-result-object v6

    invoke-direct {v5, v4, v6}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/DocumentProperties;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_f

    .line 964
    .local v5, "docOut":Lcom/itextpdf/kernel/pdf/PdfDocument;
    nop

    .line 967
    :try_start_1
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_c

    .line 964
    .local v6, "xmlOut":Ljava/io/FileOutputStream;
    nop

    .line 968
    :try_start_2
    new-instance v7, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;

    invoke-direct {v7, v5}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    invoke-virtual {v7, v0}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->setRootTag(Ljava/lang/String;)Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->convertToXml(Ljava/io/OutputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_9

    .line 969
    :try_start_3
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_c

    .end local v6    # "xmlOut":Ljava/io/FileOutputStream;
    :try_start_4
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_f

    .end local v5    # "docOut":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V

    .line 970
    .end local v4    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    :cond_0
    invoke-static {p2}, Lcom/itextpdf/kernel/utils/CompareTool;->createOutputReader(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v4

    .line 971
    .local v4, "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    :try_start_5
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfDocument;

    new-instance v6, Lcom/itextpdf/kernel/pdf/DocumentProperties;

    invoke-direct {v6}, Lcom/itextpdf/kernel/pdf/DocumentProperties;-><init>()V

    iget-object v7, p0, Lcom/itextpdf/kernel/utils/CompareTool;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 972
    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/DocumentProperties;->setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;

    move-result-object v6

    invoke-direct {v5, v4, v6}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/DocumentProperties;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_6

    .line 970
    .local v5, "docCmp":Lcom/itextpdf/kernel/pdf/PdfDocument;
    nop

    .line 973
    :try_start_6
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 970
    .local v6, "xmlCmp":Ljava/io/FileOutputStream;
    nop

    .line 974
    :try_start_7
    new-instance v7, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;

    invoke-direct {v7, v5}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    invoke-virtual {v7, v0}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->setRootTag(Ljava/lang/String;)Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->convertToXml(Ljava/io/OutputStream;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 975
    :try_start_8
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .end local v6    # "xmlCmp":Ljava/io/FileOutputStream;
    :try_start_9
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_6

    .end local v5    # "docCmp":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V

    .line 977
    .end local v4    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    :cond_1
    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/kernel/utils/CompareTool;->compareXmls(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 978
    const-string v3, "The tag structures are different."

    .line 980
    :cond_2
    if-nez v3, :cond_3

    .line 981
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "OK"

    invoke-virtual {v0, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 983
    :cond_3
    invoke-static {p1}, Lcom/itextpdf/kernel/utils/CompareTool;->writeOnDisk(Ljava/lang/String;)V

    .line 984
    invoke-static {p2}, Lcom/itextpdf/kernel/utils/CompareTool;->writeOnDiskIfNotExists(Ljava/lang/String;)V

    .line 985
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "Fail"

    invoke-virtual {v0, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 987
    :goto_0
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->flush()V

    .line 988
    return-object v3

    .line 970
    .restart local v4    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v5    # "docCmp":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v6    # "xmlCmp":Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v0

    .end local v1    # "outXmlPath":Ljava/lang/String;
    .end local v2    # "cmpXmlPath":Ljava/lang/String;
    .end local v3    # "message":Ljava/lang/String;
    .end local v4    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v5    # "docCmp":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v6    # "xmlCmp":Ljava/io/FileOutputStream;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :try_start_a
    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 975
    .restart local v1    # "outXmlPath":Ljava/lang/String;
    .restart local v2    # "cmpXmlPath":Ljava/lang/String;
    .restart local v3    # "message":Ljava/lang/String;
    .restart local v4    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v5    # "docCmp":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v6    # "xmlCmp":Ljava/io/FileOutputStream;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_1
    move-exception v7

    :try_start_b
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    goto :goto_1

    :catchall_2
    move-exception v8

    :try_start_c
    invoke-virtual {v0, v8}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "outXmlPath":Ljava/lang/String;
    .end local v2    # "cmpXmlPath":Ljava/lang/String;
    .end local v3    # "message":Ljava/lang/String;
    .end local v4    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v5    # "docCmp":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :goto_1
    throw v7
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 970
    .end local v6    # "xmlCmp":Ljava/io/FileOutputStream;
    .restart local v1    # "outXmlPath":Ljava/lang/String;
    .restart local v2    # "cmpXmlPath":Ljava/lang/String;
    .restart local v3    # "message":Ljava/lang/String;
    .restart local v4    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v5    # "docCmp":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_3
    move-exception v0

    .end local v1    # "outXmlPath":Ljava/lang/String;
    .end local v2    # "cmpXmlPath":Ljava/lang/String;
    .end local v3    # "message":Ljava/lang/String;
    .end local v4    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v5    # "docCmp":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :try_start_d
    throw v0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    .line 975
    .restart local v1    # "outXmlPath":Ljava/lang/String;
    .restart local v2    # "cmpXmlPath":Ljava/lang/String;
    .restart local v3    # "message":Ljava/lang/String;
    .restart local v4    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v5    # "docCmp":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_4
    move-exception v6

    :try_start_e
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    goto :goto_2

    :catchall_5
    move-exception v7

    :try_start_f
    invoke-virtual {v0, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "outXmlPath":Ljava/lang/String;
    .end local v2    # "cmpXmlPath":Ljava/lang/String;
    .end local v3    # "message":Ljava/lang/String;
    .end local v4    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :goto_2
    throw v6
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_6

    .line 970
    .end local v5    # "docCmp":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v1    # "outXmlPath":Ljava/lang/String;
    .restart local v2    # "cmpXmlPath":Ljava/lang/String;
    .restart local v3    # "message":Ljava/lang/String;
    .restart local v4    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_6
    move-exception v0

    .end local v1    # "outXmlPath":Ljava/lang/String;
    .end local v2    # "cmpXmlPath":Ljava/lang/String;
    .end local v3    # "message":Ljava/lang/String;
    .end local v4    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :try_start_10
    throw v0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_7

    .line 975
    .restart local v1    # "outXmlPath":Ljava/lang/String;
    .restart local v2    # "cmpXmlPath":Ljava/lang/String;
    .restart local v3    # "message":Ljava/lang/String;
    .restart local v4    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_7
    move-exception v5

    if-eqz v4, :cond_4

    :try_start_11
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_8

    goto :goto_3

    :catchall_8
    move-exception v6

    invoke-virtual {v0, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4
    :goto_3
    throw v5

    .line 964
    .local v4, "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .local v5, "docOut":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v6, "xmlOut":Ljava/io/FileOutputStream;
    :catchall_9
    move-exception v0

    .end local v1    # "outXmlPath":Ljava/lang/String;
    .end local v2    # "cmpXmlPath":Ljava/lang/String;
    .end local v3    # "message":Ljava/lang/String;
    .end local v4    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v5    # "docOut":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v6    # "xmlOut":Ljava/io/FileOutputStream;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :try_start_12
    throw v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_a

    .line 969
    .restart local v1    # "outXmlPath":Ljava/lang/String;
    .restart local v2    # "cmpXmlPath":Ljava/lang/String;
    .restart local v3    # "message":Ljava/lang/String;
    .restart local v4    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v5    # "docOut":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v6    # "xmlOut":Ljava/io/FileOutputStream;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_a
    move-exception v7

    :try_start_13
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_b

    goto :goto_4

    :catchall_b
    move-exception v8

    :try_start_14
    invoke-virtual {v0, v8}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "outXmlPath":Ljava/lang/String;
    .end local v2    # "cmpXmlPath":Ljava/lang/String;
    .end local v3    # "message":Ljava/lang/String;
    .end local v4    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v5    # "docOut":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :goto_4
    throw v7
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_c

    .line 964
    .end local v6    # "xmlOut":Ljava/io/FileOutputStream;
    .restart local v1    # "outXmlPath":Ljava/lang/String;
    .restart local v2    # "cmpXmlPath":Ljava/lang/String;
    .restart local v3    # "message":Ljava/lang/String;
    .restart local v4    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v5    # "docOut":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_c
    move-exception v0

    .end local v1    # "outXmlPath":Ljava/lang/String;
    .end local v2    # "cmpXmlPath":Ljava/lang/String;
    .end local v3    # "message":Ljava/lang/String;
    .end local v4    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v5    # "docOut":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :try_start_15
    throw v0
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_d

    .line 969
    .restart local v1    # "outXmlPath":Ljava/lang/String;
    .restart local v2    # "cmpXmlPath":Ljava/lang/String;
    .restart local v3    # "message":Ljava/lang/String;
    .restart local v4    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v5    # "docOut":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_d
    move-exception v6

    :try_start_16
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_e

    goto :goto_5

    :catchall_e
    move-exception v7

    :try_start_17
    invoke-virtual {v0, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "outXmlPath":Ljava/lang/String;
    .end local v2    # "cmpXmlPath":Ljava/lang/String;
    .end local v3    # "message":Ljava/lang/String;
    .end local v4    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :goto_5
    throw v6
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_f

    .line 964
    .end local v5    # "docOut":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v1    # "outXmlPath":Ljava/lang/String;
    .restart local v2    # "cmpXmlPath":Ljava/lang/String;
    .restart local v3    # "message":Ljava/lang/String;
    .restart local v4    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_f
    move-exception v0

    .end local v1    # "outXmlPath":Ljava/lang/String;
    .end local v2    # "cmpXmlPath":Ljava/lang/String;
    .end local v3    # "message":Ljava/lang/String;
    .end local v4    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    :try_start_18
    throw v0
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_10

    .line 969
    .restart local v1    # "outXmlPath":Ljava/lang/String;
    .restart local v2    # "cmpXmlPath":Ljava/lang/String;
    .restart local v3    # "message":Ljava/lang/String;
    .restart local v4    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    :catchall_10
    move-exception v5

    if-eqz v4, :cond_5

    :try_start_19
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_11

    goto :goto_6

    :catchall_11
    move-exception v6

    invoke-virtual {v0, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5
    :goto_6
    throw v5
.end method

.method public compareVisually(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "outPdf"    # Ljava/lang/String;
    .param p2, "cmpPdf"    # Ljava/lang/String;
    .param p3, "outPath"    # Ljava/lang/String;
    .param p4, "differenceImagePrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 401
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "outPath":Ljava/lang/String;
    .end local p4    # "differenceImagePrefix":Ljava/lang/String;
    .local v1, "outPdf":Ljava/lang/String;
    .local v2, "cmpPdf":Ljava/lang/String;
    .local v3, "outPath":Ljava/lang/String;
    .local v4, "differenceImagePrefix":Ljava/lang/String;
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/kernel/utils/CompareTool;->compareVisually(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public compareVisually(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 3
    .param p1, "outPdf"    # Ljava/lang/String;
    .param p2, "cmpPdf"    # Ljava/lang/String;
    .param p3, "outPath"    # Ljava/lang/String;
    .param p4, "differenceImagePrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 433
    .local p5, "ignoredAreas":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;>;"
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/utils/CompareTool;->init(Ljava/lang/String;Ljava/lang/String;)V

    .line 434
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Out pdf: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/itextpdf/io/util/UrlUtil;->getNormalizedFileUriString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 435
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cmp pdf: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p2}, Lcom/itextpdf/io/util/UrlUtil;->getNormalizedFileUriString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 436
    invoke-direct {p0, p3, p4, p5}, Lcom/itextpdf/kernel/utils/CompareTool;->compareVisually(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public compareXmls(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p1, "outXmlFile"    # Ljava/lang/String;
    .param p2, "cmpXmlFile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 835
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Out xml: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/itextpdf/io/util/UrlUtil;->getNormalizedFileUriString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 836
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cmp xml: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p2}, Lcom/itextpdf/io/util/UrlUtil;->getNormalizedFileUriString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 837
    invoke-static {p1}, Lcom/itextpdf/commons/utils/FileUtil;->getInputStreamForFile(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 838
    .local v0, "outXmlStream":Ljava/io/InputStream;
    :try_start_0
    invoke-static {p2}, Lcom/itextpdf/commons/utils/FileUtil;->getInputStreamForFile(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 837
    .local v1, "cmpXmlStream":Ljava/io/InputStream;
    nop

    .line 839
    :try_start_1
    invoke-static {v0, v1}, Lcom/itextpdf/kernel/utils/XmlUtils;->compareXmls(Ljava/io/InputStream;Ljava/io/InputStream;)Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 840
    if-eqz v1, :cond_0

    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 839
    :cond_1
    return v2

    .line 837
    :catchall_0
    move-exception v2

    .end local v0    # "outXmlStream":Ljava/io/InputStream;
    .end local v1    # "cmpXmlStream":Ljava/io/InputStream;
    .end local p1    # "outXmlFile":Ljava/lang/String;
    .end local p2    # "cmpXmlFile":Ljava/lang/String;
    :try_start_3
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 840
    .restart local v0    # "outXmlStream":Ljava/io/InputStream;
    .restart local v1    # "cmpXmlStream":Ljava/io/InputStream;
    .restart local p1    # "outXmlFile":Ljava/lang/String;
    .restart local p2    # "cmpXmlFile":Ljava/lang/String;
    :catchall_1
    move-exception v3

    if-eqz v1, :cond_2

    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception v4

    :try_start_5
    invoke-virtual {v2, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "outXmlStream":Ljava/io/InputStream;
    .end local p1    # "outXmlFile":Ljava/lang/String;
    .end local p2    # "cmpXmlFile":Ljava/lang/String;
    :cond_2
    :goto_0
    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 837
    .end local v1    # "cmpXmlStream":Ljava/io/InputStream;
    .restart local v0    # "outXmlStream":Ljava/io/InputStream;
    .restart local p1    # "outXmlFile":Ljava/lang/String;
    .restart local p2    # "cmpXmlFile":Ljava/lang/String;
    :catchall_3
    move-exception v1

    .end local v0    # "outXmlStream":Ljava/io/InputStream;
    .end local p1    # "outXmlFile":Ljava/lang/String;
    .end local p2    # "cmpXmlFile":Ljava/lang/String;
    :try_start_6
    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 840
    .restart local v0    # "outXmlStream":Ljava/io/InputStream;
    .restart local p1    # "outXmlFile":Ljava/lang/String;
    .restart local p2    # "cmpXmlFile":Ljava/lang/String;
    :catchall_4
    move-exception v2

    if-eqz v0, :cond_3

    :try_start_7
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    goto :goto_1

    :catchall_5
    move-exception v3

    invoke-virtual {v1, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_1
    throw v2
.end method

.method public compareXmls([B[B)Z
    .locals 2
    .param p1, "xml1"    # [B
    .param p2, "xml2"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 820
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-static {v0, v1}, Lcom/itextpdf/kernel/utils/XmlUtils;->compareXmls(Ljava/io/InputStream;Ljava/io/InputStream;)Z

    move-result v0

    return v0
.end method

.method public compareXmp(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "outPdf"    # Ljava/lang/String;
    .param p2, "cmpPdf"    # Ljava/lang/String;

    .line 759
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/utils/CompareTool;->compareXmp(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public compareXmp(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 16
    .param p1, "outPdf"    # Ljava/lang/String;
    .param p2, "cmpPdf"    # Ljava/lang/String;
    .param p3, "ignoreDateAndProducerProperties"    # Z

    .line 772
    move-object/from16 v1, p0

    const-string v0, "Producer"

    const-string v2, "http://ns.adobe.com/pdf/1.3/"

    const-string v3, "MetadataDate"

    const-string v4, "ModifyDate"

    const-string v5, "CreateDate"

    const-string v6, "http://ns.adobe.com/xap/1.0/"

    invoke-direct/range {p0 .. p2}, Lcom/itextpdf/kernel/utils/CompareTool;->init(Ljava/lang/String;Ljava/lang/String;)V

    .line 773
    :try_start_0
    iget-object v7, v1, Lcom/itextpdf/kernel/utils/CompareTool;->cmpPdf:Ljava/lang/String;

    invoke-static {v7}, Lcom/itextpdf/kernel/utils/CompareTool;->createOutputReader(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 774
    .local v7, "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    :try_start_1
    new-instance v8, Lcom/itextpdf/kernel/pdf/PdfDocument;

    new-instance v9, Lcom/itextpdf/kernel/pdf/DocumentProperties;

    invoke-direct {v9}, Lcom/itextpdf/kernel/pdf/DocumentProperties;-><init>()V

    iget-object v10, v1, Lcom/itextpdf/kernel/utils/CompareTool;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 775
    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/DocumentProperties;->setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;

    move-result-object v9

    invoke-direct {v8, v7, v9}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/DocumentProperties;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_9

    .line 773
    .local v8, "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    nop

    .line 776
    :try_start_2
    iget-object v9, v1, Lcom/itextpdf/kernel/utils/CompareTool;->outPdf:Ljava/lang/String;

    invoke-static {v9}, Lcom/itextpdf/kernel/utils/CompareTool;->createOutputReader(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_6

    .line 773
    .local v9, "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    nop

    .line 777
    :try_start_3
    new-instance v10, Lcom/itextpdf/kernel/pdf/PdfDocument;

    new-instance v11, Lcom/itextpdf/kernel/pdf/DocumentProperties;

    invoke-direct {v11}, Lcom/itextpdf/kernel/pdf/DocumentProperties;-><init>()V

    iget-object v12, v1, Lcom/itextpdf/kernel/utils/CompareTool;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 778
    invoke-virtual {v11, v12}, Lcom/itextpdf/kernel/pdf/DocumentProperties;->setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;

    move-result-object v11

    invoke-direct {v10, v9, v11}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/DocumentProperties;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 773
    .local v10, "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    nop

    .line 779
    :try_start_4
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXmpMetadata()[B

    move-result-object v11

    .local v11, "cmpBytes":[B
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXmpMetadata()[B

    move-result-object v12

    .line 780
    .local v12, "outBytes":[B
    if-eqz p3, :cond_0

    .line 781
    new-instance v13, Lcom/itextpdf/kernel/xmp/options/ParseOptions;

    invoke-direct {v13}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;-><init>()V

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->setOmitNormalization(Z)Lcom/itextpdf/kernel/xmp/options/ParseOptions;

    move-result-object v13

    invoke-static {v11, v13}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->parseFromBuffer([BLcom/itextpdf/kernel/xmp/options/ParseOptions;)Lcom/itextpdf/kernel/xmp/XMPMeta;

    move-result-object v13

    .line 783
    .local v13, "xmpMeta":Lcom/itextpdf/kernel/xmp/XMPMeta;
    invoke-static {v13, v6, v5, v14, v14}, Lcom/itextpdf/kernel/xmp/XMPUtils;->removeProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 784
    invoke-static {v13, v6, v4, v14, v14}, Lcom/itextpdf/kernel/xmp/XMPUtils;->removeProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 785
    invoke-static {v13, v6, v3, v14, v14}, Lcom/itextpdf/kernel/xmp/XMPUtils;->removeProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 786
    invoke-static {v13, v2, v0, v14, v14}, Lcom/itextpdf/kernel/xmp/XMPUtils;->removeProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 788
    new-instance v15, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    const/16 v14, 0x2000

    invoke-direct {v15, v14}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;-><init>(I)V

    invoke-static {v13, v15}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->serializeToBuffer(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)[B

    move-result-object v15

    move-object v11, v15

    .line 790
    new-instance v15, Lcom/itextpdf/kernel/xmp/options/ParseOptions;

    invoke-direct {v15}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;-><init>()V

    const/4 v14, 0x1

    invoke-virtual {v15, v14}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->setOmitNormalization(Z)Lcom/itextpdf/kernel/xmp/options/ParseOptions;

    move-result-object v15

    invoke-static {v12, v15}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->parseFromBuffer([BLcom/itextpdf/kernel/xmp/options/ParseOptions;)Lcom/itextpdf/kernel/xmp/XMPMeta;

    move-result-object v14

    .line 791
    .end local v13    # "xmpMeta":Lcom/itextpdf/kernel/xmp/XMPMeta;
    .local v14, "xmpMeta":Lcom/itextpdf/kernel/xmp/XMPMeta;
    const/4 v13, 0x1

    invoke-static {v14, v6, v5, v13, v13}, Lcom/itextpdf/kernel/xmp/XMPUtils;->removeProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 792
    invoke-static {v14, v6, v4, v13, v13}, Lcom/itextpdf/kernel/xmp/XMPUtils;->removeProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 793
    invoke-static {v14, v6, v3, v13, v13}, Lcom/itextpdf/kernel/xmp/XMPUtils;->removeProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 794
    invoke-static {v14, v2, v0, v13, v13}, Lcom/itextpdf/kernel/xmp/XMPUtils;->removeProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 796
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    const/16 v2, 0x2000

    invoke-direct {v0, v2}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;-><init>(I)V

    invoke-static {v14, v0}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->serializeToBuffer(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)[B

    move-result-object v0

    move-object v12, v0

    .line 799
    .end local v14    # "xmpMeta":Lcom/itextpdf/kernel/xmp/XMPMeta;
    :cond_0
    invoke-virtual {v1, v11, v12}, Lcom/itextpdf/kernel/utils/CompareTool;->compareXmls([B[B)Z

    move-result v0

    if-nez v0, :cond_3

    .line 800
    const-string v0, "The XMP packages different!"
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 802
    :try_start_5
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    if-eqz v9, :cond_1

    :try_start_6
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6

    :cond_1
    :try_start_7
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_9

    if-eqz v7, :cond_2

    :try_start_8
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    .line 800
    :cond_2
    return-object v0

    .line 802
    .end local v11    # "cmpBytes":[B
    .end local v12    # "outBytes":[B
    :cond_3
    :try_start_9
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .end local v10    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v9, :cond_4

    :try_start_a
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .end local v9    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    :cond_4
    :try_start_b
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_9

    .end local v8    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v7, :cond_5

    :try_start_c
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0

    .line 804
    .end local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    :cond_5
    nop

    .line 805
    const/4 v0, 0x0

    return-object v0

    .line 773
    .restart local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v8    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v9    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v10    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :catchall_0
    move-exception v0

    move-object v2, v0

    .end local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v8    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v9    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v10    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "ignoreDateAndProducerProperties":Z
    :try_start_d
    throw v2
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 802
    .restart local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v8    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v9    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v10    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    .restart local p3    # "ignoreDateAndProducerProperties":Z
    :catchall_1
    move-exception v0

    move-object v3, v0

    :try_start_e
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception v0

    :try_start_f
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v8    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v9    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "ignoreDateAndProducerProperties":Z
    :goto_0
    throw v3
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    .line 773
    .end local v10    # "outDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v8    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v9    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    .restart local p3    # "ignoreDateAndProducerProperties":Z
    :catchall_3
    move-exception v0

    move-object v2, v0

    .end local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v8    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v9    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "ignoreDateAndProducerProperties":Z
    :try_start_10
    throw v2
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_4

    .line 802
    .restart local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v8    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v9    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    .restart local p3    # "ignoreDateAndProducerProperties":Z
    :catchall_4
    move-exception v0

    move-object v3, v0

    if-eqz v9, :cond_6

    :try_start_11
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_5

    goto :goto_1

    :catchall_5
    move-exception v0

    :try_start_12
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v8    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "ignoreDateAndProducerProperties":Z
    :cond_6
    :goto_1
    throw v3
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_6

    .line 773
    .end local v9    # "readerOut":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v8    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    .restart local p3    # "ignoreDateAndProducerProperties":Z
    :catchall_6
    move-exception v0

    move-object v2, v0

    .end local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v8    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "ignoreDateAndProducerProperties":Z
    :try_start_13
    throw v2
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_7

    .line 802
    .restart local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v8    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    .restart local p3    # "ignoreDateAndProducerProperties":Z
    :catchall_7
    move-exception v0

    move-object v3, v0

    :try_start_14
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_8

    goto :goto_2

    :catchall_8
    move-exception v0

    :try_start_15
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "ignoreDateAndProducerProperties":Z
    :goto_2
    throw v3
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_9

    .line 773
    .end local v8    # "cmpDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    .restart local p3    # "ignoreDateAndProducerProperties":Z
    :catchall_9
    move-exception v0

    move-object v2, v0

    .end local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "ignoreDateAndProducerProperties":Z
    :try_start_16
    throw v2
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_a

    .line 802
    .restart local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    .restart local p3    # "ignoreDateAndProducerProperties":Z
    :catchall_a
    move-exception v0

    move-object v3, v0

    if-eqz v7, :cond_7

    :try_start_17
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_b

    goto :goto_3

    :catchall_b
    move-exception v0

    :try_start_18
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p1    # "outPdf":Ljava/lang/String;
    .end local p2    # "cmpPdf":Ljava/lang/String;
    .end local p3    # "ignoreDateAndProducerProperties":Z
    :cond_7
    :goto_3
    throw v3
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_0

    .end local v7    # "readerCmp":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p1    # "outPdf":Ljava/lang/String;
    .restart local p2    # "cmpPdf":Ljava/lang/String;
    .restart local p3    # "ignoreDateAndProducerProperties":Z
    :catch_0
    move-exception v0

    .line 803
    .local v0, "ex":Ljava/lang/Exception;
    const-string v2, "XMP parsing failure!"

    return-object v2
.end method

.method protected convertDocInfoToStrings(Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;)[Ljava/lang/String;
    .locals 7
    .param p1, "info"    # Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 1001
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, ""

    aput-object v2, v0, v1

    const/4 v3, 0x1

    aput-object v2, v0, v3

    const/4 v4, 0x2

    aput-object v2, v0, v4

    const/4 v5, 0x3

    aput-object v2, v0, v5

    const/4 v6, 0x4

    aput-object v2, v0, v6

    .line 1002
    .local v0, "convertedInfo":[Ljava/lang/String;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getTitle()Ljava/lang/String;

    move-result-object v2

    .line 1003
    .local v2, "infoValue":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 1004
    aput-object v2, v0, v1

    .line 1005
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getAuthor()Ljava/lang/String;

    move-result-object v1

    .line 1006
    .end local v2    # "infoValue":Ljava/lang/String;
    .local v1, "infoValue":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 1007
    aput-object v1, v0, v3

    .line 1008
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getSubject()Ljava/lang/String;

    move-result-object v1

    .line 1009
    if-eqz v1, :cond_2

    .line 1010
    aput-object v1, v0, v4

    .line 1011
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getKeywords()Ljava/lang/String;

    move-result-object v1

    .line 1012
    if-eqz v1, :cond_3

    .line 1013
    aput-object v1, v0, v5

    .line 1014
    :cond_3
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getProducer()Ljava/lang/String;

    move-result-object v1

    .line 1015
    if-eqz v1, :cond_4

    .line 1016
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/utils/CompareTool;->convertProducerLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v6

    .line 1018
    :cond_4
    return-object v0
.end method

.method convertProducerLine(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "producer"    # Ljava/lang/String;

    .line 1022
    const-string v0, "(\\d+\\.)+\\d+(-SNAPSHOT)?"

    const-string v1, "<version>"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "\u00a9\\d+-\\d+ (?:iText Group NV|Apryse Group NV)"

    const-string/jumbo v2, "\u00a9<copyright years> Apryse Group NV"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public disableCachedPagesComparison()Lcom/itextpdf/kernel/utils/CompareTool;
    .locals 1

    .line 290
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->useCachedPagesForComparison:Z

    .line 291
    return-object p0
.end method

.method public enableEncryptionCompare()Lcom/itextpdf/kernel/utils/CompareTool;
    .locals 1

    .line 338
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->encryptionCompareEnabled:Z

    .line 339
    return-object p0
.end method

.method public getCmpReaderProperties()Lcom/itextpdf/kernel/pdf/ReaderProperties;
    .locals 1

    .line 372
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpProps:Lcom/itextpdf/kernel/pdf/ReaderProperties;

    if-nez v0, :cond_0

    .line 373
    new-instance v0, Lcom/itextpdf/kernel/pdf/ReaderProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/ReaderProperties;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpProps:Lcom/itextpdf/kernel/pdf/ReaderProperties;

    .line 375
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->cmpProps:Lcom/itextpdf/kernel/pdf/ReaderProperties;

    return-object v0
.end method

.method public getOutReaderProperties()Lcom/itextpdf/kernel/pdf/ReaderProperties;
    .locals 1

    .line 354
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outProps:Lcom/itextpdf/kernel/pdf/ReaderProperties;

    if-nez v0, :cond_0

    .line 355
    new-instance v0, Lcom/itextpdf/kernel/pdf/ReaderProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/ReaderProperties;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outProps:Lcom/itextpdf/kernel/pdf/ReaderProperties;

    .line 357
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool;->outProps:Lcom/itextpdf/kernel/pdf/ReaderProperties;

    return-object v0
.end method

.method public setCompareByContentErrorsLimit(I)Lcom/itextpdf/kernel/utils/CompareTool;
    .locals 0
    .param p1, "compareByContentMaxErrorCount"    # I

    .line 301
    iput p1, p0, Lcom/itextpdf/kernel/utils/CompareTool;->compareByContentErrorsLimit:I

    .line 302
    return-object p0
.end method

.method public setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)V
    .locals 0
    .param p1, "metaInfo"    # Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 324
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/CompareTool;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 325
    return-void
.end method

.method public setGenerateCompareByContentXmlReport(Z)Lcom/itextpdf/kernel/utils/CompareTool;
    .locals 0
    .param p1, "generateCompareByContentXmlReport"    # Z

    .line 314
    iput-boolean p1, p0, Lcom/itextpdf/kernel/utils/CompareTool;->generateCompareByContentXmlReport:Z

    .line 315
    return-object p0
.end method
