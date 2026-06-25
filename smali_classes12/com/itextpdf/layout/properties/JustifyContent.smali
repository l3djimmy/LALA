.class public final enum Lcom/itextpdf/layout/properties/JustifyContent;
.super Ljava/lang/Enum;
.source "JustifyContent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/JustifyContent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/JustifyContent;

.field public static final enum CENTER:Lcom/itextpdf/layout/properties/JustifyContent;

.field public static final enum END:Lcom/itextpdf/layout/properties/JustifyContent;

.field public static final enum FLEX_END:Lcom/itextpdf/layout/properties/JustifyContent;

.field public static final enum FLEX_START:Lcom/itextpdf/layout/properties/JustifyContent;

.field public static final enum LEFT:Lcom/itextpdf/layout/properties/JustifyContent;

.field public static final enum NORMAL:Lcom/itextpdf/layout/properties/JustifyContent;

.field public static final enum RIGHT:Lcom/itextpdf/layout/properties/JustifyContent;

.field public static final enum SELF_END:Lcom/itextpdf/layout/properties/JustifyContent;

.field public static final enum SELF_START:Lcom/itextpdf/layout/properties/JustifyContent;

.field public static final enum START:Lcom/itextpdf/layout/properties/JustifyContent;

.field public static final enum STRETCH:Lcom/itextpdf/layout/properties/JustifyContent;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 29
    new-instance v0, Lcom/itextpdf/layout/properties/JustifyContent;

    const-string v1, "CENTER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/JustifyContent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/JustifyContent;->CENTER:Lcom/itextpdf/layout/properties/JustifyContent;

    .line 30
    new-instance v0, Lcom/itextpdf/layout/properties/JustifyContent;

    const-string v1, "START"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/JustifyContent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/JustifyContent;->START:Lcom/itextpdf/layout/properties/JustifyContent;

    .line 31
    new-instance v0, Lcom/itextpdf/layout/properties/JustifyContent;

    const-string v1, "END"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/JustifyContent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/JustifyContent;->END:Lcom/itextpdf/layout/properties/JustifyContent;

    .line 32
    new-instance v0, Lcom/itextpdf/layout/properties/JustifyContent;

    const-string v1, "SELF_START"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/JustifyContent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/JustifyContent;->SELF_START:Lcom/itextpdf/layout/properties/JustifyContent;

    .line 33
    new-instance v0, Lcom/itextpdf/layout/properties/JustifyContent;

    const-string v1, "SELF_END"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/JustifyContent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/JustifyContent;->SELF_END:Lcom/itextpdf/layout/properties/JustifyContent;

    .line 34
    new-instance v0, Lcom/itextpdf/layout/properties/JustifyContent;

    const-string v1, "FLEX_START"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/JustifyContent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/JustifyContent;->FLEX_START:Lcom/itextpdf/layout/properties/JustifyContent;

    .line 35
    new-instance v0, Lcom/itextpdf/layout/properties/JustifyContent;

    const-string v1, "FLEX_END"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/JustifyContent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/JustifyContent;->FLEX_END:Lcom/itextpdf/layout/properties/JustifyContent;

    .line 36
    new-instance v0, Lcom/itextpdf/layout/properties/JustifyContent;

    const-string v1, "LEFT"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/JustifyContent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/JustifyContent;->LEFT:Lcom/itextpdf/layout/properties/JustifyContent;

    .line 37
    new-instance v0, Lcom/itextpdf/layout/properties/JustifyContent;

    const-string v1, "RIGHT"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/JustifyContent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/JustifyContent;->RIGHT:Lcom/itextpdf/layout/properties/JustifyContent;

    .line 38
    new-instance v0, Lcom/itextpdf/layout/properties/JustifyContent;

    const-string v1, "NORMAL"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/JustifyContent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/JustifyContent;->NORMAL:Lcom/itextpdf/layout/properties/JustifyContent;

    .line 39
    new-instance v0, Lcom/itextpdf/layout/properties/JustifyContent;

    const-string v1, "STRETCH"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/JustifyContent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/JustifyContent;->STRETCH:Lcom/itextpdf/layout/properties/JustifyContent;

    .line 28
    sget-object v3, Lcom/itextpdf/layout/properties/JustifyContent;->CENTER:Lcom/itextpdf/layout/properties/JustifyContent;

    sget-object v4, Lcom/itextpdf/layout/properties/JustifyContent;->START:Lcom/itextpdf/layout/properties/JustifyContent;

    sget-object v5, Lcom/itextpdf/layout/properties/JustifyContent;->END:Lcom/itextpdf/layout/properties/JustifyContent;

    sget-object v6, Lcom/itextpdf/layout/properties/JustifyContent;->SELF_START:Lcom/itextpdf/layout/properties/JustifyContent;

    sget-object v7, Lcom/itextpdf/layout/properties/JustifyContent;->SELF_END:Lcom/itextpdf/layout/properties/JustifyContent;

    sget-object v8, Lcom/itextpdf/layout/properties/JustifyContent;->FLEX_START:Lcom/itextpdf/layout/properties/JustifyContent;

    sget-object v9, Lcom/itextpdf/layout/properties/JustifyContent;->FLEX_END:Lcom/itextpdf/layout/properties/JustifyContent;

    sget-object v10, Lcom/itextpdf/layout/properties/JustifyContent;->LEFT:Lcom/itextpdf/layout/properties/JustifyContent;

    sget-object v11, Lcom/itextpdf/layout/properties/JustifyContent;->RIGHT:Lcom/itextpdf/layout/properties/JustifyContent;

    sget-object v12, Lcom/itextpdf/layout/properties/JustifyContent;->NORMAL:Lcom/itextpdf/layout/properties/JustifyContent;

    sget-object v13, Lcom/itextpdf/layout/properties/JustifyContent;->STRETCH:Lcom/itextpdf/layout/properties/JustifyContent;

    filled-new-array/range {v3 .. v13}, [Lcom/itextpdf/layout/properties/JustifyContent;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/JustifyContent;->$VALUES:[Lcom/itextpdf/layout/properties/JustifyContent;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/JustifyContent;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 28
    const-class v0, Lcom/itextpdf/layout/properties/JustifyContent;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/JustifyContent;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/JustifyContent;
    .locals 1

    .line 28
    sget-object v0, Lcom/itextpdf/layout/properties/JustifyContent;->$VALUES:[Lcom/itextpdf/layout/properties/JustifyContent;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/JustifyContent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/JustifyContent;

    return-object v0
.end method
