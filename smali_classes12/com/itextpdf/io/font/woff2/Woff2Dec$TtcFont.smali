.class Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;
.super Ljava/lang/Object;
.source "Woff2Dec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/woff2/Woff2Dec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TtcFont"
.end annotation


# instance fields
.field public dst_offset:I

.field public flavor:I

.field public header_checksum:I

.field public table_indices:[S


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/io/font/woff2/Woff2Dec$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/io/font/woff2/Woff2Dec$1;

    .line 85
    invoke-direct {p0}, Lcom/itextpdf/io/font/woff2/Woff2Dec$TtcFont;-><init>()V

    return-void
.end method
