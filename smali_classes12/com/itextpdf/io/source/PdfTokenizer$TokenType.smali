.class public final enum Lcom/itextpdf/io/source/PdfTokenizer$TokenType;
.super Ljava/lang/Enum;
.source "PdfTokenizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/source/PdfTokenizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TokenType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/itextpdf/io/source/PdfTokenizer$TokenType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

.field public static final enum Comment:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

.field public static final enum EndArray:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

.field public static final enum EndDic:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

.field public static final enum EndObj:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

.field public static final enum EndOfFile:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

.field public static final enum Name:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

.field public static final enum Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

.field public static final enum Obj:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

.field public static final enum Other:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

.field public static final enum Ref:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

.field public static final enum StartArray:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

.field public static final enum StartDic:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

.field public static final enum String:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 39
    new-instance v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    const-string v1, "Number"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 40
    new-instance v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    const-string v1, "String"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->String:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 41
    new-instance v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    const-string v1, "Name"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Name:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 42
    new-instance v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    const-string v1, "Comment"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Comment:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 43
    new-instance v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    const-string v1, "StartArray"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->StartArray:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 44
    new-instance v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    const-string v1, "EndArray"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndArray:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 45
    new-instance v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    const-string v1, "StartDic"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->StartDic:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 46
    new-instance v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    const-string v1, "EndDic"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndDic:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 47
    new-instance v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    const-string v1, "Ref"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Ref:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 48
    new-instance v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    const-string v1, "Obj"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Obj:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 49
    new-instance v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    const-string v1, "EndObj"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndObj:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 50
    new-instance v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    const-string v1, "Other"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Other:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 51
    new-instance v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    const-string v1, "EndOfFile"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndOfFile:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 38
    sget-object v3, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v4, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->String:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v5, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Name:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v6, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Comment:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v7, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->StartArray:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v8, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndArray:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v9, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->StartDic:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v10, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndDic:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v11, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Ref:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v12, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Obj:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v13, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndObj:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v14, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Other:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v15, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndOfFile:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    filled-new-array/range {v3 .. v15}, [Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->$VALUES:[Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/itextpdf/io/source/PdfTokenizer$TokenType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 38
    const-class v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    return-object v0
.end method

.method public static values()[Lcom/itextpdf/io/source/PdfTokenizer$TokenType;
    .locals 1

    .line 38
    sget-object v0, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->$VALUES:[Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    invoke-virtual {v0}, [Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    return-object v0
.end method
