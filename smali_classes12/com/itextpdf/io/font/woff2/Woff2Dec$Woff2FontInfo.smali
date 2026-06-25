.class Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;
.super Ljava/lang/Object;
.source "Woff2Dec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/woff2/Woff2Dec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Woff2FontInfo"
.end annotation


# instance fields
.field public index_format:S

.field public num_glyphs:S

.field public num_hmetrics:S

.field public table_entry_by_tag:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public x_mins:[S


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;->table_entry_by_tag:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/io/font/woff2/Woff2Dec$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/io/font/woff2/Woff2Dec$1;

    .line 107
    invoke-direct {p0}, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;-><init>()V

    return-void
.end method
