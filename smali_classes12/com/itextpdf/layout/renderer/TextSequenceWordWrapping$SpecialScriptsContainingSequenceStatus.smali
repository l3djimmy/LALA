.class final enum Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;
.super Ljava/lang/Enum;
.source "TextSequenceWordWrapping.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "SpecialScriptsContainingSequenceStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

.field public static final enum FORCED_SPLIT:Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

.field public static final enum MOVE_SEQUENCE_CONTAINING_SPECIAL_SCRIPTS_ON_NEXT_LINE:Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

.field public static final enum MOVE_TO_PREVIOUS_TEXT_RENDERER_CONTAINING_SPECIAL_SCRIPTS:Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 707
    new-instance v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    const-string v1, "MOVE_SEQUENCE_CONTAINING_SPECIAL_SCRIPTS_ON_NEXT_LINE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;->MOVE_SEQUENCE_CONTAINING_SPECIAL_SCRIPTS_ON_NEXT_LINE:Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    .line 708
    new-instance v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    const-string v1, "MOVE_TO_PREVIOUS_TEXT_RENDERER_CONTAINING_SPECIAL_SCRIPTS"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;->MOVE_TO_PREVIOUS_TEXT_RENDERER_CONTAINING_SPECIAL_SCRIPTS:Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    .line 709
    new-instance v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    const-string v1, "FORCED_SPLIT"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;->FORCED_SPLIT:Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    .line 706
    sget-object v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;->MOVE_SEQUENCE_CONTAINING_SPECIAL_SCRIPTS_ON_NEXT_LINE:Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    sget-object v1, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;->MOVE_TO_PREVIOUS_TEXT_RENDERER_CONTAINING_SPECIAL_SCRIPTS:Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    sget-object v2, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;->FORCED_SPLIT:Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    filled-new-array {v0, v1, v2}, [Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;->$VALUES:[Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 706
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 706
    const-class v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;
    .locals 1

    .line 706
    sget-object v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;->$VALUES:[Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    return-object v0
.end method
