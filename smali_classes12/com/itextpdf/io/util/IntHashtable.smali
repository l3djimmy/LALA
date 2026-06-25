.class public Lcom/itextpdf/io/util/IntHashtable;
.super Ljava/lang/Object;
.source "IntHashtable.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/util/IntHashtable$Entry;
    }
.end annotation


# instance fields
.field count:I

.field private loadFactor:F

.field private table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

.field private threshold:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 69
    const/16 v0, 0x96

    const/high16 v1, 0x3f400000    # 0.75f

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/io/util/IntHashtable;-><init>(IF)V

    .line 70
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "initialCapacity"    # I

    .line 81
    const/high16 v0, 0x3f400000    # 0.75f

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/io/util/IntHashtable;-><init>(IF)V

    .line 82
    return-void
.end method

.method public constructor <init>(IF)V
    .locals 3
    .param p1, "initialCapacity"    # I
    .param p2, "loadFactor"    # F

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    if-ltz p1, :cond_2

    .line 97
    const/4 v0, 0x0

    cmpg-float v0, p2, v0

    if-lez v0, :cond_1

    .line 100
    if-nez p1, :cond_0

    .line 101
    const/4 p1, 0x1

    .line 103
    :cond_0
    iput p2, p0, Lcom/itextpdf/io/util/IntHashtable;->loadFactor:F

    .line 104
    new-array v0, p1, [Lcom/itextpdf/io/util/IntHashtable$Entry;

    iput-object v0, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    .line 105
    int-to-float v0, p1

    mul-float/2addr v0, p2

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/util/IntHashtable;->threshold:I

    .line 106
    return-void

    .line 98
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Illegal Load: {0}"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Illegal Capacity: {0}"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Lcom/itextpdf/io/util/IntHashtable;)V
    .locals 2
    .param p1, "o"    # Lcom/itextpdf/io/util/IntHashtable;

    .line 109
    iget-object v0, p1, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    array-length v0, v0

    iget v1, p1, Lcom/itextpdf/io/util/IntHashtable;->loadFactor:F

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/io/util/IntHashtable;-><init>(IF)V

    .line 110
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 3

    .line 347
    iget-object v0, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    .line 348
    .local v0, "tab":[Lcom/itextpdf/io/util/IntHashtable$Entry;
    array-length v1, v0

    .local v1, "index":I
    :goto_0
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_0

    .line 349
    const/4 v2, 0x0

    aput-object v2, v0, v1

    goto :goto_0

    .line 351
    .end local v1    # "index":I
    :cond_0
    const/4 v1, 0x0

    iput v1, p0, Lcom/itextpdf/io/util/IntHashtable;->count:I

    .line 352
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 4

    .line 434
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/util/IntHashtable;-><init>(Lcom/itextpdf/io/util/IntHashtable;)V

    .line 435
    .local v0, "t":Lcom/itextpdf/io/util/IntHashtable;
    iget-object v1, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    array-length v1, v1

    new-array v1, v1, [Lcom/itextpdf/io/util/IntHashtable$Entry;

    iput-object v1, v0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    .line 436
    iget-object v1, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    array-length v1, v1

    .local v1, "i":I
    :goto_0
    add-int/lit8 v2, v1, -0x1

    .end local v1    # "i":I
    .local v2, "i":I
    if-lez v1, :cond_1

    .line 437
    iget-object v1, v0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    iget-object v3, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    aget-object v3, v3, v2

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    aget-object v3, v3, v2

    .line 438
    invoke-virtual {v3}, Lcom/itextpdf/io/util/IntHashtable$Entry;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/util/IntHashtable$Entry;

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    :goto_1
    aput-object v3, v1, v2

    move v1, v2

    goto :goto_0

    .line 440
    .end local v2    # "i":I
    :cond_1
    iget v1, p0, Lcom/itextpdf/io/util/IntHashtable;->count:I

    iput v1, v0, Lcom/itextpdf/io/util/IntHashtable;->count:I

    .line 441
    return-object v0
.end method

.method public contains(I)Z
    .locals 4
    .param p1, "value"    # I

    .line 151
    iget-object v0, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    .line 152
    .local v0, "tab":[Lcom/itextpdf/io/util/IntHashtable$Entry;
    array-length v1, v0

    .local v1, "i":I
    :goto_0
    add-int/lit8 v2, v1, -0x1

    .end local v1    # "i":I
    .local v2, "i":I
    if-lez v1, :cond_2

    .line 153
    aget-object v1, v0, v2

    .local v1, "e":Lcom/itextpdf/io/util/IntHashtable$Entry;
    :goto_1
    if-eqz v1, :cond_1

    .line 154
    iget v3, v1, Lcom/itextpdf/io/util/IntHashtable$Entry;->value:I

    if-ne v3, p1, :cond_0

    .line 155
    const/4 v3, 0x1

    return v3

    .line 153
    :cond_0
    iget-object v1, v1, Lcom/itextpdf/io/util/IntHashtable$Entry;->next:Lcom/itextpdf/io/util/IntHashtable$Entry;

    goto :goto_1

    :cond_1
    move v1, v2

    .end local v1    # "e":Lcom/itextpdf/io/util/IntHashtable$Entry;
    goto :goto_0

    .line 159
    .end local v2    # "i":I
    :cond_2
    const/4 v1, 0x0

    return v1
.end method

.method public containsKey(I)Z
    .locals 4
    .param p1, "key"    # I

    .line 187
    iget-object v0, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    .line 188
    .local v0, "tab":[Lcom/itextpdf/io/util/IntHashtable$Entry;
    const v1, 0x7fffffff

    and-int/2addr v1, p1

    array-length v2, v0

    rem-int/2addr v1, v2

    .line 189
    .local v1, "index":I
    aget-object v2, v0, v1

    .local v2, "e":Lcom/itextpdf/io/util/IntHashtable$Entry;
    :goto_0
    if-eqz v2, :cond_1

    .line 190
    iget v3, v2, Lcom/itextpdf/io/util/IntHashtable$Entry;->key:I

    if-ne v3, p1, :cond_0

    .line 191
    const/4 v3, 0x1

    return v3

    .line 189
    :cond_0
    iget-object v2, v2, Lcom/itextpdf/io/util/IntHashtable$Entry;->next:Lcom/itextpdf/io/util/IntHashtable$Entry;

    goto :goto_0

    .line 194
    .end local v2    # "e":Lcom/itextpdf/io/util/IntHashtable$Entry;
    :cond_1
    const/4 v2, 0x0

    return v2
.end method

.method public containsValue(I)Z
    .locals 1
    .param p1, "value"    # I

    .line 174
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/util/IntHashtable;->contains(I)Z

    move-result v0

    return v0
.end method

.method public get(I)I
    .locals 4
    .param p1, "key"    # I

    .line 207
    iget-object v0, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    .line 208
    .local v0, "tab":[Lcom/itextpdf/io/util/IntHashtable$Entry;
    const v1, 0x7fffffff

    and-int/2addr v1, p1

    array-length v2, v0

    rem-int/2addr v1, v2

    .line 209
    .local v1, "index":I
    aget-object v2, v0, v1

    .local v2, "e":Lcom/itextpdf/io/util/IntHashtable$Entry;
    :goto_0
    if-eqz v2, :cond_1

    .line 210
    iget v3, v2, Lcom/itextpdf/io/util/IntHashtable$Entry;->key:I

    if-ne v3, p1, :cond_0

    .line 211
    iget v3, v2, Lcom/itextpdf/io/util/IntHashtable$Entry;->value:I

    return v3

    .line 209
    :cond_0
    iget-object v2, v2, Lcom/itextpdf/io/util/IntHashtable$Entry;->next:Lcom/itextpdf/io/util/IntHashtable$Entry;

    goto :goto_0

    .line 214
    .end local v2    # "e":Lcom/itextpdf/io/util/IntHashtable$Entry;
    :cond_1
    const/4 v2, 0x0

    return v2
.end method

.method public getKeys()[I
    .locals 7

    .line 405
    iget v0, p0, Lcom/itextpdf/io/util/IntHashtable;->count:I

    new-array v0, v0, [I

    .line 406
    .local v0, "res":[I
    const/4 v1, 0x0

    .line 407
    .local v1, "ptr":I
    iget-object v2, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    array-length v2, v2

    .line 408
    .local v2, "index":I
    const/4 v3, 0x0

    .line 410
    .local v3, "entry":Lcom/itextpdf/io/util/IntHashtable$Entry;
    :goto_0
    if-nez v3, :cond_1

    .line 411
    :goto_1
    add-int/lit8 v4, v2, -0x1

    .end local v2    # "index":I
    .local v4, "index":I
    if-lez v2, :cond_0

    iget-object v2, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    aget-object v2, v2, v4

    move-object v3, v2

    if-nez v2, :cond_0

    move v2, v4

    goto :goto_1

    :cond_0
    move v2, v4

    .line 412
    .end local v4    # "index":I
    .restart local v2    # "index":I
    :cond_1
    if-nez v3, :cond_2

    .line 413
    nop

    .line 418
    return-object v0

    .line 414
    :cond_2
    move-object v4, v3

    .line 415
    .local v4, "e":Lcom/itextpdf/io/util/IntHashtable$Entry;
    iget-object v3, v4, Lcom/itextpdf/io/util/IntHashtable$Entry;->next:Lcom/itextpdf/io/util/IntHashtable$Entry;

    .line 416
    add-int/lit8 v5, v1, 0x1

    .end local v1    # "ptr":I
    .local v5, "ptr":I
    iget v6, v4, Lcom/itextpdf/io/util/IntHashtable$Entry;->key:I

    aput v6, v0, v1

    .line 417
    .end local v4    # "e":Lcom/itextpdf/io/util/IntHashtable$Entry;
    move v1, v5

    goto :goto_0
.end method

.method public getOneKey()I
    .locals 4

    .line 422
    iget v0, p0, Lcom/itextpdf/io/util/IntHashtable;->count:I

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 423
    return v1

    .line 424
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    array-length v0, v0

    .line 425
    .local v0, "index":I
    const/4 v2, 0x0

    .line 426
    .local v2, "entry":Lcom/itextpdf/io/util/IntHashtable$Entry;
    :goto_0
    add-int/lit8 v3, v0, -0x1

    .end local v0    # "index":I
    .local v3, "index":I
    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    aget-object v0, v0, v3

    move-object v2, v0

    if-nez v0, :cond_1

    move v0, v3

    goto :goto_0

    .line 427
    :cond_1
    if-nez v2, :cond_2

    .line 428
    return v1

    .line 429
    :cond_2
    iget v0, v2, Lcom/itextpdf/io/util/IntHashtable$Entry;->key:I

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 128
    iget v0, p0, Lcom/itextpdf/io/util/IntHashtable;->count:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public put(II)I
    .locals 5
    .param p1, "key"    # I
    .param p2, "value"    # I

    .line 285
    iget-object v0, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    .line 286
    .local v0, "tab":[Lcom/itextpdf/io/util/IntHashtable$Entry;
    const v1, 0x7fffffff

    and-int v2, p1, v1

    array-length v3, v0

    rem-int/2addr v2, v3

    .line 287
    .local v2, "index":I
    aget-object v3, v0, v2

    .local v3, "e":Lcom/itextpdf/io/util/IntHashtable$Entry;
    :goto_0
    if-eqz v3, :cond_1

    .line 288
    iget v4, v3, Lcom/itextpdf/io/util/IntHashtable$Entry;->key:I

    if-ne v4, p1, :cond_0

    .line 289
    iget v1, v3, Lcom/itextpdf/io/util/IntHashtable$Entry;->value:I

    .line 291
    .local v1, "old":I
    iput p2, v3, Lcom/itextpdf/io/util/IntHashtable$Entry;->value:I

    .line 292
    return v1

    .line 287
    .end local v1    # "old":I
    :cond_0
    iget-object v3, v3, Lcom/itextpdf/io/util/IntHashtable$Entry;->next:Lcom/itextpdf/io/util/IntHashtable$Entry;

    goto :goto_0

    .line 296
    .end local v3    # "e":Lcom/itextpdf/io/util/IntHashtable$Entry;
    :cond_1
    iget v3, p0, Lcom/itextpdf/io/util/IntHashtable;->count:I

    iget v4, p0, Lcom/itextpdf/io/util/IntHashtable;->threshold:I

    if-lt v3, v4, :cond_2

    .line 298
    invoke-virtual {p0}, Lcom/itextpdf/io/util/IntHashtable;->rehash()V

    .line 300
    iget-object v0, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    .line 301
    and-int/2addr v1, p1

    array-length v3, v0

    rem-int v2, v1, v3

    .line 305
    :cond_2
    new-instance v1, Lcom/itextpdf/io/util/IntHashtable$Entry;

    aget-object v3, v0, v2

    invoke-direct {v1, p1, p2, v3}, Lcom/itextpdf/io/util/IntHashtable$Entry;-><init>(IILcom/itextpdf/io/util/IntHashtable$Entry;)V

    .line 306
    .local v1, "e":Lcom/itextpdf/io/util/IntHashtable$Entry;
    aput-object v1, v0, v2

    .line 307
    iget v3, p0, Lcom/itextpdf/io/util/IntHashtable;->count:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/itextpdf/io/util/IntHashtable;->count:I

    .line 308
    const/4 v3, 0x0

    return v3
.end method

.method protected rehash()V
    .locals 9

    .line 247
    iget-object v0, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    array-length v0, v0

    .line 248
    .local v0, "oldCapacity":I
    iget-object v1, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    .line 250
    .local v1, "oldMap":[Lcom/itextpdf/io/util/IntHashtable$Entry;
    mul-int/lit8 v2, v0, 0x2

    add-int/lit8 v2, v2, 0x1

    .line 251
    .local v2, "newCapacity":I
    new-array v3, v2, [Lcom/itextpdf/io/util/IntHashtable$Entry;

    .line 253
    .local v3, "newMap":[Lcom/itextpdf/io/util/IntHashtable$Entry;
    int-to-float v4, v2

    iget v5, p0, Lcom/itextpdf/io/util/IntHashtable;->loadFactor:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, p0, Lcom/itextpdf/io/util/IntHashtable;->threshold:I

    .line 254
    iput-object v3, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    .line 256
    move v4, v0

    .local v4, "i":I
    :goto_0
    add-int/lit8 v5, v4, -0x1

    .end local v4    # "i":I
    .local v5, "i":I
    if-lez v4, :cond_1

    .line 257
    aget-object v4, v1, v5

    .local v4, "old":Lcom/itextpdf/io/util/IntHashtable$Entry;
    :goto_1
    if-eqz v4, :cond_0

    .line 258
    move-object v6, v4

    .line 259
    .local v6, "e":Lcom/itextpdf/io/util/IntHashtable$Entry;
    iget-object v4, v4, Lcom/itextpdf/io/util/IntHashtable$Entry;->next:Lcom/itextpdf/io/util/IntHashtable$Entry;

    .line 261
    iget v7, v6, Lcom/itextpdf/io/util/IntHashtable$Entry;->key:I

    const v8, 0x7fffffff

    and-int/2addr v7, v8

    rem-int/2addr v7, v2

    .line 262
    .local v7, "index":I
    aget-object v8, v3, v7

    iput-object v8, v6, Lcom/itextpdf/io/util/IntHashtable$Entry;->next:Lcom/itextpdf/io/util/IntHashtable$Entry;

    .line 263
    aput-object v6, v3, v7

    .line 264
    .end local v6    # "e":Lcom/itextpdf/io/util/IntHashtable$Entry;
    .end local v7    # "index":I
    goto :goto_1

    .end local v4    # "old":Lcom/itextpdf/io/util/IntHashtable$Entry;
    :cond_0
    move v4, v5

    goto :goto_0

    .line 266
    .end local v5    # "i":I
    :cond_1
    return-void
.end method

.method public remove(I)I
    .locals 6
    .param p1, "key"    # I

    .line 323
    iget-object v0, p0, Lcom/itextpdf/io/util/IntHashtable;->table:[Lcom/itextpdf/io/util/IntHashtable$Entry;

    .line 324
    .local v0, "tab":[Lcom/itextpdf/io/util/IntHashtable$Entry;
    const v1, 0x7fffffff

    and-int/2addr v1, p1

    array-length v2, v0

    rem-int/2addr v1, v2

    .line 327
    .local v1, "index":I
    aget-object v2, v0, v1

    .local v2, "e":Lcom/itextpdf/io/util/IntHashtable$Entry;
    const/4 v3, 0x0

    .local v3, "prev":Lcom/itextpdf/io/util/IntHashtable$Entry;
    :goto_0
    const/4 v4, 0x0

    if-eqz v2, :cond_2

    .line 328
    iget v5, v2, Lcom/itextpdf/io/util/IntHashtable$Entry;->key:I

    if-ne v5, p1, :cond_1

    .line 329
    if-eqz v3, :cond_0

    .line 330
    iget-object v5, v2, Lcom/itextpdf/io/util/IntHashtable$Entry;->next:Lcom/itextpdf/io/util/IntHashtable$Entry;

    iput-object v5, v3, Lcom/itextpdf/io/util/IntHashtable$Entry;->next:Lcom/itextpdf/io/util/IntHashtable$Entry;

    goto :goto_1

    .line 332
    :cond_0
    iget-object v5, v2, Lcom/itextpdf/io/util/IntHashtable$Entry;->next:Lcom/itextpdf/io/util/IntHashtable$Entry;

    aput-object v5, v0, v1

    .line 334
    :goto_1
    iget v5, p0, Lcom/itextpdf/io/util/IntHashtable;->count:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lcom/itextpdf/io/util/IntHashtable;->count:I

    .line 335
    iget v5, v2, Lcom/itextpdf/io/util/IntHashtable$Entry;->value:I

    .line 336
    .local v5, "oldValue":I
    iput v4, v2, Lcom/itextpdf/io/util/IntHashtable$Entry;->value:I

    .line 337
    return v5

    .line 327
    .end local v5    # "oldValue":I
    :cond_1
    move-object v3, v2

    iget-object v2, v2, Lcom/itextpdf/io/util/IntHashtable$Entry;->next:Lcom/itextpdf/io/util/IntHashtable$Entry;

    goto :goto_0

    .line 340
    :cond_2
    return v4
.end method

.method public size()I
    .locals 1

    .line 118
    iget v0, p0, Lcom/itextpdf/io/util/IntHashtable;->count:I

    return v0
.end method

.method public toOrderedKeys()[I
    .locals 1

    .line 399
    invoke-virtual {p0}, Lcom/itextpdf/io/util/IntHashtable;->getKeys()[I

    move-result-object v0

    .line 400
    .local v0, "res":[I
    invoke-static {v0}, Ljava/util/Arrays;->sort([I)V

    .line 401
    return-object v0
.end method
