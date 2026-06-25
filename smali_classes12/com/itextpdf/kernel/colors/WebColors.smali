.class public Lcom/itextpdf/kernel/colors/WebColors;
.super Ljava/util/HashMap;
.source "WebColors.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "[I>;"
    }
.end annotation


# static fields
.field public static final NAMES:Lcom/itextpdf/kernel/colors/WebColors;

.field private static final RGB_MAX_VAL:D = 255.0

.field private static final serialVersionUID:J = 0x58210875bee41afaL


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 42
    new-instance v0, Lcom/itextpdf/kernel/colors/WebColors;

    invoke-direct {v0}, Lcom/itextpdf/kernel/colors/WebColors;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    .line 49
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xf0

    const/16 v2, 0xf8

    const/16 v3, 0xff

    filled-new-array {v1, v2, v3, v3}, [I

    move-result-object v4

    const-string v5, "aliceblue"

    invoke-virtual {v0, v5, v4}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v4, 0xeb

    const/16 v5, 0xd7

    const/16 v6, 0xfa

    filled-new-array {v6, v4, v5, v3}, [I

    move-result-object v4

    const-string v5, "antiquewhite"

    invoke-virtual {v0, v5, v4}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/4 v4, 0x0

    filled-new-array {v4, v3, v3, v3}, [I

    move-result-object v5

    const-string v7, "aqua"

    invoke-virtual {v0, v7, v5}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v5, 0xd4

    const/16 v7, 0x7f

    filled-new-array {v7, v3, v5, v3}, [I

    move-result-object v5

    const-string v8, "aquamarine"

    invoke-virtual {v0, v8, v5}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v5, "azure"

    filled-new-array {v1, v3, v3, v3}, [I

    move-result-object v8

    invoke-virtual {v0, v5, v8}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v5, 0xf5

    const/16 v8, 0xdc

    filled-new-array {v5, v5, v8, v3}, [I

    move-result-object v9

    const-string v10, "beige"

    invoke-virtual {v0, v10, v9}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v9, 0xe4

    const/16 v10, 0xc4

    filled-new-array {v3, v9, v10, v3}, [I

    move-result-object v9

    const-string v10, "bisque"

    invoke-virtual {v0, v10, v9}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v9, "black"

    filled-new-array {v4, v4, v4, v3}, [I

    move-result-object v10

    invoke-virtual {v0, v9, v10}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v9, 0xeb

    const/16 v10, 0xcd

    filled-new-array {v3, v9, v10, v3}, [I

    move-result-object v9

    const-string v11, "blanchedalmond"

    invoke-virtual {v0, v11, v9}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v9, "blue"

    filled-new-array {v4, v4, v3, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v9, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v9, 0x2b

    const/16 v11, 0xe2

    const/16 v12, 0x8a

    filled-new-array {v12, v9, v11, v3}, [I

    move-result-object v9

    const-string v11, "blueviolet"

    invoke-virtual {v0, v11, v9}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v9, 0x2a

    const/16 v11, 0x2a

    const/16 v12, 0xa5

    filled-new-array {v12, v9, v11, v3}, [I

    move-result-object v9

    const-string v11, "brown"

    invoke-virtual {v0, v11, v9}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v9, 0xb8

    const/16 v11, 0x87

    const/16 v12, 0xde

    filled-new-array {v12, v9, v11, v3}, [I

    move-result-object v9

    const-string v11, "burlywood"

    invoke-virtual {v0, v11, v9}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v9, 0x5f

    const/16 v11, 0x9e

    const/16 v13, 0xa0

    filled-new-array {v9, v11, v13, v3}, [I

    move-result-object v9

    const-string v11, "cadetblue"

    invoke-virtual {v0, v11, v9}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v9, "chartreuse"

    filled-new-array {v7, v3, v4, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v9, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v9, 0x1e

    const/16 v11, 0xd2

    const/16 v14, 0x69

    filled-new-array {v11, v14, v9, v3}, [I

    move-result-object v9

    const-string v11, "chocolate"

    invoke-virtual {v0, v11, v9}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v9, 0x50

    filled-new-array {v3, v7, v9, v3}, [I

    move-result-object v9

    const-string v11, "coral"

    invoke-virtual {v0, v11, v9}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v9, 0x95

    const/16 v11, 0xed

    const/16 v15, 0x64

    filled-new-array {v15, v9, v11, v3}, [I

    move-result-object v9

    const-string v11, "cornflowerblue"

    invoke-virtual {v0, v11, v9}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v9, "cornsilk"

    filled-new-array {v3, v2, v8, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v9, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v9, 0x14

    const/16 v11, 0x3c

    filled-new-array {v8, v9, v11, v3}, [I

    move-result-object v9

    const-string v11, "crimson"

    invoke-virtual {v0, v11, v9}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v9, "cyan"

    filled-new-array {v4, v3, v3, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v9, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v9, 0x8b

    filled-new-array {v4, v4, v9, v3}, [I

    move-result-object v11

    const-string v15, "darkblue"

    invoke-virtual {v0, v15, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v11, "darkcyan"

    filled-new-array {v4, v9, v9, v3}, [I

    move-result-object v15

    invoke-virtual {v0, v11, v15}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v11, 0x86

    const/16 v15, 0xb

    const/16 v7, 0xb8

    filled-new-array {v7, v11, v15, v3}, [I

    move-result-object v7

    const-string v11, "darkgoldenrod"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0xa9

    filled-new-array {v7, v7, v7, v3}, [I

    move-result-object v11

    const-string v15, "darkgray"

    invoke-virtual {v0, v15, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v11, "darkgrey"

    filled-new-array {v7, v7, v7, v3}, [I

    move-result-object v7

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x64

    filled-new-array {v4, v7, v4, v3}, [I

    move-result-object v7

    const-string v11, "darkgreen"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0xb7

    const/16 v11, 0x6b

    const/16 v15, 0xbd

    filled-new-array {v15, v7, v11, v3}, [I

    move-result-object v7

    const-string v11, "darkkhaki"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "darkmagenta"

    filled-new-array {v9, v4, v9, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v7, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x55

    const/16 v11, 0x6b

    const/16 v15, 0x2f

    filled-new-array {v7, v11, v15, v3}, [I

    move-result-object v7

    const-string v11, "darkolivegreen"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x8c

    filled-new-array {v3, v7, v4, v3}, [I

    move-result-object v7

    const-string v11, "darkorange"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0xcc

    const/16 v11, 0x99

    const/16 v12, 0x32

    filled-new-array {v11, v12, v7, v3}, [I

    move-result-object v7

    const-string v11, "darkorchid"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "darkred"

    filled-new-array {v9, v4, v4, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v7, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x96

    const/16 v11, 0x7a

    const/16 v12, 0xe9

    filled-new-array {v12, v7, v11, v3}, [I

    move-result-object v7

    const-string v11, "darksalmon"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0xbc

    const/16 v11, 0x8f

    const/16 v12, 0x8f

    filled-new-array {v12, v7, v11, v3}, [I

    move-result-object v7

    const-string v11, "darkseagreen"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x48

    const/16 v11, 0x3d

    filled-new-array {v7, v11, v9, v3}, [I

    move-result-object v7

    const-string v11, "darkslateblue"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x4f

    const/16 v11, 0x4f

    filled-new-array {v15, v7, v11, v3}, [I

    move-result-object v7

    const-string v11, "darkslategray"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x4f

    const/16 v11, 0x4f

    filled-new-array {v15, v7, v11, v3}, [I

    move-result-object v7

    const-string v11, "darkslategrey"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0xce

    const/16 v11, 0xd1

    filled-new-array {v4, v7, v11, v3}, [I

    move-result-object v7

    const-string v11, "darkturquoise"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x94

    const/16 v11, 0xd3

    filled-new-array {v7, v4, v11, v3}, [I

    move-result-object v7

    const-string v12, "darkviolet"

    invoke-virtual {v0, v12, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x14

    const/16 v12, 0x93

    filled-new-array {v3, v7, v12, v3}, [I

    move-result-object v7

    const-string v12, "deeppink"

    invoke-virtual {v0, v12, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0xbf

    filled-new-array {v4, v7, v3, v3}, [I

    move-result-object v7

    const-string v12, "deepskyblue"

    invoke-virtual {v0, v12, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "dimgray"

    filled-new-array {v14, v14, v14, v3}, [I

    move-result-object v12

    invoke-virtual {v0, v7, v12}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "dimgrey"

    filled-new-array {v14, v14, v14, v3}, [I

    move-result-object v12

    invoke-virtual {v0, v7, v12}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x1e

    const/16 v12, 0x90

    filled-new-array {v7, v12, v3, v3}, [I

    move-result-object v7

    const-string v13, "dodgerblue"

    invoke-virtual {v0, v13, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x22

    const/16 v13, 0x22

    const/16 v11, 0xb2

    filled-new-array {v11, v7, v13, v3}, [I

    move-result-object v7

    const-string v11, "firebrick"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "floralwhite"

    filled-new-array {v3, v6, v1, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v7, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x22

    const/16 v11, 0x22

    filled-new-array {v7, v9, v11, v3}, [I

    move-result-object v7

    const-string v11, "forestgreen"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "fuchsia"

    filled-new-array {v3, v4, v3, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v7, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "gainsboro"

    filled-new-array {v8, v8, v8, v3}, [I

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "ghostwhite"

    filled-new-array {v2, v2, v3, v3}, [I

    move-result-object v2

    invoke-virtual {v0, v7, v2}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v2, 0xd7

    filled-new-array {v3, v2, v4, v3}, [I

    move-result-object v2

    const-string v7, "gold"

    invoke-virtual {v0, v7, v2}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v2, 0xa5

    const/16 v7, 0x20

    const/16 v8, 0xda

    filled-new-array {v8, v2, v7, v3}, [I

    move-result-object v2

    const-string v7, "goldenrod"

    invoke-virtual {v0, v7, v2}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v2, 0x80

    filled-new-array {v2, v2, v2, v3}, [I

    move-result-object v7

    const-string v8, "gray"

    invoke-virtual {v0, v8, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "grey"

    filled-new-array {v2, v2, v2, v3}, [I

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "green"

    filled-new-array {v4, v2, v4, v3}, [I

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0xad

    filled-new-array {v7, v3, v15, v3}, [I

    move-result-object v7

    const-string v8, "greenyellow"

    invoke-virtual {v0, v8, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "honeydew"

    filled-new-array {v1, v3, v1, v3}, [I

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0xb4

    filled-new-array {v3, v14, v7, v3}, [I

    move-result-object v7

    const-string v8, "hotpink"

    invoke-virtual {v0, v8, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x5c

    const/16 v8, 0x5c

    filled-new-array {v10, v7, v8, v3}, [I

    move-result-object v7

    const-string v8, "indianred"

    invoke-virtual {v0, v8, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x4b

    const/16 v8, 0x82

    filled-new-array {v7, v4, v8, v3}, [I

    move-result-object v7

    const-string v8, "indigo"

    invoke-virtual {v0, v8, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "ivory"

    filled-new-array {v3, v3, v1, v3}, [I

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x8c

    const/16 v8, 0xe6

    filled-new-array {v1, v8, v7, v3}, [I

    move-result-object v7

    const-string v11, "khaki"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "lavender"

    filled-new-array {v8, v8, v6, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v7, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "lavenderblush"

    filled-new-array {v3, v1, v5, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v7, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0x7c

    const/16 v11, 0xfc

    filled-new-array {v7, v11, v4, v3}, [I

    move-result-object v7

    const-string v11, "lawngreen"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "lemonchiffon"

    filled-new-array {v3, v6, v10, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v7, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0xad

    const/16 v11, 0xd8

    filled-new-array {v7, v11, v8, v3}, [I

    move-result-object v7

    const-string v11, "lightblue"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v7, "lightcoral"

    filled-new-array {v1, v2, v2, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v7, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0xe0

    filled-new-array {v7, v3, v3, v3}, [I

    move-result-object v7

    const-string v11, "lightcyan"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0xd2

    filled-new-array {v6, v6, v7, v3}, [I

    move-result-object v7

    const-string v11, "lightgoldenrodyellow"

    invoke-virtual {v0, v11, v7}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v7, 0xee

    filled-new-array {v12, v7, v12, v3}, [I

    move-result-object v11

    const-string v13, "lightgreen"

    invoke-virtual {v0, v13, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v11, "lightgray"

    const/16 v13, 0xd3

    filled-new-array {v13, v13, v13, v3}, [I

    move-result-object v15

    invoke-virtual {v0, v11, v15}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v11, "lightgrey"

    filled-new-array {v13, v13, v13, v3}, [I

    move-result-object v15

    invoke-virtual {v0, v11, v15}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v11, 0xb6

    const/16 v13, 0xc1

    filled-new-array {v3, v11, v13, v3}, [I

    move-result-object v11

    const-string v13, "lightpink"

    invoke-virtual {v0, v13, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v11, 0x7a

    const/16 v13, 0xa0

    filled-new-array {v3, v13, v11, v3}, [I

    move-result-object v11

    const-string v13, "lightsalmon"

    invoke-virtual {v0, v13, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v11, 0xb2

    const/16 v13, 0xaa

    const/16 v15, 0x20

    filled-new-array {v15, v11, v13, v3}, [I

    move-result-object v11

    const-string v13, "lightseagreen"

    invoke-virtual {v0, v13, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v11, 0x87

    const/16 v13, 0xce

    filled-new-array {v11, v13, v6, v3}, [I

    move-result-object v11

    const-string v13, "lightskyblue"

    invoke-virtual {v0, v13, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v11, 0x88

    const/16 v13, 0x99

    const/16 v15, 0x77

    filled-new-array {v15, v11, v13, v3}, [I

    move-result-object v11

    const-string v13, "lightslategray"

    invoke-virtual {v0, v13, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v11, 0x88

    const/16 v13, 0x99

    filled-new-array {v15, v11, v13, v3}, [I

    move-result-object v11

    const-string v13, "lightslategrey"

    invoke-virtual {v0, v13, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v11, 0xb0

    const/16 v13, 0xc4

    const/16 v15, 0xde

    filled-new-array {v11, v13, v15, v3}, [I

    move-result-object v11

    const-string v13, "lightsteelblue"

    invoke-virtual {v0, v13, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v11, 0xe0

    filled-new-array {v3, v3, v11, v3}, [I

    move-result-object v11

    const-string v13, "lightyellow"

    invoke-virtual {v0, v13, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v11, "lime"

    filled-new-array {v4, v3, v4, v3}, [I

    move-result-object v13

    invoke-virtual {v0, v11, v13}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v11, "limegreen"

    const/16 v13, 0x32

    filled-new-array {v13, v10, v13, v3}, [I

    move-result-object v15

    invoke-virtual {v0, v11, v15}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v11, "linen"

    filled-new-array {v6, v1, v8, v3}, [I

    move-result-object v1

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v1, "magenta"

    filled-new-array {v3, v4, v3, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v1, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v1, "maroon"

    filled-new-array {v2, v4, v4, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v1, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x66

    const/16 v11, 0xaa

    filled-new-array {v1, v10, v11, v3}, [I

    move-result-object v1

    const-string v11, "mediumaquamarine"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v1, "mediumblue"

    filled-new-array {v4, v4, v10, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v1, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xba

    const/16 v11, 0x55

    const/16 v13, 0xd3

    filled-new-array {v1, v11, v13, v3}, [I

    move-result-object v1

    const-string v11, "mediumorchid"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xdb

    const/16 v11, 0x93

    const/16 v13, 0x70

    filled-new-array {v11, v13, v1, v3}, [I

    move-result-object v1

    const-string v11, "mediumpurple"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xb3

    const/16 v11, 0x71

    const/16 v15, 0x3c

    filled-new-array {v15, v1, v11, v3}, [I

    move-result-object v1

    const-string v11, "mediumseagreen"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x7b

    const/16 v11, 0x68

    filled-new-array {v1, v11, v7, v3}, [I

    move-result-object v1

    const-string v11, "mediumslateblue"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x9a

    filled-new-array {v4, v6, v1, v3}, [I

    move-result-object v1

    const-string v11, "mediumspringgreen"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xd1

    const/16 v11, 0xcc

    const/16 v15, 0x48

    filled-new-array {v15, v1, v11, v3}, [I

    move-result-object v1

    const-string v11, "mediumturquoise"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x15

    const/16 v11, 0x85

    const/16 v15, 0xc7

    filled-new-array {v15, v1, v11, v3}, [I

    move-result-object v1

    const-string v11, "mediumvioletred"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x19

    const/16 v11, 0x19

    filled-new-array {v1, v11, v13, v3}, [I

    move-result-object v1

    const-string v11, "midnightblue"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v1, "mintcream"

    filled-new-array {v5, v3, v6, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v1, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xe4

    const/16 v11, 0xe1

    filled-new-array {v3, v1, v11, v3}, [I

    move-result-object v1

    const-string v11, "mistyrose"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xe4

    const/16 v11, 0xb5

    filled-new-array {v3, v1, v11, v3}, [I

    move-result-object v1

    const-string v11, "moccasin"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xad

    const/16 v15, 0xde

    filled-new-array {v3, v15, v1, v3}, [I

    move-result-object v1

    const-string v11, "navajowhite"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string v1, "navy"

    filled-new-array {v4, v4, v2, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v1, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xfd

    filled-new-array {v1, v5, v8, v3}, [I

    move-result-object v1

    const-string/jumbo v11, "oldlace"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string/jumbo v1, "olive"

    filled-new-array {v2, v2, v4, v3}, [I

    move-result-object v11

    invoke-virtual {v0, v1, v11}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x8e

    const/16 v11, 0x23

    const/16 v15, 0x6b

    filled-new-array {v15, v1, v11, v3}, [I

    move-result-object v1

    const-string/jumbo v11, "olivedrab"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xa5

    filled-new-array {v3, v1, v4, v3}, [I

    move-result-object v1

    const-string/jumbo v11, "orange"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x45

    filled-new-array {v3, v1, v4, v3}, [I

    move-result-object v1

    const-string/jumbo v11, "orangered"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xda

    const/16 v11, 0xd6

    filled-new-array {v1, v13, v11, v3}, [I

    move-result-object v1

    const-string/jumbo v11, "orchid"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xe8

    const/16 v11, 0xaa

    filled-new-array {v7, v1, v11, v3}, [I

    move-result-object v1

    const-string/jumbo v11, "palegoldenrod"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xfb

    const/16 v11, 0x98

    const/16 v15, 0x98

    filled-new-array {v15, v1, v11, v3}, [I

    move-result-object v1

    const-string/jumbo v11, "palegreen"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xaf

    filled-new-array {v1, v7, v7, v3}, [I

    move-result-object v1

    const-string/jumbo v11, "paleturquoise"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xdb

    const/16 v11, 0x93

    filled-new-array {v1, v13, v11, v3}, [I

    move-result-object v1

    const-string/jumbo v11, "palevioletred"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xef

    const/16 v11, 0xd5

    filled-new-array {v3, v1, v11, v3}, [I

    move-result-object v1

    const-string/jumbo v11, "papayawhip"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xda

    const/16 v11, 0xb9

    filled-new-array {v3, v1, v11, v3}, [I

    move-result-object v1

    const-string/jumbo v11, "peachpuff"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x85

    const/16 v11, 0x3f

    filled-new-array {v10, v1, v11, v3}, [I

    move-result-object v1

    const-string/jumbo v11, "peru"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xc0

    const/16 v11, 0xcb

    filled-new-array {v3, v1, v11, v3}, [I

    move-result-object v1

    const-string/jumbo v11, "pink"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xdd

    const/16 v11, 0xdd

    const/16 v15, 0xa0

    filled-new-array {v1, v15, v11, v3}, [I

    move-result-object v1

    const-string/jumbo v11, "plum"

    invoke-virtual {v0, v11, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xb0

    const/16 v11, 0xe0

    filled-new-array {v1, v11, v8, v3}, [I

    move-result-object v1

    const-string/jumbo v8, "powderblue"

    invoke-virtual {v0, v8, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string/jumbo v1, "purple"

    filled-new-array {v2, v4, v2, v3}, [I

    move-result-object v8

    invoke-virtual {v0, v1, v8}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string/jumbo v1, "red"

    filled-new-array {v3, v4, v4, v3}, [I

    move-result-object v8

    invoke-virtual {v0, v1, v8}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x8f

    const/16 v8, 0x8f

    const/16 v11, 0xbc

    filled-new-array {v11, v1, v8, v3}, [I

    move-result-object v1

    const-string/jumbo v8, "rosybrown"

    invoke-virtual {v0, v8, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x41

    const/16 v8, 0xe1

    filled-new-array {v1, v14, v8, v3}, [I

    move-result-object v1

    const-string/jumbo v8, "royalblue"

    invoke-virtual {v0, v8, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x45

    const/16 v8, 0x13

    filled-new-array {v9, v1, v8, v3}, [I

    move-result-object v1

    const-string/jumbo v8, "saddlebrown"

    invoke-virtual {v0, v8, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x72

    filled-new-array {v6, v2, v1, v3}, [I

    move-result-object v1

    const-string/jumbo v8, "salmon"

    invoke-virtual {v0, v8, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xa4

    const/16 v8, 0x60

    const/16 v11, 0xf4

    filled-new-array {v11, v1, v8, v3}, [I

    move-result-object v1

    const-string/jumbo v8, "sandybrown"

    invoke-virtual {v0, v8, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x2e

    const/16 v8, 0x57

    filled-new-array {v1, v9, v8, v3}, [I

    move-result-object v1

    const-string/jumbo v8, "seagreen"

    invoke-virtual {v0, v8, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string/jumbo v1, "seashell"

    filled-new-array {v3, v5, v7, v3}, [I

    move-result-object v8

    invoke-virtual {v0, v1, v8}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x52

    const/16 v8, 0x2d

    const/16 v15, 0xa0

    filled-new-array {v15, v1, v8, v3}, [I

    move-result-object v1

    const-string/jumbo v8, "sienna"

    invoke-virtual {v0, v8, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xc0

    const/16 v8, 0xc0

    const/16 v9, 0xc0

    filled-new-array {v9, v1, v8, v3}, [I

    move-result-object v1

    const-string/jumbo v8, "silver"

    invoke-virtual {v0, v8, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xce

    const/16 v8, 0xeb

    const/16 v9, 0x87

    filled-new-array {v9, v1, v8, v3}, [I

    move-result-object v1

    const-string/jumbo v8, "skyblue"

    invoke-virtual {v0, v8, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x6a

    const/16 v8, 0x5a

    filled-new-array {v1, v8, v10, v3}, [I

    move-result-object v1

    const-string/jumbo v8, "slateblue"

    invoke-virtual {v0, v8, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string/jumbo v1, "slategray"

    filled-new-array {v13, v2, v12, v3}, [I

    move-result-object v8

    invoke-virtual {v0, v1, v8}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string/jumbo v1, "slategrey"

    filled-new-array {v13, v2, v12, v3}, [I

    move-result-object v8

    invoke-virtual {v0, v1, v8}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string/jumbo v1, "snow"

    filled-new-array {v3, v6, v6, v3}, [I

    move-result-object v6

    invoke-virtual {v0, v1, v6}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string/jumbo v1, "springgreen"

    const/16 v6, 0x7f

    filled-new-array {v4, v3, v6, v3}, [I

    move-result-object v6

    invoke-virtual {v0, v1, v6}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x82

    const/16 v6, 0xb4

    const/16 v8, 0x46

    filled-new-array {v8, v1, v6, v3}, [I

    move-result-object v1

    const-string/jumbo v6, "steelblue"

    invoke-virtual {v0, v6, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xb4

    const/16 v6, 0x8c

    const/16 v8, 0xd2

    filled-new-array {v8, v1, v6, v3}, [I

    move-result-object v1

    const-string/jumbo v6, "tan"

    invoke-virtual {v0, v6, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string/jumbo v1, "teal"

    filled-new-array {v4, v2, v2, v3}, [I

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xbf

    const/16 v2, 0xd8

    const/16 v6, 0xd8

    filled-new-array {v6, v1, v2, v3}, [I

    move-result-object v1

    const-string/jumbo v2, "thistle"

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x63

    const/16 v2, 0x47

    filled-new-array {v3, v1, v2, v3}, [I

    move-result-object v1

    const-string/jumbo v2, "tomato"

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string/jumbo v1, "transparent"

    filled-new-array {v3, v3, v3, v4}, [I

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xe0

    const/16 v2, 0xd0

    const/16 v6, 0x40

    filled-new-array {v6, v1, v2, v3}, [I

    move-result-object v1

    const-string/jumbo v2, "turquoise"

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x82

    filled-new-array {v7, v1, v7, v3}, [I

    move-result-object v1

    const-string/jumbo v2, "violet"

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0xb3

    const/16 v15, 0xde

    filled-new-array {v5, v15, v1, v3}, [I

    move-result-object v1

    const-string/jumbo v2, "wheat"

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string/jumbo v1, "white"

    filled-new-array {v3, v3, v3, v3}, [I

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string/jumbo v1, "whitesmoke"

    filled-new-array {v5, v5, v5, v3}, [I

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const-string/jumbo v1, "yellow"

    filled-new-array {v3, v3, v4, v3}, [I

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    const/16 v1, 0x9a

    const/16 v13, 0x32

    filled-new-array {v1, v10, v13, v3}, [I

    move-result-object v1

    const-string/jumbo v2, "yellowgreen"

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/colors/WebColors;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-void
.end method

.method private static getAlphaChannelValue(Ljava/lang/String;)F
    .locals 2
    .param p0, "rgbChannel"    # Ljava/lang/String;

    .line 379
    const-string v0, "%"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 380
    invoke-static {p0}, Lcom/itextpdf/kernel/colors/WebColors;->parsePercentValue(Ljava/lang/String;)F

    move-result v0

    .local v0, "alpha":F
    goto :goto_0

    .line 382
    .end local v0    # "alpha":F
    :cond_0
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    .line 384
    .restart local v0    # "alpha":F
    :goto_0
    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 385
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 386
    return v0
.end method

.method public static getCMYKArray(Ljava/lang/String;)[F
    .locals 6
    .param p0, "name"    # Ljava/lang/String;

    .line 239
    const-string v0, "device-cmyk()/, \t\r\n\u000c"

    const/4 v1, 0x0

    .line 241
    .local v1, "color":[F
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 242
    .local v2, "colorName":Ljava/lang/String;
    const-string v3, "device-cmyk("

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 243
    move-object v3, v0

    .line 244
    .local v3, "delim":Ljava/lang/String;
    new-instance v4, Ljava/util/StringTokenizer;

    invoke-direct {v4, v2, v0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    .local v4, "tok":Ljava/util/StringTokenizer;
    const/4 v0, 0x5

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    move-object v1, v0

    .line 246
    invoke-static {v1, v4}, Lcom/itextpdf/kernel/colors/WebColors;->parseCMYKColors([FLjava/util/StringTokenizer;)V

    .line 247
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 248
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/colors/WebColors;->getAlphaChannelValue(Ljava/lang/String;)F

    move-result v0

    const/4 v5, 0x4

    aput v0, v1, v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 254
    .end local v2    # "colorName":Ljava/lang/String;
    .end local v3    # "delim":Ljava/lang/String;
    .end local v4    # "tok":Ljava/util/StringTokenizer;
    :cond_0
    goto :goto_0

    .line 251
    :catch_0
    move-exception v0

    .line 253
    .local v0, "exc":Ljava/lang/Exception;
    const/4 v1, 0x0

    .line 256
    .end local v0    # "exc":Ljava/lang/Exception;
    :goto_0
    return-object v1

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static getCMYKChannelValue(Ljava/lang/String;)F
    .locals 1
    .param p0, "cmykChannel"    # Ljava/lang/String;

    .line 369
    const-string v0, "%"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 370
    invoke-static {p0}, Lcom/itextpdf/kernel/colors/WebColors;->parsePercentValue(Ljava/lang/String;)F

    move-result v0

    return v0

    .line 372
    :cond_0
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public static getCMYKColor(Ljava/lang/String;)Lcom/itextpdf/kernel/colors/DeviceCmyk;
    .locals 6
    .param p0, "name"    # Ljava/lang/String;

    .line 223
    invoke-static {p0}, Lcom/itextpdf/kernel/colors/WebColors;->getCMYKArray(Ljava/lang/String;)[F

    move-result-object v0

    .line 224
    .local v0, "cmykColor":[F
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 225
    new-instance v2, Lcom/itextpdf/kernel/colors/DeviceCmyk;

    const/16 v3, 0x64

    invoke-direct {v2, v1, v1, v1, v3}, Lcom/itextpdf/kernel/colors/DeviceCmyk;-><init>(IIII)V

    return-object v2

    .line 227
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/colors/DeviceCmyk;

    aget v1, v0, v1

    const/4 v3, 0x1

    aget v3, v0, v3

    const/4 v4, 0x2

    aget v4, v0, v4

    const/4 v5, 0x3

    aget v5, v0, v5

    invoke-direct {v2, v1, v3, v4, v5}, Lcom/itextpdf/kernel/colors/DeviceCmyk;-><init>(FFFF)V

    return-object v2
.end method

.method public static getRGBAColor(Ljava/lang/String;)[F
    .locals 13
    .param p0, "name"    # Ljava/lang/String;

    .line 266
    const-string/jumbo v0, "rgba(), \t\r\n\u000c"

    const-string/jumbo v1, "rgb(), \t\r\n\u000c"

    const/4 v2, 0x0

    .line 268
    .local v2, "color":[F
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 269
    .local v3, "colorName":Ljava/lang/String;
    invoke-static {v3}, Lcom/itextpdf/kernel/colors/WebColors;->missingHashColorFormat(Ljava/lang/String;)Z

    move-result v4

    .line 270
    .local v4, "colorStrWithoutHash":Z
    const-string v5, "#"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v8, 0x4

    const/4 v9, 0x1

    const/4 v10, 0x2

    const-wide v11, 0x406fe00000000000L    # 255.0

    if-nez v5, :cond_4

    if-eqz v4, :cond_0

    goto/16 :goto_0

    .line 292
    :cond_0
    const-string/jumbo v5, "rgb("

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 293
    move-object v0, v1

    .line 294
    .local v0, "delim":Ljava/lang/String;
    new-instance v5, Ljava/util/StringTokenizer;

    invoke-direct {v5, v3, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    .local v5, "tok":Ljava/util/StringTokenizer;
    new-array v1, v8, [F

    fill-array-data v1, :array_0

    move-object v2, v1

    .line 296
    invoke-static {v2, v5}, Lcom/itextpdf/kernel/colors/WebColors;->parseRGBColors([FLjava/util/StringTokenizer;)V

    .line 297
    .end local v0    # "delim":Ljava/lang/String;
    .end local v5    # "tok":Ljava/util/StringTokenizer;
    goto/16 :goto_1

    :cond_1
    const-string/jumbo v1, "rgba("

    invoke-virtual {v3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 298
    move-object v1, v0

    .line 299
    .local v1, "delim":Ljava/lang/String;
    new-instance v5, Ljava/util/StringTokenizer;

    invoke-direct {v5, v3, v0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    .restart local v5    # "tok":Ljava/util/StringTokenizer;
    new-array v0, v8, [F

    fill-array-data v0, :array_1

    move-object v2, v0

    .line 301
    invoke-static {v2, v5}, Lcom/itextpdf/kernel/colors/WebColors;->parseRGBColors([FLjava/util/StringTokenizer;)V

    .line 302
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 303
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/colors/WebColors;->getAlphaChannelValue(Ljava/lang/String;)F

    move-result v0

    aput v0, v2, v6

    .line 305
    .end local v1    # "delim":Ljava/lang/String;
    .end local v5    # "tok":Ljava/util/StringTokenizer;
    :cond_2
    goto/16 :goto_1

    :cond_3
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/colors/WebColors;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 306
    sget-object v0, Lcom/itextpdf/kernel/colors/WebColors;->NAMES:Lcom/itextpdf/kernel/colors/WebColors;

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/colors/WebColors;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 307
    .local v0, "intColor":[I
    new-array v1, v8, [F

    fill-array-data v1, :array_2

    move-object v2, v1

    .line 308
    aget v1, v0, v7

    int-to-double v5, v1

    div-double/2addr v5, v11

    double-to-float v1, v5

    aput v1, v2, v7

    .line 309
    aget v1, v0, v9

    int-to-double v5, v1

    div-double/2addr v5, v11

    double-to-float v1, v5

    aput v1, v2, v9

    .line 310
    aget v1, v0, v10

    int-to-double v5, v1

    div-double/2addr v5, v11

    double-to-float v1, v5

    aput v1, v2, v10

    goto/16 :goto_1

    .line 271
    .end local v0    # "intColor":[I
    :cond_4
    :goto_0
    if-nez v4, :cond_5

    .line 273
    invoke-virtual {v3, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    move-object v3, v0

    .line 275
    :cond_5
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x10

    if-ne v0, v6, :cond_6

    .line 276
    invoke-virtual {v3, v7, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 277
    .local v0, "red":Ljava/lang/String;
    new-array v5, v8, [F

    fill-array-data v5, :array_3

    move-object v2, v5

    .line 278
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v5

    int-to-double v5, v5

    div-double/2addr v5, v11

    double-to-float v5, v5

    aput v5, v2, v7

    .line 279
    invoke-virtual {v3, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 280
    .local v5, "green":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v6

    int-to-double v6, v6

    div-double/2addr v6, v11

    double-to-float v6, v6

    aput v6, v2, v9

    .line 281
    invoke-virtual {v3, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 282
    .local v6, "blue":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    int-to-double v7, v1

    div-double/2addr v7, v11

    double-to-float v1, v7

    aput v1, v2, v10

    .line 283
    .end local v0    # "red":Ljava/lang/String;
    .end local v5    # "green":Ljava/lang/String;
    .end local v6    # "blue":Ljava/lang/String;
    goto :goto_1

    :cond_6
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v5, 0x6

    if-ne v0, v5, :cond_7

    .line 284
    new-array v0, v8, [F

    fill-array-data v0, :array_4

    move-object v2, v0

    .line 285
    invoke-virtual {v3, v7, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    int-to-double v5, v0

    div-double/2addr v5, v11

    double-to-float v0, v5

    aput v0, v2, v7

    .line 286
    invoke-virtual {v3, v10, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    int-to-double v5, v0

    div-double/2addr v5, v11

    double-to-float v0, v5

    aput v0, v2, v9

    .line 287
    invoke-virtual {v3, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    int-to-double v0, v0

    div-double/2addr v0, v11

    double-to-float v0, v0

    aput v0, v2, v10

    goto :goto_1

    .line 289
    :cond_7
    const-class v0, Lcom/itextpdf/kernel/colors/WebColors;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 290
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Unknown color format: must be rgb or rrggbb."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 291
    .end local v0    # "logger":Lorg/slf4j/Logger;
    nop

    .line 315
    .end local v3    # "colorName":Ljava/lang/String;
    .end local v4    # "colorStrWithoutHash":Z
    :goto_1
    goto :goto_2

    .line 312
    :catch_0
    move-exception v0

    .line 314
    .local v0, "exc":Ljava/lang/Exception;
    const/4 v2, 0x0

    .line 317
    .end local v0    # "exc":Ljava/lang/Exception;
    :goto_2
    return-object v2

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_3
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_4
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static getRGBChannelValue(Ljava/lang/String;)F
    .locals 4
    .param p0, "rgbChannel"    # Ljava/lang/String;

    .line 360
    const-string v0, "%"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 361
    invoke-static {p0}, Lcom/itextpdf/kernel/colors/WebColors;->parsePercentValue(Ljava/lang/String;)F

    move-result v0

    return v0

    .line 363
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    int-to-double v0, v0

    const-wide v2, 0x406fe00000000000L    # 255.0

    div-double/2addr v0, v2

    double-to-float v0, v0

    return v0
.end method

.method public static getRGBColor(Ljava/lang/String;)Lcom/itextpdf/kernel/colors/DeviceRgb;
    .locals 5
    .param p0, "name"    # Ljava/lang/String;

    .line 207
    invoke-static {p0}, Lcom/itextpdf/kernel/colors/WebColors;->getRGBAColor(Ljava/lang/String;)[F

    move-result-object v0

    .line 208
    .local v0, "rgbaColor":[F
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 209
    new-instance v2, Lcom/itextpdf/kernel/colors/DeviceRgb;

    invoke-direct {v2, v1, v1, v1}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    return-object v2

    .line 211
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/colors/DeviceRgb;

    aget v1, v0, v1

    const/4 v3, 0x1

    aget v3, v0, v3

    const/4 v4, 0x2

    aget v4, v0, v4

    invoke-direct {v2, v1, v3, v4}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(FFF)V

    return-object v2
.end method

.method private static missingHashColorFormat(Ljava/lang/String;)Z
    .locals 3
    .param p0, "colStr"    # Ljava/lang/String;

    .line 350
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 351
    .local v0, "len":I
    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 356
    :cond_0
    const/4 v1, 0x0

    return v1

    .line 353
    :cond_1
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[0-9a-f]{"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 354
    .local v1, "match":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    return v2
.end method

.method private static parseCMYKColors([FLjava/util/StringTokenizer;)V
    .locals 3
    .param p0, "color"    # [F
    .param p1, "tok"    # Ljava/util/StringTokenizer;

    .line 331
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_1

    .line 332
    invoke-virtual {p1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 333
    invoke-virtual {p1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/itextpdf/kernel/colors/WebColors;->getCMYKChannelValue(Ljava/lang/String;)F

    move-result v1

    aput v1, p0, v0

    .line 334
    const/4 v1, 0x0

    aget v2, p0, v0

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    aput v1, p0, v0

    .line 335
    const/high16 v1, 0x3f800000    # 1.0f

    aget v2, p0, v0

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    aput v1, p0, v0

    .line 331
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 338
    .end local v0    # "k":I
    :cond_1
    return-void
.end method

.method private static parsePercentValue(Ljava/lang/String;)F
    .locals 4
    .param p0, "rgbChannel"    # Ljava/lang/String;

    .line 390
    nop

    .line 391
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 390
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    float-to-double v0, v0

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    div-double/2addr v0, v2

    double-to-float v0, v0

    return v0
.end method

.method private static parseRGBColors([FLjava/util/StringTokenizer;)V
    .locals 3
    .param p0, "color"    # [F
    .param p1, "tok"    # Ljava/util/StringTokenizer;

    .line 321
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_0
    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    .line 322
    invoke-virtual {p1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 323
    invoke-virtual {p1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/itextpdf/kernel/colors/WebColors;->getRGBChannelValue(Ljava/lang/String;)F

    move-result v1

    aput v1, p0, v0

    .line 324
    const/4 v1, 0x0

    aget v2, p0, v0

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    aput v1, p0, v0

    .line 325
    const/high16 v1, 0x3f800000    # 1.0f

    aget v2, p0, v0

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    aput v1, p0, v0

    .line 321
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 328
    .end local v0    # "k":I
    :cond_1
    return-void
.end method
