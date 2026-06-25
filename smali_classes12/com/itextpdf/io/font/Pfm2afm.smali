.class public final Lcom/itextpdf/io/font/Pfm2afm;
.super Ljava/lang/Object;
.source "Pfm2afm.java"


# instance fields
.field private Win2PSStd:[I

.field private WinChars:[Ljava/lang/String;

.field private ascender:S

.field private ascent:S

.field private avgwidth:S

.field private bitoff:I

.field private bits:I

.field private brkchar:B

.field private capheight:S

.field private charset:B

.field private chartab:I

.field private copyright:Ljava/lang/String;

.field private defchar:B

.field private descender:S

.field private device:I

.field private extleading:S

.field private extlen:S

.field private face:I

.field private firstchar:I

.field private fontname:I

.field private h_len:I

.field private horres:S

.field private input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

.field private intleading:S

.field private isMono:Z

.field private italic:B

.field private kernpairs:I

.field private kind:B

.field private lastchar:I

.field private maxwidth:S

.field private output:Ljava/io/PrintWriter;

.field private overs:B

.field private pixheight:S

.field private pixwidth:S

.field private points:S

.field private psext:I

.field private res1:I

.field private res2:I

.field private type:S

.field private uline:B

.field private verres:S

.field private vers:S

.field private weight:S

.field private widthby:S

.field private xheight:S


# direct methods
.method private constructor <init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Ljava/io/OutputStream;)V
    .locals 3
    .param p1, "input"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p2, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 476
    const/16 v0, 0x100

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->Win2PSStd:[I

    .line 523
    const/16 v0, 0x100

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "W00"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    const-string v2, "W01"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "W02"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "W03"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "macron"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "breve"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "dotaccent"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "W07"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "ring"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "W09"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "W0a"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "W0b"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "W0c"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "W0d"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "W0e"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "W0f"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "hungarumlaut"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string/jumbo v2, "ogonek"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "caron"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "W13"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "W14"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "W15"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "W16"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "W17"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "W18"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "W19"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "W1a"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "W1b"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "W1c"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "W1d"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string v2, "W1e"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string v2, "W1f"

    aput-object v2, v0, v1

    const-string/jumbo v1, "space"

    const/16 v2, 0x20

    aput-object v1, v0, v2

    const-string v1, "exclam"

    const/16 v2, 0x21

    aput-object v1, v0, v2

    const-string/jumbo v1, "quotedbl"

    const/16 v2, 0x22

    aput-object v1, v0, v2

    const-string/jumbo v1, "numbersign"

    const/16 v2, 0x23

    aput-object v1, v0, v2

    const-string v1, "dollar"

    const/16 v2, 0x24

    aput-object v1, v0, v2

    const-string/jumbo v1, "percent"

    const/16 v2, 0x25

    aput-object v1, v0, v2

    const-string v1, "ampersand"

    const/16 v2, 0x26

    aput-object v1, v0, v2

    const/16 v1, 0x27

    const-string/jumbo v2, "quotesingle"

    aput-object v2, v0, v1

    const-string/jumbo v1, "parenleft"

    const/16 v2, 0x28

    aput-object v1, v0, v2

    const-string/jumbo v1, "parenright"

    const/16 v2, 0x29

    aput-object v1, v0, v2

    const-string v1, "asterisk"

    const/16 v2, 0x2a

    aput-object v1, v0, v2

    const-string/jumbo v1, "plus"

    const/16 v2, 0x2b

    aput-object v1, v0, v2

    const-string v1, "comma"

    const/16 v2, 0x2c

    aput-object v1, v0, v2

    const-string v1, "hyphen"

    const/16 v2, 0x2d

    aput-object v1, v0, v2

    const/16 v1, 0x2e

    const-string/jumbo v2, "period"

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    const-string/jumbo v2, "slash"

    aput-object v2, v0, v1

    const/16 v1, 0x30

    const-string/jumbo v2, "zero"

    aput-object v2, v0, v1

    const/16 v1, 0x31

    const-string/jumbo v2, "one"

    aput-object v2, v0, v1

    const/16 v1, 0x32

    const-string/jumbo v2, "two"

    aput-object v2, v0, v1

    const/16 v1, 0x33

    const-string/jumbo v2, "three"

    aput-object v2, v0, v1

    const/16 v1, 0x34

    const-string v2, "four"

    aput-object v2, v0, v1

    const/16 v1, 0x35

    const-string v2, "five"

    aput-object v2, v0, v1

    const/16 v1, 0x36

    const-string/jumbo v2, "six"

    aput-object v2, v0, v1

    const/16 v1, 0x37

    const-string/jumbo v2, "seven"

    aput-object v2, v0, v1

    const/16 v1, 0x38

    const-string v2, "eight"

    aput-object v2, v0, v1

    const/16 v1, 0x39

    const-string/jumbo v2, "nine"

    aput-object v2, v0, v1

    const/16 v1, 0x3a

    const-string v2, "colon"

    aput-object v2, v0, v1

    const/16 v1, 0x3b

    const-string/jumbo v2, "semicolon"

    aput-object v2, v0, v1

    const/16 v1, 0x3c

    const-string v2, "less"

    aput-object v2, v0, v1

    const/16 v1, 0x3d

    const-string v2, "equal"

    aput-object v2, v0, v1

    const/16 v1, 0x3e

    const-string v2, "greater"

    aput-object v2, v0, v1

    const/16 v1, 0x3f

    const-string/jumbo v2, "question"

    aput-object v2, v0, v1

    const/16 v1, 0x40

    const-string v2, "at"

    aput-object v2, v0, v1

    const/16 v1, 0x41

    const-string v2, "A"

    aput-object v2, v0, v1

    const/16 v1, 0x42

    const-string v2, "B"

    aput-object v2, v0, v1

    const/16 v1, 0x43

    const-string v2, "C"

    aput-object v2, v0, v1

    const/16 v1, 0x44

    const-string v2, "D"

    aput-object v2, v0, v1

    const/16 v1, 0x45

    const-string v2, "E"

    aput-object v2, v0, v1

    const/16 v1, 0x46

    const-string v2, "F"

    aput-object v2, v0, v1

    const/16 v1, 0x47

    const-string v2, "G"

    aput-object v2, v0, v1

    const/16 v1, 0x48

    const-string v2, "H"

    aput-object v2, v0, v1

    const/16 v1, 0x49

    const-string v2, "I"

    aput-object v2, v0, v1

    const/16 v1, 0x4a

    const-string v2, "J"

    aput-object v2, v0, v1

    const/16 v1, 0x4b

    const-string v2, "K"

    aput-object v2, v0, v1

    const/16 v1, 0x4c

    const-string v2, "L"

    aput-object v2, v0, v1

    const/16 v1, 0x4d

    const-string v2, "M"

    aput-object v2, v0, v1

    const/16 v1, 0x4e

    const-string v2, "N"

    aput-object v2, v0, v1

    const/16 v1, 0x4f

    const-string v2, "O"

    aput-object v2, v0, v1

    const/16 v1, 0x50

    const-string v2, "P"

    aput-object v2, v0, v1

    const/16 v1, 0x51

    const-string v2, "Q"

    aput-object v2, v0, v1

    const/16 v1, 0x52

    const-string v2, "R"

    aput-object v2, v0, v1

    const/16 v1, 0x53

    const-string v2, "S"

    aput-object v2, v0, v1

    const/16 v1, 0x54

    const-string v2, "T"

    aput-object v2, v0, v1

    const/16 v1, 0x55

    const-string v2, "U"

    aput-object v2, v0, v1

    const/16 v1, 0x56

    const-string v2, "V"

    aput-object v2, v0, v1

    const/16 v1, 0x57

    const-string v2, "W"

    aput-object v2, v0, v1

    const/16 v1, 0x58

    const-string v2, "X"

    aput-object v2, v0, v1

    const/16 v1, 0x59

    const-string v2, "Y"

    aput-object v2, v0, v1

    const/16 v1, 0x5a

    const-string v2, "Z"

    aput-object v2, v0, v1

    const/16 v1, 0x5b

    const-string v2, "bracketleft"

    aput-object v2, v0, v1

    const/16 v1, 0x5c

    const-string v2, "backslash"

    aput-object v2, v0, v1

    const/16 v1, 0x5d

    const-string v2, "bracketright"

    aput-object v2, v0, v1

    const/16 v1, 0x5e

    const-string v2, "asciicircum"

    aput-object v2, v0, v1

    const/16 v1, 0x5f

    const-string/jumbo v2, "underscore"

    aput-object v2, v0, v1

    const/16 v1, 0x60

    const-string v2, "grave"

    aput-object v2, v0, v1

    const/16 v1, 0x61

    const-string v2, "a"

    aput-object v2, v0, v1

    const/16 v1, 0x62

    const-string v2, "b"

    aput-object v2, v0, v1

    const/16 v1, 0x63

    const-string v2, "c"

    aput-object v2, v0, v1

    const/16 v1, 0x64

    const-string v2, "d"

    aput-object v2, v0, v1

    const/16 v1, 0x65

    const-string v2, "e"

    aput-object v2, v0, v1

    const/16 v1, 0x66

    const-string v2, "f"

    aput-object v2, v0, v1

    const/16 v1, 0x67

    const-string v2, "g"

    aput-object v2, v0, v1

    const/16 v1, 0x68

    const-string v2, "h"

    aput-object v2, v0, v1

    const/16 v1, 0x69

    const-string v2, "i"

    aput-object v2, v0, v1

    const/16 v1, 0x6a

    const-string v2, "j"

    aput-object v2, v0, v1

    const/16 v1, 0x6b

    const-string v2, "k"

    aput-object v2, v0, v1

    const/16 v1, 0x6c

    const-string v2, "l"

    aput-object v2, v0, v1

    const/16 v1, 0x6d

    const-string v2, "m"

    aput-object v2, v0, v1

    const/16 v1, 0x6e

    const-string v2, "n"

    aput-object v2, v0, v1

    const/16 v1, 0x6f

    const-string/jumbo v2, "o"

    aput-object v2, v0, v1

    const/16 v1, 0x70

    const-string/jumbo v2, "p"

    aput-object v2, v0, v1

    const/16 v1, 0x71

    const-string/jumbo v2, "q"

    aput-object v2, v0, v1

    const/16 v1, 0x72

    const-string/jumbo v2, "r"

    aput-object v2, v0, v1

    const/16 v1, 0x73

    const-string/jumbo v2, "s"

    aput-object v2, v0, v1

    const/16 v1, 0x74

    const-string/jumbo v2, "t"

    aput-object v2, v0, v1

    const/16 v1, 0x75

    const-string/jumbo v2, "u"

    aput-object v2, v0, v1

    const/16 v1, 0x76

    const-string/jumbo v2, "v"

    aput-object v2, v0, v1

    const/16 v1, 0x77

    const-string/jumbo v2, "w"

    aput-object v2, v0, v1

    const/16 v1, 0x78

    const-string/jumbo v2, "x"

    aput-object v2, v0, v1

    const/16 v1, 0x79

    const-string/jumbo v2, "y"

    aput-object v2, v0, v1

    const/16 v1, 0x7a

    const-string/jumbo v2, "z"

    aput-object v2, v0, v1

    const/16 v1, 0x7b

    const-string v2, "braceleft"

    aput-object v2, v0, v1

    const/16 v1, 0x7c

    const-string v2, "bar"

    aput-object v2, v0, v1

    const/16 v1, 0x7d

    const-string v2, "braceright"

    aput-object v2, v0, v1

    const/16 v1, 0x7e

    const-string v2, "asciitilde"

    aput-object v2, v0, v1

    const/16 v1, 0x7f

    const-string v2, "W7f"

    aput-object v2, v0, v1

    const/16 v1, 0x80

    const-string v2, "euro"

    aput-object v2, v0, v1

    const/16 v1, 0x81

    const-string v2, "W81"

    aput-object v2, v0, v1

    const/16 v1, 0x82

    const-string/jumbo v2, "quotesinglbase"

    aput-object v2, v0, v1

    const/16 v1, 0x83

    const-string v2, "florin"

    aput-object v2, v0, v1

    const/16 v1, 0x84

    const-string/jumbo v2, "quotedblbase"

    aput-object v2, v0, v1

    const/16 v1, 0x85

    const-string v2, "ellipsis"

    aput-object v2, v0, v1

    const/16 v1, 0x86

    const-string v2, "dagger"

    aput-object v2, v0, v1

    const/16 v1, 0x87

    const-string v2, "daggerdbl"

    aput-object v2, v0, v1

    const/16 v1, 0x88

    const-string v2, "circumflex"

    aput-object v2, v0, v1

    const/16 v1, 0x89

    const-string/jumbo v2, "perthousand"

    aput-object v2, v0, v1

    const/16 v1, 0x8a

    const-string v2, "Scaron"

    aput-object v2, v0, v1

    const/16 v1, 0x8b

    const-string v2, "guilsinglleft"

    aput-object v2, v0, v1

    const/16 v1, 0x8c

    const-string v2, "OE"

    aput-object v2, v0, v1

    const/16 v1, 0x8d

    const-string v2, "W8d"

    aput-object v2, v0, v1

    const/16 v1, 0x8e

    const-string v2, "Zcaron"

    aput-object v2, v0, v1

    const/16 v1, 0x8f

    const-string v2, "W8f"

    aput-object v2, v0, v1

    const/16 v1, 0x90

    const-string v2, "W90"

    aput-object v2, v0, v1

    const/16 v1, 0x91

    const-string/jumbo v2, "quoteleft"

    aput-object v2, v0, v1

    const/16 v1, 0x92

    const-string/jumbo v2, "quoteright"

    aput-object v2, v0, v1

    const/16 v1, 0x93

    const-string/jumbo v2, "quotedblleft"

    aput-object v2, v0, v1

    const/16 v1, 0x94

    const-string/jumbo v2, "quotedblright"

    aput-object v2, v0, v1

    const/16 v1, 0x95

    const-string v2, "bullet"

    aput-object v2, v0, v1

    const/16 v1, 0x96

    const-string v2, "endash"

    aput-object v2, v0, v1

    const/16 v1, 0x97

    const-string v2, "emdash"

    aput-object v2, v0, v1

    const/16 v1, 0x98

    const-string/jumbo v2, "tilde"

    aput-object v2, v0, v1

    const/16 v1, 0x99

    const-string/jumbo v2, "trademark"

    aput-object v2, v0, v1

    const/16 v1, 0x9a

    const-string/jumbo v2, "scaron"

    aput-object v2, v0, v1

    const/16 v1, 0x9b

    const-string v2, "guilsinglright"

    aput-object v2, v0, v1

    const/16 v1, 0x9c

    const-string/jumbo v2, "oe"

    aput-object v2, v0, v1

    const/16 v1, 0x9d

    const-string v2, "W9d"

    aput-object v2, v0, v1

    const/16 v1, 0x9e

    const-string/jumbo v2, "zcaron"

    aput-object v2, v0, v1

    const/16 v1, 0x9f

    const-string v2, "Ydieresis"

    aput-object v2, v0, v1

    const/16 v1, 0xa0

    const-string/jumbo v2, "reqspace"

    aput-object v2, v0, v1

    const/16 v1, 0xa1

    const-string v2, "exclamdown"

    aput-object v2, v0, v1

    const/16 v1, 0xa2

    const-string v2, "cent"

    aput-object v2, v0, v1

    const/16 v1, 0xa3

    const-string/jumbo v2, "sterling"

    aput-object v2, v0, v1

    const/16 v1, 0xa4

    const-string v2, "currency"

    aput-object v2, v0, v1

    const/16 v1, 0xa5

    const-string/jumbo v2, "yen"

    aput-object v2, v0, v1

    const/16 v1, 0xa6

    const-string v2, "brokenbar"

    aput-object v2, v0, v1

    const/16 v1, 0xa7

    const-string/jumbo v2, "section"

    aput-object v2, v0, v1

    const/16 v1, 0xa8

    const-string v2, "dieresis"

    aput-object v2, v0, v1

    const-string v1, "copyright"

    const/16 v2, 0xa9

    aput-object v1, v0, v2

    const/16 v1, 0xaa

    const-string/jumbo v2, "ordfeminine"

    aput-object v2, v0, v1

    const/16 v1, 0xab

    const-string v2, "guillemotleft"

    aput-object v2, v0, v1

    const/16 v1, 0xac

    const-string v2, "logicalnot"

    aput-object v2, v0, v1

    const/16 v1, 0xad

    const-string/jumbo v2, "syllable"

    aput-object v2, v0, v1

    const/16 v1, 0xae

    const-string/jumbo v2, "registered"

    aput-object v2, v0, v1

    const/16 v1, 0xaf

    const-string v2, "macron"

    aput-object v2, v0, v1

    const/16 v1, 0xb0

    const-string v2, "degree"

    aput-object v2, v0, v1

    const/16 v1, 0xb1

    const-string/jumbo v2, "plusminus"

    aput-object v2, v0, v1

    const/16 v1, 0xb2

    const-string/jumbo v2, "twosuperior"

    aput-object v2, v0, v1

    const/16 v1, 0xb3

    const-string/jumbo v2, "threesuperior"

    aput-object v2, v0, v1

    const/16 v1, 0xb4

    const-string v2, "acute"

    aput-object v2, v0, v1

    const/16 v1, 0xb5

    const-string v2, "mu"

    aput-object v2, v0, v1

    const/16 v1, 0xb6

    const-string/jumbo v2, "paragraph"

    aput-object v2, v0, v1

    const/16 v1, 0xb7

    const-string/jumbo v2, "periodcentered"

    aput-object v2, v0, v1

    const/16 v1, 0xb8

    const-string v2, "cedilla"

    aput-object v2, v0, v1

    const/16 v1, 0xb9

    const-string/jumbo v2, "onesuperior"

    aput-object v2, v0, v1

    const/16 v1, 0xba

    const-string/jumbo v2, "ordmasculine"

    aput-object v2, v0, v1

    const/16 v1, 0xbb

    const-string v2, "guillemotright"

    aput-object v2, v0, v1

    const/16 v1, 0xbc

    const-string/jumbo v2, "onequarter"

    aput-object v2, v0, v1

    const/16 v1, 0xbd

    const-string/jumbo v2, "onehalf"

    aput-object v2, v0, v1

    const/16 v1, 0xbe

    const-string/jumbo v2, "threequarters"

    aput-object v2, v0, v1

    const/16 v1, 0xbf

    const-string/jumbo v2, "questiondown"

    aput-object v2, v0, v1

    const/16 v1, 0xc0

    const-string v2, "Agrave"

    aput-object v2, v0, v1

    const/16 v1, 0xc1

    const-string v2, "Aacute"

    aput-object v2, v0, v1

    const/16 v1, 0xc2

    const-string v2, "Acircumflex"

    aput-object v2, v0, v1

    const/16 v1, 0xc3

    const-string v2, "Atilde"

    aput-object v2, v0, v1

    const/16 v1, 0xc4

    const-string v2, "Adieresis"

    aput-object v2, v0, v1

    const-string v1, "Aring"

    const/16 v2, 0xc5

    aput-object v1, v0, v2

    const-string v1, "AE"

    const/16 v2, 0xc6

    aput-object v1, v0, v2

    const-string v1, "Ccedilla"

    const/16 v2, 0xc7

    aput-object v1, v0, v2

    const/16 v1, 0xc8

    const-string v2, "Egrave"

    aput-object v2, v0, v1

    const/16 v1, 0xc9

    const-string v2, "Eacute"

    aput-object v2, v0, v1

    const-string v1, "Ecircumflex"

    const/16 v2, 0xca

    aput-object v1, v0, v2

    const/16 v1, 0xcb

    const-string v2, "Edieresis"

    aput-object v2, v0, v1

    const/16 v1, 0xcc

    const-string v2, "Igrave"

    aput-object v2, v0, v1

    const-string v1, "Iacute"

    const/16 v2, 0xcd

    aput-object v1, v0, v2

    const-string v1, "Icircumflex"

    const/16 v2, 0xce

    aput-object v1, v0, v2

    const-string v1, "Idieresis"

    const/16 v2, 0xcf

    aput-object v1, v0, v2

    const/16 v1, 0xd0

    const-string v2, "Eth"

    aput-object v2, v0, v1

    const/16 v1, 0xd1

    const-string v2, "Ntilde"

    aput-object v2, v0, v1

    const/16 v1, 0xd2

    const-string v2, "Ograve"

    aput-object v2, v0, v1

    const/16 v1, 0xd3

    const-string v2, "Oacute"

    aput-object v2, v0, v1

    const/16 v1, 0xd4

    const-string v2, "Ocircumflex"

    aput-object v2, v0, v1

    const/16 v1, 0xd5

    const-string v2, "Otilde"

    aput-object v2, v0, v1

    const/16 v1, 0xd6

    const-string v2, "Odieresis"

    aput-object v2, v0, v1

    const/16 v1, 0xd7

    const-string v2, "multiply"

    aput-object v2, v0, v1

    const/16 v1, 0xd8

    const-string v2, "Oslash"

    aput-object v2, v0, v1

    const/16 v1, 0xd9

    const-string v2, "Ugrave"

    aput-object v2, v0, v1

    const/16 v1, 0xda

    const-string v2, "Uacute"

    aput-object v2, v0, v1

    const/16 v1, 0xdb

    const-string v2, "Ucircumflex"

    aput-object v2, v0, v1

    const/16 v1, 0xdc

    const-string v2, "Udieresis"

    aput-object v2, v0, v1

    const/16 v1, 0xdd

    const-string v2, "Yacute"

    aput-object v2, v0, v1

    const/16 v1, 0xde

    const-string v2, "Thorn"

    aput-object v2, v0, v1

    const/16 v1, 0xdf

    const-string v2, "germandbls"

    aput-object v2, v0, v1

    const/16 v1, 0xe0

    const-string v2, "agrave"

    aput-object v2, v0, v1

    const/16 v1, 0xe1

    const-string v2, "aacute"

    aput-object v2, v0, v1

    const/16 v1, 0xe2

    const-string v2, "acircumflex"

    aput-object v2, v0, v1

    const/16 v1, 0xe3

    const-string v2, "atilde"

    aput-object v2, v0, v1

    const/16 v1, 0xe4

    const-string v2, "adieresis"

    aput-object v2, v0, v1

    const/16 v1, 0xe5

    const-string v2, "aring"

    aput-object v2, v0, v1

    const/16 v1, 0xe6

    const-string v2, "ae"

    aput-object v2, v0, v1

    const/16 v1, 0xe7

    const-string v2, "ccedilla"

    aput-object v2, v0, v1

    const/16 v1, 0xe8

    const-string v2, "egrave"

    aput-object v2, v0, v1

    const/16 v1, 0xe9

    const-string v2, "eacute"

    aput-object v2, v0, v1

    const/16 v1, 0xea

    const-string v2, "ecircumflex"

    aput-object v2, v0, v1

    const/16 v1, 0xeb

    const-string v2, "edieresis"

    aput-object v2, v0, v1

    const/16 v1, 0xec

    const-string v2, "igrave"

    aput-object v2, v0, v1

    const/16 v1, 0xed

    const-string v2, "iacute"

    aput-object v2, v0, v1

    const/16 v1, 0xee

    const-string v2, "icircumflex"

    aput-object v2, v0, v1

    const/16 v1, 0xef

    const-string v2, "idieresis"

    aput-object v2, v0, v1

    const/16 v1, 0xf0

    const-string v2, "eth"

    aput-object v2, v0, v1

    const/16 v1, 0xf1

    const-string/jumbo v2, "ntilde"

    aput-object v2, v0, v1

    const/16 v1, 0xf2

    const-string/jumbo v2, "ograve"

    aput-object v2, v0, v1

    const/16 v1, 0xf3

    const-string/jumbo v2, "oacute"

    aput-object v2, v0, v1

    const/16 v1, 0xf4

    const-string/jumbo v2, "ocircumflex"

    aput-object v2, v0, v1

    const/16 v1, 0xf5

    const-string/jumbo v2, "otilde"

    aput-object v2, v0, v1

    const/16 v1, 0xf6

    const-string/jumbo v2, "odieresis"

    aput-object v2, v0, v1

    const/16 v1, 0xf7

    const-string v2, "divide"

    aput-object v2, v0, v1

    const/16 v1, 0xf8

    const-string/jumbo v2, "oslash"

    aput-object v2, v0, v1

    const/16 v1, 0xf9

    const-string/jumbo v2, "ugrave"

    aput-object v2, v0, v1

    const/16 v1, 0xfa

    const-string/jumbo v2, "uacute"

    aput-object v2, v0, v1

    const/16 v1, 0xfb

    const-string/jumbo v2, "ucircumflex"

    aput-object v2, v0, v1

    const/16 v1, 0xfc

    const-string/jumbo v2, "udieresis"

    aput-object v2, v0, v1

    const/16 v1, 0xfd

    const-string/jumbo v2, "yacute"

    aput-object v2, v0, v1

    const/16 v1, 0xfe

    const-string/jumbo v2, "thorn"

    aput-object v2, v0, v1

    const/16 v1, 0xff

    const-string/jumbo v2, "ydieresis"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->WinChars:[Ljava/lang/String;

    .line 134
    iput-object p1, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 135
    const-string v0, "ISO-8859-1"

    invoke-static {p2, v0}, Lcom/itextpdf/commons/utils/FileUtil;->createPrintWriter(Ljava/io/OutputStream;Ljava/lang/String;)Ljava/io/PrintWriter;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    .line 136
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0xc5
        0xc6
        0xc7
        0x0
        0xca
        0x0
        0xcd
        0xce
        0xcf
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x20
        0x21
        0x22
        0x23
        0x24
        0x25
        0x26
        0xa9
        0x28
        0x29
        0x2a
        0x2b
        0x2c
        0x2d
        0x2e
        0x2f
        0x30
        0x31
        0x32
        0x33
        0x34
        0x35
        0x36
        0x37
        0x38
        0x39
        0x3a
        0x3b
        0x3c
        0x3d
        0x3e
        0x3f
        0x40
        0x41
        0x42
        0x43
        0x44
        0x45
        0x46
        0x47
        0x48
        0x49
        0x4a
        0x4b
        0x4c
        0x4d
        0x4e
        0x4f
        0x50
        0x51
        0x52
        0x53
        0x54
        0x55
        0x56
        0x57
        0x58
        0x59
        0x5a
        0x5b
        0x5c
        0x5d
        0x5e
        0x5f
        0xc1
        0x61
        0x62
        0x63
        0x64
        0x65
        0x66
        0x67
        0x68
        0x69
        0x6a
        0x6b
        0x6c
        0x6d
        0x6e
        0x6f
        0x70
        0x71
        0x72
        0x73
        0x74
        0x75
        0x76
        0x77
        0x78
        0x79
        0x7a
        0x7b
        0x7c
        0x7d
        0x7e
        0x7f
        0x80
        0x0
        0xb8
        0xa6
        0xb9
        0xbc
        0xb2
        0xb3
        0xc3
        0xbd
        0x0
        0xac
        0xea
        0x0
        0x0
        0x0
        0x0
        0x60
        0x0
        0xaa
        0xba
        0xb7
        0xb1
        0xd0
        0xc4
        0x0
        0x0
        0xad
        0xfa
        0x0
        0x0
        0x0
        0x0
        0xa1
        0xa2
        0xa3
        0xa8
        0xa5
        0x0
        0xa7
        0xc8
        0x0
        0xe3
        0xab
        0x0
        0x0
        0x0
        0xc5
        0x0
        0x0
        0x0
        0x0
        0xc2
        0x0
        0xb6
        0xb4
        0xcb
        0x0
        0xeb
        0xbb
        0x0
        0x0
        0x0
        0xbf
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0xe1
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0xe9
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0xfb
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0xf1
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0xf9
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public static convert(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Ljava/io/OutputStream;)V
    .locals 2
    .param p0, "input"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 145
    new-instance v0, Lcom/itextpdf/io/font/Pfm2afm;

    invoke-direct {v0, p0, p1}, Lcom/itextpdf/io/font/Pfm2afm;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Ljava/io/OutputStream;)V

    .line 146
    .local v0, "p":Lcom/itextpdf/io/font/Pfm2afm;
    invoke-direct {v0}, Lcom/itextpdf/io/font/Pfm2afm;->openpfm()V

    .line 147
    invoke-direct {v0}, Lcom/itextpdf/io/font/Pfm2afm;->putheader()V

    .line 148
    invoke-direct {v0}, Lcom/itextpdf/io/font/Pfm2afm;->putchartab()V

    .line 149
    invoke-direct {v0}, Lcom/itextpdf/io/font/Pfm2afm;->putkerntab()V

    .line 150
    invoke-direct {v0}, Lcom/itextpdf/io/font/Pfm2afm;->puttrailer()V

    .line 151
    iget-object v1, v0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 152
    return-void
.end method

.method private openpfm()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 197
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 198
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->vers:S

    .line 199
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readIntLE()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->h_len:I

    .line 200
    const/16 v0, 0x3c

    invoke-direct {p0, v0}, Lcom/itextpdf/io/font/Pfm2afm;->readString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->copyright:Ljava/lang/String;

    .line 201
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->type:S

    .line 202
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->points:S

    .line 203
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->verres:S

    .line 204
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->horres:S

    .line 205
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->ascent:S

    .line 206
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->intleading:S

    .line 207
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->extleading:S

    .line 208
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->italic:B

    .line 209
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->uline:B

    .line 210
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->overs:B

    .line 211
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->weight:S

    .line 212
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->charset:B

    .line 213
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->pixwidth:S

    .line 214
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->pixheight:S

    .line 215
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->kind:B

    .line 216
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->avgwidth:S

    .line 217
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->maxwidth:S

    .line 218
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->firstchar:I

    .line 219
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->lastchar:I

    .line 220
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->defchar:B

    .line 221
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->brkchar:B

    .line 222
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->widthby:S

    .line 223
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readIntLE()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->device:I

    .line 224
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readIntLE()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->face:I

    .line 225
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readIntLE()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->bits:I

    .line 226
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readIntLE()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->bitoff:I

    .line 227
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->extlen:S

    .line 228
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readIntLE()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->psext:I

    .line 229
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readIntLE()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->chartab:I

    .line 230
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readIntLE()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->res1:I

    .line 231
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readIntLE()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->kernpairs:I

    .line 232
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readIntLE()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->res2:I

    .line 233
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readIntLE()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->fontname:I

    .line 236
    iget v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->h_len:I

    int-to-long v0, v0

    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->extlen:S

    const/16 v1, 0x1e

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->fontname:I

    const/16 v1, 0x4b

    if-lt v0, v1, :cond_0

    iget v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->fontname:I

    const/16 v1, 0x400

    if-gt v0, v1, :cond_0

    .line 239
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v1, p0, Lcom/itextpdf/io/font/Pfm2afm;->psext:I

    add-int/lit8 v1, v1, 0xe

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 240
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->capheight:S

    .line 241
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->xheight:S

    .line 242
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->ascender:S

    .line 243
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->descender:S

    .line 244
    return-void

    .line 237
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "not.a.valid.pfm.file"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private outchar(IILjava/lang/String;)V
    .locals 2
    .param p1, "code"    # I
    .param p2, "width"    # I
    .param p3, "name"    # Ljava/lang/String;

    .line 185
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v1, "C "

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 186
    invoke-direct {p0, p1}, Lcom/itextpdf/io/font/Pfm2afm;->outval(I)V

    .line 187
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v1, " ; WX "

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 188
    invoke-direct {p0, p2}, Lcom/itextpdf/io/font/Pfm2afm;->outval(I)V

    .line 189
    if-eqz p3, :cond_0

    .line 190
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v1, " ; N "

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 191
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    invoke-virtual {v0, p3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 193
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v1, " ;\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 194
    return-void
.end method

.method private outval(I)V
    .locals 2
    .param p1, "n"    # I

    .line 177
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(C)V

    .line 178
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    invoke-virtual {v0, p1}, Ljava/io/PrintWriter;->print(I)V

    .line 179
    return-void
.end method

.method private putchartab()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 336
    iget v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->lastchar:I

    iget v1, p0, Lcom/itextpdf/io/font/Pfm2afm;->firstchar:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    .line 337
    .local v0, "count":I
    new-array v1, v0, [I

    .line 338
    .local v1, "ctabs":[I
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v3, p0, Lcom/itextpdf/io/font/Pfm2afm;->chartab:I

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 339
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 340
    iget-object v3, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShortLE()I

    move-result v3

    aput v3, v1, v2

    .line 339
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 342
    .end local v2    # "k":I
    :cond_0
    const/16 v2, 0x100

    new-array v3, v2, [I

    .line 343
    .local v3, "back":[I
    iget-byte v4, p0, Lcom/itextpdf/io/font/Pfm2afm;->charset:B

    if-nez v4, :cond_2

    .line 344
    iget v4, p0, Lcom/itextpdf/io/font/Pfm2afm;->firstchar:I

    .local v4, "i":I
    :goto_1
    iget v5, p0, Lcom/itextpdf/io/font/Pfm2afm;->lastchar:I

    if-gt v4, v5, :cond_2

    .line 345
    iget-object v5, p0, Lcom/itextpdf/io/font/Pfm2afm;->Win2PSStd:[I

    aget v5, v5, v4

    if-eqz v5, :cond_1

    .line 346
    iget-object v5, p0, Lcom/itextpdf/io/font/Pfm2afm;->Win2PSStd:[I

    aget v5, v5, v4

    aput v4, v3, v5

    .line 344
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 351
    .end local v4    # "i":I
    :cond_2
    iget-object v4, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v5, "StartCharMetrics"

    invoke-virtual {v4, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 352
    invoke-direct {p0, v0}, Lcom/itextpdf/io/font/Pfm2afm;->outval(I)V

    .line 353
    iget-object v4, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/io/PrintWriter;->print(C)V

    .line 356
    iget-byte v4, p0, Lcom/itextpdf/io/font/Pfm2afm;->charset:B

    if-eqz v4, :cond_5

    .line 361
    iget v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->firstchar:I

    .local v2, "i":I
    :goto_2
    iget v4, p0, Lcom/itextpdf/io/font/Pfm2afm;->lastchar:I

    if-gt v2, v4, :cond_4

    .line 362
    iget v4, p0, Lcom/itextpdf/io/font/Pfm2afm;->firstchar:I

    sub-int v4, v2, v4

    aget v4, v1, v4

    if-eqz v4, :cond_3

    .line 363
    iget v4, p0, Lcom/itextpdf/io/font/Pfm2afm;->firstchar:I

    sub-int v4, v2, v4

    aget v4, v1, v4

    const/4 v5, 0x0

    invoke-direct {p0, v2, v4, v5}, Lcom/itextpdf/io/font/Pfm2afm;->outchar(IILjava/lang/String;)V

    .line 361
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .end local v2    # "i":I
    :cond_4
    goto :goto_5

    .line 367
    :cond_5
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_3
    if-ge v4, v2, :cond_7

    .line 368
    aget v5, v3, v4

    .line 369
    .local v5, "j":I
    if-eqz v5, :cond_6

    .line 370
    iget v6, p0, Lcom/itextpdf/io/font/Pfm2afm;->firstchar:I

    sub-int v6, v5, v6

    aget v6, v1, v6

    iget-object v7, p0, Lcom/itextpdf/io/font/Pfm2afm;->WinChars:[Ljava/lang/String;

    aget-object v7, v7, v5

    invoke-direct {p0, v4, v6, v7}, Lcom/itextpdf/io/font/Pfm2afm;->outchar(IILjava/lang/String;)V

    .line 371
    iget v6, p0, Lcom/itextpdf/io/font/Pfm2afm;->firstchar:I

    sub-int v6, v5, v6

    const/4 v7, 0x0

    aput v7, v1, v6

    .line 367
    .end local v5    # "j":I
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 375
    .end local v4    # "i":I
    :cond_7
    iget v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->firstchar:I

    .restart local v2    # "i":I
    :goto_4
    iget v4, p0, Lcom/itextpdf/io/font/Pfm2afm;->lastchar:I

    if-gt v2, v4, :cond_9

    .line 376
    iget v4, p0, Lcom/itextpdf/io/font/Pfm2afm;->firstchar:I

    sub-int v4, v2, v4

    aget v4, v1, v4

    if-eqz v4, :cond_8

    .line 377
    iget v4, p0, Lcom/itextpdf/io/font/Pfm2afm;->firstchar:I

    sub-int v4, v2, v4

    aget v4, v1, v4

    iget-object v5, p0, Lcom/itextpdf/io/font/Pfm2afm;->WinChars:[Ljava/lang/String;

    aget-object v5, v5, v2

    const/4 v6, -0x1

    invoke-direct {p0, v6, v4, v5}, Lcom/itextpdf/io/font/Pfm2afm;->outchar(IILjava/lang/String;)V

    .line 375
    :cond_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 382
    .end local v2    # "i":I
    :cond_9
    :goto_5
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v4, "EndCharMetrics\n"

    invoke-virtual {v2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 384
    return-void
.end method

.method private putheader()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 247
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v1, "StartFontMetrics 2.0\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 248
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->copyright:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xa

    if-lez v0, :cond_0

    .line 249
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Comment "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/io/font/Pfm2afm;->copyright:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 250
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v2, "FontName "

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 251
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->fontname:I

    int-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 252
    invoke-direct {p0}, Lcom/itextpdf/io/font/Pfm2afm;->readString()Ljava/lang/String;

    move-result-object v0

    .line 253
    .local v0, "fname":Ljava/lang/String;
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    invoke-virtual {v2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 254
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v3, "\nEncodingScheme "

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 255
    iget-byte v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->charset:B

    .line 258
    iget-object v3, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    .line 255
    if-eqz v2, :cond_1

    .line 256
    const-string v2, "FontSpecific\n"

    invoke-virtual {v3, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_0

    .line 258
    :cond_1
    const-string v2, "AdobeStandardEncoding\n"

    invoke-virtual {v3, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 265
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "FullName "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2d

    const/16 v5, 0x20

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 266
    iget v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->face:I

    if-eqz v2, :cond_2

    .line 267
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v3, p0, Lcom/itextpdf/io/font/Pfm2afm;->face:I

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 268
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\nFamilyName "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0}, Lcom/itextpdf/io/font/Pfm2afm;->readString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 271
    :cond_2
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v3, "\nWeight "

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 272
    iget-short v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->weight:S

    const/16 v3, 0x1db

    if-gt v2, v3, :cond_8

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, "bold"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_1

    .line 274
    :cond_3
    iget-short v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->weight:S

    const/16 v3, 0x145

    if-ge v2, v3, :cond_4

    iget-short v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->weight:S

    if-nez v2, :cond_5

    :cond_4
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, "light"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 275
    :cond_5
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v3, "Light"

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_2

    .line 276
    :cond_6
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, "black"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    .line 279
    iget-object v3, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    .line 276
    if-eqz v2, :cond_7

    .line 277
    const-string v2, "Black"

    invoke-virtual {v3, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_2

    .line 279
    :cond_7
    const-string v2, "Medium"

    invoke-virtual {v3, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_2

    .line 273
    :cond_8
    :goto_1
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v3, "Bold"

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 282
    :goto_2
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v3, "\nItalicAngle "

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 283
    iget-byte v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->italic:B

    if-nez v2, :cond_a

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, "italic"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_9

    goto :goto_3

    .line 288
    :cond_9
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_4

    .line 284
    :cond_a
    :goto_3
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v3, "-12.00"

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 295
    :goto_4
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v3, "\nIsFixedPitch "

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 296
    iget-byte v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->kind:B

    const/4 v3, 0x1

    and-int/2addr v2, v3

    if-eqz v2, :cond_c

    iget-short v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->avgwidth:S

    iget-short v4, p0, Lcom/itextpdf/io/font/Pfm2afm;->maxwidth:S

    if-ne v2, v4, :cond_b

    goto :goto_5

    .line 302
    :cond_b
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v3, "false"

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 303
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->isMono:Z

    goto :goto_6

    .line 298
    :cond_c
    :goto_5
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string/jumbo v4, "true"

    invoke-virtual {v2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 299
    iput-boolean v3, p0, Lcom/itextpdf/io/font/Pfm2afm;->isMono:Z

    .line 311
    :goto_6
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v3, "\nFontBBox"

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 312
    iget-boolean v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->isMono:Z

    if-eqz v2, :cond_d

    .line 313
    const/16 v2, -0x14

    invoke-direct {p0, v2}, Lcom/itextpdf/io/font/Pfm2afm;->outval(I)V

    goto :goto_7

    .line 315
    :cond_d
    const/16 v2, -0x64

    invoke-direct {p0, v2}, Lcom/itextpdf/io/font/Pfm2afm;->outval(I)V

    .line 317
    :goto_7
    iget-short v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->descender:S

    add-int/lit8 v2, v2, 0x5

    neg-int v2, v2

    invoke-direct {p0, v2}, Lcom/itextpdf/io/font/Pfm2afm;->outval(I)V

    .line 318
    iget-short v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->maxwidth:S

    add-int/2addr v2, v1

    invoke-direct {p0, v2}, Lcom/itextpdf/io/font/Pfm2afm;->outval(I)V

    .line 319
    iget-short v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->ascent:S

    add-int/lit8 v2, v2, 0x5

    invoke-direct {p0, v2}, Lcom/itextpdf/io/font/Pfm2afm;->outval(I)V

    .line 324
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v3, "\nCapHeight"

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 325
    iget-short v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->capheight:S

    invoke-direct {p0, v2}, Lcom/itextpdf/io/font/Pfm2afm;->outval(I)V

    .line 326
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v3, "\nXHeight"

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 327
    iget-short v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->xheight:S

    invoke-direct {p0, v2}, Lcom/itextpdf/io/font/Pfm2afm;->outval(I)V

    .line 328
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v3, "\nDescender"

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 329
    iget-short v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->descender:S

    neg-int v2, v2

    invoke-direct {p0, v2}, Lcom/itextpdf/io/font/Pfm2afm;->outval(I)V

    .line 330
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v3, "\nAscender"

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 331
    iget-short v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->ascender:S

    invoke-direct {p0, v2}, Lcom/itextpdf/io/font/Pfm2afm;->outval(I)V

    .line 332
    iget-object v2, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    invoke-virtual {v2, v1}, Ljava/io/PrintWriter;->print(C)V

    .line 333
    return-void
.end method

.method private putkerntab()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 387
    iget v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->kernpairs:I

    if-nez v0, :cond_0

    .line 388
    return-void

    .line 390
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v1, p0, Lcom/itextpdf/io/font/Pfm2afm;->kernpairs:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 391
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShortLE()I

    move-result v0

    .line 392
    .local v0, "count":I
    const/4 v1, 0x0

    .line 393
    .local v1, "nzero":I
    mul-int/lit8 v2, v0, 0x3

    new-array v2, v2, [I

    .line 394
    .local v2, "kerns":[I
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_2

    .line 395
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "k":I
    .local v4, "k":I
    iget-object v5, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v5

    aput v5, v2, v3

    .line 396
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "k":I
    .restart local v3    # "k":I
    iget-object v5, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v5

    aput v5, v2, v4

    .line 397
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "k":I
    .restart local v4    # "k":I
    iget-object v5, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v5

    aput v5, v2, v3

    if-eqz v5, :cond_1

    .line 398
    add-int/lit8 v1, v1, 0x1

    move v3, v4

    goto :goto_0

    .line 397
    :cond_1
    move v3, v4

    goto :goto_0

    .line 401
    .end local v4    # "k":I
    :cond_2
    if-nez v1, :cond_3

    .line 402
    return-void

    .line 403
    :cond_3
    iget-object v3, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v4, "StartKernData\nStartKernPairs"

    invoke-virtual {v3, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 404
    invoke-direct {p0, v1}, Lcom/itextpdf/io/font/Pfm2afm;->outval(I)V

    .line 405
    iget-object v3, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/io/PrintWriter;->print(C)V

    .line 406
    const/4 v3, 0x0

    .restart local v3    # "k":I
    :goto_1
    array-length v5, v2

    if-ge v3, v5, :cond_5

    .line 407
    add-int/lit8 v5, v3, 0x2

    aget v5, v2, v5

    if-eqz v5, :cond_4

    .line 408
    iget-object v5, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v6, "KPX "

    invoke-virtual {v5, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 409
    iget-object v5, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    iget-object v6, p0, Lcom/itextpdf/io/font/Pfm2afm;->WinChars:[Ljava/lang/String;

    aget v7, v2, v3

    aget-object v6, v6, v7

    invoke-virtual {v5, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 410
    iget-object v5, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const/16 v6, 0x20

    invoke-virtual {v5, v6}, Ljava/io/PrintWriter;->print(C)V

    .line 411
    iget-object v5, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    iget-object v6, p0, Lcom/itextpdf/io/font/Pfm2afm;->WinChars:[Ljava/lang/String;

    add-int/lit8 v7, v3, 0x1

    aget v7, v2, v7

    aget-object v6, v6, v7

    invoke-virtual {v5, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 412
    add-int/lit8 v5, v3, 0x2

    aget v5, v2, v5

    invoke-direct {p0, v5}, Lcom/itextpdf/io/font/Pfm2afm;->outval(I)V

    .line 413
    iget-object v5, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    invoke-virtual {v5, v4}, Ljava/io/PrintWriter;->print(C)V

    .line 406
    :cond_4
    add-int/lit8 v3, v3, 0x3

    goto :goto_1

    .line 417
    .end local v3    # "k":I
    :cond_5
    iget-object v3, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v4, "EndKernPairs\nEndKernData\n"

    invoke-virtual {v3, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 418
    return-void
.end method

.method private puttrailer()V
    .locals 2

    .line 422
    iget-object v0, p0, Lcom/itextpdf/io/font/Pfm2afm;->output:Ljava/io/PrintWriter;

    const-string v1, "EndFontMetrics\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 423
    return-void
.end method

.method private readString()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 166
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 168
    .local v0, "buf":Ljava/lang/StringBuilder;
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v1

    .line 169
    .local v1, "c":I
    if-gtz v1, :cond_0

    .line 170
    nop

    .line 173
    .end local v1    # "c":I
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 171
    .restart local v1    # "c":I
    :cond_0
    int-to-char v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 172
    .end local v1    # "c":I
    goto :goto_0
.end method

.method private readString(I)Ljava/lang/String;
    .locals 5
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 155
    new-array v0, p1, [B

    .line 156
    .local v0, "b":[B
    iget-object v1, p0, Lcom/itextpdf/io/font/Pfm2afm;->input:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1, v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V

    .line 158
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 159
    aget-byte v2, v0, v1

    if-nez v2, :cond_0

    .line 160
    goto :goto_1

    .line 158
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 162
    :cond_1
    :goto_1
    new-instance v2, Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "ISO-8859-1"

    invoke-direct {v2, v0, v3, v1, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    return-object v2
.end method
