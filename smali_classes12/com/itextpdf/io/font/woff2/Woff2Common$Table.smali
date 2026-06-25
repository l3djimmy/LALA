.class public Lcom/itextpdf/io/font/woff2/Woff2Common$Table;
.super Ljava/lang/Object;
.source "Woff2Common.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/woff2/Woff2Common;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Table"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/itextpdf/io/font/woff2/Woff2Common$Table;",
        ">;"
    }
.end annotation


# instance fields
.field public dst_length:I

.field public dst_offset:I

.field public flags:I

.field public src_length:I

.field public src_offset:I

.field public tag:I

.field public transform_length:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/itextpdf/io/font/woff2/Woff2Common$Table;)I
    .locals 2
    .param p1, "o"    # Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    .line 60
    iget v0, p0, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    iget v1, p1, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->tag:I

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->compareAsUnsigned(II)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 47
    check-cast p1, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;

    invoke-virtual {p0, p1}, Lcom/itextpdf/io/font/woff2/Woff2Common$Table;->compareTo(Lcom/itextpdf/io/font/woff2/Woff2Common$Table;)I

    move-result p1

    return p1
.end method
