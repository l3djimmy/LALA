.class public Landroidx/camera/core/FocusMeteringAction$Builder;
.super Ljava/lang/Object;
.source "FocusMeteringAction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/FocusMeteringAction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field mAutoCancelDurationInMillis:J

.field final mMeteringPointsAe:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/MeteringPoint;",
            ">;"
        }
    .end annotation
.end field

.field final mMeteringPointsAf:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/MeteringPoint;",
            ">;"
        }
    .end annotation
.end field

.field final mMeteringPointsAwb:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/MeteringPoint;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/camera/core/FocusMeteringAction;)V
    .locals 2
    .param p1, "focusMeteringAction"    # Landroidx/camera/core/FocusMeteringAction;

    .line 192
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mMeteringPointsAf:Ljava/util/List;

    .line 161
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mMeteringPointsAe:Ljava/util/List;

    .line 163
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mMeteringPointsAwb:Ljava/util/List;

    .line 165
    const-wide/16 v0, 0x1388

    iput-wide v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mAutoCancelDurationInMillis:J

    .line 193
    iget-object v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mMeteringPointsAf:Ljava/util/List;

    invoke-virtual {p1}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAf()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 194
    iget-object v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mMeteringPointsAe:Ljava/util/List;

    invoke-virtual {p1}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAe()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 195
    iget-object v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mMeteringPointsAwb:Ljava/util/List;

    invoke-virtual {p1}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAwb()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 196
    invoke-virtual {p1}, Landroidx/camera/core/FocusMeteringAction;->getAutoCancelDurationInMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mAutoCancelDurationInMillis:J

    .line 197
    return-void
.end method

.method public constructor <init>(Landroidx/camera/core/MeteringPoint;)V
    .locals 1
    .param p1, "point"    # Landroidx/camera/core/MeteringPoint;

    .line 173
    const/4 v0, 0x7

    invoke-direct {p0, p1, v0}, Landroidx/camera/core/FocusMeteringAction$Builder;-><init>(Landroidx/camera/core/MeteringPoint;I)V

    .line 174
    return-void
.end method

.method public constructor <init>(Landroidx/camera/core/MeteringPoint;I)V
    .locals 2
    .param p1, "point"    # Landroidx/camera/core/MeteringPoint;
    .param p2, "meteringMode"    # I

    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mMeteringPointsAf:Ljava/util/List;

    .line 161
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mMeteringPointsAe:Ljava/util/List;

    .line 163
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mMeteringPointsAwb:Ljava/util/List;

    .line 165
    const-wide/16 v0, 0x1388

    iput-wide v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mAutoCancelDurationInMillis:J

    .line 185
    invoke-virtual {p0, p1, p2}, Landroidx/camera/core/FocusMeteringAction$Builder;->addPoint(Landroidx/camera/core/MeteringPoint;I)Landroidx/camera/core/FocusMeteringAction$Builder;

    .line 186
    return-void
.end method


# virtual methods
.method public addPoint(Landroidx/camera/core/MeteringPoint;)Landroidx/camera/core/FocusMeteringAction$Builder;
    .locals 1
    .param p1, "point"    # Landroidx/camera/core/MeteringPoint;

    .line 218
    const/4 v0, 0x7

    invoke-virtual {p0, p1, v0}, Landroidx/camera/core/FocusMeteringAction$Builder;->addPoint(Landroidx/camera/core/MeteringPoint;I)Landroidx/camera/core/FocusMeteringAction$Builder;

    move-result-object v0

    return-object v0
.end method

.method public addPoint(Landroidx/camera/core/MeteringPoint;I)Landroidx/camera/core/FocusMeteringAction$Builder;
    .locals 4
    .param p1, "point"    # Landroidx/camera/core/MeteringPoint;
    .param p2, "meteringMode"    # I

    .line 244
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    move v2, v0

    :goto_0
    const-string/jumbo v3, "Point cannot be null."

    invoke-static {v2, v3}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 245
    if-lt p2, v1, :cond_1

    const/4 v2, 0x7

    if-gt p2, v2, :cond_1

    move v0, v1

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid metering mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 249
    and-int/lit8 v0, p2, 0x1

    if-eqz v0, :cond_2

    .line 250
    iget-object v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mMeteringPointsAf:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 252
    :cond_2
    and-int/lit8 v0, p2, 0x2

    if-eqz v0, :cond_3

    .line 253
    iget-object v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mMeteringPointsAe:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 255
    :cond_3
    and-int/lit8 v0, p2, 0x4

    if-eqz v0, :cond_4

    .line 256
    iget-object v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mMeteringPointsAwb:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 258
    :cond_4
    return-object p0
.end method

.method public build()Landroidx/camera/core/FocusMeteringAction;
    .locals 1

    .line 310
    new-instance v0, Landroidx/camera/core/FocusMeteringAction;

    invoke-direct {v0, p0}, Landroidx/camera/core/FocusMeteringAction;-><init>(Landroidx/camera/core/FocusMeteringAction$Builder;)V

    return-object v0
.end method

.method public disableAutoCancel()Landroidx/camera/core/FocusMeteringAction$Builder;
    .locals 2

    .line 280
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mAutoCancelDurationInMillis:J

    .line 281
    return-object p0
.end method

.method public removePoints(I)Landroidx/camera/core/FocusMeteringAction$Builder;
    .locals 1
    .param p1, "meteringMode"    # I

    .line 291
    and-int/lit8 v0, p1, 0x1

    if-eqz v0, :cond_0

    .line 292
    iget-object v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mMeteringPointsAf:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 295
    :cond_0
    and-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_1

    .line 296
    iget-object v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mMeteringPointsAe:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 299
    :cond_1
    and-int/lit8 v0, p1, 0x4

    if-eqz v0, :cond_2

    .line 300
    iget-object v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mMeteringPointsAwb:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 302
    :cond_2
    return-object p0
.end method

.method public setAutoCancelDuration(JLjava/util/concurrent/TimeUnit;)Landroidx/camera/core/FocusMeteringAction$Builder;
    .locals 2
    .param p1, "duration"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .line 270
    const-wide/16 v0, 0x1

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string/jumbo v1, "autoCancelDuration must be at least 1"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 271
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/camera/core/FocusMeteringAction$Builder;->mAutoCancelDurationInMillis:J

    .line 272
    return-object p0
.end method
