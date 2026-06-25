.class final enum Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;
.super Ljava/lang/Enum;
.source "Edge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Side"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

.field public static final enum LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

.field public static final enum RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 45
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    const-string v1, "LEFT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    const-string v1, "RIGHT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 44
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    filled-new-array {v0, v1}, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 44
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 44
    const-class v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;
    .locals 1

    .line 44
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->$VALUES:[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    invoke-virtual {v0}, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    return-object v0
.end method
