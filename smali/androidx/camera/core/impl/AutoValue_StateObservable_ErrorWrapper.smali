.class final Landroidx/camera/core/impl/AutoValue_StateObservable_ErrorWrapper;
.super Landroidx/camera/core/impl/StateObservable$ErrorWrapper;
.source "AutoValue_StateObservable_ErrorWrapper.java"


# instance fields
.field private final error:Ljava/lang/Throwable;


# direct methods
.method constructor <init>(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "error"    # Ljava/lang/Throwable;

    .line 13
    invoke-direct {p0}, Landroidx/camera/core/impl/StateObservable$ErrorWrapper;-><init>()V

    .line 14
    if-eqz p1, :cond_0

    .line 17
    iput-object p1, p0, Landroidx/camera/core/impl/AutoValue_StateObservable_ErrorWrapper;->error:Ljava/lang/Throwable;

    .line 18
    return-void

    .line 15
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null error"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .line 35
    if-ne p1, p0, :cond_0

    .line 36
    const/4 v0, 0x1

    return v0

    .line 38
    :cond_0
    instance-of v0, p1, Landroidx/camera/core/impl/StateObservable$ErrorWrapper;

    if-eqz v0, :cond_1

    .line 39
    move-object v0, p1

    check-cast v0, Landroidx/camera/core/impl/StateObservable$ErrorWrapper;

    .line 40
    .local v0, "that":Landroidx/camera/core/impl/StateObservable$ErrorWrapper;
    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_StateObservable_ErrorWrapper;->error:Ljava/lang/Throwable;

    invoke-virtual {v0}, Landroidx/camera/core/impl/StateObservable$ErrorWrapper;->getError()Ljava/lang/Throwable;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 42
    .end local v0    # "that":Landroidx/camera/core/impl/StateObservable$ErrorWrapper;
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public getError()Ljava/lang/Throwable;
    .locals 1

    .line 23
    iget-object v0, p0, Landroidx/camera/core/impl/AutoValue_StateObservable_ErrorWrapper;->error:Ljava/lang/Throwable;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 47
    const/4 v0, 0x1

    .line 48
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 49
    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_StateObservable_ErrorWrapper;->error:Ljava/lang/Throwable;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 50
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ErrorWrapper{error="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_StateObservable_ErrorWrapper;->error:Ljava/lang/Throwable;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
