.class public Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
.super Ljava/lang/Object;
.source "XMPPath.java"


# static fields
.field public static final ARRAY_INDEX_STEP:I = 0x3

.field public static final ARRAY_LAST_STEP:I = 0x4

.field public static final FIELD_SELECTOR_STEP:I = 0x6

.field public static final QUALIFIER_STEP:I = 0x2

.field public static final QUAL_SELECTOR_STEP:I = 0x5

.field public static final SCHEMA_NODE:I = -0x80000000

.field public static final STEP_ROOT_PROP:I = 0x1

.field public static final STEP_SCHEMA:I = 0x0

.field public static final STRUCT_FIELD_STEP:I = 0x1


# instance fields
.field private segments:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->segments:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public add(Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;)V
    .locals 1
    .param p1, "segment"    # Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    .line 78
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->segments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    return-void
.end method

.method public getSegment(I)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    .locals 1
    .param p1, "index"    # I

    .line 88
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->segments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    return-object v0
.end method

.method public size()I
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->segments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 107
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 108
    .local v0, "result":Ljava/lang/StringBuffer;
    const/4 v1, 0x1

    .line 109
    .local v1, "index":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 111
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 112
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->size()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    if-ge v1, v2, :cond_1

    .line 114
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getKind()I

    move-result v2

    .line 115
    .local v2, "kind":I
    if-eq v2, v3, :cond_0

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    .line 119
    :cond_0
    const/16 v3, 0x2f

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 122
    .end local v2    # "kind":I
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 125
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
