package com.itextpdf.kernel.logs;
/* loaded from: classes12.dex */
public final class KernelLogMessageConstant {
    public static final String CANNOT_MERGE_ENTRY = "Cannot merge entry {0}, entry with such key already exists.";
    public static final String CORRUPTED_OUTLINE_DICTIONARY_HAS_INFINITE_LOOP = "Document outline dictionary is corrupted: some outline (PDF object: \"{0}\") has wrong first/next link entry. Next outlines in this dictionary will be unprocessed.";
    public static final String DCTDECODE_FILTER_DECODING = "DCTDecode filter decoding into the bit map is not supported. The stream data would be left in JPEG baseline format";
    public static final String ERROR_WHILE_FINALIZING_AES_CIPHER = "Exception finalizing AES cipher.";
    public static final String FEATURE_IS_NOT_SUPPORTED = "Exception was thrown: {0}. The feature {1} is probably not supported by your XML processor.";
    public static final String FLATTENING_IS_NOT_YET_SUPPORTED = "Flattening annotation type {0} is not yet supported, it will not be removed from the page";
    public static final String FORMFIELD_ANNOTATION_WILL_NOT_BE_FLATTENED = "Form field annotation flattening is not supported. Use the PdfAcroForm#flattenFields() method instead.";
    public static final String FULL_COMPRESSION_APPEND_MODE_XREF_STREAM_INCONSISTENCY = "Full compression mode was requested to be switched off in append mode but the original document has cross-reference stream, not cross-reference table. Falling back to cross-reference stream in appended document and switching full compression on";
    public static final String FULL_COMPRESSION_APPEND_MODE_XREF_TABLE_INCONSISTENCY = "Full compression mode requested in append mode but the original document has cross-reference table, not cross-reference stream. Falling back to cross-reference table in appended document and switching full compression off";
    public static final String INVALID_DDICTIONARY_FIELD_VALUE = "The default configuration dictionary field {0} has a value of {1}, which is not the required value for this field. The field will not be processed.";
    public static final String JPXDECODE_FILTER_DECODING = "JPXDecode filter decoding into the bit map is not supported. The stream data would be left in JPEG2000 format";
    public static final String MD5_IS_NOT_FIPS_COMPLIANT = "MD5 hash algorithm is not FIPS compliant. However we still use this algorithm since it is required according to the PDF specification.";
    public static final String STRUCT_PARENT_INDEX_MISSED_AND_RECREATED = "StructParent index not found in tagged object, so index is recreated.";
    public static final String UNABLE_TO_PARSE_COLOR_WITHIN_COLORSPACE = "Unable to parse color {0} within {1} color space";
    public static final String UNCONFIRMED_EVENT = "Event for the product {0} with type {1} was reported but was not confirmed. Probably appropriate process fail";
    public static final String UNKNOWN_PRODUCT_INVOLVED = "Unknown product {0} was involved into PDF processing. It will be ignored";
    public static final String XOBJECT_STRUCT_PARENT_INDEX_MISSED_AND_RECREATED = "XObject has no StructParents index in its stream, so index is recreated";

    private KernelLogMessageConstant() {
    }
}
