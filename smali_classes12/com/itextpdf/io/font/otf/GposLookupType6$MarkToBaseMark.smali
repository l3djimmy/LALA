.class Lcom/itextpdf/io/font/otf/GposLookupType6$MarkToBaseMark;
.super Ljava/lang/Object;
.source "GposLookupType6.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/otf/GposLookupType6;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MarkToBaseMark"
.end annotation


# instance fields
.field public final baseMarks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[",
            "Lcom/itextpdf/io/font/otf/GposAnchor;",
            ">;"
        }
    .end annotation
.end field

.field public final marks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/io/font/otf/OtfMarkRecord;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType6$MarkToBaseMark;->marks:Ljava/util/Map;

    .line 132
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType6$MarkToBaseMark;->baseMarks:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/io/font/otf/GposLookupType6$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/io/font/otf/GposLookupType6$1;

    .line 130
    invoke-direct {p0}, Lcom/itextpdf/io/font/otf/GposLookupType6$MarkToBaseMark;-><init>()V

    return-void
.end method
