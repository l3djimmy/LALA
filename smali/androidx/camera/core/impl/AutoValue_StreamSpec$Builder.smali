.class final Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;
.super Landroidx/camera/core/impl/StreamSpec$Builder;
.source "AutoValue_StreamSpec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/AutoValue_StreamSpec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation


# instance fields
.field private dynamicRange:Landroidx/camera/core/DynamicRange;

.field private expectedFrameRateRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private implementationOptions:Landroidx/camera/core/impl/Config;

.field private resolution:Landroid/util/Size;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 106
    invoke-direct {p0}, Landroidx/camera/core/impl/StreamSpec$Builder;-><init>()V

    .line 107
    return-void
.end method

.method private constructor <init>(Landroidx/camera/core/impl/StreamSpec;)V
    .locals 1
    .param p1, "source"    # Landroidx/camera/core/impl/StreamSpec;

    .line 108
    invoke-direct {p0}, Landroidx/camera/core/impl/StreamSpec$Builder;-><init>()V

    .line 109
    invoke-virtual {p1}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;->resolution:Landroid/util/Size;

    .line 110
    invoke-virtual {p1}, Landroidx/camera/core/impl/StreamSpec;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;->dynamicRange:Landroidx/camera/core/DynamicRange;

    .line 111
    invoke-virtual {p1}, Landroidx/camera/core/impl/StreamSpec;->getExpectedFrameRateRange()Landroid/util/Range;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;->expectedFrameRateRange:Landroid/util/Range;

    .line 112
    invoke-virtual {p1}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;->implementationOptions:Landroidx/camera/core/impl/Config;

    .line 113
    return-void
.end method

.method synthetic constructor <init>(Landroidx/camera/core/impl/StreamSpec;Landroidx/camera/core/impl/AutoValue_StreamSpec$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/camera/core/impl/StreamSpec;
    .param p2, "x1"    # Landroidx/camera/core/impl/AutoValue_StreamSpec$1;

    .line 101
    invoke-direct {p0, p1}, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;-><init>(Landroidx/camera/core/impl/StreamSpec;)V

    return-void
.end method


# virtual methods
.method public build()Landroidx/camera/core/impl/StreamSpec;
    .locals 8

    .line 145
    const-string v0, ""

    .line 146
    .local v0, "missing":Ljava/lang/String;
    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;->resolution:Landroid/util/Size;

    if-nez v1, :cond_0

    .line 147
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " resolution"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 149
    :cond_0
    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;->dynamicRange:Landroidx/camera/core/DynamicRange;

    if-nez v1, :cond_1

    .line 150
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " dynamicRange"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 152
    :cond_1
    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;->expectedFrameRateRange:Landroid/util/Range;

    if-nez v1, :cond_2

    .line 153
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " expectedFrameRateRange"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 155
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 158
    new-instance v2, Landroidx/camera/core/impl/AutoValue_StreamSpec;

    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;->resolution:Landroid/util/Size;

    iget-object v4, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;->dynamicRange:Landroidx/camera/core/DynamicRange;

    iget-object v5, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;->expectedFrameRateRange:Landroid/util/Range;

    iget-object v6, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;->implementationOptions:Landroidx/camera/core/impl/Config;

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Landroidx/camera/core/impl/AutoValue_StreamSpec;-><init>(Landroid/util/Size;Landroidx/camera/core/DynamicRange;Landroid/util/Range;Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/AutoValue_StreamSpec$1;)V

    return-object v2

    .line 156
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

.method public setDynamicRange(Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/StreamSpec$Builder;
    .locals 2
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 124
    if-eqz p1, :cond_0

    .line 127
    iput-object p1, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;->dynamicRange:Landroidx/camera/core/DynamicRange;

    .line 128
    return-object p0

    .line 125
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null dynamicRange"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setExpectedFrameRateRange(Landroid/util/Range;)Landroidx/camera/core/impl/StreamSpec$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroidx/camera/core/impl/StreamSpec$Builder;"
        }
    .end annotation

    .line 132
    .local p1, "expectedFrameRateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    if-eqz p1, :cond_0

    .line 135
    iput-object p1, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;->expectedFrameRateRange:Landroid/util/Range;

    .line 136
    return-object p0

    .line 133
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null expectedFrameRateRange"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec$Builder;
    .locals 0
    .param p1, "implementationOptions"    # Landroidx/camera/core/impl/Config;

    .line 140
    iput-object p1, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;->implementationOptions:Landroidx/camera/core/impl/Config;

    .line 141
    return-object p0
.end method

.method public setResolution(Landroid/util/Size;)Landroidx/camera/core/impl/StreamSpec$Builder;
    .locals 2
    .param p1, "resolution"    # Landroid/util/Size;

    .line 116
    if-eqz p1, :cond_0

    .line 119
    iput-object p1, p0, Landroidx/camera/core/impl/AutoValue_StreamSpec$Builder;->resolution:Landroid/util/Size;

    .line 120
    return-object p0

    .line 117
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null resolution"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
