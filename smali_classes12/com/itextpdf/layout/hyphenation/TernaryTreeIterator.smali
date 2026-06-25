.class Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;
.super Ljava/lang/Object;
.source "TernaryTreeIterator.java"

# interfaces
.implements Ljava/util/Enumeration;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;
    }
.end annotation


# instance fields
.field cur:I

.field curkey:Ljava/lang/String;

.field ks:Ljava/lang/StringBuffer;

.field ns:Ljava/util/Stack;

.field tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/hyphenation/TernaryTree;)V
    .locals 1
    .param p1, "tt"    # Lcom/itextpdf/layout/hyphenation/TernaryTree;

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput-object p1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    .line 100
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    .line 101
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ns:Ljava/util/Stack;

    .line 102
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ks:Ljava/lang/StringBuffer;

    .line 103
    invoke-virtual {p0}, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->reset()V

    .line 104
    return-void
.end method

.method private run()I
    .locals 7

    .line 202
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 203
    return v1

    .line 206
    :cond_0
    const/4 v0, 0x0

    .line 209
    .local v0, "leaf":Z
    :cond_1
    :goto_0
    iget v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    const/4 v3, 0x0

    const v4, 0xffff

    if-eqz v2, :cond_4

    .line 210
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-object v2, v2, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    iget v5, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    aget-char v2, v2, v5

    if-ne v2, v4, :cond_2

    .line 211
    const/4 v0, 0x1

    .line 212
    goto :goto_1

    .line 214
    :cond_2
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ns:Ljava/util/Stack;

    new-instance v5, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;

    iget v6, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    int-to-char v6, v6

    invoke-direct {v5, p0, v6, v3}, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;-><init>(Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;CC)V

    invoke-virtual {v2, v5}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-object v2, v2, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    iget v5, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    aget-char v2, v2, v5

    if-nez v2, :cond_3

    .line 216
    const/4 v0, 0x1

    .line 217
    goto :goto_1

    .line 219
    :cond_3
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-object v2, v2, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    iget v3, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    aget-char v2, v2, v3

    iput v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    goto :goto_0

    .line 221
    :cond_4
    :goto_1
    if-eqz v0, :cond_6

    .line 222
    nop

    .line 232
    new-instance v1, Ljava/lang/StringBuffer;

    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ks:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 233
    .local v1, "buf":Ljava/lang/StringBuffer;
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-object v2, v2, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    iget v5, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    aget-char v2, v2, v5

    if-ne v2, v4, :cond_5

    .line 234
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-object v2, v2, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    iget v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    aget-char v2, v2, v4

    .line 235
    .local v2, "p":I
    :goto_2
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-object v4, v4, Lcom/itextpdf/layout/hyphenation/TernaryTree;->kv:Lcom/itextpdf/layout/hyphenation/CharVector;

    invoke-virtual {v4, v2}, Lcom/itextpdf/layout/hyphenation/CharVector;->get(I)C

    move-result v4

    if-eqz v4, :cond_5

    .line 236
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-object v4, v4, Lcom/itextpdf/layout/hyphenation/TernaryTree;->kv:Lcom/itextpdf/layout/hyphenation/CharVector;

    add-int/lit8 v5, v2, 0x1

    .end local v2    # "p":I
    .local v5, "p":I
    invoke-virtual {v4, v2}, Lcom/itextpdf/layout/hyphenation/CharVector;->get(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move v2, v5

    goto :goto_2

    .line 239
    .end local v5    # "p":I
    :cond_5
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->curkey:Ljava/lang/String;

    .line 240
    return v3

    .line 225
    .end local v1    # "buf":Ljava/lang/StringBuffer;
    :cond_6
    invoke-direct {p0}, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->up()I

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    .line 226
    iget v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    if-ne v2, v1, :cond_1

    .line 227
    return v1
.end method

.method private up()I
    .locals 7

    .line 147
    new-instance v0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;

    invoke-direct {v0, p0}, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;-><init>(Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;)V

    .line 148
    .local v0, "i":Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;
    const/4 v1, 0x0

    .line 150
    .local v1, "res":I
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ns:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->size()I

    move-result v2

    const/4 v3, -0x1

    if-nez v2, :cond_0

    .line 151
    return v3

    .line 154
    :cond_0
    iget v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-object v2, v2, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    iget v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    aget-char v2, v2, v4

    if-nez v2, :cond_1

    .line 155
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-object v2, v2, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    iget v3, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    aget-char v2, v2, v3

    return v2

    .line 158
    :cond_1
    const/4 v2, 0x1

    .line 160
    .local v2, "climb":Z
    :goto_0
    if-eqz v2, :cond_5

    .line 161
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ns:Ljava/util/Stack;

    invoke-virtual {v4}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;

    .line 162
    iget-char v4, v0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->child:C

    add-int/lit8 v4, v4, 0x1

    int-to-char v4, v4

    iput-char v4, v0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->child:C

    .line 163
    iget-char v4, v0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->child:C

    packed-switch v4, :pswitch_data_0

    .line 188
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ns:Ljava/util/Stack;

    invoke-virtual {v4}, Ljava/util/Stack;->size()I

    move-result v4

    if-nez v4, :cond_4

    .line 189
    return v3

    .line 178
    :pswitch_0
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-object v4, v4, Lcom/itextpdf/layout/hyphenation/TernaryTree;->hi:[C

    iget-char v5, v0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->parent:C

    aget-char v1, v4, v5

    .line 179
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ns:Ljava/util/Stack;

    new-instance v5, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;

    invoke-direct {v5, p0, v0}, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;-><init>(Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;)V

    invoke-virtual {v4, v5}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ks:Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-lez v4, :cond_2

    .line 182
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ks:Ljava/lang/StringBuffer;

    iget-object v5, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ks:Ljava/lang/StringBuffer;

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 184
    :cond_2
    const/4 v2, 0x0

    .line 185
    goto :goto_0

    .line 165
    :pswitch_1
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-object v4, v4, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    iget-char v5, v0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->parent:C

    aget-char v4, v4, v5

    if-eqz v4, :cond_3

    .line 166
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-object v4, v4, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    iget-char v5, v0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->parent:C

    aget-char v1, v4, v5

    .line 167
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ns:Ljava/util/Stack;

    new-instance v5, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;

    invoke-direct {v5, p0, v0}, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;-><init>(Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;)V

    invoke-virtual {v4, v5}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ks:Ljava/lang/StringBuffer;

    iget-object v5, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-object v5, v5, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    iget-char v6, v0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->parent:C

    aget-char v5, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 170
    :cond_3
    iget-char v4, v0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->child:C

    add-int/lit8 v4, v4, 0x1

    int-to-char v4, v4

    iput-char v4, v0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->child:C

    .line 171
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ns:Ljava/util/Stack;

    new-instance v5, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;

    invoke-direct {v5, p0, v0}, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;-><init>(Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;)V

    invoke-virtual {v4, v5}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-object v4, v4, Lcom/itextpdf/layout/hyphenation/TernaryTree;->hi:[C

    iget-char v5, v0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator$Item;->parent:C

    aget-char v1, v4, v5

    .line 174
    :goto_1
    const/4 v2, 0x0

    .line 175
    goto/16 :goto_0

    .line 191
    :cond_4
    const/4 v2, 0x1

    .line 192
    goto/16 :goto_0

    .line 195
    :cond_5
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public getValue()C
    .locals 2

    .line 130
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    if-ltz v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-object v0, v0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    iget v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    aget-char v0, v0, v1

    return v0

    .line 133
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hasMoreElements()Z
    .locals 2

    .line 140
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public nextElement()Ljava/lang/Object;
    .locals 2

    .line 120
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->curkey:Ljava/lang/String;

    .line 121
    .local v0, "res":Ljava/lang/String;
    invoke-direct {p0}, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->up()I

    move-result v1

    iput v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    .line 122
    invoke-direct {p0}, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->run()I

    .line 123
    return-object v0
.end method

.method public reset()V
    .locals 2

    .line 110
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ns:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->removeAllElements()V

    .line 111
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->ks:Ljava/lang/StringBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 112
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->tt:Lcom/itextpdf/layout/hyphenation/TernaryTree;

    iget-char v0, v0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->root:C

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->cur:I

    .line 113
    invoke-direct {p0}, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->run()I

    .line 114
    return-void
.end method
