.class public final enum Lcom/itextpdf/kernel/pdf/IsoKey;
.super Ljava/lang/Enum;
.source "IsoKey.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/pdf/IsoKey;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum CANVAS_BEGIN_MARKED_CONTENT:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum CANVAS_STACK:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum CANVAS_WRITING_CONTENT:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum CRYPTO:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum DUPLICATE_ID_ENTRY:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum EXTENDED_GRAPHICS_STATE:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum FILL_COLOR:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum FONT:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum FONT_GLYPHS:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum INLINE_IMAGE:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum LAYOUT:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum PAGE:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum PDF_OBJECT:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum RENDERING_INTENT:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum SIGNATURE:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum SIGNATURE_TYPE:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum STROKE_COLOR:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum TAG_STRUCTURE_ELEMENT:Lcom/itextpdf/kernel/pdf/IsoKey;

.field public static final enum XREF_TABLE:Lcom/itextpdf/kernel/pdf/IsoKey;


# direct methods
.method static constructor <clinit>()V
    .locals 22

    .line 30
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "CANVAS_STACK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->CANVAS_STACK:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 31
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "FILL_COLOR"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->FILL_COLOR:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 32
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "EXTENDED_GRAPHICS_STATE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->EXTENDED_GRAPHICS_STATE:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 33
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "INLINE_IMAGE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->INLINE_IMAGE:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 34
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "PAGE"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->PAGE:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 35
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "PDF_OBJECT"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->PDF_OBJECT:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 36
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "RENDERING_INTENT"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->RENDERING_INTENT:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 37
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "STROKE_COLOR"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->STROKE_COLOR:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 38
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "TAG_STRUCTURE_ELEMENT"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->TAG_STRUCTURE_ELEMENT:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 39
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "FONT_GLYPHS"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->FONT_GLYPHS:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 40
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "XREF_TABLE"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->XREF_TABLE:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 41
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "SIGNATURE"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->SIGNATURE:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 42
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "SIGNATURE_TYPE"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->SIGNATURE_TYPE:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 43
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "CRYPTO"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->CRYPTO:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 44
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "FONT"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->FONT:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 46
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "CANVAS_BEGIN_MARKED_CONTENT"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->CANVAS_BEGIN_MARKED_CONTENT:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 47
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "CANVAS_WRITING_CONTENT"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->CANVAS_WRITING_CONTENT:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 48
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "LAYOUT"

    const/16 v2, 0x11

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->LAYOUT:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 49
    new-instance v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    const-string v1, "DUPLICATE_ID_ENTRY"

    const/16 v2, 0x12

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/IsoKey;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->DUPLICATE_ID_ENTRY:Lcom/itextpdf/kernel/pdf/IsoKey;

    .line 28
    sget-object v3, Lcom/itextpdf/kernel/pdf/IsoKey;->CANVAS_STACK:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v4, Lcom/itextpdf/kernel/pdf/IsoKey;->FILL_COLOR:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v5, Lcom/itextpdf/kernel/pdf/IsoKey;->EXTENDED_GRAPHICS_STATE:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v6, Lcom/itextpdf/kernel/pdf/IsoKey;->INLINE_IMAGE:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v7, Lcom/itextpdf/kernel/pdf/IsoKey;->PAGE:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v8, Lcom/itextpdf/kernel/pdf/IsoKey;->PDF_OBJECT:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v9, Lcom/itextpdf/kernel/pdf/IsoKey;->RENDERING_INTENT:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v10, Lcom/itextpdf/kernel/pdf/IsoKey;->STROKE_COLOR:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v11, Lcom/itextpdf/kernel/pdf/IsoKey;->TAG_STRUCTURE_ELEMENT:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v12, Lcom/itextpdf/kernel/pdf/IsoKey;->FONT_GLYPHS:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v13, Lcom/itextpdf/kernel/pdf/IsoKey;->XREF_TABLE:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v14, Lcom/itextpdf/kernel/pdf/IsoKey;->SIGNATURE:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v15, Lcom/itextpdf/kernel/pdf/IsoKey;->SIGNATURE_TYPE:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v16, Lcom/itextpdf/kernel/pdf/IsoKey;->CRYPTO:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v17, Lcom/itextpdf/kernel/pdf/IsoKey;->FONT:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v18, Lcom/itextpdf/kernel/pdf/IsoKey;->CANVAS_BEGIN_MARKED_CONTENT:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v19, Lcom/itextpdf/kernel/pdf/IsoKey;->CANVAS_WRITING_CONTENT:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v20, Lcom/itextpdf/kernel/pdf/IsoKey;->LAYOUT:Lcom/itextpdf/kernel/pdf/IsoKey;

    sget-object v21, Lcom/itextpdf/kernel/pdf/IsoKey;->DUPLICATE_ID_ENTRY:Lcom/itextpdf/kernel/pdf/IsoKey;

    filled-new-array/range {v3 .. v21}, [Lcom/itextpdf/kernel/pdf/IsoKey;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->$VALUES:[Lcom/itextpdf/kernel/pdf/IsoKey;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/IsoKey;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 28
    const-class v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/IsoKey;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/pdf/IsoKey;
    .locals 1

    .line 28
    sget-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->$VALUES:[Lcom/itextpdf/kernel/pdf/IsoKey;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/pdf/IsoKey;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/pdf/IsoKey;

    return-object v0
.end method
