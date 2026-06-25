.class public final Lcom/hardlineforge/lala/data/LogRepository_Factory;
.super Ljava/lang/Object;
.source "LogRepository_Factory.java"

# interfaces
.implements Ldagger/internal/Factory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ldagger/internal/Factory<",
        "Lcom/hardlineforge/lala/data/LogRepository;",
        ">;"
    }
.end annotation


# instance fields
.field private final dbProvider:Ldagger/internal/Provider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/data/AppDatabase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ldagger/internal/Provider;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dbProvider"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/data/AppDatabase;",
            ">;)V"
        }
    .end annotation

    .line 29
    .local p1, "dbProvider":Ldagger/internal/Provider;, "Ldagger/internal/Provider<Lcom/hardlineforge/lala/data/AppDatabase;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/hardlineforge/lala/data/LogRepository_Factory;->dbProvider:Ldagger/internal/Provider;

    .line 31
    return-void
.end method

.method public static create(Ldagger/internal/Provider;)Lcom/hardlineforge/lala/data/LogRepository_Factory;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dbProvider"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ldagger/internal/Provider<",
            "Lcom/hardlineforge/lala/data/AppDatabase;",
            ">;)",
            "Lcom/hardlineforge/lala/data/LogRepository_Factory;"
        }
    .end annotation

    .line 39
    .local p0, "dbProvider":Ldagger/internal/Provider;, "Ldagger/internal/Provider<Lcom/hardlineforge/lala/data/AppDatabase;>;"
    new-instance v0, Lcom/hardlineforge/lala/data/LogRepository_Factory;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/data/LogRepository_Factory;-><init>(Ldagger/internal/Provider;)V

    return-object v0
.end method

.method public static newInstance(Lcom/hardlineforge/lala/data/AppDatabase;)Lcom/hardlineforge/lala/data/LogRepository;
    .locals 1
    .param p0, "db"    # Lcom/hardlineforge/lala/data/AppDatabase;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "db"
        }
    .end annotation

    .line 43
    new-instance v0, Lcom/hardlineforge/lala/data/LogRepository;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/data/LogRepository;-><init>(Lcom/hardlineforge/lala/data/AppDatabase;)V

    return-object v0
.end method


# virtual methods
.method public get()Lcom/hardlineforge/lala/data/LogRepository;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository_Factory;->dbProvider:Ldagger/internal/Provider;

    invoke-interface {v0}, Ldagger/internal/Provider;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/data/AppDatabase;

    invoke-static {v0}, Lcom/hardlineforge/lala/data/LogRepository_Factory;->newInstance(Lcom/hardlineforge/lala/data/AppDatabase;)Lcom/hardlineforge/lala/data/LogRepository;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .line 10
    invoke-virtual {p0}, Lcom/hardlineforge/lala/data/LogRepository_Factory;->get()Lcom/hardlineforge/lala/data/LogRepository;

    move-result-object v0

    return-object v0
.end method
