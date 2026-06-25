.class public final Lcom/itextpdf/kernel/pdf/tagging/StandardNamespaces;
.super Ljava/lang/Object;
.source "StandardNamespaces.java"


# static fields
.field private static final MATH_ML:Ljava/lang/String; = "http://www.w3.org/1998/Math/MathML"

.field public static final PDF_1_7:Ljava/lang/String; = "http://iso.org/pdf/ssn"

.field public static final PDF_2_0:Ljava/lang/String; = "http://iso.org/pdf2/ssn"

.field private static final STD_STRUCT_NAMESPACE_1_7_TYPES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final STD_STRUCT_NAMESPACE_2_0_TYPES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 26

    .line 55
    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0x31

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Document"

    aput-object v3, v1, v2

    const/4 v4, 0x1

    const-string v5, "Part"

    aput-object v5, v1, v4

    const/4 v6, 0x2

    const-string v7, "Div"

    aput-object v7, v1, v6

    const/4 v8, 0x3

    const-string v9, "P"

    aput-object v9, v1, v8

    const/4 v10, 0x4

    const-string v11, "H"

    aput-object v11, v1, v10

    const-string v12, "H1"

    const/4 v13, 0x5

    aput-object v12, v1, v13

    const-string v12, "H2"

    const/4 v14, 0x6

    aput-object v12, v1, v14

    const-string v12, "H3"

    const/4 v15, 0x7

    aput-object v12, v1, v15

    const-string v12, "H4"

    const/16 v16, 0x8

    aput-object v12, v1, v16

    const-string v12, "H5"

    const/16 v17, 0x9

    aput-object v12, v1, v17

    const-string v12, "H6"

    const/16 v18, 0xa

    aput-object v12, v1, v18

    const/16 v12, 0xb

    const-string v19, "Lbl"

    aput-object v19, v1, v12

    const/16 v20, 0xc

    const-string v21, "Span"

    aput-object v21, v1, v20

    const/16 v22, 0xd

    const-string v23, "Link"

    aput-object v23, v1, v22

    const/16 v24, 0xe

    const-string v25, "Annot"

    aput-object v25, v1, v24

    const/16 v24, 0xf

    const-string v25, "Form"

    aput-object v25, v1, v24

    const/16 v24, 0x10

    const-string v25, "Ruby"

    aput-object v25, v1, v24

    const/16 v24, 0x11

    const-string v25, "RB"

    aput-object v25, v1, v24

    const/16 v24, 0x12

    const-string v25, "RT"

    aput-object v25, v1, v24

    const/16 v24, 0x13

    const-string v25, "RP"

    aput-object v25, v1, v24

    const/16 v24, 0x14

    const-string v25, "Warichu"

    aput-object v25, v1, v24

    const/16 v24, 0x15

    const-string v25, "WT"

    aput-object v25, v1, v24

    const/16 v24, 0x16

    const-string v25, "WP"

    aput-object v25, v1, v24

    const/16 v24, 0x17

    const-string v25, "L"

    aput-object v25, v1, v24

    const/16 v24, 0x18

    const-string v25, "LI"

    aput-object v25, v1, v24

    const/16 v24, 0x19

    const-string v25, "LBody"

    aput-object v25, v1, v24

    const/16 v24, 0x1a

    const-string v25, "Table"

    aput-object v25, v1, v24

    const/16 v24, 0x1b

    const-string v25, "TR"

    aput-object v25, v1, v24

    const/16 v24, 0x1c

    const-string v25, "TH"

    aput-object v25, v1, v24

    const/16 v24, 0x1d

    const-string v25, "TD"

    aput-object v25, v1, v24

    const/16 v24, 0x1e

    const-string v25, "THead"

    aput-object v25, v1, v24

    const/16 v24, 0x1f

    const-string v25, "TBody"

    aput-object v25, v1, v24

    const/16 v24, 0x20

    const-string v25, "TFoot"

    aput-object v25, v1, v24

    const/16 v24, 0x21

    const-string v25, "Caption"

    aput-object v25, v1, v24

    const/16 v24, 0x22

    const-string v25, "Figure"

    aput-object v25, v1, v24

    const/16 v24, 0x23

    const-string v25, "Formula"

    aput-object v25, v1, v24

    const/16 v24, 0x24

    const-string v25, "Sect"

    aput-object v25, v1, v24

    const/16 v24, 0x25

    const-string v25, "Art"

    aput-object v25, v1, v24

    const/16 v24, 0x26

    const-string v25, "BlockQuote"

    aput-object v25, v1, v24

    const/16 v24, 0x27

    const-string v25, "TOC"

    aput-object v25, v1, v24

    const/16 v24, 0x28

    const-string v25, "TOCI"

    aput-object v25, v1, v24

    const/16 v24, 0x29

    const-string v25, "Index"

    aput-object v25, v1, v24

    const/16 v24, 0x2a

    const-string v25, "NonStruct"

    aput-object v25, v1, v24

    const/16 v24, 0x2b

    const-string v25, "Private"

    aput-object v25, v1, v24

    const/16 v24, 0x2c

    const-string v25, "Quote"

    aput-object v25, v1, v24

    const/16 v24, 0x2d

    const-string v25, "Note"

    aput-object v25, v1, v24

    const/16 v24, 0x2e

    const-string v25, "Reference"

    aput-object v25, v1, v24

    const/16 v24, 0x2f

    const-string v25, "BibEntry"

    aput-object v25, v1, v24

    const/16 v24, 0x30

    const-string v25, "Code"

    aput-object v25, v1, v24

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/tagging/StandardNamespaces;->STD_STRUCT_NAMESPACE_1_7_TYPES:Ljava/util/Set;

    .line 109
    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0x28

    new-array v1, v1, [Ljava/lang/String;

    aput-object v3, v1, v2

    const-string v2, "DocumentFragment"

    aput-object v2, v1, v4

    aput-object v5, v1, v6

    const-string v2, "Sect"

    aput-object v2, v1, v8

    const-string v2, "NonStruct"

    aput-object v2, v1, v10

    aput-object v7, v1, v13

    const-string v2, "Aside"

    aput-object v2, v1, v14

    const-string v2, "Title"

    aput-object v2, v1, v15

    const-string v2, "Sub"

    aput-object v2, v1, v16

    aput-object v9, v1, v17

    aput-object v11, v1, v18

    aput-object v19, v1, v12

    const-string v2, "Em"

    aput-object v2, v1, v20

    const-string v2, "Strong"

    aput-object v2, v1, v22

    const/16 v2, 0xe

    aput-object v21, v1, v2

    const/16 v2, 0xf

    aput-object v23, v1, v2

    const/16 v2, 0x10

    const-string v3, "Annot"

    aput-object v3, v1, v2

    const/16 v2, 0x11

    const-string v3, "Form"

    aput-object v3, v1, v2

    const/16 v2, 0x12

    const-string v3, "Ruby"

    aput-object v3, v1, v2

    const/16 v2, 0x13

    const-string v3, "RB"

    aput-object v3, v1, v2

    const/16 v2, 0x14

    const-string v3, "RT"

    aput-object v3, v1, v2

    const/16 v2, 0x15

    const-string v3, "RP"

    aput-object v3, v1, v2

    const/16 v2, 0x16

    const-string v3, "Warichu"

    aput-object v3, v1, v2

    const/16 v2, 0x17

    const-string v3, "WT"

    aput-object v3, v1, v2

    const/16 v2, 0x18

    const-string v3, "WP"

    aput-object v3, v1, v2

    const/16 v2, 0x19

    const-string v3, "FENote"

    aput-object v3, v1, v2

    const/16 v2, 0x1a

    const-string v3, "L"

    aput-object v3, v1, v2

    const/16 v2, 0x1b

    const-string v3, "LI"

    aput-object v3, v1, v2

    const/16 v2, 0x1c

    const-string v3, "LBody"

    aput-object v3, v1, v2

    const/16 v2, 0x1d

    const-string v3, "Table"

    aput-object v3, v1, v2

    const/16 v2, 0x1e

    const-string v3, "TR"

    aput-object v3, v1, v2

    const/16 v2, 0x1f

    const-string v3, "TH"

    aput-object v3, v1, v2

    const/16 v2, 0x20

    const-string v3, "TD"

    aput-object v3, v1, v2

    const/16 v2, 0x21

    const-string v3, "THead"

    aput-object v3, v1, v2

    const/16 v2, 0x22

    const-string v3, "TBody"

    aput-object v3, v1, v2

    const/16 v2, 0x23

    const-string v3, "TFoot"

    aput-object v3, v1, v2

    const/16 v2, 0x24

    const-string v3, "Caption"

    aput-object v3, v1, v2

    const/16 v2, 0x25

    const-string v3, "Figure"

    aput-object v3, v1, v2

    const/16 v2, 0x26

    const-string v3, "Formula"

    aput-object v3, v1, v2

    const/16 v2, 0x27

    const-string v3, "Artifact"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/tagging/StandardNamespaces;->STD_STRUCT_NAMESPACE_2_0_TYPES:Ljava/util/Set;

    .line 153
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDefault()Ljava/lang/String;
    .locals 1

    .line 162
    const-string v0, "http://iso.org/pdf/ssn"

    return-object v0
.end method

.method public static isHnRole(Ljava/lang/String;)Z
    .locals 4
    .param p0, "role"    # Ljava/lang/String;

    .line 201
    const-string v0, "H"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v2, 0x1

    if-le v0, v2, :cond_1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v3, 0x30

    if-eq v0, v3, :cond_1

    .line 203
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v0, :cond_0

    move v1, v2

    :cond_0
    return v1

    .line 204
    :catch_0
    move-exception v0

    .line 208
    :cond_1
    return v1
.end method

.method public static isKnownDomainSpecificNamespace(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Z
    .locals 2
    .param p0, "namespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 172
    const-string v0, "http://www.w3.org/1998/Math/MathML"

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static roleBelongsToStandardNamespace(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "role"    # Ljava/lang/String;
    .param p1, "standardNamespaceName"    # Ljava/lang/String;

    .line 184
    const-string v0, "http://iso.org/pdf/ssn"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 185
    sget-object v0, Lcom/itextpdf/kernel/pdf/tagging/StandardNamespaces;->STD_STRUCT_NAMESPACE_1_7_TYPES:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 186
    :cond_0
    const-string v0, "http://iso.org/pdf2/ssn"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 187
    sget-object v0, Lcom/itextpdf/kernel/pdf/tagging/StandardNamespaces;->STD_STRUCT_NAMESPACE_2_0_TYPES:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/itextpdf/kernel/pdf/tagging/StandardNamespaces;->isHnRole(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v1, 0x1

    :cond_2
    return v1

    .line 190
    :cond_3
    return v1
.end method
