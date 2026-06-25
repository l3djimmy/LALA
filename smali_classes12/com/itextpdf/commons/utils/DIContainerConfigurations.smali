.class public Lcom/itextpdf/commons/utils/DIContainerConfigurations;
.super Ljava/lang/Object;
.source "DIContainerConfigurations.java"


# static fields
.field private static final DEFAULT_CONFIGURATIONS_CLASS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 34
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "com.itextpdf.forms.util.RegisterDefaultDiContainer"

    aput-object v2, v0, v1

    sput-object v0, Lcom/itextpdf/commons/utils/DIContainerConfigurations;->DEFAULT_CONFIGURATIONS_CLASS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method public static loadDefaultConfigurations()V
    .locals 5

    .line 42
    sget-object v0, Lcom/itextpdf/commons/utils/DIContainerConfigurations;->DEFAULT_CONFIGURATIONS_CLASS:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 44
    .local v3, "defaultConfigurationClass":Ljava/lang/String;
    :try_start_0
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    goto :goto_1

    .line 45
    :catch_0
    move-exception v4

    .line 42
    .end local v3    # "defaultConfigurationClass":Ljava/lang/String;
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 49
    :cond_0
    return-void
.end method
