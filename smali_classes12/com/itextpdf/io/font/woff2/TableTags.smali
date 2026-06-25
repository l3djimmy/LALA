.class Lcom/itextpdf/io/font/woff2/TableTags;
.super Ljava/lang/Object;
.source "TableTags.java"


# static fields
.field public static final kCffTableTag:I = 0x43464620

.field public static final kDsigTableTag:I = 0x44534947

.field public static final kGlyfTableTag:I = 0x676c7966

.field public static final kHeadTableTag:I = 0x68656164

.field public static final kHheaTableTag:I = 0x68686561

.field public static final kHmtxTableTag:I = 0x686d7478

.field public static kKnownTags:[I = null

.field public static final kLocaTableTag:I = 0x6c6f6361

.field public static final kMaxpTableTag:I = 0x6d617870


# direct methods
.method static constructor <clinit>()V
    .locals 70

    .line 35
    nop

    .line 36
    const/16 v0, 0x63

    const/16 v1, 0x6d

    const/16 v2, 0x61

    const/16 v3, 0x70

    invoke-static {v0, v1, v2, v3}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v4

    .line 37
    const/16 v5, 0x68

    const/16 v6, 0x65

    const/16 v7, 0x64

    invoke-static {v5, v6, v2, v7}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v8

    .line 38
    invoke-static {v5, v5, v6, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v9

    .line 39
    const/16 v10, 0x74

    const/16 v11, 0x78

    invoke-static {v5, v1, v10, v11}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v12

    .line 40
    move v13, v8

    invoke-static {v1, v2, v11, v3}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v8

    .line 41
    const/16 v14, 0x6e

    invoke-static {v14, v2, v1, v6}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v14

    .line 42
    const/16 v15, 0x4f

    const/16 v5, 0x53

    const/16 v7, 0x2f

    const/16 v11, 0x32

    invoke-static {v15, v5, v7, v11}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v7

    .line 43
    const/16 v11, 0x6f

    const/16 v15, 0x73

    invoke-static {v3, v11, v15, v10}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v19

    .line 44
    const/16 v5, 0x76

    const/16 v15, 0x20

    invoke-static {v0, v5, v10, v15}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v15

    .line 45
    const/16 v10, 0x66

    const/16 v5, 0x67

    invoke-static {v10, v3, v5, v1}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v5

    .line 46
    const/16 v1, 0x67

    const/16 v3, 0x6c

    const/16 v6, 0x79

    invoke-static {v1, v3, v6, v10}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v1

    .line 47
    move v6, v7

    move v7, v12

    move v12, v15

    invoke-static {v3, v11, v0, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v15

    .line 48
    const/16 v10, 0x72

    const/16 v3, 0x70

    const/16 v11, 0x65

    invoke-static {v3, v10, v11, v3}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v30

    .line 49
    const/16 v3, 0x43

    const/16 v11, 0x46

    const/16 v0, 0x20

    invoke-static {v3, v11, v11, v0}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v0

    .line 50
    const/16 v11, 0x56

    const/16 v10, 0x4f

    const/16 v2, 0x52

    const/16 v3, 0x47

    invoke-static {v11, v10, v2, v3}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v2

    .line 51
    const/16 v10, 0x45

    const/16 v11, 0x42

    const/16 v3, 0x44

    move/from16 v37, v0

    const/16 v0, 0x54

    invoke-static {v10, v11, v3, v0}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v3

    .line 52
    const/16 v0, 0x4c

    move/from16 v39, v1

    const/16 v1, 0x43

    invoke-static {v10, v11, v0, v1}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v10

    .line 53
    const/16 v1, 0x67

    move/from16 v42, v2

    const/16 v0, 0x70

    const/16 v2, 0x73

    const/16 v11, 0x61

    invoke-static {v1, v11, v2, v0}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v1

    .line 54
    move/from16 v43, v1

    const/16 v0, 0x6d

    const/16 v1, 0x78

    const/16 v2, 0x68

    const/16 v11, 0x64

    invoke-static {v2, v11, v0, v1}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v44

    .line 55
    const/16 v0, 0x6b

    const/16 v1, 0x6e

    const/16 v2, 0x72

    const/16 v11, 0x65

    invoke-static {v0, v11, v2, v1}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v0

    .line 56
    const/16 v1, 0x48

    const/16 v2, 0x53

    const/16 v11, 0x54

    move/from16 v45, v0

    const/16 v0, 0x4c

    invoke-static {v0, v11, v2, v1}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v1

    .line 57
    const/16 v2, 0x50

    move/from16 v46, v1

    const/16 v1, 0x43

    invoke-static {v2, v1, v0, v11}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v2

    .line 58
    const/16 v0, 0x56

    const/16 v1, 0x44

    const/16 v11, 0x4d

    move/from16 v47, v2

    const/16 v2, 0x58

    invoke-static {v0, v1, v11, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v0

    .line 59
    const/16 v1, 0x65

    const/16 v2, 0x68

    const/16 v11, 0x61

    move/from16 v48, v0

    const/16 v0, 0x76

    invoke-static {v0, v2, v1, v11}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v49

    .line 60
    const/16 v1, 0x6d

    const/16 v2, 0x74

    const/16 v11, 0x78

    invoke-static {v0, v1, v2, v11}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v50

    .line 61
    const/16 v0, 0x41

    const/16 v1, 0x45

    const/16 v2, 0x53

    const/16 v11, 0x42

    invoke-static {v11, v0, v2, v1}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v0

    .line 62
    const/16 v1, 0x44

    const/16 v11, 0x45

    const/16 v2, 0x46

    move/from16 v51, v0

    const/16 v0, 0x47

    invoke-static {v0, v1, v11, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v1

    .line 63
    const/16 v2, 0x50

    const/16 v11, 0x4f

    move/from16 v52, v1

    const/16 v1, 0x53

    invoke-static {v0, v2, v11, v1}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v2

    .line 64
    const/16 v11, 0x55

    move/from16 v53, v2

    const/16 v2, 0x42

    invoke-static {v0, v1, v11, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v11

    .line 65
    const/16 v0, 0x45

    move/from16 v40, v3

    const/16 v3, 0x43

    invoke-static {v0, v2, v1, v3}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v0

    .line 66
    const/16 v2, 0x4a

    const/16 v3, 0x46

    move/from16 v38, v0

    const/16 v0, 0x54

    invoke-static {v2, v1, v0, v3}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v2

    .line 67
    const/16 v1, 0x4d

    const/16 v3, 0x41

    move/from16 v55, v2

    const/16 v2, 0x48

    invoke-static {v1, v3, v0, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v1

    .line 68
    const/16 v2, 0x44

    move/from16 v35, v1

    const/16 v1, 0x42

    const/16 v3, 0x43

    invoke-static {v3, v1, v2, v0}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v0

    .line 69
    const/16 v2, 0x4c

    invoke-static {v3, v1, v2, v3}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v1

    .line 70
    move/from16 v41, v0

    const/16 v0, 0x4f

    move/from16 v54, v1

    const/16 v1, 0x52

    invoke-static {v3, v0, v2, v1}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v0

    .line 71
    const/16 v1, 0x50

    move/from16 v56, v0

    const/16 v0, 0x41

    invoke-static {v3, v1, v0, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v0

    .line 72
    const/16 v1, 0x56

    const/16 v2, 0x20

    const/16 v3, 0x53

    move/from16 v57, v0

    const/16 v0, 0x47

    invoke-static {v3, v1, v0, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v1

    .line 73
    const/16 v0, 0x62

    const/16 v2, 0x69

    move/from16 v58, v1

    const/16 v1, 0x73

    const/16 v3, 0x78

    invoke-static {v1, v0, v2, v3}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v0

    .line 74
    const/16 v1, 0x6e

    const/16 v2, 0x63

    const/16 v3, 0x61

    move/from16 v59, v0

    const/16 v0, 0x74

    invoke-static {v3, v2, v1, v0}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v1

    .line 75
    move/from16 v60, v43

    const/16 v0, 0x72

    const/16 v2, 0x76

    invoke-static {v3, v2, v3, v0}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v43

    .line 76
    const/16 v0, 0x62

    move/from16 v61, v1

    const/16 v1, 0x74

    const/16 v2, 0x64

    invoke-static {v0, v2, v3, v1}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v0

    .line 77
    const/16 v1, 0x62

    const/16 v2, 0x63

    const/16 v3, 0x6f

    move/from16 v62, v0

    const/16 v0, 0x6c

    invoke-static {v1, v0, v3, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v1

    .line 78
    const/16 v3, 0x62

    const/16 v2, 0x6e

    move/from16 v63, v1

    const/16 v1, 0x73

    invoke-static {v3, v1, v0, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v2

    .line 79
    move/from16 v23, v2

    move/from16 v25, v47

    const/16 v0, 0x63

    const/16 v1, 0x76

    const/16 v2, 0x72

    const/16 v3, 0x61

    const/16 v33, 0x70

    invoke-static {v0, v1, v3, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v47

    .line 80
    move/from16 v66, v48

    const/16 v1, 0x64

    const/16 v2, 0x73

    const/16 v3, 0x66

    invoke-static {v3, v1, v2, v0}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v48

    .line 81
    move/from16 v22, v49

    const/16 v0, 0x61

    const/16 v1, 0x65

    const/16 v2, 0x74

    invoke-static {v3, v1, v0, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v49

    .line 82
    move/from16 v67, v50

    const/16 v0, 0x78

    const/16 v1, 0x6d

    invoke-static {v3, v1, v2, v0}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v50

    .line 83
    move/from16 v65, v51

    const/16 v0, 0x61

    const/16 v1, 0x76

    const/16 v2, 0x72

    invoke-static {v3, v1, v0, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v51

    .line 84
    const/16 v3, 0x67

    invoke-static {v3, v1, v0, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v1

    .line 85
    const/16 v3, 0x79

    move/from16 v16, v1

    const/16 v0, 0x68

    const/16 v1, 0x73

    const/16 v2, 0x74

    invoke-static {v0, v1, v2, v3}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v0

    .line 86
    const/16 v3, 0x6a

    move/from16 v21, v0

    const/16 v0, 0x75

    invoke-static {v3, v0, v1, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v0

    .line 87
    move/from16 v68, v0

    move/from16 v69, v55

    const/16 v0, 0x72

    const/16 v1, 0x63

    const/16 v2, 0x6c

    const/16 v3, 0x61

    invoke-static {v2, v1, v3, v0}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v55

    .line 88
    move/from16 v24, v33

    move/from16 v33, v38

    move/from16 v38, v56

    const/16 v1, 0x6d

    const/16 v2, 0x74

    const/16 v3, 0x6f

    invoke-static {v1, v3, v0, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v56

    .line 89
    const/16 v2, 0x78

    invoke-static {v1, v3, v0, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v1

    .line 90
    const/16 v2, 0x62

    move/from16 v17, v1

    move/from16 v0, v24

    const/16 v1, 0x64

    invoke-static {v3, v0, v2, v1}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v1

    .line 91
    move/from16 v36, v41

    move/from16 v41, v59

    const/16 v2, 0x72

    const/16 v18, 0x47

    invoke-static {v0, v2, v3, v0}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v59

    .line 92
    const/16 v3, 0x6b

    move/from16 v34, v1

    const/16 v0, 0x61

    const/16 v1, 0x74

    invoke-static {v1, v2, v0, v3}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v2

    .line 93
    const/16 v3, 0x5a

    move/from16 v24, v2

    const/16 v1, 0x70

    const/16 v2, 0x66

    invoke-static {v3, v0, v1, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v1

    .line 94
    const/16 v3, 0x69

    move/from16 v20, v1

    const/16 v0, 0x53

    const/16 v1, 0x6c

    invoke-static {v0, v3, v1, v2}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v2

    .line 95
    move/from16 v27, v2

    move/from16 v2, v18

    move/from16 v31, v53

    const/16 v0, 0x74

    const/16 v3, 0x61

    const/16 v28, 0x63

    move/from16 v53, v21

    move/from16 v21, v60

    move/from16 v60, v24

    move/from16 v24, v46

    move/from16 v46, v23

    move/from16 v23, v45

    move/from16 v45, v63

    invoke-static {v2, v1, v3, v0}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v63

    .line 96
    move/from16 v0, v28

    const/16 v3, 0x6f

    invoke-static {v2, v1, v3, v0}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v0

    .line 97
    const/16 v1, 0x74

    const/16 v2, 0x65

    const/16 v3, 0x61

    move/from16 v64, v0

    const/16 v0, 0x46

    invoke-static {v0, v2, v3, v1}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v0

    .line 98
    const/16 v1, 0x69

    const/16 v2, 0x53

    const/16 v3, 0x6c

    invoke-static {v2, v1, v3, v3}, Lcom/itextpdf/io/font/woff2/TableTags;->tag(CCCC)I

    move-result v1

    move/from16 v18, v13

    move v13, v5

    move/from16 v5, v18

    move/from16 v18, v52

    move/from16 v52, v16

    move/from16 v16, v30

    move/from16 v30, v18

    move/from16 v18, v27

    move/from16 v27, v22

    move/from16 v22, v44

    move/from16 v44, v62

    move/from16 v62, v18

    move/from16 v32, v11

    move/from16 v11, v19

    move/from16 v19, v40

    move/from16 v18, v42

    move/from16 v40, v58

    move/from16 v42, v61

    move/from16 v29, v65

    move/from16 v26, v66

    move/from16 v28, v67

    move/from16 v65, v0

    move/from16 v66, v1

    move/from16 v61, v20

    move/from16 v58, v34

    move/from16 v34, v69

    move/from16 v20, v10

    move v10, v6

    move v6, v9

    move v9, v14

    move/from16 v14, v39

    move/from16 v39, v57

    move/from16 v57, v17

    move/from16 v17, v37

    move/from16 v37, v54

    move/from16 v54, v68

    filled-new-array/range {v4 .. v66}, [I

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/font/woff2/TableTags;->kKnownTags:[I

    .line 35
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static tag(CCCC)I
    .locals 2
    .param p0, "a"    # C
    .param p1, "b"    # C
    .param p2, "c"    # C
    .param p3, "d"    # C

    .line 22
    shl-int/lit8 v0, p0, 0x18

    shl-int/lit8 v1, p1, 0x10

    or-int/2addr v0, v1

    shl-int/lit8 v1, p2, 0x8

    or-int/2addr v0, v1

    or-int/2addr v0, p3

    return v0
.end method
