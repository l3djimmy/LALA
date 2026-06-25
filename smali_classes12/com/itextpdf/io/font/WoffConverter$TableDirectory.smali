.class Lcom/itextpdf/io/font/WoffConverter$TableDirectory;
.super Ljava/lang/Object;
.source "WoffConverter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/WoffConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TableDirectory"
.end annotation


# instance fields
.field compLength:J

.field offset:J

.field origChecksum:[B

.field origLength:[B

.field origLengthVal:J

.field outOffset:I

.field tag:[B


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 217
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 218
    const/4 v0, 0x4

    new-array v1, v0, [B

    iput-object v1, p0, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->tag:[B

    .line 221
    new-array v1, v0, [B

    iput-object v1, p0, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->origLength:[B

    .line 223
    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->origChecksum:[B

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/io/font/WoffConverter$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/io/font/WoffConverter$1;

    .line 217
    invoke-direct {p0}, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;-><init>()V

    return-void
.end method
