.class final Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode$dragAndDropNode$2;
.super Lkotlin/jvm/internal/Lambda;
.source "TextFieldDecoratorModifier.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode;-><init>(Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;Landroidx/compose/foundation/text/input/internal/TextLayoutState;Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState;Landroidx/compose/foundation/text/input/InputTransformation;ZZLandroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;ZLkotlinx/coroutines/flow/MutableSharedFlow;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Landroidx/compose/ui/platform/ClipEntry;",
        "Landroidx/compose/ui/platform/ClipMetadata;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTextFieldDecoratorModifier.kt\nKotlin\n*S Kotlin\n*F\n+ 1 TextFieldDecoratorModifier.kt\nandroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode$dragAndDropNode$2\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,809:1\n1#2:810\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\n\u00a2\u0006\u0004\u0008\u0006\u0010\u0007"
    }
    d2 = {
        "<anonymous>",
        "",
        "clipEntry",
        "Landroidx/compose/ui/platform/ClipEntry;",
        "clipMetadata",
        "Landroidx/compose/ui/platform/ClipMetadata;",
        "invoke",
        "(Landroidx/compose/ui/platform/ClipEntry;Landroidx/compose/ui/platform/ClipMetadata;)Ljava/lang/Boolean;"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode;


# direct methods
.method constructor <init>(Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode;)V
    .locals 1

    iput-object p1, p0, Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode$dragAndDropNode$2;->this$0:Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode;

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Landroidx/compose/ui/platform/ClipEntry;Landroidx/compose/ui/platform/ClipMetadata;)Ljava/lang/Boolean;
    .locals 12
    .param p1, "clipEntry"    # Landroidx/compose/ui/platform/ClipEntry;
    .param p2, "clipMetadata"    # Landroidx/compose/ui/platform/ClipMetadata;

    .line 288
    iget-object v0, p0, Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode$dragAndDropNode$2;->this$0:Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode;

    invoke-static {v0}, Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode;->access$emitDragExitEvent(Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode;)V

    .line 289
    iget-object v0, p0, Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode$dragAndDropNode$2;->this$0:Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode;

    invoke-virtual {v0}, Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode;->getTextFieldSelectionState()Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState;->clearHandleDragging()V

    .line 290
    invoke-static {p1}, Landroidx/compose/foundation/content/TransferableContent_androidKt;->readPlainText(Landroidx/compose/ui/platform/ClipEntry;)Ljava/lang/String;

    move-result-object v0

    .line 292
    .local v0, "plainText":Ljava/lang/String;
    iget-object v1, p0, Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode$dragAndDropNode$2;->this$0:Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode;

    check-cast v1, Landroidx/compose/ui/modifier/ModifierLocalModifierNode;

    invoke-static {v1}, Landroidx/compose/foundation/content/internal/ReceiveContentConfigurationKt;->getReceiveContentConfiguration(Landroidx/compose/ui/modifier/ModifierLocalModifierNode;)Landroidx/compose/foundation/content/internal/ReceiveContentConfiguration;

    move-result-object v1

    .line 295
    .local v1, "receiveContentConfiguration":Landroidx/compose/foundation/content/internal/ReceiveContentConfiguration;
    if-eqz v1, :cond_1

    .line 297
    new-instance v2, Landroidx/compose/foundation/content/TransferableContent;

    .line 298
    nop

    .line 299
    nop

    .line 300
    sget-object v3, Landroidx/compose/foundation/content/TransferableContent$Source;->Companion:Landroidx/compose/foundation/content/TransferableContent$Source$Companion;

    invoke-virtual {v3}, Landroidx/compose/foundation/content/TransferableContent$Source$Companion;->getDragAndDrop-kB6V9T0()I

    move-result v5

    .line 297
    const/16 v7, 0x8

    const/4 v8, 0x0

    const/4 v6, 0x0

    move-object v3, p1

    move-object v4, p2

    .end local p1    # "clipEntry":Landroidx/compose/ui/platform/ClipEntry;
    .end local p2    # "clipMetadata":Landroidx/compose/ui/platform/ClipMetadata;
    .local v3, "clipEntry":Landroidx/compose/ui/platform/ClipEntry;
    .local v4, "clipMetadata":Landroidx/compose/ui/platform/ClipMetadata;
    invoke-direct/range {v2 .. v8}, Landroidx/compose/foundation/content/TransferableContent;-><init>(Landroidx/compose/ui/platform/ClipEntry;Landroidx/compose/ui/platform/ClipMetadata;ILandroidx/compose/foundation/content/PlatformTransferableContent;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 296
    nop

    .line 304
    .local v2, "transferableContent":Landroidx/compose/foundation/content/TransferableContent;
    invoke-virtual {v1}, Landroidx/compose/foundation/content/internal/ReceiveContentConfiguration;->getReceiveContentListener()Landroidx/compose/foundation/content/ReceiveContentListener;

    move-result-object p1

    .line 305
    nop

    .line 304
    invoke-interface {p1, v2}, Landroidx/compose/foundation/content/ReceiveContentListener;->onReceive(Landroidx/compose/foundation/content/TransferableContent;)Landroidx/compose/foundation/content/TransferableContent;

    move-result-object p1

    .line 303
    nop

    .line 307
    .local p1, "remaining":Landroidx/compose/foundation/content/TransferableContent;
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroidx/compose/foundation/content/TransferableContent;->getClipEntry()Landroidx/compose/ui/platform/ClipEntry;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-static {p2}, Landroidx/compose/foundation/content/TransferableContent_androidKt;->readPlainText(Landroidx/compose/ui/platform/ClipEntry;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    move-object v0, p2

    goto :goto_1

    .line 295
    .end local v2    # "transferableContent":Landroidx/compose/foundation/content/TransferableContent;
    .end local v3    # "clipEntry":Landroidx/compose/ui/platform/ClipEntry;
    .end local v4    # "clipMetadata":Landroidx/compose/ui/platform/ClipMetadata;
    .local p1, "clipEntry":Landroidx/compose/ui/platform/ClipEntry;
    .restart local p2    # "clipMetadata":Landroidx/compose/ui/platform/ClipMetadata;
    :cond_1
    move-object v3, p1

    move-object v4, p2

    .line 309
    .end local p1    # "clipEntry":Landroidx/compose/ui/platform/ClipEntry;
    .end local p2    # "clipMetadata":Landroidx/compose/ui/platform/ClipMetadata;
    .restart local v3    # "clipEntry":Landroidx/compose/ui/platform/ClipEntry;
    .restart local v4    # "clipMetadata":Landroidx/compose/ui/platform/ClipMetadata;
    :goto_1
    if-eqz v0, :cond_2

    iget-object p1, p0, Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode$dragAndDropNode$2;->this$0:Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode;

    invoke-virtual {p1}, Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode;->getTextFieldState()Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;

    move-result-object v5

    move-object v6, v0

    check-cast v6, Ljava/lang/CharSequence;

    .line 810
    .local v6, "p0":Ljava/lang/CharSequence;
    const/4 p1, 0x0

    .line 309
    .local p1, "$i$a$-let-TextFieldDecoratorModifierNode$dragAndDropNode$2$1":I
    const/16 v10, 0xe

    const/4 v11, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v5 .. v11}, Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;->replaceSelectedText$default(Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;Ljava/lang/CharSequence;ZLandroidx/compose/foundation/text/input/internal/undo/TextFieldEditUndoBehavior;ZILjava/lang/Object;)V

    .line 310
    .end local v6    # "p0":Ljava/lang/CharSequence;
    .end local p1    # "$i$a$-let-TextFieldDecoratorModifierNode$dragAndDropNode$2$1":I
    :cond_2
    const/4 p1, 0x1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "p1"    # Ljava/lang/Object;
    .param p2, "p2"    # Ljava/lang/Object;

    .line 258
    move-object v0, p1

    check-cast v0, Landroidx/compose/ui/platform/ClipEntry;

    move-object v1, p2

    check-cast v1, Landroidx/compose/ui/platform/ClipMetadata;

    invoke-virtual {p0, v0, v1}, Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode$dragAndDropNode$2;->invoke(Landroidx/compose/ui/platform/ClipEntry;Landroidx/compose/ui/platform/ClipMetadata;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
