.class public Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling$TilingType;
.super Ljava/lang/Object;
.source "PdfPattern.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TilingType"
.end annotation


# static fields
.field public static final CONSTANT_SPACING:I = 0x1

.field public static final CONSTANT_SPACING_AND_FASTER_TILING:I = 0x3

.field public static final NO_DISTORTION:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
