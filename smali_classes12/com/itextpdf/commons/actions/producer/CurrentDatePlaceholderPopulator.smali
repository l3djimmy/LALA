.class Lcom/itextpdf/commons/actions/producer/CurrentDatePlaceholderPopulator;
.super Lcom/itextpdf/commons/actions/producer/AbstractFormattedPlaceholderPopulator;
.source "CurrentDatePlaceholderPopulator.java"


# static fields
.field private static final ALLOWED_PATTERNS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 73
    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0x9

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "dd"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "MM"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "MMM"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "MMMM"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string/jumbo v3, "yy"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string/jumbo v3, "yyyy"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string/jumbo v3, "ss"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "mm"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "HH"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/itextpdf/commons/actions/producer/CurrentDatePlaceholderPopulator;->ALLOWED_PATTERNS:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 77
    invoke-direct {p0}, Lcom/itextpdf/commons/actions/producer/AbstractFormattedPlaceholderPopulator;-><init>()V

    .line 79
    return-void
.end method

.method private formatDate(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "format"    # Ljava/lang/String;

    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 109
    .local v1, "formatArray":[C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_2

    .line 110
    aget-char v3, v1, v2

    const/16 v4, 0x27

    if-ne v3, v4, :cond_0

    .line 111
    invoke-virtual {p0, v2, v0, v1}, Lcom/itextpdf/commons/actions/producer/CurrentDatePlaceholderPopulator;->attachQuotedString(ILjava/lang/StringBuilder;[C)I

    move-result v2

    goto :goto_1

    .line 112
    :cond_0
    aget-char v3, v1, v2

    invoke-virtual {p0, v3}, Lcom/itextpdf/commons/actions/producer/CurrentDatePlaceholderPopulator;->isLetter(C)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 113
    invoke-direct {p0, v2, p1, v0, v1}, Lcom/itextpdf/commons/actions/producer/CurrentDatePlaceholderPopulator;->processDateComponent(ILjava/util/Date;Ljava/lang/StringBuilder;[C)I

    move-result v2

    goto :goto_1

    .line 115
    :cond_1
    aget-char v3, v1, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 109
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 119
    .end local v2    # "i":I
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private processDateComponent(ILjava/util/Date;Ljava/lang/StringBuilder;[C)I
    .locals 6
    .param p1, "index"    # I
    .param p2, "date"    # Ljava/util/Date;
    .param p3, "builder"    # Ljava/lang/StringBuilder;
    .param p4, "formatArray"    # [C

    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    .local v0, "peaceBuilder":Ljava/lang/StringBuilder;
    aget-char v1, p4, p1

    .line 125
    .local v1, "currentChar":C
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 126
    :goto_0
    add-int/lit8 v2, p1, 0x1

    array-length v3, p4

    if-ge v2, v3, :cond_0

    add-int/lit8 v2, p1, 0x1

    aget-char v2, p4, v2

    if-ne v1, v2, :cond_0

    .line 127
    add-int/lit8 p1, p1, 0x1

    .line 128
    aget-char v2, p4, p1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 130
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 131
    .local v2, "piece":Ljava/lang/String;
    sget-object v3, Lcom/itextpdf/commons/actions/producer/CurrentDatePlaceholderPopulator;->ALLOWED_PATTERNS:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 132
    invoke-static {p2, v2}, Lcom/itextpdf/commons/utils/DateTimeUtil;->format(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    return p1

    .line 134
    :cond_1
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Pattern contains unexpected component {0}"

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public populate(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p2, "parameter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 95
    .local p1, "events":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;>;"
    if-eqz p2, :cond_0

    .line 101
    invoke-static {}, Lcom/itextpdf/commons/utils/DateTimeUtil;->getCurrentTimeDate()Ljava/util/Date;

    move-result-object v0

    .line 102
    .local v0, "now":Ljava/util/Date;
    invoke-direct {p0, v0, p2}, Lcom/itextpdf/commons/actions/producer/CurrentDatePlaceholderPopulator;->formatDate(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 96
    .end local v0    # "now":Ljava/util/Date;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "currentDate"

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Invalid usage of placeholder \"{0}\": format is required"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
