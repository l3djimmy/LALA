.class public Lcom/itextpdf/io/codec/CCITTG4Encoder;
.super Ljava/lang/Object;
.source "CCITTG4Encoder.java"


# static fields
.field private static final CODE:I = 0x1

.field private static final EOL:I = 0x1

.field private static final G3CODE_EOF:I = -0x3

.field private static final G3CODE_EOL:I = -0x1

.field private static final G3CODE_INCOMP:I = -0x4

.field private static final G3CODE_INVALID:I = -0x2

.field private static final LENGTH:I = 0x0

.field private static final RUNLEN:I = 0x2

.field private static oneruns:[B

.field private static zeroruns:[B


# instance fields
.field private TIFFFaxBlackCodes:[[I

.field private TIFFFaxWhiteCodes:[[I

.field private bit:I

.field private data:I

.field private dataBp:[B

.field private horizcode:[I

.field private msbmask:[I

.field private offsetData:I

.field private outBuf:Lcom/itextpdf/io/source/ByteBuffer;

.field private passcode:[I

.field private refline:[B

.field private rowbytes:I

.field private rowpixels:I

.field private sizeData:I

.field private vcodes:[[I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 286
    const/16 v0, 0x100

    new-array v1, v0, [B

    fill-array-data v1, :array_0

    sput-object v1, Lcom/itextpdf/io/codec/CCITTG4Encoder;->zeroruns:[B

    .line 305
    new-array v0, v0, [B

    fill-array-data v0, :array_1

    sput-object v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->oneruns:[B

    return-void

    nop

    :array_0
    .array-data 1
        0x8t
        0x7t
        0x6t
        0x6t
        0x5t
        0x5t
        0x5t
        0x5t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    :array_1
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x5t
        0x5t
        0x5t
        0x5t
        0x6t
        0x6t
        0x7t
        0x8t
    .end array-data
.end method

.method public constructor <init>(I)V
    .locals 126
    .param p1, "width"    # I

    .line 46
    move-object/from16 v0, p0

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/16 v1, 0x8

    iput v1, v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->bit:I

    .line 37
    new-instance v2, Lcom/itextpdf/io/source/ByteBuffer;

    const/16 v3, 0x400

    invoke-direct {v2, v3}, Lcom/itextpdf/io/source/ByteBuffer;-><init>(I)V

    iput-object v2, v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    .line 336
    const/16 v2, 0x35

    const/4 v3, 0x0

    filled-new-array {v1, v2, v3}, [I

    move-result-object v4

    const/4 v2, 0x6

    const/4 v5, 0x7

    const/4 v6, 0x1

    filled-new-array {v2, v5, v6}, [I

    move-result-object v7

    const/4 v8, 0x4

    const/4 v9, 0x2

    filled-new-array {v8, v5, v9}, [I

    move-result-object v10

    const/4 v11, 0x3

    move-object v12, v7

    filled-new-array {v8, v1, v11}, [I

    move-result-object v7

    const/16 v13, 0xb

    filled-new-array {v8, v13, v8}, [I

    move-result-object v14

    const/16 v15, 0xc

    const/4 v3, 0x5

    filled-new-array {v8, v15, v3}, [I

    move-result-object v16

    const/16 v6, 0xe

    filled-new-array {v8, v6, v2}, [I

    move-result-object v6

    const/16 v9, 0xf

    filled-new-array {v8, v9, v5}, [I

    move-result-object v9

    const/16 v8, 0x13

    move-object/from16 v20, v12

    filled-new-array {v3, v8, v1}, [I

    move-result-object v12

    const/16 v8, 0x14

    const/16 v11, 0x9

    filled-new-array {v3, v8, v11}, [I

    move-result-object v23

    const/16 v11, 0xa

    move-object/from16 v25, v14

    filled-new-array {v3, v5, v11}, [I

    move-result-object v14

    filled-new-array {v3, v1, v13}, [I

    move-result-object v26

    move-object/from16 v27, v9

    move-object/from16 v9, v16

    filled-new-array {v2, v1, v15}, [I

    move-result-object v16

    const/16 v13, 0xd

    const/4 v11, 0x3

    const/16 v30, 0x1

    filled-new-array {v2, v11, v13}, [I

    move-result-object v17

    const/16 v11, 0x34

    const/16 v13, 0xe

    filled-new-array {v2, v11, v13}, [I

    move-result-object v11

    const/16 v13, 0x35

    const/16 v3, 0xf

    filled-new-array {v2, v13, v3}, [I

    move-result-object v3

    const/16 v13, 0x2a

    const/16 v1, 0x10

    filled-new-array {v2, v13, v1}, [I

    move-result-object v1

    const/16 v13, 0x11

    const/16 v8, 0x2b

    filled-new-array {v2, v8, v13}, [I

    move-result-object v13

    const/16 v2, 0x27

    const/16 v8, 0x12

    filled-new-array {v5, v2, v8}, [I

    move-result-object v2

    move-object/from16 v35, v13

    move-object/from16 v13, v23

    const/16 v8, 0x13

    filled-new-array {v5, v15, v8}, [I

    move-result-object v23

    const/16 v8, 0x8

    const/16 v15, 0x14

    filled-new-array {v5, v8, v15}, [I

    move-result-object v37

    const/16 v8, 0x15

    const/16 v15, 0x17

    filled-new-array {v5, v15, v8}, [I

    move-result-object v8

    move-object/from16 v38, v1

    const/16 v1, 0x16

    move-object/from16 v39, v2

    const/4 v2, 0x3

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    move-object/from16 v18, v11

    move-object/from16 v11, v27

    const/4 v2, 0x4

    const/16 v40, 0x2

    filled-new-array {v5, v2, v15}, [I

    move-result-object v27

    const/16 v2, 0x28

    const/16 v15, 0x18

    filled-new-array {v5, v2, v15}, [I

    move-result-object v2

    const/16 v15, 0x19

    move-object/from16 v43, v1

    const/16 v1, 0x2b

    filled-new-array {v5, v1, v15}, [I

    move-result-object v15

    const/16 v1, 0x1a

    move-object/from16 v44, v2

    const/16 v2, 0x13

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x24

    move-object/from16 v45, v1

    const/16 v1, 0x1b

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x1c

    move-object/from16 v46, v1

    const/16 v1, 0x18

    filled-new-array {v5, v1, v2}, [I

    move-result-object v2

    const/16 v1, 0x1d

    move/from16 v5, v40

    move-object/from16 v40, v2

    move v2, v5

    const/16 v5, 0x8

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x1e

    move-object/from16 v49, v1

    const/4 v1, 0x3

    filled-new-array {v5, v1, v2}, [I

    move-result-object v2

    const/16 v1, 0x1a

    move-object/from16 v50, v2

    const/16 v2, 0x1f

    filled-new-array {v5, v1, v2}, [I

    move-result-object v1

    const/16 v2, 0x1b

    move-object/from16 v51, v1

    const/16 v1, 0x20

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x21

    move-object/from16 v52, v1

    const/16 v1, 0x12

    filled-new-array {v5, v1, v2}, [I

    move-result-object v2

    const/16 v1, 0x22

    move-object/from16 v53, v2

    const/16 v2, 0x13

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x23

    move-object/from16 v54, v1

    const/16 v1, 0x14

    filled-new-array {v5, v1, v2}, [I

    move-result-object v2

    const/16 v1, 0x15

    move-object/from16 v55, v2

    const/16 v2, 0x24

    filled-new-array {v5, v1, v2}, [I

    move-result-object v1

    const/16 v2, 0x16

    move-object/from16 v56, v1

    const/16 v1, 0x25

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x26

    move-object/from16 v57, v1

    const/16 v1, 0x17

    filled-new-array {v5, v1, v2}, [I

    move-result-object v2

    const/16 v1, 0x28

    move-object/from16 v58, v2

    const/16 v2, 0x27

    filled-new-array {v5, v1, v2}, [I

    move-result-object v1

    const/16 v2, 0x29

    move-object/from16 v59, v1

    const/16 v1, 0x28

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x2a

    move-object/from16 v60, v1

    const/16 v1, 0x29

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    move-object/from16 v61, v1

    const/16 v1, 0x2b

    filled-new-array {v5, v1, v2}, [I

    move-result-object v2

    move-object/from16 v33, v2

    const/16 v2, 0x2c

    filled-new-array {v5, v2, v1}, [I

    move-result-object v2

    const/16 v1, 0x2d

    move-object/from16 v63, v2

    const/16 v2, 0x2c

    filled-new-array {v5, v1, v2}, [I

    move-result-object v1

    const/16 v2, 0x2d

    move-object/from16 v64, v1

    const/4 v1, 0x4

    filled-new-array {v5, v1, v2}, [I

    move-result-object v2

    const/16 v1, 0x2e

    move-object/from16 v65, v2

    const/4 v2, 0x5

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x2f

    move-object/from16 v66, v1

    const/16 v1, 0xa

    filled-new-array {v5, v1, v2}, [I

    move-result-object v2

    const/16 v1, 0x30

    move-object/from16 v67, v2

    const/16 v2, 0xb

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x52

    move-object/from16 v68, v1

    const/16 v1, 0x31

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x53

    move-object/from16 v69, v1

    const/16 v1, 0x32

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x54

    move-object/from16 v70, v1

    const/16 v1, 0x33

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x55

    move-object/from16 v71, v1

    const/16 v1, 0x34

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x24

    move-object/from16 v72, v1

    const/16 v1, 0x35

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x25

    move-object/from16 v73, v1

    const/16 v1, 0x36

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x58

    move-object/from16 v74, v1

    const/16 v1, 0x37

    filled-new-array {v5, v2, v1}, [I

    move-result-object v2

    const/16 v1, 0x59

    move-object/from16 v75, v2

    const/16 v2, 0x38

    filled-new-array {v5, v1, v2}, [I

    move-result-object v1

    const/16 v2, 0x5a

    move-object/from16 v76, v1

    const/16 v1, 0x39

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x5b

    move-object/from16 v77, v1

    const/16 v1, 0x3a

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x4a

    move-object/from16 v78, v1

    const/16 v1, 0x3b

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x4b

    move-object/from16 v79, v1

    const/16 v1, 0x3c

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x32

    move-object/from16 v80, v1

    const/16 v1, 0x3d

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x33

    move-object/from16 v81, v1

    const/16 v1, 0x3e

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x34

    move-object/from16 v82, v1

    const/16 v1, 0x3f

    filled-new-array {v5, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x1b

    const/16 v5, 0x40

    move-object/from16 v83, v1

    const/4 v1, 0x5

    filled-new-array {v1, v2, v5}, [I

    move-result-object v2

    const/16 v5, 0x80

    move-object/from16 v84, v2

    const/16 v2, 0x12

    filled-new-array {v1, v2, v5}, [I

    move-result-object v5

    const/16 v1, 0xc0

    move-object/from16 v85, v3

    const/4 v2, 0x6

    const/16 v3, 0x17

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v2, 0x100

    move-object/from16 v47, v1

    const/16 v1, 0x37

    const/4 v3, 0x7

    filled-new-array {v3, v1, v2}, [I

    move-result-object v2

    const/16 v3, 0x36

    const/16 v1, 0x140

    move-object/from16 v87, v2

    const/16 v2, 0x8

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x180

    move-object/from16 v88, v1

    const/16 v1, 0x37

    filled-new-array {v2, v1, v3}, [I

    move-result-object v3

    const/16 v1, 0x64

    move-object/from16 v89, v3

    const/16 v3, 0x1c0

    filled-new-array {v2, v1, v3}, [I

    move-result-object v1

    const/16 v3, 0x65

    move-object/from16 v90, v1

    const/16 v1, 0x200

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x68

    move-object/from16 v91, v1

    const/16 v1, 0x240

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x67

    move-object/from16 v92, v1

    const/16 v1, 0x280

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v2, 0xcc

    const/16 v3, 0x2c0

    move-object/from16 v93, v1

    const/16 v1, 0x9

    filled-new-array {v1, v2, v3}, [I

    move-result-object v2

    const/16 v3, 0xcd

    move-object/from16 v94, v2

    const/16 v2, 0x300

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0xd2

    move-object/from16 v95, v2

    const/16 v2, 0x340

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0xd3

    move-object/from16 v96, v2

    const/16 v2, 0x380

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0xd4

    move-object/from16 v97, v2

    const/16 v2, 0x3c0

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0xd5

    move-object/from16 v98, v2

    const/16 v2, 0x400

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0xd6

    move-object/from16 v99, v2

    const/16 v2, 0x440

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0xd7

    move-object/from16 v100, v2

    const/16 v2, 0x480

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0xd8

    move-object/from16 v101, v2

    const/16 v2, 0x4c0

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0xd9

    move-object/from16 v102, v2

    const/16 v2, 0x500

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0xda

    move-object/from16 v103, v2

    const/16 v2, 0x540

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0xdb

    move-object/from16 v104, v2

    const/16 v2, 0x580

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x98

    move-object/from16 v105, v2

    const/16 v2, 0x5c0

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x99

    move-object/from16 v106, v2

    const/16 v2, 0x600

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x9a

    move-object/from16 v107, v2

    const/16 v2, 0x640

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x680

    move-object/from16 v42, v2

    const/4 v1, 0x6

    const/16 v2, 0x18

    filled-new-array {v1, v2, v3}, [I

    move-result-object v3

    const/16 v1, 0x9b

    const/16 v2, 0x6c0

    move-object/from16 v109, v3

    const/16 v3, 0x9

    filled-new-array {v3, v1, v2}, [I

    move-result-object v1

    const/16 v2, 0x700

    move-object/from16 v110, v1

    const/16 v1, 0xb

    const/16 v3, 0x8

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x740

    move-object/from16 v111, v2

    const/16 v2, 0xc

    filled-new-array {v1, v2, v3}, [I

    move-result-object v3

    const/16 v2, 0x780

    move-object/from16 v112, v3

    const/16 v3, 0xd

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v1, 0x7c0

    move-object/from16 v34, v2

    const/16 v2, 0x12

    const/16 v3, 0xc

    filled-new-array {v3, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x800

    move-object/from16 v115, v1

    const/16 v1, 0x13

    filled-new-array {v3, v1, v2}, [I

    move-result-object v2

    const/16 v1, 0x840

    move-object/from16 v116, v2

    const/16 v2, 0x14

    filled-new-array {v3, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x15

    move-object/from16 v117, v1

    const/16 v1, 0x880

    filled-new-array {v3, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x16

    move-object/from16 v118, v1

    const/16 v1, 0x8c0

    filled-new-array {v3, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x900

    move-object/from16 v119, v1

    const/16 v1, 0x17

    filled-new-array {v3, v1, v2}, [I

    move-result-object v2

    const/16 v1, 0x1c

    move-object/from16 v120, v2

    const/16 v2, 0x940

    filled-new-array {v3, v1, v2}, [I

    move-result-object v1

    const/16 v2, 0x1d

    move-object/from16 v121, v1

    const/16 v1, 0x980

    filled-new-array {v3, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x1e

    move-object/from16 v122, v1

    const/16 v1, 0x9c0

    filled-new-array {v3, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x1f

    move-object/from16 v123, v1

    const/16 v1, 0xa00

    filled-new-array {v3, v2, v1}, [I

    move-result-object v1

    const/4 v2, -0x1

    move-object/from16 v124, v1

    move/from16 v1, v30

    filled-new-array {v3, v1, v2}, [I

    move-result-object v2

    const/4 v3, -0x2

    move-object/from16 v125, v2

    move-object/from16 v30, v45

    move-object/from16 v45, v61

    move-object/from16 v61, v77

    move-object/from16 v77, v93

    move-object/from16 v93, v109

    const/16 v2, 0x9

    const/16 v24, 0xc

    filled-new-array {v2, v1, v3}, [I

    move-result-object v109

    move-object/from16 v62, v78

    move-object/from16 v78, v94

    move-object/from16 v94, v110

    const/16 v2, 0xa

    const/16 v29, 0x2b

    filled-new-array {v2, v1, v3}, [I

    move-result-object v110

    move/from16 v28, v24

    move-object/from16 v24, v37

    move-object/from16 v37, v53

    move-object/from16 v53, v69

    const/16 v2, 0xb

    move-object/from16 v69, v5

    move-object/from16 v5, v20

    move-object/from16 v20, v38

    move-object/from16 v38, v54

    move-object/from16 v54, v70

    move-object/from16 v70, v47

    move-object/from16 v47, v63

    move-object/from16 v63, v79

    move-object/from16 v79, v95

    move-object/from16 v95, v111

    filled-new-array {v2, v1, v3}, [I

    move-result-object v111

    move/from16 v2, v28

    move-object/from16 v48, v64

    move-object/from16 v64, v80

    move-object/from16 v80, v96

    move-object/from16 v96, v112

    const/4 v1, 0x0

    const/16 v113, 0x2

    filled-new-array {v2, v1, v3}, [I

    move-result-object v112

    move-object v2, v10

    move-object v10, v6

    move-object v6, v2

    move-object/from16 v2, v25

    move-object/from16 v25, v8

    move-object v8, v2

    move-object/from16 v29, v15

    move-object/from16 v15, v26

    move-object/from16 v21, v35

    move-object/from16 v22, v39

    move-object/from16 v32, v40

    move-object/from16 v26, v43

    move-object/from16 v28, v44

    move-object/from16 v31, v46

    move-object/from16 v35, v51

    move-object/from16 v36, v52

    move-object/from16 v39, v55

    move-object/from16 v40, v56

    move-object/from16 v41, v57

    move-object/from16 v43, v59

    move-object/from16 v44, v60

    move-object/from16 v51, v67

    move-object/from16 v52, v68

    move-object/from16 v55, v71

    move-object/from16 v56, v72

    move-object/from16 v57, v73

    move-object/from16 v59, v75

    move-object/from16 v60, v76

    move-object/from16 v67, v83

    move-object/from16 v68, v84

    move-object/from16 v19, v85

    move-object/from16 v71, v87

    move-object/from16 v72, v88

    move-object/from16 v73, v89

    move-object/from16 v75, v91

    move-object/from16 v76, v92

    move-object/from16 v83, v99

    move-object/from16 v84, v100

    move-object/from16 v85, v101

    move-object/from16 v86, v102

    move-object/from16 v87, v103

    move-object/from16 v88, v104

    move-object/from16 v89, v105

    move-object/from16 v91, v107

    move-object/from16 v99, v116

    move-object/from16 v100, v117

    move-object/from16 v101, v118

    move-object/from16 v102, v119

    move-object/from16 v103, v120

    move-object/from16 v104, v121

    move-object/from16 v105, v122

    move-object/from16 v107, v124

    move-object/from16 v108, v125

    const/16 v2, 0xa

    const/4 v3, 0x1

    move-object/from16 v46, v33

    move-object/from16 v92, v42

    move-object/from16 v33, v49

    move-object/from16 v42, v58

    move-object/from16 v49, v65

    move-object/from16 v58, v74

    move-object/from16 v65, v81

    move-object/from16 v74, v90

    move-object/from16 v81, v97

    move-object/from16 v90, v106

    move-object/from16 v106, v123

    move-object/from16 v97, v34

    move-object/from16 v34, v50

    move-object/from16 v50, v66

    move-object/from16 v66, v82

    move-object/from16 v82, v98

    move-object/from16 v98, v115

    filled-new-array/range {v4 .. v112}, [[I

    move-result-object v4

    iput-object v4, v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->TIFFFaxWhiteCodes:[[I

    .line 448
    const/16 v4, 0x37

    filled-new-array {v2, v4, v1}, [I

    move-result-object v5

    const/4 v1, 0x2

    const/4 v4, 0x3

    filled-new-array {v4, v1, v3}, [I

    move-result-object v6

    filled-new-array {v1, v4, v1}, [I

    move-result-object v7

    filled-new-array {v1, v1, v4}, [I

    move-result-object v8

    const/4 v9, 0x4

    filled-new-array {v4, v4, v9}, [I

    move-result-object v10

    move-object v12, v10

    const/4 v11, 0x5

    filled-new-array {v9, v4, v11}, [I

    move-result-object v10

    const/4 v13, 0x6

    filled-new-array {v9, v1, v13}, [I

    move-result-object v14

    move-object v15, v12

    const/4 v1, 0x7

    filled-new-array {v11, v4, v1}, [I

    move-result-object v12

    const/16 v4, 0x8

    filled-new-array {v13, v11, v4}, [I

    move-result-object v16

    move-object/from16 v17, v14

    const/16 v3, 0x9

    filled-new-array {v13, v9, v3}, [I

    move-result-object v14

    move-object v13, v15

    filled-new-array {v1, v9, v2}, [I

    move-result-object v15

    const/16 v2, 0xb

    filled-new-array {v1, v11, v2}, [I

    move-result-object v11

    move-object/from16 v18, v13

    move-object/from16 v13, v16

    const/16 v2, 0xc

    move-object/from16 v16, v11

    move-object/from16 v11, v17

    filled-new-array {v1, v1, v2}, [I

    move-result-object v17

    move-object/from16 v19, v18

    const/16 v2, 0xd

    filled-new-array {v4, v9, v2}, [I

    move-result-object v18

    const/16 v9, 0xe

    filled-new-array {v4, v1, v9}, [I

    move-result-object v9

    const/16 v1, 0xf

    const/16 v2, 0x18

    filled-new-array {v3, v2, v1}, [I

    move-result-object v20

    const/16 v1, 0x10

    const/16 v3, 0xa

    const/16 v4, 0x17

    filled-new-array {v3, v4, v1}, [I

    move-result-object v21

    const/16 v1, 0x11

    filled-new-array {v3, v2, v1}, [I

    move-result-object v22

    const/16 v1, 0x8

    const/16 v2, 0x12

    filled-new-array {v3, v1, v2}, [I

    move-result-object v23

    const/16 v1, 0x67

    const/16 v2, 0x13

    const/16 v3, 0xb

    filled-new-array {v3, v1, v2}, [I

    move-result-object v24

    const/16 v1, 0x68

    const/16 v2, 0x14

    filled-new-array {v3, v1, v2}, [I

    move-result-object v25

    const/16 v1, 0x6c

    const/16 v2, 0x15

    filled-new-array {v3, v1, v2}, [I

    move-result-object v26

    const/16 v1, 0x16

    const/16 v2, 0x37

    filled-new-array {v3, v2, v1}, [I

    move-result-object v27

    const/16 v1, 0x28

    filled-new-array {v3, v1, v4}, [I

    move-result-object v1

    const/16 v2, 0x18

    filled-new-array {v3, v4, v2}, [I

    move-result-object v30

    const/16 v4, 0x19

    filled-new-array {v3, v2, v4}, [I

    move-result-object v2

    const/16 v3, 0xca

    const/16 v4, 0x1a

    move-object/from16 v33, v1

    const/16 v1, 0xc

    filled-new-array {v1, v3, v4}, [I

    move-result-object v3

    const/16 v4, 0xcb

    move-object/from16 v35, v2

    const/16 v2, 0x1b

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0xcc

    move-object/from16 v37, v2

    const/16 v2, 0x1c

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0xcd

    move-object/from16 v38, v2

    const/16 v2, 0x1d

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0x68

    move-object/from16 v39, v2

    const/16 v2, 0x1e

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0x69

    move-object/from16 v40, v2

    const/16 v2, 0x1f

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0x6a

    move-object/from16 v42, v2

    const/16 v2, 0x20

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0x6b

    move-object/from16 v43, v2

    const/16 v2, 0x21

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0xd2

    move-object/from16 v44, v2

    const/16 v2, 0x22

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0xd3

    move-object/from16 v45, v2

    const/16 v2, 0x23

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0xd4

    move-object/from16 v46, v2

    const/16 v2, 0x24

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0xd5

    move-object/from16 v47, v2

    const/16 v2, 0x25

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0xd6

    move-object/from16 v48, v2

    const/16 v2, 0x26

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0xd7

    move-object/from16 v49, v2

    const/16 v2, 0x27

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0x6c

    move-object/from16 v50, v2

    const/16 v2, 0x28

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0x6d

    move-object/from16 v51, v2

    const/16 v2, 0x29

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0xda

    move-object/from16 v52, v2

    const/16 v2, 0x2a

    filled-new-array {v1, v4, v2}, [I

    move-result-object v2

    const/16 v4, 0xdb

    move-object/from16 v53, v2

    const/16 v2, 0x2b

    filled-new-array {v1, v4, v2}, [I

    move-result-object v4

    const/16 v2, 0x54

    move-object/from16 v54, v3

    const/16 v3, 0x2c

    filled-new-array {v1, v2, v3}, [I

    move-result-object v2

    const/16 v3, 0x55

    move-object/from16 v55, v2

    const/16 v2, 0x2d

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x56

    move-object/from16 v56, v2

    const/16 v2, 0x2e

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x57

    move-object/from16 v57, v2

    const/16 v2, 0x2f

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x64

    move-object/from16 v58, v2

    const/16 v2, 0x30

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x65

    move-object/from16 v59, v2

    const/16 v2, 0x31

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x52

    move-object/from16 v60, v2

    const/16 v2, 0x32

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x53

    move-object/from16 v61, v2

    const/16 v2, 0x33

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x24

    move-object/from16 v63, v2

    const/16 v2, 0x34

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x35

    move-object/from16 v64, v2

    const/16 v2, 0x37

    filled-new-array {v1, v2, v3}, [I

    move-result-object v3

    const/16 v2, 0x38

    move-object/from16 v65, v3

    const/16 v3, 0x36

    filled-new-array {v1, v2, v3}, [I

    move-result-object v2

    const/16 v3, 0x27

    move-object/from16 v66, v2

    const/16 v2, 0x37

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x28

    move-object/from16 v67, v2

    const/16 v2, 0x38

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x58

    move-object/from16 v68, v2

    const/16 v2, 0x39

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x59

    move-object/from16 v69, v2

    const/16 v2, 0x3a

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x3b

    move-object/from16 v70, v2

    const/16 v2, 0x2b

    filled-new-array {v1, v2, v3}, [I

    move-result-object v2

    const/16 v3, 0x2c

    move-object/from16 v62, v2

    const/16 v2, 0x3c

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x5a

    move-object/from16 v71, v2

    const/16 v2, 0x3d

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x66

    move-object/from16 v72, v2

    const/16 v2, 0x3e

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x67

    move-object/from16 v73, v2

    const/16 v2, 0x3f

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0xf

    const/16 v1, 0x40

    move-object/from16 v74, v2

    const/16 v2, 0xa

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v2, 0xc8

    const/16 v3, 0x80

    move-object/from16 v75, v1

    const/16 v1, 0xc

    filled-new-array {v1, v2, v3}, [I

    move-result-object v2

    const/16 v3, 0xc9

    move-object/from16 v76, v2

    const/16 v2, 0xc0

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x5b

    move-object/from16 v77, v2

    const/16 v2, 0x100

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x33

    move-object/from16 v78, v2

    const/16 v2, 0x140

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x34

    move-object/from16 v79, v2

    const/16 v2, 0x180

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x35

    move-object/from16 v80, v2

    const/16 v2, 0x1c0

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v1, 0x6c

    const/16 v3, 0x200

    move-object/from16 v81, v2

    const/16 v2, 0xd

    filled-new-array {v2, v1, v3}, [I

    move-result-object v1

    const/16 v3, 0x6d

    move-object/from16 v31, v1

    const/16 v1, 0x240

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x4a

    move-object/from16 v82, v1

    const/16 v1, 0x280

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x4b

    move-object/from16 v83, v1

    const/16 v1, 0x2c0

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x4c

    move-object/from16 v84, v1

    const/16 v1, 0x300

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x4d

    move-object/from16 v85, v1

    const/16 v1, 0x340

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x72

    move-object/from16 v86, v1

    const/16 v1, 0x380

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x73

    move-object/from16 v87, v1

    const/16 v1, 0x3c0

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x74

    move-object/from16 v88, v1

    const/16 v1, 0x400

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x75

    move-object/from16 v89, v1

    const/16 v1, 0x440

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x76

    move-object/from16 v90, v1

    const/16 v1, 0x480

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x77

    move-object/from16 v91, v1

    const/16 v1, 0x4c0

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x52

    move-object/from16 v92, v1

    const/16 v1, 0x500

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x53

    move-object/from16 v93, v1

    const/16 v1, 0x540

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x54

    move-object/from16 v94, v1

    const/16 v1, 0x580

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x55

    move-object/from16 v95, v1

    const/16 v1, 0x5c0

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x5a

    move-object/from16 v96, v1

    const/16 v1, 0x600

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x5b

    move-object/from16 v97, v1

    const/16 v1, 0x640

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x64

    move-object/from16 v98, v1

    const/16 v1, 0x680

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x65

    move-object/from16 v99, v1

    const/16 v1, 0x6c0

    filled-new-array {v2, v3, v1}, [I

    move-result-object v1

    const/16 v3, 0x700

    move-object/from16 v100, v1

    const/16 v1, 0xb

    const/16 v2, 0x8

    filled-new-array {v1, v2, v3}, [I

    move-result-object v3

    const/16 v2, 0x740

    move-object/from16 v101, v3

    const/16 v3, 0xc

    filled-new-array {v1, v3, v2}, [I

    move-result-object v2

    const/16 v3, 0x780

    move-object/from16 v102, v2

    const/16 v2, 0xd

    filled-new-array {v1, v2, v3}, [I

    move-result-object v2

    const/16 v1, 0x7c0

    move-object/from16 v34, v2

    const/16 v2, 0x12

    const/16 v3, 0xc

    filled-new-array {v3, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x800

    move-object/from16 v36, v1

    const/16 v1, 0x13

    filled-new-array {v3, v1, v2}, [I

    move-result-object v1

    const/16 v2, 0x840

    move-object/from16 v103, v1

    const/16 v1, 0x14

    filled-new-array {v3, v1, v2}, [I

    move-result-object v1

    const/16 v2, 0x15

    move-object/from16 v32, v1

    const/16 v1, 0x880

    filled-new-array {v3, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x16

    move-object/from16 v104, v1

    const/16 v1, 0x8c0

    filled-new-array {v3, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x900

    move-object/from16 v105, v1

    const/16 v1, 0x17

    filled-new-array {v3, v1, v2}, [I

    move-result-object v1

    const/16 v2, 0x1c

    move-object/from16 v41, v1

    const/16 v1, 0x940

    filled-new-array {v3, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x1d

    move-object/from16 v106, v1

    const/16 v1, 0x980

    filled-new-array {v3, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x1e

    move-object/from16 v107, v1

    const/16 v1, 0x9c0

    filled-new-array {v3, v2, v1}, [I

    move-result-object v1

    const/16 v2, 0x1f

    move-object/from16 v108, v1

    const/16 v1, 0xa00

    filled-new-array {v3, v2, v1}, [I

    move-result-object v1

    const/4 v2, -0x1

    move-object/from16 v109, v1

    const/4 v1, 0x1

    filled-new-array {v3, v1, v2}, [I

    move-result-object v2

    move-object/from16 v110, v2

    const/4 v2, -0x2

    const/16 v3, 0x9

    filled-new-array {v3, v1, v2}, [I

    move-result-object v111

    const/16 v3, 0xa

    filled-new-array {v3, v1, v2}, [I

    move-result-object v3

    move-object/from16 v29, v3

    const/16 v3, 0xb

    filled-new-array {v3, v1, v2}, [I

    move-result-object v112

    const/16 v1, 0xc

    const/4 v3, 0x0

    filled-new-array {v1, v3, v2}, [I

    move-result-object v113

    move-object/from16 v28, v19

    move-object/from16 v19, v9

    move-object/from16 v9, v28

    move-object/from16 v28, v111

    move-object/from16 v111, v29

    move-object/from16 v29, v30

    move-object/from16 v30, v35

    move-object/from16 v35, v40

    move-object/from16 v40, v46

    move-object/from16 v46, v52

    move-object/from16 v52, v58

    move-object/from16 v58, v65

    move-object/from16 v65, v71

    move-object/from16 v71, v77

    move-object/from16 v77, v82

    move-object/from16 v82, v87

    move-object/from16 v87, v92

    move-object/from16 v92, v97

    move-object/from16 v97, v102

    move-object/from16 v102, v104

    move-object/from16 v104, v41

    move-object/from16 v41, v47

    move-object/from16 v47, v53

    move-object/from16 v53, v59

    move-object/from16 v59, v66

    move-object/from16 v66, v72

    move-object/from16 v72, v78

    move-object/from16 v78, v83

    move-object/from16 v83, v88

    move-object/from16 v88, v93

    move-object/from16 v93, v98

    move-object/from16 v98, v34

    move-object/from16 v34, v39

    move-object/from16 v39, v45

    move-object/from16 v45, v51

    move-object/from16 v51, v57

    move-object/from16 v57, v64

    move-object/from16 v64, v62

    move-object/from16 v62, v69

    move-object/from16 v69, v75

    move-object/from16 v75, v81

    move-object/from16 v81, v86

    move-object/from16 v86, v91

    move-object/from16 v91, v96

    move-object/from16 v96, v101

    move-object/from16 v101, v32

    move-object/from16 v32, v37

    move-object/from16 v37, v43

    move-object/from16 v43, v49

    move-object/from16 v49, v55

    move-object/from16 v55, v61

    move-object/from16 v61, v68

    move-object/from16 v68, v74

    move-object/from16 v74, v80

    move-object/from16 v80, v85

    move-object/from16 v85, v90

    move-object/from16 v90, v95

    move-object/from16 v95, v100

    move-object/from16 v100, v103

    move-object/from16 v103, v105

    move-object/from16 v105, v106

    move-object/from16 v106, v107

    move-object/from16 v107, v108

    move-object/from16 v108, v109

    move-object/from16 v109, v110

    move-object/from16 v110, v28

    move-object/from16 v28, v33

    move-object/from16 v33, v38

    move-object/from16 v38, v44

    move-object/from16 v44, v50

    move-object/from16 v50, v56

    move-object/from16 v56, v63

    move-object/from16 v63, v70

    move-object/from16 v70, v76

    move-object/from16 v76, v31

    move-object/from16 v31, v54

    move-object/from16 v54, v60

    move-object/from16 v60, v67

    move-object/from16 v67, v73

    move-object/from16 v73, v79

    move-object/from16 v79, v84

    move-object/from16 v84, v89

    move-object/from16 v89, v94

    move-object/from16 v94, v99

    move-object/from16 v99, v36

    move-object/from16 v36, v42

    move-object/from16 v42, v48

    move-object/from16 v48, v4

    filled-new-array/range {v5 .. v113}, [[I

    move-result-object v1

    iput-object v1, v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->TIFFFaxBlackCodes:[[I

    .line 560
    const/4 v1, 0x1

    const/4 v2, 0x3

    filled-new-array {v2, v1, v3}, [I

    move-result-object v4

    iput-object v4, v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->horizcode:[I

    .line 562
    const/4 v9, 0x4

    filled-new-array {v9, v1, v3}, [I

    move-result-object v4

    iput-object v4, v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->passcode:[I

    .line 564
    const/4 v4, 0x7

    filled-new-array {v4, v2, v3}, [I

    move-result-object v5

    const/4 v13, 0x6

    filled-new-array {v13, v2, v3}, [I

    move-result-object v6

    filled-new-array {v2, v2, v3}, [I

    move-result-object v7

    filled-new-array {v1, v1, v3}, [I

    move-result-object v8

    const/4 v1, 0x2

    filled-new-array {v2, v1, v3}, [I

    move-result-object v9

    filled-new-array {v13, v1, v3}, [I

    move-result-object v10

    filled-new-array {v4, v1, v3}, [I

    move-result-object v11

    filled-new-array/range {v5 .. v11}, [[I

    move-result-object v1

    iput-object v1, v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->vcodes:[[I

    .line 573
    const/16 v3, 0x9

    new-array v1, v3, [I

    fill-array-data v1, :array_0

    iput-object v1, v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->msbmask:[I

    .line 47
    move/from16 v1, p1

    iput v1, v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowpixels:I

    .line 48
    iget v2, v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowpixels:I

    add-int/2addr v2, v4

    const/16 v114, 0x8

    div-int/lit8 v2, v2, 0x8

    iput v2, v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowbytes:I

    .line 49
    iget v2, v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowbytes:I

    new-array v2, v2, [B

    iput-object v2, v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->refline:[B

    .line 50
    return-void

    :array_0
    .array-data 4
        0x0
        0x1
        0x3
        0x7
        0xf
        0x1f
        0x3f
        0x7f
        0xff
    .end array-data
.end method

.method private Fax3Encode2DRow()V
    .locals 11

    .line 137
    const/4 v0, 0x0

    .line 138
    .local v0, "a0":I
    iget-object v1, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->dataBp:[B

    iget v2, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->offsetData:I

    const/4 v3, 0x0

    invoke-direct {p0, v1, v2, v3}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->pixel([BII)I

    move-result v1

    if-eqz v1, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->dataBp:[B

    iget v2, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->offsetData:I

    iget v4, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowpixels:I

    invoke-static {v1, v2, v3, v4, v3}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->finddiff([BIIII)I

    move-result v1

    .line 139
    .local v1, "a1":I
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->refline:[B

    invoke-direct {p0, v2, v3, v3}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->pixel([BII)I

    move-result v2

    if-eqz v2, :cond_1

    move v2, v3

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->refline:[B

    iget v4, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowpixels:I

    invoke-static {v2, v3, v3, v4, v3}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->finddiff([BIIII)I

    move-result v2

    .line 143
    .local v2, "b1":I
    :goto_1
    iget-object v4, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->refline:[B

    iget v5, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowpixels:I

    iget-object v6, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->refline:[B

    invoke-direct {p0, v6, v3, v2}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->pixel([BII)I

    move-result v6

    invoke-static {v4, v3, v2, v5, v6}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->finddiff2([BIIII)I

    move-result v4

    .line 144
    .local v4, "b2":I
    if-lt v4, v1, :cond_6

    .line 145
    sub-int v5, v2, v1

    .line 146
    .local v5, "d":I
    const/4 v6, -0x3

    if-gt v6, v5, :cond_3

    const/4 v6, 0x3

    if-le v5, v6, :cond_2

    goto :goto_2

    .line 158
    :cond_2
    iget-object v6, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->vcodes:[[I

    add-int/lit8 v7, v5, 0x3

    aget-object v6, v6, v7

    invoke-direct {p0, v6}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->putcode([I)V

    .line 159
    move v0, v1

    goto :goto_5

    .line 147
    :cond_3
    :goto_2
    iget-object v6, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->dataBp:[B

    iget v7, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->offsetData:I

    iget v8, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowpixels:I

    iget-object v9, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->dataBp:[B

    iget v10, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->offsetData:I

    invoke-direct {p0, v9, v10, v1}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->pixel([BII)I

    move-result v9

    invoke-static {v6, v7, v1, v8, v9}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->finddiff2([BIIII)I

    move-result v6

    .line 148
    .local v6, "a2":I
    iget-object v7, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->horizcode:[I

    invoke-direct {p0, v7}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->putcode([I)V

    .line 149
    add-int v7, v0, v1

    if-eqz v7, :cond_5

    iget-object v7, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->dataBp:[B

    iget v8, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->offsetData:I

    invoke-direct {p0, v7, v8, v0}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->pixel([BII)I

    move-result v7

    if-nez v7, :cond_4

    goto :goto_3

    .line 153
    :cond_4
    sub-int v7, v1, v0

    iget-object v8, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->TIFFFaxBlackCodes:[[I

    invoke-direct {p0, v7, v8}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->putspan(I[[I)V

    .line 154
    sub-int v7, v6, v1

    iget-object v8, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->TIFFFaxWhiteCodes:[[I

    invoke-direct {p0, v7, v8}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->putspan(I[[I)V

    goto :goto_4

    .line 150
    :cond_5
    :goto_3
    sub-int v7, v1, v0

    iget-object v8, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->TIFFFaxWhiteCodes:[[I

    invoke-direct {p0, v7, v8}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->putspan(I[[I)V

    .line 151
    sub-int v7, v6, v1

    iget-object v8, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->TIFFFaxBlackCodes:[[I

    invoke-direct {p0, v7, v8}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->putspan(I[[I)V

    .line 156
    :goto_4
    move v0, v6

    .line 161
    .end local v5    # "d":I
    .end local v6    # "a2":I
    :goto_5
    goto :goto_6

    .line 162
    :cond_6
    iget-object v5, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->passcode:[I

    invoke-direct {p0, v5}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->putcode([I)V

    .line 163
    move v0, v4

    .line 165
    :goto_6
    iget v5, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowpixels:I

    if-lt v0, v5, :cond_7

    .line 166
    nop

    .line 171
    return-void

    .line 167
    :cond_7
    iget-object v5, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->dataBp:[B

    iget v6, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->offsetData:I

    iget v7, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowpixels:I

    iget-object v8, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->dataBp:[B

    iget v9, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->offsetData:I

    invoke-direct {p0, v8, v9, v0}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->pixel([BII)I

    move-result v8

    invoke-static {v5, v6, v0, v7, v8}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->finddiff([BIIII)I

    move-result v1

    .line 168
    iget-object v5, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->refline:[B

    iget v6, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowpixels:I

    iget-object v7, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->dataBp:[B

    iget v8, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->offsetData:I

    invoke-direct {p0, v7, v8, v0}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->pixel([BII)I

    move-result v7

    xor-int/lit8 v7, v7, 0x1

    invoke-static {v5, v3, v0, v6, v7}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->finddiff([BIIII)I

    move-result v2

    .line 169
    iget-object v5, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->refline:[B

    iget v6, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowpixels:I

    iget-object v7, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->dataBp:[B

    iget v8, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->offsetData:I

    invoke-direct {p0, v7, v8, v0}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->pixel([BII)I

    move-result v7

    invoke-static {v5, v3, v2, v6, v7}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->finddiff([BIIII)I

    move-result v2

    goto/16 :goto_1
.end method

.method private Fax4PostEncode()V
    .locals 3

    .line 174
    const/4 v0, 0x1

    const/16 v1, 0xc

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->putBits(II)V

    .line 175
    invoke-direct {p0, v0, v1}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->putBits(II)V

    .line 176
    iget v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->bit:I

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    .line 177
    iget-object v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    iget v2, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->data:I

    int-to-byte v2, v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/io/source/ByteBuffer;->append(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 178
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->data:I

    .line 179
    iput v1, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->bit:I

    .line 181
    :cond_0
    return-void
.end method

.method public static compress([BII)[B
    .locals 3
    .param p0, "data"    # [B
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 79
    new-instance v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;

    invoke-direct {v0, p1}, Lcom/itextpdf/io/codec/CCITTG4Encoder;-><init>(I)V

    .line 80
    .local v0, "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    iget v1, v0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowbytes:I

    mul-int/2addr v1, p2

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v2, v1}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->fax4Encode([BII)V

    .line 81
    invoke-virtual {v0}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->close()[B

    move-result-object v1

    return-object v1
.end method

.method private static find0span([BIII)I
    .locals 6
    .param p0, "bp"    # [B
    .param p1, "offset"    # I
    .param p2, "bs"    # I
    .param p3, "be"    # I

    .line 239
    sub-int v0, p3, p2

    .line 242
    .local v0, "bits":I
    shr-int/lit8 v1, p2, 0x3

    add-int/2addr v1, p1

    .line 246
    .local v1, "pos":I
    const/16 v2, 0x8

    if-lez v0, :cond_3

    and-int/lit8 v3, p2, 0x7

    move v4, v3

    .local v4, "n":I
    if-eqz v3, :cond_3

    .line 247
    sget-object v3, Lcom/itextpdf/io/codec/CCITTG4Encoder;->zeroruns:[B

    aget-byte v5, p0, v1

    shl-int/2addr v5, v4

    and-int/lit16 v5, v5, 0xff

    aget-byte v3, v3, v5

    .line 248
    .local v3, "span":I
    rsub-int/lit8 v5, v4, 0x8

    if-le v3, v5, :cond_0

    .line 249
    rsub-int/lit8 v3, v4, 0x8

    .line 250
    :cond_0
    if-le v3, v0, :cond_1

    .line 251
    move v3, v0

    .line 252
    :cond_1
    add-int v5, v4, v3

    if-ge v5, v2, :cond_2

    .line 253
    return v3

    .line 254
    :cond_2
    sub-int/2addr v0, v3

    .line 255
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 257
    .end local v3    # "span":I
    .end local v4    # "n":I
    :cond_3
    const/4 v3, 0x0

    .line 261
    .restart local v3    # "span":I
    :goto_0
    if-lt v0, v2, :cond_5

    .line 262
    aget-byte v4, p0, v1

    if-eqz v4, :cond_4

    .line 263
    sget-object v2, Lcom/itextpdf/io/codec/CCITTG4Encoder;->zeroruns:[B

    aget-byte v4, p0, v1

    and-int/lit16 v4, v4, 0xff

    aget-byte v2, v2, v4

    add-int/2addr v2, v3

    return v2

    .line 264
    :cond_4
    add-int/lit8 v3, v3, 0x8

    .line 265
    add-int/lit8 v0, v0, -0x8

    .line 266
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 271
    :cond_5
    if-lez v0, :cond_7

    .line 272
    sget-object v2, Lcom/itextpdf/io/codec/CCITTG4Encoder;->zeroruns:[B

    aget-byte v4, p0, v1

    and-int/lit16 v4, v4, 0xff

    aget-byte v2, v2, v4

    .line 273
    .local v2, "n":I
    if-le v2, v0, :cond_6

    move v4, v0

    goto :goto_1

    :cond_6
    move v4, v2

    :goto_1
    add-int/2addr v3, v4

    .line 275
    .end local v2    # "n":I
    :cond_7
    return v3
.end method

.method private static find1span([BIII)I
    .locals 6
    .param p0, "bp"    # [B
    .param p1, "offset"    # I
    .param p2, "bs"    # I
    .param p3, "be"    # I

    .line 199
    sub-int v0, p3, p2

    .line 202
    .local v0, "bits":I
    shr-int/lit8 v1, p2, 0x3

    add-int/2addr v1, p1

    .line 206
    .local v1, "pos":I
    const/16 v2, 0x8

    if-lez v0, :cond_3

    and-int/lit8 v3, p2, 0x7

    move v4, v3

    .local v4, "n":I
    if-eqz v3, :cond_3

    .line 207
    sget-object v3, Lcom/itextpdf/io/codec/CCITTG4Encoder;->oneruns:[B

    aget-byte v5, p0, v1

    shl-int/2addr v5, v4

    and-int/lit16 v5, v5, 0xff

    aget-byte v3, v3, v5

    .line 208
    .local v3, "span":I
    rsub-int/lit8 v5, v4, 0x8

    if-le v3, v5, :cond_0

    .line 209
    rsub-int/lit8 v3, v4, 0x8

    .line 210
    :cond_0
    if-le v3, v0, :cond_1

    .line 211
    move v3, v0

    .line 212
    :cond_1
    add-int v5, v4, v3

    if-ge v5, v2, :cond_2

    .line 213
    return v3

    .line 214
    :cond_2
    sub-int/2addr v0, v3

    .line 215
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 217
    .end local v3    # "span":I
    .end local v4    # "n":I
    :cond_3
    const/4 v3, 0x0

    .line 221
    .restart local v3    # "span":I
    :goto_0
    if-lt v0, v2, :cond_5

    .line 222
    aget-byte v4, p0, v1

    const/4 v5, -0x1

    if-eq v4, v5, :cond_4

    .line 223
    sget-object v2, Lcom/itextpdf/io/codec/CCITTG4Encoder;->oneruns:[B

    aget-byte v4, p0, v1

    and-int/lit16 v4, v4, 0xff

    aget-byte v2, v2, v4

    add-int/2addr v2, v3

    return v2

    .line 224
    :cond_4
    add-int/lit8 v3, v3, 0x8

    .line 225
    add-int/lit8 v0, v0, -0x8

    .line 226
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 231
    :cond_5
    if-lez v0, :cond_7

    .line 232
    sget-object v2, Lcom/itextpdf/io/codec/CCITTG4Encoder;->oneruns:[B

    aget-byte v4, p0, v1

    and-int/lit16 v4, v4, 0xff

    aget-byte v2, v2, v4

    .line 233
    .local v2, "n":I
    if-le v2, v0, :cond_6

    move v4, v0

    goto :goto_1

    :cond_6
    move v4, v2

    :goto_1
    add-int/2addr v3, v4

    .line 235
    .end local v2    # "n":I
    :cond_7
    return v3
.end method

.method private static finddiff([BIIII)I
    .locals 1
    .param p0, "bp"    # [B
    .param p1, "offset"    # I
    .param p2, "bs"    # I
    .param p3, "be"    # I
    .param p4, "color"    # I

    .line 279
    if-eqz p4, :cond_0

    invoke-static {p0, p1, p2, p3}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->find1span([BIII)I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->find0span([BIII)I

    move-result v0

    :goto_0
    add-int/2addr v0, p2

    return v0
.end method

.method private static finddiff2([BIIII)I
    .locals 1
    .param p0, "bp"    # [B
    .param p1, "offset"    # I
    .param p2, "bs"    # I
    .param p3, "be"    # I
    .param p4, "color"    # I

    .line 283
    if-ge p2, p3, :cond_0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->finddiff([BIIII)I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, p3

    :goto_0
    return v0
.end method

.method private pixel([BII)I
    .locals 2
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "bit"    # I

    .line 193
    iget v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowpixels:I

    if-lt p3, v0, :cond_0

    .line 194
    const/4 v0, 0x0

    return v0

    .line 195
    :cond_0
    shr-int/lit8 v0, p3, 0x3

    add-int/2addr v0, p2

    aget-byte v0, p1, v0

    and-int/lit16 v0, v0, 0xff

    and-int/lit8 v1, p3, 0x7

    rsub-int/lit8 v1, v1, 0x7

    shr-int/2addr v0, v1

    and-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private putBits(II)V
    .locals 5
    .param p1, "bits"    # I
    .param p2, "length"    # I

    .line 120
    nop

    :goto_0
    iget v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->bit:I

    .line 127
    iget v1, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->data:I

    .line 120
    const/16 v2, 0x8

    const/4 v3, 0x0

    if-le p2, v0, :cond_0

    .line 121
    iget v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->bit:I

    sub-int v0, p2, v0

    shr-int v0, p1, v0

    or-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->data:I

    .line 122
    iget v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->bit:I

    sub-int/2addr p2, v0

    .line 123
    iget-object v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    iget v1, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->data:I

    int-to-byte v1, v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/source/ByteBuffer;->append(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 124
    iput v3, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->data:I

    .line 125
    iput v2, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->bit:I

    goto :goto_0

    .line 127
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->msbmask:[I

    aget v0, v0, p2

    and-int/2addr v0, p1

    iget v4, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->bit:I

    sub-int/2addr v4, p2

    shl-int/2addr v0, v4

    or-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->data:I

    .line 128
    iget v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->bit:I

    sub-int/2addr v0, p2

    iput v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->bit:I

    .line 129
    iget v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->bit:I

    if-nez v0, :cond_1

    .line 130
    iget-object v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    iget v1, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->data:I

    int-to-byte v1, v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/source/ByteBuffer;->append(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 131
    iput v3, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->data:I

    .line 132
    iput v2, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->bit:I

    .line 134
    :cond_1
    return-void
.end method

.method private putcode([I)V
    .locals 2
    .param p1, "table"    # [I

    .line 94
    const/4 v0, 0x1

    aget v0, p1, v0

    const/4 v1, 0x0

    aget v1, p1, v1

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->putBits(II)V

    .line 95
    return-void
.end method

.method private putspan(I[[I)V
    .locals 6
    .param p1, "span"    # I
    .param p2, "tab"    # [[I

    .line 100
    nop

    :goto_0
    const/16 v0, 0xa40

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lt p1, v0, :cond_0

    .line 101
    const/16 v0, 0x67

    aget-object v0, p2, v0

    .line 102
    .local v0, "te":[I
    aget v3, v0, v3

    .line 103
    .local v3, "code":I
    aget v2, v0, v2

    .line 104
    .local v2, "length":I
    invoke-direct {p0, v3, v2}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->putBits(II)V

    .line 105
    aget v1, v0, v1

    sub-int/2addr p1, v1

    .line 106
    .end local v0    # "te":[I
    goto :goto_0

    .line 107
    .end local v2    # "length":I
    .end local v3    # "code":I
    :cond_0
    const/16 v0, 0x40

    if-lt p1, v0, :cond_1

    .line 108
    shr-int/lit8 v0, p1, 0x6

    add-int/lit8 v0, v0, 0x3f

    aget-object v0, p2, v0

    .line 109
    .restart local v0    # "te":[I
    aget v4, v0, v3

    .line 110
    .local v4, "code":I
    aget v5, v0, v2

    .line 111
    .local v5, "length":I
    invoke-direct {p0, v4, v5}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->putBits(II)V

    .line 112
    aget v1, v0, v1

    sub-int/2addr p1, v1

    .line 114
    .end local v0    # "te":[I
    .end local v4    # "code":I
    .end local v5    # "length":I
    :cond_1
    aget-object v0, p2, p1

    aget v0, v0, v3

    .line 115
    .local v0, "code":I
    aget-object v1, p2, p1

    aget v1, v1, v2

    .line 116
    .local v1, "length":I
    invoke-direct {p0, v0, v1}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->putBits(II)V

    .line 117
    return-void
.end method


# virtual methods
.method public close()[B
    .locals 1

    .line 188
    invoke-direct {p0}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->Fax4PostEncode()V

    .line 189
    iget-object v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method public fax4Encode([BI)V
    .locals 2
    .param p1, "data"    # [B
    .param p2, "height"    # I

    .line 90
    iget v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowbytes:I

    mul-int/2addr v0, p2

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->fax4Encode([BII)V

    .line 91
    return-void
.end method

.method public fax4Encode([BII)V
    .locals 5
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "size"    # I

    .line 59
    iput-object p1, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->dataBp:[B

    .line 60
    iput p2, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->offsetData:I

    .line 61
    iput p3, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->sizeData:I

    .line 62
    :goto_0
    iget v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->sizeData:I

    if-lez v0, :cond_0

    .line 63
    invoke-direct {p0}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->Fax3Encode2DRow()V

    .line 64
    iget-object v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->dataBp:[B

    iget v1, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->offsetData:I

    iget-object v2, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->refline:[B

    const/4 v3, 0x0

    iget v4, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowbytes:I

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 65
    iget v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->offsetData:I

    iget v1, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowbytes:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->offsetData:I

    .line 66
    iget v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->sizeData:I

    iget v1, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->rowbytes:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/io/codec/CCITTG4Encoder;->sizeData:I

    goto :goto_0

    .line 68
    :cond_0
    return-void
.end method
