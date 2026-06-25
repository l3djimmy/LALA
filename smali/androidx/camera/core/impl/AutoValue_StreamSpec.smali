.class final Landroidx/camera/core/impl/AutoValue_StreamSpec;
.super Landroidx/camera/core/impl/StreamSpec;
.source "AutoValue_StreamSpec.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;
    }
.end annotation


# instance fields
.field private final dynamicRange:Landroidx/camera/core/DynamicRange;

.field private final expectedFrameRateRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final implementationOptions:Landroidx/camera/core/impl/Config;

.field private final resolution:Landroid/util/Size;


# direct methods
.method private constructor <init>(Landroid/util/Size;Landroidx/camera/core/DynamicRange;Landroid/util/Range;Landroidx/camera/core/impl/Config;)V
    .locals 0
    .param p1, "resolution"    # Landroid/util/Size;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .param p4, "implementationOptions"    # Landroidx/camera/core/impl/Config;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            "Landroidx/camera/core/DynamicRange;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;",
            "Landroidx/camera/core/impl/Config;",
            ")V"
        }
    .end annotation

    .line 26
    .local p3, "expectedFrameRateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-direct {p0}, Landroidx/camera/core/impl/StreamSpec;-><init>()V

    .line 27
    iput-object p1, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->resolution:Landroid/util/Size;

    .line 28
    iput-object p2, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->dynamicRange:Landroidx/camera/core/DynamicRange;

    .line 29
    iput-object p3, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->expectedFrameRateRange:Landroid/util/Range;

    .line 30
    iput-object p4, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->implementationOptions:Landroidx/camera/core/impl/Config;

    .line 31
    return-void
.end method

.method synthetic constructor <init>(Landroid/util/Size;Landroidx/camera/core/DynamicRange;Landroid/util/Range;Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/AutoValue_StreamSpec$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/util/Size;
    .param p2, "x1"    # Landroidx/camera/core/DynamicRange;
    .param p3, "x2"    # Landroid/util/Range;
    .param p4, "x3"    # Landroidx/camera/core/impl/Config;
    .param p5, "x4"    # Landroidx/camera/core/impl/AutoValue_StreamSpec$1;

    .line 12
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/camera/core/impl/AutoValue_StreamSpec;-><init>(Landroid/util/Size;Landroidx/camera/core/DynamicRange;Landroid/util/Range;Landroidx/camera/core/impl/Config;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 69
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 70
    return v0

    .line 72
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/impl/StreamSpec;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 73
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/impl/StreamSpec;

    .line 74
    .local v1, "that":Landroidx/camera/core/impl/StreamSpec;
    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->resolution:Landroid/util/Size;

    invoke-virtual {v1}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/util/Size;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->dynamicRange:Landroidx/camera/core/DynamicRange;

    .line 75
    invoke-virtual {v1}, Landroidx/camera/core/impl/StreamSpec;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroidx/camera/core/DynamicRange;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->expectedFrameRateRange:Landroid/util/Range;

    .line 76
    invoke-virtual {v1}, Landroidx/camera/core/impl/StreamSpec;->getExpectedFrameRateRange()Landroid/util/Range;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->implementationOptions:Landroidx/camera/core/impl/Config;

    if-nez v3, :cond_1

    .line 77
    invoke-virtual {v1}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v3

    if-nez v3, :cond_2

    goto :goto_0

    :cond_1
    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->implementationOptions:Landroidx/camera/core/impl/Config;

    invoke-virtual {v1}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    :goto_0
    goto :goto_1

    :cond_2
    move v0, v2

    .line 74
    :goto_1
    return v0

    .line 79
    .end local v1    # "that":Landroidx/camera/core/impl/StreamSpec;
    :cond_3
    return v2
.end method

.method public getDynamicRange()Landroidx/camera/core/DynamicRange;
    .locals 1

    .line 42
    iget-object v0, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->dynamicRange:Landroidx/camera/core/DynamicRange;

    return-object v0
.end method

.method public getExpectedFrameRateRange()Landroid/util/Range;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 48
    iget-object v0, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->expectedFrameRateRange:Landroid/util/Range;

    return-object v0
.end method

.method public getImplementationOptions()Landroidx/camera/core/impl/Config;
    .locals 1

    .line 54
    iget-object v0, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->implementationOptions:Landroidx/camera/core/impl/Config;

    return-object v0
.end method

.method public getResolution()Landroid/util/Size;
    .locals 1

    .line 36
    iget-object v0, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->resolution:Landroid/util/Size;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 84
    const/4 v0, 0x1

    .line 85
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 86
    iget-object v2, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->resolution:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 87
    mul-int/2addr v0, v1

    .line 88
    iget-object v2, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->dynamicRange:Landroidx/camera/core/DynamicRange;

    invoke-virtual {v2}, Landroidx/camera/core/DynamicRange;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 89
    mul-int/2addr v0, v1

    .line 90
    iget-object v2, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->expectedFrameRateRange:Landroid/util/Range;

    invoke-virtual {v2}, Landroid/util/Range;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 91
    mul-int/2addr v0, v1

    .line 92
    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->implementationOptions:Landroidx/camera/core/impl/Config;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->implementationOptions:Landroidx/camera/core/impl/Config;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    xor-int/2addr v0, v1

    .line 93
    return v0
.end method

.method public toBuilder()Landroidx/camera/core/impl/StreamSpec$Builder;
    .locals 2

    .line 98
    new-instance v0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;-><init>(Landroidx/camera/core/impl/StreamSpec;Landroidx/camera/core/impl/AutoValue_StreamSpec$1;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "StreamSpec{resolution="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->resolution:Landroid/util/Size;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", dynamicRange="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->dynamicRange:Landroidx/camera/core/DynamicRange;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", expectedFrameRateRange="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->expectedFrameRateRange:Landroid/util/Range;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", implementationOptions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec;->implementationOptions:Landroidx/camera/core/impl/Config;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
