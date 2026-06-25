.class public abstract Lcom/itextpdf/kernel/xmp/options/Options;
.super Ljava/lang/Object;
.source "Options.java"


# instance fields
.field private optionNames:Ljava/util/Map;

.field private options:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/options/Options;->options:I

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/options/Options;->optionNames:Ljava/util/Map;

    .line 59
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/options/Options;->options:I

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/options/Options;->optionNames:Ljava/util/Map;

    .line 70
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/xmp/options/Options;->assertOptionsValid(I)V

    .line 71
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/xmp/options/Options;->setOptions(I)V

    .line 72
    return-void
.end method

.method private assertOptionsValid(I)V
    .locals 4
    .param p1, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 257
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/Options;->getValidOptions()I

    move-result v0

    not-int v0, v0

    and-int/2addr v0, p1

    .line 258
    .local v0, "invalidOptions":I
    if-nez v0, :cond_0

    .line 260
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/xmp/options/Options;->assertConsistency(I)V

    .line 267
    return-void

    .line 264
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The option bit(s) 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " are invalid!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x67

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method private getOptionName(I)Ljava/lang/String;
    .locals 4
    .param p1, "option"    # I

    .line 279
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/options/Options;->procureOptionNames()Ljava/util/HashMap;

    move-result-object v0

    .line 281
    .local v0, "optionsNames":Ljava/util/HashMap;
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    .line 282
    .local v1, "key":Ljava/lang/Integer;
    const/4 v2, 0x0

    .line 283
    .local v2, "result":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 285
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/xmp/options/Options;->defineOptionName(I)Ljava/lang/String;

    move-result-object v2

    .line 286
    if-eqz v2, :cond_0

    .line 288
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 292
    :cond_0
    const-string v2, "<option name not defined>"

    .line 296
    :cond_1
    :goto_0
    return-object v2
.end method

.method private procureOptionNames()Ljava/util/HashMap;
    .locals 1

    .line 305
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/options/Options;->optionNames:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 307
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/options/Options;->optionNames:Ljava/util/Map;

    .line 309
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/options/Options;->optionNames:Ljava/util/Map;

    check-cast v0, Ljava/util/HashMap;

    return-object v0
.end method


# virtual methods
.method protected assertConsistency(I)V
    .locals 0
    .param p1, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 244
    return-void
.end method

.method public clear()V
    .locals 1

    .line 80
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/options/Options;->options:I

    .line 81
    return-void
.end method

.method public containsAllOptions(I)Z
    .locals 1
    .param p1, "optionBits"    # I

    .line 100
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/Options;->getOptions()I

    move-result v0

    and-int/2addr v0, p1

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public containsOneOf(I)Z
    .locals 1
    .param p1, "optionBits"    # I

    .line 110
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/Options;->getOptions()I

    move-result v0

    and-int/2addr v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected abstract defineOptionName(I)Ljava/lang/String;
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .line 160
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/Options;->getOptions()I

    move-result v0

    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/xmp/options/Options;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/Options;->getOptions()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected getOption(I)Z
    .locals 1
    .param p1, "optionBit"    # I

    .line 120
    iget v0, p0, Lcom/itextpdf/kernel/xmp/options/Options;->options:I

    and-int/2addr v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getOptions()I
    .locals 1

    .line 140
    iget v0, p0, Lcom/itextpdf/kernel/xmp/options/Options;->options:I

    return v0
.end method

.method public getOptionsString()Ljava/lang/String;
    .locals 6

    .line 181
    iget v0, p0, Lcom/itextpdf/kernel/xmp/options/Options;->options:I

    if-eqz v0, :cond_2

    .line 183
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 184
    .local v0, "sb":Ljava/lang/StringBuffer;
    iget v1, p0, Lcom/itextpdf/kernel/xmp/options/Options;->options:I

    .line 185
    .local v1, "theBits":I
    :goto_0
    if-eqz v1, :cond_1

    .line 187
    add-int/lit8 v2, v1, -0x1

    and-int/2addr v2, v1

    .line 188
    .local v2, "oneLessBit":I
    xor-int v3, v1, v2

    .line 189
    .local v3, "singleBit":I
    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/xmp/options/Options;->getOptionName(I)Ljava/lang/String;

    move-result-object v4

    .line 190
    .local v4, "bitName":Ljava/lang/String;
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 191
    if-eqz v2, :cond_0

    .line 193
    const-string v5, " | "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 195
    :cond_0
    move v1, v2

    .line 196
    .end local v2    # "oneLessBit":I
    .end local v3    # "singleBit":I
    .end local v4    # "bitName":Ljava/lang/String;
    goto :goto_0

    .line 197
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 201
    .end local v0    # "sb":Ljava/lang/StringBuffer;
    .end local v1    # "theBits":I
    :cond_2
    const-string v0, "<none>"

    return-object v0
.end method

.method protected abstract getValidOptions()I
.end method

.method public hashCode()I
    .locals 1

    .line 169
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/Options;->getOptions()I

    move-result v0

    return v0
.end method

.method public isExactly(I)Z
    .locals 1
    .param p1, "optionBits"    # I

    .line 90
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/Options;->getOptions()I

    move-result v0

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setOption(IZ)V
    .locals 2
    .param p1, "optionBits"    # I
    .param p2, "value"    # Z

    .line 130
    iget v0, p0, Lcom/itextpdf/kernel/xmp/options/Options;->options:I

    if-eqz p2, :cond_0

    or-int/2addr v0, p1

    goto :goto_0

    :cond_0
    not-int v1, p1

    and-int/2addr v0, v1

    :goto_0
    iput v0, p0, Lcom/itextpdf/kernel/xmp/options/Options;->options:I

    .line 131
    return-void
.end method

.method public setOptions(I)V
    .locals 0
    .param p1, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 150
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/xmp/options/Options;->assertOptionsValid(I)V

    .line 151
    iput p1, p0, Lcom/itextpdf/kernel/xmp/options/Options;->options:I

    .line 152
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 211
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/kernel/xmp/options/Options;->options:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
