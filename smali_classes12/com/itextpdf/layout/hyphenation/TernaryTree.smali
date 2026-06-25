.class public Lcom/itextpdf/layout/hyphenation/TernaryTree;
.super Ljava/lang/Object;
.source "TernaryTree.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field protected static final BLOCK_SIZE:I = 0x800


# instance fields
.field protected eq:[C

.field protected freenode:C

.field protected hi:[C

.field protected kv:Lcom/itextpdf/layout/hyphenation/CharVector;

.field protected length:I

.field protected lo:[C

.field protected root:C

.field protected sc:[C


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 68
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    invoke-virtual {p0}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->init()V

    .line 126
    return-void
.end method

.method constructor <init>(Lcom/itextpdf/layout/hyphenation/TernaryTree;)V
    .locals 2
    .param p1, "tt"    # Lcom/itextpdf/layout/hyphenation/TernaryTree;

    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 129
    iget-char v0, p1, Lcom/itextpdf/layout/hyphenation/TernaryTree;->root:C

    iput-char v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->root:C

    .line 130
    iget-char v0, p1, Lcom/itextpdf/layout/hyphenation/TernaryTree;->freenode:C

    iput-char v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->freenode:C

    .line 131
    iget v0, p1, Lcom/itextpdf/layout/hyphenation/TernaryTree;->length:I

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->length:I

    .line 132
    iget-object v0, p1, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    invoke-virtual {v0}, [C->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    check-cast v0, [C

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    .line 133
    iget-object v0, p1, Lcom/itextpdf/layout/hyphenation/TernaryTree;->hi:[C

    invoke-virtual {v0}, [C->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    check-cast v0, [C

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->hi:[C

    .line 134
    iget-object v0, p1, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    invoke-virtual {v0}, [C->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    check-cast v0, [C

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    .line 135
    iget-object v0, p1, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    invoke-virtual {v0}, [C->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    check-cast v0, [C

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    .line 136
    new-instance v0, Lcom/itextpdf/layout/hyphenation/CharVector;

    iget-object v1, p1, Lcom/itextpdf/layout/hyphenation/TernaryTree;->kv:Lcom/itextpdf/layout/hyphenation/CharVector;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/hyphenation/CharVector;-><init>(Lcom/itextpdf/layout/hyphenation/CharVector;)V

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->kv:Lcom/itextpdf/layout/hyphenation/CharVector;

    .line 137
    return-void
.end method

.method private compact(Lcom/itextpdf/layout/hyphenation/CharVector;Lcom/itextpdf/layout/hyphenation/TernaryTree;C)V
    .locals 4
    .param p1, "kx"    # Lcom/itextpdf/layout/hyphenation/CharVector;
    .param p2, "map"    # Lcom/itextpdf/layout/hyphenation/TernaryTree;
    .param p3, "p"    # C

    .line 562
    if-nez p3, :cond_0

    .line 563
    return-void

    .line 565
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    aget-char v0, v0, p3

    const v1, 0xffff

    if-ne v0, v1, :cond_2

    .line 566
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->kv:Lcom/itextpdf/layout/hyphenation/CharVector;

    invoke-virtual {v0}, Lcom/itextpdf/layout/hyphenation/CharVector;->getArray()[C

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    aget-char v1, v1, p3

    invoke-virtual {p2, v0, v1}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->find([CI)I

    move-result v0

    .line 567
    .local v0, "k":I
    if-gez v0, :cond_1

    .line 568
    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->kv:Lcom/itextpdf/layout/hyphenation/CharVector;

    invoke-virtual {v1}, Lcom/itextpdf/layout/hyphenation/CharVector;->getArray()[C

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    aget-char v2, v2, p3

    invoke-static {v1, v2}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->strlen([CI)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p1, v1}, Lcom/itextpdf/layout/hyphenation/CharVector;->alloc(I)I

    move-result v0

    .line 569
    invoke-virtual {p1}, Lcom/itextpdf/layout/hyphenation/CharVector;->getArray()[C

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->kv:Lcom/itextpdf/layout/hyphenation/CharVector;

    invoke-virtual {v2}, Lcom/itextpdf/layout/hyphenation/CharVector;->getArray()[C

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    aget-char v3, v3, p3

    invoke-static {v1, v0, v2, v3}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->strcpy([CI[CI)V

    .line 570
    invoke-virtual {p1}, Lcom/itextpdf/layout/hyphenation/CharVector;->getArray()[C

    move-result-object v1

    int-to-char v2, v0

    invoke-virtual {p2, v1, v0, v2}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->insert([CIC)V

    .line 572
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    int-to-char v2, v0

    aput-char v2, v1, p3

    goto :goto_0

    .line 574
    .end local v0    # "k":I
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    aget-char v0, v0, p3

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->compact(Lcom/itextpdf/layout/hyphenation/CharVector;Lcom/itextpdf/layout/hyphenation/TernaryTree;C)V

    .line 575
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    aget-char v0, v0, p3

    if-eqz v0, :cond_3

    .line 576
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    aget-char v0, v0, p3

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->compact(Lcom/itextpdf/layout/hyphenation/CharVector;Lcom/itextpdf/layout/hyphenation/TernaryTree;C)V

    .line 578
    :cond_3
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->hi:[C

    aget-char v0, v0, p3

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->compact(Lcom/itextpdf/layout/hyphenation/CharVector;Lcom/itextpdf/layout/hyphenation/TernaryTree;C)V

    .line 580
    :goto_0
    return-void
.end method

.method private insert(Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;)C
    .locals 2
    .param p1, "params"    # Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;

    .line 318
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->insertNewBranchIfNeeded(Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;)Ljava/lang/Character;

    move-result-object v0

    .line 319
    .local v0, "newBranch":Ljava/lang/Character;
    if-nez v0, :cond_0

    .line 320
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->insertIntoExistingBranch(Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;)C

    move-result v1

    return v1

    .line 322
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v1

    return v1
.end method

.method private insertIntoExistingBranch(Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;)C
    .locals 13
    .param p1, "params"    # Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;

    .line 230
    iget-char v0, p1, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;->p:C

    .line 231
    .local v0, "initialP":C
    move-object v1, p1

    .line 232
    .local v1, "paramsToInsertNext":Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;
    :goto_0
    if-eqz v1, :cond_a

    .line 233
    iget-char v2, v1, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;->p:C

    .line 235
    .local v2, "p":C
    if-eqz v2, :cond_9

    .line 236
    iget-object v3, v1, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;->key:[C

    .line 237
    .local v3, "key":[C
    iget v4, v1, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;->start:I

    .line 238
    .local v4, "start":I
    iget-char v5, v1, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;->val:C

    .line 239
    .local v5, "val":C
    invoke-static {v3, v4}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->strlen([CI)I

    move-result v6

    .line 240
    .local v6, "len":I
    const/4 v1, 0x0

    .line 242
    iget-object v7, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    aget-char v7, v7, v2

    const v8, 0xffff

    if-ne v7, v8, :cond_2

    .line 246
    iget-char v7, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->freenode:C

    add-int/lit8 v9, v7, 0x1

    int-to-char v9, v9

    iput-char v9, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->freenode:C

    .line 249
    .local v7, "pp":C
    iget-object v9, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    iget-object v10, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    aget-char v10, v10, v2

    aput-char v10, v9, v7

    .line 252
    iget-object v9, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    iget-object v10, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    aget-char v10, v10, v2

    aput-char v10, v9, v7

    .line 253
    iget-object v9, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    const/4 v10, 0x0

    aput-char v10, v9, v2

    .line 254
    nop

    .line 270
    iget-object v9, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    .line 254
    if-lez v6, :cond_1

    .line 255
    iget-object v11, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->kv:Lcom/itextpdf/layout/hyphenation/CharVector;

    iget-object v12, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    aget-char v12, v12, v7

    invoke-virtual {v11, v12}, Lcom/itextpdf/layout/hyphenation/CharVector;->get(I)C

    move-result v11

    aput-char v11, v9, v2

    .line 256
    iget-object v9, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    aput-char v7, v9, v2

    .line 257
    iget-object v9, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    aget-char v11, v9, v7

    add-int/lit8 v11, v11, 0x1

    int-to-char v11, v11

    aput-char v11, v9, v7

    .line 258
    iget-object v9, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->kv:Lcom/itextpdf/layout/hyphenation/CharVector;

    iget-object v11, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    aget-char v11, v11, v7

    invoke-virtual {v9, v11}, Lcom/itextpdf/layout/hyphenation/CharVector;->get(I)C

    move-result v9

    if-nez v9, :cond_0

    .line 260
    iget-object v8, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    aput-char v10, v8, v7

    .line 261
    iget-object v8, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    aput-char v10, v8, v7

    .line 262
    iget-object v8, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->hi:[C

    aput-char v10, v8, v7

    goto :goto_1

    .line 265
    :cond_0
    iget-object v9, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    aput-char v8, v9, v7

    goto :goto_1

    .line 270
    :cond_1
    aput-char v8, v9, v7

    .line 271
    iget-object v8, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->hi:[C

    aput-char v7, v8, v2

    .line 272
    iget-object v8, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    aput-char v10, v8, v2

    .line 273
    iget-object v8, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    aput-char v5, v8, v2

    .line 274
    iget v8, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->length:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->length:I

    .line 275
    goto/16 :goto_5

    .line 278
    .end local v7    # "pp":C
    :cond_2
    :goto_1
    aget-char v7, v3, v4

    .line 279
    .local v7, "s":C
    iget-object v8, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    aget-char v8, v8, v2

    if-ge v7, v8, :cond_4

    .line 280
    new-instance v8, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;

    iget-object v9, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    aget-char v9, v9, v2

    invoke-direct {v8, v9, v3, v4, v5}, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;-><init>(C[CIC)V

    .line 281
    .local v8, "branchParams":Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;
    invoke-direct {p0, v8}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->insertNewBranchIfNeeded(Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;)Ljava/lang/Character;

    move-result-object v9

    .line 282
    .local v9, "insertNew":Ljava/lang/Character;
    if-nez v9, :cond_3

    .line 283
    move-object v1, v8

    goto :goto_2

    .line 285
    :cond_3
    iget-object v10, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    invoke-virtual {v9}, Ljava/lang/Character;->charValue()C

    move-result v11

    aput-char v11, v10, v2

    .line 287
    .end local v8    # "branchParams":Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;
    .end local v9    # "insertNew":Ljava/lang/Character;
    :goto_2
    goto :goto_4

    :cond_4
    iget-object v8, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    aget-char v8, v8, v2

    if-ne v7, v8, :cond_7

    .line 288
    if-eqz v7, :cond_6

    .line 289
    new-instance v8, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;

    iget-object v9, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    aget-char v9, v9, v2

    add-int/lit8 v10, v4, 0x1

    invoke-direct {v8, v9, v3, v10, v5}, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;-><init>(C[CIC)V

    .line 290
    .restart local v8    # "branchParams":Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;
    invoke-direct {p0, v8}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->insertNewBranchIfNeeded(Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;)Ljava/lang/Character;

    move-result-object v9

    .line 291
    .restart local v9    # "insertNew":Ljava/lang/Character;
    if-nez v9, :cond_5

    .line 292
    move-object v1, v8

    goto :goto_3

    .line 294
    :cond_5
    iget-object v10, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    invoke-virtual {v9}, Ljava/lang/Character;->charValue()C

    move-result v11

    aput-char v11, v10, v2

    .line 296
    .end local v8    # "branchParams":Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;
    .end local v9    # "insertNew":Ljava/lang/Character;
    :goto_3
    goto :goto_4

    .line 298
    :cond_6
    iget-object v8, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    aput-char v5, v8, v2

    goto :goto_4

    .line 301
    :cond_7
    new-instance v8, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;

    iget-object v9, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->hi:[C

    aget-char v9, v9, v2

    invoke-direct {v8, v9, v3, v4, v5}, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;-><init>(C[CIC)V

    .line 302
    .restart local v8    # "branchParams":Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;
    invoke-direct {p0, v8}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->insertNewBranchIfNeeded(Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;)Ljava/lang/Character;

    move-result-object v9

    .line 303
    .restart local v9    # "insertNew":Ljava/lang/Character;
    if-nez v9, :cond_8

    .line 304
    move-object v1, v8

    goto :goto_4

    .line 306
    :cond_8
    iget-object v10, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->hi:[C

    invoke-virtual {v9}, Ljava/lang/Character;->charValue()C

    move-result v11

    aput-char v11, v10, v2

    .line 309
    .end local v2    # "p":C
    .end local v3    # "key":[C
    .end local v4    # "start":I
    .end local v5    # "val":C
    .end local v6    # "len":I
    .end local v7    # "s":C
    .end local v8    # "branchParams":Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;
    .end local v9    # "insertNew":Ljava/lang/Character;
    :goto_4
    goto/16 :goto_0

    .line 235
    .restart local v2    # "p":C
    :cond_9
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 310
    .end local v2    # "p":C
    :cond_a
    :goto_5
    return v0
.end method

.method private insertNewBranchIfNeeded(Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;)Ljava/lang/Character;
    .locals 8
    .param p1, "params"    # Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;

    .line 194
    iget-char v0, p1, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;->p:C

    .line 195
    .local v0, "p":C
    iget-object v1, p1, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;->key:[C

    .line 196
    .local v1, "key":[C
    iget v2, p1, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;->start:I

    .line 197
    .local v2, "start":I
    iget-char v3, p1, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;->val:C

    .line 198
    .local v3, "val":C
    invoke-static {v1, v2}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->strlen([CI)I

    move-result v4

    .line 199
    .local v4, "len":I
    if-nez v0, :cond_1

    .line 203
    iget-char v5, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->freenode:C

    add-int/lit8 v6, v5, 0x1

    int-to-char v6, v6

    iput-char v6, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->freenode:C

    .line 206
    .end local v0    # "p":C
    .local v5, "p":C
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    aput-char v3, v0, v5

    .line 207
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->length:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->length:I

    .line 208
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->hi:[C

    const/4 v6, 0x0

    aput-char v6, v0, v5

    .line 209
    nop

    .line 218
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    .line 209
    if-lez v4, :cond_0

    .line 212
    const v6, 0xffff

    aput-char v6, v0, v5

    .line 215
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    iget-object v6, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->kv:Lcom/itextpdf/layout/hyphenation/CharVector;

    add-int/lit8 v7, v4, 0x1

    invoke-virtual {v6, v7}, Lcom/itextpdf/layout/hyphenation/CharVector;->alloc(I)I

    move-result v6

    int-to-char v6, v6

    aput-char v6, v0, v5

    .line 216
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->kv:Lcom/itextpdf/layout/hyphenation/CharVector;

    invoke-virtual {v0}, Lcom/itextpdf/layout/hyphenation/CharVector;->getArray()[C

    move-result-object v0

    iget-object v6, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    aget-char v6, v6, v5

    invoke-static {v0, v6, v1, v2}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->strcpy([CI[CI)V

    goto :goto_0

    .line 218
    :cond_0
    aput-char v6, v0, v5

    .line 219
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    aput-char v6, v0, v5

    .line 221
    :goto_0
    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    return-object v0

    .line 223
    .end local v5    # "p":C
    .restart local v0    # "p":C
    :cond_1
    const/4 v5, 0x0

    return-object v5
.end method

.method private redimNodeArrays(I)V
    .locals 4
    .param p1, "newsize"    # I

    .line 465
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    array-length v0, v0

    if-ge p1, v0, :cond_0

    move v0, p1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    array-length v0, v0

    .line 466
    .local v0, "len":I
    :goto_0
    new-array v1, p1, [C

    .line 467
    .local v1, "na":[C
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 468
    iput-object v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    .line 469
    new-array v1, p1, [C

    .line 470
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->hi:[C

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 471
    iput-object v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->hi:[C

    .line 472
    new-array v1, p1, [C

    .line 473
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 474
    iput-object v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    .line 475
    new-array v1, p1, [C

    .line 476
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 477
    iput-object v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    .line 478
    return-void
.end method

.method public static strcmp(Ljava/lang/String;[CI)I
    .locals 4
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "a"    # [C
    .param p2, "start"    # I

    .line 353
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 354
    .local v0, "len":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_2

    .line 355
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    add-int v3, p2, v1

    aget-char v3, p1, v3

    sub-int/2addr v2, v3

    .line 356
    .local v2, "d":I
    if-eqz v2, :cond_0

    .line 357
    return v2

    .line 359
    :cond_0
    add-int v3, p2, v1

    aget-char v3, p1, v3

    if-nez v3, :cond_1

    .line 360
    return v2

    .line 354
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 363
    .end local v2    # "d":I
    :cond_2
    add-int v2, p2, v1

    aget-char v2, p1, v2

    if-eqz v2, :cond_3

    .line 364
    add-int v2, p2, v1

    aget-char v2, p1, v2

    neg-int v2, v2

    return v2

    .line 366
    :cond_3
    const/4 v2, 0x0

    return v2
.end method

.method public static strcmp([CI[CI)I
    .locals 2
    .param p0, "a"    # [C
    .param p1, "startA"    # I
    .param p2, "b"    # [C
    .param p3, "startB"    # I

    .line 335
    nop

    :goto_0
    aget-char v0, p0, p1

    aget-char v1, p2, p3

    if-ne v0, v1, :cond_1

    .line 336
    aget-char v0, p0, p1

    if-nez v0, :cond_0

    .line 337
    const/4 v0, 0x0

    return v0

    .line 335
    :cond_0
    add-int/lit8 p1, p1, 0x1

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    .line 340
    :cond_1
    aget-char v0, p0, p1

    aget-char v1, p2, p3

    sub-int/2addr v0, v1

    return v0
.end method

.method public static strcpy([CI[CI)V
    .locals 2
    .param p0, "dst"    # [C
    .param p1, "di"    # I
    .param p2, "src"    # [C
    .param p3, "si"    # I

    .line 377
    nop

    :goto_0
    aget-char v0, p2, p3

    if-eqz v0, :cond_0

    .line 378
    add-int/lit8 v0, p1, 0x1

    .end local p1    # "di":I
    .local v0, "di":I
    add-int/lit8 v1, p3, 0x1

    .end local p3    # "si":I
    .local v1, "si":I
    aget-char p3, p2, p3

    aput-char p3, p0, p1

    move p1, v0

    move p3, v1

    goto :goto_0

    .line 380
    .end local v0    # "di":I
    .end local v1    # "si":I
    .restart local p1    # "di":I
    .restart local p3    # "si":I
    :cond_0
    const/4 v0, 0x0

    aput-char v0, p0, p1

    .line 381
    return-void
.end method

.method public static strlen([C)I
    .locals 1
    .param p0, "a"    # [C

    .line 401
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->strlen([CI)I

    move-result v0

    return v0
.end method

.method public static strlen([CI)I
    .locals 3
    .param p0, "a"    # [C
    .param p1, "start"    # I

    .line 389
    const/4 v0, 0x0

    .line 390
    .local v0, "len":I
    move v1, p1

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    aget-char v2, p0, v1

    if-eqz v2, :cond_0

    .line 391
    add-int/lit8 v0, v0, 0x1

    .line 390
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 393
    .end local v1    # "i":I
    :cond_0
    return v0
.end method


# virtual methods
.method public balance()V
    .locals 7

    .line 515
    const/4 v0, 0x0

    .line 516
    .local v0, "i":I
    iget v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->length:I

    .line 517
    .local v1, "n":I
    new-array v2, v1, [Ljava/lang/String;

    .line 518
    .local v2, "k":[Ljava/lang/String;
    new-array v3, v1, [C

    .line 519
    .local v3, "v":[C
    new-instance v4, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;

    invoke-direct {v4, p0}, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;-><init>(Lcom/itextpdf/layout/hyphenation/TernaryTree;)V

    .line 520
    .local v4, "iter":Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;
    :goto_0
    invoke-virtual {v4}, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 521
    invoke-virtual {v4}, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->getValue()C

    move-result v5

    aput-char v5, v3, v0

    .line 522
    add-int/lit8 v5, v0, 0x1

    .end local v0    # "i":I
    .local v5, "i":I
    invoke-virtual {v4}, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;->nextElement()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    aput-object v6, v2, v0

    move v0, v5

    goto :goto_0

    .line 524
    .end local v5    # "i":I
    .restart local v0    # "i":I
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->init()V

    .line 525
    const/4 v5, 0x0

    invoke-virtual {p0, v2, v3, v5, v1}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->insertBalanced([Ljava/lang/String;[CII)V

    .line 529
    return-void
.end method

.method public find(Ljava/lang/String;)I
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .line 410
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 411
    .local v0, "len":I
    add-int/lit8 v1, v0, 0x1

    new-array v1, v1, [C

    .line 412
    .local v1, "strkey":[C
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0, v1, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 413
    aput-char v2, v1, v0

    .line 415
    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->find([CI)I

    move-result v2

    return v2
.end method

.method public find([CI)I
    .locals 5
    .param p1, "key"    # [C
    .param p2, "start"    # I

    .line 426
    iget-char v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->root:C

    .line 427
    .local v0, "p":C
    move v1, p2

    .line 430
    .local v1, "i":I
    :goto_0
    const/4 v2, -0x1

    if-eqz v0, :cond_5

    .line 431
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    aget-char v3, v3, v0

    const v4, 0xffff

    if-ne v3, v4, :cond_1

    .line 432
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->kv:Lcom/itextpdf/layout/hyphenation/CharVector;

    invoke-virtual {v3}, Lcom/itextpdf/layout/hyphenation/CharVector;->getArray()[C

    move-result-object v3

    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    aget-char v4, v4, v0

    invoke-static {p1, v1, v3, v4}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->strcmp([CI[CI)I

    move-result v3

    if-nez v3, :cond_0

    .line 433
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    aget-char v2, v2, v0

    return v2

    .line 435
    :cond_0
    return v2

    .line 438
    :cond_1
    aget-char v2, p1, v1

    .line 439
    .local v2, "c":C
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    aget-char v3, v3, v0

    sub-int v3, v2, v3

    .line 440
    .local v3, "d":I
    if-nez v3, :cond_3

    .line 441
    nop

    .line 445
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    .line 441
    if-nez v2, :cond_2

    .line 442
    aget-char v4, v4, v0

    return v4

    .line 444
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 445
    aget-char v0, v4, v0

    goto :goto_0

    .line 446
    :cond_3
    if-gez v3, :cond_4

    .line 447
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    aget-char v0, v4, v0

    goto :goto_0

    .line 449
    :cond_4
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->hi:[C

    aget-char v0, v4, v0

    goto :goto_0

    .line 452
    .end local v2    # "c":C
    .end local v3    # "d":I
    :cond_5
    return v2
.end method

.method protected init()V
    .locals 2

    .line 141
    const/4 v0, 0x0

    iput-char v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->root:C

    .line 142
    const/4 v1, 0x1

    iput-char v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->freenode:C

    .line 143
    iput v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->length:I

    .line 144
    const/16 v0, 0x800

    new-array v1, v0, [C

    iput-object v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->lo:[C

    .line 145
    new-array v1, v0, [C

    iput-object v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->hi:[C

    .line 146
    new-array v1, v0, [C

    iput-object v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    .line 147
    new-array v0, v0, [C

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->sc:[C

    .line 148
    new-instance v0, Lcom/itextpdf/layout/hyphenation/CharVector;

    invoke-direct {v0}, Lcom/itextpdf/layout/hyphenation/CharVector;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->kv:Lcom/itextpdf/layout/hyphenation/CharVector;

    .line 149
    return-void
.end method

.method public insert(Ljava/lang/String;C)V
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # C

    .line 163
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 167
    .local v0, "len":I
    iget-char v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->freenode:C

    add-int/2addr v1, v0

    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    array-length v2, v2

    if-le v1, v2, :cond_0

    .line 168
    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    array-length v1, v1

    add-int/lit16 v1, v1, 0x800

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->redimNodeArrays(I)V

    .line 170
    :cond_0
    add-int/lit8 v1, v0, -0x1

    .end local v0    # "len":I
    .local v1, "len":I
    new-array v0, v0, [C

    .line 171
    .local v0, "strkey":[C
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1, v0, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 172
    aput-char v2, v0, v1

    .line 173
    new-instance v3, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;

    iget-char v4, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->root:C

    invoke-direct {v3, v4, v0, v2, p2}, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;-><init>(C[CIC)V

    invoke-direct {p0, v3}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->insert(Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;)C

    move-result v2

    iput-char v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->root:C

    .line 174
    return-void
.end method

.method public insert([CIC)V
    .locals 3
    .param p1, "key"    # [C
    .param p2, "start"    # I
    .param p3, "val"    # C

    .line 183
    invoke-static {p1}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->strlen([C)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 184
    .local v0, "len":I
    iget-char v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->freenode:C

    add-int/2addr v1, v0

    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    array-length v2, v2

    if-le v1, v2, :cond_0

    .line 185
    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->eq:[C

    array-length v1, v1

    add-int/lit16 v1, v1, 0x800

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->redimNodeArrays(I)V

    .line 187
    :cond_0
    new-instance v1, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;

    iget-char v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->root:C

    invoke-direct {v1, v2, p1, p2, p3}, Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;-><init>(C[CIC)V

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->insert(Lcom/itextpdf/layout/hyphenation/TernaryTree$TreeInsertionParams;)C

    move-result v1

    iput-char v1, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->root:C

    .line 188
    return-void
.end method

.method protected insertBalanced([Ljava/lang/String;[CII)V
    .locals 4
    .param p1, "k"    # [Ljava/lang/String;
    .param p2, "v"    # [C
    .param p3, "offset"    # I
    .param p4, "n"    # I

    .line 497
    const/4 v0, 0x1

    if-ge p4, v0, :cond_0

    .line 498
    return-void

    .line 500
    :cond_0
    shr-int/lit8 v1, p4, 0x1

    .line 502
    .local v1, "m":I
    add-int v2, v1, p3

    aget-object v2, p1, v2

    add-int v3, v1, p3

    aget-char v3, p2, v3

    invoke-virtual {p0, v2, v3}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->insert(Ljava/lang/String;C)V

    .line 503
    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->insertBalanced([Ljava/lang/String;[CII)V

    .line 505
    add-int v2, p3, v1

    add-int/2addr v2, v0

    sub-int v3, p4, v1

    sub-int/2addr v3, v0

    invoke-virtual {p0, p1, p2, v2, v3}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->insertBalanced([Ljava/lang/String;[CII)V

    .line 506
    return-void
.end method

.method public keys()Ljava/util/Enumeration;
    .locals 1

    .line 584
    new-instance v0, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;

    invoke-direct {v0, p0}, Lcom/itextpdf/layout/hyphenation/TernaryTreeIterator;-><init>(Lcom/itextpdf/layout/hyphenation/TernaryTree;)V

    return-object v0
.end method

.method public knows(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 460
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->find(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public size()I
    .locals 1

    .line 482
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->length:I

    return v0
.end method

.method public trimToSize()V
    .locals 3

    .line 546
    invoke-virtual {p0}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->balance()V

    .line 549
    iget-char v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->freenode:C

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->redimNodeArrays(I)V

    .line 552
    new-instance v0, Lcom/itextpdf/layout/hyphenation/CharVector;

    invoke-direct {v0}, Lcom/itextpdf/layout/hyphenation/CharVector;-><init>()V

    .line 553
    .local v0, "kx":Lcom/itextpdf/layout/hyphenation/CharVector;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/hyphenation/CharVector;->alloc(I)I

    .line 554
    new-instance v1, Lcom/itextpdf/layout/hyphenation/TernaryTree;

    invoke-direct {v1}, Lcom/itextpdf/layout/hyphenation/TernaryTree;-><init>()V

    .line 555
    .local v1, "map":Lcom/itextpdf/layout/hyphenation/TernaryTree;
    iget-char v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->root:C

    invoke-direct {p0, v0, v1, v2}, Lcom/itextpdf/layout/hyphenation/TernaryTree;->compact(Lcom/itextpdf/layout/hyphenation/CharVector;Lcom/itextpdf/layout/hyphenation/TernaryTree;C)V

    .line 556
    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->kv:Lcom/itextpdf/layout/hyphenation/CharVector;

    .line 557
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/TernaryTree;->kv:Lcom/itextpdf/layout/hyphenation/CharVector;

    invoke-virtual {v2}, Lcom/itextpdf/layout/hyphenation/CharVector;->trimToSize()V

    .line 558
    return-void
.end method
