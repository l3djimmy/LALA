.class public Lcom/itextpdf/io/image/Jpeg2000ImageData$Parameters;
.super Ljava/lang/Object;
.source "Jpeg2000ImageData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/image/Jpeg2000ImageData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Parameters"
.end annotation


# instance fields
.field public bpcBoxData:[B

.field public colorSpecBoxes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/io/image/Jpeg2000ImageData$ColorSpecBox;",
            ">;"
        }
    .end annotation
.end field

.field public isJp2:Z

.field public isJpxBaseline:Z

.field public numOfComps:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/image/Jpeg2000ImageData$Parameters;->colorSpecBoxes:Ljava/util/List;

    .line 38
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/image/Jpeg2000ImageData$Parameters;->isJp2:Z

    .line 39
    iput-boolean v0, p0, Lcom/itextpdf/io/image/Jpeg2000ImageData$Parameters;->isJpxBaseline:Z

    return-void
.end method
