.class public final enum Lcom/itextpdf/layout/properties/AlignmentPropertyValue;
.super Ljava/lang/Enum;
.source "AlignmentPropertyValue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/layout/properties/AlignmentPropertyValue;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

.field public static final enum BASELINE:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

.field public static final enum CENTER:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

.field public static final enum END:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

.field public static final enum FLEX_END:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

.field public static final enum FLEX_START:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

.field public static final enum NORMAL:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

.field public static final enum SELF_END:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

.field public static final enum SELF_START:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

.field public static final enum START:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

.field public static final enum STRETCH:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 30
    new-instance v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    const-string v1, "CENTER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->CENTER:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 31
    new-instance v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    const-string v1, "START"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->START:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 32
    new-instance v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    const-string v1, "END"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->END:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 33
    new-instance v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    const-string v1, "SELF_START"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->SELF_START:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 34
    new-instance v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    const-string v1, "SELF_END"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->SELF_END:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 35
    new-instance v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    const-string v1, "FLEX_START"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->FLEX_START:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 36
    new-instance v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    const-string v1, "FLEX_END"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->FLEX_END:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 37
    new-instance v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    const-string v1, "BASELINE"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->BASELINE:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 38
    new-instance v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    const-string v1, "STRETCH"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->STRETCH:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 39
    new-instance v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    const-string v1, "NORMAL"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->NORMAL:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 29
    sget-object v3, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->CENTER:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    sget-object v4, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->START:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    sget-object v5, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->END:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    sget-object v6, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->SELF_START:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    sget-object v7, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->SELF_END:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    sget-object v8, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->FLEX_START:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    sget-object v9, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->FLEX_END:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    sget-object v10, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->BASELINE:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    sget-object v11, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->STRETCH:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    sget-object v12, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->NORMAL:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    filled-new-array/range {v3 .. v12}, [Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->$VALUES:[Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/layout/properties/AlignmentPropertyValue;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 29
    const-class v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/layout/properties/AlignmentPropertyValue;
    .locals 1

    .line 29
    sget-object v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->$VALUES:[Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    invoke-virtual {v0}, [Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    return-object v0
.end method
