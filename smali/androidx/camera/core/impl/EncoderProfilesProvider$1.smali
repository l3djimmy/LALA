.class Landroidx/camera/core/impl/EncoderProfilesProvider$1;
.super Ljava/lang/Object;
.source "EncoderProfilesProvider.java"

# interfaces
.implements Landroidx/camera/core/impl/EncoderProfilesProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/EncoderProfilesProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAll(I)Landroidx/camera/core/impl/EncoderProfilesProxy;
    .locals 1
    .param p1, "quality"    # I

    .line 57
    const/4 v0, 0x0

    return-object v0
.end method

.method public hasProfile(I)Z
    .locals 1
    .param p1, "quality"    # I

    .line 51
    const/4 v0, 0x0

    return v0
.end method
