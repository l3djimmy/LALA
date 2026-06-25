.class public final Lcom/hardlineforge/lala/LalaApplication;
.super Lcom/hardlineforge/lala/Hilt_LalaApplication;
.source "LalaApplication.kt"


# annotations
.annotation runtime Ldagger/hilt/android/HiltAndroidApp;
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/hardlineforge/lala/LalaApplication;",
        "Landroid/app/Application;",
        "<init>",
        "()V",
        "app_debug"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/LalaApplication;->$stable:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Lcom/hardlineforge/lala/Hilt_LalaApplication;-><init>()V

    .line 6
    return-void
.end method
