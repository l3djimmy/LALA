.class public final Lcom/hardlineforge/lala/di/AppModule;
.super Ljava/lang/Object;
.source "AppModule.kt"


# annotations
.annotation runtime Ldagger/Module;
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0001\u0010\u0006\u001a\u00020\u0007H\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/hardlineforge/lala/di/AppModule;",
        "",
        "<init>",
        "()V",
        "provideDatabase",
        "Lcom/hardlineforge/lala/data/AppDatabase;",
        "ctx",
        "Landroid/content/Context;",
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

.field public static final INSTANCE:Lcom/hardlineforge/lala/di/AppModule;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/hardlineforge/lala/di/AppModule;

    invoke-direct {v0}, Lcom/hardlineforge/lala/di/AppModule;-><init>()V

    sput-object v0, Lcom/hardlineforge/lala/di/AppModule;->INSTANCE:Lcom/hardlineforge/lala/di/AppModule;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final provideDatabase(Landroid/content/Context;)Lcom/hardlineforge/lala/data/AppDatabase;
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
        .annotation runtime Ldagger/hilt/android/qualifiers/ApplicationContext;
        .end annotation
    .end param
    .annotation runtime Ldagger/Provides;
    .end annotation

    .annotation runtime Ljavax/inject/Singleton;
    .end annotation

    const-string v0, "ctx"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    const-class v0, Lcom/hardlineforge/lala/data/AppDatabase;

    const-string v1, "lala.db"

    invoke-static {p1, v0, v1}, Landroidx/room/Room;->databaseBuilder(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Landroidx/room/RoomDatabase$Builder;

    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroidx/room/RoomDatabase$Builder;->fallbackToDestructiveMigration()Landroidx/room/RoomDatabase$Builder;

    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroidx/room/RoomDatabase$Builder;->build()Landroidx/room/RoomDatabase;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/data/AppDatabase;

    return-object v0
.end method
