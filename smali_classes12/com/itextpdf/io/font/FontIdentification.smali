.class public Lcom/itextpdf/io/font/FontIdentification;
.super Ljava/lang/Object;
.source "FontIdentification.java"


# instance fields
.field private panose:Ljava/lang/String;

.field private ttfUniqueId:Ljava/lang/String;

.field private ttfVersion:Ljava/lang/String;

.field private type1Xuid:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getPanose()Ljava/lang/String;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/itextpdf/io/font/FontIdentification;->panose:Ljava/lang/String;

    return-object v0
.end method

.method public getTtfUniqueId()Ljava/lang/String;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/itextpdf/io/font/FontIdentification;->ttfUniqueId:Ljava/lang/String;

    return-object v0
.end method

.method public getTtfVersion()Ljava/lang/String;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/itextpdf/io/font/FontIdentification;->ttfVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getType1Xuid()Ljava/lang/Integer;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/itextpdf/io/font/FontIdentification;->type1Xuid:Ljava/lang/Integer;

    return-object v0
.end method

.method protected setPanose(Ljava/lang/String;)V
    .locals 0
    .param p1, "panose"    # Ljava/lang/String;

    .line 70
    iput-object p1, p0, Lcom/itextpdf/io/font/FontIdentification;->panose:Ljava/lang/String;

    .line 71
    return-void
.end method

.method protected setPanose([B)V
    .locals 1
    .param p1, "panose"    # [B

    .line 66
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([B)V

    iput-object v0, p0, Lcom/itextpdf/io/font/FontIdentification;->panose:Ljava/lang/String;

    .line 67
    return-void
.end method

.method protected setTtfUniqueId(Ljava/lang/String;)V
    .locals 0
    .param p1, "ttfUniqueId"    # Ljava/lang/String;

    .line 58
    iput-object p1, p0, Lcom/itextpdf/io/font/FontIdentification;->ttfUniqueId:Ljava/lang/String;

    .line 59
    return-void
.end method

.method protected setTtfVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "ttfVersion"    # Ljava/lang/String;

    .line 54
    iput-object p1, p0, Lcom/itextpdf/io/font/FontIdentification;->ttfVersion:Ljava/lang/String;

    .line 55
    return-void
.end method

.method protected setType1Xuid(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "type1Xuid"    # Ljava/lang/Integer;

    .line 62
    iput-object p1, p0, Lcom/itextpdf/io/font/FontIdentification;->type1Xuid:Ljava/lang/Integer;

    .line 63
    return-void
.end method
