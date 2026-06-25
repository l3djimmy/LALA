.class public final Lcom/hardlineforge/lala/data/EditHistory;
.super Ljava/lang/Object;
.source "Entities.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0087\u0008\u0018\u00002\u00020\u0001B/\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0006\u0012\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0011\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0012\u001a\u00020\u0006H\u00c6\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003J3\u0010\u0014\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00062\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003H\u00c6\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0018\u001a\u00020\u0019H\u00d6\u0001J\t\u0010\u001a\u001a\u00020\u0003H\u00d6\u0001R\u0016\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\u000bR\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000eR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u000b\u00a8\u0006\u001b"
    }
    d2 = {
        "Lcom/hardlineforge/lala/data/EditHistory;",
        "",
        "id",
        "",
        "entryId",
        "editedAt",
        "Ljava/time/Instant;",
        "note",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;)V",
        "getId",
        "()Ljava/lang/String;",
        "getEntryId",
        "getEditedAt",
        "()Ljava/time/Instant;",
        "getNote",
        "component1",
        "component2",
        "component3",
        "component4",
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
.field private final editedAt:Ljava/time/Instant;

.field private final entryId:Ljava/lang/String;

.field private final id:Ljava/lang/String;

.field private final note:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/data/EditHistory;->$stable:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "entryId"    # Ljava/lang/String;
    .param p3, "editedAt"    # Ljava/time/Instant;
    .param p4, "note"    # Ljava/lang/String;

    const-string v0, "id"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "entryId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "editedAt"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-object p1, p0, Lcom/hardlineforge/lala/data/EditHistory;->id:Ljava/lang/String;

    .line 83
    iput-object p2, p0, Lcom/hardlineforge/lala/data/EditHistory;->entryId:Ljava/lang/String;

    .line 84
    iput-object p3, p0, Lcom/hardlineforge/lala/data/EditHistory;->editedAt:Ljava/time/Instant;

    .line 85
    iput-object p4, p0, Lcom/hardlineforge/lala/data/EditHistory;->note:Ljava/lang/String;

    .line 81
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 81
    and-int/lit8 p6, p5, 0x1

    if-eqz p6, :cond_0

    .line 82
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p6, "toString(...)"

    invoke-static {p1, p6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    :cond_0
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_1

    .line 84
    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object p3

    const-string p6, "now(...)"

    invoke-static {p3, p6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    :cond_1
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_2

    .line 85
    const/4 p4, 0x0

    .line 81
    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/hardlineforge/lala/data/EditHistory;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;)V

    .line 86
    return-void
.end method

.method public static synthetic copy$default(Lcom/hardlineforge/lala/data/EditHistory;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;ILjava/lang/Object;)Lcom/hardlineforge/lala/data/EditHistory;
    .locals 0

    and-int/lit8 p6, p5, 0x1

    if-eqz p6, :cond_0

    iget-object p1, p0, Lcom/hardlineforge/lala/data/EditHistory;->id:Ljava/lang/String;

    :cond_0
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_1

    iget-object p2, p0, Lcom/hardlineforge/lala/data/EditHistory;->entryId:Ljava/lang/String;

    :cond_1
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_2

    iget-object p3, p0, Lcom/hardlineforge/lala/data/EditHistory;->editedAt:Ljava/time/Instant;

    :cond_2
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_3

    iget-object p4, p0, Lcom/hardlineforge/lala/data/EditHistory;->note:Ljava/lang/String;

    :cond_3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/hardlineforge/lala/data/EditHistory;->copy(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;)Lcom/hardlineforge/lala/data/EditHistory;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/EditHistory;->id:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/EditHistory;->entryId:Ljava/lang/String;

    return-object v0
.end method

.method public final component3()Ljava/time/Instant;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/EditHistory;->editedAt:Ljava/time/Instant;

    return-object v0
.end method

.method public final component4()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/EditHistory;->note:Ljava/lang/String;

    return-object v0
.end method

.method public final copy(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;)Lcom/hardlineforge/lala/data/EditHistory;
    .locals 1

    const-string v0, "id"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "entryId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "editedAt"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/hardlineforge/lala/data/EditHistory;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/hardlineforge/lala/data/EditHistory;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/hardlineforge/lala/data/EditHistory;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/hardlineforge/lala/data/EditHistory;

    iget-object v3, p0, Lcom/hardlineforge/lala/data/EditHistory;->id:Ljava/lang/String;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/EditHistory;->id:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    return v2

    :cond_2
    iget-object v3, p0, Lcom/hardlineforge/lala/data/EditHistory;->entryId:Ljava/lang/String;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/EditHistory;->entryId:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    return v2

    :cond_3
    iget-object v3, p0, Lcom/hardlineforge/lala/data/EditHistory;->editedAt:Ljava/time/Instant;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/EditHistory;->editedAt:Ljava/time/Instant;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    return v2

    :cond_4
    iget-object v3, p0, Lcom/hardlineforge/lala/data/EditHistory;->note:Ljava/lang/String;

    iget-object v1, v1, Lcom/hardlineforge/lala/data/EditHistory;->note:Ljava/lang/String;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    return v0
.end method

.method public final getEditedAt()Ljava/time/Instant;
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/hardlineforge/lala/data/EditHistory;->editedAt:Ljava/time/Instant;

    return-object v0
.end method

.method public final getEntryId()Ljava/lang/String;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/hardlineforge/lala/data/EditHistory;->entryId:Ljava/lang/String;

    return-object v0
.end method

.method public final getId()Ljava/lang/String;
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/hardlineforge/lala/data/EditHistory;->id:Ljava/lang/String;

    return-object v0
.end method

.method public final getNote()Ljava/lang/String;
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/hardlineforge/lala/data/EditHistory;->note:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/hardlineforge/lala/data/EditHistory;->id:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/EditHistory;->entryId:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/EditHistory;->editedAt:Ljava/time/Instant;

    invoke-virtual {v2}, Ljava/time/Instant;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/EditHistory;->note:Ljava/lang/String;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/hardlineforge/lala/data/EditHistory;->note:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_0
    add-int/2addr v1, v2

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    iget-object v0, p0, Lcom/hardlineforge/lala/data/EditHistory;->id:Ljava/lang/String;

    iget-object v1, p0, Lcom/hardlineforge/lala/data/EditHistory;->entryId:Ljava/lang/String;

    iget-object v2, p0, Lcom/hardlineforge/lala/data/EditHistory;->editedAt:Ljava/time/Instant;

    iget-object v3, p0, Lcom/hardlineforge/lala/data/EditHistory;->note:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "EditHistory(id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ", entryId="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", editedAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", note="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
