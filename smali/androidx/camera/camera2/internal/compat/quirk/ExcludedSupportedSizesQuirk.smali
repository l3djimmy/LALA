.class public Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;
.super Ljava/lang/Object;
.source "ExcludedSupportedSizesQuirk.java"

# interfaces
.implements Landroidx/camera/core/impl/Quirk;


# static fields
.field private static final TAG:Ljava/lang/String; = "ExcludedSupportedSizesQuirk"

.field private static final UNKNOWN_IMAGE_FORMAT:I = -0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getHuaweiP20LiteExcludedSizes(Ljava/lang/String;ILjava/lang/Class;)Ljava/util/List;
    .locals 3
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "imageFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 160
    .local p3, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 162
    .local v0, "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const-string v1, "0"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x22

    if-eq p2, v1, :cond_0

    const/16 v1, 0x23

    if-eq p2, v1, :cond_0

    if-eqz p3, :cond_1

    .line 165
    :cond_0
    new-instance v1, Landroid/util/Size;

    const/16 v2, 0x2d0

    invoke-direct {v1, v2, v2}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    new-instance v1, Landroid/util/Size;

    const/16 v2, 0x190

    invoke-direct {v1, v2, v2}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    :cond_1
    return-object v0
.end method

.method private getOnePlus6ExcludedSizes(Ljava/lang/String;I)Ljava/util/List;
    .locals 4
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "imageFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 139
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 140
    .local v0, "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const-string v1, "0"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x100

    if-ne p2, v1, :cond_0

    .line 141
    new-instance v1, Landroid/util/Size;

    const/16 v2, 0x1040

    const/16 v3, 0xc30

    invoke-direct {v1, v2, v3}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    new-instance v1, Landroid/util/Size;

    const/16 v2, 0xfa0

    const/16 v3, 0xbb8

    invoke-direct {v1, v2, v3}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    :cond_0
    return-object v0
.end method

.method private getOnePlus6TExcludedSizes(Ljava/lang/String;I)Ljava/util/List;
    .locals 4
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "imageFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 149
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .local v0, "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const-string v1, "0"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x100

    if-ne p2, v1, :cond_0

    .line 151
    new-instance v1, Landroid/util/Size;

    const/16 v2, 0x1040

    const/16 v3, 0xc30

    invoke-direct {v1, v2, v3}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    new-instance v1, Landroid/util/Size;

    const/16 v2, 0xfa0

    const/16 v3, 0xbb8

    invoke-direct {v1, v2, v3}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    :cond_0
    return-object v0
.end method

.method private getRedmiNote9ProExcludedSizes(Ljava/lang/String;I)Ljava/util/List;
    .locals 4
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "imageFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 252
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 253
    .local v0, "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const-string v1, "0"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x100

    if-ne p2, v1, :cond_0

    .line 254
    new-instance v1, Landroid/util/Size;

    const/16 v2, 0x2440

    const/16 v3, 0x1b20

    invoke-direct {v1, v2, v3}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    :cond_0
    return-object v0
.end method

.method private getSamsungJ7Api27AboveExcludedSizes(Ljava/lang/String;ILjava/lang/Class;)Ljava/util/List;
    .locals 9
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "imageFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 216
    .local p3, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 219
    .local v0, "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const-string v1, "0"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/16 v2, 0x23

    const/16 v3, 0x22

    const/16 v4, 0x438

    const/16 v5, 0x480

    const/16 v6, 0x600

    const/16 v7, 0x780

    const/16 v8, 0x800

    if-eqz v1, :cond_2

    .line 220
    if-eq p2, v3, :cond_1

    if-eqz p3, :cond_0

    goto :goto_0

    .line 230
    :cond_0
    if-ne p2, v2, :cond_4

    .line 231
    new-instance v1, Landroid/util/Size;

    invoke-direct {v1, v8, v6}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 232
    new-instance v1, Landroid/util/Size;

    invoke-direct {v1, v8, v5}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 233
    new-instance v1, Landroid/util/Size;

    invoke-direct {v1, v7, v4}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 222
    :cond_1
    :goto_0
    new-instance v1, Landroid/util/Size;

    const/16 v2, 0xc18

    const/16 v3, 0x1020

    invoke-direct {v1, v3, v2}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 223
    new-instance v1, Landroid/util/Size;

    const/16 v2, 0x912

    invoke-direct {v1, v3, v2}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    new-instance v1, Landroid/util/Size;

    const/16 v2, 0xc10

    invoke-direct {v1, v2, v2}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 225
    new-instance v1, Landroid/util/Size;

    const/16 v2, 0x990

    const/16 v3, 0xcc0

    invoke-direct {v1, v3, v2}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 226
    new-instance v1, Landroid/util/Size;

    const/16 v2, 0x72c

    invoke-direct {v1, v3, v2}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    new-instance v1, Landroid/util/Size;

    invoke-direct {v1, v8, v6}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 228
    new-instance v1, Landroid/util/Size;

    invoke-direct {v1, v8, v5}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    new-instance v1, Landroid/util/Size;

    invoke-direct {v1, v7, v4}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 235
    :cond_2
    const-string v1, "1"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 236
    if-eq p2, v3, :cond_3

    if-eq p2, v2, :cond_3

    if-eqz p3, :cond_4

    .line 238
    :cond_3
    new-instance v1, Landroid/util/Size;

    const/16 v2, 0xa10

    const/16 v3, 0x78c

    invoke-direct {v1, v2, v3}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    new-instance v1, Landroid/util/Size;

    const/16 v2, 0xa00

    const/16 v3, 0x5a0

    invoke-direct {v1, v2, v3}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 240
    new-instance v1, Landroid/util/Size;

    invoke-direct {v1, v7, v7}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 241
    new-instance v1, Landroid/util/Size;

    invoke-direct {v1, v8, v6}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    new-instance v1, Landroid/util/Size;

    invoke-direct {v1, v8, v5}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 243
    new-instance v1, Landroid/util/Size;

    invoke-direct {v1, v7, v4}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 247
    :cond_4
    :goto_1
    return-object v0
.end method

.method private getSamsungJ7PrimeApi27AboveExcludedSizes(Ljava/lang/String;ILjava/lang/Class;)Ljava/util/List;
    .locals 16
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "imageFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 174
    .local p3, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p1

    move/from16 v1, p2

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 177
    .local v2, "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const-string v3, "0"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/16 v4, 0x23

    const/16 v5, 0x22

    const/16 v6, 0x438

    const/16 v7, 0x480

    const/16 v8, 0x600

    const/16 v9, 0x72c

    const/16 v10, 0x780

    const/16 v11, 0x990

    const/16 v12, 0x800

    const/16 v13, 0xcc0

    if-eqz v3, :cond_2

    .line 178
    const/16 v3, 0x912

    const/16 v14, 0x1020

    const/16 v15, 0xc10

    if-eq v1, v5, :cond_1

    if-eqz p3, :cond_0

    goto :goto_0

    .line 188
    :cond_0
    if-ne v1, v4, :cond_4

    .line 189
    new-instance v4, Landroid/util/Size;

    invoke-direct {v4, v14, v3}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v15, v15}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v13, v11}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v13, v9}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v12, v8}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v12, v7}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v10, v6}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 180
    :cond_1
    :goto_0
    new-instance v4, Landroid/util/Size;

    const/16 v5, 0xc18

    invoke-direct {v4, v14, v5}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    new-instance v4, Landroid/util/Size;

    invoke-direct {v4, v14, v3}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 182
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v15, v15}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 183
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v13, v11}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v13, v9}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v12, v8}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v12, v7}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v10, v6}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 197
    :cond_2
    const-string v3, "1"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 198
    if-eq v1, v5, :cond_3

    if-eq v1, v4, :cond_3

    if-eqz p3, :cond_4

    .line 200
    :cond_3
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v13, v11}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v13, v9}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 202
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v11, v11}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v10, v10}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v12, v8}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 205
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v12, v7}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v10, v6}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    :cond_4
    :goto_1
    return-object v2
.end method

.method private static isHuaweiP20Lite()Z
    .locals 2

    .line 70
    const-string v0, "HUAWEI"

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "HWANE"

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isOnePlus6()Z
    .locals 2

    .line 61
    const-string v0, "OnePlus"

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "OnePlus6"

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isOnePlus6T()Z
    .locals 2

    .line 65
    const-string v0, "OnePlus"

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "OnePlus6T"

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isRedmiNote9Pro()Z
    .locals 2

    .line 86
    const-string/jumbo v0, "REDMI"

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    .line 87
    const-string/jumbo v1, "joyeuse"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 86
    :goto_0
    return v0
.end method

.method private static isSamsungJ7Api27Above()Z
    .locals 2

    .line 80
    const-string/jumbo v0, "SAMSUNG"

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    .line 81
    const-string v1, "J7XELTE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1b

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 80
    :goto_0
    return v0
.end method

.method private static isSamsungJ7PrimeApi27Above()Z
    .locals 2

    .line 74
    const-string/jumbo v0, "SAMSUNG"

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    .line 75
    const-string v1, "ON7XELTE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1b

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 74
    :goto_0
    return v0
.end method

.method static load()Z
    .locals 1

    .line 56
    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->isOnePlus6()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->isOnePlus6T()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->isHuaweiP20Lite()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->isSamsungJ7PrimeApi27Above()Z

    move-result v0

    if-nez v0, :cond_1

    .line 57
    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->isSamsungJ7Api27Above()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->isRedmiNote9Pro()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 56
    :goto_1
    return v0
.end method


# virtual methods
.method public getExcludedSizes(Ljava/lang/String;I)Ljava/util/List;
    .locals 2
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "imageFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 96
    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->isOnePlus6()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    invoke-direct {p0, p1, p2}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->getOnePlus6ExcludedSizes(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 99
    :cond_0
    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->isOnePlus6T()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 100
    invoke-direct {p0, p1, p2}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->getOnePlus6TExcludedSizes(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 102
    :cond_1
    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->isHuaweiP20Lite()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 103
    invoke-direct {p0, p1, p2, v1}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->getHuaweiP20LiteExcludedSizes(Ljava/lang/String;ILjava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 105
    :cond_2
    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->isSamsungJ7PrimeApi27Above()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 106
    invoke-direct {p0, p1, p2, v1}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->getSamsungJ7PrimeApi27AboveExcludedSizes(Ljava/lang/String;ILjava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 108
    :cond_3
    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->isSamsungJ7Api27Above()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 109
    invoke-direct {p0, p1, p2, v1}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->getSamsungJ7Api27AboveExcludedSizes(Ljava/lang/String;ILjava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 111
    :cond_4
    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->isRedmiNote9Pro()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 112
    invoke-direct {p0, p1, p2}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->getRedmiNote9ProExcludedSizes(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 114
    :cond_5
    const-string v0, "ExcludedSupportedSizesQuirk"

    const-string v1, "Cannot retrieve list of supported sizes to exclude on this device."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getExcludedSizes(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;
    .locals 2
    .param p1, "cameraId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 124
    .local p2, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->isHuaweiP20Lite()Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    .line 125
    invoke-direct {p0, p1, v1, p2}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->getHuaweiP20LiteExcludedSizes(Ljava/lang/String;ILjava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 127
    :cond_0
    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->isSamsungJ7PrimeApi27Above()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 128
    invoke-direct {p0, p1, v1, p2}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->getSamsungJ7PrimeApi27AboveExcludedSizes(Ljava/lang/String;ILjava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 130
    :cond_1
    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->isSamsungJ7Api27Above()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 131
    invoke-direct {p0, p1, v1, p2}, Landroidx/camera/camera2/internal/compat/quirk/ExcludedSupportedSizesQuirk;->getSamsungJ7Api27AboveExcludedSizes(Ljava/lang/String;ILjava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 133
    :cond_2
    const-string v0, "ExcludedSupportedSizesQuirk"

    const-string v1, "Cannot retrieve list of supported sizes to exclude on this device."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
