.class Lcom/itextpdf/io/font/woff2/Woff2Dec$CompositeGlyphInfo;
.super Ljava/lang/Object;
.source "Woff2Dec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/woff2/Woff2Dec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CompositeGlyphInfo"
.end annotation


# instance fields
.field public have_instructions:Z

.field public size:I


# direct methods
.method public constructor <init>(IZ)V
    .locals 0
    .param p1, "size"    # I
    .param p2, "have_instructions"    # Z

    .line 383
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 384
    iput p1, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$CompositeGlyphInfo;->size:I

    .line 385
    iput-boolean p2, p0, Lcom/itextpdf/io/font/woff2/Woff2Dec$CompositeGlyphInfo;->have_instructions:Z

    .line 386
    return-void
.end method
