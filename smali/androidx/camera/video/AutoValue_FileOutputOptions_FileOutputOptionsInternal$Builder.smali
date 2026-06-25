.class final Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;
.super Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal$Builder;
.source "AutoValue_FileOutputOptions_FileOutputOptionsInternal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation


# instance fields
.field private durationLimitMillis:Ljava/lang/Long;

.field private file:Ljava/io/File;

.field private fileSizeLimit:Ljava/lang/Long;

.field private location:Landroid/location/Location;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 101
    invoke-direct {p0}, Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal$Builder;-><init>()V

    .line 102
    return-void
.end method


# virtual methods
.method build()Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal;
    .locals 10

    .line 128
    const-string v0, ""

    .line 129
    .local v0, "missing":Ljava/lang/String;
    iget-object v1, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;->fileSizeLimit:Ljava/lang/Long;

    if-nez v1, :cond_0

    .line 130
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " fileSizeLimit"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 132
    :cond_0
    iget-object v1, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;->durationLimitMillis:Ljava/lang/Long;

    if-nez v1, :cond_1

    .line 133
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " durationLimitMillis"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 135
    :cond_1
    iget-object v1, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;->file:Ljava/io/File;

    if-nez v1, :cond_2

    .line 136
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " file"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 138
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 141
    new-instance v2, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;

    iget-object v1, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;->fileSizeLimit:Ljava/lang/Long;

    .line 142
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    iget-object v1, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;->durationLimitMillis:Ljava/lang/Long;

    .line 143
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    iget-object v7, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;->location:Landroid/location/Location;

    iget-object v8, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;->file:Ljava/io/File;

    const/4 v9, 0x0

    invoke-direct/range {v2 .. v9}, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal;-><init>(JJLandroid/location/Location;Ljava/io/File;Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$1;)V

    .line 141
    return-object v2

    .line 139
    :cond_3
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

.method bridge synthetic build()Landroidx/camera/video/OutputOptions$OutputOptionsInternal;
    .locals 1

    .line 96
    invoke-virtual {p0}, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;->build()Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal;

    move-result-object v0

    return-object v0
.end method

.method setDurationLimitMillis(J)Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal$Builder;
    .locals 1
    .param p1, "durationLimitMillis"    # J

    .line 110
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;->durationLimitMillis:Ljava/lang/Long;

    .line 111
    return-object p0
.end method

.method bridge synthetic setDurationLimitMillis(J)Ljava/lang/Object;
    .locals 0

    .line 96
    invoke-virtual {p0, p1, p2}, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;->setDurationLimitMillis(J)Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal$Builder;

    move-result-object p1

    return-object p1
.end method

.method setFile(Ljava/io/File;)Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal$Builder;
    .locals 2
    .param p1, "file"    # Ljava/io/File;

    .line 120
    if-eqz p1, :cond_0

    .line 123
    iput-object p1, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;->file:Ljava/io/File;

    .line 124
    return-object p0

    .line 121
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null file"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setFileSizeLimit(J)Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal$Builder;
    .locals 1
    .param p1, "fileSizeLimit"    # J

    .line 105
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;->fileSizeLimit:Ljava/lang/Long;

    .line 106
    return-object p0
.end method

.method bridge synthetic setFileSizeLimit(J)Ljava/lang/Object;
    .locals 0

    .line 96
    invoke-virtual {p0, p1, p2}, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;->setFileSizeLimit(J)Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal$Builder;

    move-result-object p1

    return-object p1
.end method

.method setLocation(Landroid/location/Location;)Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal$Builder;
    .locals 0
    .param p1, "location"    # Landroid/location/Location;

    .line 115
    iput-object p1, p0, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;->location:Landroid/location/Location;

    .line 116
    return-object p0
.end method

.method bridge synthetic setLocation(Landroid/location/Location;)Ljava/lang/Object;
    .locals 0

    .line 96
    invoke-virtual {p0, p1}, Landroidx/camera/video/AutoValue_FileOutputOptions_FileOutputOptionsInternal$Builder;->setLocation(Landroid/location/Location;)Landroidx/camera/video/FileOutputOptions$FileOutputOptionsInternal$Builder;

    move-result-object p1

    return-object p1
.end method
