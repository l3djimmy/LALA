.class public final Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;
.super Ljava/lang/Object;
.source "BouncyCastleFactoryCreator.java"


# static fields
.field private static final FACTORY_ENVIRONMENT_VARIABLE_NAME:Ljava/lang/String; = "ITEXT_BOUNCY_CASTLE_FACTORY_NAME"

.field private static final LOGGER:Lorg/slf4j/Logger;

.field private static factories:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/function/Supplier<",
            "Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;",
            ">;>;"
        }
    .end annotation
.end field

.field private static factory:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 46
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->factories:Ljava/util/Map;

    .line 50
    const-class v0, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->LOGGER:Lorg/slf4j/Logger;

    .line 53
    invoke-static {}, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->populateFactoriesMap()V

    .line 55
    const-string v0, "ITEXT_BOUNCY_CASTLE_FACTORY_NAME"

    invoke-static {v0}, Lcom/itextpdf/commons/utils/SystemUtil;->getPropertyOrEnvironmentVariable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 56
    .local v0, "factoryName":Ljava/lang/String;
    sget-object v1, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->factories:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/function/Supplier;

    .line 57
    .local v1, "systemVariableFactoryCreator":Ljava/util/function/Supplier;, "Ljava/util/function/Supplier<Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;>;"
    if-eqz v1, :cond_0

    .line 58
    invoke-static {v1}, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->tryCreateFactory(Ljava/util/function/Supplier;)V

    .line 61
    :cond_0
    sget-object v2, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->factories:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/function/Supplier;

    .line 62
    .local v3, "factorySupplier":Ljava/util/function/Supplier;, "Ljava/util/function/Supplier<Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;>;"
    sget-object v4, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->factory:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    if-eqz v4, :cond_1

    .line 63
    goto :goto_1

    .line 65
    :cond_1
    invoke-static {v3}, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->tryCreateFactory(Ljava/util/function/Supplier;)V

    .line 66
    .end local v3    # "factorySupplier":Ljava/util/function/Supplier;, "Ljava/util/function/Supplier<Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;>;"
    goto :goto_0

    .line 68
    :cond_2
    :goto_1
    sget-object v2, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->factory:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    if-nez v2, :cond_3

    .line 69
    sget-object v2, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->LOGGER:Lorg/slf4j/Logger;

    const-string v3, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 70
    new-instance v2, Lcom/itextpdf/bouncycastleconnector/BouncyCastleDefaultFactory;

    invoke-direct {v2}, Lcom/itextpdf/bouncycastleconnector/BouncyCastleDefaultFactory;-><init>()V

    sput-object v2, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->factory:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 72
    .end local v0    # "factoryName":Ljava/lang/String;
    .end local v1    # "systemVariableFactoryCreator":Ljava/util/function/Supplier;, "Ljava/util/function/Supplier<Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;>;"
    :cond_3
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    return-void
.end method

.method private static createFactory(Ljava/util/function/Supplier;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Supplier<",
            "Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;",
            ">;)V"
        }
    .end annotation

    .line 105
    .local p0, "factoryCreator":Ljava/util/function/Supplier;, "Ljava/util/function/Supplier<Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;>;"
    invoke-interface {p0}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    sput-object v0, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->factory:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 106
    return-void
.end method

.method public static getFactory()Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;
    .locals 1

    .line 93
    sget-object v0, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->factory:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    return-object v0
.end method

.method static synthetic lambda$populateFactoriesMap$0()Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;
    .locals 1

    .line 109
    new-instance v0, Lcom/itextpdf/bouncycastle/BouncyCastleFactory;

    invoke-direct {v0}, Lcom/itextpdf/bouncycastle/BouncyCastleFactory;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$populateFactoriesMap$1()Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;
    .locals 1

    .line 110
    new-instance v0, Lcom/itextpdf/bouncycastlefips/BouncyCastleFipsFactory;

    invoke-direct {v0}, Lcom/itextpdf/bouncycastlefips/BouncyCastleFipsFactory;-><init>()V

    return-object v0
.end method

.method private static populateFactoriesMap()V
    .locals 3

    .line 109
    sget-object v0, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->factories:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator$$ExternalSyntheticLambda0;-><init>()V

    const-string v2, "bouncy-castle"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    sget-object v0, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->factories:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator$$ExternalSyntheticLambda1;-><init>()V

    const-string v2, "bouncy-castle-fips"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    return-void
.end method

.method public static setFactory(Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;)V
    .locals 0
    .param p0, "newFactory"    # Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 84
    sput-object p0, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->factory:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 85
    return-void
.end method

.method private static tryCreateFactory(Ljava/util/function/Supplier;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Supplier<",
            "Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;",
            ">;)V"
        }
    .end annotation

    .line 98
    .local p0, "factoryCreator":Ljava/util/function/Supplier;, "Ljava/util/function/Supplier<Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;>;"
    :try_start_0
    invoke-static {p0}, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->createFactory(Ljava/util/function/Supplier;)V
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    goto :goto_0

    .line 99
    :catch_0
    move-exception v0

    .line 102
    :goto_0
    return-void
.end method
