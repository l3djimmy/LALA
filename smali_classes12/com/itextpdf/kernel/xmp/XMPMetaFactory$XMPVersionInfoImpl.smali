.class final Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;
.super Ljava/lang/Object;
.source "XMPMetaFactory.java"

# interfaces
.implements Lcom/itextpdf/kernel/xmp/XMPVersionInfo;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/xmp/XMPMetaFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "XMPVersionInfoImpl"
.end annotation


# instance fields
.field private final debug:Z

.field private final engBuild:I

.field private final major:I

.field private final message:Ljava/lang/String;

.field private final micro:I

.field private final minor:I


# direct methods
.method public constructor <init>(IIIIZLjava/lang/String;)V
    .locals 0
    .param p1, "major"    # I
    .param p2, "minor"    # I
    .param p3, "micro"    # I
    .param p4, "engBuild"    # I
    .param p5, "debug"    # Z
    .param p6, "message"    # Ljava/lang/String;

    .line 283
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 284
    iput p1, p0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;->major:I

    .line 285
    iput p2, p0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;->minor:I

    .line 286
    iput p3, p0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;->micro:I

    .line 287
    iput p4, p0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;->engBuild:I

    .line 288
    iput-boolean p5, p0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;->debug:Z

    .line 289
    iput-object p6, p0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;->message:Ljava/lang/String;

    .line 290
    return-void
.end method


# virtual methods
.method public getBuild()I
    .locals 1

    .line 309
    iget v0, p0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;->engBuild:I

    return v0
.end method

.method public getMajor()I
    .locals 1

    .line 293
    iget v0, p0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;->major:I

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 313
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getMicro()I
    .locals 1

    .line 301
    iget v0, p0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;->micro:I

    return v0
.end method

.method public getMinor()I
    .locals 1

    .line 297
    iget v0, p0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;->minor:I

    return v0
.end method

.method public isDebug()Z
    .locals 1

    .line 305
    iget-boolean v0, p0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;->debug:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 317
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/XMPMetaFactory$XMPVersionInfoImpl;->message:Ljava/lang/String;

    return-object v0
.end method
