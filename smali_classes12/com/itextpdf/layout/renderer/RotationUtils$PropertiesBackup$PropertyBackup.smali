.class Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;
.super Ljava/lang/Object;
.source "RotationUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PropertyBackup"
.end annotation


# instance fields
.field private isOwnedByRender:Z

.field private propertyValue:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Z)V
    .locals 0
    .param p1, "propertyValue"    # Ljava/lang/Object;
    .param p2, "isOwnedByRender"    # Z

    .line 207
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 208
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;->propertyValue:Ljava/lang/Object;

    .line 209
    iput-boolean p2, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;->isOwnedByRender:Z

    .line 210
    return-void
.end method


# virtual methods
.method public getValue()Ljava/lang/Object;
    .locals 1

    .line 213
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;->propertyValue:Ljava/lang/Object;

    return-object v0
.end method

.method public isOwnedByRender()Z
    .locals 1

    .line 217
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;->isOwnedByRender:Z

    return v0
.end method
