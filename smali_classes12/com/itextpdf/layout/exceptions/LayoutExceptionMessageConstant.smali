.class public final Lcom/itextpdf/layout/exceptions/LayoutExceptionMessageConstant;
.super Ljava/lang/Object;
.source "LayoutExceptionMessageConstant.java"


# static fields
.field public static final CANNOT_ADD_CELL_TO_COMPLETED_LARGE_TABLE:Ljava/lang/String; = "The large table was completed. It\'s prohibited to use it anymore. Created different Table instance instead."

.field public static final CANNOT_CREATE_LAYOUT_IMAGE_BY_WMF_IMAGE:Ljava/lang/String; = "Cannot create layout image by WmfImage instance. First convert the image into FormXObject and then use the corresponding layout image constructor."

.field public static final CANNOT_DRAW_ELEMENTS_ON_ALREADY_FLUSHED_PAGES:Ljava/lang/String; = "Cannot draw elements on already flushed pages."

.field public static final DOCUMENT_CLOSED_IT_IS_IMPOSSIBLE_TO_EXECUTE_ACTION:Ljava/lang/String; = "Document was closed. It is impossible to execute action."

.field public static final FLEX_BASIS_CANNOT_BE_NULL:Ljava/lang/String; = "Flex basis cannot be null."

.field public static final FLEX_GROW_CANNOT_BE_NEGATIVE:Ljava/lang/String; = "Flex grow cannot be negative."

.field public static final FLEX_SHRINK_CANNOT_BE_NEGATIVE:Ljava/lang/String; = "Flex shrink cannot be negative."

.field public static final FONT_PROVIDER_NOT_SET_FONT_FAMILY_NOT_RESOLVED:Ljava/lang/String; = "FontProvider and FontSet are empty. Cannot resolve font family name (see ElementPropertyContainer#setFontFamily) without initialized FontProvider (see RootElement#setFontProvider)."

.field public static final INLINE_VERTICAL_ALIGNMENT_DOESN_T_NEED_A_VALUE:Ljava/lang/String; = "Inline vertical alignment \"{0}\" doesn\'t need a value"

.field public static final INVALID_COLUMN_PROPERTIES:Ljava/lang/String; = "Invalid column-count/column-width/column-gap properties, they\'re absent or have negative value"

.field public static final INVALID_FONT_PROPERTY_VALUE:Ljava/lang/String; = "Invalid FONT property value type."

.field public static final IO_EXCEPTION_WHILE_CREATING_FONT:Ljava/lang/String; = "I/O exception while creating Font"

.field public static final NONINVERTIBLE_MATRIX_CANNOT_BE_PROCESSED:Ljava/lang/String; = "A noninvertible matrix has been parsed. The behaviour is unpredictable."

.field public static final ROLE_IN_NAMESPACE_IS_NOT_MAPPED_TO_ANY_STANDARD_ROLE:Ljava/lang/String; = "Role \"{0}\" in namespace {1} is not mapped to any standard role."

.field public static final ROLE_IS_NOT_MAPPED_TO_ANY_STANDARD_ROLE:Ljava/lang/String; = "Role \"{0}\" is not mapped to any standard role."

.field public static final TAGGING_HINTKEY_SHOULD_HAVE_ACCES:Ljava/lang/String; = "TaggingHintKey should have accessibility properties"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
