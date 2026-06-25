.class public final Landroidx/camera/video/FileDescriptorOutputOptions;
.super Landroidx/camera/video/OutputOptions;
.source "FileDescriptorOutputOptions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/FileDescriptorOutputOptions$FileDescriptorOutputOptionsInternal;,
        Landroidx/camera/video/FileDescriptorOutputOptions$Builder;
    }
.end annotation


# instance fields
.field private final mFileDescriptorOutputOptionsInternal:Landroidx/camera/video/FileDescriptorOutputOptions$FileDescriptorOutputOptionsInternal;


# direct methods
.method constructor <init>(Landroidx/camera/video/FileDescriptorOutputOptions$FileDescriptorOutputOptionsInternal;)V
    .locals 0
    .param p1, "fileDescriptorOutputOptionsInternal"    # Landroidx/camera/video/FileDescriptorOutputOptions$FileDescriptorOutputOptionsInternal;

    .line 46
    invoke-direct {p0, p1}, Landroidx/camera/video/OutputOptions;-><init>(Landroidx/camera/video/OutputOptions$OutputOptionsInternal;)V

    .line 47
    iput-object p1, p0, Landroidx/camera/video/FileDescriptorOutputOptions;->mFileDescriptorOutputOptionsInternal:Landroidx/camera/video/FileDescriptorOutputOptions$FileDescriptorOutputOptionsInternal;

    .line 48
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .line 70
    if-ne p0, p1, :cond_0

    .line 71
    const/4 v0, 0x1

    return v0

    .line 73
    :cond_0
    instance-of v0, p1, Landroidx/camera/video/FileDescriptorOutputOptions;

    if-nez v0, :cond_1

    .line 74
    const/4 v0, 0x0

    return v0

    .line 76
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/FileDescriptorOutputOptions;->mFileDescriptorOutputOptionsInternal:Landroidx/camera/video/FileDescriptorOutputOptions$FileDescriptorOutputOptionsInternal;

    move-object v1, p1

    check-cast v1, Landroidx/camera/video/FileDescriptorOutputOptions;

    iget-object v1, v1, Landroidx/camera/video/FileDescriptorOutputOptions;->mFileDescriptorOutputOptionsInternal:Landroidx/camera/video/FileDescriptorOutputOptions$FileDescriptorOutputOptionsInternal;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;
    .locals 1

    .line 57
    iget-object v0, p0, Landroidx/camera/video/FileDescriptorOutputOptions;->mFileDescriptorOutputOptionsInternal:Landroidx/camera/video/FileDescriptorOutputOptions$FileDescriptorOutputOptionsInternal;

    invoke-virtual {v0}, Landroidx/camera/video/FileDescriptorOutputOptions$FileDescriptorOutputOptionsInternal;->getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 82
    iget-object v0, p0, Landroidx/camera/video/FileDescriptorOutputOptions;->mFileDescriptorOutputOptionsInternal:Landroidx/camera/video/FileDescriptorOutputOptions$FileDescriptorOutputOptionsInternal;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 64
    iget-object v0, p0, Landroidx/camera/video/FileDescriptorOutputOptions;->mFileDescriptorOutputOptionsInternal:Landroidx/camera/video/FileDescriptorOutputOptions$FileDescriptorOutputOptionsInternal;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FileDescriptorOutputOptionsInternal"

    const-string v2, "FileDescriptorOutputOptions"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
