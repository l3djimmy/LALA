.class public final Lcom/itextpdf/io/logs/IoLogMessageConstant;
.super Ljava/lang/Object;
.source "IoLogMessageConstant.java"


# static fields
.field public static final ACTION_WAS_SET_TO_LINK_ANNOTATION_WITH_DESTINATION:Ljava/lang/String; = "Action was set for a link annotation containing destination. The old destination will be cleared."

.field public static final ALREADY_FLUSHED_INDIRECT_OBJECT_MADE_FREE:Ljava/lang/String; = "An attempt is made to free already flushed indirect object reference. Indirect reference wasn\'t freed."

.field public static final ALREADY_TAGGED_HINT_MARKED_ARTIFACT:Ljava/lang/String; = "A layout tagging hint for which an actual tag was already created in tags structure is marked as artifact. Existing tag will be left in the tags tree."

.field public static final ASSOCIATED_FILE_SPEC_SHALL_INCLUDE_AFRELATIONSHIP:Ljava/lang/String; = "For associated files their associated file specification dictionaries shall include the AFRelationship key."

.field public static final ATTEMPT_PROCESS_NAN:Ljava/lang/String; = "Attempt to process NaN in PdfNumber or when writing to PDF. Zero value will be used as a fallback."

.field public static final ATTEMPT_TO_CREATE_A_TAG_FOR_FINISHED_HINT:Ljava/lang/String; = "Attempt to create a tag for a hint which is already marked as finished, tag will not be created."

.field public static final ATTEMPT_TO_GENERATE_PDF_PAGES_TREE_WITHOUT_ANY_PAGES:Ljava/lang/String; = "Attempt to generate PDF pages tree without any pages, so a new page will be added."

.field public static final ATTEMPT_TO_MOVE_TO_FLUSHED_PARENT:Ljava/lang/String; = "An attempt is made to move the tag tree pointer to the tag parent which has been already flushed. Tag tree pointer is moved to the root tag instead."

.field public static final CANNOT_ADD_FINISHED_HINT_AS_A_NEW_KID_HINT:Ljava/lang/String; = "Layout tagging hints addition failed: cannot add a hint that is already marked as finished. Consider using com.itextpdf.layout.tagging.LayoutTaggingHelper#moveKidHint method for moving already finished kid hint from not yet finished parent hint."

.field public static final CANNOT_ADD_HINTS_TO_FINISHED_PARENT:Ljava/lang/String; = "Layout tagging hints addition failed: cannot add new kid hints to a parent which hint is already marked as finished. Consider using com.itextpdf.layout.tagging.LayoutTaggingHelper#replaceKidHint method for replacing not yet finished kid hint of a finished parent hint."

.field public static final CANNOT_MOVE_FINISHED_HINT:Ljava/lang/String; = "Layout tagging hints modification failed: cannot move kid hint for which both itself and it\'s parent are already marked as finished."

.field public static final CANNOT_MOVE_HINT_TO_FINISHED_PARENT:Ljava/lang/String; = "Layout tagging hints modification failed: cannot move kid hint to a parent that is already marked as finished."

.field public static final CANNOT_REPLACE_FINISHED_HINT:Ljava/lang/String; = "Layout tagging hints modification failed: cannot replace a kid hint that is already marked as finished."

.field public static final CANNOT_RESOLVE_ROLE_IN_NAMESPACE_TOO_MUCH_TRANSITIVE_MAPPINGS:Ljava/lang/String; = "Cannot resolve \"{0}\" role in {1} namespace mapping to standard role, because of the too much transitive mappings."

.field public static final CANNOT_RESOLVE_ROLE_TOO_MUCH_TRANSITIVE_MAPPINGS:Ljava/lang/String; = "Cannot resolve \"{0}\" role mapping to standard role, because of the too much transitive mappings."

.field public static final CANVAS_ALREADY_FULL_ELEMENT_WILL_BE_SKIPPED:Ljava/lang/String; = "Canvas is already full. Element will be skipped."

.field public static final CHARACTER_DIRECTION_HAS_NOT_BEEN_DETECTED:Ljava/lang/String; = "The direction for this character has not been detected: code point {0}. The Other Neutrals algorithm will be used."

.field public static final CLIP_ELEMENT:Ljava/lang/String; = "Element content was clipped because some height properties are set."

.field public static final COLLECTION_DICTIONARY_ALREADY_EXISTS_IT_WILL_BE_MODIFIED:Ljava/lang/String; = "Collection dictionary already exists. It will be modified."

.field public static final COLORANT_INTENSITIES_INVALID:Ljava/lang/String; = "Some of colorant intensities are invalid: they are bigger than 1 or less than 0. We will force them to become 1 or 0 respectively."

.field public static final COLOR_ALPHA_CHANNEL_IS_IGNORED:Ljava/lang/String; = "Alpha channel {0} was ignored during color creation. Note that opacity can be achieved in some places by using \'setOpacity\' method or \'TransparentColor\' class"

.field public static final COLOR_NOT_PARSED:Ljava/lang/String; = "Color \"{0}\" was not parsed. It has invalid value. Defaulting to black color."

.field public static final COMB_FLAG_MAY_BE_SET_ONLY_IF_MAXLEN_IS_PRESENT:Ljava/lang/String; = "The Comb flag may be set only if the MaxLen entry is present in the text field dictionary and if the Multiline, Password, and FileSelect flags are clear."

.field public static final COULD_NOT_FIND_GLYPH_WITH_CODE:Ljava/lang/String; = "Could not find glyph with the following code: {0}"

.field public static final CREATED_ROOT_TAG_HAS_MAPPING:Ljava/lang/String; = "Created root tag has role mapping: \"/Document\" role{0} is mapped{1}. Resulting tag structure might have invalid root tag."

.field public static final CREATE_COPY_SHOULD_BE_OVERRIDDEN:Ljava/lang/String; = "While processing an instance of TextRenderer, iText uses createCopy() to create glyph lines of specific fonts, which represent its parts. So if one extends TextRenderer, one should override createCopy, otherwise if FontSelector related logic is triggered, copies of this TextRenderer will have the default behavior rather than the custom one."

.field public static final DESTINATION_NOT_PERMITTED_WHEN_ACTION_IS_SET:Ljava/lang/String; = "Destinations are not permitted for link annotations that already have actions. The old action will be removed."

.field public static final DIRECTONLY_OBJECT_CANNOT_BE_INDIRECT:Ljava/lang/String; = "DirectOnly object cannot be indirect"

.field public static final DOCFONT_HAS_ILLEGAL_DIFFERENCES:Ljava/lang/String; = "Document Font has illegal differences array. Entry {0} references a glyph ID over 255 and will be ignored."

.field public static final DOCUMENT_ALREADY_HAS_FIELD:Ljava/lang/String; = "The document already has field {0}. Annotations of the fields with this name will be added to the existing one as children. If you want to have separate fields, please, rename them manually before copying."

.field public static final DOCUMENT_HAS_CONFLICTING_OCG_NAMES:Ljava/lang/String; = "Document has conflicting names for optional content groups. Groups with conflicting names will be renamed"

.field public static final DOCUMENT_IDS_ARE_CORRUPTED:Ljava/lang/String; = "The document original and/or modified id is corrupted"

.field public static final DOCUMENT_VERSION_IN_CATALOG_CORRUPTED:Ljava/lang/String; = "The document version specified in catalog is corrupted"

.field public static final DURING_CONSTRUCTION_OF_ICC_PROFILE_ERROR_OCCURRED:Ljava/lang/String; = "During the construction of the ICC profile, the {0} error with message \"{1}\" occurred, the ICC profile will not be installed in the image."

.field public static final ELEMENT_WAS_FORCE_PLACED_KEEP_WITH_NEXT_WILL_BE_IGNORED:Ljava/lang/String; = "Element was placed in a forced way. Keep with next property will be ignored"

.field public static final EMBEDDED_GO_TO_DESTINATION_NOT_SPECIFIED:Ljava/lang/String; = "No destination in the target was specified for action. Destination entry is mandatory for embedded go-to actions."

.field public static final ENCOUNTERED_INVALID_MCR:Ljava/lang/String; = "Corrupted tag structure: encountered invalid marked content reference - it doesn\'t refer to any page or any mcid. This content reference will be ignored."

.field public static final ENCRYPTED_PAYLOAD_FILE_SPEC_SHALL_HAVE_AFRELATIONSHIP_FILED_EQUAL_TO_ENCRYPTED_PAYLOAD:Ljava/lang/String; = "Encrypted payload file spec shall have \'AFRelationship\' filed equal to \'EncryptedPayload\'"

.field public static final ENCRYPTION_ENTRIES_P_AND_ENCRYPT_METADATA_NOT_CORRESPOND_PERMS_ENTRY:Ljava/lang/String; = "Encryption dictionary entries P and EncryptMetadata have value that does not correspond to encrypted values in Perms key."

.field public static final EXCEPTION_WHILE_CREATING_DEFAULT_FONT:Ljava/lang/String; = "Exception while creating default font (Helvetica, WinAnsi)"

.field public static final EXCEPTION_WHILE_UPDATING_XMPMETADATA:Ljava/lang/String; = "Exception while updating XmpMetadata"

.field public static final EXISTING_TAG_STRUCTURE_ROOT_IS_NOT_STANDARD:Ljava/lang/String; = "Existing tag structure of the document has a root of \"{0}\" role in \"{1}\" namespace that is not mapped to the standard role."

.field public static final FAILED_TO_DETERMINE_CID_FONT_SUBTYPE:Ljava/lang/String; = "Failed to determine CIDFont subtype. The type of CIDFont shall be CIDFontType0 or CIDFontType2."

.field public static final FAILED_TO_PARSE_ENCODING_STREAM:Ljava/lang/String; = "Failed to parse encoding stream."

.field public static final FAILED_TO_PROCESS_A_TRANSFORMATION_MATRIX:Ljava/lang/String; = "Failed to process a transformation matrix which is noninvertible. Some content may be placed not as expected."

.field public static final FIELD_VALUE_IS_NOT_CONTAINED_IN_OPT_ARRAY:Ljava/lang/String; = "Value \"{0}\" is not contained in /Opt array of field \"{1}\"."

.field public static final FILE_CHANNEL_CLOSING_FAILED:Ljava/lang/String; = "Closing of the file channel this source is based on failed."

.field public static final FILTER_WAS_ALREADY_FLUSHED:Ljava/lang/String; = "{0} {1} R stream object filter was already flushed, stream compression will remain as in original file. Try to flush object containing filter before the PdfDocument#close() method so that stream compression would be processed as intended."

.field public static final FLEX_ITEM_LAYOUT_RESULT_IS_NOT_FULL:Ljava/lang/String; = "Flex item layout result isn\'t full, but it must be. The cross size of the flex item will be 0."

.field public static final FLUSHED_OBJECT_CONTAINS_FREE_REFERENCE:Ljava/lang/String; = "Flushed object contains indirect reference which is free. Null object will be written instead."

.field public static final FLUSHED_OBJECT_CONTAINS_REFERENCE_WHICH_NOT_REFER_TO_ANY_OBJECT:Ljava/lang/String; = "Flushed object contains indirect reference which doesn\'t refer to any other object. Null object will be written instead."

.field public static final FONT_DICTIONARY_WITH_NO_FONT_DESCRIPTOR:Ljava/lang/String; = "Font dictionary does not contain required /FontDescriptor entry."

.field public static final FONT_DICTIONARY_WITH_NO_WIDTHS:Ljava/lang/String; = "Font dictionary does not contain required /Widths entry."

.field public static final FONT_HAS_INVALID_GLYPH:Ljava/lang/String; = "Font {0} has invalid glyph: {1}"

.field public static final FONT_PROPERTY_MUST_BE_PDF_FONT_OBJECT:Ljava/lang/String; = "The \"Property.FONT\" property must be a PdfFont object in this context."

.field public static final FONT_SUBSET_ISSUE:Ljava/lang/String; = "Font subset issue. Full font will be embedded."

.field public static final FORBID_RELEASE_IS_SET:Ljava/lang/String; = "ForbidRelease flag is set and release is called. Releasing will not be performed."

.field public static final GET_NEXT_RENDERER_SHOULD_BE_OVERRIDDEN:Ljava/lang/String; = "If a renderer overflows, iText uses this method to create another renderer for the overflow part. So if one wants to extend the renderer, one should override this method: otherwise the default method will be used and thus the default rather than the custom renderer will be created."

.field public static final GPOS_LOOKUP_SUBTABLE_FORMAT_NOT_SUPPORTED:Ljava/lang/String; = "Subtable format {0} of GPOS Lookup Type {1} is not supported yet"

.field public static final GRAPHICS_STATE_WAS_DELETED:Ljava/lang/String; = "Graphics state is always deleted after event dispatching. If you want to preserve it in renderer info, use preserveGraphicsState method after receiving renderer info."

.field public static final IF_PATH_IS_SET_VERTICES_SHALL_NOT_BE_PRESENT:Ljava/lang/String; = "If Path key is set, Vertices key shall not be present. Remove Vertices key before setting Path"

.field public static final IMAGE_HAS_AMBIGUOUS_SCALE:Ljava/lang/String; = "The image cannot be auto scaled and scaled by a certain parameter simultaneously"

.field public static final IMAGE_HAS_ICC_PROFILE_WITH_INCOMPATIBLE_NUMBER_OF_COLOR_COMPONENTS_COMPARED_TO_BASE_COLOR_SPACE_IN_INDEXED_COLOR_SPACE:Ljava/lang/String; = "Image has icc profile with incompatible number of color components compared to base color space in image indexed color space. The icc profile will be ignored."

.field public static final IMAGE_HAS_ICC_PROFILE_WITH_INCOMPATIBLE_NUMBER_OF_COLOR_COMPONENTS_COMPARED_TO_COLOR_SPACE:Ljava/lang/String; = "Image has icc profile with incompatible number of color components compared to image color space. The icc profile will be ignored."

.field public static final IMAGE_HAS_INCORRECT_OR_UNSUPPORTED_BASE_COLOR_SPACE_IN_INDEXED_COLOR_SPACE_OVERRIDDEN_BY_ICC_PROFILE:Ljava/lang/String; = "Image has incorrect or unsupported base color space in indexed color space, it will be overridden by one based on embedded icc profile."

.field public static final IMAGE_HAS_INCORRECT_OR_UNSUPPORTED_COLOR_SPACE_OVERRIDDEN_BY_ICC_PROFILE:Ljava/lang/String; = "Image has incorrect or unsupported color space, that will be overridden by one based on embedded icc profile."

.field public static final IMAGE_HAS_JBIG2DECODE_FILTER:Ljava/lang/String; = "Image cannot be inline if it has JBIG2Decode filter. It will be added as an ImageXObject"

.field public static final IMAGE_HAS_JPXDECODE_FILTER:Ljava/lang/String; = "Image cannot be inline if it has JPXDecode filter. It will be added as an ImageXObject"

.field public static final IMAGE_HAS_MASK:Ljava/lang/String; = "Image cannot be inline if it has a Mask"

.field public static final IMAGE_SIZE_CANNOT_BE_MORE_4KB:Ljava/lang/String; = "Inline image size cannot be more than 4KB. It will be added as an ImageXObject"

.field public static final INDIRECT_REFERENCE_USED_IN_FLUSHED_OBJECT_MADE_FREE:Ljava/lang/String; = "An attempt is made to free an indirect reference which was already used in the flushed object. Indirect reference wasn\'t freed."

.field public static final INLINE_BLOCK_ELEMENT_WILL_BE_CLIPPED:Ljava/lang/String; = "Inline block element does not fit into parent element and will be clipped"

.field public static final INVALID_DESTINATION_TYPE:Ljava/lang/String; = "When destination\'s not associated with a Remote or Embedded Go-To action, it shall specify page dictionary instead of page number. Otherwise destination might be considered invalid"

.field public static final INVALID_DISTRIBUTION_POINT:Ljava/lang/String; = "Skipped CRL: {0}"

.field public static final INVALID_INDIRECT_REFERENCE:Ljava/lang/String; = "Invalid indirect reference {0} {1} R"

.field public static final INVALID_KEY_VALUE_KEY_0_HAS_NULL_VALUE:Ljava/lang/String; = "Invalid key value: key {0} has null value."

.field public static final LAST_ROW_IS_NOT_COMPLETE:Ljava/lang/String; = "Last row is not completed. Table bottom border may collapse as you do not expect it"

.field public static final MAKE_COPY_OF_CATALOG_DICTIONARY_IS_FORBIDDEN:Ljava/lang/String; = "Make copy of Catalog dictionary is forbidden."

.field public static final MAPPING_IN_NAMESPACE_OVERWRITTEN:Ljava/lang/String; = "Existing mapping for {0} in {1} namespace was overwritten."

.field public static final MAPPING_IN_STRUCT_ROOT_OVERWRITTEN:Ljava/lang/String; = "Existing mapping for {0} in structure tree root role map was {1} and it was overwritten with {2}."

.field public static final METHOD_IS_NOT_IMPLEMENTED_BY_DEFAULT_OTHER_METHOD_WILL_BE_USED:Ljava/lang/String; = "Method {0} is not implemented by default: please, override and implement it. {1} will be used instead."

.field public static final MULTIPLE_VALUES_ON_A_NON_MULTISELECT_FIELD:Ljava/lang/String; = "Multiple values were set to a field that does not have MultiSelect flag set."

.field public static final NAME_ALREADY_EXISTS_IN_THE_NAME_TREE:Ljava/lang/String; = "Name \"{0}\" already exists in the name tree; old value will be replaced by the new one."

.field public static final NOT_TAGGED_PAGES_IN_TAGGED_DOCUMENT:Ljava/lang/String; = "Not tagged pages are copied to the tagged document. Destination document now may contain not tagged content."

.field public static final NUM_TREE_SHALL_NOT_END_WITH_KEY:Ljava/lang/String; = "Number tree ends with a key which is invalid according to the PDF specification."

.field public static final OCCUPIED_AREA_HAS_NOT_BEEN_INITIALIZED:Ljava/lang/String; = "Occupied area has not been initialized. {0}"

.field public static final OCG_COPYING_ERROR:Ljava/lang/String; = "OCG copying caused the following exception: {0}."

.field public static final OCSP_STATUS_IS_REVOKED:Ljava/lang/String; = "OCSP status is revoked."

.field public static final OCSP_STATUS_IS_UNKNOWN:Ljava/lang/String; = "OCSP status is unknown."

.field public static final ONE_OF_GROUPED_SOURCES_CLOSING_FAILED:Ljava/lang/String; = "Closing of one of the grouped sources failed."

.field public static final OPENTYPE_GDEF_TABLE_ERROR:Ljava/lang/String; = "OpenType GDEF table error: {0}"

.field public static final ORPHANS_CONSTRAINT_VIOLATED:Ljava/lang/String; = "Orphans constraint violated for paragraph split at page {0}. Min number of orphans: {1}; actual: {2}. \nComment: {3}"

.field public static final OUTLINE_DESTINATION_PAGE_NUMBER_IS_OUT_OF_BOUNDS:Ljava/lang/String; = "Outline destination page number {0} is out of bounds"

.field public static final PAGE_TREE_IS_BROKEN_FAILED_TO_RETRIEVE_PAGE:Ljava/lang/String; = "Page tree is broken. Failed to retrieve page number {0}. Null will be returned."

.field public static final PAGE_WAS_FLUSHED_ACTION_WILL_NOT_BE_PERFORMED:Ljava/lang/String; = "Page was flushed. {0} will not be performed."

.field public static final PASSED_PAGE_SHALL_BE_ON_WHICH_CANVAS_WILL_BE_RENDERED:Ljava/lang/String; = "The page passed to Canvas#enableAutoTagging(PdfPage) method shall be the one on which this canvas will be rendered. However the actual passed PdfPage instance sets not such page. This might lead to creation of malformed PDF document."

.field public static final PATH_KEY_IS_PRESENT_VERTICES_WILL_BE_IGNORED:Ljava/lang/String; = "Path key is present. Vertices will be ignored"

.field public static final PDF_OBJECT_FLUSHING_NOT_PERFORMED:Ljava/lang/String; = "PdfObject flushing is not performed: PdfDocument is opened in append mode and the object is not marked as modified ( see PdfObject#setModified() )."

.field public static final PDF_READER_CLOSING_FAILED:Ljava/lang/String; = "PdfReader closing failed due to the error occurred!"

.field public static final PDF_REFERS_TO_NOT_EXISTING_PROPERTY_DICTIONARY:Ljava/lang/String; = "The PDF contains a BDC operator which refers to a not existing Property dictionary: {0}."

.field public static final PDF_WRITER_CLOSING_FAILED:Ljava/lang/String; = "PdfWriter closing failed due to the error occurred!"

.field public static final PNG_IMAGE_HAS_ICC_PROFILE_WITH_INCOMPATIBLE_NUMBER_OF_COLOR_COMPONENTS:Ljava/lang/String; = "Png image has color profile with incompatible number of color components."

.field public static final POPUP_ENTRY_IS_NOT_POPUP_ANNOTATION:Ljava/lang/String; = "Popup entry in the markup annotations refers not to the annotation with Popup subtype."

.field public static final PREMATURE_CALL_OF_HANDLE_VIOLATION_METHOD:Ljava/lang/String; = "Premature call of handleViolation method."

.field public static final PROPERTY_IN_PERCENTS_NOT_SUPPORTED:Ljava/lang/String; = "Property {0} in percents is not supported"

.field public static final RECTANGLE_HAS_NEGATIVE_OR_ZERO_SIZES:Ljava/lang/String; = "The {0} rectangle has negative or zero sizes. It will not be displayed."

.field public static final RECTANGLE_HAS_NEGATIVE_SIZE:Ljava/lang/String; = "The {0} rectangle has negative size. It will not be displayed."

.field public static final REMOVING_PAGE_HAS_ALREADY_BEEN_FLUSHED:Ljava/lang/String; = "The page requested to be removed has already been flushed."

.field public static final RENDERER_WAS_NOT_ABLE_TO_PROCESS_KEEP_WITH_NEXT:Ljava/lang/String; = "The renderer was not able to process keep with next property properly"

.field public static final ROLE_MAPPING_FROM_SOURCE_IS_NOT_COPIED_ALREADY_EXIST:Ljava/lang/String; = "Role mapping \"{0}\" from source document is not copied. Destination document already has \"{1}\" mapping."

.field public static final ROLE_MAPPING_FROM_SOURCE_IS_NOT_COPIED_INVALID:Ljava/lang/String; = "Role mapping for \"{0}\" from source document is not copied. Mapping to namespace is in an invalid form (should be [PdfName, PdfDictionary])."

.field public static final ROTATION_WAS_NOT_CORRECTLY_PROCESSED_FOR_RENDERER:Ljava/lang/String; = "Rotation was not correctly processed for {0}"

.field public static final SOME_TARGET_FIELDS_ARE_NOT_SET_OR_INCORRECT:Ljava/lang/String; = "Some fields in target dictionary are not set or incorrect. Null will be returned."

.field public static final SOURCE_DOCUMENT_HAS_ACROFORM_DICTIONARY:Ljava/lang/String; = "Source document has AcroForm dictionary. The pages you are going to copy may have FormFields, but they will not be copied, because you have not used any IPdfPageExtraCopier"

.field public static final START_MARKER_MISSING_IN_PFB_FILE:Ljava/lang/String; = "Start marker is missing in the pfb file"

.field public static final STDSCRIPTCONFIG_DESIGNED_ONLY_FOR_STD_SCRIPTS:Ljava/lang/String; = "StandardScriptConfig class is designed for only standard scripts, otherwise it might be incompatible."

.field public static final STRUCTURE_ELEMENT_REPLACED_BY_ITS_ID_IN_STRUCTURE_DESTINATION:Ljava/lang/String; = "Structure destinations shall specify structure element ID in remote go-to actions. Structure element has been replaced with its ID in the structure destination"

.field public static final SUM_OF_TABLE_COLUMNS_IS_GREATER_THAN_100:Ljava/lang/String; = "Sum of table columns is greater than 100%."

.field public static final TABLE_WIDTH_IS_MORE_THAN_EXPECTED_DUE_TO_MIN_WIDTH:Ljava/lang/String; = "Table width is more than expected due to min width of cell(s)."

.field public static final TAG_STRUCTURE_INIT_FAILED:Ljava/lang/String; = "Tag structure initialization failed, tag structure is ignored, it might be corrupted."

.field public static final TOUNICODE_CMAP_MORE_THAN_2_BYTES_NOT_SUPPORTED:Ljava/lang/String; = "ToUnicode CMap more than 2 bytes not supported."

.field public static final TYPE3_FONT_CANNOT_BE_ADDED:Ljava/lang/String; = "Type 3 font cannot be added to FontSet. Custom FontProvider class may be created for this purpose."

.field public static final TYPE3_FONT_INITIALIZATION_ISSUE:Ljava/lang/String; = "Type 3 font issue. Font cannot be initialized correctly."

.field public static final TYPE3_FONT_ISSUE_TAGGED_PDF:Ljava/lang/String; = "Type 3 font issue. Font Descriptor is required for tagged PDF. FontName shall be specified."

.field public static final TYPOGRAPHY_NOT_FOUND:Ljava/lang/String; = "Cannot find pdfCalligraph module, which was implicitly required by one of the layout properties"

.field public static final UNABLE_TO_APPLY_PAGE_DEPENDENT_PROP_UNKNOWN_PAGE_ON_WHICH_ELEMENT_IS_DRAWN:Ljava/lang/String; = "Unable to apply page dependent property, because the page on which element is drawn is unknown. Usually this means that element was added to the Canvas instance that was created not with constructor taking PdfPage as argument. Not processed property: {0}"

.field public static final UNABLE_TO_INVERT_GRADIENT_TRANSFORMATION:Ljava/lang/String; = "Unable to invert gradient transformation, ignoring it"

.field public static final UNEXPECTED_BEHAVIOUR_DURING_TABLE_ROW_COLLAPSING:Ljava/lang/String; = "Unexpected behaviour during table row collapsing. Calculated rowspan was less then 1."

.field public static final UNEXPECTED_EVENT_HANDLER_SERVICE_THREAD_EXCEPTION:Ljava/lang/String; = "Unexpected exception encountered in service thread. Shutting it down."

.field public static final UNKNOWN_CMAP:Ljava/lang/String; = "Unknown CMap {0}"

.field public static final UNKNOWN_COLOR_FORMAT_MUST_BE_RGB_OR_RRGGBB:Ljava/lang/String; = "Unknown color format: must be rgb or rrggbb."

.field public static final UNKNOWN_ERROR_WHILE_PROCESSING_CMAP:Ljava/lang/String; = "Unknown error while processing CMap."

.field public static final VERSION_INCOMPATIBILITY_FOR_DICTIONARY_ENTRY:Ljava/lang/String; = "\"{0}\" entry in the \"{1}\" dictionary is a {2} and higher version feature. It is meaningless for the current {3} version."

.field public static final WIDOWS_CONSTRAINT_VIOLATED:Ljava/lang/String; = "Widows constraint violated for paragraph split at page {0}. Min number of widows: {1}; actual: {2}.\nComment: {3}"

.field public static final WRITER_ENCRYPTION_IS_IGNORED_APPEND:Ljava/lang/String; = "Writer encryption will be ignored, because append mode is used. Document will preserve the original encryption (or will stay unencrypted)"

.field public static final WRITER_ENCRYPTION_IS_IGNORED_PRESERVE:Ljava/lang/String; = "Writer encryption will be ignored, because preservation of encryption is enabled. Document will preserve the original encryption (or will stay unencrypted)"

.field public static final WRONG_MEDIABOX_SIZE_TOO_MANY_ARGUMENTS:Ljava/lang/String; = "Wrong media box size: {0}. The arguments beyond the 4th will be ignored"

.field public static final XFDF_ANNOTATION_IS_NOT_SUPPORTED:Ljava/lang/String; = "Xfdf annotation \"{0}\" is not supported"

.field public static final XFDF_HREF_ATTRIBUTE_AND_PDF_DOCUMENT_NAME_ARE_DIFFERENT:Ljava/lang/String; = "Xfdf href attribute and pdf document name are different!"

.field public static final XFDF_NO_F_OBJECT_TO_COMPARE:Ljava/lang/String; = "Xfdf no f object to compare."

.field public static final XFDF_NO_SUCH_FIELD_IN_PDF_DOCUMENT:Ljava/lang/String; = "Xfdf no such field in pdf document!"

.field public static final XFDF_UNSUPPORTED_ANNOTATION_ATTRIBUTE:Ljava/lang/String; = "Xfdf unsupported attribute type"

.field public static final XOBJECT_HAS_NO_STRUCT_PARENTS:Ljava/lang/String; = "XObject has no StructParents entry in its stream, no entry in ParentTree will be created for the corresponding structure elements"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final XREF_ERROR_WHILE_READING_TABLE_WILL_BE_REBUILT:Ljava/lang/String; = "Error occurred while reading cross reference table. Cross reference table will be rebuilt."


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 487
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 489
    return-void
.end method
