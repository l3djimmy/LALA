.class public final Lcom/hardlineforge/lala/data/CustomCategory;
.super Ljava/lang/Object;
.source "Entities.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0087\u0008\u0018\u00002\u00020\u0001B#\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\t\u0010\u000e\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u000f\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0010\u001a\u00020\u0006H\u00c6\u0003J\'\u0010\u0011\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0006H\u00c6\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0015\u001a\u00020\u0016H\u00d6\u0001J\t\u0010\u0017\u001a\u00020\u0003H\u00d6\u0001R\u0016\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u0018"
    }
    d2 = {
        "Lcom/hardlineforge/lala/data/CustomCategory;",
        "",
        "id",
        "",
        "name",
        "createdAt",
        "Ljava/time/Instant;",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;)V",
        "getId",
        "()Ljava/lang/String;",
        "getName",
        "getCreatedAt",
        "()Ljava/time/Instant;",
        "component1",
        "component2",
        "component3",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "",
        "toString",
        "app_debug"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I


# instance fields
.field private final createdAt:Ljava/time/Instant;

.field private final id:Ljava/lang/String;

.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/data/CustomCategory;->$stable:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "createdAt"    # Ljava/time/Instant;

    const-string v0, "id"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "name"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "createdAt"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput-object p1, p0, Lcom/hardlineforge/lala/data/CustomCategory;->id:Ljava/lang/String;

    .line 91
    iput-object p2, p0, Lcom/hardlineforge/lala/data/CustomCategory;->name:Ljava/lang/String;

    .line 92
    iput-object p3, p0, Lcom/hardlineforge/lala/data/CustomCategory;->createdAt:Ljava/time/Instant;

    .line 89
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 89
    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    .line 90
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p5, "toString(...)"

    invoke-static {p1, p5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    .line 92
    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object p3

    const-string p4, "now(...)"

    invoke-static {p3, p4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/hardlineforge/lala/data/CustomCategory;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;)V

    .line 93
    return-void
.end method

.method public static synthetic copy$default(Lcom/hardlineforge/lala/data/CustomCategory;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;ILjava/lang/Object;)Lcom/hardlineforge/lala/data/CustomCategory;
    .locals 0

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    iget-object p1, p0, Lcom/hardlineforge/lala/data/CustomCategory;->id:Ljava/lang/String;

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    iget-object p2, p0, Lcom/hardlineforge/lala/data/CustomCategory;->name:Ljava/lang/String;

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    iget-object p3, p0, Lcom/hardlineforge/lala/data/CustomCategory;->createdAt:Ljava/time/Instant;

    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/hardlineforge/lala/data/CustomCategory;->copy(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;)Lcom/hardlineforge/lala/data/CustomCategory;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategory;->id:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategory;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final component3()Ljava/time/Instant;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategory;->createdAt:Ljava/time/Instant;

    return-object v0
.end method

.method public final copy(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;)Lcom/hardlineforge/lala/data/CustomCategory;
    .locals 1

    const-string v0, "id"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "name"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "createdAt"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/hardlineforge/lala/data/CustomCategory;

    invoke-direct {v0, p1, p2, p3}, Lcom/hardlineforge/lala/data/CustomCategory;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/hardlineforge/lala/data/CustomCategory;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/hardlineforge/lala/data/CustomCategory;

    iget-object v3, p0, Lcom/hardlineforge/lala/data/CustomCategory;->id:Ljava/lang/String;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/CustomCategory;->id:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    return v2

    :cond_2
    iget-object v3, p0, Lcom/hardlineforge/lala/data/CustomCategory;->name:Ljava/lang/String;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/CustomCategory;->name:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    return v2

    :cond_3
    iget-object v3, p0, Lcom/hardlineforge/lala/data/CustomCategory;->createdAt:Ljava/time/Instant;

    iget-object v1, v1, Lcom/hardlineforge/lala/data/CustomCategory;->createdAt:Ljava/time/Instant;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    return v0
.end method

.method public final getCreatedAt()Ljava/time/Instant;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategory;->createdAt:Ljava/time/Instant;

    return-object v0
.end method

.method public final getId()Ljava/lang/String;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategory;->id:Ljava/lang/String;

    return-object v0
.end method

.method public final getName()Ljava/lang/String;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategory;->name:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategory;->id:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/CustomCategory;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/CustomCategory;->createdAt:Ljava/time/Instant;

    invoke-virtual {v2}, Ljava/time/Instant;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategory;->id:Ljava/lang/String;

    iget-object v1, p0, Lcom/hardlineforge/lala/data/CustomCategory;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/hardlineforge/lala/data/CustomCategory;->createdAt:Ljava/time/Instant;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CustomCategory(id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ", name="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", createdAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
