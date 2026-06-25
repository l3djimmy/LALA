.class public Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;
.super Ljava/lang/Object;
.source "PublicKeyRecipient.java"


# instance fields
.field private certificate:Ljava/security/cert/Certificate;

.field protected cms:[B

.field private permission:I


# direct methods
.method public constructor <init>(Ljava/security/cert/Certificate;I)V
    .locals 2
    .param p1, "certificate"    # Ljava/security/cert/Certificate;
    .param p2, "permission"    # I

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;->certificate:Ljava/security/cert/Certificate;

    .line 31
    const/4 v1, 0x0

    iput v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;->permission:I

    .line 33
    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;->cms:[B

    .line 36
    iput-object p1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;->certificate:Ljava/security/cert/Certificate;

    .line 37
    iput p2, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;->permission:I

    .line 38
    return-void
.end method


# virtual methods
.method public getCertificate()Ljava/security/cert/Certificate;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;->certificate:Ljava/security/cert/Certificate;

    return-object v0
.end method

.method protected getCms()[B
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;->cms:[B

    return-object v0
.end method

.method public getPermission()I
    .locals 1

    .line 45
    iget v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;->permission:I

    return v0
.end method

.method protected setCms([B)V
    .locals 0
    .param p1, "cms"    # [B

    .line 49
    iput-object p1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;->cms:[B

    .line 50
    return-void
.end method
