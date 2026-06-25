.class Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;
.super Ljava/lang/Object;
.source "RotationUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/RotationUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PropertiesBackup"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;
    }
.end annotation


# instance fields
.field private propertiesBackup:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;",
            ">;"
        }
    .end annotation
.end field

.field private renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V
    .locals 1
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 158
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->propertiesBackup:Ljava/util/HashMap;

    .line 161
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 162
    return-void
.end method


# virtual methods
.method public restoreProperty(I)V
    .locals 3
    .param p1, "property"    # I

    .line 193
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->propertiesBackup:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;

    .line 194
    .local v0, "backup":Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;
    if-eqz v0, :cond_1

    .line 195
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;->isOwnedByRender()Z

    move-result v1

    .line 198
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 195
    if-eqz v1, :cond_0

    .line 196
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, p1, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    goto :goto_0

    .line 198
    :cond_0
    invoke-virtual {v2, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->deleteOwnProperty(I)V

    .line 201
    :cond_1
    :goto_0
    return-void
.end method

.method public storeBoolProperty(I)Ljava/lang/Boolean;
    .locals 5
    .param p1, "property"    # I

    .line 175
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v0

    .line 176
    .local v0, "value":Ljava/lang/Boolean;
    if-eqz v0, :cond_0

    .line 177
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->propertiesBackup:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v4, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasOwnProperty(I)Z

    move-result v4

    invoke-direct {v3, v0, v4}, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;-><init>(Ljava/lang/Object;Z)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 180
    :cond_0
    return-object v0
.end method

.method public storeFloatProperty(I)Ljava/lang/Float;
    .locals 5
    .param p1, "property"    # I

    .line 166
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    .line 167
    .local v0, "value":Ljava/lang/Float;
    if-eqz v0, :cond_0

    .line 168
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->propertiesBackup:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v4, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasOwnProperty(I)Z

    move-result v4

    invoke-direct {v3, v0, v4}, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;-><init>(Ljava/lang/Object;Z)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 171
    :cond_0
    return-object v0
.end method

.method public storeProperty(I)Ljava/lang/Object;
    .locals 5
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)TT;"
        }
    .end annotation

    .line 184
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    .line 185
    .local v0, "value":Ljava/lang/Object;, "TT;"
    if-eqz v0, :cond_0

    .line 186
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->propertiesBackup:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v4, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasOwnProperty(I)Z

    move-result v4

    invoke-direct {v3, v0, v4}, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup$PropertyBackup;-><init>(Ljava/lang/Object;Z)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/RotationUtils$PropertiesBackup;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 189
    :cond_0
    return-object v0
.end method
