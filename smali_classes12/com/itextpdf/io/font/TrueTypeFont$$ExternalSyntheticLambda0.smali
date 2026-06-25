.class public final synthetic Lcom/itextpdf/io/font/TrueTypeFont$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/itextpdf/io/font/TrueTypeFont;"
    method = "lambda$mapGlyphsCidsToGids$0"
    proto = "(Ljava/lang/Integer;)Ljava/lang/Integer;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/itextpdf/io/font/TrueTypeFont;


# direct methods
.method public synthetic constructor <init>(Lcom/itextpdf/io/font/TrueTypeFont;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/itextpdf/io/font/TrueTypeFont$$ExternalSyntheticLambda0;->f$0:Lcom/itextpdf/io/font/TrueTypeFont;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFont$$ExternalSyntheticLambda0;->f$0:Lcom/itextpdf/io/font/TrueTypeFont;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/TrueTypeFont;->lambda$mapGlyphsCidsToGids$0$com-itextpdf-io-font-TrueTypeFont(Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method
