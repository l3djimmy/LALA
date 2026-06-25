.class public Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
.super Ljava/lang/Object;
.source "XMPPathSegment.java"


# instance fields
.field private alias:Z

.field private aliasForm:I

.field private kind:I

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "kind"    # I

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    .line 71
    iput p2, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->kind:I

    .line 72
    return-void
.end method


# virtual methods
.method public getAliasForm()I
    .locals 1

    .line 134
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->aliasForm:I

    return v0
.end method

.method public getKind()I
    .locals 1

    .line 80
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->kind:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    return-object v0
.end method

.method public isAlias()Z
    .locals 1

    .line 125
    iget-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->alias:Z

    return v0
.end method

.method public setAlias(Z)V
    .locals 0
    .param p1, "alias"    # Z

    .line 116
    iput-boolean p1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->alias:Z

    .line 117
    return-void
.end method

.method public setAliasForm(I)V
    .locals 0
    .param p1, "aliasForm"    # I

    .line 143
    iput p1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->aliasForm:I

    .line 144
    return-void
.end method

.method public setKind(I)V
    .locals 0
    .param p1, "kind"    # I

    .line 89
    iput p1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->kind:I

    .line 90
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 107
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    .line 108
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 152
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->kind:I

    packed-switch v0, :pswitch_data_0

    .line 165
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    return-object v0

    .line 161
    :pswitch_0
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    return-object v0

    .line 158
    :pswitch_1
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
