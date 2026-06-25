.class Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;
.super Ljava/lang/Object;
.source "Woff2Dec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/woff2/Woff2Dec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RebuildMetadata"
.end annotation


# instance fields
.field checksums:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/io/font/woff2/Woff2Dec$TableChecksumInfo;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field font_infos:[Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2FontInfo;

.field header_checksum:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;->checksums:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/io/font/woff2/Woff2Dec$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/io/font/woff2/Woff2Dec$1;

    .line 116
    invoke-direct {p0}, Lcom/itextpdf/io/font/woff2/Woff2Dec$RebuildMetadata;-><init>()V

    return-void
.end method
