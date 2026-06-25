.class public Lcom/itextpdf/layout/element/Table;
.super Lcom/itextpdf/layout/element/BlockElement;
.source "Table.java"

# interfaces
.implements Lcom/itextpdf/layout/element/ILargeElement;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/element/Table$RowRange;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/layout/element/BlockElement<",
        "Lcom/itextpdf/layout/element/Table;",
        ">;",
        "Lcom/itextpdf/layout/element/ILargeElement;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private caption:Lcom/itextpdf/layout/element/Div;

.field private columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

.field private currentColumn:I

.field private currentRow:I

.field private document:Lcom/itextpdf/layout/Document;

.field private footer:Lcom/itextpdf/layout/element/Table;

.field private header:Lcom/itextpdf/layout/element/Table;

.field private isComplete:Z

.field private lastAddedRow:[Lcom/itextpdf/layout/element/Cell;

.field private lastAddedRowGroups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/element/Table$RowRange;",
            ">;"
        }
    .end annotation
.end field

.field private rowWindowStart:I

.field private rows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[",
            "Lcom/itextpdf/layout/element/Cell;",
            ">;"
        }
    .end annotation
.end field

.field private skipFirstHeader:Z

.field private skipLastFooter:Z

.field protected tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 51
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "numColumns"    # I

    .line 227
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/element/Table;-><init>(IZ)V

    .line 228
    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 2
    .param p1, "numColumns"    # I
    .param p2, "largeTable"    # Z

    .line 197
    invoke-direct {p0}, Lcom/itextpdf/layout/element/BlockElement;-><init>()V

    .line 58
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    .line 59
    const/4 v1, -0x1

    iput v1, p0, Lcom/itextpdf/layout/element/Table;->currentRow:I

    .line 68
    iput v0, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    .line 198
    if-lez p1, :cond_0

    .line 201
    invoke-static {p1}, Lcom/itextpdf/layout/element/Table;->normalizeColumnWidths(I)[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/element/Table;->columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

    .line 202
    invoke-direct {p0, p2}, Lcom/itextpdf/layout/element/Table;->initializeLargeTable(Z)V

    .line 203
    invoke-direct {p0}, Lcom/itextpdf/layout/element/Table;->initializeRows()V

    .line 204
    return-void

    .line 199
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The number of columns in Table constructor must be greater than zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>([F)V
    .locals 1
    .param p1, "pointColumnWidths"    # [F

    .line 172
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/element/Table;-><init>([FZ)V

    .line 173
    return-void
.end method

.method public constructor <init>([FZ)V
    .locals 2
    .param p1, "columnWidths"    # [F
    .param p2, "largeTable"    # Z

    .line 92
    invoke-direct {p0}, Lcom/itextpdf/layout/element/BlockElement;-><init>()V

    .line 58
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    .line 59
    const/4 v1, -0x1

    iput v1, p0, Lcom/itextpdf/layout/element/Table;->currentRow:I

    .line 68
    iput v0, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    .line 93
    if-eqz p1, :cond_1

    .line 96
    array-length v0, p1

    if-eqz v0, :cond_0

    .line 99
    invoke-static {p1}, Lcom/itextpdf/layout/element/Table;->normalizeColumnWidths([F)[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/element/Table;->columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

    .line 100
    invoke-direct {p0, p2}, Lcom/itextpdf/layout/element/Table;->initializeLargeTable(Z)V

    .line 101
    invoke-direct {p0}, Lcom/itextpdf/layout/element/Table;->initializeRows()V

    .line 102
    return-void

    .line 97
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The widths array in table constructor can not have zero length."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 94
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The widths array in table constructor can not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>([Lcom/itextpdf/layout/properties/UnitValue;)V
    .locals 1
    .param p1, "columnWidths"    # [Lcom/itextpdf/layout/properties/UnitValue;

    .line 152
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/element/Table;-><init>([Lcom/itextpdf/layout/properties/UnitValue;Z)V

    .line 153
    return-void
.end method

.method public constructor <init>([Lcom/itextpdf/layout/properties/UnitValue;Z)V
    .locals 2
    .param p1, "columnWidths"    # [Lcom/itextpdf/layout/properties/UnitValue;
    .param p2, "largeTable"    # Z

    .line 123
    invoke-direct {p0}, Lcom/itextpdf/layout/element/BlockElement;-><init>()V

    .line 58
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    .line 59
    const/4 v1, -0x1

    iput v1, p0, Lcom/itextpdf/layout/element/Table;->currentRow:I

    .line 68
    iput v0, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    .line 124
    if-eqz p1, :cond_1

    .line 127
    array-length v0, p1

    if-eqz v0, :cond_0

    .line 130
    invoke-static {p1}, Lcom/itextpdf/layout/element/Table;->normalizeColumnWidths([Lcom/itextpdf/layout/properties/UnitValue;)[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/element/Table;->columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

    .line 131
    invoke-direct {p0, p2}, Lcom/itextpdf/layout/element/Table;->initializeLargeTable(Z)V

    .line 132
    invoke-direct {p0}, Lcom/itextpdf/layout/element/Table;->initializeRows()V

    .line 133
    return-void

    .line 128
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The widths array in table constructor can not have zero length."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 125
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The widths array in table constructor can not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private cellBelongsToAnyRowGroup(Lcom/itextpdf/layout/element/Cell;Ljava/util/List;)Z
    .locals 4
    .param p1, "cell"    # Lcom/itextpdf/layout/element/Cell;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/element/Cell;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/element/Table$RowRange;",
            ">;)Z"
        }
    .end annotation

    .line 969
    .local p2, "rowGroups":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/element/Table$RowRange;>;"
    const/4 v0, 0x0

    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Cell;->getRow()I

    move-result v1

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 970
    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Cell;->getRow()I

    move-result v1

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Table$RowRange;->getFinishRow()I

    move-result v2

    if-gt v1, v2, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    nop

    .line 969
    :goto_0
    return v0
.end method

.method private ensureCaptionPropertiesAreSet()V
    .locals 2

    .line 533
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->caption:Lcom/itextpdf/layout/element/Div;

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Div;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v0

    const-string v1, "Caption"

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->setRole(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 534
    return-void
.end method

.method private ensureFooterIsInitialized()V
    .locals 3

    .line 992
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    if-nez v0, :cond_3

    .line 993
    new-instance v0, Lcom/itextpdf/layout/element/Table;

    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/element/Table;-><init>([Lcom/itextpdf/layout/properties/UnitValue;)V

    iput-object v0, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    .line 994
    invoke-virtual {p0}, Lcom/itextpdf/layout/element/Table;->getWidth()Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 995
    .local v0, "width":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v1, v0}, Lcom/itextpdf/layout/element/Table;->setWidth(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/element/IElement;

    .line 996
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Table;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v1

    const-string v2, "TFoot"

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->setRole(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 997
    const/16 v1, 0x72

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Table;->hasOwnProperty(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 998
    iget-object v2, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Table;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    invoke-virtual {v2, v1}, Lcom/itextpdf/layout/element/Table;->setBorderCollapse(Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;)Lcom/itextpdf/layout/element/Table;

    .line 1000
    :cond_1
    const/16 v1, 0x73

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Table;->hasOwnProperty(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1001
    iget-object v2, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Table;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/layout/element/Table;->setHorizontalBorderSpacing(F)Lcom/itextpdf/layout/element/Table;

    .line 1003
    :cond_2
    const/16 v1, 0x74

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Table;->hasOwnProperty(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1004
    iget-object v2, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Table;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/layout/element/Table;->setVerticalBorderSpacing(F)Lcom/itextpdf/layout/element/Table;

    .line 1007
    .end local v0    # "width":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_3
    return-void
.end method

.method private ensureHeaderIsInitialized()V
    .locals 3

    .line 974
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    if-nez v0, :cond_3

    .line 975
    new-instance v0, Lcom/itextpdf/layout/element/Table;

    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/element/Table;-><init>([Lcom/itextpdf/layout/properties/UnitValue;)V

    iput-object v0, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    .line 976
    invoke-virtual {p0}, Lcom/itextpdf/layout/element/Table;->getWidth()Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 977
    .local v0, "width":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v1, v0}, Lcom/itextpdf/layout/element/Table;->setWidth(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/element/IElement;

    .line 978
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Table;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v1

    const-string v2, "THead"

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->setRole(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 979
    const/16 v1, 0x72

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Table;->hasOwnProperty(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 980
    iget-object v2, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Table;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    invoke-virtual {v2, v1}, Lcom/itextpdf/layout/element/Table;->setBorderCollapse(Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;)Lcom/itextpdf/layout/element/Table;

    .line 982
    :cond_1
    const/16 v1, 0x73

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Table;->hasOwnProperty(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 983
    iget-object v2, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Table;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/layout/element/Table;->setHorizontalBorderSpacing(F)Lcom/itextpdf/layout/element/Table;

    .line 985
    :cond_2
    const/16 v1, 0x74

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Table;->hasOwnProperty(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 986
    iget-object v2, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Table;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/layout/element/Table;->setVerticalBorderSpacing(F)Lcom/itextpdf/layout/element/Table;

    .line 989
    .end local v0    # "width":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_3
    return-void
.end method

.method private initializeLargeTable(Z)V
    .locals 1
    .param p1, "largeTable"    # Z

    .line 1010
    xor-int/lit8 v0, p1, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/element/Table;->isComplete:Z

    .line 1011
    if-eqz p1, :cond_0

    .line 1012
    const/high16 v0, 0x42c80000    # 100.0f

    invoke-static {v0}, Lcom/itextpdf/layout/properties/UnitValue;->createPercentValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Table;->setWidth(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/element/IElement;

    .line 1013
    invoke-virtual {p0}, Lcom/itextpdf/layout/element/Table;->setFixedLayout()Lcom/itextpdf/layout/element/Table;

    .line 1015
    :cond_0
    return-void
.end method

.method private initializeRows()V
    .locals 1

    .line 964
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    .line 965
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    .line 966
    return-void
.end method

.method private static normalizeColumnWidths(I)[Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1
    .param p0, "numberOfColumns"    # I

    .line 918
    new-array v0, p0, [Lcom/itextpdf/layout/properties/UnitValue;

    .line 919
    .local v0, "normalized":[Lcom/itextpdf/layout/properties/UnitValue;
    return-object v0
.end method

.method private static normalizeColumnWidths([F)[Lcom/itextpdf/layout/properties/UnitValue;
    .locals 4
    .param p0, "pointColumnWidths"    # [F

    .line 898
    array-length v0, p0

    new-array v0, v0, [Lcom/itextpdf/layout/properties/UnitValue;

    .line 899
    .local v0, "normalized":[Lcom/itextpdf/layout/properties/UnitValue;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 900
    aget v2, p0, v1

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_0

    .line 901
    aget v2, p0, v1

    invoke-static {v2}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    aput-object v2, v0, v1

    .line 899
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 904
    .end local v1    # "i":I
    :cond_1
    return-object v0
.end method

.method private static normalizeColumnWidths([Lcom/itextpdf/layout/properties/UnitValue;)[Lcom/itextpdf/layout/properties/UnitValue;
    .locals 4
    .param p0, "unitColumnWidths"    # [Lcom/itextpdf/layout/properties/UnitValue;

    .line 908
    array-length v0, p0

    new-array v0, v0, [Lcom/itextpdf/layout/properties/UnitValue;

    .line 909
    .local v0, "normalized":[Lcom/itextpdf/layout/properties/UnitValue;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 910
    aget-object v2, p0, v1

    if-eqz v2, :cond_0

    aget-object v2, p0, v1

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_0

    new-instance v2, Lcom/itextpdf/layout/properties/UnitValue;

    aget-object v3, p0, v1

    invoke-direct {v2, v3}, Lcom/itextpdf/layout/properties/UnitValue;-><init>(Lcom/itextpdf/layout/properties/UnitValue;)V

    goto :goto_1

    :cond_0
    const/4 v2, 0x0

    :goto_1
    aput-object v2, v0, v1

    .line 909
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 914
    .end local v1    # "i":I
    :cond_1
    return-object v0
.end method


# virtual methods
.method public addCell(Lcom/itextpdf/layout/element/BlockElement;)Lcom/itextpdf/layout/element/Table;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/itextpdf/layout/element/IElement;",
            ">(",
            "Lcom/itextpdf/layout/element/BlockElement<",
            "TT;>;)",
            "Lcom/itextpdf/layout/element/Table;"
        }
    .end annotation

    .line 611
    .local p1, "blockElement":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    new-instance v0, Lcom/itextpdf/layout/element/Cell;

    invoke-direct {v0}, Lcom/itextpdf/layout/element/Cell;-><init>()V

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Cell;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/element/Cell;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Table;->addCell(Lcom/itextpdf/layout/element/Cell;)Lcom/itextpdf/layout/element/Table;

    move-result-object v0

    return-object v0
.end method

.method public addCell(Lcom/itextpdf/layout/element/Cell;)Lcom/itextpdf/layout/element/Table;
    .locals 5
    .param p1, "cell"    # Lcom/itextpdf/layout/element/Cell;

    .line 567
    iget-boolean v0, p0, Lcom/itextpdf/layout/element/Table;->isComplete:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRow:[Lcom/itextpdf/layout/element/Cell;

    if-nez v0, :cond_0

    goto :goto_0

    .line 568
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The large table was completed. It\'s prohibited to use it anymore. Created different Table instance instead."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 573
    :cond_1
    :goto_0
    iget v0, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

    array-length v1, v1

    if-ge v0, v1, :cond_2

    iget v0, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_3

    .line 574
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/layout/element/Table;->startNewRow()Lcom/itextpdf/layout/element/Table;

    .line 576
    :cond_3
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    iget v1, p0, Lcom/itextpdf/layout/element/Table;->currentRow:I

    iget v2, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    sub-int/2addr v1, v2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/element/Cell;

    iget v1, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_4

    .line 577
    iget v0, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    goto :goto_0

    .line 583
    :cond_4
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->childElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 584
    iget v0, p0, Lcom/itextpdf/layout/element/Table;->currentRow:I

    iget v1, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    iget-object v2, p0, Lcom/itextpdf/layout/element/Table;->columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

    array-length v2, v2

    invoke-virtual {p1, v0, v1, v2}, Lcom/itextpdf/layout/element/Cell;->updateCellIndexes(III)Lcom/itextpdf/layout/element/Cell;

    .line 586
    :goto_1
    iget v0, p0, Lcom/itextpdf/layout/element/Table;->currentRow:I

    iget v1, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-le v0, v1, :cond_5

    .line 587
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

    array-length v1, v1

    new-array v1, v1, [Lcom/itextpdf/layout/element/Cell;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 591
    :cond_5
    iget v0, p0, Lcom/itextpdf/layout/element/Table;->currentRow:I

    .local v0, "i":I
    :goto_2
    iget v1, p0, Lcom/itextpdf/layout/element/Table;->currentRow:I

    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v2

    add-int/2addr v1, v2

    if-ge v0, v1, :cond_8

    .line 592
    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    iget v2, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    sub-int v2, v0, v2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/itextpdf/layout/element/Cell;

    .line 593
    .local v1, "row":[Lcom/itextpdf/layout/element/Cell;
    iget v2, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    .local v2, "j":I
    :goto_3
    iget v3, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Cell;->getColspan()I

    move-result v4

    add-int/2addr v3, v4

    if-ge v2, v3, :cond_7

    .line 594
    aget-object v3, v1, v2

    if-nez v3, :cond_6

    .line 595
    aput-object p1, v1, v2

    .line 593
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 591
    .end local v1    # "row":[Lcom/itextpdf/layout/element/Cell;
    .end local v2    # "j":I
    :cond_7
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 599
    .end local v0    # "i":I
    :cond_8
    iget v0, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Cell;->getColspan()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    .line 600
    return-object p0
.end method

.method public addCell(Lcom/itextpdf/layout/element/Image;)Lcom/itextpdf/layout/element/Table;
    .locals 1
    .param p1, "image"    # Lcom/itextpdf/layout/element/Image;

    .line 621
    new-instance v0, Lcom/itextpdf/layout/element/Cell;

    invoke-direct {v0}, Lcom/itextpdf/layout/element/Cell;-><init>()V

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Cell;->add(Lcom/itextpdf/layout/element/Image;)Lcom/itextpdf/layout/element/Cell;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Table;->addCell(Lcom/itextpdf/layout/element/Cell;)Lcom/itextpdf/layout/element/Table;

    move-result-object v0

    return-object v0
.end method

.method public addCell(Ljava/lang/String;)Lcom/itextpdf/layout/element/Table;
    .locals 2
    .param p1, "content"    # Ljava/lang/String;

    .line 631
    new-instance v0, Lcom/itextpdf/layout/element/Cell;

    invoke-direct {v0}, Lcom/itextpdf/layout/element/Cell;-><init>()V

    new-instance v1, Lcom/itextpdf/layout/element/Paragraph;

    invoke-direct {v1, p1}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/element/Cell;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/element/Cell;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Table;->addCell(Lcom/itextpdf/layout/element/Cell;)Lcom/itextpdf/layout/element/Table;

    move-result-object v0

    return-object v0
.end method

.method public addFooterCell(Lcom/itextpdf/layout/element/BlockElement;)Lcom/itextpdf/layout/element/Table;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/itextpdf/layout/element/IElement;",
            ">(",
            "Lcom/itextpdf/layout/element/BlockElement<",
            "TT;>;)",
            "Lcom/itextpdf/layout/element/Table;"
        }
    .end annotation

    .line 412
    .local p1, "blockElement":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-direct {p0}, Lcom/itextpdf/layout/element/Table;->ensureFooterIsInitialized()V

    .line 413
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Table;->addCell(Lcom/itextpdf/layout/element/BlockElement;)Lcom/itextpdf/layout/element/Table;

    .line 414
    return-object p0
.end method

.method public addFooterCell(Lcom/itextpdf/layout/element/Cell;)Lcom/itextpdf/layout/element/Table;
    .locals 1
    .param p1, "footerCell"    # Lcom/itextpdf/layout/element/Cell;

    .line 397
    invoke-direct {p0}, Lcom/itextpdf/layout/element/Table;->ensureFooterIsInitialized()V

    .line 398
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Table;->addCell(Lcom/itextpdf/layout/element/Cell;)Lcom/itextpdf/layout/element/Table;

    .line 399
    return-object p0
.end method

.method public addFooterCell(Lcom/itextpdf/layout/element/Image;)Lcom/itextpdf/layout/element/Table;
    .locals 1
    .param p1, "image"    # Lcom/itextpdf/layout/element/Image;

    .line 426
    invoke-direct {p0}, Lcom/itextpdf/layout/element/Table;->ensureFooterIsInitialized()V

    .line 427
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Table;->addCell(Lcom/itextpdf/layout/element/Image;)Lcom/itextpdf/layout/element/Table;

    .line 428
    return-object p0
.end method

.method public addFooterCell(Ljava/lang/String;)Lcom/itextpdf/layout/element/Table;
    .locals 1
    .param p1, "content"    # Ljava/lang/String;

    .line 440
    invoke-direct {p0}, Lcom/itextpdf/layout/element/Table;->ensureFooterIsInitialized()V

    .line 441
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Table;->addCell(Ljava/lang/String;)Lcom/itextpdf/layout/element/Table;

    .line 442
    return-object p0
.end method

.method public addHeaderCell(Lcom/itextpdf/layout/element/BlockElement;)Lcom/itextpdf/layout/element/Table;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/itextpdf/layout/element/IElement;",
            ">(",
            "Lcom/itextpdf/layout/element/BlockElement<",
            "TT;>;)",
            "Lcom/itextpdf/layout/element/Table;"
        }
    .end annotation

    .line 346
    .local p1, "blockElement":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-direct {p0}, Lcom/itextpdf/layout/element/Table;->ensureHeaderIsInitialized()V

    .line 347
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Table;->addCell(Lcom/itextpdf/layout/element/BlockElement;)Lcom/itextpdf/layout/element/Table;

    .line 348
    return-object p0
.end method

.method public addHeaderCell(Lcom/itextpdf/layout/element/Cell;)Lcom/itextpdf/layout/element/Table;
    .locals 1
    .param p1, "headerCell"    # Lcom/itextpdf/layout/element/Cell;

    .line 331
    invoke-direct {p0}, Lcom/itextpdf/layout/element/Table;->ensureHeaderIsInitialized()V

    .line 332
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Table;->addCell(Lcom/itextpdf/layout/element/Cell;)Lcom/itextpdf/layout/element/Table;

    .line 333
    return-object p0
.end method

.method public addHeaderCell(Lcom/itextpdf/layout/element/Image;)Lcom/itextpdf/layout/element/Table;
    .locals 1
    .param p1, "image"    # Lcom/itextpdf/layout/element/Image;

    .line 360
    invoke-direct {p0}, Lcom/itextpdf/layout/element/Table;->ensureHeaderIsInitialized()V

    .line 361
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Table;->addCell(Lcom/itextpdf/layout/element/Image;)Lcom/itextpdf/layout/element/Table;

    .line 362
    return-object p0
.end method

.method public addHeaderCell(Ljava/lang/String;)Lcom/itextpdf/layout/element/Table;
    .locals 1
    .param p1, "content"    # Ljava/lang/String;

    .line 374
    invoke-direct {p0}, Lcom/itextpdf/layout/element/Table;->ensureHeaderIsInitialized()V

    .line 375
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Table;->addCell(Ljava/lang/String;)Lcom/itextpdf/layout/element/Table;

    .line 376
    return-object p0
.end method

.method public complete()V
    .locals 1

    .line 728
    iget-boolean v0, p0, Lcom/itextpdf/layout/element/Table;->isComplete:Z

    if-nez v0, :cond_0

    .line 729
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/element/Table;->isComplete:Z

    .line 730
    invoke-virtual {p0}, Lcom/itextpdf/layout/element/Table;->flush()V

    .line 731
    return-void

    .line 728
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public createRendererSubTree()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 5

    .line 662
    invoke-virtual {p0}, Lcom/itextpdf/layout/element/Table;->getRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 663
    .local v0, "rendererRoot":Lcom/itextpdf/layout/renderer/TableRenderer;
    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->childElements:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/element/IElement;

    .line 664
    .local v2, "child":Lcom/itextpdf/layout/element/IElement;
    iget-boolean v3, p0, Lcom/itextpdf/layout/element/Table;->isComplete:Z

    if-nez v3, :cond_1

    move-object v3, v2

    check-cast v3, Lcom/itextpdf/layout/element/Cell;

    iget-object v4, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRowGroups:Ljava/util/List;

    invoke-direct {p0, v3, v4}, Lcom/itextpdf/layout/element/Table;->cellBelongsToAnyRowGroup(Lcom/itextpdf/layout/element/Cell;Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    goto :goto_2

    :cond_1
    :goto_1
    const/4 v3, 0x1

    .line 665
    .local v3, "childShouldBeAdded":Z
    :goto_2
    if-eqz v3, :cond_2

    .line 666
    invoke-interface {v2}, Lcom/itextpdf/layout/element/IElement;->createRendererSubTree()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 668
    .end local v2    # "child":Lcom/itextpdf/layout/element/IElement;
    .end local v3    # "childShouldBeAdded":Z
    :cond_2
    goto :goto_0

    .line 669
    :cond_3
    return-object v0
.end method

.method public flush()V
    .locals 4

    .line 738
    const/4 v0, 0x0

    .line 739
    .local v0, "row":[Lcom/itextpdf/layout/element/Cell;
    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .line 740
    .local v1, "rowNum":I
    iget-object v2, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 741
    iget-object v2, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    iget-object v3, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, [Lcom/itextpdf/layout/element/Cell;

    .line 743
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/layout/element/Table;->document:Lcom/itextpdf/layout/Document;

    invoke-virtual {v2, p0}, Lcom/itextpdf/layout/Document;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/Document;

    .line 744
    if-eqz v0, :cond_1

    iget-object v2, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eq v1, v2, :cond_1

    .line 745
    iput-object v0, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRow:[Lcom/itextpdf/layout/element/Cell;

    .line 747
    :cond_1
    return-void
.end method

.method public flushContent()V
    .locals 6

    .line 755
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRowGroups:Ljava/util/List;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRowGroups:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_2

    .line 757
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRowGroups:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/Table$RowRange;

    iget v0, v0, Lcom/itextpdf/layout/element/Table$RowRange;->startRow:I

    .line 758
    .local v0, "firstRow":I
    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRowGroups:Ljava/util/List;

    iget-object v2, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRowGroups:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/element/Table$RowRange;

    iget v1, v1, Lcom/itextpdf/layout/element/Table$RowRange;->finishRow:I

    .line 760
    .local v1, "lastRow":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 761
    .local v2, "toRemove":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/element/IElement;>;"
    iget-object v3, p0, Lcom/itextpdf/layout/element/Table;->childElements:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/element/IElement;

    .line 762
    .local v4, "cell":Lcom/itextpdf/layout/element/IElement;
    move-object v5, v4

    check-cast v5, Lcom/itextpdf/layout/element/Cell;

    invoke-virtual {v5}, Lcom/itextpdf/layout/element/Cell;->getRow()I

    move-result v5

    if-lt v5, v0, :cond_1

    move-object v5, v4

    check-cast v5, Lcom/itextpdf/layout/element/Cell;

    invoke-virtual {v5}, Lcom/itextpdf/layout/element/Cell;->getRow()I

    move-result v5

    if-gt v5, v1, :cond_1

    .line 763
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 765
    .end local v4    # "cell":Lcom/itextpdf/layout/element/IElement;
    :cond_1
    goto :goto_0

    .line 766
    :cond_2
    iget-object v3, p0, Lcom/itextpdf/layout/element/Table;->childElements:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 768
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    sub-int v4, v1, v0

    .line 771
    iget-object v5, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    .line 768
    if-ge v3, v4, :cond_3

    .line 769
    iget v4, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    sub-int v4, v0, v4

    invoke-interface {v5, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 768
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 771
    .end local v3    # "i":I
    :cond_3
    iget v3, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    sub-int v3, v0, v3

    invoke-interface {v5, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/itextpdf/layout/element/Cell;

    iput-object v3, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRow:[Lcom/itextpdf/layout/element/Cell;

    .line 772
    iget-object v3, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRowGroups:Ljava/util/List;

    iget-object v4, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRowGroups:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v3}, Lcom/itextpdf/layout/element/Table$RowRange;->getFinishRow()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    .line 774
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRowGroups:Ljava/util/List;

    .line 775
    return-void

    .line 756
    .end local v0    # "firstRow":I
    .end local v1    # "lastRow":I
    .end local v2    # "toRemove":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/element/IElement;>;"
    :cond_4
    :goto_2
    return-void
.end method

.method public getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 2

    .line 886
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    if-nez v0, :cond_0

    .line 887
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    const-string v1, "Table"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/itextpdf/layout/element/Table;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    .line 889
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    return-object v0
.end method

.method public getCaption()Lcom/itextpdf/layout/element/Div;
    .locals 1

    .line 542
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->caption:Lcom/itextpdf/layout/element/Div;

    return-object v0
.end method

.method public getCell(II)Lcom/itextpdf/layout/element/Cell;
    .locals 2
    .param p1, "row"    # I
    .param p2, "column"    # I

    .line 643
    iget v0, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    sub-int v0, p1, v0

    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 644
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    iget v1, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    sub-int v1, p1, v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/element/Cell;

    aget-object v0, v0, p2

    .line 646
    .local v0, "cell":Lcom/itextpdf/layout/element/Cell;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Cell;->getRow()I

    move-result v1

    if-ne v1, p1, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Cell;->getCol()I

    move-result v1

    if-ne v1, p2, :cond_0

    .line 647
    return-object v0

    .line 650
    .end local v0    # "cell":Lcom/itextpdf/layout/element/Cell;
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getColumnWidth(I)Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1
    .param p1, "column"    # I

    .line 301
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getFooter()Lcom/itextpdf/layout/element/Table;
    .locals 1

    .line 451
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    return-object v0
.end method

.method public getHeader()Lcom/itextpdf/layout/element/Table;
    .locals 1

    .line 385
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    return-object v0
.end method

.method public getLastRowBottomBorder()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 788
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 789
    .local v0, "horizontalBorder":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRow:[Lcom/itextpdf/layout/element/Cell;

    if-eqz v1, :cond_3

    .line 790
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRow:[Lcom/itextpdf/layout/element/Cell;

    array-length v2, v2

    if-ge v1, v2, :cond_3

    .line 791
    iget-object v2, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRow:[Lcom/itextpdf/layout/element/Cell;

    aget-object v2, v2, v1

    .line 792
    .local v2, "cell":Lcom/itextpdf/layout/element/Cell;
    const/4 v3, 0x0

    .line 793
    .local v3, "border":Lcom/itextpdf/layout/borders/Border;
    if-eqz v2, :cond_2

    .line 794
    const/16 v4, 0xa

    invoke-virtual {v2, v4}, Lcom/itextpdf/layout/element/Cell;->hasProperty(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 795
    invoke-virtual {v2, v4}, Lcom/itextpdf/layout/element/Cell;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    move-object v3, v4

    check-cast v3, Lcom/itextpdf/layout/borders/Border;

    goto :goto_1

    .line 796
    :cond_0
    const/16 v4, 0x9

    invoke-virtual {v2, v4}, Lcom/itextpdf/layout/element/Cell;->hasProperty(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 797
    invoke-virtual {v2, v4}, Lcom/itextpdf/layout/element/Cell;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    move-object v3, v4

    check-cast v3, Lcom/itextpdf/layout/borders/Border;

    goto :goto_1

    .line 799
    :cond_1
    invoke-virtual {v2, v4}, Lcom/itextpdf/layout/element/Cell;->getDefaultProperty(I)Ljava/lang/Object;

    move-result-object v4

    move-object v3, v4

    check-cast v3, Lcom/itextpdf/layout/borders/Border;

    .line 802
    :cond_2
    :goto_1
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 790
    .end local v2    # "cell":Lcom/itextpdf/layout/element/Cell;
    .end local v3    # "border":Lcom/itextpdf/layout/borders/Border;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 806
    .end local v1    # "i":I
    :cond_3
    return-object v0
.end method

.method public getNumberOfColumns()I
    .locals 1

    .line 310
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

    array-length v0, v0

    return v0
.end method

.method public getNumberOfRows()I
    .locals 1

    .line 319
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 5

    .line 681
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->nextRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v0, :cond_1

    .line 682
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->nextRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_0

    .line 683
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->nextRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 684
    .local v0, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->nextRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/layout/element/Table;->nextRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 685
    return-object v0

    .line 687
    .end local v0    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_0
    const-class v0, Lcom/itextpdf/layout/element/Table;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 688
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Invalid renderer for Table: must be inherited from TableRenderer"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 693
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_1
    iget-boolean v0, p0, Lcom/itextpdf/layout/element/Table;->isComplete:Z

    if-eqz v0, :cond_2

    .line 695
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRow:[Lcom/itextpdf/layout/element/Cell;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_3

    .line 696
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 697
    .local v0, "allRows":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/element/Table$RowRange;>;"
    new-instance v1, Lcom/itextpdf/layout/element/Table$RowRange;

    iget v2, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    iget v3, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    iget-object v4, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, -0x1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/layout/element/Table$RowRange;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 698
    iput-object v0, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRowGroups:Ljava/util/List;

    .line 699
    .end local v0    # "allRows":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/element/Table$RowRange;>;"
    goto :goto_0

    .line 701
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/layout/element/Table;->getRowGroups()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRowGroups:Ljava/util/List;

    .line 703
    :cond_3
    :goto_0
    iget-boolean v0, p0, Lcom/itextpdf/layout/element/Table;->isComplete:Z

    if-eqz v0, :cond_4

    .line 704
    new-instance v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    new-instance v1, Lcom/itextpdf/layout/element/Table$RowRange;

    iget v2, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    iget v3, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    iget-object v4, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, -0x1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/layout/element/Table$RowRange;-><init>(II)V

    invoke-direct {v0, p0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;-><init>(Lcom/itextpdf/layout/element/Table;Lcom/itextpdf/layout/element/Table$RowRange;)V

    return-object v0

    .line 706
    :cond_4
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRowGroups:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRowGroups:Ljava/util/List;

    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->lastAddedRowGroups:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/Table$RowRange;

    iget v0, v0, Lcom/itextpdf/layout/element/Table$RowRange;->finishRow:I

    goto :goto_1

    :cond_5
    const/4 v0, -0x1

    .line 707
    .local v0, "rowWindowFinish":I
    :goto_1
    new-instance v1, Lcom/itextpdf/layout/renderer/TableRenderer;

    new-instance v2, Lcom/itextpdf/layout/element/Table$RowRange;

    iget v3, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    invoke-direct {v2, v3, v0}, Lcom/itextpdf/layout/element/Table$RowRange;-><init>(II)V

    invoke-direct {v1, p0, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;-><init>(Lcom/itextpdf/layout/element/Table;Lcom/itextpdf/layout/element/Table$RowRange;)V

    return-object v1
.end method

.method protected getRowGroups()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/element/Table$RowRange;",
            ">;"
        }
    .end annotation

    .line 928
    iget v0, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

    array-length v1, v1

    iget v2, p0, Lcom/itextpdf/layout/element/Table;->currentRow:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    add-int/lit8 v2, v2, -0x1

    .line 929
    .local v2, "lastRowWeCanFlush":I
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

    array-length v0, v0

    new-array v0, v0, [I

    .line 930
    .local v0, "cellBottomRows":[I
    iget v1, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    .line 931
    .local v1, "currentRowGroupStart":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 932
    .local v3, "rowGroups":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/element/Table$RowRange;>;"
    :goto_1
    if-gt v1, v2, :cond_8

    .line 933
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    iget-object v5, p0, Lcom/itextpdf/layout/element/Table;->columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

    array-length v5, v5

    if-ge v4, v5, :cond_1

    .line 934
    aput v1, v0, v4

    .line 933
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 936
    .end local v4    # "i":I
    :cond_1
    const/4 v4, 0x0

    aget v5, v0, v4

    iget-object v6, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    aget v7, v0, v4

    iget v8, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    sub-int/2addr v7, v8

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lcom/itextpdf/layout/element/Cell;

    aget-object v4, v6, v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v4

    add-int/2addr v5, v4

    add-int/lit8 v5, v5, -0x1

    .line 937
    .local v5, "maxRowGroupFinish":I
    const/4 v4, 0x0

    .line 938
    .local v4, "converged":Z
    const/4 v6, 0x1

    .line 939
    .local v6, "rowGroupComplete":Z
    :goto_3
    if-nez v4, :cond_6

    .line 940
    const/4 v4, 0x1

    .line 941
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_4
    iget-object v8, p0, Lcom/itextpdf/layout/element/Table;->columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

    array-length v8, v8

    if-ge v7, v8, :cond_5

    .line 942
    :goto_5
    aget v8, v0, v7

    if-ge v8, v2, :cond_2

    aget v8, v0, v7

    iget-object v9, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    aget v10, v0, v7

    iget v11, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    sub-int/2addr v10, v11

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lcom/itextpdf/layout/element/Cell;

    aget-object v9, v9, v7

    invoke-virtual {v9}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v9

    add-int/2addr v8, v9

    add-int/lit8 v8, v8, -0x1

    if-ge v8, v5, :cond_2

    .line 943
    aget v8, v0, v7

    iget-object v9, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    aget v10, v0, v7

    iget v11, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    sub-int/2addr v10, v11

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lcom/itextpdf/layout/element/Cell;

    aget-object v9, v9, v7

    invoke-virtual {v9}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v9

    add-int/2addr v8, v9

    aput v8, v0, v7

    goto :goto_5

    .line 945
    :cond_2
    aget v8, v0, v7

    iget-object v9, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    aget v10, v0, v7

    iget v11, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    sub-int/2addr v10, v11

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lcom/itextpdf/layout/element/Cell;

    aget-object v9, v9, v7

    invoke-virtual {v9}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v9

    add-int/2addr v8, v9

    add-int/lit8 v8, v8, -0x1

    if-le v8, v5, :cond_3

    .line 946
    aget v8, v0, v7

    iget-object v9, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    aget v10, v0, v7

    iget v11, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    sub-int/2addr v10, v11

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lcom/itextpdf/layout/element/Cell;

    aget-object v9, v9, v7

    invoke-virtual {v9}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v9

    add-int/2addr v8, v9

    add-int/lit8 v5, v8, -0x1

    .line 947
    const/4 v4, 0x0

    goto :goto_6

    .line 948
    :cond_3
    aget v8, v0, v7

    iget-object v9, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    aget v10, v0, v7

    iget v11, p0, Lcom/itextpdf/layout/element/Table;->rowWindowStart:I

    sub-int/2addr v10, v11

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lcom/itextpdf/layout/element/Cell;

    aget-object v9, v9, v7

    invoke-virtual {v9}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v9

    add-int/2addr v8, v9

    add-int/lit8 v8, v8, -0x1

    if-ge v8, v5, :cond_4

    .line 950
    const/4 v6, 0x0

    .line 941
    :cond_4
    :goto_6
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_4

    .end local v7    # "i":I
    :cond_5
    goto/16 :goto_3

    .line 954
    :cond_6
    if-eqz v6, :cond_7

    .line 955
    new-instance v7, Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-direct {v7, v1, v5}, Lcom/itextpdf/layout/element/Table$RowRange;-><init>(II)V

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 957
    :cond_7
    add-int/lit8 v1, v5, 0x1

    .line 958
    .end local v4    # "converged":Z
    .end local v5    # "maxRowGroupFinish":I
    .end local v6    # "rowGroupComplete":Z
    goto/16 :goto_1

    .line 960
    :cond_8
    return-object v3
.end method

.method public isComplete()Z
    .locals 1

    .line 713
    iget-boolean v0, p0, Lcom/itextpdf/layout/element/Table;->isComplete:Z

    return v0
.end method

.method public isSkipFirstHeader()Z
    .locals 1

    .line 461
    iget-boolean v0, p0, Lcom/itextpdf/layout/element/Table;->skipFirstHeader:Z

    return v0
.end method

.method public isSkipLastFooter()Z
    .locals 1

    .line 483
    iget-boolean v0, p0, Lcom/itextpdf/layout/element/Table;->skipLastFooter:Z

    return v0
.end method

.method protected makeNewRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 1

    .line 894
    new-instance v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-direct {v0, p0}, Lcom/itextpdf/layout/renderer/TableRenderer;-><init>(Lcom/itextpdf/layout/element/Table;)V

    return-object v0
.end method

.method public setAutoLayout()Lcom/itextpdf/layout/element/Table;
    .locals 2

    .line 280
    const/16 v0, 0x5d

    const-string v1, "auto"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Table;->setProperty(ILjava/lang/Object;)V

    .line 281
    return-object p0
.end method

.method public setBorderCollapse(Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;)Lcom/itextpdf/layout/element/Table;
    .locals 1
    .param p1, "collapsePropertyValue"    # Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    .line 840
    const/16 v0, 0x72

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/Table;->setProperty(ILjava/lang/Object;)V

    .line 841
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    if-eqz v0, :cond_0

    .line 842
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Table;->setBorderCollapse(Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;)Lcom/itextpdf/layout/element/Table;

    .line 844
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    if-eqz v0, :cond_1

    .line 845
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Table;->setBorderCollapse(Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;)Lcom/itextpdf/layout/element/Table;

    .line 847
    :cond_1
    return-object p0
.end method

.method public setCaption(Lcom/itextpdf/layout/element/Div;)Lcom/itextpdf/layout/element/Table;
    .locals 0
    .param p1, "caption"    # Lcom/itextpdf/layout/element/Div;

    .line 508
    iput-object p1, p0, Lcom/itextpdf/layout/element/Table;->caption:Lcom/itextpdf/layout/element/Div;

    .line 509
    if-eqz p1, :cond_0

    .line 510
    invoke-direct {p0}, Lcom/itextpdf/layout/element/Table;->ensureCaptionPropertiesAreSet()V

    .line 512
    :cond_0
    return-object p0
.end method

.method public setCaption(Lcom/itextpdf/layout/element/Div;Lcom/itextpdf/layout/properties/CaptionSide;)Lcom/itextpdf/layout/element/Table;
    .locals 1
    .param p1, "caption"    # Lcom/itextpdf/layout/element/Div;
    .param p2, "side"    # Lcom/itextpdf/layout/properties/CaptionSide;

    .line 525
    if-eqz p1, :cond_0

    .line 526
    const/16 v0, 0x77

    invoke-virtual {p1, v0, p2}, Lcom/itextpdf/layout/element/Div;->setProperty(ILjava/lang/Object;)V

    .line 528
    :cond_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/element/Table;->setCaption(Lcom/itextpdf/layout/element/Div;)Lcom/itextpdf/layout/element/Table;

    .line 529
    return-object p0
.end method

.method public setDocument(Lcom/itextpdf/layout/Document;)V
    .locals 0
    .param p1, "document"    # Lcom/itextpdf/layout/Document;

    .line 779
    iput-object p1, p0, Lcom/itextpdf/layout/element/Table;->document:Lcom/itextpdf/layout/Document;

    .line 780
    return-void
.end method

.method public setExtendBottomRow(Z)Lcom/itextpdf/layout/element/Table;
    .locals 2
    .param p1, "isExtended"    # Z

    .line 817
    const/16 v0, 0x56

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Table;->setProperty(ILjava/lang/Object;)V

    .line 818
    return-object p0
.end method

.method public setExtendBottomRowOnSplit(Z)Lcom/itextpdf/layout/element/Table;
    .locals 2
    .param p1, "isExtended"    # Z

    .line 829
    const/16 v0, 0x57

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Table;->setProperty(ILjava/lang/Object;)V

    .line 830
    return-object p0
.end method

.method public setFixedLayout()Lcom/itextpdf/layout/element/Table;
    .locals 2

    .line 257
    const/16 v0, 0x5d

    const-string v1, "fixed"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Table;->setProperty(ILjava/lang/Object;)V

    .line 258
    return-object p0
.end method

.method public setHorizontalBorderSpacing(F)Lcom/itextpdf/layout/element/Table;
    .locals 2
    .param p1, "spacing"    # F

    .line 857
    const/16 v0, 0x73

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Table;->setProperty(ILjava/lang/Object;)V

    .line 858
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    if-eqz v0, :cond_0

    .line 859
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Table;->setHorizontalBorderSpacing(F)Lcom/itextpdf/layout/element/Table;

    .line 861
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    if-eqz v0, :cond_1

    .line 862
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Table;->setHorizontalBorderSpacing(F)Lcom/itextpdf/layout/element/Table;

    .line 864
    :cond_1
    return-object p0
.end method

.method public setSkipFirstHeader(Z)Lcom/itextpdf/layout/element/Table;
    .locals 0
    .param p1, "skipFirstHeader"    # Z

    .line 472
    iput-boolean p1, p0, Lcom/itextpdf/layout/element/Table;->skipFirstHeader:Z

    .line 473
    return-object p0
.end method

.method public setSkipLastFooter(Z)Lcom/itextpdf/layout/element/Table;
    .locals 0
    .param p1, "skipLastFooter"    # Z

    .line 494
    iput-boolean p1, p0, Lcom/itextpdf/layout/element/Table;->skipLastFooter:Z

    .line 495
    return-object p0
.end method

.method public setVerticalBorderSpacing(F)Lcom/itextpdf/layout/element/Table;
    .locals 2
    .param p1, "spacing"    # F

    .line 874
    const/16 v0, 0x74

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Table;->setProperty(ILjava/lang/Object;)V

    .line 875
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    if-eqz v0, :cond_0

    .line 876
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->header:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Table;->setVerticalBorderSpacing(F)Lcom/itextpdf/layout/element/Table;

    .line 878
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    if-eqz v0, :cond_1

    .line 879
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->footer:Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/element/Table;->setVerticalBorderSpacing(F)Lcom/itextpdf/layout/element/Table;

    .line 881
    :cond_1
    return-object p0
.end method

.method public startNewRow()Lcom/itextpdf/layout/element/Table;
    .locals 2

    .line 551
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/layout/element/Table;->currentColumn:I

    .line 552
    iget v0, p0, Lcom/itextpdf/layout/element/Table;->currentRow:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/layout/element/Table;->currentRow:I

    .line 553
    iget v0, p0, Lcom/itextpdf/layout/element/Table;->currentRow:I

    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 554
    iget-object v0, p0, Lcom/itextpdf/layout/element/Table;->rows:Ljava/util/List;

    iget-object v1, p0, Lcom/itextpdf/layout/element/Table;->columnWidths:[Lcom/itextpdf/layout/properties/UnitValue;

    array-length v1, v1

    new-array v1, v1, [Lcom/itextpdf/layout/element/Cell;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 556
    :cond_0
    return-object p0
.end method

.method public useAllAvailableWidth()Lcom/itextpdf/layout/element/Table;
    .locals 2

    .line 290
    const/high16 v0, 0x42c80000    # 100.0f

    invoke-static {v0}, Lcom/itextpdf/layout/properties/UnitValue;->createPercentValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    const/16 v1, 0x4d

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Table;->setProperty(ILjava/lang/Object;)V

    .line 291
    return-object p0
.end method
