.class public final Lcom/itextpdf/io/font/constants/StandardFonts;
.super Ljava/lang/Object;
.source "StandardFonts.java"


# static fields
.field private static final BUILTIN_FONTS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final COURIER:Ljava/lang/String; = "Courier"

.field public static final COURIER_BOLD:Ljava/lang/String; = "Courier-Bold"

.field public static final COURIER_BOLDOBLIQUE:Ljava/lang/String; = "Courier-BoldOblique"

.field public static final COURIER_OBLIQUE:Ljava/lang/String; = "Courier-Oblique"

.field public static final HELVETICA:Ljava/lang/String; = "Helvetica"

.field public static final HELVETICA_BOLD:Ljava/lang/String; = "Helvetica-Bold"

.field public static final HELVETICA_BOLDOBLIQUE:Ljava/lang/String; = "Helvetica-BoldOblique"

.field public static final HELVETICA_OBLIQUE:Ljava/lang/String; = "Helvetica-Oblique"

.field public static final SYMBOL:Ljava/lang/String; = "Symbol"

.field public static final TIMES_BOLD:Ljava/lang/String; = "Times-Bold"

.field public static final TIMES_BOLDITALIC:Ljava/lang/String; = "Times-BoldItalic"

.field public static final TIMES_ITALIC:Ljava/lang/String; = "Times-Italic"

.field public static final TIMES_ROMAN:Ljava/lang/String; = "Times-Roman"

.field public static final ZAPFDINGBATS:Ljava/lang/String; = "ZapfDingbats"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 38
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 39
    .local v0, "tempSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const-string v1, "Courier"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 40
    const-string v1, "Courier-Bold"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 41
    const-string v1, "Courier-BoldOblique"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 42
    const-string v1, "Courier-Oblique"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 43
    const-string v1, "Helvetica"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 44
    const-string v1, "Helvetica-Bold"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 45
    const-string v1, "Helvetica-BoldOblique"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 46
    const-string v1, "Helvetica-Oblique"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 47
    const-string v1, "Symbol"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 48
    const-string v1, "Times-Roman"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 49
    const-string v1, "Times-Bold"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 50
    const-string v1, "Times-BoldItalic"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 51
    const-string v1, "Times-Italic"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 52
    const-string v1, "ZapfDingbats"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 53
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    sput-object v1, Lcom/itextpdf/io/font/constants/StandardFonts;->BUILTIN_FONTS:Ljava/util/Set;

    .line 54
    .end local v0    # "tempSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method public static isStandardFont(Ljava/lang/String;)Z
    .locals 1
    .param p0, "fontName"    # Ljava/lang/String;

    .line 57
    sget-object v0, Lcom/itextpdf/io/font/constants/StandardFonts;->BUILTIN_FONTS:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
