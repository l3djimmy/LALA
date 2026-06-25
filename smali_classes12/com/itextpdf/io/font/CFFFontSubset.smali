.class public Lcom/itextpdf/io/font/CFFFontSubset;
.super Lcom/itextpdf/io/font/CFFFont;
.source "CFFFontSubset.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field static final ENDCHAR_OP:B = 0xet

.field static final RETURN_OP:B = 0xbt

.field static final SubrsEscapeFuncs:[Ljava/lang/String;

.field static final SubrsFunctions:[Ljava/lang/String;


# instance fields
.field FDArrayUsed:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field GBias:I

.field GlyphsUsed:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field NewCharStringsIndex:[B

.field NewGSubrsIndex:[B

.field NewLSubrsIndex:[[B

.field NewSubrsIndexNonCID:[B

.field NumOfHints:I

.field OutputList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/itextpdf/io/font/CFFFont$Item;",
            ">;"
        }
    .end annotation
.end field

.field glyphsInList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field hGSubrsUsed:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field hSubrsUsed:Lcom/itextpdf/io/util/GenericArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/itextpdf/io/util/GenericArray<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field hSubrsUsedNonCID:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field lGSubrsUsed:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field lSubrsUsed:Lcom/itextpdf/io/util/GenericArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/itextpdf/io/util/GenericArray<",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field lSubrsUsedNonCID:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 25

    .line 46
    nop

    .line 51
    const/16 v0, 0x20

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "RESERVED_0"

    aput-object v3, v1, v2

    const-string v4, "hstem"

    const/4 v5, 0x1

    aput-object v4, v1, v5

    const/4 v4, 0x2

    const-string v6, "RESERVED_2"

    aput-object v6, v1, v4

    const-string/jumbo v7, "vstem"

    const/4 v8, 0x3

    aput-object v7, v1, v8

    const-string/jumbo v7, "vmoveto"

    const/4 v9, 0x4

    aput-object v7, v1, v9

    const-string/jumbo v7, "rlineto"

    const/4 v10, 0x5

    aput-object v7, v1, v10

    const-string v7, "hlineto"

    const/4 v11, 0x6

    aput-object v7, v1, v11

    const-string/jumbo v7, "vlineto"

    const/4 v12, 0x7

    aput-object v7, v1, v12

    const-string/jumbo v7, "rrcurveto"

    const/16 v13, 0x8

    aput-object v7, v1, v13

    const-string v7, "RESERVED_9"

    const/16 v14, 0x9

    aput-object v7, v1, v14

    const-string v7, "callsubr"

    const/16 v15, 0xa

    aput-object v7, v1, v15

    const-string/jumbo v7, "return"

    const/16 v16, 0xb

    aput-object v7, v1, v16

    const-string v7, "escape"

    const/16 v17, 0xc

    aput-object v7, v1, v17

    const/16 v7, 0xd

    const-string v18, "RESERVED_13"

    aput-object v18, v1, v7

    const-string v19, "endchar"

    const/16 v20, 0xe

    aput-object v19, v1, v20

    const-string v19, "RESERVED_15"

    const/16 v21, 0xf

    aput-object v19, v1, v21

    const/16 v19, 0x10

    const-string v22, "RESERVED_16"

    aput-object v22, v1, v19

    const/16 v23, 0x11

    const-string v24, "RESERVED_17"

    aput-object v24, v1, v23

    const/16 v23, 0x12

    const-string v24, "hstemhm"

    aput-object v24, v1, v23

    const/16 v23, 0x13

    const-string v24, "hintmask"

    aput-object v24, v1, v23

    const/16 v23, 0x14

    const-string v24, "cntrmask"

    aput-object v24, v1, v23

    const/16 v23, 0x15

    const-string/jumbo v24, "rmoveto"

    aput-object v24, v1, v23

    const/16 v23, 0x16

    const-string v24, "hmoveto"

    aput-object v24, v1, v23

    const/16 v23, 0x17

    const-string/jumbo v24, "vstemhm"

    aput-object v24, v1, v23

    const/16 v23, 0x18

    const-string/jumbo v24, "rcurveline"

    aput-object v24, v1, v23

    const/16 v23, 0x19

    const-string/jumbo v24, "rlinecurve"

    aput-object v24, v1, v23

    const/16 v23, 0x1a

    const-string/jumbo v24, "vvcurveto"

    aput-object v24, v1, v23

    const/16 v23, 0x1b

    const-string v24, "hhcurveto"

    aput-object v24, v1, v23

    const/16 v23, 0x1c

    const-string/jumbo v24, "shortint"

    aput-object v24, v1, v23

    const/16 v23, 0x1d

    const-string v24, "callgsubr"

    aput-object v24, v1, v23

    const/16 v23, 0x1e

    const-string/jumbo v24, "vhcurveto"

    aput-object v24, v1, v23

    const/16 v23, 0x1f

    const-string v24, "hvcurveto"

    aput-object v24, v1, v23

    sput-object v1, Lcom/itextpdf/io/font/CFFFontSubset;->SubrsFunctions:[Ljava/lang/String;

    .line 61
    const/16 v1, 0x27

    new-array v1, v1, [Ljava/lang/String;

    aput-object v3, v1, v2

    const-string v2, "RESERVED_1"

    aput-object v2, v1, v5

    aput-object v6, v1, v4

    const-string v2, "and"

    aput-object v2, v1, v8

    const-string/jumbo v2, "or"

    aput-object v2, v1, v9

    const-string/jumbo v2, "not"

    aput-object v2, v1, v10

    const-string v2, "RESERVED_6"

    aput-object v2, v1, v11

    const-string v2, "RESERVED_7"

    aput-object v2, v1, v12

    const-string v2, "RESERVED_8"

    aput-object v2, v1, v13

    const-string v2, "abs"

    aput-object v2, v1, v14

    const-string v2, "add"

    aput-object v2, v1, v15

    const-string/jumbo v2, "sub"

    aput-object v2, v1, v16

    const-string v2, "div"

    aput-object v2, v1, v17

    aput-object v18, v1, v7

    const-string v2, "neg"

    aput-object v2, v1, v20

    const-string v2, "eq"

    aput-object v2, v1, v21

    aput-object v22, v1, v19

    const/16 v2, 0x11

    const-string v3, "RESERVED_17"

    aput-object v3, v1, v2

    const/16 v2, 0x12

    const-string v3, "drop"

    aput-object v3, v1, v2

    const/16 v2, 0x13

    const-string v3, "RESERVED_19"

    aput-object v3, v1, v2

    const/16 v2, 0x14

    const-string/jumbo v3, "put"

    aput-object v3, v1, v2

    const/16 v2, 0x15

    const-string v3, "get"

    aput-object v3, v1, v2

    const/16 v2, 0x16

    const-string v3, "ifelse"

    aput-object v3, v1, v2

    const/16 v2, 0x17

    const-string/jumbo v3, "random"

    aput-object v3, v1, v2

    const/16 v2, 0x18

    const-string v3, "mul"

    aput-object v3, v1, v2

    const/16 v2, 0x19

    const-string v3, "RESERVED_25"

    aput-object v3, v1, v2

    const/16 v2, 0x1a

    const-string/jumbo v3, "sqrt"

    aput-object v3, v1, v2

    const/16 v2, 0x1b

    const-string v3, "dup"

    aput-object v3, v1, v2

    const/16 v2, 0x1c

    const-string v3, "exch"

    aput-object v3, v1, v2

    const/16 v2, 0x1d

    const-string v3, "index"

    aput-object v3, v1, v2

    const/16 v2, 0x1e

    const-string/jumbo v3, "roll"

    aput-object v3, v1, v2

    const/16 v2, 0x1f

    const-string v3, "RESERVED_31"

    aput-object v3, v1, v2

    const-string v2, "RESERVED_32"

    aput-object v2, v1, v0

    const/16 v0, 0x21

    const-string v2, "RESERVED_33"

    aput-object v2, v1, v0

    const/16 v0, 0x22

    const-string v2, "hflex"

    aput-object v2, v1, v0

    const/16 v0, 0x23

    const-string v2, "flex"

    aput-object v2, v1, v0

    const/16 v0, 0x24

    const-string v2, "hflex1"

    aput-object v2, v1, v0

    const/16 v0, 0x25

    const-string v2, "flex1"

    aput-object v2, v1, v0

    const/16 v0, 0x26

    const-string v2, "RESERVED_REST"

    aput-object v2, v1, v0

    sput-object v1, Lcom/itextpdf/io/font/CFFFontSubset;->SubrsEscapeFuncs:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>([B)V
    .locals 2
    .param p1, "cff"    # [B

    .line 150
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/io/font/CFFFontSubset;-><init>([BLjava/util/Set;Z)V

    .line 151
    return-void
.end method

.method public constructor <init>([BLjava/util/Set;)V
    .locals 1
    .param p1, "cff"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 154
    .local p2, "GlyphsUsed":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/io/font/CFFFontSubset;-><init>([BLjava/util/Set;Z)V

    .line 155
    return-void
.end method

.method constructor <init>([BLjava/util/Set;Z)V
    .locals 4
    .param p1, "cff"    # [B
    .param p3, "isCidParsingRequired"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;Z)V"
        }
    .end annotation

    .line 159
    .local p2, "GlyphsUsed":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-direct {p0, p1}, Lcom/itextpdf/io/font/CFFFont;-><init>([B)V

    .line 87
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->FDArrayUsed:Ljava/util/Set;

    .line 99
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->hGSubrsUsed:Ljava/util/Set;

    .line 103
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->lGSubrsUsed:Ljava/util/List;

    .line 107
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->hSubrsUsedNonCID:Ljava/util/Set;

    .line 111
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->lSubrsUsedNonCID:Ljava/util/List;

    .line 132
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->GBias:I

    .line 142
    iput v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NumOfHints:I

    .line 160
    iput-object p2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->GlyphsUsed:Ljava/util/Set;

    .line 162
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->glyphsInList:Ljava/util/List;

    .line 164
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    array-length v1, v1

    if-ge v0, v1, :cond_3

    .line 166
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->charstringsOffset:I

    invoke-virtual {p0, v1}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 167
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, v0

    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard16()C

    move-result v2

    iput v2, v1, Lcom/itextpdf/io/font/CFFFont$Font;->nglyphs:I

    .line 170
    iget v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->stringIndexOffset:I

    invoke-virtual {p0, v1}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 171
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, v0

    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard16()C

    move-result v2

    sget-object v3, Lcom/itextpdf/io/font/CFFFontSubset;->standardStrings:[Ljava/lang/String;

    array-length v3, v3

    add-int/2addr v2, v3

    iput v2, v1, Lcom/itextpdf/io/font/CFFFont$Font;->nstrings:I

    .line 174
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, v0

    iget v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->charstringsOffset:I

    invoke-virtual {p0, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->getIndex(I)[I

    move-result-object v2

    iput-object v2, v1, Lcom/itextpdf/io/font/CFFFont$Font;->charstringsOffsets:[I

    .line 176
    if-eqz p3, :cond_0

    .line 177
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->nglyphs:I

    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, v0

    iget v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->charsetOffset:I

    invoke-direct {p0, v0, v1, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->initGlyphIdToCharacterIdArray(III)V

    .line 181
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->fdselectOffset:I

    if-ltz v1, :cond_1

    .line 183
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/CFFFontSubset;->readFDSelect(I)V

    .line 185
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildFDArrayUsed(I)V

    .line 187
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, v0

    iget-boolean v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->isCID:Z

    if-eqz v1, :cond_2

    .line 189
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/CFFFontSubset;->ReadFDArray(I)V

    .line 191
    :cond_2
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, v0

    iget v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->charsetOffset:I

    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v3, v3, v0

    iget v3, v3, Lcom/itextpdf/io/font/CFFFont$Font;->nglyphs:I

    invoke-virtual {p0, v2, v3}, Lcom/itextpdf/io/font/CFFFontSubset;->CountCharset(II)I

    move-result v2

    iput v2, v1, Lcom/itextpdf/io/font/CFFFont$Font;->CharsetLength:I

    .line 164
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 193
    .end local v0    # "i":I
    :cond_3
    return-void
.end method

.method private initGlyphIdToCharacterIdArray(III)V
    .locals 9
    .param p1, "fontIndex"    # I
    .param p2, "numOfGlyphs"    # I
    .param p3, "offset"    # I

    .line 1747
    invoke-virtual {p0, p3}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 1750
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v0

    .line 1753
    .local v0, "format":I
    add-int/lit8 v1, p2, -0x1

    .line 1754
    .local v1, "numOfElements":I
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    new-array v3, v1, [I

    iput-object v3, v2, Lcom/itextpdf/io/font/CFFFont$Font;->gidToCid:[I

    .line 1756
    packed-switch v0, :pswitch_data_0

    goto :goto_4

    .line 1765
    :pswitch_0
    const/4 v2, 0x0

    .line 1766
    .local v2, "start":I
    :goto_0
    if-ge v2, v1, :cond_3

    .line 1767
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard16()C

    move-result v3

    .line 1768
    .local v3, "first":I
    const/4 v4, 0x1

    if-ne v0, v4, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v4

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard16()C

    move-result v4

    .line 1769
    .local v4, "nLeft":I
    :goto_1
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    if-gt v5, v4, :cond_1

    if-ge v2, v1, :cond_1

    .line 1770
    iget-object v6, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v6, v6, p1

    iget-object v6, v6, Lcom/itextpdf/io/font/CFFFont$Font;->gidToCid:[I

    add-int/lit8 v7, v2, 0x1

    .end local v2    # "start":I
    .local v7, "start":I
    add-int v8, v3, v5

    aput v8, v6, v2

    .line 1769
    add-int/lit8 v5, v5, 0x1

    move v2, v7

    goto :goto_2

    .line 1772
    .end local v3    # "first":I
    .end local v4    # "nLeft":I
    .end local v5    # "i":I
    .end local v7    # "start":I
    .restart local v2    # "start":I
    :cond_1
    goto :goto_0

    .line 1758
    .end local v2    # "start":I
    :pswitch_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    if-ge v2, v1, :cond_2

    .line 1759
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard16()C

    move-result v3

    .line 1760
    .local v3, "cid":I
    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v4, v4, p1

    iget-object v4, v4, Lcom/itextpdf/io/font/CFFFont$Font;->gidToCid:[I

    aput v3, v4, v2

    .line 1758
    .end local v3    # "cid":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1762
    .end local v2    # "i":I
    :cond_2
    nop

    .line 1777
    :cond_3
    :goto_4
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method protected AssembleIndex([I[B)[B
    .locals 16
    .param p1, "NewOffsets"    # [I
    .param p2, "NewObjects"    # [B

    .line 1045
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    int-to-char v2, v2

    .line 1047
    .local v2, "Count":C
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    aget v3, v0, v3

    .line 1052
    .local v3, "Size":I
    const/16 v4, 0xff

    if-ge v3, v4, :cond_0

    .line 1053
    const/4 v5, 0x1

    .local v5, "Offsize":B
    goto :goto_0

    .line 1054
    .end local v5    # "Offsize":B
    :cond_0
    const v5, 0xffff

    if-ge v3, v5, :cond_1

    .line 1055
    const/4 v5, 0x2

    .restart local v5    # "Offsize":B
    goto :goto_0

    .line 1056
    .end local v5    # "Offsize":B
    :cond_1
    const v5, 0xffffff

    if-ge v3, v5, :cond_2

    .line 1057
    const/4 v5, 0x3

    .restart local v5    # "Offsize":B
    goto :goto_0

    .line 1059
    .end local v5    # "Offsize":B
    :cond_2
    const/4 v5, 0x4

    .line 1063
    .restart local v5    # "Offsize":B
    :goto_0
    add-int/lit8 v6, v2, 0x1

    mul-int/2addr v6, v5

    add-int/lit8 v6, v6, 0x3

    array-length v7, v1

    add-int/2addr v6, v7

    new-array v6, v6, [B

    .line 1065
    .local v6, "NewIndex":[B
    const/4 v7, 0x0

    .line 1069
    .local v7, "Place":I
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "Place":I
    .local v8, "Place":I
    shr-int/lit8 v9, v2, 0x8

    and-int/2addr v9, v4

    int-to-byte v9, v9

    aput-byte v9, v6, v7

    .line 1070
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "Place":I
    .restart local v7    # "Place":I
    and-int/lit16 v9, v2, 0xff

    int-to-byte v9, v9

    aput-byte v9, v6, v8

    .line 1072
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "Place":I
    .restart local v8    # "Place":I
    aput-byte v5, v6, v7

    .line 1074
    array-length v7, v0

    const/4 v9, 0x0

    move v10, v9

    :goto_1
    if-ge v10, v7, :cond_4

    aget v11, v0, v10

    .line 1076
    .local v11, "newOffset":I
    aget v12, v0, v9

    sub-int v12, v11, v12

    add-int/lit8 v12, v12, 0x1

    .line 1078
    .local v12, "Num":I
    move v13, v5

    .local v13, "i":I
    :goto_2
    if-lez v13, :cond_3

    .line 1079
    add-int/lit8 v14, v8, 0x1

    .end local v8    # "Place":I
    .local v14, "Place":I
    add-int/lit8 v15, v13, -0x1

    shl-int/lit8 v15, v15, 0x3

    ushr-int v15, v12, v15

    and-int/2addr v15, v4

    int-to-byte v15, v15

    aput-byte v15, v6, v8

    .line 1078
    add-int/lit8 v13, v13, -0x1

    move v8, v14

    goto :goto_2

    .line 1074
    .end local v11    # "newOffset":I
    .end local v12    # "Num":I
    .end local v13    # "i":I
    .end local v14    # "Place":I
    .restart local v8    # "Place":I
    :cond_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 1083
    :cond_4
    array-length v4, v1

    :goto_3
    if-ge v9, v4, :cond_5

    aget-byte v7, v1, v9

    .line 1084
    .local v7, "newObject":B
    add-int/lit8 v10, v8, 0x1

    .end local v8    # "Place":I
    .local v10, "Place":I
    aput-byte v7, v6, v8

    .line 1083
    .end local v7    # "newObject":B
    add-int/lit8 v9, v9, 0x1

    move v8, v10

    goto :goto_3

    .line 1087
    .end local v10    # "Place":I
    .restart local v8    # "Place":I
    :cond_5
    return-object v6
.end method

.method protected BuildFDArrayUsed(I)V
    .locals 7
    .param p1, "Font"    # I

    .line 311
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/itextpdf/io/font/CFFFont$Font;->FDSelect:[I

    .line 313
    .local v0, "FDSelect":[I
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->glyphsInList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 315
    .local v2, "glyphsInList1":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 317
    .local v3, "glyph":I
    aget v4, v0, v3

    .line 319
    .local v4, "FD":I
    iget-object v5, p0, Lcom/itextpdf/io/font/CFFFontSubset;->FDArrayUsed:Ljava/util/Set;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 320
    .end local v2    # "glyphsInList1":Ljava/lang/Integer;
    .end local v3    # "glyph":I
    .end local v4    # "FD":I
    goto :goto_0

    .line 321
    :cond_0
    return-void
.end method

.method protected BuildFDSubrsOffsets(II)V
    .locals 3
    .param p1, "Font"    # I
    .param p2, "FD"    # I

    .line 495
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/itextpdf/io/font/CFFFont$Font;->PrivateSubrsOffset:[I

    const/4 v1, -0x1

    aput v1, v0, p2

    .line 497
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateOffsets:[I

    aget v0, v0, p2

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 499
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget-object v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateOffsets:[I

    aget v1, v1, p2

    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    iget-object v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateLengths:[I

    aget v2, v2, p2

    add-int/2addr v1, v2

    if-ge v0, v1, :cond_1

    .line 500
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getDictItem()V

    .line 502
    const-string v0, "Subrs"

    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 503
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/itextpdf/io/font/CFFFont$Font;->PrivateSubrsOffset:[I

    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->args:[Ljava/lang/Object;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    iget-object v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateOffsets:[I

    aget v2, v2, p2

    add-int/2addr v1, v2

    aput v1, v0, p2

    goto :goto_0

    .line 506
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/itextpdf/io/font/CFFFont$Font;->PrivateSubrsOffset:[I

    aget v0, v0, p2

    if-ltz v0, :cond_2

    .line 507
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/itextpdf/io/font/CFFFont$Font;->PrivateSubrsOffsetsArray:[[I

    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget-object v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->PrivateSubrsOffset:[I

    aget v1, v1, p2

    invoke-virtual {p0, v1}, Lcom/itextpdf/io/font/CFFFontSubset;->getIndex(I)[I

    move-result-object v1

    aput-object v1, v0, p2

    .line 508
    :cond_2
    return-void
.end method

.method protected BuildGSubrsUsed(I)V
    .locals 16
    .param p1, "Font"    # I

    .line 569
    move-object/from16 v0, p0

    move/from16 v8, p1

    const/4 v1, 0x0

    .line 570
    .local v1, "LBias":I
    const/4 v2, 0x0

    .line 571
    .local v2, "SizeOfNonCIDSubrsUsed":I
    iget-object v3, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v3, v3, v8

    iget v3, v3, Lcom/itextpdf/io/font/CFFFont$Font;->privateSubrs:I

    if-ltz v3, :cond_0

    .line 572
    iget-object v3, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v3, v3, v8

    iget v3, v3, Lcom/itextpdf/io/font/CFFFont$Font;->privateSubrs:I

    invoke-virtual {v0, v3, v8}, Lcom/itextpdf/io/font/CFFFontSubset;->CalcBias(II)I

    move-result v1

    .line 573
    iget-object v3, v0, Lcom/itextpdf/io/font/CFFFontSubset;->lSubrsUsedNonCID:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    move v9, v1

    goto :goto_0

    .line 571
    :cond_0
    move v9, v1

    .line 577
    .end local v1    # "LBias":I
    .local v9, "LBias":I
    :goto_0
    const/4 v1, 0x0

    move v10, v1

    move v11, v2

    .end local v2    # "SizeOfNonCIDSubrsUsed":I
    .local v10, "i":I
    .local v11, "SizeOfNonCIDSubrsUsed":I
    :goto_1
    iget-object v1, v0, Lcom/itextpdf/io/font/CFFFontSubset;->lGSubrsUsed:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v10, v1, :cond_6

    .line 579
    iget-object v1, v0, Lcom/itextpdf/io/font/CFFFontSubset;->lGSubrsUsed:Ljava/util/List;

    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v12

    .line 580
    .local v12, "Subr":I
    iget-object v1, v0, Lcom/itextpdf/io/font/CFFFontSubset;->gsubrOffsets:[I

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    if-ge v12, v1, :cond_4

    if-ltz v12, :cond_4

    .line 582
    iget-object v1, v0, Lcom/itextpdf/io/font/CFFFontSubset;->gsubrOffsets:[I

    aget v1, v1, v12

    .line 583
    .local v1, "Start":I
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->gsubrOffsets:[I

    add-int/lit8 v3, v12, 0x1

    aget v2, v2, v3

    .line 585
    .local v2, "End":I
    iget-object v3, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v3, v3, v8

    iget-boolean v3, v3, Lcom/itextpdf/io/font/CFFFont$Font;->isCID:Z

    .line 588
    move v4, v3

    iget v3, v0, Lcom/itextpdf/io/font/CFFFontSubset;->GBias:I

    .line 585
    if-eqz v4, :cond_1

    .line 586
    iget-object v5, v0, Lcom/itextpdf/io/font/CFFFontSubset;->hGSubrsUsed:Ljava/util/Set;

    iget-object v6, v0, Lcom/itextpdf/io/font/CFFFontSubset;->lGSubrsUsed:Ljava/util/List;

    const/4 v7, 0x0

    const/4 v4, 0x0

    invoke-virtual/range {v0 .. v7}, Lcom/itextpdf/io/font/CFFFontSubset;->ReadASubr(IIIILjava/util/Set;Ljava/util/List;[I)V

    move v4, v9

    goto/16 :goto_3

    .line 588
    :cond_1
    iget-object v5, v0, Lcom/itextpdf/io/font/CFFFontSubset;->hSubrsUsedNonCID:Ljava/util/Set;

    iget-object v6, v0, Lcom/itextpdf/io/font/CFFFontSubset;->lSubrsUsedNonCID:Ljava/util/List;

    iget-object v4, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v4, v4, v8

    iget-object v7, v4, Lcom/itextpdf/io/font/CFFFont$Font;->SubrsOffsets:[I

    move v4, v9

    .end local v9    # "LBias":I
    .local v4, "LBias":I
    invoke-virtual/range {v0 .. v7}, Lcom/itextpdf/io/font/CFFFontSubset;->ReadASubr(IIIILjava/util/Set;Ljava/util/List;[I)V

    .line 589
    move v9, v1

    move v13, v2

    .end local v1    # "Start":I
    .end local v2    # "End":I
    .local v9, "Start":I
    .local v13, "End":I
    iget-object v1, v0, Lcom/itextpdf/io/font/CFFFontSubset;->lSubrsUsedNonCID:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v11, v1, :cond_5

    .line 590
    move v1, v11

    move v14, v1

    .local v14, "j":I
    :goto_2
    iget-object v1, v0, Lcom/itextpdf/io/font/CFFFontSubset;->lSubrsUsedNonCID:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .line 600
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->lSubrsUsedNonCID:Ljava/util/List;

    .line 590
    if-ge v14, v1, :cond_3

    .line 592
    invoke-interface {v2, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v15

    .line 593
    .local v15, "LSubr":I
    iget-object v1, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, v8

    iget-object v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->SubrsOffsets:[I

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    if-ge v15, v1, :cond_2

    if-ltz v15, :cond_2

    .line 595
    iget-object v1, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, v8

    iget-object v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->SubrsOffsets:[I

    aget v1, v1, v15

    .line 596
    .local v1, "LStart":I
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, v8

    iget-object v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->SubrsOffsets:[I

    add-int/lit8 v3, v15, 0x1

    aget v2, v2, v3

    .line 597
    .local v2, "LEnd":I
    iget v3, v0, Lcom/itextpdf/io/font/CFFFontSubset;->GBias:I

    iget-object v5, v0, Lcom/itextpdf/io/font/CFFFontSubset;->hSubrsUsedNonCID:Ljava/util/Set;

    iget-object v6, v0, Lcom/itextpdf/io/font/CFFFontSubset;->lSubrsUsedNonCID:Ljava/util/List;

    iget-object v7, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v7, v7, v8

    iget-object v7, v7, Lcom/itextpdf/io/font/CFFFont$Font;->SubrsOffsets:[I

    invoke-virtual/range {v0 .. v7}, Lcom/itextpdf/io/font/CFFFontSubset;->ReadASubr(IIIILjava/util/Set;Ljava/util/List;[I)V

    .line 590
    .end local v1    # "LStart":I
    .end local v2    # "LEnd":I
    .end local v15    # "LSubr":I
    :cond_2
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    goto :goto_2

    .line 600
    .end local v14    # "j":I
    :cond_3
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    move v11, v0

    .end local v11    # "SizeOfNonCIDSubrsUsed":I
    .local v0, "SizeOfNonCIDSubrsUsed":I
    goto :goto_3

    .line 580
    .end local v0    # "SizeOfNonCIDSubrsUsed":I
    .end local v4    # "LBias":I
    .end local v13    # "End":I
    .local v9, "LBias":I
    .restart local v11    # "SizeOfNonCIDSubrsUsed":I
    :cond_4
    move v4, v9

    .line 577
    .end local v9    # "LBias":I
    .end local v12    # "Subr":I
    .restart local v4    # "LBias":I
    :cond_5
    :goto_3
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, p0

    move v9, v4

    goto/16 :goto_1

    .line 605
    .end local v4    # "LBias":I
    .end local v10    # "i":I
    .restart local v9    # "LBias":I
    :cond_6
    return-void
.end method

.method protected BuildIndexHeader(III)V
    .locals 3
    .param p1, "Count"    # I
    .param p2, "Offsize"    # I
    .param p3, "First"    # I

    .line 1284
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt16Item;

    int-to-char v2, p1

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt16Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1286
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    int-to-char v2, p2

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1288
    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 1303
    :pswitch_0
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt32Item;

    int-to-char v2, p3

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt32Item;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1304
    goto :goto_0

    .line 1299
    :pswitch_1
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt24Item;

    int-to-char v2, p3

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt24Item;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1300
    goto :goto_0

    .line 1295
    :pswitch_2
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt16Item;

    int-to-char v2, p3

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt16Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1296
    goto :goto_0

    .line 1291
    :pswitch_3
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    int-to-char v2, p3

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1292
    nop

    .line 1308
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected BuildNewCharString(I)V
    .locals 3
    .param p1, "FontIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 416
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/itextpdf/io/font/CFFFont$Font;->charstringsOffsets:[I

    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->GlyphsUsed:Ljava/util/Set;

    const/16 v2, 0xe

    invoke-virtual {p0, v0, v1, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildNewIndex([ILjava/util/Set;B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NewCharStringsIndex:[B

    .line 417
    return-void
.end method

.method protected BuildNewFile(I)[B
    .locals 16
    .param p1, "Font"    # I

    .line 1098
    move-object/from16 v0, p0

    move/from16 v1, p1

    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    .line 1101
    invoke-virtual {v0}, Lcom/itextpdf/io/font/CFFFontSubset;->CopyHeader()V

    .line 1104
    const/4 v2, 0x1

    invoke-virtual {v0, v2, v2, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildIndexHeader(III)V

    .line 1105
    iget-object v3, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v4, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    iget-object v5, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v5, v5, v1

    iget-object v5, v5, Lcom/itextpdf/io/font/CFFFont$Font;->name:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v2

    int-to-char v5, v5

    invoke-direct {v4, v5}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1106
    iget-object v3, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v4, Lcom/itextpdf/io/font/CFFFont$StringItem;

    iget-object v5, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v5, v5, v1

    iget-object v5, v5, Lcom/itextpdf/io/font/CFFFont$Font;->name:Ljava/lang/String;

    invoke-direct {v4, v5}, Lcom/itextpdf/io/font/CFFFont$StringItem;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1109
    const/4 v3, 0x2

    invoke-virtual {v0, v2, v3, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildIndexHeader(III)V

    .line 1110
    new-instance v4, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;

    invoke-direct {v4, v3}, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;-><init>(I)V

    .line 1111
    .local v4, "topdictIndex1Ref":Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    iget-object v3, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1112
    new-instance v3, Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;

    invoke-direct {v3}, Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;-><init>()V

    .line 1113
    .local v3, "topdictBase":Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;
    iget-object v5, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    invoke-virtual {v5, v3}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1116
    new-instance v5, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;

    invoke-direct {v5}, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;-><init>()V

    .line 1117
    .local v5, "charsetRef":Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    new-instance v6, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;

    invoke-direct {v6}, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;-><init>()V

    .line 1118
    .local v6, "charstringsRef":Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    new-instance v7, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;

    invoke-direct {v7}, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;-><init>()V

    .line 1119
    .local v7, "fdarrayRef":Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    new-instance v8, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;

    invoke-direct {v8}, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;-><init>()V

    .line 1120
    .local v8, "fdselectRef":Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    new-instance v9, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;

    invoke-direct {v9}, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;-><init>()V

    .line 1123
    .local v9, "privateRef":Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    iget-object v10, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v10, v10, v1

    iget-boolean v10, v10, Lcom/itextpdf/io/font/CFFFont$Font;->isCID:Z

    const/4 v11, 0x0

    if-nez v10, :cond_0

    .line 1125
    iget-object v10, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v12, Lcom/itextpdf/io/font/CFFFont$DictNumberItem;

    iget-object v13, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v13, v13, v1

    iget v13, v13, Lcom/itextpdf/io/font/CFFFont$Font;->nstrings:I

    invoke-direct {v12, v13}, Lcom/itextpdf/io/font/CFFFont$DictNumberItem;-><init>(I)V

    invoke-virtual {v10, v12}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1126
    iget-object v10, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v12, Lcom/itextpdf/io/font/CFFFont$DictNumberItem;

    iget-object v13, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v13, v13, v1

    iget v13, v13, Lcom/itextpdf/io/font/CFFFont$Font;->nstrings:I

    add-int/2addr v13, v2

    invoke-direct {v12, v13}, Lcom/itextpdf/io/font/CFFFont$DictNumberItem;-><init>(I)V

    invoke-virtual {v10, v12}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1127
    iget-object v10, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v12, Lcom/itextpdf/io/font/CFFFont$DictNumberItem;

    invoke-direct {v12, v11}, Lcom/itextpdf/io/font/CFFFont$DictNumberItem;-><init>(I)V

    invoke-virtual {v10, v12}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1128
    iget-object v10, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v12, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    const/16 v13, 0xc

    invoke-direct {v12, v13}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v10, v12}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1129
    iget-object v10, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v12, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    const/16 v14, 0x1e

    invoke-direct {v12, v14}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v10, v12}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1131
    iget-object v10, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v12, Lcom/itextpdf/io/font/CFFFont$DictNumberItem;

    iget-object v14, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v14, v14, v1

    iget v14, v14, Lcom/itextpdf/io/font/CFFFont$Font;->nglyphs:I

    invoke-direct {v12, v14}, Lcom/itextpdf/io/font/CFFFont$DictNumberItem;-><init>(I)V

    invoke-virtual {v10, v12}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1132
    iget-object v10, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v12, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    invoke-direct {v12, v13}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v10, v12}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1133
    iget-object v10, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v12, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    const/16 v13, 0x22

    invoke-direct {v12, v13}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v10, v12}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1139
    :cond_0
    iget-object v10, v0, Lcom/itextpdf/io/font/CFFFontSubset;->topdictOffsets:[I

    aget v10, v10, v1

    invoke-virtual {v0, v10}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 1141
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v10

    iget-object v12, v0, Lcom/itextpdf/io/font/CFFFontSubset;->topdictOffsets:[I

    add-int/lit8 v13, v1, 0x1

    aget v12, v12, v13

    if-ge v10, v12, :cond_3

    .line 1142
    invoke-virtual {v0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v10

    .line 1143
    .local v10, "p1":I
    invoke-virtual {v0}, Lcom/itextpdf/io/font/CFFFontSubset;->getDictItem()V

    .line 1144
    invoke-virtual {v0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v12

    .line 1146
    .local v12, "p2":I
    const-string v13, "Encoding"

    iget-object v14, v0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_2

    iget-object v13, v0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    .line 1148
    const-string v14, "Private"

    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_2

    iget-object v13, v0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    .line 1149
    const-string v14, "FDSelect"

    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_2

    iget-object v13, v0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    .line 1150
    const-string v14, "FDArray"

    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_2

    iget-object v13, v0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    .line 1151
    const-string v14, "charset"

    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_2

    iget-object v13, v0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    .line 1152
    const-string v14, "CharStrings"

    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    goto :goto_1

    .line 1156
    :cond_1
    iget-object v13, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v14, Lcom/itextpdf/io/font/CFFFont$RangeItem;

    iget-object v15, v0, Lcom/itextpdf/io/font/CFFFontSubset;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    sub-int v2, v12, v10

    invoke-direct {v14, v15, v10, v2}, Lcom/itextpdf/io/font/CFFFont$RangeItem;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)V

    invoke-virtual {v13, v14}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1158
    .end local v10    # "p1":I
    .end local v12    # "p2":I
    :cond_2
    :goto_1
    const/4 v2, 0x1

    goto :goto_0

    .line 1160
    :cond_3
    invoke-virtual {v0, v7, v8, v5, v6}, Lcom/itextpdf/io/font/CFFFontSubset;->CreateKeys(Lcom/itextpdf/io/font/CFFFont$OffsetItem;Lcom/itextpdf/io/font/CFFFont$OffsetItem;Lcom/itextpdf/io/font/CFFFont$OffsetItem;Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V

    .line 1163
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v10, Lcom/itextpdf/io/font/CFFFont$IndexMarkerItem;

    invoke-direct {v10, v4, v3}, Lcom/itextpdf/io/font/CFFFont$IndexMarkerItem;-><init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;)V

    invoke-virtual {v2, v10}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1167
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, v1

    iget-boolean v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->isCID:Z

    if-eqz v2, :cond_4

    .line 1168
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    iget v10, v0, Lcom/itextpdf/io/font/CFFFontSubset;->stringIndexOffset:I

    invoke-virtual {v0, v10}, Lcom/itextpdf/io/font/CFFFontSubset;->getEntireIndexRange(I)Lcom/itextpdf/io/font/CFFFont$RangeItem;

    move-result-object v10

    invoke-virtual {v2, v10}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto :goto_2

    .line 1173
    :cond_4
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/io/font/CFFFontSubset;->CreateNewStringIndex(I)V

    .line 1176
    :goto_2
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v10, Lcom/itextpdf/io/font/CFFFont$RangeItem;

    new-instance v12, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v13, v0, Lcom/itextpdf/io/font/CFFFontSubset;->rasFactory:Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    iget-object v14, v0, Lcom/itextpdf/io/font/CFFFontSubset;->NewGSubrsIndex:[B

    invoke-virtual {v13, v14}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v13

    invoke-direct {v12, v13}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    iget-object v13, v0, Lcom/itextpdf/io/font/CFFFontSubset;->NewGSubrsIndex:[B

    array-length v13, v13

    invoke-direct {v10, v12, v11, v13}, Lcom/itextpdf/io/font/CFFFont$RangeItem;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)V

    invoke-virtual {v2, v10}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1180
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, v1

    iget-boolean v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->isCID:Z

    if-eqz v2, :cond_7

    .line 1185
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v10, Lcom/itextpdf/io/font/CFFFont$MarkerItem;

    invoke-direct {v10, v8}, Lcom/itextpdf/io/font/CFFFont$MarkerItem;-><init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V

    invoke-virtual {v2, v10}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1187
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, v1

    iget v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->fdselectOffset:I

    if-ltz v2, :cond_5

    .line 1188
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v10, Lcom/itextpdf/io/font/CFFFont$RangeItem;

    iget-object v12, v0, Lcom/itextpdf/io/font/CFFFontSubset;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v13, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v13, v13, v1

    iget v13, v13, Lcom/itextpdf/io/font/CFFFont$Font;->fdselectOffset:I

    iget-object v14, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v14, v14, v1

    iget v14, v14, Lcom/itextpdf/io/font/CFFFont$Font;->FDSelectLength:I

    invoke-direct {v10, v12, v13, v14}, Lcom/itextpdf/io/font/CFFFont$RangeItem;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)V

    invoke-virtual {v2, v10}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto :goto_3

    .line 1191
    :cond_5
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, v1

    iget v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->nglyphs:I

    invoke-virtual {v0, v8, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->CreateFDSelect(Lcom/itextpdf/io/font/CFFFont$OffsetItem;I)V

    .line 1195
    :goto_3
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v10, Lcom/itextpdf/io/font/CFFFont$MarkerItem;

    invoke-direct {v10, v5}, Lcom/itextpdf/io/font/CFFFont$MarkerItem;-><init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V

    invoke-virtual {v2, v10}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1196
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v10, Lcom/itextpdf/io/font/CFFFont$RangeItem;

    iget-object v12, v0, Lcom/itextpdf/io/font/CFFFontSubset;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v13, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v13, v13, v1

    iget v13, v13, Lcom/itextpdf/io/font/CFFFont$Font;->charsetOffset:I

    iget-object v14, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v14, v14, v1

    iget v14, v14, Lcom/itextpdf/io/font/CFFFont$Font;->CharsetLength:I

    invoke-direct {v10, v12, v13, v14}, Lcom/itextpdf/io/font/CFFFont$RangeItem;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)V

    invoke-virtual {v2, v10}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1200
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, v1

    iget v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->fdarrayOffset:I

    if-ltz v2, :cond_6

    .line 1202
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v10, Lcom/itextpdf/io/font/CFFFont$MarkerItem;

    invoke-direct {v10, v7}, Lcom/itextpdf/io/font/CFFFont$MarkerItem;-><init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V

    invoke-virtual {v2, v10}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1204
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/io/font/CFFFontSubset;->Reconstruct(I)V

    goto :goto_4

    .line 1207
    :cond_6
    invoke-virtual {v0, v7, v9, v1}, Lcom/itextpdf/io/font/CFFFontSubset;->CreateFDArray(Lcom/itextpdf/io/font/CFFFont$OffsetItem;Lcom/itextpdf/io/font/CFFFont$OffsetItem;I)V

    goto :goto_4

    .line 1213
    :cond_7
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, v1

    iget v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->nglyphs:I

    invoke-virtual {v0, v8, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->CreateFDSelect(Lcom/itextpdf/io/font/CFFFont$OffsetItem;I)V

    .line 1215
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, v1

    iget v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->nglyphs:I

    invoke-virtual {v0, v5, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->CreateCharset(Lcom/itextpdf/io/font/CFFFont$OffsetItem;I)V

    .line 1217
    invoke-virtual {v0, v7, v9, v1}, Lcom/itextpdf/io/font/CFFFontSubset;->CreateFDArray(Lcom/itextpdf/io/font/CFFFont$OffsetItem;Lcom/itextpdf/io/font/CFFFont$OffsetItem;I)V

    .line 1221
    :goto_4
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, v1

    iget v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->privateOffset:I

    if-ltz v2, :cond_8

    .line 1223
    new-instance v2, Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;

    invoke-direct {v2}, Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;-><init>()V

    .line 1224
    .local v2, "PrivateBase":Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;
    iget-object v10, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    invoke-virtual {v10, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1225
    iget-object v10, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v12, Lcom/itextpdf/io/font/CFFFont$MarkerItem;

    invoke-direct {v12, v9}, Lcom/itextpdf/io/font/CFFFont$MarkerItem;-><init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V

    invoke-virtual {v10, v12}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1227
    new-instance v10, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;

    invoke-direct {v10}, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;-><init>()V

    .line 1229
    .local v10, "Subr":Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    invoke-virtual {v0, v1, v10}, Lcom/itextpdf/io/font/CFFFontSubset;->CreateNonCIDPrivate(ILcom/itextpdf/io/font/CFFFont$OffsetItem;)V

    .line 1231
    invoke-virtual {v0, v1, v2, v10}, Lcom/itextpdf/io/font/CFFFontSubset;->CreateNonCIDSubrs(ILcom/itextpdf/io/font/CFFFont$IndexBaseItem;Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V

    .line 1235
    .end local v2    # "PrivateBase":Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;
    .end local v10    # "Subr":Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    :cond_8
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v10, Lcom/itextpdf/io/font/CFFFont$MarkerItem;

    invoke-direct {v10, v6}, Lcom/itextpdf/io/font/CFFFont$MarkerItem;-><init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V

    invoke-virtual {v2, v10}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1238
    iget-object v2, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v10, Lcom/itextpdf/io/font/CFFFont$RangeItem;

    new-instance v12, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v13, v0, Lcom/itextpdf/io/font/CFFFontSubset;->rasFactory:Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    iget-object v14, v0, Lcom/itextpdf/io/font/CFFFontSubset;->NewCharStringsIndex:[B

    invoke-virtual {v13, v14}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v13

    invoke-direct {v12, v13}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    iget-object v13, v0, Lcom/itextpdf/io/font/CFFFontSubset;->NewCharStringsIndex:[B

    array-length v13, v13

    invoke-direct {v10, v12, v11, v13}, Lcom/itextpdf/io/font/CFFFont$RangeItem;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)V

    invoke-virtual {v2, v10}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1241
    const/4 v2, 0x1

    new-array v2, v2, [I

    .line 1242
    .local v2, "currentOffset":[I
    aput v11, v2, v11

    .line 1244
    iget-object v10, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    invoke-virtual {v10}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_5
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_9

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/io/font/CFFFont$Item;

    .line 1245
    .local v12, "item":Lcom/itextpdf/io/font/CFFFont$Item;
    invoke-virtual {v12, v2}, Lcom/itextpdf/io/font/CFFFont$Item;->increment([I)V

    .line 1246
    .end local v12    # "item":Lcom/itextpdf/io/font/CFFFont$Item;
    goto :goto_5

    .line 1248
    :cond_9
    iget-object v10, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    invoke-virtual {v10}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_6
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_a

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/io/font/CFFFont$Item;

    .line 1249
    .restart local v12    # "item":Lcom/itextpdf/io/font/CFFFont$Item;
    invoke-virtual {v12}, Lcom/itextpdf/io/font/CFFFont$Item;->xref()V

    .line 1250
    .end local v12    # "item":Lcom/itextpdf/io/font/CFFFont$Item;
    goto :goto_6

    .line 1252
    :cond_a
    aget v10, v2, v11

    .line 1253
    .local v10, "size":I
    new-array v11, v10, [B

    .line 1256
    .local v11, "b":[B
    iget-object v12, v0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    invoke-virtual {v12}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_7
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_b

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/io/font/CFFFont$Item;

    .line 1257
    .local v13, "item":Lcom/itextpdf/io/font/CFFFont$Item;
    invoke-virtual {v13, v11}, Lcom/itextpdf/io/font/CFFFont$Item;->emit([B)V

    .line 1258
    .end local v13    # "item":Lcom/itextpdf/io/font/CFFFont$Item;
    goto :goto_7

    .line 1260
    :cond_b
    return-object v11
.end method

.method protected BuildNewIndex([ILjava/util/Set;B)[B
    .locals 11
    .param p1, "Offsets"    # [I
    .param p3, "OperatorForUnusedEntries"    # B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;B)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 945
    .local p2, "Used":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    .line 946
    .local v0, "unusedCount":I
    const/4 v1, 0x0

    .line 947
    .local v1, "Offset":I
    array-length v2, p1

    new-array v2, v2, [I

    .line 949
    .local v2, "NewOffsets":[I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, p1

    if-ge v3, v4, :cond_1

    .line 950
    aput v1, v2, v3

    .line 953
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {p2, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 954
    add-int/lit8 v4, v3, 0x1

    aget v4, p1, v4

    aget v5, p1, v3

    sub-int/2addr v4, v5

    add-int/2addr v1, v4

    goto :goto_1

    .line 957
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 949
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 961
    .end local v3    # "i":I
    :cond_1
    add-int v3, v1, v0

    new-array v3, v3, [B

    .line 963
    .local v3, "NewObjects":[B
    const/4 v4, 0x0

    .line 964
    .local v4, "unusedOffset":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    array-length v6, p1

    add-int/lit8 v6, v6, -0x1

    if-ge v5, v6, :cond_3

    .line 965
    aget v6, v2, v5

    .line 966
    .local v6, "start":I
    add-int/lit8 v7, v5, 0x1

    aget v7, v2, v7

    .line 967
    .local v7, "end":I
    add-int v8, v6, v4

    aput v8, v2, v5

    .line 970
    if-eq v6, v7, :cond_2

    .line 973
    iget-object v8, p0, Lcom/itextpdf/io/font/CFFFontSubset;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v9, p1, v5

    int-to-long v9, v9

    invoke-virtual {v8, v9, v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 975
    iget-object v8, p0, Lcom/itextpdf/io/font/CFFFontSubset;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    add-int v9, v6, v4

    sub-int v10, v7, v6

    invoke-virtual {v8, v3, v9, v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([BII)V

    goto :goto_3

    .line 977
    :cond_2
    add-int v8, v6, v4

    aput-byte p3, v3, v8

    .line 978
    add-int/lit8 v4, v4, 0x1

    .line 964
    .end local v6    # "start":I
    .end local v7    # "end":I
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 981
    .end local v5    # "i":I
    :cond_3
    array-length v5, p1

    add-int/lit8 v5, v5, -0x1

    aget v6, v2, v5

    add-int/2addr v6, v4

    aput v6, v2, v5

    .line 983
    invoke-virtual {p0, v2, v3}, Lcom/itextpdf/io/font/CFFFontSubset;->AssembleIndex([I[B)[B

    move-result-object v5

    return-object v5
.end method

.method protected BuildNewIndexAndCopyAllGSubrs([IB)[B
    .locals 11
    .param p1, "Offsets"    # [I
    .param p2, "OperatorForUnusedEntries"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 996
    const/4 v0, 0x0

    .line 997
    .local v0, "unusedCount":I
    const/4 v1, 0x0

    .line 998
    .local v1, "Offset":I
    array-length v2, p1

    new-array v2, v2, [I

    .line 1000
    .local v2, "NewOffsets":[I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, p1

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_0

    .line 1001
    aput v1, v2, v3

    .line 1002
    add-int/lit8 v4, v3, 0x1

    aget v4, p1, v4

    aget v5, p1, v3

    sub-int/2addr v4, v5

    add-int/2addr v1, v4

    .line 1000
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1005
    .end local v3    # "i":I
    :cond_0
    array-length v3, p1

    add-int/lit8 v3, v3, -0x1

    aput v1, v2, v3

    .line 1006
    add-int/lit8 v0, v0, 0x1

    .line 1009
    add-int v3, v1, v0

    new-array v3, v3, [B

    .line 1011
    .local v3, "NewObjects":[B
    const/4 v4, 0x0

    .line 1012
    .local v4, "unusedOffset":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    array-length v6, p1

    add-int/lit8 v6, v6, -0x1

    if-ge v5, v6, :cond_2

    .line 1013
    aget v6, v2, v5

    .line 1014
    .local v6, "start":I
    add-int/lit8 v7, v5, 0x1

    aget v7, v2, v7

    .line 1015
    .local v7, "end":I
    add-int v8, v6, v4

    aput v8, v2, v5

    .line 1018
    if-eq v6, v7, :cond_1

    .line 1021
    iget-object v8, p0, Lcom/itextpdf/io/font/CFFFontSubset;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v9, p1, v5

    int-to-long v9, v9

    invoke-virtual {v8, v9, v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 1023
    iget-object v8, p0, Lcom/itextpdf/io/font/CFFFontSubset;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    add-int v9, v6, v4

    sub-int v10, v7, v6

    invoke-virtual {v8, v3, v9, v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([BII)V

    goto :goto_2

    .line 1025
    :cond_1
    add-int v8, v6, v4

    aput-byte p2, v3, v8

    .line 1026
    add-int/lit8 v4, v4, 0x1

    .line 1012
    .end local v6    # "start":I
    .end local v7    # "end":I
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1029
    .end local v5    # "i":I
    :cond_2
    array-length v5, p1

    add-int/lit8 v5, v5, -0x1

    aget v6, v2, v5

    add-int/2addr v6, v4

    aput v6, v2, v5

    .line 1031
    invoke-virtual {p0, v2, v3}, Lcom/itextpdf/io/font/CFFFontSubset;->AssembleIndex([I[B)[B

    move-result-object v5

    return-object v5
.end method

.method protected BuildNewLGSubrs(I)V
    .locals 10
    .param p1, "Font"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 430
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    iget-boolean v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->isCID:Z

    const/16 v7, 0xb

    if-eqz v2, :cond_2

    .line 433
    new-instance v2, Lcom/itextpdf/io/util/GenericArray;

    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateOffsets:[I

    array-length v3, v3

    invoke-direct {v2, v3}, Lcom/itextpdf/io/util/GenericArray;-><init>(I)V

    iput-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->hSubrsUsed:Lcom/itextpdf/io/util/GenericArray;

    .line 434
    new-instance v2, Lcom/itextpdf/io/util/GenericArray;

    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateOffsets:[I

    array-length v3, v3

    invoke-direct {v2, v3}, Lcom/itextpdf/io/util/GenericArray;-><init>(I)V

    iput-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->lSubrsUsed:Lcom/itextpdf/io/util/GenericArray;

    .line 436
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    iget-object v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateOffsets:[I

    array-length v2, v2

    new-array v2, v2, [[B

    iput-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NewLSubrsIndex:[[B

    .line 438
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateOffsets:[I

    array-length v3, v3

    new-array v3, v3, [I

    iput-object v3, v2, Lcom/itextpdf/io/font/CFFFont$Font;->PrivateSubrsOffset:[I

    .line 440
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateOffsets:[I

    array-length v3, v3

    new-array v3, v3, [[I

    iput-object v3, v2, Lcom/itextpdf/io/font/CFFFont$Font;->PrivateSubrsOffsetsArray:[[I

    .line 443
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->FDArrayUsed:Ljava/util/Set;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v8, v2

    .line 445
    .local v8, "FDInList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v2, 0x0

    move v9, v2

    .local v9, "j":I
    :goto_0
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v2

    if-ge v9, v2, :cond_1

    .line 447
    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 448
    .local v2, "FD":I
    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->hSubrsUsed:Lcom/itextpdf/io/util/GenericArray;

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v3, v2, v4}, Lcom/itextpdf/io/util/GenericArray;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 449
    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->lSubrsUsed:Lcom/itextpdf/io/util/GenericArray;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v2, v4}, Lcom/itextpdf/io/util/GenericArray;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 452
    invoke-virtual {p0, p1, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildFDSubrsOffsets(II)V

    .line 454
    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/itextpdf/io/font/CFFFont$Font;->PrivateSubrsOffset:[I

    aget v3, v3, v2

    if-ltz v3, :cond_0

    .line 457
    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/itextpdf/io/font/CFFFont$Font;->PrivateSubrsOffset:[I

    aget v3, v3, v2

    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v4, v4, p1

    iget-object v4, v4, Lcom/itextpdf/io/font/CFFFont$Font;->PrivateSubrsOffsetsArray:[[I

    aget-object v4, v4, v2

    iget-object v5, p0, Lcom/itextpdf/io/font/CFFFontSubset;->hSubrsUsed:Lcom/itextpdf/io/util/GenericArray;

    invoke-virtual {v5, v2}, Lcom/itextpdf/io/util/GenericArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Set;

    iget-object v6, p0, Lcom/itextpdf/io/font/CFFFontSubset;->lSubrsUsed:Lcom/itextpdf/io/util/GenericArray;

    invoke-virtual {v6, v2}, Lcom/itextpdf/io/util/GenericArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    move-object v0, p0

    move v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildSubrUsed(III[ILjava/util/Set;Ljava/util/List;)V

    .line 459
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NewLSubrsIndex:[[B

    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/itextpdf/io/font/CFFFont$Font;->PrivateSubrsOffsetsArray:[[I

    aget-object v3, v3, v2

    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->hSubrsUsed:Lcom/itextpdf/io/util/GenericArray;

    invoke-virtual {v4, v2}, Lcom/itextpdf/io/util/GenericArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Set;

    invoke-virtual {p0, v3, v4, v7}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildNewIndex([ILjava/util/Set;B)[B

    move-result-object v3

    aput-object v3, v1, v2

    .line 445
    .end local v2    # "FD":I
    :cond_0
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 462
    .end local v8    # "FDInList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v9    # "j":I
    :cond_1
    goto :goto_1

    .line 464
    :cond_2
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->privateSubrs:I

    if-ltz v1, :cond_3

    .line 466
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    iget v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->privateSubrs:I

    invoke-virtual {p0, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->getIndex(I)[I

    move-result-object v2

    iput-object v2, v1, Lcom/itextpdf/io/font/CFFFont$Font;->SubrsOffsets:[I

    .line 469
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget v3, v1, Lcom/itextpdf/io/font/CFFFont$Font;->privateSubrs:I

    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget-object v4, v1, Lcom/itextpdf/io/font/CFFFont$Font;->SubrsOffsets:[I

    iget-object v5, p0, Lcom/itextpdf/io/font/CFFFontSubset;->hSubrsUsedNonCID:Ljava/util/Set;

    iget-object v6, p0, Lcom/itextpdf/io/font/CFFFontSubset;->lSubrsUsedNonCID:Ljava/util/List;

    const/4 v2, -0x1

    move-object v0, p0

    move v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildSubrUsed(III[ILjava/util/Set;Ljava/util/List;)V

    .line 473
    :cond_3
    :goto_1
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildGSubrsUsed(I)V

    .line 474
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->privateSubrs:I

    if-ltz v1, :cond_4

    .line 476
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget-object v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->SubrsOffsets:[I

    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->hSubrsUsedNonCID:Ljava/util/Set;

    invoke-virtual {p0, v1, v2, v7}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildNewIndex([ILjava/util/Set;B)[B

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NewSubrsIndexNonCID:[B

    .line 483
    :cond_4
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->gsubrOffsets:[I

    invoke-virtual {p0, v1, v7}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildNewIndexAndCopyAllGSubrs([IB)[B

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NewGSubrsIndex:[B

    .line 484
    return-void
.end method

.method protected BuildSubrUsed(III[ILjava/util/Set;Ljava/util/List;)V
    .locals 15
    .param p1, "Font"    # I
    .param p2, "FD"    # I
    .param p3, "SubrOffset"    # I
    .param p4, "SubrsOffsets"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III[I",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 525
    .local p5, "hSubr":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .local p6, "lSubr":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move/from16 v0, p1

    move/from16 v1, p2

    move/from16 v10, p3

    invoke-virtual {p0, v10, v0}, Lcom/itextpdf/io/font/CFFFontSubset;->CalcBias(II)I

    move-result v6

    .line 528
    .local v6, "LBias":I
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->glyphsInList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Ljava/lang/Integer;

    .line 529
    .local v12, "usedGlyph":Ljava/lang/Integer;
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v13

    .line 530
    .local v13, "glyph":I
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, v0

    iget-object v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->charstringsOffsets:[I

    aget v3, v2, v13

    .line 531
    .local v3, "Start":I
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, v0

    iget-object v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->charstringsOffsets:[I

    add-int/lit8 v4, v13, 0x1

    aget v4, v2, v4

    .line 534
    .local v4, "End":I
    if-ltz v1, :cond_1

    .line 535
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->EmptyStack()V

    .line 536
    const/4 v2, 0x0

    iput v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NumOfHints:I

    .line 538
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, v0

    iget-object v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->FDSelect:[I

    aget v14, v2, v13

    .line 540
    .local v14, "GlyphFD":I
    if-ne v14, v1, :cond_0

    .line 542
    iget v5, p0, Lcom/itextpdf/io/font/CFFFontSubset;->GBias:I

    move-object v2, p0

    move-object/from16 v9, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    invoke-virtual/range {v2 .. v9}, Lcom/itextpdf/io/font/CFFFontSubset;->ReadASubr(IIIILjava/util/Set;Ljava/util/List;[I)V

    .line 543
    .end local v14    # "GlyphFD":I
    :cond_0
    move-object/from16 v9, p4

    goto :goto_1

    .line 546
    :cond_1
    iget v5, p0, Lcom/itextpdf/io/font/CFFFontSubset;->GBias:I

    move-object v2, p0

    move-object/from16 v9, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    invoke-virtual/range {v2 .. v9}, Lcom/itextpdf/io/font/CFFFontSubset;->ReadASubr(IIIILjava/util/Set;Ljava/util/List;[I)V

    .line 547
    .end local v3    # "Start":I
    .end local v4    # "End":I
    .end local v12    # "usedGlyph":Ljava/lang/Integer;
    .end local v13    # "glyph":I
    :goto_1
    goto :goto_0

    .line 549
    :cond_2
    move-object/from16 v9, p4

    const/4 v3, 0x0

    move v11, v3

    .local v11, "i":I
    :goto_2
    invoke-interface/range {p6 .. p6}, Ljava/util/List;->size()I

    move-result v3

    if-ge v11, v3, :cond_4

    .line 551
    move-object/from16 v8, p6

    invoke-interface {v8, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v12

    .line 553
    .local v12, "Subr":I
    array-length v3, v9

    add-int/lit8 v3, v3, -0x1

    if-ge v12, v3, :cond_3

    if-ltz v12, :cond_3

    .line 555
    aget v3, v9, v12

    .line 556
    .restart local v3    # "Start":I
    add-int/lit8 v4, v12, 0x1

    aget v4, v9, v4

    .line 557
    .restart local v4    # "End":I
    iget v5, p0, Lcom/itextpdf/io/font/CFFFontSubset;->GBias:I

    move-object v2, p0

    move-object/from16 v7, p5

    invoke-virtual/range {v2 .. v9}, Lcom/itextpdf/io/font/CFFFontSubset;->ReadASubr(IIIILjava/util/Set;Ljava/util/List;[I)V

    .line 549
    .end local v3    # "Start":I
    .end local v4    # "End":I
    .end local v12    # "Subr":I
    :cond_3
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v9, p4

    goto :goto_2

    .line 560
    .end local v11    # "i":I
    :cond_4
    return-void
.end method

.method protected CalcBias(II)I
    .locals 3
    .param p1, "Offset"    # I
    .param p2, "Font"    # I

    .line 395
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 396
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard16()C

    move-result v0

    .line 398
    .local v0, "nSubrs":I
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p2

    iget v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->CharstringType:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 399
    const/4 v1, 0x0

    return v1

    .line 401
    :cond_0
    const/16 v1, 0x4d8

    if-ge v0, v1, :cond_1

    .line 402
    const/16 v1, 0x6b

    return v1

    .line 403
    :cond_1
    const v1, 0x846c

    if-ge v0, v1, :cond_2

    .line 404
    const/16 v1, 0x46b

    return v1

    .line 406
    :cond_2
    const v1, 0x8000

    return v1
.end method

.method protected CalcHints(IIII[I)I
    .locals 10
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "LBias"    # I
    .param p4, "GBias"    # I
    .param p5, "LSubrsOffsets"    # [I

    .line 879
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 880
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v1

    if-ge v1, p2, :cond_7

    .line 882
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->ReadCommand()V

    .line 883
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v6

    .line 884
    .local v6, "pos":I
    const/4 v1, 0x0

    .line 885
    .local v1, "TopElement":Ljava/lang/Object;
    iget v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    const/4 v3, 0x1

    if-lez v2, :cond_0

    .line 886
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->args:[Ljava/lang/Object;

    iget v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    sub-int/2addr v4, v3

    aget-object v1, v2, v4

    move-object v7, v1

    goto :goto_1

    .line 885
    :cond_0
    move-object v7, v1

    .line 887
    .end local v1    # "TopElement":Ljava/lang/Object;
    .local v7, "TopElement":Ljava/lang/Object;
    :goto_1
    iget v8, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    .line 889
    .local v8, "NumOfArgs":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->HandelStack()V

    .line 891
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_1
    goto :goto_2

    :sswitch_0
    const-string v2, "hstemhm"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v3, 0x4

    goto :goto_3

    :sswitch_1
    const-string/jumbo v2, "vstemhm"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v3, 0x5

    goto :goto_3

    :sswitch_2
    const-string/jumbo v2, "vstem"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v3, 0x3

    goto :goto_3

    :sswitch_3
    const-string v2, "hstem"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v3, 0x2

    goto :goto_3

    :sswitch_4
    const-string v2, "callsubr"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v3, 0x0

    goto :goto_3

    :sswitch_5
    const-string v2, "callgsubr"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_3

    :sswitch_6
    const-string v2, "cntrmask"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v3, 0x7

    goto :goto_3

    :sswitch_7
    const-string v2, "hintmask"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v3, 0x6

    goto :goto_3

    :goto_2
    const/4 v3, -0x1

    :goto_3
    packed-switch v3, :pswitch_data_0

    goto/16 :goto_5

    .line 920
    :pswitch_0
    iget v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NumOfHints:I

    div-int/lit8 v1, v1, 0x8

    .line 921
    .local v1, "SizeOfMask":I
    iget v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NumOfHints:I

    rem-int/lit8 v2, v2, 0x8

    if-nez v2, :cond_2

    if-nez v1, :cond_3

    .line 922
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 924
    :cond_3
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    if-ge v2, v1, :cond_6

    .line 925
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    .line 924
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 915
    .end local v1    # "SizeOfMask":I
    .end local v2    # "i":I
    :pswitch_1
    iget v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NumOfHints:I

    div-int/lit8 v2, v8, 0x2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NumOfHints:I

    .line 916
    goto :goto_5

    .line 903
    :pswitch_2
    if-lez v8, :cond_6

    .line 904
    instance-of v1, v7, Ljava/lang/Integer;

    if-eqz v1, :cond_4

    .line 905
    move-object v1, v7

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int v9, v1, p4

    .line 906
    .local v9, "Subr":I
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->gsubrOffsets:[I

    aget v1, v1, v9

    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->gsubrOffsets:[I

    add-int/lit8 v3, v9, 0x1

    aget v2, v2, v3

    move-object v0, p0

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/io/font/CFFFontSubset;->CalcHints(IIII[I)I

    .line 907
    invoke-virtual {p0, v6}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 908
    .end local v9    # "Subr":I
    goto :goto_5

    .line 904
    :cond_4
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 894
    :pswitch_3
    if-lez v8, :cond_6

    .line 895
    instance-of v1, v7, Ljava/lang/Integer;

    if-eqz v1, :cond_5

    .line 896
    move-object v1, v7

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int v9, v1, p3

    .line 897
    .restart local v9    # "Subr":I
    aget v1, p5, v9

    add-int/lit8 v2, v9, 0x1

    aget v2, p5, v2

    move-object v0, p0

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/io/font/CFFFontSubset;->CalcHints(IIII[I)I

    .line 898
    invoke-virtual {p0, v6}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 899
    .end local v9    # "Subr":I
    goto :goto_5

    .line 895
    :cond_5
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 929
    .end local v6    # "pos":I
    .end local v7    # "TopElement":Ljava/lang/Object;
    .end local v8    # "NumOfArgs":I
    :cond_6
    :goto_5
    goto/16 :goto_0

    .line 930
    :cond_7
    iget v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NumOfHints:I

    return v1

    :sswitch_data_0
    .sparse-switch
        -0x57ccb60d -> :sswitch_7
        -0x4c92896b -> :sswitch_6
        -0x3de93085 -> :sswitch_5
        -0xa3bda70 -> :sswitch_4
        0x5ef9331 -> :sswitch_3
        0x6b4dc3f -> :sswitch_2
        0x2ceed584 -> :sswitch_1
        0x485797f6 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method CalcSubrOffsetSize(II)I
    .locals 5
    .param p1, "Offset"    # I
    .param p2, "Size"    # I

    .line 1618
    const/4 v0, 0x0

    .line 1620
    .local v0, "OffsetSize":I
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 1622
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v1

    add-int v2, p1, p2

    if-ge v1, v2, :cond_1

    .line 1623
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v1

    .line 1624
    .local v1, "p1":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getDictItem()V

    .line 1625
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v2

    .line 1627
    .local v2, "p2":I
    const-string v3, "Subrs"

    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1629
    sub-int v3, v2, v1

    add-int/lit8 v3, v3, -0x1

    move v0, v3

    .line 1632
    .end local v1    # "p1":I
    .end local v2    # "p2":I
    :cond_0
    goto :goto_0

    .line 1634
    :cond_1
    return v0
.end method

.method protected CopyHeader()V
    .locals 8

    .line 1267
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 1268
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v1

    .line 1269
    .local v1, "major":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v2

    .line 1270
    .local v2, "minor":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v3

    .line 1271
    .local v3, "hdrSize":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v4

    .line 1272
    .local v4, "offSize":I
    iget-object v5, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v6, Lcom/itextpdf/io/font/CFFFont$RangeItem;

    iget-object v7, p0, Lcom/itextpdf/io/font/CFFFontSubset;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-direct {v6, v7, v0, v3}, Lcom/itextpdf/io/font/CFFFont$RangeItem;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)V

    invoke-virtual {v5, v6}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1273
    return-void
.end method

.method CountCharset(II)I
    .locals 4
    .param p1, "Offset"    # I
    .param p2, "NumofGlyphs"    # I

    .line 204
    const/4 v0, 0x0

    .line 205
    .local v0, "Length":I
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 207
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v1

    .line 209
    .local v1, "format":I
    const/4 v2, 0x1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 217
    :pswitch_0
    const/4 v3, 0x2

    invoke-virtual {p0, p2, v3}, Lcom/itextpdf/io/font/CFFFontSubset;->CountRange(II)I

    move-result v3

    mul-int/lit8 v3, v3, 0x4

    add-int/lit8 v0, v3, 0x1

    .line 218
    goto :goto_0

    .line 214
    :pswitch_1
    invoke-virtual {p0, p2, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->CountRange(II)I

    move-result v3

    mul-int/lit8 v3, v3, 0x3

    add-int/lit8 v0, v3, 0x1

    .line 215
    goto :goto_0

    .line 211
    :pswitch_2
    mul-int/lit8 v3, p2, 0x2

    add-int/lit8 v0, v3, 0x1

    .line 212
    nop

    .line 222
    :goto_0
    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method CountRange(II)I
    .locals 5
    .param p1, "NumofGlyphs"    # I
    .param p2, "Type"    # I

    .line 233
    const/4 v0, 0x0

    .line 235
    .local v0, "num":I
    const/4 v1, 0x1

    .line 236
    .local v1, "i":I
    :goto_0
    if-ge v1, p1, :cond_1

    .line 237
    add-int/lit8 v0, v0, 0x1

    .line 238
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard16()C

    move-result v2

    .line 239
    .local v2, "Sid":C
    const/4 v3, 0x1

    if-ne p2, v3, :cond_0

    .line 240
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v3

    .local v3, "nLeft":I
    goto :goto_1

    .line 242
    .end local v3    # "nLeft":I
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard16()C

    move-result v3

    .line 243
    .restart local v3    # "nLeft":I
    :goto_1
    add-int/lit8 v4, v3, 0x1

    add-int/2addr v1, v4

    goto :goto_0

    .line 245
    .end local v2    # "Sid":C
    .end local v3    # "nLeft":I
    :cond_1
    return v0
.end method

.method protected CreateCharset(Lcom/itextpdf/io/font/CFFFont$OffsetItem;I)V
    .locals 3
    .param p1, "charsetRef"    # Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    .param p2, "nglyphs"    # I

    .line 1409
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$MarkerItem;

    invoke-direct {v1, p1}, Lcom/itextpdf/io/font/CFFFont$MarkerItem;-><init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1411
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1413
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt16Item;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt16Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1425
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt16Item;

    add-int/lit8 v2, p2, -0x2

    int-to-char v2, v2

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt16Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1426
    return-void
.end method

.method protected CreateFDArray(Lcom/itextpdf/io/font/CFFFont$OffsetItem;Lcom/itextpdf/io/font/CFFFont$OffsetItem;I)V
    .locals 7
    .param p1, "fdarrayRef"    # Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    .param p2, "privateRef"    # Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    .param p3, "Font"    # I

    .line 1438
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$MarkerItem;

    invoke-direct {v1, p1}, Lcom/itextpdf/io/font/CFFFont$MarkerItem;-><init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1440
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0, v0}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildIndexHeader(III)V

    .line 1443
    new-instance v1, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;

    invoke-direct {v1, v0}, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;-><init>(I)V

    .line 1444
    .local v1, "privateIndex1Ref":Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1445
    new-instance v0, Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;

    invoke-direct {v0}, Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;-><init>()V

    .line 1447
    .local v0, "privateBase":Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1450
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p3

    iget v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->privateLength:I

    .line 1452
    .local v2, "NewSize":I
    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v3, v3, p3

    iget v3, v3, Lcom/itextpdf/io/font/CFFFont$Font;->privateOffset:I

    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v4, v4, p3

    iget v4, v4, Lcom/itextpdf/io/font/CFFFont$Font;->privateLength:I

    invoke-virtual {p0, v3, v4}, Lcom/itextpdf/io/font/CFFFontSubset;->CalcSubrOffsetSize(II)I

    move-result v3

    .line 1454
    .local v3, "OrgSubrsOffsetSize":I
    if-eqz v3, :cond_0

    .line 1455
    rsub-int/lit8 v4, v3, 0x5

    add-int/2addr v2, v4

    .line 1456
    :cond_0
    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v5, Lcom/itextpdf/io/font/CFFFont$DictNumberItem;

    invoke-direct {v5, v2}, Lcom/itextpdf/io/font/CFFFont$DictNumberItem;-><init>(I)V

    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1457
    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    invoke-virtual {v4, p2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1459
    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v5, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    const/16 v6, 0x12

    invoke-direct {v5, v6}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1461
    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v5, Lcom/itextpdf/io/font/CFFFont$IndexMarkerItem;

    invoke-direct {v5, v1, v0}, Lcom/itextpdf/io/font/CFFFont$IndexMarkerItem;-><init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;)V

    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1462
    return-void
.end method

.method protected CreateFDSelect(Lcom/itextpdf/io/font/CFFFont$OffsetItem;I)V
    .locals 3
    .param p1, "fdselectRef"    # Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    .param p2, "nglyphs"    # I

    .line 1386
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$MarkerItem;

    invoke-direct {v1, p1}, Lcom/itextpdf/io/font/CFFFont$MarkerItem;-><init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1388
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1390
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt16Item;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt16Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1393
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt16Item;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt16Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1395
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1398
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt16Item;

    int-to-char v2, p2

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt16Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1399
    return-void
.end method

.method protected CreateKeys(Lcom/itextpdf/io/font/CFFFont$OffsetItem;Lcom/itextpdf/io/font/CFFFont$OffsetItem;Lcom/itextpdf/io/font/CFFFont$OffsetItem;Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V
    .locals 4
    .param p1, "fdarrayRef"    # Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    .param p2, "fdselectRef"    # Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    .param p3, "charsetRef"    # Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    .param p4, "charstringsRef"    # Lcom/itextpdf/io/font/CFFFont$OffsetItem;

    .line 1320
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1321
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    const/16 v2, 0xc

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1322
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    const/16 v3, 0x24

    invoke-direct {v1, v3}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1324
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    invoke-virtual {v0, p2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1325
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1326
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    const/16 v2, 0x25

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1328
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    invoke-virtual {v0, p3}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1329
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    const/16 v2, 0xf

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1331
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    invoke-virtual {v0, p4}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1332
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    const/16 v2, 0x11

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1333
    return-void
.end method

.method protected CreateNewStringIndex(I)V
    .locals 13
    .param p1, "Font"    # I

    .line 1342
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget-object v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-OneRange"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1343
    .local v0, "fdFontName":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    const/16 v3, 0x7f

    if-le v1, v3, :cond_0

    .line 1344
    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 1345
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AdobeIdentity"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1347
    .local v1, "extraStrings":Ljava/lang/String;
    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->stringOffsets:[I

    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->stringOffsets:[I

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    aget v3, v3, v4

    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->stringOffsets:[I

    aget v4, v4, v2

    sub-int/2addr v3, v4

    .line 1349
    .local v3, "origStringsLen":I
    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->stringOffsets:[I

    aget v4, v4, v2

    add-int/lit8 v4, v4, -0x1

    .line 1352
    .local v4, "stringsBaseOffset":I
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v3

    const/16 v6, 0xff

    if-gt v5, v6, :cond_1

    const/4 v5, 0x1

    .local v5, "stringsIndexOffSize":B
    goto :goto_0

    .line 1353
    .end local v5    # "stringsIndexOffSize":B
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v3

    const v6, 0xffff

    if-gt v5, v6, :cond_2

    const/4 v5, 0x2

    .restart local v5    # "stringsIndexOffSize":B
    goto :goto_0

    .line 1354
    .end local v5    # "stringsIndexOffSize":B
    :cond_2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v3

    const v6, 0xffffff

    if-gt v5, v6, :cond_3

    const/4 v5, 0x3

    .restart local v5    # "stringsIndexOffSize":B
    goto :goto_0

    .line 1355
    .end local v5    # "stringsIndexOffSize":B
    :cond_3
    const/4 v5, 0x4

    .line 1358
    .restart local v5    # "stringsIndexOffSize":B
    :goto_0
    iget-object v6, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v7, Lcom/itextpdf/io/font/CFFFont$UInt16Item;

    iget-object v8, p0, Lcom/itextpdf/io/font/CFFFontSubset;->stringOffsets:[I

    array-length v8, v8

    add-int/lit8 v8, v8, -0x1

    add-int/lit8 v8, v8, 0x3

    int-to-char v8, v8

    invoke-direct {v7, v8}, Lcom/itextpdf/io/font/CFFFont$UInt16Item;-><init>(C)V

    invoke-virtual {v6, v7}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1360
    iget-object v6, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v7, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    int-to-char v8, v5

    invoke-direct {v7, v8}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v6, v7}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1361
    iget-object v6, p0, Lcom/itextpdf/io/font/CFFFontSubset;->stringOffsets:[I

    array-length v7, v6

    move v8, v2

    :goto_1
    if-ge v8, v7, :cond_4

    aget v9, v6, v8

    .line 1362
    .local v9, "stringOffset":I
    iget-object v10, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v11, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;

    sub-int v12, v9, v4

    invoke-direct {v11, v5, v12}, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;-><init>(II)V

    invoke-virtual {v10, v11}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1361
    .end local v9    # "stringOffset":I
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 1364
    :cond_4
    iget-object v6, p0, Lcom/itextpdf/io/font/CFFFontSubset;->stringOffsets:[I

    iget-object v7, p0, Lcom/itextpdf/io/font/CFFFontSubset;->stringOffsets:[I

    array-length v7, v7

    add-int/lit8 v7, v7, -0x1

    aget v6, v6, v7

    sub-int/2addr v6, v4

    .line 1367
    .local v6, "currentStringsOffset":I
    const-string v7, "Adobe"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v6, v7

    .line 1368
    iget-object v7, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v8, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;

    invoke-direct {v8, v5, v6}, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;-><init>(II)V

    invoke-virtual {v7, v8}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1369
    const-string v7, "Identity"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v6, v7

    .line 1370
    iget-object v7, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v8, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;

    invoke-direct {v8, v5, v6}, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;-><init>(II)V

    invoke-virtual {v7, v8}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1371
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v6, v7

    .line 1372
    iget-object v7, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v8, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;

    invoke-direct {v8, v5, v6}, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;-><init>(II)V

    invoke-virtual {v7, v8}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1374
    iget-object v7, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v8, Lcom/itextpdf/io/font/CFFFont$RangeItem;

    iget-object v9, p0, Lcom/itextpdf/io/font/CFFFontSubset;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v10, p0, Lcom/itextpdf/io/font/CFFFontSubset;->stringOffsets:[I

    aget v2, v10, v2

    invoke-direct {v8, v9, v2, v3}, Lcom/itextpdf/io/font/CFFFont$RangeItem;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)V

    invoke-virtual {v7, v8}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1375
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v7, Lcom/itextpdf/io/font/CFFFont$StringItem;

    invoke-direct {v7, v1}, Lcom/itextpdf/io/font/CFFFont$StringItem;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v7}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1376
    return-void
.end method

.method CreateNonCIDPrivate(ILcom/itextpdf/io/font/CFFFont$OffsetItem;)V
    .locals 6
    .param p1, "Font"    # I
    .param p2, "Subr"    # Lcom/itextpdf/io/font/CFFFont$OffsetItem;

    .line 1672
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget v0, v0, Lcom/itextpdf/io/font/CFFFont$Font;->privateOffset:I

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 1673
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->privateOffset:I

    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    iget v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->privateLength:I

    add-int/2addr v1, v2

    if-ge v0, v1, :cond_1

    .line 1674
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v0

    .line 1675
    .local v0, "p1":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getDictItem()V

    .line 1676
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v1

    .line 1679
    .local v1, "p2":I
    const-string v2, "Subrs"

    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 1686
    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    .line 1679
    if-eqz v2, :cond_0

    .line 1680
    invoke-virtual {v3, p2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1682
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v3, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    const/16 v4, 0x13

    invoke-direct {v3, v4}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto :goto_1

    .line 1686
    :cond_0
    new-instance v2, Lcom/itextpdf/io/font/CFFFont$RangeItem;

    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    sub-int v5, v1, v0

    invoke-direct {v2, v4, v0, v5}, Lcom/itextpdf/io/font/CFFFont$RangeItem;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)V

    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1687
    .end local v0    # "p1":I
    .end local v1    # "p2":I
    :goto_1
    goto :goto_0

    .line 1688
    :cond_1
    return-void
.end method

.method CreateNonCIDSubrs(ILcom/itextpdf/io/font/CFFFont$IndexBaseItem;Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V
    .locals 5
    .param p1, "Font"    # I
    .param p2, "PrivateBase"    # Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;
    .param p3, "Subrs"    # Lcom/itextpdf/io/font/CFFFont$OffsetItem;

    .line 1700
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$SubrMarkerItem;

    invoke-direct {v1, p3, p2}, Lcom/itextpdf/io/font/CFFFont$SubrMarkerItem;-><init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1702
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NewSubrsIndexNonCID:[B

    if-eqz v0, :cond_0

    .line 1703
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v1, Lcom/itextpdf/io/font/CFFFont$RangeItem;

    new-instance v2, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->rasFactory:Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NewSubrsIndexNonCID:[B

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NewSubrsIndexNonCID:[B

    array-length v3, v3

    const/4 v4, 0x0

    invoke-direct {v1, v2, v4, v3}, Lcom/itextpdf/io/font/CFFFont$RangeItem;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1705
    :cond_0
    return-void
.end method

.method protected EmptyStack()V
    .locals 3

    .line 763
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->args:[Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 764
    .end local v0    # "i":I
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    .line 765
    return-void
.end method

.method protected HandelStack()V
    .locals 2

    .line 700
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->StackOpp()I

    move-result v0

    .line 701
    .local v0, "StackHandel":I
    const/4 v1, 0x2

    if-ge v0, v1, :cond_2

    .line 703
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 704
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->PushStack()V

    goto :goto_1

    .line 708
    :cond_0
    mul-int/lit8 v0, v0, -0x1

    .line 709
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 710
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->PopStack()V

    .line 709
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v1    # "i":I
    :cond_1
    goto :goto_1

    .line 716
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->EmptyStack()V

    .line 717
    :goto_1
    return-void
.end method

.method protected PopStack()V
    .locals 3

    .line 771
    iget v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    if-lez v0, :cond_0

    .line 772
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->args:[Ljava/lang/Object;

    iget v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    aput-object v2, v0, v1

    .line 773
    iget v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    .line 775
    :cond_0
    return-void
.end method

.method public Process()[B
    .locals 2

    .line 383
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getNames()[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/CFFFontSubset;->Process(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public Process(Ljava/lang/String;)[B
    .locals 3
    .param p1, "fontName"    # Ljava/lang/String;

    .line 351
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 352
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->name:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 351
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 353
    :cond_1
    :goto_1
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    array-length v1, v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, v1, :cond_2

    .line 369
    :try_start_1
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 372
    goto :goto_2

    .line 370
    :catch_0
    move-exception v1

    .line 353
    :goto_2
    const/4 v1, 0x0

    return-object v1

    .line 356
    :cond_2
    :try_start_2
    iget v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->gsubrIndexOffset:I

    if-ltz v1, :cond_3

    .line 357
    iget v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->gsubrIndexOffset:I

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/io/font/CFFFontSubset;->CalcBias(II)I

    move-result v1

    iput v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->GBias:I

    .line 360
    :cond_3
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildNewCharString(I)V

    .line 362
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildNewLGSubrs(I)V

    .line 364
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildNewFile(I)[B

    move-result-object v1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 369
    :try_start_3
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 372
    goto :goto_3

    .line 370
    :catch_1
    move-exception v2

    .line 364
    :goto_3
    return-object v1

    .line 368
    .end local v0    # "j":I
    :catchall_0
    move-exception v0

    goto :goto_4

    .line 365
    :catch_2
    move-exception v0

    .line 366
    .local v0, "e":Ljava/io/IOException;
    :try_start_4
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "I/O exception."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local p1    # "fontName":Ljava/lang/String;
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 369
    .end local v0    # "e":Ljava/io/IOException;
    .restart local p1    # "fontName":Ljava/lang/String;
    :goto_4
    :try_start_5
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 372
    goto :goto_5

    .line 370
    :catch_3
    move-exception v1

    .line 373
    :goto_5
    throw v0
.end method

.method protected PushStack()V
    .locals 1

    .line 781
    iget v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    .line 782
    return-void
.end method

.method protected ReadASubr(IIIILjava/util/Set;Ljava/util/List;[I)V
    .locals 14
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "GBias"    # I
    .param p4, "LBias"    # I
    .param p7, "LSubrsOffsets"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;[I)V"
        }
    .end annotation

    .line 622
    .local p5, "hSubr":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .local p6, "lSubr":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move-object/from16 v6, p5

    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->EmptyStack()V

    .line 623
    const/4 v7, 0x0

    iput v7, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NumOfHints:I

    .line 625
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 626
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v1

    move/from16 v8, p2

    if-ge v1, v8, :cond_a

    .line 628
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->ReadCommand()V

    .line 629
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v9

    .line 630
    .local v9, "pos":I
    const/4 v1, 0x0

    .line 631
    .local v1, "TopElement":Ljava/lang/Object;
    iget v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    const/4 v3, 0x1

    if-lez v2, :cond_0

    .line 632
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->args:[Ljava/lang/Object;

    iget v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    sub-int/2addr v4, v3

    aget-object v1, v2, v4

    move-object v10, v1

    goto :goto_1

    .line 631
    :cond_0
    move-object v10, v1

    .line 633
    .end local v1    # "TopElement":Ljava/lang/Object;
    .local v10, "TopElement":Ljava/lang/Object;
    :goto_1
    iget v11, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    .line 635
    .local v11, "NumOfArgs":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->HandelStack()V

    .line 636
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    if-eqz v1, :cond_9

    .line 638
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_1
    goto :goto_2

    :sswitch_0
    const-string v2, "hstemhm"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v3, 0x4

    goto :goto_3

    :sswitch_1
    const-string/jumbo v2, "vstemhm"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v3, 0x5

    goto :goto_3

    :sswitch_2
    const-string/jumbo v2, "vstem"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v3, 0x3

    goto :goto_3

    :sswitch_3
    const-string v2, "hstem"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v3, 0x2

    goto :goto_3

    :sswitch_4
    const-string v2, "callsubr"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    move v3, v7

    goto :goto_3

    :sswitch_5
    const-string v2, "callgsubr"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_3

    :sswitch_6
    const-string v2, "cntrmask"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v3, 0x7

    goto :goto_3

    :sswitch_7
    const-string v2, "hintmask"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v3, 0x6

    goto :goto_3

    :goto_2
    const/4 v3, -0x1

    :goto_3
    packed-switch v3, :pswitch_data_0

    move-object/from16 v13, p6

    goto/16 :goto_6

    .line 680
    :pswitch_0
    iget v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NumOfHints:I

    div-int/lit8 v2, v11, 0x2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NumOfHints:I

    .line 682
    iget v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NumOfHints:I

    div-int/lit8 v1, v1, 0x8

    .line 683
    .local v1, "SizeOfMask":I
    iget v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NumOfHints:I

    rem-int/lit8 v2, v2, 0x8

    if-nez v2, :cond_2

    if-nez v1, :cond_3

    .line 684
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 686
    :cond_3
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    if-ge v2, v1, :cond_4

    .line 687
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    .line 686
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_4
    move-object/from16 v13, p6

    goto/16 :goto_6

    .line 674
    .end local v1    # "SizeOfMask":I
    .end local v2    # "i":I
    :pswitch_1
    iget v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NumOfHints:I

    div-int/lit8 v2, v11, 0x2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NumOfHints:I

    .line 675
    move-object/from16 v13, p6

    goto/16 :goto_6

    .line 657
    :pswitch_2
    if-lez v11, :cond_6

    .line 659
    move-object v1, v10

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int v12, v1, p3

    .line 661
    .local v12, "Subr":I
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->hGSubrsUsed:Ljava/util/Set;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 662
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->hGSubrsUsed:Ljava/util/Set;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 663
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->lGSubrsUsed:Ljava/util/List;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 665
    :cond_5
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->gsubrOffsets:[I

    aget v1, v1, v12

    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->gsubrOffsets:[I

    add-int/lit8 v3, v12, 0x1

    aget v2, v2, v3

    move-object v0, p0

    move/from16 v4, p3

    move/from16 v3, p4

    move-object/from16 v5, p7

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/io/font/CFFFontSubset;->CalcHints(IIII[I)I

    .line 666
    invoke-virtual {p0, v9}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 667
    .end local v12    # "Subr":I
    move-object/from16 v13, p6

    goto :goto_6

    .line 657
    :cond_6
    move-object/from16 v13, p6

    goto :goto_6

    .line 642
    :pswitch_3
    if-lez v11, :cond_8

    .line 644
    move-object v1, v10

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int v12, v1, p4

    .line 646
    .restart local v12    # "Subr":I
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 647
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 648
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v13, p6

    invoke-interface {v13, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 646
    :cond_7
    move-object/from16 v13, p6

    .line 650
    :goto_5
    aget v1, p7, v12

    add-int/lit8 v2, v12, 0x1

    aget v2, p7, v2

    move-object v0, p0

    move/from16 v4, p3

    move/from16 v3, p4

    move-object/from16 v5, p7

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/io/font/CFFFontSubset;->CalcHints(IIII[I)I

    .line 651
    invoke-virtual {p0, v9}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 652
    .end local v12    # "Subr":I
    goto :goto_6

    .line 642
    :cond_8
    move-object/from16 v13, p6

    goto :goto_6

    .line 636
    :cond_9
    move-object/from16 v13, p6

    .line 691
    .end local v9    # "pos":I
    .end local v10    # "TopElement":Ljava/lang/Object;
    .end local v11    # "NumOfArgs":I
    :goto_6
    goto/16 :goto_0

    .line 692
    :cond_a
    move-object/from16 v13, p6

    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x57ccb60d -> :sswitch_7
        -0x4c92896b -> :sswitch_6
        -0x3de93085 -> :sswitch_5
        -0xa3bda70 -> :sswitch_4
        0x5ef9331 -> :sswitch_3
        0x6b4dc3f -> :sswitch_2
        0x2ceed584 -> :sswitch_1
        0x485797f6 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected ReadCommand()V
    .locals 10

    .line 788
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    .line 789
    const/4 v0, 0x0

    .line 792
    .local v0, "gotKey":Z
    :goto_0
    if-nez v0, :cond_8

    .line 795
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v1

    .line 798
    .local v1, "b0":C
    const/16 v2, 0x1c

    if-ne v1, v2, :cond_0

    .line 802
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v2

    .line 803
    .local v2, "first":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v3

    .line 804
    .local v3, "second":I
    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->args:[Ljava/lang/Object;

    iget v5, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    shl-int/lit8 v6, v2, 0x8

    or-int/2addr v6, v3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    .line 805
    iget v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    .line 806
    goto :goto_0

    .line 810
    .end local v2    # "first":I
    .end local v3    # "second":I
    :cond_0
    const/16 v3, 0x20

    if-lt v1, v3, :cond_1

    const/16 v3, 0xf6

    if-gt v1, v3, :cond_1

    .line 812
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->args:[Ljava/lang/Object;

    iget v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    add-int/lit16 v4, v1, -0x8b

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    .line 813
    iget v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    .line 814
    goto :goto_0

    .line 818
    :cond_1
    const/16 v3, 0xf7

    if-lt v1, v3, :cond_2

    const/16 v3, 0xfa

    if-gt v1, v3, :cond_2

    .line 820
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v2

    .line 821
    .local v2, "w":I
    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->args:[Ljava/lang/Object;

    iget v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    add-int/lit16 v5, v1, -0xf7

    mul-int/lit16 v5, v5, 0x100

    add-int/2addr v5, v2

    add-int/lit8 v5, v5, 0x6c

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    .line 822
    iget v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    .line 823
    goto :goto_0

    .line 827
    .end local v2    # "w":I
    :cond_2
    const/16 v3, 0xfb

    if-lt v1, v3, :cond_3

    const/16 v3, 0xfe

    if-gt v1, v3, :cond_3

    .line 829
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v2

    .line 830
    .restart local v2    # "w":I
    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->args:[Ljava/lang/Object;

    iget v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    add-int/lit16 v5, v1, -0xfb

    neg-int v5, v5

    mul-int/lit16 v5, v5, 0x100

    sub-int/2addr v5, v2

    add-int/lit8 v5, v5, -0x6c

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    .line 831
    iget v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    .line 832
    goto/16 :goto_0

    .line 836
    .end local v2    # "w":I
    :cond_3
    const/16 v3, 0xff

    if-ne v1, v3, :cond_4

    .line 838
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v2

    .line 839
    .local v2, "first":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v3

    .line 840
    .restart local v3    # "second":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v4

    .line 841
    .local v4, "third":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v5

    .line 842
    .local v5, "fourth":I
    iget-object v6, p0, Lcom/itextpdf/io/font/CFFFontSubset;->args:[Ljava/lang/Object;

    iget v7, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    shl-int/lit8 v8, v2, 0x18

    shl-int/lit8 v9, v3, 0x10

    or-int/2addr v8, v9

    shl-int/lit8 v9, v4, 0x8

    or-int/2addr v8, v9

    or-int/2addr v8, v5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    .line 843
    iget v6, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/itextpdf/io/font/CFFFontSubset;->arg_count:I

    .line 844
    goto/16 :goto_0

    .line 848
    .end local v2    # "first":I
    .end local v3    # "second":I
    .end local v4    # "third":I
    .end local v5    # "fourth":I
    :cond_4
    const/16 v3, 0x1f

    if-gt v1, v3, :cond_7

    if-eq v1, v2, :cond_7

    .line 850
    const/4 v0, 0x1

    .line 854
    const/16 v2, 0xc

    if-ne v1, v2, :cond_6

    .line 855
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v2

    .line 856
    .local v2, "b1":I
    sget-object v3, Lcom/itextpdf/io/font/CFFFontSubset;->SubrsEscapeFuncs:[Ljava/lang/String;

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    if-le v2, v3, :cond_5

    .line 857
    sget-object v3, Lcom/itextpdf/io/font/CFFFontSubset;->SubrsEscapeFuncs:[Ljava/lang/String;

    array-length v3, v3

    add-int/lit8 v2, v3, -0x1

    .line 858
    :cond_5
    sget-object v3, Lcom/itextpdf/io/font/CFFFontSubset;->SubrsEscapeFuncs:[Ljava/lang/String;

    aget-object v3, v3, v2

    iput-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    .line 859
    .end local v2    # "b1":I
    goto/16 :goto_0

    .line 860
    :cond_6
    sget-object v2, Lcom/itextpdf/io/font/CFFFontSubset;->SubrsFunctions:[Ljava/lang/String;

    aget-object v2, v2, v1

    iput-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    .line 861
    goto/16 :goto_0

    .line 863
    .end local v1    # "b0":C
    :cond_7
    goto/16 :goto_0

    .line 864
    :cond_8
    return-void
.end method

.method protected ReadFDArray(I)V
    .locals 2
    .param p1, "Font"    # I

    .line 329
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget v0, v0, Lcom/itextpdf/io/font/CFFFont$Font;->fdarrayOffset:I

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 330
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard16()C

    move-result v1

    iput v1, v0, Lcom/itextpdf/io/font/CFFFont$Font;->FDArrayCount:I

    .line 331
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v1

    iput v1, v0, Lcom/itextpdf/io/font/CFFFont$Font;->FDArrayOffsize:I

    .line 334
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget v0, v0, Lcom/itextpdf/io/font/CFFFont$Font;->FDArrayOffsize:I

    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    .line 335
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget v1, v0, Lcom/itextpdf/io/font/CFFFont$Font;->FDArrayOffsize:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/itextpdf/io/font/CFFFont$Font;->FDArrayOffsize:I

    .line 336
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->fdarrayOffset:I

    invoke-virtual {p0, v1}, Lcom/itextpdf/io/font/CFFFontSubset;->getIndex(I)[I

    move-result-object v1

    iput-object v1, v0, Lcom/itextpdf/io/font/CFFFont$Font;->FDArrayOffsets:[I

    .line 337
    return-void
.end method

.method Reconstruct(I)V
    .locals 3
    .param p1, "Font"    # I

    .line 1471
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/itextpdf/io/font/CFFFont$Font;->FDArrayOffsets:[I

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    new-array v0, v0, [Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;

    .line 1472
    .local v0, "fdPrivate":[Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget-object v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateOffsets:[I

    array-length v1, v1

    new-array v1, v1, [Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;

    .line 1473
    .local v1, "fdPrivateBase":[Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    iget-object v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateOffsets:[I

    array-length v2, v2

    new-array v2, v2, [Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;

    .line 1475
    .local v2, "fdSubrs":[Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/io/font/CFFFontSubset;->ReconstructFDArray(I[Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V

    .line 1476
    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->ReconstructPrivateDict(I[Lcom/itextpdf/io/font/CFFFont$OffsetItem;[Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;[Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V

    .line 1477
    invoke-virtual {p0, p1, v1, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->ReconstructPrivateSubrs(I[Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;[Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V

    .line 1478
    return-void
.end method

.method ReconstructFDArray(I[Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V
    .locals 11
    .param p1, "Font"    # I
    .param p2, "fdPrivate"    # [Lcom/itextpdf/io/font/CFFFont$OffsetItem;

    .line 1488
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget v0, v0, Lcom/itextpdf/io/font/CFFFont$Font;->FDArrayCount:I

    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->FDArrayOffsize:I

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->BuildIndexHeader(III)V

    .line 1491
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/itextpdf/io/font/CFFFont$Font;->FDArrayOffsets:[I

    array-length v0, v0

    sub-int/2addr v0, v2

    new-array v0, v0, [Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;

    .line 1492
    .local v0, "fdOffsets":[Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/itextpdf/io/font/CFFFont$Font;->FDArrayOffsets:[I

    array-length v3, v3

    sub-int/2addr v3, v2

    if-ge v1, v3, :cond_0

    .line 1493
    new-instance v3, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;

    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v4, v4, p1

    iget v4, v4, Lcom/itextpdf/io/font/CFFFont$Font;->FDArrayOffsize:I

    invoke-direct {v3, v4}, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;-><init>(I)V

    aput-object v3, v0, v1

    .line 1494
    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    aget-object v4, v0, v1

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1492
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1498
    .end local v1    # "i":I
    :cond_0
    new-instance v1, Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;

    invoke-direct {v1}, Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;-><init>()V

    .line 1499
    .local v1, "fdArrayBase":Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;
    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    invoke-virtual {v3, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1505
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_1
    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v4, v4, p1

    iget-object v4, v4, Lcom/itextpdf/io/font/CFFFont$Font;->FDArrayOffsets:[I

    array-length v4, v4

    sub-int/2addr v4, v2

    if-ge v3, v4, :cond_4

    .line 1509
    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v4, v4, p1

    iget-object v4, v4, Lcom/itextpdf/io/font/CFFFont$Font;->FDArrayOffsets:[I

    aget v4, v4, v3

    invoke-virtual {p0, v4}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 1510
    :goto_2
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v4

    iget-object v5, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v5, v5, p1

    iget-object v5, v5, Lcom/itextpdf/io/font/CFFFont$Font;->FDArrayOffsets:[I

    add-int/lit8 v6, v3, 0x1

    aget v5, v5, v6

    if-ge v4, v5, :cond_3

    .line 1511
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v4

    .line 1512
    .local v4, "p1":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getDictItem()V

    .line 1513
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v5

    .line 1516
    .local v5, "p2":I
    const-string v6, "Private"

    iget-object v7, p0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1518
    iget-object v6, p0, Lcom/itextpdf/io/font/CFFFontSubset;->args:[Ljava/lang/Object;

    const/4 v7, 0x0

    aget-object v6, v6, v7

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 1520
    .local v6, "NewSize":I
    iget-object v7, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v7, v7, p1

    iget-object v7, v7, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateOffsets:[I

    aget v7, v7, v3

    iget-object v8, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v8, v8, p1

    iget-object v8, v8, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateLengths:[I

    aget v8, v8, v3

    invoke-virtual {p0, v7, v8}, Lcom/itextpdf/io/font/CFFFontSubset;->CalcSubrOffsetSize(II)I

    move-result v7

    .line 1522
    .local v7, "OrgSubrsOffsetSize":I
    if-eqz v7, :cond_1

    .line 1523
    rsub-int/lit8 v8, v7, 0x5

    add-int/2addr v6, v8

    .line 1525
    :cond_1
    iget-object v8, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v9, Lcom/itextpdf/io/font/CFFFont$DictNumberItem;

    invoke-direct {v9, v6}, Lcom/itextpdf/io/font/CFFFont$DictNumberItem;-><init>(I)V

    invoke-virtual {v8, v9}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1526
    new-instance v8, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;

    invoke-direct {v8}, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;-><init>()V

    aput-object v8, p2, v3

    .line 1527
    iget-object v8, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    aget-object v9, p2, v3

    invoke-virtual {v8, v9}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1529
    iget-object v8, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v9, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    const/16 v10, 0x12

    invoke-direct {v9, v10}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v8, v9}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1531
    invoke-virtual {p0, v5}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 1532
    .end local v6    # "NewSize":I
    .end local v7    # "OrgSubrsOffsetSize":I
    goto :goto_3

    .line 1535
    :cond_2
    iget-object v6, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v7, Lcom/itextpdf/io/font/CFFFont$RangeItem;

    iget-object v8, p0, Lcom/itextpdf/io/font/CFFFontSubset;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    sub-int v9, v5, v4

    invoke-direct {v7, v8, v4, v9}, Lcom/itextpdf/io/font/CFFFont$RangeItem;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)V

    invoke-virtual {v6, v7}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1536
    .end local v4    # "p1":I
    .end local v5    # "p2":I
    :goto_3
    goto :goto_2

    .line 1539
    :cond_3
    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v5, Lcom/itextpdf/io/font/CFFFont$IndexMarkerItem;

    aget-object v6, v0, v3

    invoke-direct {v5, v6, v1}, Lcom/itextpdf/io/font/CFFFont$IndexMarkerItem;-><init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;)V

    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1505
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    .line 1541
    .end local v3    # "k":I
    :cond_4
    return-void
.end method

.method ReconstructPrivateDict(I[Lcom/itextpdf/io/font/CFFFont$OffsetItem;[Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;[Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V
    .locals 7
    .param p1, "Font"    # I
    .param p2, "fdPrivate"    # [Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    .param p3, "fdPrivateBase"    # [Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;
    .param p4, "fdSubrs"    # [Lcom/itextpdf/io/font/CFFFont$OffsetItem;

    .line 1557
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget-object v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateOffsets:[I

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 1561
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v2, Lcom/itextpdf/io/font/CFFFont$MarkerItem;

    aget-object v3, p2, v0

    invoke-direct {v2, v3}, Lcom/itextpdf/io/font/CFFFont$MarkerItem;-><init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1562
    new-instance v1, Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;

    invoke-direct {v1}, Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;-><init>()V

    aput-object v1, p3, v0

    .line 1563
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    aget-object v2, p3, v0

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1565
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget-object v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateOffsets:[I

    aget v1, v1, v0

    invoke-virtual {p0, v1}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 1566
    :goto_1
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v1

    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    iget-object v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateOffsets:[I

    aget v2, v2, v0

    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateLengths:[I

    aget v3, v3, v0

    add-int/2addr v2, v3

    if-ge v1, v2, :cond_1

    .line 1567
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v1

    .line 1568
    .local v1, "p1":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getDictItem()V

    .line 1569
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getPosition()I

    move-result v2

    .line 1572
    .local v2, "p2":I
    const-string v3, "Subrs"

    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1573
    new-instance v3, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;

    invoke-direct {v3}, Lcom/itextpdf/io/font/CFFFont$DictOffsetItem;-><init>()V

    aput-object v3, p4, v0

    .line 1574
    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    aget-object v4, p4, v0

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1576
    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v4, Lcom/itextpdf/io/font/CFFFont$UInt8Item;

    const/16 v5, 0x13

    invoke-direct {v4, v5}, Lcom/itextpdf/io/font/CFFFont$UInt8Item;-><init>(C)V

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto :goto_2

    .line 1580
    :cond_0
    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v4, Lcom/itextpdf/io/font/CFFFont$RangeItem;

    iget-object v5, p0, Lcom/itextpdf/io/font/CFFFontSubset;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    sub-int v6, v2, v1

    invoke-direct {v4, v5, v1, v6}, Lcom/itextpdf/io/font/CFFFont$RangeItem;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)V

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1581
    .end local v1    # "p1":I
    .end local v2    # "p2":I
    :goto_2
    goto :goto_1

    .line 1557
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 1584
    .end local v0    # "i":I
    :cond_2
    return-void
.end method

.method ReconstructPrivateSubrs(I[Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;[Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V
    .locals 6
    .param p1, "Font"    # I
    .param p2, "fdPrivateBase"    # [Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;
    .param p3, "fdSubrs"    # [Lcom/itextpdf/io/font/CFFFont$OffsetItem;

    .line 1597
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget-object v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->fdprivateLengths:[I

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 1600
    aget-object v1, p3, v0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget-object v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->PrivateSubrsOffset:[I

    aget v1, v1, v0

    if-ltz v1, :cond_0

    .line 1601
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v2, Lcom/itextpdf/io/font/CFFFont$SubrMarkerItem;

    aget-object v3, p3, v0

    aget-object v4, p2, v0

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/io/font/CFFFont$SubrMarkerItem;-><init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;)V

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1602
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NewLSubrsIndex:[[B

    aget-object v1, v1, v0

    if-eqz v1, :cond_0

    .line 1603
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->OutputList:Ljava/util/LinkedList;

    new-instance v2, Lcom/itextpdf/io/font/CFFFont$RangeItem;

    new-instance v3, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->rasFactory:Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    iget-object v5, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NewLSubrsIndex:[[B

    aget-object v5, v5, v0

    invoke-virtual {v4, v5}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    iget-object v4, p0, Lcom/itextpdf/io/font/CFFFontSubset;->NewLSubrsIndex:[[B

    aget-object v4, v4, v0

    array-length v4, v4

    const/4 v5, 0x0

    invoke-direct {v2, v3, v5, v4}, Lcom/itextpdf/io/font/CFFFont$RangeItem;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)V

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 1597
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1606
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method protected StackOpp()I
    .locals 6

    .line 725
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->key:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, -0x1

    sparse-switch v1, :sswitch_data_0

    :cond_0
    goto/16 :goto_0

    :sswitch_0
    const-string v1, "index"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x11

    goto/16 :goto_1

    :sswitch_1
    const-string/jumbo v1, "sqrt"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0xf

    goto/16 :goto_1

    :sswitch_2
    const-string/jumbo v1, "roll"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v3

    goto/16 :goto_1

    :sswitch_3
    const-string v1, "exch"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x10

    goto/16 :goto_1

    :sswitch_4
    const-string v1, "drop"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x9

    goto/16 :goto_1

    :sswitch_5
    const-string/jumbo v1, "sub"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x6

    goto/16 :goto_1

    :sswitch_6
    const-string/jumbo v1, "put"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v2

    goto/16 :goto_1

    :sswitch_7
    const-string/jumbo v1, "not"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x13

    goto/16 :goto_1

    :sswitch_8
    const-string v1, "neg"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0xe

    goto/16 :goto_1

    :sswitch_9
    const-string v1, "mul"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    goto/16 :goto_1

    :sswitch_a
    const-string v1, "get"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x12

    goto/16 :goto_1

    :sswitch_b
    const-string v1, "dup"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x16

    goto/16 :goto_1

    :sswitch_c
    const-string v1, "div"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x7

    goto/16 :goto_1

    :sswitch_d
    const-string v1, "and"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0xa

    goto/16 :goto_1

    :sswitch_e
    const-string v1, "add"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x5

    goto :goto_1

    :sswitch_f
    const-string v1, "abs"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0xd

    goto :goto_1

    :sswitch_10
    const-string/jumbo v1, "or"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0xb

    goto :goto_1

    :sswitch_11
    const-string v1, "eq"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0xc

    goto :goto_1

    :sswitch_12
    const-string v1, "callsubr"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    goto :goto_1

    :sswitch_13
    const-string/jumbo v1, "return"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x14

    goto :goto_1

    :sswitch_14
    const-string/jumbo v1, "random"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x15

    goto :goto_1

    :sswitch_15
    const-string v1, "callgsubr"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_1

    :sswitch_16
    const-string v1, "ifelse"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v4

    goto :goto_1

    :goto_0
    move v0, v5

    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 755
    return v2

    .line 753
    :pswitch_0
    return v3

    .line 750
    :pswitch_1
    return v4

    .line 741
    :pswitch_2
    return v5

    .line 730
    :pswitch_3
    const/4 v0, -0x2

    return v0

    .line 727
    :pswitch_4
    const/4 v0, -0x3

    return v0

    :sswitch_data_0
    .sparse-switch
        -0x47063c2a -> :sswitch_16
        -0x3de93085 -> :sswitch_15
        -0x37ed1b3d -> :sswitch_14
        -0x37b1c2d0 -> :sswitch_13
        -0xa3bda70 -> :sswitch_12
        0xcac -> :sswitch_11
        0xde3 -> :sswitch_10
        0x17872 -> :sswitch_f
        0x178a1 -> :sswitch_e
        0x179d7 -> :sswitch_d
        0x18491 -> :sswitch_c
        0x185ff -> :sswitch_b
        0x18f56 -> :sswitch_a
        0x1a7c4 -> :sswitch_9
        0x1a990 -> :sswitch_8
        0x1aad3 -> :sswitch_7
        0x1b30f -> :sswitch_6
        0x1be40 -> :sswitch_5
        0x2f2eef -> :sswitch_4
        0x2fb858 -> :sswitch_3
        0x35807d -> :sswitch_2
        0x35fd20 -> :sswitch_1
        0x5fb28d2 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected countEntireIndexRange(I)I
    .locals 4
    .param p1, "indexOffset"    # I

    .line 1645
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 1647
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard16()C

    move-result v0

    .line 1649
    .local v0, "count":I
    if-nez v0, :cond_0

    .line 1650
    const/4 v1, 0x2

    return v1

    .line 1653
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v1

    .line 1655
    .local v1, "indexOffSize":I
    add-int/lit8 v2, p1, 0x2

    add-int/lit8 v2, v2, 0x1

    mul-int v3, v0, v1

    add-int/2addr v2, v3

    invoke-virtual {p0, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 1657
    invoke-virtual {p0, v1}, Lcom/itextpdf/io/font/CFFFontSubset;->getOffset(I)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    .line 1659
    .local v2, "size":I
    add-int/lit8 v3, v0, 0x1

    mul-int/2addr v3, v1

    add-int/lit8 v3, v3, 0x3

    add-int/2addr v3, v2

    return v3
.end method

.method getCidForGlyphId(I)I
    .locals 1
    .param p1, "gid"    # I

    .line 1715
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/io/font/CFFFontSubset;->getCidForGlyphId(II)I

    move-result v0

    return v0
.end method

.method getCidForGlyphId(II)I
    .locals 2
    .param p1, "fontIndex"    # I
    .param p2, "gid"    # I

    .line 1727
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/itextpdf/io/font/CFFFont$Font;->gidToCid:[I

    if-nez v0, :cond_0

    .line 1728
    return p2

    .line 1732
    :cond_0
    add-int/lit8 v0, p2, -0x1

    .line 1733
    .local v0, "index":I
    if-ltz v0, :cond_1

    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget-object v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->gidToCid:[I

    array-length v1, v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v1, v1, p1

    iget-object v1, v1, Lcom/itextpdf/io/font/CFFFont$Font;->gidToCid:[I

    aget v1, v1, v0

    goto :goto_0

    :cond_1
    move v1, p2

    :goto_0
    return v1
.end method

.method protected readFDSelect(I)V
    .locals 10
    .param p1, "Font"    # I

    .line 256
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v0, v0, p1

    iget v0, v0, Lcom/itextpdf/io/font/CFFFont$Font;->nglyphs:I

    .line 257
    .local v0, "NumOfGlyphs":I
    new-array v1, v0, [I

    .line 259
    .local v1, "FDSelect":[I
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    iget v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->fdselectOffset:I

    invoke-virtual {p0, v2}, Lcom/itextpdf/io/font/CFFFontSubset;->seek(I)V

    .line 261
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v3

    iput v3, v2, Lcom/itextpdf/io/font/CFFFont$Font;->FDSelectFormat:I

    .line 263
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    iget v2, v2, Lcom/itextpdf/io/font/CFFFont$Font;->FDSelectFormat:I

    sparse-switch v2, :sswitch_data_0

    goto :goto_3

    .line 277
    :sswitch_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard16()C

    move-result v2

    .line 278
    .local v2, "nRanges":I
    const/4 v3, 0x0

    .line 280
    .local v3, "l":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard16()C

    move-result v4

    .line 281
    .local v4, "first":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v2, :cond_1

    .line 283
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v6

    .line 285
    .local v6, "fd":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard16()C

    move-result v7

    .line 287
    .local v7, "last":I
    sub-int v8, v7, v4

    .line 288
    .local v8, "steps":I
    const/4 v9, 0x0

    .local v9, "k":I
    :goto_1
    if-ge v9, v8, :cond_0

    .line 289
    aput v6, v1, v3

    .line 290
    add-int/lit8 v3, v3, 0x1

    .line 288
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 293
    .end local v9    # "k":I
    :cond_0
    move v4, v7

    .line 281
    .end local v6    # "fd":I
    .end local v7    # "last":I
    .end local v8    # "steps":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 296
    .end local v5    # "i":I
    :cond_1
    iget-object v5, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v5, v5, p1

    mul-int/lit8 v6, v2, 0x3

    add-int/lit8 v6, v6, 0x3

    add-int/lit8 v6, v6, 0x2

    iput v6, v5, Lcom/itextpdf/io/font/CFFFont$Font;->FDSelectLength:I

    .line 297
    goto :goto_3

    .line 267
    .end local v2    # "nRanges":I
    .end local v3    # "l":I
    .end local v4    # "first":I
    :sswitch_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    if-ge v2, v0, :cond_2

    .line 268
    invoke-virtual {p0}, Lcom/itextpdf/io/font/CFFFontSubset;->getCard8()C

    move-result v3

    aput v3, v1, v2

    .line 267
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 272
    .end local v2    # "i":I
    :cond_2
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    iget-object v3, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v3, v3, p1

    iget v3, v3, Lcom/itextpdf/io/font/CFFFont$Font;->nglyphs:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Lcom/itextpdf/io/font/CFFFont$Font;->FDSelectLength:I

    .line 273
    nop

    .line 302
    :goto_3
    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFontSubset;->fonts:[Lcom/itextpdf/io/font/CFFFont$Font;

    aget-object v2, v2, p1

    iput-object v1, v2, Lcom/itextpdf/io/font/CFFFont$Font;->FDSelect:[I

    .line 303
    return-void

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1
        0x3 -> :sswitch_0
    .end sparse-switch
.end method
