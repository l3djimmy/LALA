.class final Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;
.super Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal;
.source "AutoValue_FileOutputOptions_FileOutputOptionsInternal.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;
    }
.end annotation


# instance fields
.field private final durationLimitMillis:J

.field private final file:Ljava/io/File;

.field private final fileSizeLimit:J

.field private final location:Landroid/location/Location;


# direct methods
.method private constructor <init>(JJLandroid/location/Location;Ljava/io/File;)V
    .locals 0
    .param p1, "fileSizeLimit"    # J
    .param p3, "durationLimitMillis"    # J
    .param p5, "location"    # Landroid/location/Location;
    .param p6, "file"    # Ljava/io/File;

    .line 26
    invoke-direct {p0}, Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal;-><init>()V

    .line 27
    iput-wide p1, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->fileSizeLimit:J

    .line 28
    iput-wide p3, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->durationLimitMillis:J

    .line 29
    iput-object p5, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->location:Landroid/location/Location;

    .line 30
    iput-object p6, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->file:Ljava/io/File;

    .line 31
    return-void
.end method

.method synthetic constructor <init>(JJLandroid/location/Location;Ljava/io/File;Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$1;)V
    .locals 0
    .param p1, "x0"    # J
    .param p3, "x1"    # J
    .param p5, "x2"    # Landroid/location/Location;
    .param p6, "x3"    # Ljava/io/File;
    .param p7, "x4"    # Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$1;

    .line 12
    invoke-direct/range {p0 .. p6}, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;-><init>(JJLandroid/location/Location;Ljava/io/File;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "o"    # Ljava/lang/Object;

    .line 69
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 70
    return v0

    .line 72
    :cond_0
    instance-of v1, p1, Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 73
    move-object v1, p1

    check-cast v1, Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal;

    .line 74
    .local v1, "that":Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal;
    iget-wide v3, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->fileSizeLimit:J

    invoke-virtual {v1}, Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal;->getFileSizeLimit()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_2

    iget-wide v3, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->durationLimitMillis:J

    .line 75
    invoke-virtual {v1}, Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal;->getDurationLimitMillis()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_2

    iget-object v3, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->location:Landroid/location/Location;

    if-nez v3, :cond_1

    .line 76
    invoke-virtual {v1}, Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal;->getLocation()Landroid/location/Location;

    move-result-object v3

    if-nez v3, :cond_2

    goto :goto_0

    :cond_1
    iget-object v3, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->location:Landroid/location/Location;

    invoke-virtual {v1}, Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal;->getLocation()Landroid/location/Location;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/location/Location;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    :goto_0
    iget-object v3, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->file:Ljava/io/File;

    .line 77
    invoke-virtual {v1}, Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal;->getFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    move v0, v2

    .line 74
    :goto_1
    return v0

    .line 79
    .end local v1    # "that":Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal;
    :cond_3
    return v2
.end method

.method getDurationLimitMillis()J
    .locals 2

    .line 42
    iget-wide v0, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->durationLimitMillis:J

    return-wide v0
.end method

.method getFile()Ljava/io/File;
    .locals 1

    .line 54
    iget-object v0, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->file:Ljava/io/File;

    return-object v0
.end method

.method getFileSizeLimit()J
    .locals 2

    .line 36
    iget-wide v0, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->fileSizeLimit:J

    return-wide v0
.end method

.method getLocation()Landroid/location/Location;
    .locals 1

    .line 48
    iget-object v0, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->location:Landroid/location/Location;

    return-object v0
.end method

.method public hashCode()I
    .locals 7

    .line 84
    const/4 v0, 0x1

    .line 85
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 86
    iget-wide v2, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->fileSizeLimit:J

    const/16 v4, 0x20

    ushr-long/2addr v2, v4

    iget-wide v5, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->fileSizeLimit:J

    xor-long/2addr v2, v5

    long-to-int v2, v2

    xor-int/2addr v0, v2

    .line 87
    mul-int/2addr v0, v1

    .line 88
    iget-wide v2, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->durationLimitMillis:J

    ushr-long/2addr v2, v4

    iget-wide v4, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->durationLimitMillis:J

    xor-long/2addr v2, v4

    long-to-int v2, v2

    xor-int/2addr v0, v2

    .line 89
    mul-int/2addr v0, v1

    .line 90
    iget-object v2, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->location:Landroid/location/Location;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->location:Landroid/location/Location;

    invoke-virtual {v2}, Landroid/location/Location;->hashCode()I

    move-result v2

    :goto_0
    xor-int/2addr v0, v2

    .line 91
    mul-int/2addr v0, v1

    .line 92
    iget-object v1, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 93
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FileOutputOptionsInternal{fileSizeLimit="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->fileSizeLimit:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", durationLimitMillis="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->durationLimitMillis:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", location="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->location:Landroid/location/Location;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", file="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;->file:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
