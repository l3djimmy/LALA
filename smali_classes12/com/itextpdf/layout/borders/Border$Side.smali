.class public final enum Lcom/itextpdf/layout/borders/Border$Side;
.super Ljava/lang/Enum;
.source "Border.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/borders/Border;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Side"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/borders/Border$Side;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/borders/Border$Side;

.field public static final enum BOTTOM:Lcom/itextpdf/layout/borders/Border$Side;

.field public static final enum LEFT:Lcom/itextpdf/layout/borders/Border$Side;

.field public static final enum NONE:Lcom/itextpdf/layout/borders/Border$Side;

.field public static final enum RIGHT:Lcom/itextpdf/layout/borders/Border$Side;

.field public static final enum TOP:Lcom/itextpdf/layout/borders/Border$Side;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 424
    new-instance v0, Lcom/itextpdf/layout/borders/Border$Side;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/borders/Border$Side;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/borders/Border$Side;->NONE:Lcom/itextpdf/layout/borders/Border$Side;

    new-instance v0, Lcom/itextpdf/layout/borders/Border$Side;

    const-string v1, "TOP"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/borders/Border$Side;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/borders/Border$Side;->TOP:Lcom/itextpdf/layout/borders/Border$Side;

    new-instance v0, Lcom/itextpdf/layout/borders/Border$Side;

    const-string v1, "RIGHT"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/borders/Border$Side;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/borders/Border$Side;->RIGHT:Lcom/itextpdf/layout/borders/Border$Side;

    new-instance v0, Lcom/itextpdf/layout/borders/Border$Side;

    const-string v1, "BOTTOM"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/borders/Border$Side;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/borders/Border$Side;->BOTTOM:Lcom/itextpdf/layout/borders/Border$Side;

    new-instance v0, Lcom/itextpdf/layout/borders/Border$Side;

    const-string v1, "LEFT"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/borders/Border$Side;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/borders/Border$Side;->LEFT:Lcom/itextpdf/layout/borders/Border$Side;

    .line 423
    sget-object v0, Lcom/itextpdf/layout/borders/Border$Side;->NONE:Lcom/itextpdf/layout/borders/Border$Side;

    sget-object v1, Lcom/itextpdf/layout/borders/Border$Side;->TOP:Lcom/itextpdf/layout/borders/Border$Side;

    sget-object v2, Lcom/itextpdf/layout/borders/Border$Side;->RIGHT:Lcom/itextpdf/layout/borders/Border$Side;

    sget-object v3, Lcom/itextpdf/layout/borders/Border$Side;->BOTTOM:Lcom/itextpdf/layout/borders/Border$Side;

    sget-object v4, Lcom/itextpdf/layout/borders/Border$Side;->LEFT:Lcom/itextpdf/layout/borders/Border$Side;

    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/itextpdf/layout/borders/Border$Side;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/borders/Border$Side;->$VALUES:[Lcom/itextpdf/layout/borders/Border$Side;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 423
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/borders/Border$Side;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 423
    const-class v0, Lcom/itextpdf/layout/borders/Border$Side;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/borders/Border$Side;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/borders/Border$Side;
    .locals 1

    .line 423
    sget-object v0, Lcom/itextpdf/layout/borders/Border$Side;->$VALUES:[Lcom/itextpdf/layout/borders/Border$Side;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/borders/Border$Side;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/borders/Border$Side;

    return-object v0
.end method
