.class Landroidx/camera/view/CameraController$Api30Impl;
.super Ljava/lang/Object;
.source "CameraController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/view/CameraController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Api30Impl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2004
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2005
    return-void
.end method

.method static createAttributionContext(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "attributeTag"    # Ljava/lang/String;

    .line 2011
    invoke-virtual {p0, p1}, Landroid/content/Context;->createAttributionContext(Ljava/lang/String;)Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method static getAttributionTag(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .line 2017
    invoke-virtual {p0}, Landroid/content/Context;->getAttributionTag()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
