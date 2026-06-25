.class Lcom/itextpdf/kernel/xmp/impl/XMPNode;
.super Ljava/lang/Object;
.source "XMPNode.java"

# interfaces
.implements Ljava/lang/Comparable;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private alias:Z

.field private children:Ljava/util/List;

.field private hasAliases:Z

.field private hasValueChild:Z

.field private implicit:Z

.field private name:Ljava/lang/String;

.field private options:Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

.field private parent:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

.field private qualifier:Ljava/util/List;

.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 110
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 111
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->children:Ljava/util/List;

    .line 70
    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    .line 72
    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->options:Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 96
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 97
    iput-object p2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 98
    iput-object p3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->options:Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 99
    return-void
.end method

.method private assertChildNotExisting(Ljava/lang/String;)V
    .locals 3
    .param p1, "childName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 920
    const-string v0, "[]"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 921
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->findChildByName(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 923
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Duplicate property or field node \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xcb

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 926
    :cond_1
    :goto_0
    return-void
.end method

.method private assertQualifierNotExisting(Ljava/lang/String;)V
    .locals 3
    .param p1, "qualifierName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 936
    const-string v0, "[]"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 937
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->findQualifierByName(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 939
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Duplicate \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' qualifier"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xcb

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 941
    :cond_1
    :goto_0
    return-void
.end method

.method private dumpNode(Ljava/lang/StringBuffer;ZII)V
    .locals 5
    .param p1, "result"    # Ljava/lang/StringBuffer;
    .param p2, "recursive"    # Z
    .param p3, "indent"    # I
    .param p4, "index"    # I

    .line 726
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_0

    .line 728
    const/16 v1, 0x9

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 726
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 732
    .end local v0    # "i":I
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->parent:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const/16 v1, 0x29

    if-eqz v0, :cond_3

    .line 734
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isQualifier()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 736
    const/16 v0, 0x3f

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 737
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 739
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getParent()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 741
    const/16 v0, 0x5b

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 742
    invoke-virtual {p1, p4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 743
    const/16 v0, 0x5d

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 747
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 753
    :cond_3
    const-string v0, "ROOT NODE"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 754
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->name:Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_4

    .line 757
    const-string v0, " ("

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 758
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 759
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 763
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->value:Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->value:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_5

    .line 765
    const-string v0, " = \""

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 766
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->value:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 767
    const/16 v0, 0x22

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 771
    :cond_5
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    const/4 v2, -0x1

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->containsOneOf(I)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 773
    const-string v0, "\t("

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 774
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 775
    const-string v0, " : "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 776
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOptionsString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 777
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 780
    :cond_6
    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 783
    if-eqz p2, :cond_9

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 785
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v0

    .line 786
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifierLength()I

    move-result v1

    new-array v1, v1, [Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    check-cast v0, [Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 787
    .local v0, "quals":[Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v1, 0x0

    .line 788
    .local v1, "i":I
    :goto_2
    array-length v2, v0

    if-le v2, v1, :cond_8

    aget-object v2, v0, v1

    .line 789
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "xml:lang"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    aget-object v2, v0, v1

    .line 790
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "rdf:type"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 793
    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 795
    :cond_8
    array-length v2, v0

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;II)V

    .line 796
    const/4 v1, 0x0

    :goto_3
    array-length v2, v0

    if-ge v1, v2, :cond_9

    .line 798
    aget-object v2, v0, v1

    .line 799
    .local v2, "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    add-int/lit8 v3, p3, 0x2

    add-int/lit8 v4, v1, 0x1

    invoke-direct {v2, p1, p2, v3, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->dumpNode(Ljava/lang/StringBuffer;ZII)V

    .line 796
    .end local v2    # "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 804
    .end local v0    # "quals":[Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v1    # "i":I
    :cond_9
    if-eqz p2, :cond_b

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 806
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    .line 807
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v1

    new-array v1, v1, [Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    check-cast v0, [Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 808
    .local v0, "children":[Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v1

    if-nez v1, :cond_a

    .line 810
    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 812
    :cond_a
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_4
    array-length v2, v0

    if-ge v1, v2, :cond_b

    .line 814
    aget-object v2, v0, v1

    .line 815
    .local v2, "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    add-int/lit8 v3, p3, 0x1

    add-int/lit8 v4, v1, 0x1

    invoke-direct {v2, p1, p2, v3, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->dumpNode(Ljava/lang/StringBuffer;ZII)V

    .line 812
    .end local v2    # "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 818
    .end local v0    # "children":[Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v1    # "i":I
    :cond_b
    return-void
.end method

.method private find(Ljava/util/List;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 3
    .param p1, "list"    # Ljava/util/List;
    .param p2, "expr"    # Ljava/lang/String;

    .line 898
    if-eqz p1, :cond_1

    .line 900
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 902
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 903
    .local v1, "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 905
    return-object v1

    .line 907
    .end local v1    # "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_0
    goto :goto_0

    .line 909
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private getQualifier()Ljava/util/List;
    .locals 2

    .line 868
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    if-nez v0, :cond_0

    .line 870
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    .line 872
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    return-object v0
.end method

.method private isLanguageNode()Z
    .locals 2

    .line 826
    const-string/jumbo v0, "xml:lang"

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isTypeNode()Z
    .locals 2

    .line 835
    const-string/jumbo v0, "rdf:type"

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public addChild(ILcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "node"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 170
    invoke-virtual {p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->assertChildNotExisting(Ljava/lang/String;)V

    .line 171
    invoke-virtual {p2, p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setParent(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 172
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 173
    return-void
.end method

.method public addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 1
    .param p1, "node"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 154
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->assertChildNotExisting(Ljava/lang/String;)V

    .line 155
    invoke-virtual {p1, p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setParent(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 156
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    return-void
.end method

.method public addQualifier(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 2
    .param p1, "qualNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 285
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->assertQualifierNotExisting(Ljava/lang/String;)V

    .line 286
    invoke-virtual {p1, p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setParent(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 287
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setQualifier(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 288
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setHasQualifiers(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 291
    invoke-direct {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->isLanguageNode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 294
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->options:Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setHasLanguage(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 295
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 297
    :cond_0
    invoke-direct {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->isTypeNode()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 300
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->options:Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setHasType(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 301
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->options:Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 302
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v1

    .line 301
    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 308
    :cond_1
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 310
    :goto_0
    return-void
.end method

.method protected cleanupChildren()V
    .locals 1

    .line 220
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->children:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 222
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->children:Ljava/util/List;

    .line 224
    :cond_0
    return-void
.end method

.method public clear()V
    .locals 1

    .line 119
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->options:Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 120
    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 121
    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 122
    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->children:Ljava/util/List;

    .line 123
    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    .line 124
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 4

    .line 448
    :try_start_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOptions()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>(I)V
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 454
    .local v0, "newOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    goto :goto_0

    .line 450
    .end local v0    # "newOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    :catch_0
    move-exception v0

    .line 453
    .local v0, "e":Lcom/itextpdf/kernel/xmp/XMPException;
    new-instance v1, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-direct {v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>()V

    move-object v0, v1

    .line 456
    .local v0, "newOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    :goto_0
    new-instance v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    iget-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->name:Ljava/lang/String;

    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->value:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 457
    .local v1, "newNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->cloneSubtree(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 459
    return-object v1
.end method

.method public cloneSubtree(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 3
    .param p1, "destination"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 473
    :try_start_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 475
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 476
    .local v1, "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 477
    .end local v1    # "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_0

    .line 479
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 481
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 482
    .local v1, "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addQualifier(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 483
    .end local v1    # "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_1

    .line 489
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_1
    nop

    .line 491
    return-void

    .line 485
    :catch_0
    move-exception v0

    .line 488
    .local v0, "e":Lcom/itextpdf/kernel/xmp/XMPException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public compareTo(Ljava/lang/Object;)I
    .locals 2
    .param p1, "xmpNode"    # Ljava/lang/Object;

    .line 512
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 514
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->value:Ljava/lang/String;

    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0

    .line 518
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->name:Ljava/lang/String;

    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public dumpNode(Z)Ljava/lang/String;
    .locals 2
    .param p1, "recursive"    # Z

    .line 501
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0x200

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 502
    .local v0, "result":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->dumpNode(Ljava/lang/StringBuffer;ZII)V

    .line 503
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public findChildByName(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 1
    .param p1, "expr"    # Ljava/lang/String;

    .line 253
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->find(Ljava/util/List;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    return-object v0
.end method

.method public findQualifierByName(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 1
    .param p1, "expr"    # Ljava/lang/String;

    .line 362
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->find(Ljava/util/List;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    return-object v0
.end method

.method public getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 2
    .param p1, "index"    # I

    .line 142
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    return-object v0
.end method

.method protected getChildren()Ljava/util/List;
    .locals 2

    .line 846
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->children:Ljava/util/List;

    if-nez v0, :cond_0

    .line 848
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->children:Ljava/util/List;

    .line 850
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->children:Ljava/util/List;

    return-object v0
.end method

.method public getChildrenLength()I
    .locals 1

    .line 241
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->children:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->children:Ljava/util/List;

    .line 242
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 241
    :goto_0
    return v0
.end method

.method public getHasAliases()Z
    .locals 1

    .line 605
    iget-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasAliases:Z

    return v0
.end method

.method public getHasValueChild()Z
    .locals 1

    .line 641
    iget-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasValueChild:Z

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 528
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 1

    .line 564
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->options:Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    if-nez v0, :cond_0

    .line 566
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->options:Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 568
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->options:Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    return-object v0
.end method

.method public getParent()Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->parent:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    return-object v0
.end method

.method public getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 2
    .param p1, "index"    # I

    .line 263
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v0

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    return-object v0
.end method

.method public getQualifierLength()I
    .locals 1

    .line 272
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    .line 273
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 272
    :goto_0
    return v0
.end method

.method public getUnmodifiableChildren()Ljava/util/List;
    .locals 2

    .line 859
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 546
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->value:Ljava/lang/String;

    return-object v0
.end method

.method public hasChildren()Z
    .locals 1

    .line 371
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->children:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->children:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasQualifier()Z
    .locals 1

    .line 397
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isAlias()Z
    .locals 1

    .line 623
    iget-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->alias:Z

    return v0
.end method

.method public isImplicit()Z
    .locals 1

    .line 587
    iget-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->implicit:Z

    return v0
.end method

.method public iterateChildren()Ljava/util/Iterator;
    .locals 1

    .line 381
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->children:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 383
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0

    .line 387
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyIterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public iterateQualifier()Ljava/util/Iterator;
    .locals 2

    .line 407
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 409
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 411
    .local v0, "it":Ljava/util/Iterator;
    new-instance v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode$1;

    invoke-direct {v1, p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode$1;-><init>(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/util/Iterator;)V

    return-object v1

    .line 433
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyIterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public removeChild(I)V
    .locals 2
    .param p1, "itemIndex"    # I

    .line 195
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 196
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->cleanupChildren()V

    .line 197
    return-void
.end method

.method public removeChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 1
    .param p1, "node"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 208
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 209
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->cleanupChildren()V

    .line 210
    return-void
.end method

.method public removeChildren()V
    .locals 1

    .line 232
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->children:Ljava/util/List;

    .line 233
    return-void
.end method

.method public removeQualifier(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 3
    .param p1, "qualNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 319
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    .line 320
    .local v0, "opts":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    invoke-direct {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->isLanguageNode()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 323
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setHasLanguage(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    goto :goto_0

    .line 325
    :cond_0
    invoke-direct {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->isTypeNode()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 328
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setHasType(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 331
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 332
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_2

    .line 334
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setHasQualifiers(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 335
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    .line 338
    :cond_2
    return-void
.end method

.method public removeQualifiers()V
    .locals 2

    .line 346
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    .line 348
    .local v0, "opts":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setHasQualifiers(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 349
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setHasLanguage(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 350
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setHasType(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 351
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    .line 352
    return-void
.end method

.method public replaceChild(ILcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "node"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 184
    invoke-virtual {p2, p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setParent(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 185
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 186
    return-void
.end method

.method public setAlias(Z)V
    .locals 0
    .param p1, "alias"    # Z

    .line 632
    iput-boolean p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->alias:Z

    .line 633
    return-void
.end method

.method public setHasAliases(Z)V
    .locals 0
    .param p1, "hasAliases"    # Z

    .line 614
    iput-boolean p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasAliases:Z

    .line 615
    return-void
.end method

.method public setHasValueChild(Z)V
    .locals 0
    .param p1, "hasValueChild"    # Z

    .line 650
    iput-boolean p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasValueChild:Z

    .line 651
    return-void
.end method

.method public setImplicit(Z)V
    .locals 0
    .param p1, "implicit"    # Z

    .line 596
    iput-boolean p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->implicit:Z

    .line 597
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 537
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 538
    return-void
.end method

.method public setOptions(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 0
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 578
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->options:Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 579
    return-void
.end method

.method protected setParent(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 0
    .param p1, "parent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 885
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->parent:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 886
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .line 555
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 556
    return-void
.end method

.method public sort()V
    .locals 5

    .line 669
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 671
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v0

    .line 672
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifierLength()I

    move-result v1

    new-array v1, v1, [Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    check-cast v0, [Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 673
    .local v0, "quals":[Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v1, 0x0

    .line 674
    .local v1, "sortFrom":I
    :goto_0
    array-length v2, v0

    if-le v2, v1, :cond_1

    aget-object v2, v0, v1

    .line 676
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "xml:lang"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    aget-object v2, v0, v1

    .line 677
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "rdf:type"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 680
    :cond_0
    aget-object v2, v0, v1

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->sort()V

    .line 681
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 684
    :cond_1
    array-length v2, v0

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;II)V

    .line 685
    iget-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    .line 686
    .local v2, "it":Ljava/util/ListIterator;
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    array-length v4, v0

    if-ge v3, v4, :cond_2

    .line 688
    invoke-interface {v2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    .line 689
    aget-object v4, v0, v3

    invoke-interface {v2, v4}, Ljava/util/ListIterator;->set(Ljava/lang/Object;)V

    .line 690
    aget-object v4, v0, v3

    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->sort()V

    .line 686
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 695
    .end local v0    # "quals":[Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v1    # "sortFrom":I
    .end local v2    # "it":Ljava/util/ListIterator;
    .end local v3    # "j":I
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 697
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v0

    if-nez v0, :cond_3

    .line 699
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->children:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 701
    :cond_3
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 703
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->sort()V

    goto :goto_2

    .line 707
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_4
    return-void
.end method
