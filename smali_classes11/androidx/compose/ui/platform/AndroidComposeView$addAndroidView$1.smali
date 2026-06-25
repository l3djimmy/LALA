.class public final Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;
.super Landroidx/core/view/AccessibilityDelegateCompat;
.source "AndroidComposeView.android.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/compose/ui/platform/AndroidComposeView;->addAndroidView(Landroidx/compose/ui/viewinterop/AndroidViewHolder;Landroidx/compose/ui/node/LayoutNode;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAndroidComposeView.android.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AndroidComposeView.android.kt\nandroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1\n+ 2 SemanticsNode.kt\nandroidx/compose/ui/semantics/SemanticsNodeKt\n+ 3 NodeKind.kt\nandroidx/compose/ui/node/Nodes\n*L\n1#1,3106:1\n484#2,3:3107\n487#2,7:3111\n91#3:3110\n*S KotlinDebug\n*F\n+ 1 AndroidComposeView.android.kt\nandroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1\n*L\n1422#1:3107,3\n1422#1:3111,7\n1422#1:3110\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "androidx/compose/ui/platform/AndroidComposeView$addAndroidView$1",
        "Landroidx/core/view/AccessibilityDelegateCompat;",
        "onInitializeAccessibilityNodeInfo",
        "",
        "host",
        "Landroid/view/View;",
        "info",
        "Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;",
        "ui_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $layoutNode:Landroidx/compose/ui/node/LayoutNode;

.field final synthetic $thisView:Landroidx/compose/ui/platform/AndroidComposeView;

.field final synthetic this$0:Landroidx/compose/ui/platform/AndroidComposeView;


# direct methods
.method constructor <init>(Landroidx/compose/ui/platform/AndroidComposeView;Landroidx/compose/ui/node/LayoutNode;Landroidx/compose/ui/platform/AndroidComposeView;)V
    .locals 0
    .param p1, "$receiver"    # Landroidx/compose/ui/platform/AndroidComposeView;
    .param p2, "$layoutNode"    # Landroidx/compose/ui/node/LayoutNode;
    .param p3, "$thisView"    # Landroidx/compose/ui/platform/AndroidComposeView;

    iput-object p1, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->this$0:Landroidx/compose/ui/platform/AndroidComposeView;

    iput-object p2, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->$layoutNode:Landroidx/compose/ui/node/LayoutNode;

    iput-object p3, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->$thisView:Landroidx/compose/ui/platform/AndroidComposeView;

    .line 1405
    invoke-direct {p0}, Landroidx/core/view/AccessibilityDelegateCompat;-><init>()V

    return-void
.end method


# virtual methods
.method public onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V
    .locals 9
    .param p1, "host"    # Landroid/view/View;
    .param p2, "info"    # Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    .line 1410
    invoke-super {p0, p1, p2}, Landroidx/core/view/AccessibilityDelegateCompat;->onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V

    .line 1416
    iget-object v0, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->this$0:Landroidx/compose/ui/platform/AndroidComposeView;

    invoke-static {v0}, Landroidx/compose/ui/platform/AndroidComposeView;->access$getComposeAccessibilityDelegate$p(Landroidx/compose/ui/platform/AndroidComposeView;)Landroidx/compose/ui/platform/AndroidComposeViewAccessibilityDelegateCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/compose/ui/platform/AndroidComposeViewAccessibilityDelegateCompat;->isEnabled$ui_release()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1417
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->setVisibleToUser(Z)V

    .line 1423
    :cond_0
    nop

    .line 1421
    iget-object v0, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->$layoutNode:Landroidx/compose/ui/node/LayoutNode;

    .line 1422
    nop

    .local v0, "$this$findClosestParentNode$iv":Landroidx/compose/ui/node/LayoutNode;
    const/4 v1, 0x0

    .line 3107
    .local v1, "$i$f$findClosestParentNode":I
    invoke-virtual {v0}, Landroidx/compose/ui/node/LayoutNode;->getParent$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v2

    .line 3108
    .local v2, "currentParent$iv":Landroidx/compose/ui/node/LayoutNode;
    :goto_0
    const/4 v3, 0x0

    if-eqz v2, :cond_2

    .line 3109
    move-object v4, v2

    .local v4, "it":Landroidx/compose/ui/node/LayoutNode;
    const/4 v5, 0x0

    .line 1422
    .local v5, "$i$a$-findClosestParentNode-AndroidComposeView$addAndroidView$1$onInitializeAccessibilityNodeInfo$parentId$1":I
    invoke-virtual {v4}, Landroidx/compose/ui/node/LayoutNode;->getNodes$ui_release()Landroidx/compose/ui/node/NodeChain;

    move-result-object v6

    const/4 v7, 0x0

    .line 3110
    .local v7, "$i$f$getSemantics-OLwlOKw":I
    const/16 v8, 0x8

    invoke-static {v8}, Landroidx/compose/ui/node/NodeKind;->constructor-impl(I)I

    move-result v7

    .line 1422
    .end local v7    # "$i$f$getSemantics-OLwlOKw":I
    invoke-virtual {v6, v7}, Landroidx/compose/ui/node/NodeChain;->has-H91voCI$ui_release(I)Z

    move-result v4

    .line 3109
    .end local v4    # "it":Landroidx/compose/ui/node/LayoutNode;
    .end local v5    # "$i$a$-findClosestParentNode-AndroidComposeView$addAndroidView$1$onInitializeAccessibilityNodeInfo$parentId$1":I
    if-eqz v4, :cond_1

    .line 3111
    goto :goto_1

    .line 3113
    :cond_1
    invoke-virtual {v2}, Landroidx/compose/ui/node/LayoutNode;->getParent$ui_release()Landroidx/compose/ui/node/LayoutNode;

    move-result-object v2

    goto :goto_0

    .line 3117
    :cond_2
    move-object v2, v3

    .line 1422
    .end local v0    # "$this$findClosestParentNode$iv":Landroidx/compose/ui/node/LayoutNode;
    .end local v1    # "$i$f$findClosestParentNode":I
    .end local v2    # "currentParent$iv":Landroidx/compose/ui/node/LayoutNode;
    :goto_1
    nop

    .line 1423
    if-eqz v2, :cond_3

    .line 1422
    nop

    .line 1423
    invoke-virtual {v2}, Landroidx/compose/ui/node/LayoutNode;->getSemanticsId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1420
    :cond_3
    nop

    .line 1424
    .local v3, "parentId":Ljava/lang/Integer;
    nop

    .line 1425
    const/4 v0, -0x1

    if-eqz v3, :cond_4

    iget-object v1, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->this$0:Landroidx/compose/ui/platform/AndroidComposeView;

    invoke-virtual {v1}, Landroidx/compose/ui/platform/AndroidComposeView;->getSemanticsOwner()Landroidx/compose/ui/semantics/SemanticsOwner;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/compose/ui/semantics/SemanticsOwner;->getUnmergedRootSemanticsNode()Landroidx/compose/ui/semantics/SemanticsNode;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/compose/ui/semantics/SemanticsNode;->getId()I

    move-result v1

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, v1, :cond_5

    .line 1427
    :cond_4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1429
    :cond_5
    iget-object v1, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->$thisView:Landroidx/compose/ui/platform/AndroidComposeView;

    check-cast v1, Landroid/view/View;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p2, v1, v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->setParent(Landroid/view/View;I)V

    .line 1430
    iget-object v1, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->$layoutNode:Landroidx/compose/ui/node/LayoutNode;

    invoke-virtual {v1}, Landroidx/compose/ui/node/LayoutNode;->getSemanticsId()I

    move-result v1

    .line 1433
    .local v1, "semanticsId":I
    iget-object v2, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->this$0:Landroidx/compose/ui/platform/AndroidComposeView;

    invoke-static {v2}, Landroidx/compose/ui/platform/AndroidComposeView;->access$getComposeAccessibilityDelegate$p(Landroidx/compose/ui/platform/AndroidComposeView;)Landroidx/compose/ui/platform/AndroidComposeViewAccessibilityDelegateCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/ui/platform/AndroidComposeViewAccessibilityDelegateCompat;->getIdToBeforeMap$ui_release()Landroidx/collection/MutableIntIntMap;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Landroidx/collection/MutableIntIntMap;->getOrDefault(II)I

    move-result v2

    .line 1432
    nop

    .line 1434
    .local v2, "beforeId":I
    if-eq v2, v0, :cond_7

    .line 1435
    iget-object v4, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->this$0:Landroidx/compose/ui/platform/AndroidComposeView;

    invoke-virtual {v4}, Landroidx/compose/ui/platform/AndroidComposeView;->getAndroidViewsHandler$ui_release()Landroidx/compose/ui/platform/AndroidViewsHandler;

    move-result-object v4

    invoke-static {v4, v2}, Landroidx/compose/ui/platform/SemanticsUtils_androidKt;->semanticsIdToView(Landroidx/compose/ui/platform/AndroidViewsHandler;I)Landroid/view/View;

    move-result-object v4

    .line 1436
    .local v4, "beforeView":Landroid/view/View;
    if-eqz v4, :cond_6

    .line 1440
    invoke-virtual {p2, v4}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->setTraversalBefore(Landroid/view/View;)V

    goto :goto_2

    .line 1444
    :cond_6
    iget-object v5, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->$thisView:Landroidx/compose/ui/platform/AndroidComposeView;

    check-cast v5, Landroid/view/View;

    invoke-virtual {p2, v5, v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->setTraversalBefore(Landroid/view/View;I)V

    .line 1446
    :goto_2
    iget-object v5, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->this$0:Landroidx/compose/ui/platform/AndroidComposeView;

    .line 1447
    nop

    .line 1448
    invoke-virtual {p2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->unwrap()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v6

    .line 1449
    iget-object v7, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->this$0:Landroidx/compose/ui/platform/AndroidComposeView;

    invoke-static {v7}, Landroidx/compose/ui/platform/AndroidComposeView;->access$getComposeAccessibilityDelegate$p(Landroidx/compose/ui/platform/AndroidComposeView;)Landroidx/compose/ui/platform/AndroidComposeViewAccessibilityDelegateCompat;

    move-result-object v7

    invoke-virtual {v7}, Landroidx/compose/ui/platform/AndroidComposeViewAccessibilityDelegateCompat;->getExtraDataTestTraversalBeforeVal$ui_release()Ljava/lang/String;

    move-result-object v7

    .line 1446
    invoke-static {v5, v1, v6, v7}, Landroidx/compose/ui/platform/AndroidComposeView;->access$addExtraDataToAccessibilityNodeInfoHelper(Landroidx/compose/ui/platform/AndroidComposeView;ILandroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)V

    .line 1454
    .end local v4    # "beforeView":Landroid/view/View;
    :cond_7
    iget-object v4, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->this$0:Landroidx/compose/ui/platform/AndroidComposeView;

    invoke-static {v4}, Landroidx/compose/ui/platform/AndroidComposeView;->access$getComposeAccessibilityDelegate$p(Landroidx/compose/ui/platform/AndroidComposeView;)Landroidx/compose/ui/platform/AndroidComposeViewAccessibilityDelegateCompat;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/compose/ui/platform/AndroidComposeViewAccessibilityDelegateCompat;->getIdToAfterMap$ui_release()Landroidx/collection/MutableIntIntMap;

    move-result-object v4

    invoke-virtual {v4, v1, v0}, Landroidx/collection/MutableIntIntMap;->getOrDefault(II)I

    move-result v4

    .line 1453
    nop

    .line 1455
    .local v4, "afterId":I
    if-eq v4, v0, :cond_9

    .line 1456
    iget-object v0, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->this$0:Landroidx/compose/ui/platform/AndroidComposeView;

    invoke-virtual {v0}, Landroidx/compose/ui/platform/AndroidComposeView;->getAndroidViewsHandler$ui_release()Landroidx/compose/ui/platform/AndroidViewsHandler;

    move-result-object v0

    invoke-static {v0, v4}, Landroidx/compose/ui/platform/SemanticsUtils_androidKt;->semanticsIdToView(Landroidx/compose/ui/platform/AndroidViewsHandler;I)Landroid/view/View;

    move-result-object v0

    .line 1457
    .local v0, "afterView":Landroid/view/View;
    if-eqz v0, :cond_8

    .line 1458
    invoke-virtual {p2, v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->setTraversalAfter(Landroid/view/View;)V

    goto :goto_3

    .line 1460
    :cond_8
    iget-object v5, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->$thisView:Landroidx/compose/ui/platform/AndroidComposeView;

    check-cast v5, Landroid/view/View;

    invoke-virtual {p2, v5, v4}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->setTraversalAfter(Landroid/view/View;I)V

    .line 1462
    :goto_3
    iget-object v5, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->this$0:Landroidx/compose/ui/platform/AndroidComposeView;

    .line 1463
    nop

    .line 1464
    invoke-virtual {p2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->unwrap()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v6

    .line 1465
    iget-object v7, p0, Landroidx/compose/ui/platform/AndroidComposeView$addAndroidView$1;->this$0:Landroidx/compose/ui/platform/AndroidComposeView;

    invoke-static {v7}, Landroidx/compose/ui/platform/AndroidComposeView;->access$getComposeAccessibilityDelegate$p(Landroidx/compose/ui/platform/AndroidComposeView;)Landroidx/compose/ui/platform/AndroidComposeViewAccessibilityDelegateCompat;

    move-result-object v7

    invoke-virtual {v7}, Landroidx/compose/ui/platform/AndroidComposeViewAccessibilityDelegateCompat;->getExtraDataTestTraversalAfterVal$ui_release()Ljava/lang/String;

    move-result-object v7

    .line 1462
    invoke-static {v5, v1, v6, v7}, Landroidx/compose/ui/platform/AndroidComposeView;->access$addExtraDataToAccessibilityNodeInfoHelper(Landroidx/compose/ui/platform/AndroidComposeView;ILandroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)V

    .line 1468
    .end local v0    # "afterView":Landroid/view/View;
    :cond_9
    return-void
.end method
