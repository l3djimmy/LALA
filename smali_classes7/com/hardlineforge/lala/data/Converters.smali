.class public final Lcom/hardlineforge/lala/data/Converters;
.super Ljava/lang/Object;
.source "AppDatabase.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAppDatabase.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AppDatabase.kt\ncom/hardlineforge/lala/data/Converters\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,38:1\n1#2:39\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0019\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0007\u00a2\u0006\u0002\u0010\u0008J\u0019\u0010\t\u001a\u0004\u0018\u00010\u00072\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0005H\u0007\u00a2\u0006\u0002\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/hardlineforge/lala/data/Converters;",
        "",
        "<init>",
        "()V",
        "fromInstant",
        "",
        "value",
        "Ljava/time/Instant;",
        "(Ljava/time/Instant;)Ljava/lang/Long;",
        "toInstant",
        "(Ljava/lang/Long;)Ljava/time/Instant;",
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


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final fromInstant(Ljava/time/Instant;)Ljava/lang/Long;
    .locals 2
    .param p1, "value"    # Ljava/time/Instant;

    .line 33
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/time/Instant;->toEpochMilli()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public final toInstant(Ljava/lang/Long;)Ljava/time/Instant;
    .locals 3
    .param p1, "value"    # Ljava/lang/Long;

    .line 36
    if-eqz p1, :cond_0

    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 39
    .local v0, "it\\1":J
    const/4 v2, 0x0

    .line 36
    .local v2, "$i$a$-let-Converters$toInstant$1\\1\\36\\0":I
    invoke-static {v0, v1}, Ljava/time/Instant;->ofEpochMilli(J)Ljava/time/Instant;

    move-result-object v0

    .end local v0    # "it\\1":J
    .end local v2    # "$i$a$-let-Converters$toInstant$1\\1\\36\\0":I
    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method
