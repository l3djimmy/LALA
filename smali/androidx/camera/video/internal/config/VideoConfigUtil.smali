.class public final Landroidx/camera/video/internal/config/VideoConfigUtil;
.super Ljava/lang/Object;
.source "VideoConfigUtil.java"


# static fields
.field private static final MIME_TO_DATA_SPACE_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "VideoConfigUtil"


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 76
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroidx/camera/video/internal/config/VideoConfigUtil;->MIME_TO_DATA_SPACE_MAP:Ljava/util/Map;

    .line 87
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 89
    .local v0, "profHevcMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_UNSPECIFIED:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_HLG:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    const/16 v3, 0x1000

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sget-object v4, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const/16 v4, 0x2000

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    sget-object v5, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 97
    .local v5, "profAv1Map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    sget-object v6, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_UNSPECIFIED:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v5, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    sget-object v6, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_HLG:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v5, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v6, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v5, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v6, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v5, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 104
    .local v6, "profVp9Map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    sget-object v7, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_UNSPECIFIED:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v7, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_HLG:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v1, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    const/16 v1, 0x4000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v3, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v1, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_UNSPECIFIED:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_HLG:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    sget-object v1, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    const v1, 0x8000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 116
    .local v1, "profDvMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    const/16 v2, 0x100

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_HLG:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    const/16 v2, 0x200

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT709:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    sget-object v2, Landroidx/camera/video/internal/config/VideoConfigUtil;->MIME_TO_DATA_SPACE_MAP:Ljava/util/Map;

    const-string/jumbo v3, "video/hevc"

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v2, Landroidx/camera/video/internal/config/VideoConfigUtil;->MIME_TO_DATA_SPACE_MAP:Ljava/util/Map;

    const-string/jumbo v3, "video/av01"

    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    sget-object v2, Landroidx/camera/video/internal/config/VideoConfigUtil;->MIME_TO_DATA_SPACE_MAP:Ljava/util/Map;

    const-string/jumbo v3, "video/x-vnd.on2.vp9"

    invoke-interface {v2, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v2, Landroidx/camera/video/internal/config/VideoConfigUtil;->MIME_TO_DATA_SPACE_MAP:Ljava/util/Map;

    const-string/jumbo v3, "video/dolby-vision"

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .end local v0    # "profHevcMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    .end local v1    # "profDvMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    .end local v5    # "profAv1Map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    .end local v6    # "profVp9Map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    return-void
.end method

.method private static getDynamicRangeDefaultMime(Landroidx/camera/core/DynamicRange;)Ljava/lang/String;
    .locals 3
    .param p0, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 217
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 231
    :pswitch_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unsupported dynamic range: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nNo supported default mime type available."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 220
    :pswitch_1
    const-string/jumbo v0, "video/dolby-vision"

    return-object v0

    .line 226
    :pswitch_2
    const-string/jumbo v0, "video/hevc"

    return-object v0

    .line 229
    :pswitch_3
    const-string/jumbo v0, "video/avc"

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static mimeAndProfileToEncoderDataSpace(Ljava/lang/String;I)Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;
    .locals 3
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "codecProfileLevel"    # I

    .line 318
    sget-object v0, Landroidx/camera/video/internal/config/VideoConfigUtil;->MIME_TO_DATA_SPACE_MAP:Ljava/util/Map;

    .line 319
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 320
    .local v0, "profileToDataSpaceMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    if-eqz v0, :cond_0

    .line 321
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    .line 322
    .local v1, "dataSpace":Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;
    if-eqz v1, :cond_0

    .line 323
    return-object v1

    .line 327
    .end local v1    # "dataSpace":Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;
    :cond_0
    nop

    .line 328
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {p0, v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 327
    const-string/jumbo v2, "Unsupported mime type %s or profile level %d. Data space is unspecified."

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "VideoConfigUtil"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    sget-object v1, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_UNSPECIFIED:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    return-object v1
.end method

.method public static resolveVideoEncoderConfig(Landroidx/camera/video/internal/config/VideoMimeInfo;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/VideoSpec;Landroid/util/Size;Landroidx/camera/core/DynamicRange;Landroid/util/Range;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    .locals 13
    .param p0, "videoMimeInfo"    # Landroidx/camera/video/internal/config/VideoMimeInfo;
    .param p1, "inputTimebase"    # Landroidx/camera/core/impl/Timebase;
    .param p2, "videoSpec"    # Landroidx/camera/video/VideoSpec;
    .param p3, "surfaceSize"    # Landroid/util/Size;
    .param p4, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/internal/config/VideoMimeInfo;",
            "Landroidx/camera/core/impl/Timebase;",
            "Landroidx/camera/video/VideoSpec;",
            "Landroid/util/Size;",
            "Landroidx/camera/core/DynamicRange;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroidx/camera/video/internal/encoder/VideoEncoderConfig;"
        }
    .end annotation

    .line 253
    .local p5, "expectedFrameRateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/VideoMimeInfo;->getCompatibleVideoProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    move-result-object v5

    .line 254
    .local v5, "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    if-eqz v5, :cond_0

    .line 255
    new-instance v0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;

    .line 256
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/VideoMimeInfo;->getMimeType()Ljava/lang/String;

    move-result-object v1

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    invoke-direct/range {v0 .. v7}, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;-><init>(Ljava/lang/String;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/VideoSpec;Landroid/util/Size;Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;Landroidx/camera/core/DynamicRange;Landroid/util/Range;)V

    .local v0, "configSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/encoder/VideoEncoderConfig;>;"
    goto :goto_0

    .line 259
    .end local v0    # "configSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/encoder/VideoEncoderConfig;>;"
    :cond_0
    new-instance v6, Landroidx/camera/video/internal/config/VideoEncoderConfigDefaultResolver;

    invoke-virtual {p0}, Landroidx/camera/video/internal/config/VideoMimeInfo;->getMimeType()Ljava/lang/String;

    move-result-object v7

    move-object v8, p1

    move-object v9, p2

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    invoke-direct/range {v6 .. v12}, Landroidx/camera/video/internal/config/VideoEncoderConfigDefaultResolver;-><init>(Ljava/lang/String;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/VideoSpec;Landroid/util/Size;Landroidx/camera/core/DynamicRange;Landroid/util/Range;)V

    move-object v0, v6

    .line 263
    .restart local v0    # "configSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/encoder/VideoEncoderConfig;>;"
    :goto_0
    invoke-interface {v0}, Landroidx/core/util/Supplier;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    return-object v1
.end method

.method public static resolveVideoMimeInfo(Landroidx/camera/video/MediaSpec;Landroidx/camera/core/DynamicRange;Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;)Landroidx/camera/video/internal/config/VideoMimeInfo;
    .locals 13
    .param p0, "mediaSpec"    # Landroidx/camera/video/MediaSpec;
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .param p2, "encoderProfiles"    # Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    .line 141
    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->isFullySpecified()Z

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Dynamic range must be a fully specified dynamic range [provided dynamic range: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 143
    invoke-virtual {p0}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v0

    invoke-static {v0}, Landroidx/camera/video/MediaSpec;->outputFormatToVideoMime(I)Ljava/lang/String;

    move-result-object v0

    .line 144
    .local v0, "mediaSpecVideoMime":Ljava/lang/String;
    move-object v1, v0

    .line 145
    .local v1, "resolvedVideoMime":Ljava/lang/String;
    const/4 v3, 0x0

    .line 146
    .local v3, "compatibleVideoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    const/4 v4, -0x1

    const-string v5, ", dynamic range: "

    const-string/jumbo v6, "VideoConfigUtil"

    if-eqz p2, :cond_3

    .line 147
    nop

    .line 148
    invoke-static {p1}, Landroidx/camera/video/internal/utils/DynamicRangeUtil;->dynamicRangeToVideoProfileHdrFormats(Landroidx/camera/core/DynamicRange;)Ljava/util/Set;

    move-result-object v7

    .line 149
    .local v7, "encoderHdrFormats":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    nop

    .line 150
    invoke-static {p1}, Landroidx/camera/video/internal/utils/DynamicRangeUtil;->dynamicRangeToVideoProfileBitDepth(Landroidx/camera/core/DynamicRange;)Ljava/util/Set;

    move-result-object v8

    .line 153
    .local v8, "encoderBitDepths":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-virtual {p2}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getVideoProfiles()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_0
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 155
    .local v10, "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    invoke-virtual {v10}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHdrFormat()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v7, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 156
    invoke-virtual {v10}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getBitDepth()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v8, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 157
    goto :goto_0

    .line 163
    :cond_1
    invoke-virtual {v10}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getMediaType()Ljava/lang/String;

    move-result-object v11

    .line 164
    .local v11, "videoProfileMime":Ljava/lang/String;
    invoke-static {v0, v11}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 165
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "MediaSpec video mime matches EncoderProfiles. Using EncoderProfiles to derive VIDEO settings [mime type: "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 168
    :cond_2
    invoke-virtual {p0}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v12

    if-ne v12, v4, :cond_0

    .line 169
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "MediaSpec contains OUTPUT_FORMAT_AUTO. Using CamcorderProfile to derive VIDEO settings [mime type: "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    :goto_1
    move-object v3, v10

    .line 177
    move-object v1, v11

    .line 178
    nop

    .line 182
    .end local v7    # "encoderHdrFormats":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v8    # "encoderBitDepths":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v10    # "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .end local v11    # "videoProfileMime":Ljava/lang/String;
    :cond_3
    if-nez v3, :cond_6

    .line 183
    invoke-virtual {p0}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v7

    if-ne v7, v4, :cond_4

    .line 186
    invoke-static {p1}, Landroidx/camera/video/internal/config/VideoConfigUtil;->getDynamicRangeDefaultMime(Landroidx/camera/core/DynamicRange;)Ljava/lang/String;

    move-result-object v1

    .line 189
    :cond_4
    if-nez p2, :cond_5

    .line 190
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No EncoderProfiles present. May rely on fallback defaults to derive VIDEO settings [chosen mime type: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 194
    :cond_5
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No video EncoderProfile is compatible with requested output format and dynamic range. May rely on fallback defaults to derive VIDEO settings [chosen mime type: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    :cond_6
    :goto_2
    invoke-static {v1}, Landroidx/camera/video/internal/config/VideoMimeInfo;->builder(Ljava/lang/String;)Landroidx/camera/video/internal/config/VideoMimeInfo$Builder;

    move-result-object v2

    .line 202
    .local v2, "mimeInfoBuilder":Landroidx/camera/video/internal/config/VideoMimeInfo$Builder;
    if-eqz v3, :cond_7

    .line 203
    invoke-virtual {v2, v3}, Landroidx/camera/video/internal/config/VideoMimeInfo$Builder;->setCompatibleVideoProfile(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;)Landroidx/camera/video/internal/config/VideoMimeInfo$Builder;

    .line 206
    :cond_7
    invoke-virtual {v2}, Landroidx/camera/video/internal/config/VideoMimeInfo$Builder;->build()Landroidx/camera/video/internal/config/VideoMimeInfo;

    move-result-object v4

    return-object v4
.end method

.method static scaleAndClampBitrate(IIIIIIIIILandroid/util/Range;)I
    .locals 28
    .param p0, "baseBitrate"    # I
    .param p1, "actualBitDepth"    # I
    .param p2, "baseBitDepth"    # I
    .param p3, "actualFrameRate"    # I
    .param p4, "baseFrameRate"    # I
    .param p5, "actualWidth"    # I
    .param p6, "baseWidth"    # I
    .param p7, "actualHeight"    # I
    .param p8, "baseHeight"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIIIIIIII",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 274
    .local p9, "clampedRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    move-object/from16 v0, p9

    new-instance v1, Landroid/util/Rational;

    move/from16 v2, p1

    move/from16 v3, p2

    invoke-direct {v1, v2, v3}, Landroid/util/Rational;-><init>(II)V

    .line 276
    .local v1, "bitDepthRatio":Landroid/util/Rational;
    new-instance v4, Landroid/util/Rational;

    move/from16 v5, p3

    move/from16 v6, p4

    invoke-direct {v4, v5, v6}, Landroid/util/Rational;-><init>(II)V

    .line 281
    .local v4, "frameRateRatio":Landroid/util/Rational;
    new-instance v7, Landroid/util/Rational;

    move/from16 v8, p5

    move/from16 v9, p6

    invoke-direct {v7, v8, v9}, Landroid/util/Rational;-><init>(II)V

    .line 282
    .local v7, "widthRatio":Landroid/util/Rational;
    new-instance v10, Landroid/util/Rational;

    move/from16 v11, p7

    move/from16 v12, p8

    invoke-direct {v10, v11, v12}, Landroid/util/Rational;-><init>(II)V

    .line 283
    .local v10, "heightRatio":Landroid/util/Rational;
    move/from16 v13, p0

    int-to-double v14, v13

    .line 284
    invoke-virtual {v1}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v16

    mul-double v14, v14, v16

    invoke-virtual {v4}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v16

    mul-double v14, v14, v16

    .line 285
    invoke-virtual {v7}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v16

    mul-double v14, v14, v16

    invoke-virtual {v10}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v16

    mul-double v14, v14, v16

    double-to-int v14, v14

    .line 287
    .local v14, "resolvedBitrate":I
    const-string v15, ""

    .line 288
    .local v15, "debugString":Ljava/lang/String;
    move-object/from16 v16, v1

    .end local v1    # "bitDepthRatio":Landroid/util/Rational;
    .local v16, "bitDepthRatio":Landroid/util/Rational;
    const-string/jumbo v1, "VideoConfigUtil"

    invoke-static {v1}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_0

    .line 289
    nop

    .line 291
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    .line 292
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    .line 293
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    .line 294
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    filled-new-array/range {v18 .. v27}, [Ljava/lang/Object;

    move-result-object v2

    .line 289
    const-string v3, "Base Bitrate(%dbps) * Bit Depth Ratio (%d / %d) * Frame Rate Ratio(%d / %d) * Width Ratio(%d / %d) * Height Ratio(%d / %d) = %d"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    .line 297
    :cond_0
    sget-object v2, Landroidx/camera/video/VideoSpec;->BITRATE_RANGE_AUTO:Landroid/util/Range;

    invoke-virtual {v2, v0}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 299
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/util/Range;->clamp(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v14

    .line 300
    invoke-static {v1}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 301
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 302
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v0, v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 301
    const-string v0, "\nClamped to range %s -> %dbps"

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 305
    :cond_1
    invoke-static {v1, v15}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    return v14
.end method
