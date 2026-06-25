.class Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;
.super Ljava/lang/Object;
.source "Woff2Dec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/woff2/Woff2Dec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Woff2Header"
.end annotation


# instance fields
.field public compressed_length:I

.field public compressed_offset:I

.field public flavor:I

.field public header_version:I

.field public num_tables:S

.field public tables:[Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

.field public ttc_fonts:[Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;

.field public uncompressed_size:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/io/font/woff2/Woff2Dec$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/io/font/woff2/Woff2Dec$1;

    .line 92
    invoke-direct {p0}, Lcom/itextpdf/io/font/woff2/Woff2Dec$Woff2Header;-><init>()V

    return-void
.end method
