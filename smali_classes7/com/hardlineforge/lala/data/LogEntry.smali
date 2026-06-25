.class public final Lcom/hardlineforge/lala/data/LogEntry;
.super Ljava/lang/Object;
.source "Entities.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0006\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0002\u0008)\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0087\u0008\u0018\u00002\u00020\u0001B\u0083\u0001\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0008\u0012\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\u0008\u0012\n\u0008\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\u0006\u0010\u000c\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\r\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u000e\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0011\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\t\u0010&\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\'\u001a\u00020\u0005H\u00c6\u0003J\t\u0010(\u001a\u00020\u0003H\u00c6\u0003J\u0010\u0010)\u001a\u0004\u0018\u00010\u0008H\u00c6\u0003\u00a2\u0006\u0002\u0010\u001aJ\u0010\u0010*\u001a\u0004\u0018\u00010\u0008H\u00c6\u0003\u00a2\u0006\u0002\u0010\u001aJ\u0010\u0010+\u001a\u0004\u0018\u00010\u000bH\u00c6\u0003\u00a2\u0006\u0002\u0010\u001eJ\t\u0010,\u001a\u00020\u0003H\u00c6\u0003J\u000b\u0010-\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003J\t\u0010.\u001a\u00020\u0003H\u00c6\u0003J\t\u0010/\u001a\u00020\u0003H\u00c6\u0003J\t\u00100\u001a\u00020\u0005H\u00c6\u0003J\t\u00101\u001a\u00020\u0005H\u00c6\u0003J\u008e\u0001\u00102\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00032\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00082\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\u00082\n\u0008\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b2\u0008\u0008\u0002\u0010\u000c\u001a\u00020\u00032\n\u0008\u0002\u0010\r\u001a\u0004\u0018\u00010\u00032\u0008\u0008\u0002\u0010\u000e\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0011\u001a\u00020\u0005H\u00c6\u0001\u00a2\u0006\u0002\u00103J\u0013\u00104\u001a\u0002052\u0008\u00106\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u00107\u001a\u000208H\u00d6\u0001J\t\u00109\u001a\u00020\u0003H\u00d6\u0001R\u0016\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0016\u0010\u0017R\u0011\u0010\u0006\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0018\u0010\u0015R\u0015\u0010\u0007\u001a\u0004\u0018\u00010\u0008\u00a2\u0006\n\n\u0002\u0010\u001b\u001a\u0004\u0008\u0019\u0010\u001aR\u0015\u0010\t\u001a\u0004\u0018\u00010\u0008\u00a2\u0006\n\n\u0002\u0010\u001b\u001a\u0004\u0008\u001c\u0010\u001aR\u0015\u0010\n\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\n\n\u0002\u0010\u001f\u001a\u0004\u0008\u001d\u0010\u001eR\u0011\u0010\u000c\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008 \u0010\u0015R\u0013\u0010\r\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008!\u0010\u0015R\u0011\u0010\u000e\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\"\u0010\u0015R\u0011\u0010\u000f\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008#\u0010\u0015R\u0011\u0010\u0010\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008$\u0010\u0017R\u0011\u0010\u0011\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008%\u0010\u0017\u00a8\u0006:"
    }
    d2 = {
        "Lcom/hardlineforge/lala/data/LogEntry;",
        "",
        "id",
        "",
        "timestamp",
        "Ljava/time/Instant;",
        "timezone",
        "gpsLat",
        "",
        "gpsLon",
        "gpsAccuracy",
        "",
        "category",
        "locationName",
        "comment",
        "tags",
        "createdAt",
        "updatedAt",
        "<init>",
        "(Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;)V",
        "getId",
        "()Ljava/lang/String;",
        "getTimestamp",
        "()Ljava/time/Instant;",
        "getTimezone",
        "getGpsLat",
        "()Ljava/lang/Double;",
        "Ljava/lang/Double;",
        "getGpsLon",
        "getGpsAccuracy",
        "()Ljava/lang/Float;",
        "Ljava/lang/Float;",
        "getCategory",
        "getLocationName",
        "getComment",
        "getTags",
        "getCreatedAt",
        "getUpdatedAt",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "component7",
        "component8",
        "component9",
        "component10",
        "component11",
        "component12",
        "copy",
        "(Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;)Lcom/hardlineforge/lala/data/LogEntry;",
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
.field private final category:Ljava/lang/String;

.field private final comment:Ljava/lang/String;

.field private final createdAt:Ljava/time/Instant;

.field private final gpsAccuracy:Ljava/lang/Float;

.field private final gpsLat:Ljava/lang/Double;

.field private final gpsLon:Ljava/lang/Double;

.field private final id:Ljava/lang/String;

.field private final locationName:Ljava/lang/String;

.field private final tags:Ljava/lang/String;

.field private final timestamp:Ljava/time/Instant;

.field private final timezone:Ljava/lang/String;

.field private final updatedAt:Ljava/time/Instant;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/data/LogEntry;->$stable:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "timestamp"    # Ljava/time/Instant;
    .param p3, "timezone"    # Ljava/lang/String;
    .param p4, "gpsLat"    # Ljava/lang/Double;
    .param p5, "gpsLon"    # Ljava/lang/Double;
    .param p6, "gpsAccuracy"    # Ljava/lang/Float;
    .param p7, "category"    # Ljava/lang/String;
    .param p8, "locationName"    # Ljava/lang/String;
    .param p9, "comment"    # Ljava/lang/String;
    .param p10, "tags"    # Ljava/lang/String;
    .param p11, "createdAt"    # Ljava/time/Instant;
    .param p12, "updatedAt"    # Ljava/time/Instant;

    const-string v0, "id"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "timestamp"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "timezone"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "category"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "comment"

    invoke-static {p9, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tags"

    invoke-static {p10, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "createdAt"

    invoke-static {p11, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "updatedAt"

    invoke-static {p12, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/hardlineforge/lala/data/LogEntry;->id:Ljava/lang/String;

    .line 10
    iput-object p2, p0, Lcom/hardlineforge/lala/data/LogEntry;->timestamp:Ljava/time/Instant;

    .line 11
    iput-object p3, p0, Lcom/hardlineforge/lala/data/LogEntry;->timezone:Ljava/lang/String;

    .line 12
    iput-object p4, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLat:Ljava/lang/Double;

    .line 13
    iput-object p5, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLon:Ljava/lang/Double;

    .line 14
    iput-object p6, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsAccuracy:Ljava/lang/Float;

    .line 15
    iput-object p7, p0, Lcom/hardlineforge/lala/data/LogEntry;->category:Ljava/lang/String;

    .line 16
    iput-object p8, p0, Lcom/hardlineforge/lala/data/LogEntry;->locationName:Ljava/lang/String;

    .line 17
    iput-object p9, p0, Lcom/hardlineforge/lala/data/LogEntry;->comment:Ljava/lang/String;

    .line 18
    iput-object p10, p0, Lcom/hardlineforge/lala/data/LogEntry;->tags:Ljava/lang/String;

    .line 19
    iput-object p11, p0, Lcom/hardlineforge/lala/data/LogEntry;->createdAt:Ljava/time/Instant;

    .line 20
    iput-object p12, p0, Lcom/hardlineforge/lala/data/LogEntry;->updatedAt:Ljava/time/Instant;

    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 16

    .line 8
    move/from16 v0, p13

    and-int/lit8 v1, v0, 0x1

    if-eqz v1, :cond_0

    .line 9
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "toString(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v4, v1

    goto :goto_0

    .line 8
    :cond_0
    move-object/from16 v4, p1

    :goto_0
    and-int/lit8 v1, v0, 0x2

    const-string v2, "now(...)"

    if-eqz v1, :cond_1

    .line 10
    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object v1

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v5, v1

    goto :goto_1

    .line 8
    :cond_1
    move-object/from16 v5, p2

    :goto_1
    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_2

    .line 11
    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v1

    invoke-virtual {v1}, Ljava/time/ZoneId;->getId()Ljava/lang/String;

    move-result-object v1

    const-string v3, "getId(...)"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v6, v1

    goto :goto_2

    .line 8
    :cond_2
    move-object/from16 v6, p3

    :goto_2
    and-int/lit8 v1, v0, 0x8

    const/4 v3, 0x0

    if-eqz v1, :cond_3

    .line 12
    move-object v7, v3

    goto :goto_3

    .line 8
    :cond_3
    move-object/from16 v7, p4

    :goto_3
    and-int/lit8 v1, v0, 0x10

    if-eqz v1, :cond_4

    .line 13
    move-object v8, v3

    goto :goto_4

    .line 8
    :cond_4
    move-object/from16 v8, p5

    :goto_4
    and-int/lit8 v1, v0, 0x20

    if-eqz v1, :cond_5

    .line 14
    move-object v9, v3

    goto :goto_5

    .line 8
    :cond_5
    move-object/from16 v9, p6

    :goto_5
    and-int/lit16 v1, v0, 0x80

    if-eqz v1, :cond_6

    .line 16
    move-object v11, v3

    goto :goto_6

    .line 8
    :cond_6
    move-object/from16 v11, p8

    :goto_6
    and-int/lit16 v1, v0, 0x200

    if-eqz v1, :cond_7

    .line 18
    const-string v1, ""

    move-object v13, v1

    goto :goto_7

    .line 8
    :cond_7
    move-object/from16 v13, p10

    :goto_7
    and-int/lit16 v1, v0, 0x400

    if-eqz v1, :cond_8

    .line 19
    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object v1

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v14, v1

    goto :goto_8

    .line 8
    :cond_8
    move-object/from16 v14, p11

    :goto_8
    and-int/lit16 v0, v0, 0x800

    if-eqz v0, :cond_9

    .line 20
    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v15, v0

    goto :goto_9

    .line 8
    :cond_9
    move-object/from16 v15, p12

    :goto_9
    move-object/from16 v3, p0

    move-object/from16 v10, p7

    move-object/from16 v12, p9

    invoke-direct/range {v3 .. v15}, Lcom/hardlineforge/lala/data/LogEntry;-><init>(Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;)V

    .line 21
    return-void
.end method

.method public static synthetic copy$default(Lcom/hardlineforge/lala/data/LogEntry;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;ILjava/lang/Object;)Lcom/hardlineforge/lala/data/LogEntry;
    .locals 0

    and-int/lit8 p14, p13, 0x1

    if-eqz p14, :cond_0

    iget-object p1, p0, Lcom/hardlineforge/lala/data/LogEntry;->id:Ljava/lang/String;

    :cond_0
    and-int/lit8 p14, p13, 0x2

    if-eqz p14, :cond_1

    iget-object p2, p0, Lcom/hardlineforge/lala/data/LogEntry;->timestamp:Ljava/time/Instant;

    :cond_1
    and-int/lit8 p14, p13, 0x4

    if-eqz p14, :cond_2

    iget-object p3, p0, Lcom/hardlineforge/lala/data/LogEntry;->timezone:Ljava/lang/String;

    :cond_2
    and-int/lit8 p14, p13, 0x8

    if-eqz p14, :cond_3

    iget-object p4, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLat:Ljava/lang/Double;

    :cond_3
    and-int/lit8 p14, p13, 0x10

    if-eqz p14, :cond_4

    iget-object p5, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLon:Ljava/lang/Double;

    :cond_4
    and-int/lit8 p14, p13, 0x20

    if-eqz p14, :cond_5

    iget-object p6, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsAccuracy:Ljava/lang/Float;

    :cond_5
    and-int/lit8 p14, p13, 0x40

    if-eqz p14, :cond_6

    iget-object p7, p0, Lcom/hardlineforge/lala/data/LogEntry;->category:Ljava/lang/String;

    :cond_6
    and-int/lit16 p14, p13, 0x80

    if-eqz p14, :cond_7

    iget-object p8, p0, Lcom/hardlineforge/lala/data/LogEntry;->locationName:Ljava/lang/String;

    :cond_7
    and-int/lit16 p14, p13, 0x100

    if-eqz p14, :cond_8

    iget-object p9, p0, Lcom/hardlineforge/lala/data/LogEntry;->comment:Ljava/lang/String;

    :cond_8
    and-int/lit16 p14, p13, 0x200

    if-eqz p14, :cond_9

    iget-object p10, p0, Lcom/hardlineforge/lala/data/LogEntry;->tags:Ljava/lang/String;

    :cond_9
    and-int/lit16 p14, p13, 0x400

    if-eqz p14, :cond_a

    iget-object p11, p0, Lcom/hardlineforge/lala/data/LogEntry;->createdAt:Ljava/time/Instant;

    :cond_a
    and-int/lit16 p13, p13, 0x800

    if-eqz p13, :cond_b

    iget-object p12, p0, Lcom/hardlineforge/lala/data/LogEntry;->updatedAt:Ljava/time/Instant;

    :cond_b
    move-object p13, p11

    move-object p14, p12

    move-object p11, p9

    move-object p12, p10

    move-object p9, p7

    move-object p10, p8

    move-object p7, p5

    move-object p8, p6

    move-object p5, p3

    move-object p6, p4

    move-object p3, p1

    move-object p4, p2

    move-object p2, p0

    invoke-virtual/range {p2 .. p14}, Lcom/hardlineforge/lala/data/LogEntry;->copy(Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;)Lcom/hardlineforge/lala/data/LogEntry;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->id:Ljava/lang/String;

    return-object v0
.end method

.method public final component10()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->tags:Ljava/lang/String;

    return-object v0
.end method

.method public final component11()Ljava/time/Instant;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->createdAt:Ljava/time/Instant;

    return-object v0
.end method

.method public final component12()Ljava/time/Instant;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->updatedAt:Ljava/time/Instant;

    return-object v0
.end method

.method public final component2()Ljava/time/Instant;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->timestamp:Ljava/time/Instant;

    return-object v0
.end method

.method public final component3()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->timezone:Ljava/lang/String;

    return-object v0
.end method

.method public final component4()Ljava/lang/Double;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLat:Ljava/lang/Double;

    return-object v0
.end method

.method public final component5()Ljava/lang/Double;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLon:Ljava/lang/Double;

    return-object v0
.end method

.method public final component6()Ljava/lang/Float;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsAccuracy:Ljava/lang/Float;

    return-object v0
.end method

.method public final component7()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->category:Ljava/lang/String;

    return-object v0
.end method

.method public final component8()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->locationName:Ljava/lang/String;

    return-object v0
.end method

.method public final component9()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->comment:Ljava/lang/String;

    return-object v0
.end method

.method public final copy(Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;)Lcom/hardlineforge/lala/data/LogEntry;
    .locals 14

    const-string v0, "id"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "timestamp"

    move-object/from16 v3, p2

    invoke-static {v3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "timezone"

    move-object/from16 v4, p3

    invoke-static {v4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "category"

    move-object/from16 v8, p7

    invoke-static {v8, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "comment"

    move-object/from16 v10, p9

    invoke-static {v10, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tags"

    move-object/from16 v11, p10

    invoke-static {v11, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "createdAt"

    move-object/from16 v12, p11

    invoke-static {v12, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "updatedAt"

    move-object/from16 v13, p12

    invoke-static {v13, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lcom/hardlineforge/lala/data/LogEntry;

    move-object v2, p1

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v9, p8

    invoke-direct/range {v1 .. v13}, Lcom/hardlineforge/lala/data/LogEntry;-><init>(Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;)V

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/hardlineforge/lala/data/LogEntry;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/hardlineforge/lala/data/LogEntry;

    iget-object v3, p0, Lcom/hardlineforge/lala/data/LogEntry;->id:Ljava/lang/String;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/LogEntry;->id:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    return v2

    :cond_2
    iget-object v3, p0, Lcom/hardlineforge/lala/data/LogEntry;->timestamp:Ljava/time/Instant;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/LogEntry;->timestamp:Ljava/time/Instant;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    return v2

    :cond_3
    iget-object v3, p0, Lcom/hardlineforge/lala/data/LogEntry;->timezone:Ljava/lang/String;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/LogEntry;->timezone:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    return v2

    :cond_4
    iget-object v3, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLat:Ljava/lang/Double;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/LogEntry;->gpsLat:Ljava/lang/Double;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    return v2

    :cond_5
    iget-object v3, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLon:Ljava/lang/Double;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/LogEntry;->gpsLon:Ljava/lang/Double;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    return v2

    :cond_6
    iget-object v3, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsAccuracy:Ljava/lang/Float;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/LogEntry;->gpsAccuracy:Ljava/lang/Float;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    return v2

    :cond_7
    iget-object v3, p0, Lcom/hardlineforge/lala/data/LogEntry;->category:Ljava/lang/String;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/LogEntry;->category:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    return v2

    :cond_8
    iget-object v3, p0, Lcom/hardlineforge/lala/data/LogEntry;->locationName:Ljava/lang/String;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/LogEntry;->locationName:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    return v2

    :cond_9
    iget-object v3, p0, Lcom/hardlineforge/lala/data/LogEntry;->comment:Ljava/lang/String;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/LogEntry;->comment:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    return v2

    :cond_a
    iget-object v3, p0, Lcom/hardlineforge/lala/data/LogEntry;->tags:Ljava/lang/String;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/LogEntry;->tags:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_b

    return v2

    :cond_b
    iget-object v3, p0, Lcom/hardlineforge/lala/data/LogEntry;->createdAt:Ljava/time/Instant;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/LogEntry;->createdAt:Ljava/time/Instant;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_c

    return v2

    :cond_c
    iget-object v3, p0, Lcom/hardlineforge/lala/data/LogEntry;->updatedAt:Ljava/time/Instant;

    iget-object v1, v1, Lcom/hardlineforge/lala/data/LogEntry;->updatedAt:Ljava/time/Instant;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    return v2

    :cond_d
    return v0
.end method

.method public final getCategory()Ljava/lang/String;
    .locals 1

    .line 15
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->category:Ljava/lang/String;

    return-object v0
.end method

.method public final getComment()Ljava/lang/String;
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->comment:Ljava/lang/String;

    return-object v0
.end method

.method public final getCreatedAt()Ljava/time/Instant;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->createdAt:Ljava/time/Instant;

    return-object v0
.end method

.method public final getGpsAccuracy()Ljava/lang/Float;
    .locals 1

    .line 14
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsAccuracy:Ljava/lang/Float;

    return-object v0
.end method

.method public final getGpsLat()Ljava/lang/Double;
    .locals 1

    .line 12
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLat:Ljava/lang/Double;

    return-object v0
.end method

.method public final getGpsLon()Ljava/lang/Double;
    .locals 1

    .line 13
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLon:Ljava/lang/Double;

    return-object v0
.end method

.method public final getId()Ljava/lang/String;
    .locals 1

    .line 9
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->id:Ljava/lang/String;

    return-object v0
.end method

.method public final getLocationName()Ljava/lang/String;
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->locationName:Ljava/lang/String;

    return-object v0
.end method

.method public final getTags()Ljava/lang/String;
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->tags:Ljava/lang/String;

    return-object v0
.end method

.method public final getTimestamp()Ljava/time/Instant;
    .locals 1

    .line 10
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->timestamp:Ljava/time/Instant;

    return-object v0
.end method

.method public final getTimezone()Ljava/lang/String;
    .locals 1

    .line 11
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->timezone:Ljava/lang/String;

    return-object v0
.end method

.method public final getUpdatedAt()Ljava/time/Instant;
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->updatedAt:Ljava/time/Instant;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->id:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->timestamp:Ljava/time/Instant;

    invoke-virtual {v2}, Ljava/time/Instant;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->timezone:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLat:Ljava/lang/Double;

    const/4 v3, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLat:Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_0
    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLon:Ljava/lang/Double;

    if-nez v2, :cond_1

    move v2, v3

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLon:Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsAccuracy:Ljava/lang/Float;

    if-nez v2, :cond_2

    move v2, v3

    goto :goto_2

    :cond_2
    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsAccuracy:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_2
    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->category:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->locationName:Ljava/lang/String;

    if-nez v2, :cond_3

    goto :goto_3

    :cond_3
    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->locationName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_3
    add-int/2addr v1, v3

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->comment:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->tags:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->createdAt:Ljava/time/Instant;

    invoke-virtual {v2}, Ljava/time/Instant;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->updatedAt:Ljava/time/Instant;

    invoke-virtual {v2}, Ljava/time/Instant;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 14

    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntry;->id:Ljava/lang/String;

    iget-object v1, p0, Lcom/hardlineforge/lala/data/LogEntry;->timestamp:Ljava/time/Instant;

    iget-object v2, p0, Lcom/hardlineforge/lala/data/LogEntry;->timezone:Ljava/lang/String;

    iget-object v3, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLat:Ljava/lang/Double;

    iget-object v4, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsLon:Ljava/lang/Double;

    iget-object v5, p0, Lcom/hardlineforge/lala/data/LogEntry;->gpsAccuracy:Ljava/lang/Float;

    iget-object v6, p0, Lcom/hardlineforge/lala/data/LogEntry;->category:Ljava/lang/String;

    iget-object v7, p0, Lcom/hardlineforge/lala/data/LogEntry;->locationName:Ljava/lang/String;

    iget-object v8, p0, Lcom/hardlineforge/lala/data/LogEntry;->comment:Ljava/lang/String;

    iget-object v9, p0, Lcom/hardlineforge/lala/data/LogEntry;->tags:Ljava/lang/String;

    iget-object v10, p0, Lcom/hardlineforge/lala/data/LogEntry;->createdAt:Ljava/time/Instant;

    iget-object v11, p0, Lcom/hardlineforge/lala/data/LogEntry;->updatedAt:Ljava/time/Instant;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "LogEntry(id="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v12, ", timestamp="

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", timezone="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", gpsLat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", gpsLon="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", gpsAccuracy="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", category="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", locationName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", comment="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", tags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", createdAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", updatedAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
