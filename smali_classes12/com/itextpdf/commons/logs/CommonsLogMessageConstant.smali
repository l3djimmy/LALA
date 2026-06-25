.class public final Lcom/itextpdf/commons/logs/CommonsLogMessageConstant;
.super Ljava/lang/Object;
.source "CommonsLogMessageConstant.java"


# static fields
.field public static final BASE_64_EXCEPTION:Ljava/lang/String; = "Exception during base64 encoding or decoding."

.field public static final INVALID_STATISTICS_NAME:Ljava/lang/String; = "Statistics name {0} is invalid. Cannot find corresponding statistics aggregator."

.field public static final LOCAL_FILE_COMPRESSION_FAILED:Ljava/lang/String; = "Cannot archive files into zip. Exception message: {0}."

.field public static final RATIO_IS_HIGHLY_SUSPICIOUS:Ljava/lang/String; = "Ratio between compressed and uncompressed data is highly suspicious, looks like a Zip Bomb Attack. Threshold ratio is {0}."

.field public static final TOO_MUCH_ENTRIES_IN_ARCHIVE:Ljava/lang/String; = "Too much entries in this archive, can lead to inodes exhaustion of the system, looks like a Zip Bomb Attack. Threshold number of file entries is {0}."

.field public static final UNABLE_TO_DESERIALIZE_JSON:Ljava/lang/String; = "Unable to deserialize json. Exception {0} was thrown with the message: {1}."

.field public static final UNABLE_TO_SERIALIZE_OBJECT:Ljava/lang/String; = "Unable to serialize object. Exception {0} was thrown with the message: {1}."

.field public static final UNCOMPRESSED_DATA_SIZE_IS_TOO_MUCH:Ljava/lang/String; = "The uncompressed data size is too much for the application resource capacity, looks like a Zip Bomb Attack. Threshold size is {0}."

.field public static final UNKNOWN_PLACEHOLDER_WAS_IGNORED:Ljava/lang/String; = "Unknown placeholder {0} was ignored"

.field public static final UNREPORTED_EVENT:Ljava/lang/String; = "Event for the product {0} with type {1} attempted to be confirmed but it had not been reported yet. Probably appropriate process fail"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    return-void
.end method
