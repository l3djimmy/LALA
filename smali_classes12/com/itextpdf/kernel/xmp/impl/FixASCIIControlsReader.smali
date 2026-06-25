.class public Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;
.super Ljava/io/PushbackReader;
.source "FixASCIIControlsReader.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x8

.field private static final STATE_AMP:I = 0x1

.field private static final STATE_DIG1:I = 0x4

.field private static final STATE_ERROR:I = 0x5

.field private static final STATE_HASH:I = 0x2

.field private static final STATE_HEX:I = 0x3

.field private static final STATE_START:I


# instance fields
.field private control:I

.field private digits:I

.field private state:I


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "input"    # Ljava/io/Reader;

    .line 71
    const/16 v0, 0x8

    invoke-direct {p0, p1, v0}, Ljava/io/PushbackReader;-><init>(Ljava/io/Reader;I)V

    .line 58
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    .line 60
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->control:I

    .line 62
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->digits:I

    .line 72
    return-void
.end method

.method private processChar(C)C
    .locals 10
    .param p1, "ch"    # C

    .line 135
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    const/16 v1, 0x3b

    const/4 v2, 0x3

    const/16 v3, 0xa

    const/4 v4, 0x4

    const/16 v5, 0x39

    const/16 v6, 0x30

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x5

    packed-switch v0, :pswitch_data_0

    .line 232
    return p1

    .line 227
    :pswitch_0
    iput v8, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    .line 228
    return p1

    .line 175
    :pswitch_1
    if-gt v6, p1, :cond_1

    if-gt p1, v5, :cond_1

    .line 177
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->control:I

    mul-int/2addr v0, v3

    invoke-static {p1, v3}, Ljava/lang/Character;->digit(CI)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->control:I

    .line 178
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->digits:I

    add-int/2addr v0, v7

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->digits:I

    .line 179
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->digits:I

    if-gt v0, v9, :cond_0

    .line 181
    iput v4, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_0

    .line 185
    :cond_0
    iput v9, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_0

    .line 188
    :cond_1
    if-ne p1, v1, :cond_2

    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->control:I

    int-to-char v0, v0

    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/Utils;->isControlChar(C)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 190
    iput v8, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    .line 191
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->control:I

    int-to-char v0, v0

    return v0

    .line 195
    :cond_2
    iput v9, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    .line 197
    :goto_0
    return p1

    .line 200
    :pswitch_2
    if-gt v6, p1, :cond_3

    if-le p1, v5, :cond_5

    :cond_3
    const/16 v0, 0x61

    if-gt v0, p1, :cond_4

    const/16 v0, 0x66

    if-le p1, v0, :cond_5

    :cond_4
    const/16 v0, 0x41

    if-gt v0, p1, :cond_7

    const/16 v0, 0x46

    if-gt p1, v0, :cond_7

    .line 204
    :cond_5
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->control:I

    const/16 v1, 0x10

    mul-int/2addr v0, v1

    invoke-static {p1, v1}, Ljava/lang/Character;->digit(CI)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->control:I

    .line 205
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->digits:I

    add-int/2addr v0, v7

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->digits:I

    .line 206
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->digits:I

    if-gt v0, v4, :cond_6

    .line 208
    iput v2, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_1

    .line 212
    :cond_6
    iput v9, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_1

    .line 215
    :cond_7
    if-ne p1, v1, :cond_8

    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->control:I

    int-to-char v0, v0

    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/Utils;->isControlChar(C)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 217
    iput v8, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    .line 218
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->control:I

    int-to-char v0, v0

    return v0

    .line 222
    :cond_8
    iput v9, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    .line 224
    :goto_1
    return p1

    .line 156
    :pswitch_3
    const/16 v0, 0x78

    if-ne p1, v0, :cond_9

    .line 158
    iput v8, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->control:I

    .line 159
    iput v8, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->digits:I

    .line 160
    iput v2, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_2

    .line 162
    :cond_9
    if-gt v6, p1, :cond_a

    if-gt p1, v5, :cond_a

    .line 164
    invoke-static {p1, v3}, Ljava/lang/Character;->digit(CI)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->control:I

    .line 165
    iput v7, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->digits:I

    .line 166
    iput v4, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_2

    .line 170
    :cond_a
    iput v9, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    .line 172
    :goto_2
    return p1

    .line 145
    :pswitch_4
    const/16 v0, 0x23

    if-ne p1, v0, :cond_b

    .line 147
    const/4 v0, 0x2

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_3

    .line 151
    :cond_b
    iput v9, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    .line 153
    :goto_3
    return p1

    .line 138
    :pswitch_5
    const/16 v0, 0x26

    if-ne p1, v0, :cond_c

    .line 140
    iput v7, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    .line 142
    :cond_c
    return p1

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


# virtual methods
.method public read([CII)I
    .locals 9
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 80
    const/4 v0, 0x0

    .line 81
    .local v0, "readAhead":I
    const/4 v1, 0x0

    .line 82
    .local v1, "read":I
    move v2, p2

    .line 83
    .local v2, "pos":I
    const/16 v3, 0x8

    new-array v3, v3, [C

    .line 85
    .local v3, "readAheadBuffer":[C
    const/4 v4, 0x1

    .line 86
    .local v4, "available":Z
    :cond_0
    :goto_0
    if-eqz v4, :cond_6

    if-ge v1, p3, :cond_6

    .line 88
    const/4 v5, 0x1

    invoke-super {p0, v3, v0, v5}, Ljava/io/PushbackReader;->read([CII)I

    move-result v6

    const/4 v7, 0x0

    if-ne v6, v5, :cond_1

    goto :goto_1

    :cond_1
    move v5, v7

    :goto_1
    move v4, v5

    .line 89
    const/4 v5, 0x5

    if-eqz v4, :cond_5

    .line 91
    aget-char v6, v3, v0

    invoke-direct {p0, v6}, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->processChar(C)C

    move-result v6

    .line 92
    .local v6, "c":C
    iget v8, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    if-nez v8, :cond_3

    .line 95
    invoke-static {v6}, Lcom/itextpdf/kernel/xmp/impl/Utils;->isControlChar(C)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 97
    const/16 v6, 0x20

    .line 99
    :cond_2
    add-int/lit8 v5, v2, 0x1

    .end local v2    # "pos":I
    .local v5, "pos":I
    aput-char v6, p1, v2

    .line 100
    const/4 v0, 0x0

    .line 101
    add-int/lit8 v1, v1, 0x1

    move v2, v5

    goto :goto_2

    .line 103
    .end local v5    # "pos":I
    .restart local v2    # "pos":I
    :cond_3
    iget v8, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    if-ne v8, v5, :cond_4

    .line 105
    add-int/lit8 v5, v0, 0x1

    invoke-virtual {p0, v3, v7, v5}, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->unread([CII)V

    .line 106
    const/4 v0, 0x0

    goto :goto_2

    .line 110
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 112
    .end local v6    # "c":C
    :goto_2
    goto :goto_0

    .line 113
    :cond_5
    if-lez v0, :cond_0

    .line 116
    invoke-virtual {p0, v3, v7, v0}, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->unread([CII)V

    .line 117
    iput v5, p0, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;->state:I

    .line 118
    const/4 v0, 0x0

    .line 119
    const/4 v4, 0x1

    goto :goto_0

    .line 124
    :cond_6
    if-gtz v1, :cond_8

    if-eqz v4, :cond_7

    goto :goto_3

    :cond_7
    const/4 v5, -0x1

    goto :goto_4

    :cond_8
    :goto_3
    move v5, v1

    :goto_4
    return v5
.end method
