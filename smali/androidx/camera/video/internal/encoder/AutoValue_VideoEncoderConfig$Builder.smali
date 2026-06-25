.class final Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;
.super Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;
.source "AutoValue_VideoEncoderConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation


# instance fields
.field private IFrameInterval:Ljava/lang/Integer;

.field private bitrate:Ljava/lang/Integer;

.field private colorFormat:Ljava/lang/Integer;

.field private dataSpace:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

.field private frameRate:Ljava/lang/Integer;

.field private inputTimebase:Landroidx/camera/core/impl/Timebase;

.field private mimeType:Ljava/lang/String;

.field private profile:Ljava/lang/Integer;

.field private resolution:Landroid/util/Size;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 169
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;-><init>()V

    .line 170
    return-void
.end method


# virtual methods
.method public build()Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    .locals 13

    .line 230
    const-string v0, ""

    .line 231
    .local v0, "missing":Ljava/lang/String;
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->mimeType:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 232
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " mimeType"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 234
    :cond_0
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->profile:Ljava/lang/Integer;

    if-nez v1, :cond_1

    .line 235
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " profile"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 237
    :cond_1
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->inputTimebase:Landroidx/camera/core/impl/Timebase;

    if-nez v1, :cond_2

    .line 238
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " inputTimebase"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 240
    :cond_2
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->resolution:Landroid/util/Size;

    if-nez v1, :cond_3

    .line 241
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " resolution"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 243
    :cond_3
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->colorFormat:Ljava/lang/Integer;

    if-nez v1, :cond_4

    .line 244
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " colorFormat"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 246
    :cond_4
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->dataSpace:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    if-nez v1, :cond_5

    .line 247
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " dataSpace"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 249
    :cond_5
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->frameRate:Ljava/lang/Integer;

    if-nez v1, :cond_6

    .line 250
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " frameRate"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 252
    :cond_6
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->IFrameInterval:Ljava/lang/Integer;

    if-nez v1, :cond_7

    .line 253
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " IFrameInterval"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 255
    :cond_7
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->bitrate:Ljava/lang/Integer;

    if-nez v1, :cond_8

    .line 256
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " bitrate"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 258
    :cond_8
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 261
    new-instance v2, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig;

    iget-object v3, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->mimeType:Ljava/lang/String;

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->profile:Ljava/lang/Integer;

    .line 263
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-object v5, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->inputTimebase:Landroidx/camera/core/impl/Timebase;

    iget-object v6, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->resolution:Landroid/util/Size;

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->colorFormat:Ljava/lang/Integer;

    .line 266
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iget-object v8, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->dataSpace:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->frameRate:Ljava/lang/Integer;

    .line 268
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v9

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->IFrameInterval:Ljava/lang/Integer;

    .line 269
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v10

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->bitrate:Ljava/lang/Integer;

    .line 270
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v11

    const/4 v12, 0x0

    invoke-direct/range {v2 .. v12}, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig;-><init>(Ljava/lang/String;ILandroidx/camera/core/impl/Timebase;Landroid/util/Size;ILandroidx/camera/video/internal/encoder/VideoEncoderDataSpace;IIILandroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$1;)V

    .line 261
    return-object v2

    .line 259
    :cond_9
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Missing required properties:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setBitrate(I)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;
    .locals 1
    .param p1, "bitrate"    # I

    .line 225
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->bitrate:Ljava/lang/Integer;

    .line 226
    return-object p0
.end method

.method public setColorFormat(I)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;
    .locals 1
    .param p1, "colorFormat"    # I

    .line 202
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->colorFormat:Ljava/lang/Integer;

    .line 203
    return-object p0
.end method

.method public setDataSpace(Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;
    .locals 2
    .param p1, "dataSpace"    # Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    .line 207
    if-eqz p1, :cond_0

    .line 210
    iput-object p1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->dataSpace:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    .line 211
    return-object p0

    .line 208
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null dataSpace"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setFrameRate(I)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;
    .locals 1
    .param p1, "frameRate"    # I

    .line 215
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->frameRate:Ljava/lang/Integer;

    .line 216
    return-object p0
.end method

.method public setIFrameInterval(I)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;
    .locals 1
    .param p1, "IFrameInterval"    # I

    .line 220
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->IFrameInterval:Ljava/lang/Integer;

    .line 221
    return-object p0
.end method

.method public setInputTimebase(Landroidx/camera/core/impl/Timebase;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;
    .locals 2
    .param p1, "inputTimebase"    # Landroidx/camera/core/impl/Timebase;

    .line 186
    if-eqz p1, :cond_0

    .line 189
    iput-object p1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->inputTimebase:Landroidx/camera/core/impl/Timebase;

    .line 190
    return-object p0

    .line 187
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null inputTimebase"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMimeType(Ljava/lang/String;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;
    .locals 2
    .param p1, "mimeType"    # Ljava/lang/String;

    .line 173
    if-eqz p1, :cond_0

    .line 176
    iput-object p1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->mimeType:Ljava/lang/String;

    .line 177
    return-object p0

    .line 174
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null mimeType"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setProfile(I)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;
    .locals 1
    .param p1, "profile"    # I

    .line 181
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->profile:Ljava/lang/Integer;

    .line 182
    return-object p0
.end method

.method public setResolution(Landroid/util/Size;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;
    .locals 2
    .param p1, "resolution"    # Landroid/util/Size;

    .line 194
    if-eqz p1, :cond_0

    .line 197
    iput-object p1, p0, Landroidx/camera/video/internal/encoder/AutoValue_VideoEncoderConfig$Builder;->resolution:Landroid/util/Size;

    .line 198
    return-object p0

    .line 195
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null resolution"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
