package androidx.compose.foundation.text.selection;

import androidx.compose.foundation.Magnifier_androidKt;
import androidx.compose.foundation.contextmenu.ContextMenuScope;
import androidx.compose.foundation.contextmenu.ContextMenuState;
import androidx.compose.foundation.contextmenu.ContextMenuState_androidKt;
import androidx.compose.foundation.text.ContextMenu_androidKt$TextItem$1;
import androidx.compose.foundation.text.MenuItemsAvailability;
import androidx.compose.foundation.text.TextContextMenuItems;
import androidx.compose.runtime.State;
import androidx.compose.ui.ComposedModifierKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.input.pointer.PointerEvent;
import androidx.compose.ui.text.TextRange;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
/* compiled from: TextFieldSelectionManager.android.kt */
@Metadata(d1 = {"\u0000@\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\u001a3\u0010\u0004\u001a\u0013\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00070\u0005¢\u0006\u0002\b\b*\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\rH\u0000\u001a\u0014\u0010\u000f\u001a\u00020\u0010*\u00020\u00102\u0006\u0010\u0011\u001a\u00020\tH\u0000\"\u0018\u0010\u0000\u001a\u00020\u0001*\u00020\u00028@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0000\u0010\u0003¨\u0006\u0012²\u0006\n\u0010\u0013\u001a\u00020\u0014X\u008a\u008e\u0002"}, d2 = {"isShiftPressed", "", "Landroidx/compose/ui/input/pointer/PointerEvent;", "(Landroidx/compose/ui/input/pointer/PointerEvent;)Z", "contextMenuBuilder", "Lkotlin/Function1;", "Landroidx/compose/foundation/contextmenu/ContextMenuScope;", "", "Lkotlin/ExtensionFunctionType;", "Landroidx/compose/foundation/text/selection/TextFieldSelectionManager;", "contextMenuState", "Landroidx/compose/foundation/contextmenu/ContextMenuState;", "itemsAvailability", "Landroidx/compose/runtime/State;", "Landroidx/compose/foundation/text/MenuItemsAvailability;", "textFieldMagnifier", "Landroidx/compose/ui/Modifier;", "manager", "foundation_release", "magnifierSize", "Landroidx/compose/ui/unit/IntSize;"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextFieldSelectionManager_androidKt {
    public static final boolean isShiftPressed(PointerEvent $this$isShiftPressed) {
        return false;
    }

    public static final Modifier textFieldMagnifier(Modifier $this$textFieldMagnifier, TextFieldSelectionManager manager) {
        if (!Magnifier_androidKt.isPlatformMagnifierSupported$default(0, 1, null)) {
            return $this$textFieldMagnifier;
        }
        return ComposedModifierKt.composed$default($this$textFieldMagnifier, null, new TextFieldSelectionManager_androidKt$textFieldMagnifier$1(manager), 1, null);
    }

    public static final Function1<ContextMenuScope, Unit> contextMenuBuilder(final TextFieldSelectionManager $this$contextMenuBuilder, final ContextMenuState contextMenuState, final State<MenuItemsAvailability> state) {
        return new Function1<ContextMenuScope, Unit>() { // from class: androidx.compose.foundation.text.selection.TextFieldSelectionManager_androidKt$contextMenuBuilder$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(ContextMenuScope contextMenuScope) {
                invoke2(contextMenuScope);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(ContextMenuScope $this$null) {
                int availability = state.getValue().m1387unboximpl();
                final ContextMenuState state$iv = contextMenuState;
                TextContextMenuItems label$iv = TextContextMenuItems.Cut;
                boolean enabled$iv = MenuItemsAvailability.m1382getCanCutimpl(availability);
                final TextFieldSelectionManager textFieldSelectionManager = $this$contextMenuBuilder;
                if (enabled$iv) {
                    $this$null.item(new ContextMenu_androidKt$TextItem$1(label$iv), (r12 & 2) != 0 ? Modifier.Companion : null, (r12 & 4) != 0, (r12 & 8) != 0 ? null : null, new Function0<Unit>() { // from class: androidx.compose.foundation.text.selection.TextFieldSelectionManager_androidKt$contextMenuBuilder$1$invoke$$inlined$TextItem$1
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        {
                            super(0);
                        }

                        @Override // kotlin.jvm.functions.Function0
                        public /* bridge */ /* synthetic */ Unit invoke() {
                            invoke2();
                            return Unit.INSTANCE;
                        }

                        /* renamed from: invoke  reason: avoid collision after fix types in other method */
                        public final void invoke2() {
                            textFieldSelectionManager.cut$foundation_release();
                            ContextMenuState_androidKt.close(ContextMenuState.this);
                        }
                    });
                }
                final ContextMenuState state$iv2 = contextMenuState;
                TextContextMenuItems label$iv2 = TextContextMenuItems.Copy;
                boolean enabled$iv2 = MenuItemsAvailability.m1381getCanCopyimpl(availability);
                final TextFieldSelectionManager textFieldSelectionManager2 = $this$contextMenuBuilder;
                if (enabled$iv2) {
                    $this$null.item(new ContextMenu_androidKt$TextItem$1(label$iv2), (r12 & 2) != 0 ? Modifier.Companion : null, (r12 & 4) != 0, (r12 & 8) != 0 ? null : null, new Function0<Unit>() { // from class: androidx.compose.foundation.text.selection.TextFieldSelectionManager_androidKt$contextMenuBuilder$1$invoke$$inlined$TextItem$2
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        {
                            super(0);
                        }

                        @Override // kotlin.jvm.functions.Function0
                        public /* bridge */ /* synthetic */ Unit invoke() {
                            invoke2();
                            return Unit.INSTANCE;
                        }

                        /* renamed from: invoke  reason: avoid collision after fix types in other method */
                        public final void invoke2() {
                            textFieldSelectionManager2.copy$foundation_release(false);
                            ContextMenuState_androidKt.close(ContextMenuState.this);
                        }
                    });
                }
                final ContextMenuState state$iv3 = contextMenuState;
                TextContextMenuItems label$iv3 = TextContextMenuItems.Paste;
                boolean enabled$iv3 = MenuItemsAvailability.m1383getCanPasteimpl(availability);
                final TextFieldSelectionManager textFieldSelectionManager3 = $this$contextMenuBuilder;
                if (enabled$iv3) {
                    $this$null.item(new ContextMenu_androidKt$TextItem$1(label$iv3), (r12 & 2) != 0 ? Modifier.Companion : null, (r12 & 4) != 0, (r12 & 8) != 0 ? null : null, new Function0<Unit>() { // from class: androidx.compose.foundation.text.selection.TextFieldSelectionManager_androidKt$contextMenuBuilder$1$invoke$$inlined$TextItem$3
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        {
                            super(0);
                        }

                        @Override // kotlin.jvm.functions.Function0
                        public /* bridge */ /* synthetic */ Unit invoke() {
                            invoke2();
                            return Unit.INSTANCE;
                        }

                        /* renamed from: invoke  reason: avoid collision after fix types in other method */
                        public final void invoke2() {
                            textFieldSelectionManager3.paste$foundation_release();
                            ContextMenuState_androidKt.close(ContextMenuState.this);
                        }
                    });
                }
                final ContextMenuState state$iv4 = contextMenuState;
                TextContextMenuItems label$iv4 = TextContextMenuItems.SelectAll;
                boolean enabled$iv4 = MenuItemsAvailability.m1384getCanSelectAllimpl(availability);
                final TextFieldSelectionManager textFieldSelectionManager4 = $this$contextMenuBuilder;
                if (enabled$iv4) {
                    $this$null.item(new ContextMenu_androidKt$TextItem$1(label$iv4), (r12 & 2) != 0 ? Modifier.Companion : null, (r12 & 4) != 0, (r12 & 8) != 0 ? null : null, new Function0<Unit>() { // from class: androidx.compose.foundation.text.selection.TextFieldSelectionManager_androidKt$contextMenuBuilder$1$invoke$$inlined$TextItem$4
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        {
                            super(0);
                        }

                        @Override // kotlin.jvm.functions.Function0
                        public /* bridge */ /* synthetic */ Unit invoke() {
                            invoke2();
                            return Unit.INSTANCE;
                        }

                        /* renamed from: invoke  reason: avoid collision after fix types in other method */
                        public final void invoke2() {
                            textFieldSelectionManager4.selectAll$foundation_release();
                            ContextMenuState_androidKt.close(ContextMenuState.this);
                        }
                    });
                }
                final ContextMenuState state$iv5 = contextMenuState;
                TextContextMenuItems label$iv5 = TextContextMenuItems.Autofill;
                boolean enabled$iv5 = $this$contextMenuBuilder.getEditable() && TextRange.m6333getCollapsedimpl($this$contextMenuBuilder.getValue$foundation_release().m6587getSelectiond9O1mEE());
                final TextFieldSelectionManager textFieldSelectionManager5 = $this$contextMenuBuilder;
                if (!enabled$iv5) {
                    return;
                }
                $this$null.item(new ContextMenu_androidKt$TextItem$1(label$iv5), (r12 & 2) != 0 ? Modifier.Companion : null, (r12 & 4) != 0, (r12 & 8) != 0 ? null : null, new Function0<Unit>() { // from class: androidx.compose.foundation.text.selection.TextFieldSelectionManager_androidKt$contextMenuBuilder$1$invoke$$inlined$TextItem$5
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Unit invoke() {
                        invoke2();
                        return Unit.INSTANCE;
                    }

                    /* renamed from: invoke  reason: avoid collision after fix types in other method */
                    public final void invoke2() {
                        textFieldSelectionManager5.autofill$foundation_release();
                        ContextMenuState_androidKt.close(ContextMenuState.this);
                    }
                });
            }
        };
    }
}
