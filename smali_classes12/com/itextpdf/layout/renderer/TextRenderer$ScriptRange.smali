.class Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;
.super Ljava/lang/Object;
.source "TextRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/TextRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ScriptRange"
.end annotation


# instance fields
.field rangeEnd:I

.field script:Ljava/lang/Character$UnicodeScript;


# direct methods
.method constructor <init>(Ljava/lang/Character$UnicodeScript;I)V
    .locals 0
    .param p1, "script"    # Ljava/lang/Character$UnicodeScript;
    .param p2, "rangeEnd"    # I

    .line 1861
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1862
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->script:Ljava/lang/Character$UnicodeScript;

    .line 1863
    iput p2, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->rangeEnd:I

    .line 1864
    return-void
.end method
