.class public Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
.super Ljava/lang/Object;
.source "XMPMetaImpl.java"

# interfaces
.implements Lcom/itextpdf/kernel/xmp/XMPConst;
.implements Lcom/itextpdf/kernel/xmp/XMPMeta;


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final VALUE_BASE64:I = 0x7

.field private static final VALUE_BOOLEAN:I = 0x1

.field private static final VALUE_CALENDAR:I = 0x6

.field private static final VALUE_DATE:I = 0x5

.field private static final VALUE_DOUBLE:I = 0x4

.field private static final VALUE_INTEGER:I = 0x2

.field private static final VALUE_LONG:I = 0x3

.field private static final VALUE_STRING:I


# instance fields
.field private packetHeader:Ljava/lang/String;

.field private tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 57
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->packetHeader:Ljava/lang/String;

    .line 88
    new-instance v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-direct {v1, v0, v0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 89
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 1
    .param p1, "tree"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->packetHeader:Ljava/lang/String;

    .line 101
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 102
    return-void
.end method

.method private doSetArrayItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ILjava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Z)V
    .locals 5
    .param p1, "arrayNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "itemIndex"    # I
    .param p3, "itemValue"    # Ljava/lang/String;
    .param p4, "itemOptions"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .param p5, "insert"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 1129
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const-string v1, "[]"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 1130
    .local v0, "itemNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-static {p4, p3}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->verifySetOptions(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Ljava/lang/Object;)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object p4

    .line 1134
    const/4 v1, 0x1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v2

    if-eqz p5, :cond_0

    add-int/2addr v2, v1

    .line 1135
    .local v2, "maxIndex":I
    :cond_0
    const/4 v3, -0x1

    if-ne p2, v3, :cond_1

    .line 1137
    move p2, v2

    .line 1140
    :cond_1
    if-gt v1, p2, :cond_3

    if-gt p2, v2, :cond_3

    .line 1142
    if-nez p5, :cond_2

    .line 1144
    invoke-virtual {p1, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(I)V

    .line 1146
    :cond_2
    invoke-virtual {p1, p2, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(ILcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 1147
    const/4 v1, 0x0

    invoke-virtual {p0, v0, p3, p4, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Z)V

    .line 1153
    return-void

    .line 1151
    :cond_3
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Array index out of bounds"

    const/16 v4, 0x68

    invoke-direct {v1, v3, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method private evaluateNodeValue(ILcom/itextpdf/kernel/xmp/impl/XMPNode;)Ljava/lang/Object;
    .locals 3
    .param p1, "valueType"    # I
    .param p2, "propNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 1213
    invoke-virtual {p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 1214
    .local v0, "rawValue":Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 1244
    if-nez v0, :cond_1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1236
    :pswitch_0
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/XMPUtils;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v1

    .line 1237
    .local v1, "value":Ljava/lang/Object;
    goto :goto_1

    .line 1232
    .end local v1    # "value":Ljava/lang/Object;
    :pswitch_1
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/XMPUtils;->convertToDate(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/XMPDateTime;

    move-result-object v1

    .line 1233
    .local v1, "dt":Lcom/itextpdf/kernel/xmp/XMPDateTime;
    invoke-interface {v1}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getCalendar()Ljava/util/Calendar;

    move-result-object v2

    .line 1234
    .local v2, "value":Ljava/lang/Object;
    move-object v1, v2

    goto :goto_1

    .line 1229
    .end local v1    # "dt":Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .end local v2    # "value":Ljava/lang/Object;
    :pswitch_2
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/XMPUtils;->convertToDate(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/XMPDateTime;

    move-result-object v1

    .line 1230
    .local v1, "value":Ljava/lang/Object;
    goto :goto_1

    .line 1226
    .end local v1    # "value":Ljava/lang/Object;
    :pswitch_3
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/XMPUtils;->convertToDouble(Ljava/lang/String;)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 1227
    .restart local v1    # "value":Ljava/lang/Object;
    goto :goto_1

    .line 1223
    .end local v1    # "value":Ljava/lang/Object;
    :pswitch_4
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/XMPUtils;->convertToLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 1224
    .restart local v1    # "value":Ljava/lang/Object;
    goto :goto_1

    .line 1220
    .end local v1    # "value":Ljava/lang/Object;
    :pswitch_5
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/XMPUtils;->convertToInteger(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 1221
    .restart local v1    # "value":Ljava/lang/Object;
    goto :goto_1

    .line 1217
    .end local v1    # "value":Ljava/lang/Object;
    :pswitch_6
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/XMPUtils;->convertToBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 1218
    .restart local v1    # "value":Ljava/lang/Object;
    goto :goto_1

    .line 1244
    .end local v1    # "value":Ljava/lang/Object;
    :cond_0
    const-string v1, ""

    goto :goto_1

    :cond_1
    :goto_0
    move-object v1, v0

    .line 1247
    .restart local v1    # "value":Ljava/lang/Object;
    :goto_1
    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public appendArrayItem(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 10
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "arrayOptions"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .param p4, "itemValue"    # Ljava/lang/String;
    .param p5, "itemOptions"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 107
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 108
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    .line 110
    if-nez p3, :cond_0

    .line 112
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>()V

    move-object p3, v0

    .line 114
    :cond_0
    invoke-virtual {p3}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isOnlyArrayOptions()Z

    move-result v0

    const/16 v1, 0x67

    if-eqz v0, :cond_5

    .line 121
    const/4 v0, 0x0

    invoke-static {p3, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->verifySetOptions(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Ljava/lang/Object;)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object p3

    .line 127
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v2

    .line 131
    .local v2, "arrayPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const/4 v4, 0x0

    invoke-static {v3, v2, v4, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 133
    .local v0, "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/16 v3, 0x66

    if-eqz v0, :cond_2

    .line 137
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v5, v0

    goto :goto_0

    .line 139
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v4, "The named property is not an array"

    invoke-direct {v1, v4, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 149
    :cond_2
    invoke-virtual {p3}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 151
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const/4 v4, 0x1

    invoke-static {v1, v2, v4, p3}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 152
    if-eqz v0, :cond_3

    move-object v5, v0

    .line 165
    .end local v0    # "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .local v5, "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :goto_0
    const/4 v6, -0x1

    const/4 v9, 0x1

    move-object v4, p0

    move-object v7, p4

    move-object v8, p5

    .end local p4    # "itemValue":Ljava/lang/String;
    .end local p5    # "itemOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .local v7, "itemValue":Ljava/lang/String;
    .local v8, "itemOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    invoke-direct/range {v4 .. v9}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->doSetArrayItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ILjava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Z)V

    .line 166
    return-void

    .line 154
    .end local v5    # "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v7    # "itemValue":Ljava/lang/String;
    .end local v8    # "itemOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .restart local v0    # "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .restart local p4    # "itemValue":Ljava/lang/String;
    .restart local p5    # "itemOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    :cond_3
    move-object v7, p4

    move-object v8, p5

    .end local p4    # "itemValue":Ljava/lang/String;
    .end local p5    # "itemOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .restart local v7    # "itemValue":Ljava/lang/String;
    .restart local v8    # "itemOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    new-instance p4, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string p5, "Failure creating array node"

    invoke-direct {p4, p5, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p4

    .line 160
    .end local v7    # "itemValue":Ljava/lang/String;
    .end local v8    # "itemOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .restart local p4    # "itemValue":Ljava/lang/String;
    .restart local p5    # "itemOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    :cond_4
    move-object v7, p4

    move-object v8, p5

    .end local p4    # "itemValue":Ljava/lang/String;
    .end local p5    # "itemOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .restart local v7    # "itemValue":Ljava/lang/String;
    .restart local v8    # "itemOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    new-instance p4, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string p5, "Explicit arrayOptions required to create new array"

    invoke-direct {p4, p5, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p4

    .line 116
    .end local v0    # "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v2    # "arrayPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    .end local v7    # "itemValue":Ljava/lang/String;
    .end local v8    # "itemOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .restart local p4    # "itemValue":Ljava/lang/String;
    .restart local p5    # "itemOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    :cond_5
    move-object v7, p4

    move-object v8, p5

    .end local p4    # "itemValue":Ljava/lang/String;
    .end local p5    # "itemOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .restart local v7    # "itemValue":Ljava/lang/String;
    .restart local v8    # "itemOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    new-instance p4, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string p5, "Only array form flags allowed for arrayOptions"

    invoke-direct {p4, p5, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p4
.end method

.method public appendArrayItem(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "itemValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 171
    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    .end local p1    # "schemaNS":Ljava/lang/String;
    .end local p2    # "arrayName":Ljava/lang/String;
    .end local p3    # "itemValue":Ljava/lang/String;
    .local v1, "schemaNS":Ljava/lang/String;
    .local v2, "arrayName":Ljava/lang/String;
    .local v4, "itemValue":Ljava/lang/String;
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->appendArrayItem(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 172
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 2

    .line 1070
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 1071
    .local v0, "clonedTree":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    new-instance v1, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;-><init>(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    return-object v1
.end method

.method public countArrayItems(Ljava/lang/String;Ljava/lang/String;)I
    .locals 5
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 176
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 177
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    .line 179
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v0

    .line 180
    .local v0, "arrayPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v0, v3, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    .line 182
    .local v1, "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-nez v1, :cond_0

    .line 184
    return v3

    .line 187
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 189
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v2

    return v2

    .line 193
    :cond_1
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "The named property is not an array"

    const/16 v4, 0x66

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2
.end method

.method public deleteArrayItem(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "itemIndex"    # I

    .line 202
    :try_start_0
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 203
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    .line 205
    invoke-static {p2, p3}, Lcom/itextpdf/kernel/xmp/XMPPathFactory;->composeArrayItemPath(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "itemPath":Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->deleteProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    .end local v0    # "itemPath":Ljava/lang/String;
    goto :goto_0

    .line 208
    :catch_0
    move-exception v0

    .line 212
    :goto_0
    return-void
.end method

.method public deleteProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;

    .line 219
    :try_start_0
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 220
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    .line 222
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v0

    .line 224
    .local v0, "expPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v0, v2, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    .line 225
    .local v1, "propNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v1, :cond_0

    .line 227
    invoke-static {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->deleteNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 233
    .end local v0    # "expPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    .end local v1    # "propNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_0
    goto :goto_0

    .line 230
    :catch_0
    move-exception v0

    .line 234
    :goto_0
    return-void
.end method

.method public deleteQualifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "qualNS"    # Ljava/lang/String;
    .param p4, "qualName"    # Ljava/lang/String;

    .line 242
    :try_start_0
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 243
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    .line 245
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p3, p4}, Lcom/itextpdf/kernel/xmp/XMPPathFactory;->composeQualifierPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 246
    .local v0, "qualPath":Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->deleteProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 251
    .end local v0    # "qualPath":Ljava/lang/String;
    goto :goto_0

    .line 248
    :catch_0
    move-exception v0

    .line 252
    :goto_0
    return-void
.end method

.method public deleteStructField(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "structName"    # Ljava/lang/String;
    .param p3, "fieldNS"    # Ljava/lang/String;
    .param p4, "fieldName"    # Ljava/lang/String;

    .line 261
    :try_start_0
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 262
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertStructName(Ljava/lang/String;)V

    .line 264
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 265
    invoke-static {p3, p4}, Lcom/itextpdf/kernel/xmp/XMPPathFactory;->composeStructFieldPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 266
    .local v0, "fieldPath":Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->deleteProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 271
    .end local v0    # "fieldPath":Ljava/lang/String;
    goto :goto_0

    .line 268
    :catch_0
    move-exception v0

    .line 272
    :goto_0
    return-void
.end method

.method public doesArrayItemExist(Ljava/lang/String;Ljava/lang/String;I)Z
    .locals 2
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "itemIndex"    # I

    .line 297
    :try_start_0
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 298
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    .line 300
    invoke-static {p2, p3}, Lcom/itextpdf/kernel/xmp/XMPPathFactory;->composeArrayItemPath(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 301
    .local v0, "path":Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->doesPropertyExist(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 303
    .end local v0    # "path":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 305
    .local v0, "e":Lcom/itextpdf/kernel/xmp/XMPException;
    const/4 v1, 0x0

    return v1
.end method

.method public doesPropertyExist(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;

    .line 279
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 280
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    .line 282
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v1

    .line 283
    .local v1, "expPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    iget-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const/4 v3, 0x0

    invoke-static {v2, v1, v0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v2
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 284
    .local v2, "propNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    .line 286
    .end local v1    # "expPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    .end local v2    # "propNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :catch_0
    move-exception v1

    .line 288
    .local v1, "e":Lcom/itextpdf/kernel/xmp/XMPException;
    return v0
.end method

.method public doesQualifierExist(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "qualNS"    # Ljava/lang/String;
    .param p4, "qualName"    # Ljava/lang/String;

    .line 335
    :try_start_0
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 336
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    .line 338
    invoke-static {p3, p4}, Lcom/itextpdf/kernel/xmp/XMPPathFactory;->composeQualifierPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 339
    .local v0, "path":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->doesPropertyExist(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 341
    .end local v0    # "path":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 343
    .local v0, "e":Lcom/itextpdf/kernel/xmp/XMPException;
    const/4 v1, 0x0

    return v1
.end method

.method public doesStructFieldExist(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "structName"    # Ljava/lang/String;
    .param p3, "fieldNS"    # Ljava/lang/String;
    .param p4, "fieldName"    # Ljava/lang/String;

    .line 316
    :try_start_0
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 317
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertStructName(Ljava/lang/String;)V

    .line 319
    invoke-static {p3, p4}, Lcom/itextpdf/kernel/xmp/XMPPathFactory;->composeStructFieldPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 320
    .local v0, "path":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->doesPropertyExist(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 322
    .end local v0    # "path":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 324
    .local v0, "e":Lcom/itextpdf/kernel/xmp/XMPException;
    const/4 v1, 0x0

    return v1
.end method

.method public dumpObject()Ljava/lang/String;
    .locals 2

    .line 1078
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->dumpNode(Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getArrayItem(Ljava/lang/String;Ljava/lang/String;I)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    .locals 2
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "itemIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 351
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 352
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    .line 354
    invoke-static {p2, p3}, Lcom/itextpdf/kernel/xmp/XMPPathFactory;->composeArrayItemPath(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 355
    .local v0, "itemPath":Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;

    move-result-object v1

    return-object v1
.end method

.method public getLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    .locals 6
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "altTextName"    # Ljava/lang/String;
    .param p3, "genericLang"    # Ljava/lang/String;
    .param p4, "specificLang"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 362
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 363
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    .line 364
    invoke-static {p4}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSpecificLang(Ljava/lang/String;)V

    .line 366
    const/4 v0, 0x0

    if-eqz p3, :cond_0

    invoke-static {p3}, Lcom/itextpdf/kernel/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    .line 367
    .end local p3    # "genericLang":Ljava/lang/String;
    .local v1, "genericLang":Ljava/lang/String;
    :goto_0
    invoke-static {p4}, Lcom/itextpdf/kernel/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 369
    .end local p4    # "specificLang":Ljava/lang/String;
    .local p3, "specificLang":Ljava/lang/String;
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object p4

    .line 370
    .local p4, "arrayPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    iget-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const/4 v3, 0x0

    invoke-static {v2, p4, v3, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v2

    .line 371
    .local v2, "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-nez v2, :cond_1

    .line 373
    return-object v0

    .line 376
    :cond_1
    invoke-static {v2, v1, p3}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->chooseLocalizedText(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v4

    .line 377
    .local v4, "result":[Ljava/lang/Object;
    aget-object v3, v4, v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 378
    .local v3, "match":I
    const/4 v5, 0x1

    aget-object v5, v4, v5

    check-cast v5, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 380
    .local v5, "itemNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v3, :cond_2

    .line 382
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl$1;

    invoke-direct {v0, p0, v5}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl$1;-><init>(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    return-object v0

    .line 410
    :cond_2
    return-object v0
.end method

.method public getObjectName()Ljava/lang/String;
    .locals 1

    .line 1037
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public getPacketHeader()Ljava/lang/String;
    .locals 1

    .line 1049
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->packetHeader:Ljava/lang/String;

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 605
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getProperty(Ljava/lang/String;Ljava/lang/String;I)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;

    move-result-object v0

    return-object v0
.end method

.method protected getProperty(Ljava/lang/String;Ljava/lang/String;I)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    .locals 5
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "valueType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 630
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 631
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    .line 633
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v0

    .line 634
    .local v0, "expPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v0, v2, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    .line 636
    .local v1, "propNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v1, :cond_2

    .line 638
    if-eqz p3, :cond_1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 640
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Property must be simple when a value type is requested"

    const/16 v4, 0x66

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 644
    :cond_1
    :goto_0
    invoke-direct {p0, p3, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->evaluateNodeValue(ILcom/itextpdf/kernel/xmp/impl/XMPNode;)Ljava/lang/Object;

    move-result-object v2

    .line 646
    .local v2, "value":Ljava/lang/Object;
    new-instance v3, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl$2;

    invoke-direct {v3, p0, v2, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl$2;-><init>(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    return-object v3

    .line 674
    .end local v2    # "value":Ljava/lang/Object;
    :cond_2
    return-object v3
.end method

.method public getPropertyBase64(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 842
    const/4 v0, 0x7

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    check-cast v0, [B

    return-object v0
.end method

.method public getPropertyBoolean(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 722
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    return-object v0
.end method

.method public getPropertyCalendar(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Calendar;
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 822
    const/4 v0, 0x6

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    return-object v0
.end method

.method public getPropertyDate(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 802
    const/4 v0, 0x5

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/xmp/XMPDateTime;

    return-object v0
.end method

.method public getPropertyDouble(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Double;
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 782
    const/4 v0, 0x4

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    return-object v0
.end method

.method public getPropertyInteger(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 742
    const/4 v0, 0x2

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    return-object v0
.end method

.method public getPropertyLong(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Long;
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 762
    const/4 v0, 0x3

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    return-object v0
.end method

.method protected getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;
    .locals 5
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "valueType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 697
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 698
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    .line 700
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v0

    .line 701
    .local v0, "expPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v0, v2, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    .line 703
    .local v1, "propNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v1, :cond_2

    .line 705
    if-eqz p3, :cond_1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 707
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Property must be simple when a value type is requested"

    const/16 v4, 0x66

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 711
    :cond_1
    :goto_0
    invoke-direct {p0, p3, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->evaluateNodeValue(ILcom/itextpdf/kernel/xmp/impl/XMPNode;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 715
    :cond_2
    return-object v3
.end method

.method public getPropertyString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 848
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getQualifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    .locals 2
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "qualNS"    # Ljava/lang/String;
    .param p4, "qualName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 870
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 871
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    .line 873
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p3, p4}, Lcom/itextpdf/kernel/xmp/XMPPathFactory;->composeQualifierPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 874
    .local v0, "qualPath":Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;

    move-result-object v1

    return-object v1
.end method

.method public getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 1

    .line 1103
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    return-object v0
.end method

.method public getStructField(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    .locals 2
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "structName"    # Ljava/lang/String;
    .param p3, "fieldNS"    # Ljava/lang/String;
    .param p4, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 882
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 883
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertStructName(Ljava/lang/String;)V

    .line 885
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p3, p4}, Lcom/itextpdf/kernel/xmp/XMPPathFactory;->composeStructFieldPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 886
    .local v0, "fieldPath":Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;

    move-result-object v1

    return-object v1
.end method

.method public insertArrayItem(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 6
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "itemIndex"    # I
    .param p4, "itemValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 961
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    .end local p1    # "schemaNS":Ljava/lang/String;
    .end local p2    # "arrayName":Ljava/lang/String;
    .end local p3    # "itemIndex":I
    .end local p4    # "itemValue":Ljava/lang/String;
    .local v1, "schemaNS":Ljava/lang/String;
    .local v2, "arrayName":Ljava/lang/String;
    .local v3, "itemIndex":I
    .local v4, "itemValue":Ljava/lang/String;
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->insertArrayItem(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 962
    return-void
.end method

.method public insertArrayItem(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 10
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "itemIndex"    # I
    .param p4, "itemValue"    # Ljava/lang/String;
    .param p5, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 940
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 941
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    .line 944
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v0

    .line 945
    .local v0, "arrayPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v0, v2, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v5

    .line 947
    .local v5, "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v5, :cond_0

    .line 949
    const/4 v9, 0x1

    move-object v4, p0

    move v6, p3

    move-object v7, p4

    move-object v8, p5

    .end local p3    # "itemIndex":I
    .end local p4    # "itemValue":Ljava/lang/String;
    .end local p5    # "options":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .local v6, "itemIndex":I
    .local v7, "itemValue":Ljava/lang/String;
    .local v8, "options":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    invoke-direct/range {v4 .. v9}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->doSetArrayItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ILjava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Z)V

    .line 955
    return-void

    .line 953
    .end local v6    # "itemIndex":I
    .end local v7    # "itemValue":Ljava/lang/String;
    .end local v8    # "options":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .restart local p3    # "itemIndex":I
    .restart local p4    # "itemValue":Ljava/lang/String;
    .restart local p5    # "options":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    :cond_0
    move v6, p3

    move-object v7, p4

    move-object v8, p5

    .end local p3    # "itemIndex":I
    .end local p4    # "itemValue":Ljava/lang/String;
    .end local p5    # "options":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .restart local v6    # "itemIndex":I
    .restart local v7    # "itemValue":Ljava/lang/String;
    .restart local v8    # "options":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    new-instance p3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string p4, "Specified array does not exist"

    const/16 p5, 0x66

    invoke-direct {p3, p4, p5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p3
.end method

.method public iterator()Lcom/itextpdf/kernel/xmp/XMPIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 892
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->iterator(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/IteratorOptions;)Lcom/itextpdf/kernel/xmp/XMPIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator(Lcom/itextpdf/kernel/xmp/options/IteratorOptions;)Lcom/itextpdf/kernel/xmp/XMPIterator;
    .locals 1
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/IteratorOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 898
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->iterator(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/IteratorOptions;)Lcom/itextpdf/kernel/xmp/XMPIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/IteratorOptions;)Lcom/itextpdf/kernel/xmp/XMPIterator;
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "options"    # Lcom/itextpdf/kernel/xmp/options/IteratorOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 905
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl;-><init>(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/IteratorOptions;)V

    return-object v0
.end method

.method public normalize(Lcom/itextpdf/kernel/xmp/options/ParseOptions;)V
    .locals 1
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 1090
    if-nez p1, :cond_0

    .line 1092
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/ParseOptions;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;-><init>()V

    move-object p1, v0

    .line 1094
    :cond_0
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->process(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lcom/itextpdf/kernel/xmp/XMPMeta;

    .line 1095
    return-void
.end method

.method public setArrayItem(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 6
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "itemIndex"    # I
    .param p4, "itemValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 933
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    .end local p1    # "schemaNS":Ljava/lang/String;
    .end local p2    # "arrayName":Ljava/lang/String;
    .end local p3    # "itemIndex":I
    .end local p4    # "itemValue":Ljava/lang/String;
    .local v1, "schemaNS":Ljava/lang/String;
    .local v2, "arrayName":Ljava/lang/String;
    .local v3, "itemIndex":I
    .local v4, "itemValue":Ljava/lang/String;
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setArrayItem(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 934
    return-void
.end method

.method public setArrayItem(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 10
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "itemIndex"    # I
    .param p4, "itemValue"    # Ljava/lang/String;
    .param p5, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 912
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 913
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    .line 916
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v0

    .line 917
    .local v0, "arrayPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v0, v2, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v5

    .line 919
    .local v5, "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v5, :cond_0

    .line 921
    const/4 v9, 0x0

    move-object v4, p0

    move v6, p3

    move-object v7, p4

    move-object v8, p5

    .end local p3    # "itemIndex":I
    .end local p4    # "itemValue":Ljava/lang/String;
    .end local p5    # "options":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .local v6, "itemIndex":I
    .local v7, "itemValue":Ljava/lang/String;
    .local v8, "options":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    invoke-direct/range {v4 .. v9}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->doSetArrayItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ILjava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Z)V

    .line 927
    return-void

    .line 925
    .end local v6    # "itemIndex":I
    .end local v7    # "itemValue":Ljava/lang/String;
    .end local v8    # "options":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .restart local p3    # "itemIndex":I
    .restart local p4    # "itemValue":Ljava/lang/String;
    .restart local p5    # "options":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    :cond_0
    move v6, p3

    move-object v7, p4

    move-object v8, p5

    .end local p3    # "itemIndex":I
    .end local p4    # "itemValue":Ljava/lang/String;
    .end local p5    # "options":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .restart local v6    # "itemIndex":I
    .restart local v7    # "itemValue":Ljava/lang/String;
    .restart local v8    # "options":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    new-instance p3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string p4, "Specified array does not exist"

    const/16 p5, 0x66

    invoke-direct {p3, p4, p5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p3
.end method

.method public setLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "altTextName"    # Ljava/lang/String;
    .param p3, "genericLang"    # Ljava/lang/String;
    .param p4, "specificLang"    # Ljava/lang/String;
    .param p5, "itemValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 599
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .end local p1    # "schemaNS":Ljava/lang/String;
    .end local p2    # "altTextName":Ljava/lang/String;
    .end local p3    # "genericLang":Ljava/lang/String;
    .end local p4    # "specificLang":Ljava/lang/String;
    .end local p5    # "itemValue":Ljava/lang/String;
    .local v1, "schemaNS":Ljava/lang/String;
    .local v2, "altTextName":Ljava/lang/String;
    .local v3, "genericLang":Ljava/lang/String;
    .local v4, "specificLang":Ljava/lang/String;
    .local v5, "itemValue":Ljava/lang/String;
    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 600
    return-void
.end method

.method public setLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 18
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "altTextName"    # Ljava/lang/String;
    .param p3, "genericLang"    # Ljava/lang/String;
    .param p4, "specificLang"    # Ljava/lang/String;
    .param p5, "itemValue"    # Ljava/lang/String;
    .param p6, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 418
    move-object/from16 v0, p5

    invoke-static/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 419
    invoke-static/range {p2 .. p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    .line 420
    invoke-static/range {p4 .. p4}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSpecificLang(Ljava/lang/String;)V

    .line 422
    if-eqz p3, :cond_0

    invoke-static/range {p3 .. p3}, Lcom/itextpdf/kernel/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 423
    .end local p3    # "genericLang":Ljava/lang/String;
    .local v2, "genericLang":Ljava/lang/String;
    :goto_0
    invoke-static/range {p4 .. p4}, Lcom/itextpdf/kernel/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 425
    .end local p4    # "specificLang":Ljava/lang/String;
    .local v3, "specificLang":Ljava/lang/String;
    invoke-static/range {p1 .. p2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v4

    .line 428
    .local v4, "arrayPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    move-object/from16 v5, p0

    iget-object v6, v5, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    new-instance v7, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    const/16 v8, 0x1e00

    invoke-direct {v7, v8}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>(I)V

    const/4 v8, 0x1

    invoke-static {v6, v4, v8, v7}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v6

    .line 432
    .local v6, "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/16 v7, 0x66

    if-eqz v6, :cond_14

    .line 436
    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v9

    if-nez v9, :cond_2

    .line 438
    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v9

    if-nez v9, :cond_1

    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 440
    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v9

    invoke-virtual {v9, v8}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArrayAltText(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    goto :goto_1

    .line 444
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v8, "Specified property is no alt-text array"

    invoke-direct {v1, v8, v7}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 450
    :cond_2
    :goto_1
    const/4 v9, 0x0

    .line 451
    .local v9, "haveXDefault":Z
    const/4 v10, 0x0

    .line 453
    .local v10, "xdItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "it":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    const-string/jumbo v13, "x-default"

    if-eqz v12, :cond_5

    .line 455
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 456
    .local v12, "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v12}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v14

    if-eqz v14, :cond_4

    .line 457
    invoke-virtual {v12, v8}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, "xml:lang"

    invoke-virtual {v15, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 461
    invoke-virtual {v12, v8}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 463
    move-object v10, v12

    .line 464
    const/4 v9, 0x1

    .line 465
    goto :goto_3

    .line 467
    .end local v12    # "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_3
    goto :goto_2

    .line 459
    .restart local v12    # "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_4
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v8, "Language qualifier must be first"

    invoke-direct {v1, v8, v7}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 470
    .end local v11    # "it":Ljava/util/Iterator;
    .end local v12    # "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_5
    :goto_3
    if-eqz v10, :cond_6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v7

    if-le v7, v8, :cond_6

    .line 472
    invoke-virtual {v6, v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 473
    invoke-virtual {v6, v8, v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(ILcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 479
    :cond_6
    invoke-static {v6, v2, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->chooseLocalizedText(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v7

    .line 480
    .local v7, "result":[Ljava/lang/Object;
    const/4 v11, 0x0

    aget-object v11, v7, v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    .line 481
    .local v11, "match":I
    aget-object v12, v7, v8

    check-cast v12, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 483
    .local v12, "itemNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v13, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    .line 485
    .local v14, "specificXDefault":Z
    packed-switch v11, :pswitch_data_0

    .line 583
    move-object/from16 v16, v2

    .end local v2    # "genericLang":Ljava/lang/String;
    .local v16, "genericLang":Ljava/lang/String;
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Unexpected result from ChooseLocalizedText"

    const/16 v8, 0x9

    invoke-direct {v1, v2, v8}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 574
    .end local v16    # "genericLang":Ljava/lang/String;
    .restart local v2    # "genericLang":Ljava/lang/String;
    :pswitch_0
    invoke-static {v6, v3, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    .line 575
    if-eqz v14, :cond_7

    .line 577
    const/4 v9, 0x1

    move-object/from16 v16, v2

    goto/16 :goto_6

    .line 575
    :cond_7
    move-object/from16 v16, v2

    goto/16 :goto_6

    .line 564
    :pswitch_1
    if-eqz v10, :cond_8

    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v1

    if-ne v1, v8, :cond_8

    .line 566
    invoke-virtual {v10, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    .line 568
    :cond_8
    invoke-static {v6, v3, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    .line 569
    move-object/from16 v16, v2

    goto/16 :goto_6

    .line 553
    :pswitch_2
    invoke-static {v6, v3, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    .line 554
    if-eqz v14, :cond_9

    .line 556
    const/4 v9, 0x1

    move-object/from16 v16, v2

    goto/16 :goto_6

    .line 554
    :cond_9
    move-object/from16 v16, v2

    goto/16 :goto_6

    .line 540
    :pswitch_3
    if-eqz v9, :cond_a

    if-eq v10, v12, :cond_a

    if-eqz v10, :cond_a

    .line 541
    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v12}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v1, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 543
    invoke-virtual {v10, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    .line 545
    :cond_a
    invoke-virtual {v12, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    .line 548
    move-object/from16 v16, v2

    goto/16 :goto_6

    .line 501
    :pswitch_4
    if-nez v14, :cond_c

    .line 505
    if-eqz v9, :cond_b

    if-eq v10, v12, :cond_b

    if-eqz v10, :cond_b

    .line 506
    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v12}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v1, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 508
    invoke-virtual {v10, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    .line 511
    :cond_b
    invoke-virtual {v12, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    move-object/from16 v16, v2

    goto :goto_6

    .line 516
    :cond_c
    if-eqz v9, :cond_11

    if-ne v10, v12, :cond_11

    .line 517
    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v15

    .local v15, "it":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_10

    .line 519
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v1, v16

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 520
    .local v1, "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eq v1, v10, :cond_f

    .line 521
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v8

    if-eqz v10, :cond_d

    .line 522
    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v17, v16

    move-object/from16 v16, v2

    move-object/from16 v2, v17

    goto :goto_5

    :cond_d
    move-object/from16 v16, v2

    const/4 v2, 0x0

    .line 521
    .end local v2    # "genericLang":Ljava/lang/String;
    .restart local v16    # "genericLang":Ljava/lang/String;
    :goto_5
    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    .line 524
    move-object/from16 v2, v16

    const/4 v8, 0x1

    goto :goto_4

    .line 526
    :cond_e
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    .line 527
    .end local v1    # "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    move-object/from16 v2, v16

    const/4 v8, 0x1

    goto :goto_4

    .line 520
    .end local v16    # "genericLang":Ljava/lang/String;
    .restart local v1    # "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .restart local v2    # "genericLang":Ljava/lang/String;
    :cond_f
    move-object/from16 v16, v2

    .end local v2    # "genericLang":Ljava/lang/String;
    .restart local v16    # "genericLang":Ljava/lang/String;
    const/4 v8, 0x1

    goto :goto_4

    .line 517
    .end local v1    # "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v16    # "genericLang":Ljava/lang/String;
    .restart local v2    # "genericLang":Ljava/lang/String;
    :cond_10
    move-object/from16 v16, v2

    .line 529
    .end local v2    # "genericLang":Ljava/lang/String;
    .end local v15    # "it":Ljava/util/Iterator;
    .restart local v16    # "genericLang":Ljava/lang/String;
    if-eqz v10, :cond_12

    .line 531
    invoke-virtual {v10, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    goto :goto_6

    .line 516
    .end local v16    # "genericLang":Ljava/lang/String;
    .restart local v2    # "genericLang":Ljava/lang/String;
    :cond_11
    move-object/from16 v16, v2

    .end local v2    # "genericLang":Ljava/lang/String;
    .restart local v16    # "genericLang":Ljava/lang/String;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 491
    .end local v16    # "genericLang":Ljava/lang/String;
    .restart local v2    # "genericLang":Ljava/lang/String;
    :pswitch_5
    move-object/from16 v16, v2

    .end local v2    # "genericLang":Ljava/lang/String;
    .restart local v16    # "genericLang":Ljava/lang/String;
    invoke-static {v6, v13, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    .line 492
    const/4 v9, 0x1

    .line 493
    if-nez v14, :cond_12

    .line 495
    invoke-static {v6, v3, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    .line 589
    :cond_12
    :goto_6
    if-nez v9, :cond_13

    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_13

    .line 591
    invoke-static {v6, v13, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    .line 593
    :cond_13
    return-void

    .line 434
    .end local v7    # "result":[Ljava/lang/Object;
    .end local v9    # "haveXDefault":Z
    .end local v10    # "xdItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v11    # "match":I
    .end local v12    # "itemNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v14    # "specificXDefault":Z
    .end local v16    # "genericLang":Ljava/lang/String;
    .restart local v2    # "genericLang":Ljava/lang/String;
    :cond_14
    move-object/from16 v16, v2

    .end local v2    # "genericLang":Ljava/lang/String;
    .restart local v16    # "genericLang":Ljava/lang/String;
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Failed to find or create array node"

    invoke-direct {v1, v2, v7}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method setNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Z)V
    .locals 3
    .param p1, "node"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "newOptions"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .param p4, "deleteExisting"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 1172
    if-eqz p4, :cond_0

    .line 1174
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->clear()V

    .line 1178
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->mergeWith(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 1180
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1183
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->setNodeValue(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/Object;)V

    goto :goto_1

    .line 1187
    :cond_1
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_2

    goto :goto_0

    .line 1189
    :cond_2
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Composite nodes can\'t have values"

    const/16 v2, 0x66

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 1192
    :cond_3
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChildren()V

    .line 1195
    :goto_1
    return-void
.end method

.method public setObjectName(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 1043
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setName(Ljava/lang/String;)V

    .line 1044
    return-void
.end method

.method public setPacketHeader(Ljava/lang/String;)V
    .locals 0
    .param p1, "packetHeader"    # Ljava/lang/String;

    .line 1059
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->packetHeader:Ljava/lang/String;

    .line 1060
    return-void
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 989
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 990
    return-void
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 5
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # Ljava/lang/Object;
    .param p4, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 968
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 969
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    .line 971
    invoke-static {p4, p3}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->verifySetOptions(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Ljava/lang/Object;)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object p4

    .line 973
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v0

    .line 975
    .local v0, "expPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const/4 v2, 0x1

    invoke-static {v1, v0, v2, p4}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    .line 976
    .local v1, "propNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v1, :cond_0

    .line 978
    const/4 v2, 0x0

    invoke-virtual {p0, v1, p3, p4, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Z)V

    .line 984
    return-void

    .line 982
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Specified property does not exist"

    const/16 v4, 0x66

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2
.end method

.method public setPropertyBase64(Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 862
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 863
    return-void
.end method

.method public setPropertyBase64(Ljava/lang/String;Ljava/lang/String;[BLcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 0
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # [B
    .param p4, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 855
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 856
    return-void
.end method

.method public setPropertyBoolean(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 736
    if-eqz p3, :cond_0

    const-string v0, "True"

    goto :goto_0

    :cond_0
    const-string v0, "False"

    :goto_0
    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 737
    return-void
.end method

.method public setPropertyBoolean(Ljava/lang/String;Ljava/lang/String;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # Z
    .param p4, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 729
    if-eqz p3, :cond_0

    const-string v0, "True"

    goto :goto_0

    :cond_0
    const-string v0, "False"

    :goto_0
    invoke-virtual {p0, p1, p2, v0, p4}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 730
    return-void
.end method

.method public setPropertyCalendar(Ljava/lang/String;Ljava/lang/String;Ljava/util/Calendar;)V
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # Ljava/util/Calendar;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 836
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 837
    return-void
.end method

.method public setPropertyCalendar(Ljava/lang/String;Ljava/lang/String;Ljava/util/Calendar;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 0
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # Ljava/util/Calendar;
    .param p4, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 829
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 830
    return-void
.end method

.method public setPropertyDate(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/XMPDateTime;)V
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 816
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 817
    return-void
.end method

.method public setPropertyDate(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/XMPDateTime;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 0
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .param p4, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 809
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 810
    return-void
.end method

.method public setPropertyDouble(Ljava/lang/String;Ljava/lang/String;D)V
    .locals 2
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 796
    new-instance v0, Ljava/lang/Double;

    invoke-direct {v0, p3, p4}, Ljava/lang/Double;-><init>(D)V

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 797
    return-void
.end method

.method public setPropertyDouble(Ljava/lang/String;Ljava/lang/String;DLcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # D
    .param p5, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 789
    new-instance v0, Ljava/lang/Double;

    invoke-direct {v0, p3, p4}, Ljava/lang/Double;-><init>(D)V

    invoke-virtual {p0, p1, p2, v0, p5}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 790
    return-void
.end method

.method public setPropertyInteger(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 756
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p3}, Ljava/lang/Integer;-><init>(I)V

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 757
    return-void
.end method

.method public setPropertyInteger(Ljava/lang/String;Ljava/lang/String;ILcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # I
    .param p4, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 749
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {p0, p1, p2, v0, p4}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 750
    return-void
.end method

.method public setPropertyLong(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 2
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 776
    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, p3, p4}, Ljava/lang/Long;-><init>(J)V

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 777
    return-void
.end method

.method public setPropertyLong(Ljava/lang/String;Ljava/lang/String;JLcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 1
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "propValue"    # J
    .param p5, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 769
    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, p3, p4}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {p0, p1, p2, v0, p5}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 770
    return-void
.end method

.method public setQualifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "qualNS"    # Ljava/lang/String;
    .param p4, "qualName"    # Ljava/lang/String;
    .param p5, "qualValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 1012
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .end local p1    # "schemaNS":Ljava/lang/String;
    .end local p2    # "propName":Ljava/lang/String;
    .end local p3    # "qualNS":Ljava/lang/String;
    .end local p4    # "qualName":Ljava/lang/String;
    .end local p5    # "qualValue":Ljava/lang/String;
    .local v1, "schemaNS":Ljava/lang/String;
    .local v2, "propName":Ljava/lang/String;
    .local v3, "qualNS":Ljava/lang/String;
    .local v4, "qualName":Ljava/lang/String;
    .local v5, "qualValue":Ljava/lang/String;
    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setQualifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 1014
    return-void
.end method

.method public setQualifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 3
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "qualNS"    # Ljava/lang/String;
    .param p4, "qualName"    # Ljava/lang/String;
    .param p5, "qualValue"    # Ljava/lang/String;
    .param p6, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 996
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 997
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    .line 999
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->doesPropertyExist(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1004
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p3, p4}, Lcom/itextpdf/kernel/xmp/XMPPathFactory;->composeQualifierPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1005
    .local v0, "qualPath":Ljava/lang/String;
    invoke-virtual {p0, p1, v0, p5, p6}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 1006
    return-void

    .line 1001
    .end local v0    # "qualPath":Ljava/lang/String;
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Specified property does not exist!"

    const/16 v2, 0x66

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public setStructField(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "structName"    # Ljava/lang/String;
    .param p3, "fieldNS"    # Ljava/lang/String;
    .param p4, "fieldName"    # Ljava/lang/String;
    .param p5, "fieldValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 1031
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .end local p1    # "schemaNS":Ljava/lang/String;
    .end local p2    # "structName":Ljava/lang/String;
    .end local p3    # "fieldNS":Ljava/lang/String;
    .end local p4    # "fieldName":Ljava/lang/String;
    .end local p5    # "fieldValue":Ljava/lang/String;
    .local v1, "schemaNS":Ljava/lang/String;
    .local v2, "structName":Ljava/lang/String;
    .local v3, "fieldNS":Ljava/lang/String;
    .local v4, "fieldName":Ljava/lang/String;
    .local v5, "fieldValue":Ljava/lang/String;
    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setStructField(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 1032
    return-void
.end method

.method public setStructField(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 2
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "structName"    # Ljava/lang/String;
    .param p3, "fieldNS"    # Ljava/lang/String;
    .param p4, "fieldName"    # Ljava/lang/String;
    .param p5, "fieldValue"    # Ljava/lang/String;
    .param p6, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 1020
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 1021
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertStructName(Ljava/lang/String;)V

    .line 1023
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p3, p4}, Lcom/itextpdf/kernel/xmp/XMPPathFactory;->composeStructFieldPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1024
    .local v0, "fieldPath":Ljava/lang/String;
    invoke-virtual {p0, p1, v0, p5, p6}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 1025
    return-void
.end method

.method public sort()V
    .locals 1

    .line 1084
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->tree:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->sort()V

    .line 1085
    return-void
.end method
